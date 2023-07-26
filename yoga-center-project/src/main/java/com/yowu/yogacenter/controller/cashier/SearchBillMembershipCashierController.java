/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.cashier;

import com.yowu.yogacenter.model.BillMembership;
import com.yowu.yogacenter.model.SearchError;
import com.yowu.yogacenter.repository.BillMembershipRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author localboss
 */
public class SearchBillMembershipCashierController extends HttpServlet {
    private final String MEMBERSHIP_PAGE = "../Cashier/ViewMembership.jsp";
    private final String VIEW_MEMBERSHIP_CONTROLLER = "viewMembershipCashierController";
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("txtSearch");
        SearchError searchError = new SearchError();
        BillMembershipRepository _billMemRepo = new BillMembershipRepository();
        List<BillMembership> result = _billMemRepo.searchCode(search);
        if(result.isEmpty()){
             searchError.setSearchError("Search value doesn't exist");
            request.setAttribute("SEARCH_ERROR", searchError);
            request.getRequestDispatcher(VIEW_MEMBERSHIP_CONTROLLER).forward(request, response);
        }else{
            request.setAttribute("MEMBERSHIP_LIST", result);
            request.getRequestDispatcher(MEMBERSHIP_PAGE).forward(request, response);
        }
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
