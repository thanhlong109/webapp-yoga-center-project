/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.repository.MembershipRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DungVNT
 */
public class UpdateMembershipController extends HttpServlet {

    private final String EDIT_PAGE = "../Admin/EditMembership.jsp";
    private final String VIEW_MEMBERSHIP_LIST_CONTROLLER = "viewMembershipListController";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MembershipRepository _membershipRepository = new MembershipRepository();
        Membership m = _membershipRepository.detail(id);
        
        request.setAttribute("MEMBERSHIP", m);
        request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MembershipRepository _membershipRepository = new MembershipRepository();
        Membership m = new Membership();
        int id = Integer.parseInt(request.getParameter("txtId"));
        m.setId(id);
        m.setName(request.getParameter("txtName"));
        m.setDuration(Integer.parseInt(request.getParameter("txtDuration")));
        m.setPrice(Float.parseFloat(request.getParameter("txtPrice")));
        m.setDescription(request.getParameter("txtDescription"));
        m.setDiscount(Integer.parseInt(request.getParameter("txtDiscount")));
        m.setIsActive(true);
        
        boolean update = _membershipRepository.update(m);
        if (update) {
            response.sendRedirect(VIEW_MEMBERSHIP_LIST_CONTROLLER);
        } else {
            m = _membershipRepository.detail(id);
            request.setAttribute("MEMBERSHIP", m);
            request.setAttribute("UPDATE_STATUS", "Update Fail !!!!");
            request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
        }
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
