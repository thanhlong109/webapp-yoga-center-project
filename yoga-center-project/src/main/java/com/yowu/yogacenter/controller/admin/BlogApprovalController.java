/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.Blog;
import com.yowu.yogacenter.repository.BlogRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


public class BlogApprovalController extends HttpServlet {
    private final String BLOG_APPROVAL_PAGE = "../Admin/BlogApproval.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogRepository br = new BlogRepository();
        String filter = request.getParameter("filter");
        String xpage = request.getParameter("page");
        int itemPerPage = 8; // number item each page
        
        int page=1;
        if(xpage!=null){
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * itemPerPage;
        
        List<Blog> lst = null;
        if(filter==null){
            filter ="all";
        }
        int size = 0;
        switch(filter){
            case "pending":{
                size = br.countInactive();
                lst = br.getInActive(start, itemPerPage);
                break;
            }
            case "approved":{
                size = br.count();
                lst = br.getActive(start, itemPerPage);
                break;
            }
            case "all":{
                size = br.countAll();
                lst = br.getAll(start, itemPerPage);
                break;
            }
        }
        
        int numPage = (int) Math.ceil(size / (double) itemPerPage);// this will print how many page number
        
        request.setAttribute("filter", filter);
        request.setAttribute("blogList",lst );
        request.setAttribute("page", page);
        request.setAttribute("numpage", numPage);
        request.setAttribute("inactiveList", this);
        request.getRequestDispatcher(BLOG_APPROVAL_PAGE).forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try(PrintWriter out = response.getWriter()){
           String action = request.getParameter("action");
            BlogRepository br = new BlogRepository();
           int id = Integer.parseInt(request.getParameter("id"));

           switch(action){
               case "view":{
                   Blog b = br.detail(id);
                   b.setAccount(null);
                   ObjectMapper om = new ObjectMapper();
                   out.print(om.writeValueAsString(b));
                   break;
               }
               case "approval":{
                   br.approval(id);
                   break;
               }
           }
       }
               
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
