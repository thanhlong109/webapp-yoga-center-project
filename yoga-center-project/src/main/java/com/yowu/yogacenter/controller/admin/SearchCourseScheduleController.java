/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.model.SearchError;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Time;
import java.util.List;

/**
 *
 * @author DatTGT
 */
public class SearchCourseScheduleController extends HttpServlet {

    private final String VIEW_COURSE_SCHEDULE_PAGE = "../Admin/ViewCourseTime.jsp";
    private final String VIEW_COURSE_SCHEDULE_LIST = "viewCourseTimeListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //int id = Integer.parseInt(request.getParameter("txtSearch"));
        String search = request.getParameter("txtSearch");
        CourseScheduleRepository csr = new CourseScheduleRepository();
        SearchError se = new SearchError();
        List<CourseSchedule> list = csr.searchCourseSchedule(search);
        if (list.isEmpty()) {
            se.setSearchError("The course that you searched for doesn't have here!");
            request.setAttribute("SEARCH_ERROR", se);
            request.getRequestDispatcher(VIEW_COURSE_SCHEDULE_LIST).forward(request, response);
        } else {
            request.setAttribute("COURSE_TIME_LIST", list);
            request.getRequestDispatcher(VIEW_COURSE_SCHEDULE_PAGE).forward(request, response);
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
