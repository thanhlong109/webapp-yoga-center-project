/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Category;
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
public class UpdateCategoryController extends HttpServlet {

    private final String VIEW_CATEGORY_LIST_CONTROLLER = "categoryListController";
    private final String EDIT_PAGE = "../Admin/EditCategory2.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        CategoryRepository _categoryRepository = new CategoryRepository();
        Category c = _categoryRepository.detail(id);
        request.setAttribute("CATEGORY", c);
        request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoryError categoryError = new CategoryError();
        CategoryRepository _categoryRepository = new CategoryRepository();
        boolean result = false;
        try {
            String name = request.getParameter("txtName");
            int id = Integer.parseInt(request.getParameter("txtId"));
            categoryError = checkInput(name);

            if (categoryError == null) {
                result = _categoryRepository.update(id, name);
                System.out.println("result = true");
            } else {
                Category c = _categoryRepository.detail(id);
                request.setAttribute("CATEGORY", c);
                request.setAttribute("UPDATE_CATEGORY_ERROR", categoryError);
                System.out.println("categoryError != null");

            }
        } catch (Exception e) {
            log("Error at UpdateCategoryController" + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_CATEGORY_LIST_CONTROLLER);
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

    private CategoryError checkInput(String name) {

        CategoryError categoryError = null;
        if (name.length() < 5 || name.length() > 20) {
            categoryError = new CategoryError();
            categoryError.setCategoryNameError("Category's name must be 5 - 20 characters");
        }
        return categoryError;
    }
}
