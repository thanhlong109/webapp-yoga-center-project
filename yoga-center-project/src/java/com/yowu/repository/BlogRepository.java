/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.repository;

import com.yowu.model.Blog;
import com.yowu.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class BlogRepository {
    public List<Blog> getAll(){
        String sql = "select * from tblBlog";
        List<Blog> list = new ArrayList<>();
        
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setIsActive(rs.getBoolean("blog_is_active"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getDate("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    list.add(c);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public Blog detail(int id){
        String sql = "select * from tblBlog where blog_id =? ";
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, id);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setIsActive(rs.getBoolean("blog_is_active"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getDate("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    return c;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public boolean update(Blog c){
        String sql = "update tblBlog set blog_title=? , set blog_detail=? ,set blog_is_active=? , set account_id=? , set blog_date=? , set blog_img=? where blog_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, c.getTitle());
            stmt.setString(2, c.getDetail());
            stmt.setBoolean(3, c.isIsActive());
            stmt.setInt(4, c.getAccount().getId());
            stmt.setDate(5, c.getDate());
            stmt.setString(6, c.getDetail());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    
    public boolean delete(int id){
         String sql = "update tblBlog set blog_is_active=? where blog_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setBoolean(1, false);
            stmt.setInt(2, id);
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    public static void main(String[] args) {
        BlogRepository cr = new BlogRepository();
        System.out.println(cr.getAll());
    }
}
