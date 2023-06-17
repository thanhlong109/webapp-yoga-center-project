/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.repository.AccountRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;


@MultipartConfig(fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 5, 
  maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserProfileSetting extends HttpServlet {
    private final String USER_PROFILE_SETTING_PAGE = "../Client/userProfileSetting.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountRepository ar = new AccountRepository();
        request.setAttribute("account", ar.detail(2));
        request.getRequestDispatcher(USER_PROFILE_SETTING_PAGE).forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
       String action = request.getParameter("action");
       AccountRepository ar = new AccountRepository();
       int accountID = 2;
        Account acc = ar.detail(2);
       try(PrintWriter out = response.getWriter()){
        switch(action){
            case "general":{
                String username = request.getParameter("txtUsername");
                String email = request.getParameter("txtEmail");
                String phone = request.getParameter("txtPhone");
                acc.setName(username);
                acc.setEmail(email);
                acc.setPhone(phone);
                if(ar.updateGeneral(acc)){
                    out.print(username);
                }
                break;
            }
            case "avatar":{
                String uploadDirectory = "/Asset/img/avatar/";
                String imgName = "avatar-acc-id-"+accountID;
                String fileName = storeImgWithName(imgName, uploadDirectory, request.getPart("avatar"));
                acc.setImg(fileName);
                ar.updateImg(acc);
                break;
            }
            case "password":{
                
            }
        }
       }
    }
    
    private String storeImgWithName(String name,String uploadDirectory,Part part){
        String fileName="";
        try{
            String orginName = part.getSubmittedFileName();
             String extension = orginName.substring(orginName.lastIndexOf("."));
            fileName = name+extension;
            String buildLocation = getServletContext().getRealPath("");
            String realPath = getServletContext().getRealPath(uploadDirectory).replace(buildLocation, "");
            String mainLocation = "\\src\\main\\webapp\\";
            Path path = Paths.get(buildLocation);
            path = path.getParent();
            path = path.getParent();
            File uploadDir = new File(realPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            part.write(path.toString()+mainLocation+realPath+fileName);
            
        }catch(Exception e){
            System.out.println(e);
            return fileName;
        }
        return fileName;
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
