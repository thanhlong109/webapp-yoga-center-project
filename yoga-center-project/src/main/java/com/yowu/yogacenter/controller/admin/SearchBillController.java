/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.SearchError;
import com.yowu.yogacenter.repository.BillRepository;
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
public class SearchBillController extends HttpServlet {

    private final String BILL_LIST_PAGE = "../Admin/ViewBill.jsp";
    private final String VIEW_BILL_LIST_CONTROLLER = "viewBillListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("txtSearch");
        SearchError searchError = new SearchError();
        BillRepository _billRepository = new BillRepository();
        List<Bill> result = _billRepository.searchOrderCode(search);
        if (result.isEmpty()) {
            searchError.setSearchError("Search value doesn't exist");
            request.setAttribute("SEARCH_ERROR", searchError);
            request.getRequestDispatcher(VIEW_BILL_LIST_CONTROLLER).forward(request, response);
        } else {
            request.setAttribute("BILL_LIST", result);
            request.getRequestDispatcher(BILL_LIST_PAGE).forward(request, response);
        }

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
