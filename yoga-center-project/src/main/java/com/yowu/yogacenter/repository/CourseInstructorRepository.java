/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.CourseInstructor;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class CourseInstructorRepository {
    public List<CourseInstructor> getAll() {
        String sql = "select * from tblCourseInstructor";
        List<CourseInstructor> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CourseInstructor c = new CourseInstructor();
                    CourseRepository cr = new CourseRepository();
                    AccountRepository acc = new AccountRepository();
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

    public CourseInstructor detail(int id) {
        String sql = "select * from tblCourseInstructor where course_id=? "
                + "AND account_id =? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CourseInstructor c = new CourseInstructor();
                    CourseRepository cr = new CourseRepository();
                    AccountRepository acc = new AccountRepository();
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(CourseInstructor courseInstructor) {
        String sql = "INSERT INTO tblCourseInstructor (course_id, account_id) "
                + "VALUES (?, ?)";
        int status = 0;

        try (PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, courseInstructor.getCourse().getId());
            stmt.setInt(2, courseInstructor.getAccount().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(CourseInstructor courseInstructor) {
        String sql = "UPDATE tblCourseInstructor SET account_id = ? WHERE course_id = ?";
        int status = 0;

        try (PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, courseInstructor.getAccount().getId());
            stmt.setInt(2, courseInstructor.getCourse().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }
}
