/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Comment;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class CommentRepository {

    public List<Comment> getAll() {
        String sql = "select * from tblComment";
        List<Comment> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment c = new Comment();
                    BlogRepository rc = new BlogRepository();
                    AccountRepository ac = new AccountRepository();
                    c.setBlog(rc.detail(rs.getInt("blog_id")));
                    c.setContent(rs.getString("comment_content"));
                    c.setDate(rs.getTimestamp("comment_date"));
                    c.setAccount(ac.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public int getTotalComment(int blogId){
        String sql = "select COUNT(*) as num from tblComment where blog_id=? ";
        int count = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, blogId);
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
    public List<Comment> getRecentByBlogId(int offset, int next , int blogId) {
        String sql = "select * from tblComment where blog_id=? order by comment_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Comment> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, blogId);
            stmt.setInt(2, offset);
            stmt.setInt(3, next);    
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment c = new Comment();
                    BlogRepository rc = new BlogRepository();
                    AccountRepository ac = new AccountRepository();
                    c.setBlog(rc.detail(rs.getInt("blog_id")));
                    c.setContent(rs.getString("comment_content"));
                    c.setDate(rs.getTimestamp("comment_date"));
                    c.setAccount(ac.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public Comment detail(int id) {
        String sql = "select * from tblComment where blog_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment c = new Comment();
                    BlogRepository rc = new BlogRepository();
                    AccountRepository ac = new AccountRepository();
                    c.setBlog(rc.detail(rs.getInt("blog_id")));
                    c.setContent(rs.getString("comment_content"));
                    c.setDate(rs.getTimestamp("comment_date"));
                    c.setAccount(ac.detail(rs.getInt("account_id")));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM tblComment WHERE blog_id=?";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean add(Comment c) {
        String sql = "INSERT INTO tblComment (blog_id, comment_content, comment_date, account_id) "
                + "VALUES (?, ?, ?, ?)";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getBlog().getId());
            stmt.setString(2, c.getContent());
            stmt.setTimestamp(3, c.getDate());
            stmt.setInt(4, c.getAccount().getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

     public int getTotalAllComment() {
        String sql = "select count(*) as num from tblComment ";
        int total = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    total = rs.getInt("num");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }
    
    public int getTotalAllComment(Date to){
        String sql = "select count(*) as num from tblComment where comment_date <= ?";
        int total = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, to);
            try ( ResultSet rs = stmt.executeQuery()) {
                if(rs.next()){
                    total = rs.getInt("num");
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return total;
    }
    
    public Comment getMostCommentBlog(){
        String sql="SELECT blog_id , COUNT(comment_content) as total FROM tblComment GROUP BY blog_id ORDER BY total DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY ";
        Comment comment = new Comment();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if(rs.next()){
                    BlogRepository _BlogRepository = new BlogRepository();
                    comment.setBlog(_BlogRepository.detail(rs.getInt("blog_id")));                   
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return comment;
    }
    
    public int getTotalCommentInMostCommentBlog(){
        String sql="SELECT blog_id , COUNT(comment_content) as total FROM tblComment GROUP BY blog_id ORDER BY total DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY ";
        int total = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if(rs.next()){
                    total = rs.getInt("total");
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return total;
    }
    public static void main(String[] args) {
        CommentRepository cr = new CommentRepository();
        System.out.println(cr.getTotalComment(3));
    }
}
