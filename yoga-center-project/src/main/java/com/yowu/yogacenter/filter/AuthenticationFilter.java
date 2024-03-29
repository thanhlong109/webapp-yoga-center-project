/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package com.yowu.yogacenter.filter;

import com.yowu.yogacenter.model.Account;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class AuthenticationFilter implements Filter {
    
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
         HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession ss = req.getSession();
        Account acc = (Account) ss.getAttribute("account");
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String urlName = uri.replace(contextPath, "");
        String queryString = req.getQueryString();
        String urlQuery = urlName;
        if(queryString!=null){
            urlQuery += '?'+queryString;
        }
        //System.out.println(urlName);
        if(urlName.endsWith(".jsp")){
            res.sendRedirect(contextPath+"/home");
        }else{
            switch(urlName){
                //user Login
                case "/Timetable":
                case "/userprofile/course":
                case "/userprofile/wishlist":
                case "/userprofile/booking":
                case "/userprofile/setting":
                case "/Checkout":
                case "/CheckoutResult":{
                    if(acc!=null){
                        chain.doFilter(request, response);
                    }else{
                        ss.setAttribute("currentPage", urlQuery);
                        res.sendRedirect(contextPath+"/login");
                    }
                    break;
                }
                // admin Login
                case "/admin/categoryListController":
                case "/admin/viewCourseListController":
                case "/admin/viewBillListController":
                case "/admin/viewAccountListController":
                case "/admin/viewCourseTimeListController":
                case "/admin/viewClassScheduleListController":
                case "/admin/viewMembershipListController":
                case "/admin/updateCategoryController":
                case "/admin/deleteCategoryController":
                case "/admin/addCategoryController":
                case "/admin/updateCourseController":
                case "/admin/deleteCourseController":
                case "/admin/updateCourseScheduleController":
                case "/admin/addCourseController":
                case "/admin/addAccountController":
                case "/admin/deleteAccountController":
                case "/admin/addMembershipController":
                case "/admin/updateMembershipController":
                case "/admin/deleteMembershipController":
                case "/admin/searchCategoryController":
                case "/admin/searchCourseController":
                case "/admin/searchMembershipController":
                case "/admin/searchAccountController":
                case "/admin/searchBillController":
                case "/admin/dashboard":{
                    if(acc!=null && acc.getRole().getId()==3){
                        chain.doFilter(request, response);
                    }else{
                        ss.setAttribute("currentPage", urlQuery);
                        res.sendRedirect(contextPath+"/login");
                    }
                    break;
                }
                // guest && get Asset
                default:{
                   chain.doFilter(request, response);
                        break;
                }
            }
        }
        
        
    }

    public void destroy() {        
    }

    
    public void init(FilterConfig filterConfig) {        
        
    }

    
}
