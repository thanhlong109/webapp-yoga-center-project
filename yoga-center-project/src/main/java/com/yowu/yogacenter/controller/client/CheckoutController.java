/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.paypal.base.rest.PayPalRESTException;
import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.CourseRepository;
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
import java.time.LocalDate;

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
        if (action.equals("course")) {
            CourseRepository cr = new CourseRepository();
            int id = Integer.parseInt(request.getParameter("id"));
            Course cs = cr.detail(id);
            HttpSession session = request.getSession();
             Account acc = (Account) request.getSession().getAttribute("account");
            RegistrationCourseRepository regis = new RegistrationCourseRepository();
            RegistrationCourse rc = regis.getRegisByCourseIdAndAccountID(acc.getId(), id);
            System.out.println(acc.getId() + "," + id);
            if (rc!= null && rc.getCourseStatus()==RegistrationCourse.CourseStatus.INPROGRESS.ordinal()) {
                response.sendRedirect(COURSE_DETAIL + id);
            } else {
                String startdate = request.getParameter("start_time");
                System.out.println("date checkout " + startdate);
               
                AccountRepository ar = new AccountRepository();
                MembershipRepository msr = new MembershipRepository();
                Course c = cr.detail(id);

                request.setAttribute("startDate", startdate);
                request.setAttribute("account", ar.detail(acc.getId()));
                request.setAttribute("course", c);
                request.setAttribute("discount", msr.discountByAccountID(acc.getId()));
                request.getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);
            }

        }
        if (action.equals("membership")) {
            int memberId = Integer.parseInt(request.getParameter("memId"));
            RegistrationMembershipRepository rmsr = new RegistrationMembershipRepository();
            MembershipRepository mbr = new MembershipRepository();
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (rmsr.detail(account.getId()) != null) {
                response.sendRedirect(MEMBERSHIP);
            } else {
                Membership mb = mbr.detail(memberId);
                request.setAttribute("member", mb);
                LocalDate current = LocalDate.now();
                LocalDate enddate = current.plusDays(mb.getDuration());
                request.setAttribute("startdate", current);
                request.setAttribute("enddate", enddate);
                session.setAttribute("RegistrationMembership", new RegistrationMembership(mb, account, Date.valueOf(current), Date.valueOf(enddate)));
                request.getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);
            }
            
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
