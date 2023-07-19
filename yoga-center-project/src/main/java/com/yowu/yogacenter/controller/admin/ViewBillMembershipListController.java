/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.BillMembership;
import com.yowu.yogacenter.repository.BillMembershipRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author DungVNT
 */
public class ViewBillMembershipListController extends HttpServlet {

    private final String BILL_MEMBERSHIP_LIST_PAGE = "../Admin/ViewBillMembership.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillMembershipRepository _BillMembershipRepository = new BillMembershipRepository();
        
        //Phan trang
        String xpage = request.getParameter("page");
        int itemPerPage = 6; // number item each page
        int size = _BillMembershipRepository.count();
        int numPage = (int) Math.ceil(size / (double) itemPerPage);// this will print how many page number
        int page = 1;
        if (xpage != null) {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * itemPerPage;
        List<BillMembership> list = _BillMembershipRepository.getAllFollowPagination(start, itemPerPage);
        request.setAttribute("BILL_MEMBERSHIP_LIST", list);
        request.setAttribute("PAGE", page);
        request.setAttribute("NUMPAGE", numPage);
        request.getRequestDispatcher(BILL_MEMBERSHIP_LIST_PAGE).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
