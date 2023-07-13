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
 * @author DatTGT
 */
public class AddCourseScheduleController extends HttpServlet {

    private final String VIEW_COURSE_TIME_PAGE = "viewCourseTimeListController";
    private final String ADD_COURSE_SCHEDULE_PAGE = "../Admin/AddCourseSchedule.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseRepository cr = new CourseRepository();
        request.setAttribute("LIST_COURSE", cr.getAll());
        request.getRequestDispatcher(ADD_COURSE_SCHEDULE_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CourseSchedule cs = new CourseSchedule();
            CourseScheduleRepository csr = new CourseScheduleRepository();
            CourseRepository cr = new CourseRepository();           
            Course course = cr.detail(Integer.parseInt(request.getParameter("courseList")));
            cs.setCourse(course);
            cs.setDateOfWeek(request.getParameter("txtDateOfWeek"));
            cs.setStartTime(Time.valueOf(request.getParameter("txtStartDate")));
            cs.setEndTime(Time.valueOf(request.getParameter("txtEndDate")));
            cs.setIsActive(true);
                                                         
            boolean add = csr.add(cs);
            if (add) {
                response.sendRedirect(VIEW_COURSE_TIME_PAGE);
            }
            
        } catch (IOException e) {
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
