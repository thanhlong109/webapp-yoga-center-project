/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.CourseWishlist;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.CourseWishlistRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ACER
 */
public class UserProfileWishlist extends HttpServlet {
     private final String USER_PROFILE_WISHLISH_PAGE = "../Client/userProfileWishlish.jsp";
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account)request.getSession().getAttribute("account");
        CourseWishlistRepository cwr = new CourseWishlistRepository();
        if(account!=null){
            request.setAttribute("wishlist", cwr.getByAccountID(account.getId()));
        }
        request.getRequestDispatcher(USER_PROFILE_WISHLISH_PAGE).forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account)request.getSession().getAttribute("account");
        CourseWishlistRepository cwr = new CourseWishlistRepository();
        try(PrintWriter out = response.getWriter()){
            int courseID = Integer.parseInt(request.getParameter("courseid"));
            cwr.detele(courseID, account.getId());
            List<CourseWishlist> list = cwr.getByAccountID(account.getId());
            out.print(getHtmlWishlish(list));
        }catch(Exception e){
            System.out.println(e);
        }
        
    }
    private String getHtmlWishlish(List<CourseWishlist> list){
        String data="";
        if(list.size()>0){
            data+="<table class=\"course-table\">\n" +
"                                    <tr>\n" +
"                                        <th></th>\n" +
"                                        <th>Name</th>\n" +
"                                        <th>Action</th>\n" +
"                                    </tr>";
            for(CourseWishlist c : list){
                data+="<tr> "+"<td><img src=\"../Asset/img/classes/"+c.getCourse().getImg()
                        + "\" alt=\"img\"></td>"+"<td><a href=\"#\">"+c.getCourse().getTitle()
                        + "</a></td>"+"<td><i onclick=\"deteleWishlist(this)\" data-courseid=\""+c.getCourse().getId()
                        + "\" class=\"fa fa-trash\" aria-hidden=\"true\"></i></td>\n" +
"                                        </tr>";
            }
            data+="</table>";
        }
        return data;
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
