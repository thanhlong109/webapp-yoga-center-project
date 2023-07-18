/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.cashier;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.repository.BillRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author localboss
 */
public class SearchBillCashierController extends HttpServlet {
    private final String BILL_PAGE = "../Cashier/ViewBill.jsp";
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search-text");
        BillRepository _billRepository = new BillRepository();
        List<Bill> result = _billRepository.searchOrderCode(search);
        request.setAttribute("BILL_LIST", result);
        request.getRequestDispatcher(BILL_PAGE).forward(request, response);
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
