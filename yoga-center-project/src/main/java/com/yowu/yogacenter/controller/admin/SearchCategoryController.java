/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Category;
import com.yowu.yogacenter.model.SearchError;
import com.yowu.yogacenter.repository.CategoryRepository;
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
public class SearchCategoryController extends HttpServlet {

    private final String CATEGORY_LIST_PAGE = "../Admin/ViewCategory.jsp";
    private final String VIEW_CATEGOR_LIST_CONTROLLER = "categoryListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("txtSearch");
        CategoryRepository _categoryRepository = new CategoryRepository();
        SearchError se = new SearchError();
        List<Category> result = _categoryRepository.searchName(search);
        if (result.isEmpty()) {
            se.setSearchError("Search value doesn't exist");
            request.setAttribute("SEARCH_ERROR", se);
            request.getRequestDispatcher(VIEW_CATEGOR_LIST_CONTROLLER).forward(request, response);
        } else {
            request.setAttribute("CATEGORY_LIST", result);
            request.getRequestDispatcher(CATEGORY_LIST_PAGE).forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
