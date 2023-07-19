/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Category;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseError;
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

    private final String EDIT_PAGE = "../Admin/EditCourse2.jsp";
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
        CourseError courseError = new CourseError();
        Course c = new Course();
        boolean result = false;

        try {
            boolean checkValidation = true;
            int id = Integer.parseInt(request.getParameter("txtId"));
            String duration = request.getParameter("txtDuration");
            String price = request.getParameter("txtPrice");

            String title = request.getParameter("txtTitle");
            String detail = request.getParameter("txtDetail");

            String uploadDirectory = "/Asset/img/classes/";
            String imgName = "img-course-id-" + id;
            String fileName = request.getParameter("originImg");
            Part part = request.getPart("courseImg");

            if (title.length() < 6 || title.length() > 50) {
                courseError.setCourseTitleLengthError("Title must be 6 - 50 characters!!!");
                checkValidation = false;
            }
            if (_courseRepository.checkDuplicateUpdate(title)) {
                courseError.setCourseTitleDuplicateError("Title already existed!!!");
                checkValidation = false;
            }
            if (detail.length()< 10 ) {
                courseError.setCourseDetailLengthError("Detail must be 10 or more characters!!!");
                checkValidation = false;
            }
            if (!duration.matches("[0-9]+")) {
                courseError.setCourseDurationError("Duration only contains numbers");
                checkValidation = false;
            }
            if (!price.matches("[0-9]+")) {
                courseError.setCoursePriceError("Price only contains numbers and not negative!!!");
                checkValidation = false;
            }

            if (checkValidation) {
                int courseDuration = Integer.parseInt(duration);
                float coursePrice = Float.parseFloat(price);
                c.setId(id);
                c.setTitle(title);
                c.setDetail(detail);
                c.setDuration(courseDuration);
                if (part.getSize() != 0) {
                    fileName = storeImgWithName(imgName, uploadDirectory, part);
                }
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
                c.setPrice(coursePrice);
                c.setIsActive(true);
                result = _courseRepository.update(c);
                if (!result) {
                    courseError.setError("Unknow error!");
                    c = _courseRepository.detail(id);
                    request.setAttribute("COURSE", c);
                    request.setAttribute("UPDATE_COURSE_ERROR", courseError);
                }
            } else {
                c = _courseRepository.detail(id);
                request.setAttribute("COURSE", c);
                request.setAttribute("UPDATE_COURSE_ERROR", courseError);
            }
        } catch (Exception e) {
            log("Error at UpdateCourseController" + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_COURSE_LIST_CONTROLLER);
            } else {
                request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
            }
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
