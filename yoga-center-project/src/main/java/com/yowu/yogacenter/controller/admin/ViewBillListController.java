/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.repository.BillRepository;
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
public class ViewBillListController extends HttpServlet {

    private final String BILL_LIST_PAGE = "../Admin/ViewBill.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BillRepository _billRepository = new BillRepository();
        request.setAttribute("BILL_LIST", _billRepository.getAll());
        request.getRequestDispatcher(BILL_LIST_PAGE).forward(request, response);
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
