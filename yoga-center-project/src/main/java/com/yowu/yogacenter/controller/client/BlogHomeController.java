/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Blog;
import com.yowu.yogacenter.repository.BlogRepository;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author DatTGT
 */
public class BlogHomeController extends HttpServlet {

    private final String BLOG_PAGE = "Client/blogHome.jsp";
    private final int MAX_NUM_LOAD_MORE = 15;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogRepository br = new BlogRepository();
        int max = br.getQuantityBlog();
        Account acc = (Account) request.getSession().getAttribute("account");

        if(max>MAX_NUM_LOAD_MORE){
            max = MAX_NUM_LOAD_MORE;
        }
        request.setAttribute("blogList", br.getAll());
        if(acc!=null){
            request.setAttribute("recentBlogList", br.getRecentBlogNext3(0,acc.getId()));
        }
        request.setAttribute("maxLoadMore", max);
        request.getRequestDispatcher(BLOG_PAGE).forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter())
        {
            BlogRepository br = new BlogRepository();
            Account acc = (Account) request.getSession().getAttribute("account");
            String action = request.getParameter("action");
            switch(action){
                case "loadmore":{
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    List<Blog> list = br.getRecentBlogNext3(quantity,acc.getId() );
                    out.print(getHtmlRecentBlog(list));
                    break;
                }
                case "postBlog":{
                    
                    break;
                }
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
    }
    private String getHtmlRecentBlog(List<Blog> list){
        String data="";
        SimpleDateFormat sdf = new SimpleDateFormat("MMMM dd, yyyy",Locale.ENGLISH);
        if(list.size()>0){
            for(Blog b : list){
                String dateString = sdf.format(b.getDate());
                data+= "<div class=\"small-blog-item\">\n" +
"                            <div class=\"small-blog-item-img\">\n" +
"                                <img src=\"Asset/img/blog/"+b.getImg()
                        + "\" alt=\"\">\n" +
"                            </div>\n" +
"                            <div>\n" +
"                                <a href=\"blog-detail?blogid="+b.getId()
                        + "\">"+b.getTitle()
                        + "</a>\n" +
"                                <div class=\"small-blog-item-info\">\n" +
"                                    <div><i class=\"fa-regular fa-clock\"></i> "+dateString
                        + "</div>\n" +
"                                    <div style=\"text-transform: capitalize;\" ><i class=\"fa-solid fa-pen\"></i> "+b.getAccount().getName()
                        + "</div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>";
            }
        }
        return data;
    };

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
