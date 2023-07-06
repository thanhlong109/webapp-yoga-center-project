/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.yowu.yogacenter.controller.client;

import com.paypal.base.rest.PayPalRESTException;
import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.MembershipRepository;
import com.yowu.yogacenter.repository.RegistrationMembershipRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Chien Thang
 */
public class CheckoutController extends HttpServlet {
   
    private final String CHECKOUT_PAGE = "Client/checkout.jsp";
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CourseRepository cr = new CourseRepository();
        int id = Integer.parseInt(request.getParameter("id"));
        String startdate = request.getParameter("start_time");
        System.out.println("date checkout "+startdate);
        Account acc = (Account)request.getSession().getAttribute("account");
        AccountRepository ar = new AccountRepository();
        MembershipRepository msr = new MembershipRepository();
        RegistrationMembershipRepository rm = new RegistrationMembershipRepository();
        Course c = cr.detail(id);
        request.setAttribute("startDate", startdate);
        request.setAttribute("account", ar.detail(acc.getId()));
        request.setAttribute("course", c);
        request.setAttribute("discount", msr.discountByAccountID(acc.getId()));
        request.getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);
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
