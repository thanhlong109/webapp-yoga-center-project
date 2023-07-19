/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.RegistrationMembershipRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 *
 * @author ACER
 */
public class UserProfileMebership extends HttpServlet {
    
    private final String USER_MEMBERSHIP = "../Client/userProfileMembership.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account acc = (Account)request.getSession().getAttribute("account");
        RegistrationMembershipRepository rm = new RegistrationMembershipRepository();
        RegistrationMembership rmembership = rm.detail(acc.getId());
        if(rmembership!=null){
            request.setAttribute("rmembership", rmembership);
            
            long daysLeft = ChronoUnit.DAYS.between(rmembership.getExpirationDate().toLocalDate(),LocalDate.now());
            request.setAttribute("daysleft",daysLeft );
        }
        request.getRequestDispatcher(USER_MEMBERSHIP).forward(request, response);
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
