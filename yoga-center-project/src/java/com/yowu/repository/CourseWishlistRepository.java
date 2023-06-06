/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.repository;

import com.yowu.model.Course;
import com.yowu.model.CourseWishlist;
import com.yowu.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ThangNC
 */
public class CourseWishlistRepository {
    public List<CourseWishlist> getAll(){
        String sql = "select * from tblCourseWishlist";
        List<CourseWishlist> list = new ArrayList<>();
        
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    CourseWishlist c = new CourseWishlist();
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    list.add(c);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public CourseWishlist detail(int id){
        String sql = "select * from tblCourseWishlist where course_id=? ";
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, id);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    CourseWishlist c = new CourseWishlist();
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    return c;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }

}
