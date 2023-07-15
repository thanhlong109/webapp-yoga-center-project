package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;


public class AddClassScheduleController extends HttpServlet {

    private final String VIEW_CLASS_SCHEDULE_PAGE = "viewClassScheduleListController";
    private final String ADD_COURSE_SCHEDULE_PAGE = "../Admin/AddClassSchedule.jsp";
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RegistrationCourseRepository rcr = new RegistrationCourseRepository();
        request.setAttribute("LIST_REGISTRATION", rcr.getAll());
        request.getRequestDispatcher(ADD_COURSE_SCHEDULE_PAGE).forward(request, response);
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ClassSchedule cs = new ClassSchedule();
            ClassScheduleRepository csr = new ClassScheduleRepository();
            
            RegistrationCourseRepository rcr = new RegistrationCourseRepository();
            RegistrationCourse rc = rcr.detail(Integer.parseInt(request.getParameter("registrationList")));
            
            cs.setRegistrationCourse(rc);
            cs.setDate(Date.valueOf(request.getParameter("txtDate")));
            cs.setStartTime(Time.valueOf(request.getParameter("txtStartDate")));
            cs.setEndTime(Time.valueOf(request.getParameter("txtEndDate")));
            cs.setStatus(1);
            
            boolean add = csr.addClassSchedule(cs);
            if (add) {
                response.sendRedirect(VIEW_CLASS_SCHEDULE_PAGE);
            }
            
        } catch (NumberFormatException e) {
            
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
