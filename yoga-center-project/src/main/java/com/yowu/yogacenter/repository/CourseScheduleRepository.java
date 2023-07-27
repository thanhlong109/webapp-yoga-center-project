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
import java.sql.Time;
import java.sql.Timestamp;
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

    public List<CourseSchedule> getScheduleByIsActive(int IsActive) {
        String sql = "select * from tblCourseSchedule where is_active=?";

        List<CourseSchedule> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, IsActive);
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

    public boolean isSameSchedule(int courseScheduleId, int account_id) {
        CourseScheduleRepository csr = new CourseScheduleRepository();
        CourseSchedule cs = csr.detailByID(courseScheduleId);
        String sql = "SELECT * FROM ( SELECT * FROM tblRegistrationCourse WHERE account_id = ? AND registration_status = 1 AND course_status = 0" + RegistrationCourse.CourseStatus.INPROGRESS.ordinal()
                + ") rc JOIN tblCourseSchedule cs ON cs.course_schedule_id = rc.course_schedule_id WHERE ( "
                + "        ( start_time >= '" + cs.getStartTime() + "' AND start_time <= '" + cs.getEndTime() + "' AND end_time >= '" + cs.getEndTime() + "' ) "
                + "        OR ( end_time >= '" + cs.getStartTime() + "' AND end_time <= '" + cs.getEndTime() + "' AND start_time <= '" + cs.getStartTime() + "' )  )";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, account_id);

            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String dayOfWeek = rs.getString("day_of_week");
                    String[] part = dayOfWeek.split(",");
                    String courseDOW = cs.getDateOfWeek();
                    for (String p : part) {
                        if (courseDOW.contains(p)) {
                            return true;
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    

    public CourseSchedule detailByID(int id) {
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
    

    public CourseSchedule detail(int id) {
        String sql = "select * from tblCourseSchedule where course_id=? ";
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

    public CourseSchedule detailByScheduleID(int id) {
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
                CourseSchedule c = new CourseSchedule();

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

    public boolean update2(CourseSchedule c) {
        String sql = "UPDATE tblCourseSchedule SET day_of_week = ?, "
                + "start_time = ?, end_time = ?, is_active = ? "
                + "WHERE course_schedule_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getDateOfWeek());
            stmt.setTime(2, c.getStartTime());
            stmt.setTime(3, c.getEndTime());
            stmt.setBoolean(4, c.isIsActive());
            stmt.setInt(5, c.getId());

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

    public List<CourseSchedule> searchCourseSchedule(String search) {
        String sql = "SELECT * FROM tblCourseSchedule WHERE course_id Like ? ";
        List<CourseSchedule> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, search);
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
    
        public List<CourseSchedule> pagingCourseSchedule(int offset, int next) {
        String sql = "select * from tblCourseSchedule order by course_schedule_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<CourseSchedule> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
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

    public int count() {
        String sql = "select count(*) as num from tblCourseSchedule ";
        int count = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("num");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }
    
    
    public static void main(String[] args) {
        CourseScheduleRepository cs = new CourseScheduleRepository();
        System.out.println(cs.isSameSchedule(27, 2));

    }

}
