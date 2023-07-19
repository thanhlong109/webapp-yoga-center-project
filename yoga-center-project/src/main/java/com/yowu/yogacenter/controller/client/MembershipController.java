/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.MembershipRepository;
import com.yowu.yogacenter.repository.RegistrationMembershipRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        RegistrationMembershipRepository regisMemRepo = new RegistrationMembershipRepository();
        MembershipRepository memRepo = new MembershipRepository();
        if (account != null) {
            RegistrationMembership regisMem = regisMemRepo.detail(account.getId());
            if (regisMem != null) {
                if (regisMem.getRegistrationtatus()) {
                    request.setAttribute("ExistMem", regisMem);
                }
            }
            System.out.println(regisMem);
        }
        
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
