/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.CategoryError;
import com.yowu.yogacenter.repository.CategoryRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DungVNT
 */
public class AddCategoryController extends HttpServlet {

    private final String VIEW_CATEGORY_LIST_CONTROLLER = "categoryListController";
    private final String ADD_CATEGORY_PAGE = "../Admin/AddCategory.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(ADD_CATEGORY_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryRepository _categoryRepository = new CategoryRepository();
        CategoryError categoryError = new CategoryError();
        boolean result = false;

        try {
            boolean checkValidation = true;
            //Get parameter
            String name = request.getParameter("txtName");
            //Check error
            if (name.length() < 5 || name.length() > 20) {
                categoryError.setCategoryNameError("Category's name must be 5 - 20 characters!!!");
                checkValidation = false;
            }
            if (_categoryRepository.checkDuplicate(name)) {
                categoryError.setCategoryNameDuplicateError("Category's name already existed!!!");
                checkValidation = false;
            }

            if (checkValidation) {
                _categoryRepository.add(name, true);
                result = true;
            } else {
                result = false;
                request.setAttribute("ADD_CATEGORY_ERROR", categoryError);
            }

        } catch (Exception e) {
            log("Error at AddCategoryController" + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_CATEGORY_LIST_CONTROLLER);
            } else {
                request.getRequestDispatcher(ADD_CATEGORY_PAGE).forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
