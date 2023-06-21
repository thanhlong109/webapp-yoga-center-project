/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.repository.CategoryRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DatTGT
 */
public class ViewScheduleController extends HttpServlet {

    private final String SCHEDULE_PAGE = "Client/viewSchedule.jsp";



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 1;
        CategoryRepository cr = new CategoryRepository();
        request.setAttribute("categoryId", cr.detail(id));
        
        
        CourseScheduleRepository csr = new CourseScheduleRepository();
        request.setAttribute("scheduleList", csr.getAll());
        
        
        
        request.getRequestDispatcher(SCHEDULE_PAGE).forward(request, response);
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
