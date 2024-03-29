/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;


public class SearchClassScheduleController extends HttpServlet {

    private final String CLASS_SCHEDULE_LIST_PAGE = "../Admin/ViewClassSchedule.jsp";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date search = Date.valueOf(request.getParameter("txtSearch"));        
        ClassScheduleRepository csr = new ClassScheduleRepository();
        List<ClassSchedule> list = csr.searchClassScheduleByRegistrationID(search);
        request.setAttribute("CLASS_SCHEDULE_LIST", list);
        request.getRequestDispatcher(CLASS_SCHEDULE_LIST_PAGE).forward(request, response);
        
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
