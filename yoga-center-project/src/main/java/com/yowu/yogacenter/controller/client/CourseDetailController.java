/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.model.RatingCourse;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import com.yowu.yogacenter.repository.CourseWishlistRepository;
import com.yowu.yogacenter.repository.RatingCourseRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import jakarta.mail.Session;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author ACER
 */
public class CourseDetailController extends HttpServlet {

    private final String COURSE_DETAIL_PAGE = "Client/courseDetail.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CourseRepository cr = new CourseRepository();
            CourseScheduleRepository sc = new CourseScheduleRepository();

            RatingCourseRepository ratec = new RatingCourseRepository();
            CourseWishlistRepository cwr = new CourseWishlistRepository();
            Course c = cr.detail(id);

            Account account = (Account) request.getSession().getAttribute("account");
            RegistrationCourseRepository rcr = new RegistrationCourseRepository();
            RegistrationCourse rc2 = null;
            List<CourseSchedule> list_dow = sc.getScheduleByCourse(c.getId());

            boolean isInWishList = false;

            Bill billStatus = null;
            BillRepository billRepo = new BillRepository();
            boolean allowBook = true;
            RegistrationCourse regisStatus = null;
            if (account != null) {
                request.getParameter("");
                
                isInWishList = cwr.isExist(id, account.getId());
                billStatus = billRepo.getBillRecentByAccountIdAndCourseID(account.getId(), id);
                if (billStatus != null) {
                    regisStatus = rcr.getRecentRegisByCourseIdAndAccountID(account.getId(), id);
                    if (regisStatus != null) {
                        if (regisStatus.getCourseStatus() != RegistrationCourse.CourseStatus.FINISH.ordinal()) {
                            Date dateNow = new Date();

                            Date dateEnd = regisStatus.getEndDate();
                            if (!dateNow.before(dateEnd)) {
                                regisStatus.setCourseStatus(RegistrationCourse.CourseStatus.FINISH.ordinal());
                                rcr.update(regisStatus);
                            }
                        }
                        allowBook = regisStatus.getCourseStatus() == RegistrationCourse.CourseStatus.FINISH.ordinal();
                    }
                }
            }
            if (billStatus != null) {
                int status = billStatus.getStatus();
                request.setAttribute("billStatus", status);
            }

            /*check rating able*/
            boolean allowRating = false;
            if (account != null && regisStatus != null && regisStatus.getRegistrationtatus()) {
                if (ratec.detail(regisStatus.getId()) == null) {
                    System.out.println("reid:" + regisStatus.getId());
                    allowRating = true;
                }
            }
            request.setAttribute("allowRating", allowRating);
            request.setAttribute("allowBook", allowBook);
            System.out.println(request.getContextPath() + "/course-detail?id=" + id);
            request.setAttribute("regisID", rc2);
            request.setAttribute("agvRating", ratec.getAvgCourseRating(c.getId()));
            request.setAttribute("course", c);
//            if (!list_dow.isEmpty()) {
//                request.setAttribute("courseScheduleList", list_dow);
//                System.out.println(list_dow);
            //} else {
                request.setAttribute("courseScheduleList", sc.getScheduleByCourse(c.getId()));
                System.out.println("abs ");
            //}
//            request.setAttribute("courseScheduleList", sc.getScheduleByCourse(c.getId()));

            request.setAttribute("surgestCourseList", cr.getRandomNCourses(4));
            request.setAttribute("isInWishList", isInWishList);
            request.setAttribute("feedbackList", ratec.getByCourseID(id));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher(COURSE_DETAIL_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int courseId = Integer.parseInt(request.getParameter("courseid"));
            Account account = (Account) request.getSession().getAttribute("account");
            if (account == null) {
                out.print("account-failed");
            } else {
                CourseWishlistRepository cwr = new CourseWishlistRepository();
                switch (action) {
                    case "remove": {
                        cwr.detele(courseId, account.getId());
                        break;
                    }
                    case "add": {

                        cwr.add(courseId, account.getId());
                        break;
                    }
                    case "rating": {
                        int starPoint = Integer.parseInt(request.getParameter("star"));
                        String feedback = request.getParameter("feedback");
                        RatingCourseRepository rateRepo = new RatingCourseRepository();
                        Course c = new Course();
                        c.setId(courseId);
                        RatingCourse ratingCourse = new RatingCourse();
                        RegistrationCourseRepository rcr = new RegistrationCourseRepository();
                        RegistrationCourse regisCourse = rcr.getRecentRegisByCourseIdAndAccountID(account.getId(), courseId);
                        ratingCourse.setFeedback(feedback);
                        ratingCourse.setCourse(c);
                        ratingCourse.setRatingStar(starPoint);
                        ratingCourse.setRegistrationCourse(regisCourse);
                        rateRepo.add(ratingCourse);
                    }
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
