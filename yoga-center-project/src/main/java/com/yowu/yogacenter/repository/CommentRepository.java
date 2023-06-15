/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Comment;
import com.yowu.yogacenter.util.DBHelpler;
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
                    c.setDate(rs.getDate("comment_date"));
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
                    c.setDate(rs.getDate("comment_date"));
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
            stmt.setDate(3, c.getDate());
            stmt.setInt(4, c.getAccount().getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public static void main(String[] args) {
        CommentRepository cr = new CommentRepository();
        System.out.println(cr.getAll());
    }
}