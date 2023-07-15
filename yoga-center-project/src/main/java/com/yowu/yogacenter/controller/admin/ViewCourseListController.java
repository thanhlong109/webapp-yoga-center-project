/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.repository.CourseRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author DungVNT
 */
public class ViewCourseListController extends HttpServlet {

    private final String COURSE_LIST_PAGE = "../Admin/ViewCourse.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseRepository _courseRepository = new CourseRepository();
        
        //Phan trang
        String xpage = request.getParameter("page");
        int itemPerPage = 4; // number item each page
        int size = _courseRepository.count();
        int numPage = (int) Math.ceil(size / (double) itemPerPage);// this will print how many page number
        int page = 1;
        if (xpage != null) {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * itemPerPage;
        List<Course> list = _courseRepository.getAllFollowPagination(start, itemPerPage);
        request.setAttribute("COURSE_LIST", list);
        request.setAttribute("PAGE", page);
        request.setAttribute("NUMPAGE", numPage);
        //end phan trang
        request.getRequestDispatcher(COURSE_LIST_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
