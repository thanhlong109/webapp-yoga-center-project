
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.repository.CourseScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ViewCourseTimeListController extends HttpServlet {

    private final String COURSE_TIME_LIST_PAGE = "../Admin/ViewCourseTime.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseScheduleRepository _courseScheduleRepository = new CourseScheduleRepository();
        request.setAttribute("COURSE_TIME_LIST", _courseScheduleRepository.getAll());
        request.getRequestDispatcher(COURSE_TIME_LIST_PAGE).forward(request, response);
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
