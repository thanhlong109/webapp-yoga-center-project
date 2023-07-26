/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.cashier;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.SearchError;
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
     private final String VIEW_BILL_CONTROLLER = "viewBillCashierController";

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String search = request.getParameter("txtSearch");
       SearchError searchError = new SearchError();
        BillRepository _billRepo = new BillRepository();
        List<Bill> billList = _billRepo.searchCode(search);
        if(billList.isEmpty()){
            searchError.setSearchError("Search value doesn't exist");
            request.setAttribute("SEARCH_ERROR", searchError);
            request.getRequestDispatcher(VIEW_BILL_CONTROLLER).forward(request, response);
        }else{
            request.setAttribute("BILL_LIST", billList);
         request.getRequestDispatcher(BILL_PAGE).forward(request, response);
        }
        
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
