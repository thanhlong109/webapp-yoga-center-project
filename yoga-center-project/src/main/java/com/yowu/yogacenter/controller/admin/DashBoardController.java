/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.BlogRepository;
import com.yowu.yogacenter.repository.CategoryRepository;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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
        BlogRepository blogRepo = new BlogRepository();
        /*report*/
        LocalDate current = LocalDate.now();
        LocalDate pre30 = current.minusDays(30);
        Date pre30d = Date.valueOf(pre30);
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        DecimalFormat df = new DecimalFormat("#.00",symbols);
        float totalIncome = br.getTotalIncome();
        float totalIncomePreMonth = Float.valueOf(df.format(br.getTotalIncome(pre30d)));
        float incomePercent = 100;
        if(totalIncomePreMonth!=0){
            incomePercent   = ((totalIncome-totalIncomePreMonth)/totalIncomePreMonth)*100;
        }
        incomePercent = Float.valueOf(df.format(incomePercent));
        request.setAttribute("totalAccount", ar.getTotalAccount());
        request.setAttribute("totalAccountPreMonth", ar.getTotalAccount(pre30d));
        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("totalIncomePreMonth",totalIncomePreMonth );
        request.setAttribute("IncomePrecent",incomePercent );
        request.setAttribute("totalEnrollment", rcr.getTotalEnrollment());
        request.setAttribute("totalEnrollmentPreMonth", rcr.getTotalEnrollment(pre30d));
        request.setAttribute("totalBlog", blogRepo.count());
        request.setAttribute("totalBlogPreMonth", blogRepo.count(pre30d));
        
        /**/
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
