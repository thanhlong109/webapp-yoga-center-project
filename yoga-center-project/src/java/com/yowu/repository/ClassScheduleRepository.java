/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.repository;

import com.yowu.model.ClassSchedule;
import com.yowu.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class ClassScheduleRepository {

    public List<ClassSchedule> getAll() {
        String sql = "select * from tblClassSchedule";
        List<ClassSchedule> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RegistrationCourseRepository cr = new RegistrationCourseRepository();
                    ClassSchedule c = new ClassSchedule();
                    c.setId(rs.getInt("class_schedule_id"));
                    c.setRegistrationCourse(cr.detail(rs.getInt("registration_id")));
                    c.setDate(rs.getDate("class_date"));
                    c.setStartTime(rs.getTime("slot_start_time"));
                    c.setEndTime(rs.getTime("slot_end_time"));
                    c.setStatus(rs.getInt("class_status"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ClassSchedule detail(int id) {
        String sql = "select * from tblClassSchedule where class_schedule_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RegistrationCourseRepository cr = new RegistrationCourseRepository();
                    ClassSchedule c = new ClassSchedule();
                    c.setId(rs.getInt("class_schedule_id"));
                    c.setRegistrationCourse(cr.detail(rs.getInt("registration_id")));
                    c.setDate(rs.getDate("class_date"));
                    c.setStartTime(rs.getTime("slot_start_time"));
                    c.setEndTime(rs.getTime("slot_end_time"));
                    c.setStatus(rs.getInt("class_status"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(ClassSchedule classSchedule) {
        String sql = "INSERT INTO tblClassSchedule (registration_id, class_date, slot_start_time, slot_end_time, class_status) VALUES (?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, classSchedule.getRegistrationCourse().getId());
            stmt.setDate(2, classSchedule.getDate());
            stmt.setTime(3, classSchedule.getStartTime());
            stmt.setTime(4, classSchedule.getEndTime());
            stmt.setInt(5, classSchedule.getStatus());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(ClassSchedule classSchedule) {
        String sql = "UPDATE tblClassSchedule SET registration_id = ?, class_date = ?, slot_start_time = ?, slot_end_time = ?, class_status = ? WHERE class_schedule_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, classSchedule.getRegistrationCourse().getId());
            stmt.setDate(2, classSchedule.getDate());
            stmt.setTime(3, classSchedule.getStartTime());
            stmt.setTime(4, classSchedule.getEndTime());
            stmt.setInt(5, classSchedule.getStatus());
            stmt.setInt(6, classSchedule.getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "UPDATE tblClassSchedule SET class_status = 0 WHERE class_schedule_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }
}
