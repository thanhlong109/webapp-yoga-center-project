/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ACER
 */
public class UserProfileCourse extends HttpServlet {
    private final String USER_PROFILE_COURSE_PAGE = "../Client/userProfileCourse.jsp";
   
  // this function take registration course of user
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account acc = (Account)request.getSession().getAttribute("account");

        String txtStatus = request.getParameter("status");
        RegistrationCourseRepository rcRepo = new RegistrationCourseRepository();
        if(txtStatus!=null){
            try(PrintWriter out = response.getWriter()){
                int status = Integer.parseInt(txtStatus);
                RegistrationCourse.CourseStatus CourseStatus = RegistrationCourse.CourseStatus.values()[status];
                switch(CourseStatus){
                    case INPROGRESS:{
                        List<RegistrationCourse> list = rcRepo.getCoursesByAccountIDAndStatus(acc.getId(),RegistrationCourse.CourseStatus.INPROGRESS.ordinal());
                        out.print(getHtmlListCourse(list));
                        break;
                    }
                    case FINISH :{
                        List<RegistrationCourse> list = rcRepo.getCoursesByAccountIDAndStatus(acc.getId(),RegistrationCourse.CourseStatus.FINISH.ordinal());
                        out.print(getHtmlListCourse(list));
                        break;
                    }
                    case ALL:{
                        List<RegistrationCourse> list = rcRepo.getCoursesByAccountID(acc.getId());
                        out.print(getHtmlListCourse(list));
                        break;
                    }
                }   
            }catch(Exception e){
                    System.out.println(e);
            }
        }else{
            List<RegistrationCourse> list = null;
            if(acc!=null){
               list = rcRepo.getCoursesByAccountID(acc.getId());
            }
            request.setAttribute("listRegistrationCourse", list);
            request.getRequestDispatcher(USER_PROFILE_COURSE_PAGE).forward(request, response);
        }
        
    }
    
    private String getHtmlListCourse(List<RegistrationCourse> list){
        String data = "";
        
        if(list.size()==0){
            data = "";
        }else{
            data = " <table class=\"course-table\"> <tr>\n" +
    "                                    <th></th>\n" +
    "                                    <th>Name</th>\n" +
    "                                    <th>Registation Date</th>\n" +
    "                                    <th>End Date</th>\n" +
    "                                </tr>";
            for(RegistrationCourse rc : list){
                Course c = rc.getCourse();
                data+= "<tr>\n" + 
    "                  <td><img src=\"../Asset/img/classes/"+c.getImg()
                        + "\" alt=\"img\"></td>"+"<td>"+c.getTitle()+"</td>"+"<td>"+rc.getRegistrationDate()+"</td>"
                        +"<td>"+rc.getEndDate()+"</td> </tr>";
            }
            data+=" </table>";
        }
        return data;
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
