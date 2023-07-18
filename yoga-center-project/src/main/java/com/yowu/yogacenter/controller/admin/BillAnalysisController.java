/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.repository.BillMembershipRepository;
import com.yowu.yogacenter.repository.BillRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author DungVNT
 */
public class BillAnalysisController extends HttpServlet {

    private final String BILL_ANALYSIS_PAGE = "../Admin/BillAnalysis.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillRepository _BillRepository = new BillRepository();
        BillMembershipRepository _BillMembershipRepository = new BillMembershipRepository();
        LocalDate current = LocalDate.now();
        LocalDate pre30 = current.minusDays(30);
        Date pre30d = Date.valueOf(pre30); 
        
        //Total Bill Course
        request.setAttribute("TOTAL_PAID_BILL", _BillRepository.getTotalPaidBill());
        request.setAttribute("TOTAL_PAID_BILL_PRE_MONTH", _BillRepository.getTotalPaidBill(pre30d));
        
        request.getRequestDispatcher(BILL_ANALYSIS_PAGE).forward(request, response);
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
