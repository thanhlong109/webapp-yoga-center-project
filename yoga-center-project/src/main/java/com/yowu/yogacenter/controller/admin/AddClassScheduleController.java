package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.model.ClassScheduleError;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;

public class AddClassScheduleController extends HttpServlet {

    private final String VIEW_CLASS_SCHEDULE_PAGE = "viewClassScheduleListController";
    private final String ADD_CLASS_SCHEDULE_PAGE = "../Admin/AddClassSchedule.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RegistrationCourseRepository rcr = new RegistrationCourseRepository();
        request.setAttribute("LIST_REGISTRATION", rcr.getAll());
        request.getRequestDispatcher(ADD_CLASS_SCHEDULE_PAGE).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean result = false;
        ClassScheduleError classScheduleError = new ClassScheduleError();
        ClassSchedule cs = new ClassSchedule();
        ClassScheduleRepository csr = new ClassScheduleRepository();
        RegistrationCourseRepository rcr = new RegistrationCourseRepository();
        try {

            boolean errorFound = true;
            String classDate = request.getParameter("txtDate");
            Time startTime = Time.valueOf(LocalTime.parse(request.getParameter("txtStartDate")));
            Time endTime = Time.valueOf(LocalTime.parse(request.getParameter("txtEndDate")));

            if (classDate == null || classDate.trim().isEmpty()) {
                classScheduleError.setDateError("Must be set class date!");
                errorFound = false;
            }
            if (errorFound) {
                RegistrationCourse rc = rcr.detail(Integer.parseInt(request.getParameter("registrationList")));
                cs.setRegistrationCourse(rc);
                cs.setDate(Date.valueOf(classDate));
                cs.setStartTime(startTime);
                cs.setEndTime(endTime);
                cs.setStatus(1);
                result = csr.addClassSchedule(cs);
                if (!result) {
                    request.setAttribute("LIST_REGISTRATION", rcr.getAll());
                    request.setAttribute("ADD_CLASS_TIME_ERROR", classScheduleError);
                }
            } else {
                request.setAttribute("LIST_REGISTRATION", rcr.getAll());
                request.setAttribute("ADD_CLASS_TIME_ERROR", classScheduleError);
            }
        } catch (NumberFormatException e) {
            log("Error at AddClassScheduleController: " + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_CLASS_SCHEDULE_PAGE);
            } else {
                request.getRequestDispatcher(ADD_CLASS_SCHEDULE_PAGE).forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
