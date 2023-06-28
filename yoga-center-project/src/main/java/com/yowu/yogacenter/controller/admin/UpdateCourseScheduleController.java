/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Time;

/**
 *
 * @author DungVNT
 */
public class UpdateCourseScheduleController extends HttpServlet {

    private final String EDIT_COURSE_SCHEDULE_PAGE = "../Admin/EditCourseSchedule.jsp";
    private final String VIEW_COURSE_TIME_PAGE = "viewCourseTimeListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CourseScheduleRepository csr = new CourseScheduleRepository();
        CourseSchedule cs = csr.detail(id);
        request.setAttribute("courseSchedule", cs);
        request.getRequestDispatcher(EDIT_COURSE_SCHEDULE_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseScheduleRepository csr = new CourseScheduleRepository();
        try {
            int id = Integer.parseInt(request.getParameter("txtId"));
            String dateOfWeek = request.getParameter("txtDateOfWeek");
            Time startTime = Time.valueOf(request.getParameter("txtStartDate"));
            Time endTime = Time.valueOf(request.getParameter("txtEndDate"));
            boolean updateCourseSchedule = csr.update(id, dateOfWeek, startTime, endTime);
            if (updateCourseSchedule) {
                response.sendRedirect(VIEW_COURSE_TIME_PAGE);
            } 
        } catch (IOException | NumberFormatException e) {
            log("Error at UpdateCourseScheduleController: " + e.toString());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
