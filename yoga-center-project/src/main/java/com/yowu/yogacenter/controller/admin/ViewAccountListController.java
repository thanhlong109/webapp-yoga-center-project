/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.repository.AccountRepository;
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
public class ViewAccountListController extends HttpServlet {

    private final String ACCOUNT_LIST_PAGE = "../Admin/ViewAccount.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountRepository _accountRepository = new AccountRepository();

         //Phan trang
        String xpage = request.getParameter("page");
        int itemPerPage = 6; // number item each page
        int size = _accountRepository.count();
        int numPage = (int) Math.ceil(size / (double) itemPerPage);// this will print how many page number
        int page = 1;
        if (xpage != null) {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * itemPerPage;
        List<Account> list = _accountRepository.getAllFollowPagination(start, itemPerPage);
        request.setAttribute("ACCOUNT_LIST", list);
        request.setAttribute("PAGE", page);
        request.setAttribute("NUMPAGE", numPage);
        //end phan trang
        request.getRequestDispatcher(ACCOUNT_LIST_PAGE).forward(request, response);
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
