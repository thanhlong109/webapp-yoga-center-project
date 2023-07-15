/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Blog;
import com.yowu.yogacenter.model.Comment;
import com.yowu.yogacenter.repository.BlogRepository;
import com.yowu.yogacenter.repository.CommentRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author ACER
 */
public class BlogDetailController extends HttpServlet {
    private final String BLOG_DETAIL_PAGE = "Client/blogDetail.jsp";
    private final int NUM_LOAD = 6;
    private final int MAX_NUM_LOAD_MORE = 15;
    private final int NUM_LOAD_EACH_TIME = 3;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            // load for right blog bar
            int max =0;
            BlogRepository br = new BlogRepository();
            Account acc = (Account) request.getSession().getAttribute("account");
            if(acc!=null){
                request.setAttribute("recentBlogList", br.getRecentBlog(0,NUM_LOAD_EACH_TIME,acc.getId()));
                max = br.getTotalBlog(acc.getId());  
                if(max>MAX_NUM_LOAD_MORE){
                    max = MAX_NUM_LOAD_MORE;
                }
            }
            // load for blog detail and comment
            int blogId = Integer.parseInt(request.getParameter("blogid"));
            CommentRepository cr = new CommentRepository();
            int tt = cr.getTotalComment(blogId);
            List<Comment> commentList = cr.getRecentByBlogId(0,NUM_LOAD,blogId);
            Blog blog = br.detail(blogId);
            request.setAttribute("commentList", commentList );
            request.setAttribute("blog", blog);
            request.setAttribute("totalComment", tt);
            request.setAttribute("maxLoadMore", max);
        }catch(Exception e){
            System.out.println(e);
        }
        request.getRequestDispatcher(BLOG_DETAIL_PAGE).forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
            String action = request.getParameter("action");
            Account acc = (Account) request.getSession().getAttribute("account");
            if(acc!=null){
                Timestamp time = new Timestamp(System.currentTimeMillis());
                switch(action){
                    case "comment":{
                            CommentRepository cr = new CommentRepository();
                            String commentContent = request.getParameter("txtCommentContent");
                            int blogId = Integer.parseInt(request.getParameter("blogid"));
                            Blog b = new Blog();
                            b.setId(blogId);
                            Comment cmt = new Comment(b, commentContent, time, acc);
                            cr.add(cmt);
                            out.print(getHTMLComment(cmt));
                        break;
                    }
                }
            }else{
                out.print("account-failed");
            }
        }
    }

    private String getHTMLComment(Comment c){
        SimpleDateFormat sdf = new SimpleDateFormat("MMMM d, yyyy",Locale.ENGLISH);
        String date = sdf.format(c.getDate());
        SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss a");
        String time = sdf2.format(c.getDate());
        String data = "<div class=\"user-comment-item\">\n" +
"                                    <div class=\"user-comment-avata\">\n" +
"                                        <img src=\"Asset/img/avatar/"+c.getAccount().getImg()
                + "\" alt=\"\">\n" +
"                                    </div>\n" +
"                                    <div class=\"comment-info\">\n" +
"                                        <div>\n" +
"                                            <h4 class=\"user-comment-name\">"+c.getAccount().getName()
                + "</h4>\n" +
"                                            <p class=\"user-comment-date\"><i class=\"fa-regular fa-clock\"></i> "+date
                + " at "+time
                + "</p>\n" +
"                                        </div>\n" +
"                                        <p class=\"user-comment-content text\">\n" +
"                                            "+c.getContent()
                + "\n" +
"                                        </p>\n" +
"                                    </div>\n" +
"                                </div>";
        return data;
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
