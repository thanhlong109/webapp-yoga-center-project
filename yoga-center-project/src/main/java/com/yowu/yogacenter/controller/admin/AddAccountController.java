/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.AccountError;
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

    private final String ADD_ACCOUNT_PAGE = "../Admin/AddAccount.jsp";
    private final String VIEW_ACCOUNT_LIST_CONTROLLER = "viewAccountListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(ADD_ACCOUNT_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoleRepository _roleRepository = new RoleRepository();
        AccountRepository _accountRepository = new AccountRepository();
        AccountError accountError = new AccountError();
        Account a = new Account();

        boolean result = false;
        try {
            boolean checkValidation = true;
            String name = request.getParameter("txtName");

            if (name.length() < 6 || name.length() > 30) {
                accountError.setFullNameError("Name must have 6 - 30 characters!!!");
                checkValidation = false;
            }
            if (_accountRepository.checkDuplicate(name)) {
                accountError.setError("Name already existed!!!");
                checkValidation = false;
            }

            if (checkValidation) {
                a.setName(name);
                a.setPassword(name);
                a.setImg("default_avatar.png");
                a.setIsActive(true);
                Role r = _roleRepository.detail(2);
                a.setRole(r);
                result = _accountRepository.createAccount(a);
                if (!result) {
                    accountError.setError("Unknown Error!!!");
                    request.setAttribute("ADD_ACCOUNT_ERROR", accountError);
                }
            } else {
                request.setAttribute("ADD_ACCOUNT_ERROR", accountError);
            }

        } catch (Exception e) {
            log("Error at AddAccountController" + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_ACCOUNT_LIST_CONTROLLER);
            }else{
                request.getRequestDispatcher(ADD_ACCOUNT_PAGE).forward(request, response);
            }
        }

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
