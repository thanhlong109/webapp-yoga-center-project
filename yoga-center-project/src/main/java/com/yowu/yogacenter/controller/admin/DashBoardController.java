/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.CategoryRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class DashBoardController extends HttpServlet {
     private String DASH_BOARD_PAGE = "../Admin/DashBoard.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillRepository br = new BillRepository();
        CategoryRepository cr = new CategoryRepository();
        request.setAttribute("billData", br.getBillData());
        request.setAttribute("categoryData", cr.getCategoryData());
        request.getRequestDispatcher(DASH_BOARD_PAGE).forward(request, response);
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
