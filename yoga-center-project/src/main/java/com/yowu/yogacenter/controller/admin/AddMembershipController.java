/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

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
 * @author DungVNT
 */
public class AddMembershipController extends HttpServlet {

    private final String VIEW_MEMBERSHIP_LIST_CONTROLLER = "viewMembershipListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MembershipRepository _MembershipRepository = new MembershipRepository();
        Membership m = new Membership();
        m.setName(request.getParameter("txtName"));
        m.setDuration(Integer.parseInt(request.getParameter("txtDuration")));
        m.setPrice(Float.parseFloat(request.getParameter("txtPrice")));
        m.setDescription(request.getParameter("txtDescription"));
        m.setDiscount(Integer.parseInt(request.getParameter("txtDiscount")));
        m.setIsActive(true);
        _MembershipRepository.add(m);
        response.sendRedirect(VIEW_MEMBERSHIP_LIST_CONTROLLER);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
