/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class CourseScheduleRepository {

    public List<CourseSchedule> getAll() {
        String sql = "select * from tblCourseSchedule";
        List<CourseSchedule> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CourseRepository cr = new CourseRepository();
                    CourseSchedule c = new CourseSchedule();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setId(rs.getInt("course_schedule_id"));
                    c.setDateOfWeek(rs.getString("day_of_week"));
                    c.setStartTime(rs.getTime("start_time"));
                    c.setEndTime(rs.getTime("end_time"));
                    c.setIsActive(rs.getBoolean("is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<CourseSchedule> getScheduleByCourse(int courseId) {
        String sql = "select * from tblCourseSchedule where (course_id=? and is_active=1)";
        List<CourseSchedule> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CourseSchedule c = new CourseSchedule();
                    c.setId(rs.getInt("course_schedule_id"));
                    c.setDateOfWeek(rs.getString("day_of_week"));
                    c.setStartTime(rs.getTime("start_time"));
                    c.setEndTime(rs.getTime("end_time"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public CourseSchedule detail(int id) {
        String sql = "select * from tblCourseSchedule where course_schedule_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CourseSchedule c = new CourseSchedule();
                    CourseRepository cr = new CourseRepository();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setId(rs.getInt("course_schedule_id"));
                    c.setDateOfWeek(rs.getString("day_of_week"));
                    c.setStartTime(rs.getTime("start_time"));
                    c.setEndTime(rs.getTime("end_time"));
                    c.setIsActive(rs.getBoolean("is_active"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(CourseSchedule c) {
        String sql = "INSERT INTO tblCourseSchedule (course_id, day_of_week, "
                + "start_time, end_time, is_active) "
                + "VALUES (?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getCourse().getId());
            stmt.setString(2, c.getDateOfWeek());
            stmt.setTime(3, c.getStartTime());
            stmt.setTime(4, c.getEndTime());
            stmt.setBoolean(5, c.isIsActive());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(CourseSchedule c) {
        String sql = "UPDATE tblCourseSchedule SET course_id = ?, day_of_week = ?, "
                + "start_time = ?, end_time = ?, is_active = ? "
                + "WHERE course_schedule_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getCourse().getId());
            stmt.setString(2, c.getDateOfWeek());
            stmt.setTime(3, c.getStartTime());
            stmt.setTime(4, c.getEndTime());
            stmt.setBoolean(5, c.isIsActive());
            stmt.setInt(6, c.getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(int id, String date, Time startTime, Time endTime) {
        String sql = "UPDATE tblCourseSchedule \n"
                + "SET day_of_week = ?, start_time = ?, end_time = ?\n"
                + "WHERE course_schedule_id = ?";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, date);
            stmt.setTime(2, startTime);
            stmt.setTime(3, endTime);
            stmt.setInt(4, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "UPDATE tblCourseSchedule SET is_active = 0 "
                + "WHERE course_schedule_id = ?";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public static void main(String[] args) {
        CourseScheduleRepository cs = new CourseScheduleRepository();
        System.out.println(cs.getScheduleByCourse(2).get(0).dateToString());
    }

}
