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

public class UpdateCourseScheduleController extends HttpServlet {

    private final String EDIT_COURSE_TIME_PAGE = "../Admin/EditCourseSchedule.jsp";
    private final String VIEW_COURSE_TIME_PAGE = "viewCourseTimeListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        CourseScheduleRepository courseScheduleRepository = new CourseScheduleRepository();
        CourseSchedule courseSchedule = courseScheduleRepository.detailByScheduleID(id);
        request.setAttribute("courseSchedule", courseSchedule);
        request.getRequestDispatcher(EDIT_COURSE_TIME_PAGE).forward(request, response);
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
            int id = Integer.parseInt(request.getParameter("txtId"));
            String dateOfWeek = request.getParameter("txtDateOfWeek");
            Time startTime = Time.valueOf(LocalTime.parse(request.getParameter("txtStartDate")));
            Time endTime = Time.valueOf(LocalTime.parse(request.getParameter("txtEndDate")));

            if (!dateOfWeek.matches("^[1-7](,[1-7])*$")) {
                courseScheduleError.setDateOfWeekError("Date of Week must be 1 to 7 (Monday to Sunday) and between them must have commas");
                errorFound = false;
            }
            if (errorFound) {
                courseSchedule.setId(id);
                courseSchedule.setDateOfWeek(dateOfWeek);
                courseSchedule.setStartTime(startTime);
                courseSchedule.setEndTime(endTime);
                courseSchedule.setIsActive(true);
                result = courseScheduleRepository.update2(courseSchedule);
                if (!result) {
                    courseSchedule = courseScheduleRepository.detail(id);
                    request.setAttribute("courseSchedule", courseSchedule);
                    request.setAttribute("UPDATE_COURSE_TIME_ERROR", courseScheduleError);
                }
            } else {
                courseSchedule = courseScheduleRepository.detail(id);
                request.setAttribute("courseSchedule", courseSchedule);
                request.setAttribute("UPDATE_COURSE_TIME_ERROR", courseScheduleError);
            }

        } catch (NumberFormatException e) {
            log("Error at UpdateCourseScheduleController" + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_COURSE_TIME_PAGE);
            } else {
                request.getRequestDispatcher(EDIT_COURSE_TIME_PAGE).forward(request, response);
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
