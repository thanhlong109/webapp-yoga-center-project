package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Time;

public class UpdateCourseScheduleController extends HttpServlet {

    private final String EDIT_COURSE_SCHEDULE_PAGE = "../Admin/EditCourseSchedule.jsp";
    private final String VIEW_COURSE_TIME_PAGE = "viewCourseTimeListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CourseScheduleRepository csr = new CourseScheduleRepository();
        CourseSchedule cs = csr.detailByScheduleID(id);
        request.setAttribute("courseSchedule", cs);
        request.getRequestDispatcher(EDIT_COURSE_SCHEDULE_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CourseScheduleRepository csr = new CourseScheduleRepository();
            CourseSchedule cs = new CourseSchedule();
            int id = Integer.parseInt(request.getParameter("txtId"));
            cs.setId(id);
            cs.setDateOfWeek(request.getParameter("txtDateOfWeek"));
            cs.setStartTime(Time.valueOf(request.getParameter("txtStartDate")));
            cs.setEndTime(Time.valueOf(request.getParameter("txtEndDate")));
            cs.setIsActive(true);
            boolean update = csr.update2(cs);
            if (update) {
                response.sendRedirect(VIEW_COURSE_TIME_PAGE);
            }
        } catch (IOException | NumberFormatException e) {
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
