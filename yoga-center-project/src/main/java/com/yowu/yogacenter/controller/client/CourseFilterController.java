/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.repository.CategoryRepository;
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
 * @author ACER
 */
public class CourseFilterController extends HttpServlet {
    private final String COURSE_LIST_PAGE = "Client/courseList.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseRepository cr = new CourseRepository();
        CategoryRepository categoryRepo = new CategoryRepository();
        int categoryID=-1;
        List<Course> courseList;
        boolean isFree = request.getParameter("free")!=null;
        int min=0;
        int max=0;
        categoryID = Integer.parseInt(request.getParameter("categoryid"));
        String txtMin = request.getParameter("minPrice");
        String txtMax = request.getParameter("maxPrice");
        if(isFree){
            min = max = 0;
            request.setAttribute("maxSelected", cr.getMaxCoursePrice());
            request.setAttribute("minSelected", cr.getMinCoursePrice());
        }else if(txtMin==null||txtMax==null){
            courseList = cr.getCourseByCategory(categoryID);
            request.setAttribute("maxSelected", cr.getMaxCoursePrice());
            request.setAttribute("minSelected", cr.getMinCoursePrice());
        }else{
            min = Integer.parseInt(txtMin);
            max = Integer.parseInt(txtMax);
            request.setAttribute("maxSelected", max);
            request.setAttribute("minSelected", min);
        }         
        courseList = cr.filterCourse(categoryID, min, max);

        request.setAttribute("isFree", isFree);
        request.setAttribute("minPrice", cr.getMinCoursePrice());
        request.setAttribute("maxPrice", cr.getMaxCoursePrice());
        request.setAttribute("categoryList", categoryRepo.getAllActive());
        request.setAttribute("courseList", courseList);  
        request.setAttribute("categorySelected", categoryID);
        int itemPerPage = 4;
        int numpage = (int) Math.ceil(courseList.size() / (double) itemPerPage);
        request.setAttribute("numpage", numpage);
        request.setAttribute("itemPerPage", itemPerPage);
        request.getRequestDispatcher(COURSE_LIST_PAGE).forward(request, response);
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
