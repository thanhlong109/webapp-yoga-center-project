/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.repository.BillRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ACER
 */
public class UserProfileBooking extends HttpServlet {
    private final String USER_PROFILE_BOOKING_PAGE = "../Client/userProfileBooking.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int accountID = 2;
        try{
            BillRepository bRepo = new BillRepository();
            List<Bill> list = bRepo.getByAccountID(accountID);
            request.setAttribute("billList", list);
        }catch(Exception e){
            System.out.println(e);
        }
       request.getRequestDispatcher(USER_PROFILE_BOOKING_PAGE).forward(request, response);
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
