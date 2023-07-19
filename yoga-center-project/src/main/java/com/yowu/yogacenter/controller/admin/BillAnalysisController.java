/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.repository.BillMembershipRepository;
import com.yowu.yogacenter.repository.BillRepository;
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
 * @author DungVNT
 */
public class BillAnalysisController extends HttpServlet {

    private final String BILL_ANALYSIS_PAGE = "../Admin/BillAnalysis.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillRepository _BillRepository = new BillRepository();
        BillMembershipRepository _BillMembershipRepository = new BillMembershipRepository();
        LocalDate current = LocalDate.now();
        LocalDate pre30 = current.minusDays(30);
        Date pre30d = Date.valueOf(pre30); 
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        DecimalFormat df = new DecimalFormat("#.00",symbols);
        
        //Total Bill Course
        request.setAttribute("TOTAL_PAID_BILL", _BillRepository.getTotalPaidBill());
        request.setAttribute("TOTAL_PAID_BILL_PRE_MONTH", _BillRepository.getTotalPaidBill(pre30d));
        
        //Total Bill Course Income
        float totalBillCourseIncome = _BillRepository.getTotalIncome();
        float totalBillCourseIncomePreMonth = Float.valueOf(df.format(_BillRepository.getTotalIncome(pre30d)));
        float incomeBillCoursePercent = 100;
        if(totalBillCourseIncomePreMonth!=0){
            incomeBillCoursePercent   = ((totalBillCourseIncome-totalBillCourseIncomePreMonth)/totalBillCourseIncomePreMonth)*100;
        }
        incomeBillCoursePercent = Float.valueOf(df.format(incomeBillCoursePercent));        
        request.setAttribute("TOTAL_BILL_COURSE_INCOME", totalBillCourseIncome);
        request.setAttribute("TOTAL_BILL_COURSE_INCOME_PRE_MONTH", totalBillCourseIncomePreMonth);
        request.setAttribute("TOTAL_BILL_COURSE_INCOME_PERCENT", incomeBillCoursePercent);
        
        //Total Bill Membership
        request.setAttribute("TOTAL_PAID_BILL_MEMBERSHIP", _BillMembershipRepository.getTotalPaidBill());
        request.setAttribute("TOTAL_PAID_BILL_MEMBERSHIP_PRE_MONTH", _BillMembershipRepository.getTotalPaidBill(pre30d));
        
        //Total Bill Membership Income
        float totalBillMembershipIncome = _BillMembershipRepository.getTotalIncome();
        float totalBillMembershipIncomePreMonth = Float.valueOf(df.format(_BillMembershipRepository.getTotalIncome(pre30d)));
        float incomeBillMembershipPercent = 100;
        if(totalBillMembershipIncomePreMonth!=0){
            incomeBillMembershipPercent   = ((totalBillMembershipIncome-totalBillMembershipIncomePreMonth)/totalBillMembershipIncomePreMonth)*100;
        }
        incomeBillMembershipPercent = Float.valueOf(df.format(incomeBillMembershipPercent));
        request.setAttribute("TOTAL_BILL_MEMBERSHIP_INCOME", totalBillMembershipIncome);
        request.setAttribute("TOTAL_BILL_MEMBERSHIP_INCOME_PRE_MONTH", totalBillMembershipIncomePreMonth);
        request.setAttribute("TOTAL_BILL_MEMBERSHIP_INCOME_PERCENT", incomeBillMembershipPercent);
        
        //Chart 1
        int currentYear = LocalDate.now().getYear();
        request.setAttribute("PAID_BILL_COURSE_DATE_DATA", _BillRepository.getBillPaidDateJson(currentYear));
        request.setAttribute("PAID_BILL_MEMBERSHIP_DATE_DATA", _BillMembershipRepository.getBillPaidDateJson(currentYear));
        request.setAttribute("BILL_YEAR_LIST", _BillRepository.getYearList());
        
        //Chart2
        request.setAttribute("ALL_BILL_STATUS_DATA", _BillRepository.getBillStatusJson());
        
        request.getRequestDispatcher(BILL_ANALYSIS_PAGE).forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try(PrintWriter out = response.getWriter()){
            String action = request.getParameter("action");
            if(action!=null){
                switch(action){
                    case "updateChart1":{
                        BillRepository _BillRepository = new BillRepository();
                        BillMembershipRepository _BillMembershipRepository = new BillMembershipRepository();
                        
                        int year = Integer.parseInt(request.getParameter("chart1Year"));
                        String paidBillCourseDateData = _BillRepository.getBillPaidDateJson(year);
                        String paidBillMembershipDateData = _BillMembershipRepository.getBillPaidDateJson(year);
                        
                        HashMap<String,Object> dataMap = new HashMap<>();
                        dataMap.put("PAID_BILL_COURSE_DATE_DATA", paidBillCourseDateData);
                        dataMap.put("PAID_BILL_MEMBERSHIP_DATE_DATA", paidBillMembershipDateData);
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
