/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.yowu.yogacenter.model.GoogleLogin;
import com.yowu.yogacenter.model.GoogleUtils;
import com.yowu.yogacenter.repository.Constants;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Chien Thang
 */
public class LoginGoogleHandler extends HttpServlet {

    private final String LOGIN_PAGE = "Client/login_register.jsp";

    public LoginGoogleHandler() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher(LOGIN_PAGE);
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GoogleLogin googleLogin = GoogleUtils.getUserInfo(accessToken);

            System.out.println("Google email: " + googleLogin.getEmail()); // Debugging statement

            request.setAttribute("id", googleLogin.getId());
            request.setAttribute("name", googleLogin.getName());
            request.setAttribute("picture", googleLogin.getPicture());
            request.setAttribute("family_name", googleLogin.getFamily_name());
            request.setAttribute("given_name", googleLogin.getGiven_name());
            request.setAttribute("email", googleLogin.getEmail());
            request.setAttribute("verified_email", googleLogin.isVerified_email());

            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
