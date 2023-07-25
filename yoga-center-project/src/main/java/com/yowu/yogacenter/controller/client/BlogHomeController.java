/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Blog;
import com.yowu.yogacenter.repository.BlogRepository;
import com.yowu.yogacenter.util.MyTools;
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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author DatTGT
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 5, 
  maxRequestSize = 1024 * 1024 * 5 * 5)
public class BlogHomeController extends HttpServlet {

    private final String BLOG_PAGE = "Client/blogHome.jsp";
    private final int MAX_NUM_LOAD_MORE = 15;
    private final int NUM_BLOG_RECENT_LOAD = 3;
    private final int STORING_TIME_IMG = 2000;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            BlogRepository br = new BlogRepository();
            int max=0;
            Account acc = (Account) request.getSession().getAttribute("account");
            if(acc!=null){
                request.setAttribute("recentBlogList", br.getRecentBlog(0,NUM_BLOG_RECENT_LOAD,acc.getId()));
                max = br.getTotalBlog(acc.getId());  
                if(max>MAX_NUM_LOAD_MORE){
                    max = MAX_NUM_LOAD_MORE;
                }
            }
            request.setAttribute("maxLoadMore", max);
            
            //Phan trang
            String xpage = request.getParameter("page");
            int itemPerPage = 2; // number item each page
            int size = br.count();
            int numPage = (int) Math.ceil(size / (double) itemPerPage);// this will print how many page number
            int page=1;
            if(xpage!=null){
                page = Integer.parseInt(xpage);
            }
            int start = (page - 1) * itemPerPage;
            List<Blog> lst = br.getActive(start, itemPerPage);
            request.setAttribute("blogList",lst );
            request.setAttribute("page", page);
            request.setAttribute("numpage", numPage);
            //end phan trang
            
            request.getRequestDispatcher(BLOG_PAGE).forward(request, response);
        }catch(Exception e){
            System.out.println(e);
        }
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
                    List<Blog> list = br.getRecentBlog(quantity,NUM_BLOG_RECENT_LOAD,acc.getId());
                    out.print(getHtmlRecentBlog(list));
                    break;
                }
                case "postBlog":{
                    Timestamp d = new Timestamp(System.currentTimeMillis());
                    String txtBlogTitle = request.getParameter("txtBlogTitle");
                    String txtBlogContent = request.getParameter("txtBlogContent");
                    Blog bl = new Blog();
                    bl.setTitle(txtBlogTitle);
                    bl.setDetail(txtBlogContent);
                    bl.setAccount(acc);
                    bl.setDate(d);
                    bl.setImg("img");
                    br.create(bl);
                    bl = br.getRecentBlog(0, 1, acc.getId()).get(0);
                    String uploadDirectory = "/Asset/img/blog/";
                    String imgName = "img-blog-id-"+bl.getId();
                    String fileName = storeImgWithName(imgName, uploadDirectory, request.getPart("blogImg"));
                    bl.setImg(fileName);
                    br.update(bl);
                    Thread.sleep(STORING_TIME_IMG);
                    response.sendRedirect("blogs");
                    break;
                }
                case "getBlog":{
                    ObjectMapper objMapper = new ObjectMapper();
                    int bId = Integer.parseInt(request.getParameter("id"));
                    Blog b = br.detail(bId);
                    b.setAccount(null);
                    if(b!=null){
                        out.print(objMapper.writeValueAsString(b));
                    }
                    break;
                }
                case "editBlog":{
                    int bId = Integer.parseInt(request.getParameter("id"));
                    Blog b = br.detail(bId);
                    String txtBlogTitle = request.getParameter("txtBlogTitle");
                    String txtBlogContent = request.getParameter("txtBlogContent");
                    b.setTitle(txtBlogTitle);
                    b.setDetail(txtBlogContent);
                    Part p = request.getPart("blogImg");
                    if(p!=null){
                        String uploadDirectory = "/Asset/img/blog/";
                        String imgName = "img-blog-id-"+b.getId();
                        String fileName = storeImgWithName(imgName, uploadDirectory, p);
                    }
                    br.update(b);
                    Thread.sleep(STORING_TIME_IMG);
                    response.sendRedirect("blogs");
                    break;
                }
                case "deleteBlog":{
                    int bId = Integer.parseInt(request.getParameter("id"));
                    Blog b = br.detail(bId);
                    br.delete(bId);
                    DeleteImgWithName(b.getImg());
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
"                                     <div class=\"small-blog-item-action\">\n" +
"                                    <div onclick=\"editBlog("+b.getId()
                        + ")\"><i class=\"fa-solid fa-pen-to-square\"></i> Edit</div>\n" +
"                                    <div onclick=\"deleteBlog("+b.getId()
                        + ",this)\"><i class=\"fa-solid fa-trash\"></i> Delete</div>\n" +
"                                </div>"+
"                                </div>\n" +
"                            </div>\n" +
"                        </div>";
            }
        }
        return data;
    };
    private void DeleteImgWithName(String fileName){
        String buildLocation = getServletContext().getRealPath("");
        String realPath = getServletContext().getRealPath("/Asset/img/blog/").replace(buildLocation, "");
        String mainLocation = "\\src\\main\\webapp\\";
        Path path = Paths.get(buildLocation);
        path = path.getParent();
        path = path.getParent();
        System.out.println();
        String filePath = path.toString()+mainLocation+realPath+fileName;
        MyTools.deleteFile(filePath);
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
