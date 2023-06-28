/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Category;
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
    private final String EDIT_PAGE = "../Admin/EditCategory.jsp";

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
        String name = request.getParameter("txtName");
        int id = Integer.parseInt(request.getParameter("txtId"));
        CategoryRepository _categoryRepository = new CategoryRepository();
        boolean update = _categoryRepository.update(id, name);
        if (update) {
            response.sendRedirect(VIEW_CATEGORY_LIST_CONTROLLER);
        } else {
            Category c = _categoryRepository.detail(id);
            request.setAttribute("CATEGORY", c);
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

}
