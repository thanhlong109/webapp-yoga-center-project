/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Category;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.CategoryRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DungVNT
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class AddCourseController extends HttpServlet {

    private final String ADD_COURSE_PAGE = "../Admin/AddCourse.jsp";
    private final String VIEW_COURSE_LIST_CONTROLLER = "viewCourseListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoryRepository _categoryRepository = new CategoryRepository();
        AccountRepository _accountRepository = new AccountRepository();

        request.setAttribute("CATEGORY_ADD_OPTIONS", _categoryRepository.getAll());
        request.setAttribute("ACCOUNT_ADD_OPTIONS", _accountRepository.getAll());
        request.getRequestDispatcher(ADD_COURSE_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CategoryRepository _categoryRepository = new CategoryRepository();
            AccountRepository _accountRepository = new AccountRepository();
            CourseRepository _courseRepository = new CourseRepository();
            Course course = new Course();
            course.setTitle(request.getParameter("txtTitle"));
            course.setDetail(request.getParameter("txtDetail"));
            course.setDuration(Integer.parseInt(request.getParameter("txtDuration")));
            course.setImg("img");
            Category category
                    = _categoryRepository.detail(
                            Integer.parseInt(request.getParameter("categoyList"))
                    );
            course.setCategory(category);
            Account account
                    = _accountRepository.detail(
                            Integer.parseInt(request.getParameter("accountList"))
                    );
            course.setAccount(account);
            course.setPrice(Float.parseFloat(request.getParameter("txtPrice")));
            course.setIsActive(true);
            boolean add = _courseRepository.add(course);
            System.out.println("duration: " + Integer.parseInt(request.getParameter("txtDuration")));
            System.out.println("add: " +add);
            course = _courseRepository.getLastAddCourse().get(0);
            String uploadDirectory = "/Asset/img/classes/";
            String imgName = "img-course-id-" + course.getId();
            String fileName = storeImgWithName(imgName, uploadDirectory, request.getPart("courseImg"));
            course.setImg(fileName);
            boolean status = _courseRepository.update(course);
            Thread.sleep(2000);
            System.out.println("status: " +status);
            if (status) {
                response.sendRedirect(VIEW_COURSE_LIST_CONTROLLER);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(AddCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }

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

    private String storeImgWithName(String name, String uploadDirectory, Part part) {
        String fileName = "";
        try {
            String orginName = part.getSubmittedFileName();
            String extension = orginName.substring(orginName.lastIndexOf("."));
            fileName = name + extension;
            String buildLocation = getServletContext().getRealPath("");
            String realPath = getServletContext().getRealPath(uploadDirectory).replace(buildLocation, "");
            String mainLocation = "\\src\\main\\webapp\\";
            Path path = Paths.get(buildLocation);
            path = path.getParent();
            path = path.getParent();
            File uploadDir = new File(realPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            part.write(path.toString() + mainLocation + realPath + fileName);

        } catch (Exception e) {
            System.out.println(e);
            return fileName;
        }
        return fileName;
    }
}
