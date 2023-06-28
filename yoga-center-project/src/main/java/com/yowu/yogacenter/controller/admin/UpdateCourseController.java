/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.repository.CategoryRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author DungVNT
 */
public class UpdateCourseController extends HttpServlet {

    private final String EDIT_PAGE = "../Admin/EditCourse.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        CategoryRepository _categoryRepository = new CategoryRepository();
        CourseRepository _courseRepository = new CourseRepository();

        Course c = _courseRepository.detail(id);

        request.setAttribute("CATEGORY_UPDATE_OPTIONS", _categoryRepository.getAll());
        request.setAttribute("COURSE", c);
        request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("txtId"));
        String title = request.getParameter("txtTitle");
        String detail = request.getParameter("txtDetail");
        int duration = Integer.parseInt(request.getParameter("txtDuration"));
        String img = request.getParameter("");
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

         private String storeImgWithName(String name,String uploadDirectory,Part part){
        String fileName="";
        try{
            String orginName = part.getSubmittedFileName();
             String extension = orginName.substring(orginName.lastIndexOf("."));
            fileName = name+extension;
            String buildLocation = getServletContext().getRealPath("");
            String realPath = getServletContext().getRealPath(uploadDirectory).replace(buildLocation, "");
            String mainLocation = "\\src\\main\\webapp\\";
            Path path = Paths.get(buildLocation);
            path = path.getParent();
            path = path.getParent();
            File uploadDir = new File(realPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            part.write(path.toString()+mainLocation+realPath+fileName);
            
        }catch(Exception e){
            System.out.println(e);
            return fileName;
        }
        return fileName;
    }
}
