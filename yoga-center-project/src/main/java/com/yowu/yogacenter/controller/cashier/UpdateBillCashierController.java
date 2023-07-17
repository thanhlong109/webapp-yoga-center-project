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
import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author localboss
 */
public class UpdateBillCashierController extends HttpServlet {
    private final String EDIT_BILL_PAGE = "../Cashier/UpdateBill.jsp";
    private final String VIEW_BILL_CONTROLLER = "viewBillController";
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String orderCode = request.getParameter("txtOrderCode");
        BillRepository _billRepository = new BillRepository();
        Bill billCashier = _billRepository.getCourseIdByOrdercode(orderCode);
        
        request.setAttribute("BILL", billCashier);
        request.getRequestDispatcher(EDIT_BILL_PAGE).forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillRepository _billRepository = new BillRepository();
        Bill bill = new Bill();
        String orderCode = request.getParameter("txtOrderCode");
        int status = Integer.parseInt(request.getParameter("txtStatus"));
        String paymentDate = request.getParameter("txtPaymentDate");
        LocalDateTime paymentDateBill = LocalDateTime.parse(paymentDate);
        bill.setStatus(status);
//        bill.setPaymentDate(paymentDateBill);
//       
//        boolean update = _billRepository.updateStatus( orderCode, paymentDate, status);
       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
