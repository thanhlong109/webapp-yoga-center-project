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
import java.util.List;

/**
 *
 * @author DungVNT
 */
public class ViewMembershipListController extends HttpServlet {

       private final String MEMBERSHIP_LIST_PAGE = "../Admin/ViewMembership.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MembershipRepository _membershipRepository = new MembershipRepository();

        //Phan trang
        String xpage = request.getParameter("page");
        int itemPerPage = 6; // number item each page
        int size = _membershipRepository.count();
        int numPage = (int) Math.ceil(size / (double) itemPerPage);// this will print how many page number
        int page = 1;
        if (xpage != null) {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * itemPerPage;
        List<Membership> list = _membershipRepository.getAllFollowPagination(start, itemPerPage);
        request.setAttribute("MEMBERSHIP_LIST", list);
        request.setAttribute("PAGE", page);
        request.setAttribute("NUMPAGE", numPage);
        //end phan trang
        request.getRequestDispatcher(MEMBERSHIP_LIST_PAGE).forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
