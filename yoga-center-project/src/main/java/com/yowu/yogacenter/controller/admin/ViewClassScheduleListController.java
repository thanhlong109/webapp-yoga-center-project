
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.repository.ClassScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ViewClassScheduleListController extends HttpServlet {

    private final String CLASS_SCHEDULE_LIST_PAGE = "../Admin/ViewClassSchedule.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ClassScheduleRepository _classScheduleRepository = new ClassScheduleRepository();
        request.setAttribute("CLASS_SCHEDULE_LIST", _classScheduleRepository.getAll());
        request.getRequestDispatcher(CLASS_SCHEDULE_LIST_PAGE).forward(request, response);
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
