/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.repository.MembershipRepository;
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
public class MembershipController extends HttpServlet {
   private final String MEMBERSHIP_PAGE = "Client/membership.jsp";
    
    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        Membership member = new  Membership();
        MembershipRepository memRepo = new MembershipRepository();
        request.setAttribute("membershipList", memRepo.getAllMembershipIsActive());
        request.getRequestDispatcher(MEMBERSHIP_PAGE).forward(request, response);
        
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
