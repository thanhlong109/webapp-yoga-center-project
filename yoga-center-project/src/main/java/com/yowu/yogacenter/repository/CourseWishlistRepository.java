/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseWishlist;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class CourseWishlistRepository {
    public List<CourseWishlist> getAll() {
        String sql = "select * from tblCourseWishlist";
        List<CourseWishlist> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    CourseWishlist c = new CourseWishlist();
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<CourseWishlist> getByAccountID(int id) {
        String sql = "select * from tblCourseWishlist where account_id=?";
        List<CourseWishlist> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    CourseWishlist c = new CourseWishlist();
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return list;
    }
    
    public boolean detele(int courseId,int accountId){
         String sql = "delete from tblCourseWishlist where course_id=? and account_id=?";
         int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            stmt.setInt(2, accountId);
            status = stmt.executeUpdate();
        }catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    
     public boolean isExist(int id,int accountId) {
        String sql = "select * from tblCourseWishlist where ( course_id=? and account_id=? )";
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, id);
            stmt.setInt(2, accountId);
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    return true;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
     }

    public void add(int courseId,int accountId) {
        String sql = "INSERT INTO tblCourseWishlist (account_id, course_id) VALUES (?, ?)";

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, courseId);
            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        CourseWishlistRepository c = new CourseWishlistRepository();
        System.out.println(c.getByAccountID(2).get(0).getCourse().getTitle());
    }

}
