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
public class ViewBillCashierController extends HttpServlet {
     private final String BILL_PAGE = "../Cashier/ViewBill.jsp";
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         BillRepository _billRepository = new BillRepository();
         String npage = request.getParameter("page");
         int itemPerPage = 4;
         int size = _billRepository.count();
         int numPage = (int) Math.ceil(size/ itemPerPage);
         int page = 1;
         if(npage != null){
             page = Integer.parseInt(npage);
         }
         int start = (page - 1) * itemPerPage;
         List<Bill> list = _billRepository.getAllFollowPagination(start, itemPerPage);
         request.setAttribute("BILL_LIST", list);
         request.setAttribute("PAGE", page);
         request.setAttribute("NUMPAGE", numPage);
//        request.setAttribute("BILL_LIST", _billRepository.getAll());
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
