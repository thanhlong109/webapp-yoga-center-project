package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Role;
import com.yowu.yogacenter.repository.AccountRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    private final String LOGIN_PAGE = "../Client/login_register.jsp";
    private final String ADMIN_ROLE_ID = "3";
    private final String ADMIN_PAGE = "";
    private final String AC1_ROLE_ID = "1";
    private final String AC2_ROLE_ID = "2";
    private final String HOME_PAGE = "./Client/Home.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("type", "login");
        String accountemail = request.getParameter("username");
        String password = request.getParameter("password");
        AccountRepository dao = new AccountRepository();
        String url = LOGIN_PAGE;

        try {
            Account loginUser = dao.checkLogin(accountemail, password);

            if (loginUser == null) {
                request.setAttribute("ERROR", "Incorrect UserID or Password");
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                Role roleId = loginUser.getRole();
                if (ADMIN_ROLE_ID.equals(roleId)) {
                    url = ADMIN_PAGE;
                } else if (AC1_ROLE_ID.equals(roleId) || AC2_ROLE_ID.equals(roleId)) {
                    url = HOME_PAGE;
                } else {
                    request.setAttribute("ERROR", "Your role is not supported");
                    request.getRequestDispatcher(url).forward(request, response);
                }
                response.sendRedirect(url);
            }
        } catch (Exception e) {
            System.out.println(e);
            // request.setAttribute("ERROR", "An error occurred");
            // request.getRequestDispatcher(ERROR_PAGE).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(LOGIN_PAGE);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
