/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.paypal.base.rest.PayPalRESTException;
import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import com.yowu.yogacenter.repository.MembershipRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import com.yowu.yogacenter.repository.RegistrationMembershipRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Time;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

/**
 *
 * @author Chien Thang
 */
public class CheckoutController extends HttpServlet {

    private final String CHECKOUT_PAGE = "Client/checkout.jsp";
    private static final long serialVersionUID = 1L;
    private final String COURSE_DETAIL = "course-detail?id=";
    private final String MEMBERSHIP = "Membership";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        CourseRepository cr = new CourseRepository();
        HttpSession session = request.getSession();
        Account acc = (Account) request.getSession().getAttribute("account");
        CourseScheduleRepository csr = new CourseScheduleRepository();

        if (action.equals("course")) {
            String coursePrice = request.getParameter("coursePrice");
            int courseScheduleID = Integer.parseInt(request.getParameter("course_scheduleId"));
            if (!csr.isSameSchedule(courseScheduleID, acc.getId())) {

                int id = Integer.parseInt(request.getParameter("id"));
                Course cs = cr.detail(id);
                RegistrationCourseRepository regis = new RegistrationCourseRepository();
                RegistrationCourse rc = regis.getRegisByCourseIdAndAccountID(acc.getId(), id);
                System.out.println(acc.getId() + "," + id);
                if (rc != null && rc.getCourseStatus() == RegistrationCourse.CourseStatus.INPROGRESS.ordinal()) {
                    response.sendRedirect(COURSE_DETAIL + id);
                } else {
                    String startdate = request.getParameter("start_time");
                    String duration = request.getParameter("duration");

                    CourseSchedule csa = csr.detailByScheduleID(courseScheduleID);
                    String schedule = csa.getDateOfWeek();
                    String inputDayOfWeek = schedule; // Lấy từ FE hoặc DB => Day of week

                    String inputDateTime = startdate + " 00:00:00"; // Lấy từ FE hoặc DB => start date

                    int inputDuration = Integer.parseInt(duration); // Lấy từ FE hoặc DB => duration

                    DayOfWeek[] allDateOfWeek = DayOfWeek.values();
                    System.out.println("range day" + Arrays.toString(allDateOfWeek));

                    String[] parts = inputDayOfWeek.split(",");

                    int[] numbers = new int[parts.length];

                    for (int i = 0; i < parts.length; i++) {
                        numbers[i] = Integer.parseInt(parts[i]);
                    }
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd' 'HH:mm:ss");

                    LocalDateTime dateTime = LocalDateTime.parse(inputDateTime, formatter);

                    LocalDate startDate = dateTime.toLocalDate();

                    int temp = 1;
                    LocalDate firstDate = null;
                    LocalDate lastDate = startDate;
                    boolean firstDateFound = false;
                    while (temp <= inputDuration) {
                        DayOfWeek dayOfWeek = startDate.getDayOfWeek();
                        for (int number : numbers) {
                            if (allDateOfWeek[number] == dayOfWeek) {//fix
                                System.out.println("Day: " + startDate);
                                temp++;
                                if (!firstDateFound) {
                                    firstDate = startDate;
                                    firstDateFound = true;
                                }
                            }
                        }
                        //                startDate = startDate.plusDays(1);
                        //                lastDate = startDate; // Cập nhật ngày cuối cùng trong vòng lặp
                        //                startDate = startDate.plusDays(1);
                        lastDate = startDate; // Cập nhật ngày cuối cùng trong vòng lặp
                        startDate = startDate.plusDays(1);
                    }
                    Date firstDateSql = Date.valueOf(firstDate);
                    Date lastDateSql = Date.valueOf(lastDate);

                    System.out.println("date checkout " + lastDateSql);
                    request.setAttribute("dateEnd", lastDateSql);
                    AccountRepository ar = new AccountRepository();
                    MembershipRepository msr = new MembershipRepository();
                    Course c = cr.detail(id);

                    request.setAttribute("startDate", startdate);
                    request.setAttribute("account", ar.detail(acc.getId()));
                    request.setAttribute("course", c);
                    request.setAttribute("discount", msr.discountByAccountID(acc.getId()));
                    request.getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Course cs = cr.detail(id);
                request.setAttribute("checkDup", "Sorry, But there seems to be a scheduling overlap with the " + cs.getTitle() + " course!");
                request.getRequestDispatcher(COURSE_DETAIL + id).forward(request, response);
            }
        }
        if (action.equals("membership")) {
            int memberId = Integer.parseInt(request.getParameter("memId"));
//            RegistrationMembershipRepository rmsr = new RegistrationMembershipRepository();
            MembershipRepository mbr = new MembershipRepository();
            Account account = (Account) session.getAttribute("account");
//            if (rmsr.detail(account.getId()) != null) {
                Membership mb = mbr.detail(memberId);
                request.setAttribute("member", mb);
                LocalDate current = LocalDate.now();
                LocalDate enddate = current.plusDays(mb.getDuration());
                request.setAttribute("startdate", current);
                request.setAttribute("enddate", enddate);
                session.setAttribute("RegistrationMembership", new RegistrationMembership(mb, account, Date.valueOf(current), Date.valueOf(enddate)));
                request.getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);
            //}

        }

        //request.getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
