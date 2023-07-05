/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Category;
import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.repository.CategoryRepository;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.List;
import java.time.temporal.TemporalAdjusters;
import java.time.DayOfWeek;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author DatTGT
 */
public class ViewScheduleController extends HttpServlet {

    private final String SCHEDULE_PAGE = "Client/viewSchedule.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get current week
        LocalDate currentDate = LocalDate.now();
        loadScheduleOfDate(currentDate, request);
        request.getRequestDispatcher(SCHEDULE_PAGE).forward(request, response);
    }
    
    private void loadScheduleOfDate(LocalDate date,HttpServletRequest request){
        Account acc = (Account) request.getSession().getAttribute("account");
        if(acc!=null){
            LocalDate startOfWeek = date.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
            LocalDate endOfWeek = date.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
            Date sDate = Date.valueOf(startOfWeek);
            Date eDate = Date.valueOf(endOfWeek);
            Date[] daysList = new Date[7];
            for(int i=0;i<7;i++){
                daysList[i] = Date.valueOf(startOfWeek.plusDays(i));
            }
            CategoryRepository cr = new CategoryRepository();
            //get data from data base
            ClassScheduleRepository csr = new ClassScheduleRepository();
            System.out.println("accid"+acc.getId());
            List<ClassSchedule> scheduleList = csr.getScheduleBetweenDateByAccount(sDate, eDate, acc.getId());
            List<Time> timeList = csr.getTimeScheduleBetweenDateByAccount(sDate, eDate, acc.getId());
            List<Category> categoryList = cr.getAllActive();
            //generate 2 demension array
            ClassSchedule[][] scheduleTable = new ClassSchedule[timeList.size()][7];
            for(ClassSchedule cs : scheduleList){
                LocalDate scDate = cs.getDate().toLocalDate();
                int x = scDate.getDayOfWeek().getValue()-1;
                int y = timeList.indexOf(cs.getStartTime());
                scheduleTable[y][x] = cs;
            }
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("dateSelected", date);
            request.setAttribute("scheduleTable", scheduleTable);  
            request.setAttribute("daysList", daysList);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String txtDate = request.getParameter("txtDate");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try{
            LocalDate date = LocalDate.parse(txtDate,formatter);
            loadScheduleOfDate(date, request);
            
        }catch(Exception e){
            e.printStackTrace();
        }
        request.getRequestDispatcher(SCHEDULE_PAGE).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
