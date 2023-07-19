/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.model.CourseScheduleError;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Time;
import java.time.LocalTime;

/**
 *
 * @author DatTGT
 */
public class AddCourseScheduleController extends HttpServlet {

    private final String VIEW_COURSE_TIME_PAGE = "viewCourseTimeListController";
    private final String ADD_COURSE_TIME_PAGE = "../Admin/AddCourseSchedule.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseRepository courseRepository = new CourseRepository();
        request.setAttribute("LIST_COURSE", courseRepository.getAll());
        request.getRequestDispatcher(ADD_COURSE_TIME_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseScheduleError courseScheduleError = new CourseScheduleError();
        CourseSchedule courseSchedule = new CourseSchedule();
        CourseScheduleRepository courseScheduleRepository = new CourseScheduleRepository();
        CourseRepository courseRepository = new CourseRepository();
        boolean result = false;

        try {
            boolean errorFound = true;
            String dateOfWeek = request.getParameter("txtDateOfWeek");
            Time startTime = Time.valueOf(LocalTime.parse(request.getParameter("txtStartDate")));
            Time endTime = Time.valueOf(LocalTime.parse(request.getParameter("txtEndDate")));

            if (!dateOfWeek.matches("^[1-7](,[1-7])*$")) {
                courseScheduleError.setDateOfWeekError("Date of Week must be 1 to 7 (Monday to Sunday) and between them must have commas");
                errorFound = false;
            }

            if (errorFound) {
                Course course = courseRepository.detail(Integer.parseInt(request.getParameter("courseList")));
                courseSchedule.setCourse(course);
                courseSchedule.setDateOfWeek(dateOfWeek);
                courseSchedule.setStartTime(startTime);
                courseSchedule.setEndTime(endTime);
                courseSchedule.setIsActive(true);
                result = courseScheduleRepository.add(courseSchedule);
                if (!result) {
                    request.setAttribute("LIST_COURSE", courseRepository.getAll());
                    request.setAttribute("ADD_COURSE_TIME_ERROR", courseScheduleError);
                }
            } else {
                request.setAttribute("LIST_COURSE", courseRepository.getAll());
                request.setAttribute("ADD_COURSE_TIME_ERROR", courseScheduleError);
            }
        } catch (Exception e) {
            log("Error at AddCourseScheduleController: " + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_COURSE_TIME_PAGE);
            } else {
                request.getRequestDispatcher(ADD_COURSE_TIME_PAGE).forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
