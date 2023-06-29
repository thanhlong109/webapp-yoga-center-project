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
public class UpdateCourseController extends HttpServlet {

    private final String EDIT_PAGE = "../Admin/EditCourse.jsp";
    private final String VIEW_COURSE_LIST_CONTROLLER = "viewCourseListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        CategoryRepository _categoryRepository = new CategoryRepository();
        CourseRepository _courseRepository = new CourseRepository();
        AccountRepository _accountRepository = new AccountRepository();

        Course c = _courseRepository.detail(id);

        request.setAttribute("CATEGORY_UPDATE_OPTIONS", _categoryRepository.getAll());
        request.setAttribute("ACCOUNT_UPDATE_OPTIONS", _accountRepository.getAll());
        request.setAttribute("COURSE", c);
        request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseRepository _courseRepository = new CourseRepository();
        CategoryRepository _categoryRepository = new CategoryRepository();
        AccountRepository _accountRepository = new AccountRepository();
        Course c = new Course();

        int id = Integer.parseInt(request.getParameter("txtId"));
        String uploadDirectory = "/Asset/img/classes/";
        String imgName = "img-course-id-" + id;
        String fileName = request.getParameter("originImg");
        Part part = request.getPart("courseImg");

        c.setId(id);
        c.setTitle(request.getParameter("txtTitle"));
        c.setDetail(request.getParameter("txtDetail"));
        c.setDuration(Integer.parseInt(request.getParameter("txtDuration")));
        if (part.getSize() != 0) {
            fileName = storeImgWithName(imgName, uploadDirectory, part);
        }
        System.out.println("originImg - " + fileName);
        c.setImg(fileName);
        Category category
                = _categoryRepository.detail(
                        Integer.parseInt(request.getParameter("categoyList"))
                );
        c.setCategory(category);

        Account account
                = _accountRepository.detail(
                        Integer.parseInt(request.getParameter("accountList"))
                );
        c.setAccount(account);
        c.setPrice(Float.parseFloat(request.getParameter("txtPrice")));
        c.setIsActive(true);
        boolean update = _courseRepository.update(c);
        if (update) {
            try {
                Thread.sleep(2000);
                response.sendRedirect(VIEW_COURSE_LIST_CONTROLLER);
            } catch (InterruptedException ex) {
                Logger.getLogger(UpdateCourseController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            c = _courseRepository.detail(id);
            request.setAttribute("COURSE", c);
            request.setAttribute("UPDATE_STATUS", "Update Fail !!!!");
            request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
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
