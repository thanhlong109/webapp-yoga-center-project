/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.CategoryRepository;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ACER
 */
public class DashBoardController extends HttpServlet {
     private String DASH_BOARD_PAGE = "../Admin/DashBoard.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillRepository br = new BillRepository();
        CategoryRepository cr = new CategoryRepository();
        AccountRepository ar = new AccountRepository();
        ClassScheduleRepository csr = new ClassScheduleRepository();
        RegistrationCourseRepository rcr = new RegistrationCourseRepository();
        
        request.setAttribute("billData", br.getBillJson());
        request.setAttribute("categoryData", cr.getCategoryJson());
        /* start chart 3*/
        int currentYear = LocalDate.now().getYear();
        request.setAttribute("accountDateData", ar.getAccountDateJson(currentYear));
        request.setAttribute("registrationDateData", rcr.getRegistrationDateJson(currentYear));
        request.setAttribute("accountYearList", ar.getYearList());
        /* end chart3*/
        /* chart 4*/
        request.setAttribute("studentDateData",csr.getStudentDateJson());
        request.getRequestDispatcher(DASH_BOARD_PAGE).forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
            String action = request.getParameter("action");
            if(action!=null){
                switch(action){
                    case "updateChart3":{
                         AccountRepository ar = new AccountRepository();
                        RegistrationCourseRepository rcr = new RegistrationCourseRepository();
                        
                        int year = Integer.parseInt(request.getParameter("chart3Year"));
                        String accountDateData = ar.getAccountDateJson(year);
                        String registrationDateData = rcr.getRegistrationDateJson(year);
                        
                        HashMap<String,Object> dataMap = new HashMap<>();
                        dataMap.put("accountDateData", accountDateData);
                        dataMap.put("registrationDateData", registrationDateData);
                        ObjectMapper mapper = new ObjectMapper();
                        out.print(mapper.writeValueAsString(dataMap));
                        break;
                    }
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
