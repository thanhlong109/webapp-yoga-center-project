/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

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

public class RegisterAccountController extends HttpServlet {

    private final String LOGIN_PAGE = "Client/login_register.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("type", "signup");
        request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        AccountRepository dao = new AccountRepository();
        AccountError accError = new AccountError();
        try {

            boolean checkValidation = true;
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (username.length() < 5 || username.length() > 20) {
                accError.setFullNameError("Full name must be 5 - 20 charaters");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(email);
            if (checkDuplicate) {
                accError.setPasswordError("Email alredy existed!");
                checkValidation = false;
            }
            RoleRepository rr = new RoleRepository();
            Account user = new Account(username, email, password, null, rr.detail(Role.RoleList.TRAINEE.ordinal()));
            boolean checkInsert = dao.createAccount(user);
            url = LOGIN_PAGE;
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
