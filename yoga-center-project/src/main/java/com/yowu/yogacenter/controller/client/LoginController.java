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
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginController extends HttpServlet {

    private final String LOGIN_PAGE = "Client/login_register.jsp";
    private final String CASHIER_PAGE = "Cashier/ViewBill.jsp";
    private final String ADMIN_PAGE = "Admin/ViewCourse.jsp";
    private final String HOME_PAGE = "Client/Home.jsp";

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

        try {
            String accountemail = request.getParameter("username");
            String password = request.getParameter("password");
            AccountRepository dao = new AccountRepository();
            Account loginUser = dao.checkLogin(accountemail, password);

            if (loginUser == null) {
                request.setAttribute("errLogin", "Incorrect E-mail Address or Password");
                request.setAttribute("loginStatus", "false"); 
                url = LOGIN_PAGE;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("account", loginUser);
                Role role = loginUser.getRole();
                if (Role.RoleList.ADMIN.ordinal() == role.getId()) {
                    url = ADMIN_PAGE;
                } else if (Role.RoleList.TRAINEE.ordinal() == role.getId() || Role.RoleList.TRAINER.ordinal() == role.getId()) {
                    url = HOME_PAGE;
                } else if(Role.RoleList.CASHER.ordinal() == role.getId()){
                    url = CASHIER_PAGE;
                    System.out.println("1111");
                }
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", "Your role is not supported");

            // request.setAttribute("ERROR", "An error occurred");
            // request.getRequestDispatcher(ERROR_PAGE).forward(request, response);
        } finally {
            try {
                request.getRequestDispatcher(url).forward(request, response);
            } catch (ServletException | IOException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
