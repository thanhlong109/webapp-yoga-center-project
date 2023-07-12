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
import jakarta.servlet.jsp.PageContext;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginController extends HttpServlet {

    private final String LOGIN_PAGE = "Client/login_register.jsp";

    private final String ADMIN_PAGE = "admin/dashboard";
    private final String HOME_PAGE = "home";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("type", "login");
        request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("type", "login");

        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        String current = (String) session.getAttribute("currentPage");
        try {
            String accountemail = request.getParameter("username");
            String password = request.getParameter("password");
            AccountRepository dao = new AccountRepository();
            Account loginUser = dao.checkLogin(accountemail, password);

            if (loginUser == null) {
                request.setAttribute("errLogin", "Incorrect E-mail Address or Password");
                request.setAttribute("loginStatus", "false");
                url = LOGIN_PAGE;
                request.getRequestDispatcher(url).forward(request, response);
            } else {

                session.setAttribute("account", loginUser);
                Role role = loginUser.getRole();
                if (Role.RoleList.ADMIN.ordinal() == role.getId()) {
                    if (current != null && !current.isEmpty()) {
                        url = current; // Quay lại trang trước đó
                        session.removeAttribute("currentPage"); // Xóa thuộc tính currentPage khỏi session
                        response.sendRedirect(request.getContextPath() + url);
                    }else{
                        response.sendRedirect(ADMIN_PAGE);
                    }
                } else if (Role.RoleList.TRAINEE.ordinal() == role.getId() || Role.RoleList.TRAINER.ordinal() == role.getId()) {
                    if (current != null && !current.isEmpty()) {
                        url = current; // Quay lại trang trước đó
                        session.removeAttribute("currentPage"); // Xóa thuộc tính currentPage khỏi session
                        response.sendRedirect(request.getContextPath() + url);
                    } else {
                        response.sendRedirect(HOME_PAGE);
                    }
                }
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", "Your role is not supported");
        } 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
