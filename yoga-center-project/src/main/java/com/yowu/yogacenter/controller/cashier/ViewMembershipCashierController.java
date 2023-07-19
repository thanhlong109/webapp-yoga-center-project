/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.cashier;

import com.yowu.yogacenter.model.BillMembership;
import com.yowu.yogacenter.repository.BillMembershipRepository;
import com.yowu.yogacenter.repository.MembershipRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author localboss
 */
public class ViewMembershipCashierController extends HttpServlet {

     private final String MEMBERSHIP_PAGE = "../Cashier/ViewMembership.jsp";

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillMembershipRepository _billMembershipRepository = new BillMembershipRepository();
        request.setAttribute("MEMBERSHIP_LIST", _billMembershipRepository.getAll());
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
