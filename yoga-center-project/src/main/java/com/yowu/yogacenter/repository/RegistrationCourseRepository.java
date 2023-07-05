/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
    
    public int addRegis(RegistrationCourse registrationCourse) {
    String sql = "INSERT INTO tblRegistrationCourse (account_id, course_id, "
            + "registration_date, end_date, course_schedule_id, course_status, "
            + "registration_status) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";
    int status = 0;
    int lastInsertId = -1;

    try (PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        stmt.setInt(1, registrationCourse.getAccount().getId());
        stmt.setInt(2, registrationCourse.getCourse().getId());
        stmt.setDate(3, registrationCourse.getRegistrationDate());
        stmt.setDate(4, registrationCourse.getEndDate());
        stmt.setInt(5, registrationCourse.getCourseSchedule().getId());
        stmt.setInt(6, registrationCourse.getCourseStatus());
        stmt.setBoolean(7, registrationCourse.getRegistrationtatus());
        status = stmt.executeUpdate();

        // Retrieve the generated keys
        ResultSet generatedKeys = stmt.getGeneratedKeys();
        if (generatedKeys.next()) {
            lastInsertId = generatedKeys.getInt(1);
        }
    } catch (Exception e) {
        System.out.println(e);
    }

    return lastInsertId;
}

    
    public RegistrationCourse getRegisIdByCourseIdAndAccountID(int accountId, int courseId, boolean regisStatus) {
        String sql = "select * from tblRegistrationCourse "
                + "WHERE account_id = ? AND course_id = ? AND registration_status = ? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, courseId);
            stmt.setBoolean(3, regisStatus);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    CourseScheduleRepository cs = new CourseScheduleRepository();
                    RegistrationCourse c = new RegistrationCourse();
                    c.setId(rs.getInt("registration_id"));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourseSchedule(cs.detail(rs.getInt("course_schedule_id")));
                    c.setRegistrationDate(rs.getDate("registration_date"));
                    c.setEndDate(rs.getDate("end_date"));
                    c.setCourseStatus(rs.getInt("course_status"));
                    c.setRegistrationtatus(rs.getBoolean("registration_status"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public RegistrationCourse getRegisByCourseIdAndAccountID(int accountId, int courseId) {
        String sql = "select * from tblRegistrationCourse "
                + "WHERE account_id = ? AND course_id = ? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, courseId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    CourseScheduleRepository cs = new CourseScheduleRepository();
                    RegistrationCourse c = new RegistrationCourse();
                    c.setId(rs.getInt("registration_id"));
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setCourseSchedule(cs.detail(rs.getInt("course_schedule_id")));
                    c.setRegistrationDate(rs.getDate("registration_date"));
                    c.setEndDate(rs.getDate("end_date"));
                    c.setCourseStatus(rs.getInt("course_status"));
                    c.setRegistrationtatus(rs.getBoolean("registration_status"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<RegistrationCourse> getCoursesByAccountIDAndStatus(int accountId,int status){
        String sql = "select * from tblRegistrationCourse where account_id=? and course_status=? and registration_status=1";
        List<RegistrationCourse> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, status);
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
                    c.setRegistrationtatus(true);
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    

    public int getStudentEnrolled(int courseId){
        String sql = "select count(*) as num from tblRegistrationCourse where course_id=? and registration_status=1";
        int num = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    num = rs.getInt("num");
                    return num;
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return num;
    }

    public List<RegistrationCourse> getCoursesByAccountID(int accountId){
        String sql = "select * from tblRegistrationCourse where account_id=? and registration_status=1";
        List<RegistrationCourse> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
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
                    c.setRegistrationtatus(true);
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
                    c.setRegistrationtatus(rs.getBoolean("registration_status"));
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

    public boolean addRegistration(RegistrationCourse registrationCourse) {
        String sql = "INSERT INTO tblRegistrationCourse (account_id, course_id, "
                + "registration_date, end_date, course_schedule_id, course_status, "
                + "registration_status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationCourse.getAccount().getId());
            stmt.setInt(2, registrationCourse.getCourse().getId());
            stmt.setDate(3, registrationCourse.getRegistrationDate());
            stmt.setDate(4, registrationCourse.getEndDate());
            stmt.setInt(5, registrationCourse.getCourseSchedule().getId());
            stmt.setInt(6, registrationCourse.getCourseStatus());
            stmt.setBoolean(7, registrationCourse.getRegistrationtatus());
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
                + "WHERE registration_id = ?, registration_status = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationCourse.getAccount().getId());
            stmt.setInt(2, registrationCourse.getCourse().getId());
            stmt.setDate(3, registrationCourse.getRegistrationDate());
            stmt.setDate(4, registrationCourse.getEndDate());
            stmt.setInt(5, registrationCourse.getCourseSchedule().getId());
            stmt.setInt(6, registrationCourse.getCourseStatus());
            stmt.setInt(7, registrationCourse.getId());
            stmt.setBoolean(8, registrationCourse.getRegistrationtatus());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean updateStatus(boolean status, String accountId, int courseId) {
        String sql = "UPDATE tblRegistrationCourse SET registration_status = ? "
                + "WHERE account_id = ? AND course_id = ? ";
        boolean updateStatus = false;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setBoolean(1, status);
            stmt.setString(2, accountId);
            stmt.setInt(3, courseId);
            updateStatus = stmt.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }

        return updateStatus;
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
