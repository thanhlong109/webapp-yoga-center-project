package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.util.DBHelpler;
import java.io.IOException;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    private final String LOGIN_PAGE = "Client/login_register.jsp";
    private final String NEW_PASSWORD_PAGE = "Client/getNewPassword.jsp";
    private final String UPDATE_PASSWORD = "update tblAccount set "
            + "account_password = ? where account_email = ? ";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(UPDATE_PASSWORD)) {
                stmt.setString(1, newPassword);
                stmt.setString(2, (String) session.getAttribute("email"));
                int rowCount = stmt.executeUpdate();
                if (rowCount > 0) {
                    request.setAttribute("status", "resetSuccess");
                    dispatcher = request.getRequestDispatcher(LOGIN_PAGE);
                } else {
                    request.setAttribute("status", "resetFailed");
                    dispatcher = request.getRequestDispatcher(LOGIN_PAGE);
                }
                dispatcher.forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            request.setAttribute("msg", "Enter your password again");
            dispatcher = request.getRequestDispatcher(NEW_PASSWORD_PAGE);
            dispatcher.forward(request, response);
        }
    }

}
