/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Blog;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class BlogRepository {
    public List<Blog> getAll(int offset , int next){
        String sql = "select * from tblBlog order by blog_date desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Blog> list = new ArrayList<>();
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    list.add(c);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    public int count(){
        String sql = "select count(*) as num from tblBlog";
        int count = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    count = rs.getInt("num");
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return count;
    }
    public boolean create(Blog blog){
        String sql = "INSERT INTO tblBlog ("
            + "blog_img, blog_date, account_id, "
            + "blog_detail, blog_title) "
            + "VALUES (?, ?, ?, ?, ?)";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, blog.getImg());
            stmt.setTimestamp(2, blog.getDate());
            stmt.setInt(3, blog.getAccount().getId());
            stmt.setString(4, blog.getDetail());
            stmt.setString(5, blog.getTitle());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status == 1;
    }
    
    
    public List<Blog> getRecentBlog(int offset,int next,int accountId){
        String sql = "select * from tblBlog where account_id=? order by blog_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Blog> list = new ArrayList<>();
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, accountId);
            stmt.setInt(2, offset);
            stmt.setInt(3, next);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    list.add(c);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public int getTotalBlog(int accountId){
        String sql = "select COUNT(*) as count from tblBlog where account_id=?";
        int count = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, accountId);
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    count = rs.getInt("count");
                }
            }
        
        }catch(Exception e){
            System.out.println(e);
        }
        return count;
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
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
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
        String sql = "update tblBlog set blog_title=? , blog_detail=? , account_id=? , blog_date=? , blog_img=? where blog_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, c.getTitle());
            stmt.setString(2, c.getDetail());
            stmt.setInt(3, c.getAccount().getId());
            stmt.setTimestamp(4, c.getDate());
            stmt.setString(5, c.getImg());
            stmt.setInt(6, c.getId());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
      
    public boolean delete(int id){
         String sql = "delete from tblBlog where blog_id=?";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            CommentRepository cr = new CommentRepository();
            cr.delete(id);
            stmt.setInt(1, id);
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    public static void main(String[] args) {
        BlogRepository cr = new BlogRepository();
        System.out.println(cr.delete(12));
    }
}
