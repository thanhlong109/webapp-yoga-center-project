/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.repository.BlogRepository;
import com.yowu.yogacenter.repository.CommentRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;

/**
 *
 * @author DungVNT
 */
public class BlogAnalysisController extends HttpServlet {
    
    private final String BLOG_ANALYSIS_PAGE = "../Admin/BlogAnalysis.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogRepository _BlogRepository = new BlogRepository();
        CommentRepository _CommentRepository = new  CommentRepository();
        LocalDate current = LocalDate.now();
        LocalDate pre30 = current.minusDays(30);
        Date pre30d = Date.valueOf(pre30);       
        
        //Total Blog
        request.setAttribute("TOTAL_BLOG", _BlogRepository.getTotalAllBlog());
        request.setAttribute("TOTAL_BLOG_PRE_MONTH", _BlogRepository.getTotalAllBlog(pre30d));
        
        //Total Interactions
        request.setAttribute("TOTAL_COMMENT", _CommentRepository.getTotalAllComment());
        request.setAttribute("TOTAL_COMMENT_PRE_MONTH", _CommentRepository.getTotalAllComment(pre30d));
        
        //Most Comment Blog
        request.setAttribute("MOST_COMMENT_BLOG", _CommentRepository.getMostCommentBlog());
        request.setAttribute("TOTAL_COMMENT_IN_MOST_COMMENT_BLOG", _CommentRepository.getTotalCommentInMostCommentBlog());
        
        //Chart
        int currentYear = LocalDate.now().getYear();
        request.setAttribute("BLOG_DATE_DATA", _BlogRepository.getBlogDateJson(currentYear));
        request.setAttribute("BLOG_YEAR_LIST", _BlogRepository.getYearList());
        
        
        request.getRequestDispatcher(BLOG_ANALYSIS_PAGE).forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
            String action = request.getParameter("action");
            if(action!=null){
                switch(action){
                    case "updateChart1":{
                        BlogRepository _BlogRepository = new BlogRepository();
                        
                        int year = Integer.parseInt(request.getParameter("chart1Year"));
                        String blogDateData = _BlogRepository.getBlogDateJson(year);
                        HashMap<String,Object> dataMap = new HashMap<>();
                        dataMap.put("BLOG_DATE_DATA", blogDateData);
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
