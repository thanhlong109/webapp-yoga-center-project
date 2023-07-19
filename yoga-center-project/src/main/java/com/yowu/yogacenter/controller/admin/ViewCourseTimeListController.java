package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class ViewCourseTimeListController extends HttpServlet {

    private final String COURSE_TIME_LIST_PAGE = "../Admin/ViewCourseTime.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseScheduleRepository csr = new CourseScheduleRepository();

        String xPage = request.getParameter("page");
        int itemPerPage = 8;
        int size = csr.count();
        int numPage = (int) Math.ceil(size / (double) itemPerPage);
        int page = 1;
        if (xPage != null) {
            page = Integer.parseInt(xPage);
        }
        int start = (page - 1) * itemPerPage;
        List<CourseSchedule> list = csr.pagingCourseSchedule(start, itemPerPage);
        request.setAttribute("COURSE_TIME_LIST", list);
        request.setAttribute("PAGE", page);
        request.setAttribute("NUMPAGE", numPage);
        
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
