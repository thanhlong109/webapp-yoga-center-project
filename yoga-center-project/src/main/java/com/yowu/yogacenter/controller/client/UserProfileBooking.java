/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.repository.AccountRepository;
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
        AccountRepository ar = new AccountRepository();
        request.setAttribute("account", ar.detail(accountID));
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
        
        try(PrintWriter out = response.getWriter()){
            String action = request.getParameter("action");
            BillRepository br = new BillRepository();
            int accountID = 2;
            int billID = Integer.parseInt(request.getParameter("billid"));
            Bill b = br.detail(billID);
            switch(action){
                case "view":{
                    out.print(getHtmlViewBill(b));
                    break;
                }
                case "cancel":{
                    b.setStatus(Bill.BillStatus.CANCELLED.ordinal());
                    br.update(b);
                    break;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    private String getHtmlViewBill(Bill b){
        String data="<h3>Order detail</h3>\n" +
"                                <div>\n" +
"                                    <label>Bill ID:</label><span>"+b.getId()
                + "</span>\n" +
"                                </div> <div>\n" +
"                                    <label>Bill Status:</label><span>"+Bill.getEnumIndex(b.getStatus()).name().toLowerCase()
                + "</span>\n" +
"                                </div>\n" +
"                                <div>\n" +
"                                    <label>Course:</label><span>"+b.getCourse().getTitle()
                + "</span>\n" +
"                                </div>\n" +
"                                <div>\n" +
"                                    <label>Total Price:</label><span> $"+b.getValue()
                + "</span>\n" +
"                                </div>\n" +"<div>\n" +
"                                    <label>Discount:</label><span>$"+b.getDiscount()
                + "</span>\n" +
"                                </div>"+
"                                <div>\n" +
"                                    <label>Date:</label><span>"+b.getDate()
                + "</span>\n" +
"                                </div> <div onclick=\"backf()\" class=\"backbtn\"><i class=\"fa fa-caret-left\" aria-hidden=\"true\"></i> <span>Back</span></div>";
        
        return data;
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
