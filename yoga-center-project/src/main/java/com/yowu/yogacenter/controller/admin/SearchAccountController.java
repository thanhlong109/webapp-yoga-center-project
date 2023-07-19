/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.SearchError;
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
public class SearchAccountController extends HttpServlet {

    private final String ACCOUNT_LIST_PAGE = "../Admin/ViewAccount.jsp";
    private final String VIEW_ACCOUNT_LIST_CONTROLLER = "viewAccountListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("txtSearch");
        AccountRepository _accountRepository = new AccountRepository();
        SearchError searchError = new SearchError();        
        List<Account> result = _accountRepository.searchName(search);
        if (result.isEmpty()) {
            searchError.setSearchError("Search value doesn't exist");
            request.setAttribute("SEARCH_ERROR", searchError);
            request.getRequestDispatcher(VIEW_ACCOUNT_LIST_CONTROLLER).forward(request, response);
        } else {
            request.setAttribute("ACCOUNT_LIST", result);
            request.getRequestDispatcher(ACCOUNT_LIST_PAGE).forward(request, response);
        }
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
