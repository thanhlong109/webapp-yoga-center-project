/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.repository;


import com.yowu.model.Course;
import com.yowu.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER
 */
public class CourseRepository {
     public List<Course> getAll(){
        String sql = "select * from tblCourse";
        List<Course> list = new ArrayList<>();
        
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    list.add(c);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public Course detail(int id){
        String sql = "select * from tblCourse where course_id=? ";
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, id);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    return c;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public boolean update(Course c){
        String sql = "update tblCourse set course_title=? , course_is_active=? ,course_detail=? , course_duration=? , course_img=? , course_price , category_id=?  where course_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, c.getTitle());
            stmt.setBoolean(2, c.isIsActive());
            stmt.setString(3, c.getDetail());
            stmt.setInt(4, c.getDuration());
            stmt.setString(5, c.getImg());
            stmt.setFloat(6, c.getPrice());
            stmt.setInt(7,c.getCategory().getId());
            stmt.setInt(8, c.getId());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    public boolean delete(int id){
         String sql = "update tblCourse set course_is_active=? where course_id=? ";
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
        CourseRepository cr = new CourseRepository();
        System.out.println(cr.detail(1).getTitle());
    }
}
