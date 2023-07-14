/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.GoogleLogin;
import com.yowu.yogacenter.model.GoogleUtils;
import static com.yowu.yogacenter.model.GoogleUtils.getUserInfo;
import com.yowu.yogacenter.model.Role;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.RoleRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Chien Thang
 */
public class LoginGoogleController extends HttpServlet {

    private final String LOGIN_PAGE = "Client/login_register.jsp";
    private final String HOME_PAGE = "home";
    private final String ADMIN_PAGE = "admin/dashboard";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        try {

            AccountRepository dao = new AccountRepository();
            String code = request.getParameter("code");
            String accessToken = GoogleUtils.getToken(code);
            GoogleLogin userGG = getUserInfo(accessToken);
            String googleID = userGG.getId();
            String emailGG = userGG.getEmail();
            HttpSession session = request.getSession();
            String current = (String) session.getAttribute("currentPage");

            Account loginUser = dao.checkLoginGoogle(emailGG, googleID);

            if (loginUser == null) {
                String username = userGG.getName();
                RoleRepository rr = new RoleRepository();
                Account user = new Account(username, null, emailGG, null, rr.detail(Role.RoleList.TRAINEE.ordinal()), googleID);
                //Account( String name, String password, String email, String phone, Role role, String socialID)
                boolean checkInsert = dao.createAccount(user);
                if (checkInsert) {
                    session.setAttribute("account", userGG);
                    url = HOME_PAGE;
                    //request.getRequestDispatcher(url).forward(request, response);
                    response.sendRedirect(HOME_PAGE);
                }
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
                    }else{
                        response.sendRedirect(HOME_PAGE);
                    }
                }
            }

        } catch (IOException e) {
            log("Error at CreateController: " + e.toString());
        } finally {
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
