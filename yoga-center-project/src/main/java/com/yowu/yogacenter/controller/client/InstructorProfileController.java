/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class InstructorProfileController extends HttpServlet {
    private final String INSTRUCTOR_PAGE = "Client/instructorProfile.jsp";
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            int id = Integer.parseInt(request.getParameter("id"));
            AccountRepository ar = new AccountRepository();
            CourseRepository cr = new CourseRepository();
            request.setAttribute("instructor", ar.detail(id));
            request.setAttribute("CourseList", cr.getCourseByInstructor(id));
            request.getRequestDispatcher(INSTRUCTOR_PAGE).forward(request, response);
        }catch(Exception e){
            System.out.println(e);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
