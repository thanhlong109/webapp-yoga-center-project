/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.Month;
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
    
    public String getStudentDateJson(){
        String sql = "SELECT DATEPART(weekday, class_date) AS Weekday, Count(class_schedule_id) AS TotalStudent FROM tblClassSchedule GROUP BY DATEPART(weekday, class_date)";
        String data="";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                int[] arr = new int[7];
                while(rs.next()){
                   arr[rs.getInt("Weekday")-1] = rs.getInt("TotalStudent");
                }
                ObjectMapper mapper = new ObjectMapper();
                data = mapper.writeValueAsString(arr);
            }
        }catch (Exception e) {
            System.out.println(e);
        }
        return data;
    }
    
    public List<ClassSchedule> getScheduleBetweenDateByAccount(Date startDate,Date endDate, int accountId) {
        String sql = "select * from (select * from tblClassSchedule where class_date between ? and ?) cs join (select registration_id from tblRegistrationCourse where account_id=? and registration_status=1 ) rc on cs.registration_id=rc.registration_id order by class_date asc , slot_start_time asc ";
        List<ClassSchedule> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);
            stmt.setInt(3, accountId);
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
    
    public List<ClassSchedule> getScheduleByAccount(int accountId) {
        String sql = "select * from tblClassSchedule join tblRegistrationCourse on tblClassSchedule.registration_id = tblRegistrationCourse.registration_id where account_id=?";
        List<ClassSchedule> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
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
    
    public List<Time> getTimeScheduleBetweenDateByAccount(Date startDate,Date endDate, int accountId){
        String sql = "select cs.slot_start_time from (select slot_start_time, registration_id from tblClassSchedule where class_date between ? and ?) cs join (select registration_id from tblRegistrationCourse where account_id=? ) rc on cs.registration_id=rc.registration_id group by slot_start_time order by slot_start_time asc ";
        List<Time> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);
            stmt.setInt(3, accountId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    list.add(rs.getTime("slot_start_time"));
                }
            }
        }catch(Exception e){
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

    public boolean addClassSchedule(ClassSchedule classSchedule) {
        String sql = "INSERT INTO tblClassSchedule ( class_date, slot_start_time, slot_end_time, class_status, registration_id)"
                + " VALUES (?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, classSchedule.getDate());
            stmt.setTime(2, classSchedule.getStartTime());
            stmt.setTime(3, classSchedule.getEndTime());
            stmt.setInt(4, classSchedule.getStatus());
            stmt.setInt(5, classSchedule.getRegisId());
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

    public boolean update2(ClassSchedule classSchedule) {
        String sql = "UPDATE tblClassSchedule SET class_date = ?, slot_start_time = ?, slot_end_time = ?, class_status = ? WHERE class_schedule_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, classSchedule.getDate());
            stmt.setTime(2, classSchedule.getStartTime());
            stmt.setTime(3, classSchedule.getEndTime());
            stmt.setInt(4, classSchedule.getStatus());
            stmt.setInt(5, classSchedule.getId());

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
    
    public static void main(String[] args) {
        ClassScheduleRepository csr = new ClassScheduleRepository();
        System.out.println(csr.getScheduleByAccount(54));
    }
    
    public List<ClassSchedule> searchClassScheduleByRegistrationID(Date search) {
        String sql = "SELECT * FROM tblClassSchedule WHERE class_date LIKE ? ";
        List<ClassSchedule> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, search);
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

    public List<ClassSchedule> pagingClassSchedule(int offset, int next) {
        String sql = "select * from tblClassSchedule order by class_schedule_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<ClassSchedule> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
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

    public int count() {
        String sql = "select count(*) as num from tblClassSchedule ";
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

}
