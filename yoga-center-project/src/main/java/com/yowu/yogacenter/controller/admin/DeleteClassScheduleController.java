
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.repository.ClassScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DeleteClassScheduleController extends HttpServlet {

private final String VIEW_CLASS_TIME_PAGE = "viewClassScheduleListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ClassScheduleRepository csr = new ClassScheduleRepository();
        boolean delete = csr.delete(id);
        if (delete) {
            response.sendRedirect(VIEW_CLASS_TIME_PAGE);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
