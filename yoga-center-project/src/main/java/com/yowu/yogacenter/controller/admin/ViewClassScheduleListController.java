
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


public class ViewClassScheduleListController extends HttpServlet {

    private final String VIEW_CLASS_SCHEDULE_LIST_PAGE = "../Admin/ViewClassSchedule.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ClassScheduleRepository csr = new ClassScheduleRepository();       
        String xPage = request.getParameter("page");
        int itemPerPage = 8;
        int size = csr.count();
        int numPage = (int) Math.ceil(size / (double) itemPerPage);
        int page = 1;
        if (xPage != null) {
            page = Integer.parseInt(xPage);
        }
        int start = (page - 1) * itemPerPage;
        List<ClassSchedule> list = csr.pagingClassSchedule(start, itemPerPage);
        request.setAttribute("CLASS_SCHEDULE_LIST", list);
        request.setAttribute("PAGE", page);
        request.setAttribute("NUMPAGE", numPage);
        request.getRequestDispatcher(VIEW_CLASS_SCHEDULE_LIST_PAGE).forward(request, response);
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
