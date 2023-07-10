/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Role;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.RoleRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DungVNT
 */
public class AddAccountController extends HttpServlet {

  private final String VIEW_ACCOUNT_LIST_CONTROLLER = "viewAccountListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("txtName");
        
        RoleRepository _roleRepository = new RoleRepository();        
        AccountRepository _accountRepository = new AccountRepository();
        Account a = new Account();
        a.setName(name);
        a.setPassword("12345");
        a.setImg("default_avatar.png");
        a.setIsActive(true);
        Role r = _roleRepository.detail(2);
        a.setRole(r);
        _accountRepository.createAccount(a);
        response.sendRedirect(VIEW_ACCOUNT_LIST_CONTROLLER);
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
