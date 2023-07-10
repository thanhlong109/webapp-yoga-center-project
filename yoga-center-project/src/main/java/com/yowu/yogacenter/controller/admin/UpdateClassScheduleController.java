package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;

public class UpdateClassScheduleController extends HttpServlet {

    private final String EDIT_CLASS_SCHEDULE_PAGE = "../Admin/EditClassSchedule.jsp";
    private final String VIEW_CLASS_TIME_PAGE = "viewClassScheduleListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ClassScheduleRepository csr = new ClassScheduleRepository();
        ClassSchedule cs = csr.detail(id);
        request.setAttribute("classSchedule", cs);
        request.getRequestDispatcher(EDIT_CLASS_SCHEDULE_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ClassScheduleRepository csr = new ClassScheduleRepository();
            ClassSchedule cs = new ClassSchedule();
            int id = Integer.parseInt(request.getParameter("txtId"));
            cs.setId(id);
            cs.setDate(Date.valueOf(request.getParameter("txtDate")));
            cs.setStartTime(Time.valueOf(request.getParameter("txtStartDate")));
            cs.setEndTime(Time.valueOf(request.getParameter("txtEndDate")));
            cs.setStatus(1);
            boolean update = csr.update2(cs);
            if (update) {
                response.sendRedirect(VIEW_CLASS_TIME_PAGE);
            }
        } catch (IOException | NumberFormatException e) {

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
