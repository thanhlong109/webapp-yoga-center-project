/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class RegistrationCourseRepository {

    public List<RegistrationCourse> getAll() {
        String sql = "select * from tblRegistrationCourse";
        List<RegistrationCourse> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    CourseScheduleRepository csr = new CourseScheduleRepository();
                    RegistrationCourse c = new RegistrationCourse();
                    c.setId(rs.getInt("registration_id"));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setRegistrationDate(rs.getDate("registration_date"));
                    c.setCourseSchedule(csr.detail(rs.getInt("course_schedule_id")));
                    c.setEndDate(rs.getDate("end_date"));
                    c.setCourseStatus(rs.getInt("course_status"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public RegistrationCourse detail(int id) {
        String sql = "select * from tblRegistrationCourse where registration_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    CourseScheduleRepository csr = new CourseScheduleRepository();
                    RegistrationCourse c = new RegistrationCourse();
                    c.setId(rs.getInt("registration_id"));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setRegistrationDate(rs.getDate("registration_date"));
                    c.setCourseSchedule(csr.detail(rs.getInt("course_schedule_id")));
                    c.setEndDate(rs.getDate("end_date"));
                    c.setCourseStatus(rs.getInt("course_status"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(RegistrationCourse registrationCourse) {
        String sql = "INSERT INTO tblRegistrationCourse (account_id, course_id, "
                + "registration_date, end_date, course_schedule_id, course_status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationCourse.getAccount().getId());
            stmt.setInt(2, registrationCourse.getCourse().getId());
            stmt.setDate(3, registrationCourse.getRegistrationDate());
            stmt.setDate(4, registrationCourse.getEndDate());
            stmt.setInt(5, registrationCourse.getCourseSchedule().getId());
            stmt.setInt(6, registrationCourse.getCourseStatus());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(RegistrationCourse registrationCourse) {
        String sql = "UPDATE tblRegistrationCourse SET account_id = ?, "
                + "course_id = ?, registration_date = ?, end_date = ?, "
                + "course_schedule_id = ?, course_status = ? "
                + "WHERE registration_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationCourse.getAccount().getId());
            stmt.setInt(2, registrationCourse.getCourse().getId());
            stmt.setDate(3, registrationCourse.getRegistrationDate());
            stmt.setDate(4, registrationCourse.getEndDate());
            stmt.setInt(5, registrationCourse.getCourseSchedule().getId());
            stmt.setInt(6, registrationCourse.getCourseStatus());
            stmt.setInt(7, registrationCourse.getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "UPDATE tblRegistrationCourse SET course_status = 0 "
                + "WHERE registration_id = ?";
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
