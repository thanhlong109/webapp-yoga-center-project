/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class BillRepository {

    public List<Bill> getAll() {
        String sql = "select * from tblBill";
        List<Bill> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public String getBillJson(){
        String sql = "select bill_date, SUM(bill_value)as bill_value from tblBill where bill_status="+Bill.BillStatus.COMPLETED.ordinal()+" group by  bill_date order by bill_date asc";
        List<List<Object>> list = new ArrayList();
        String data = "";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    List<Object> row = new ArrayList<>();
                    long date = rs.getDate("bill_date").getTime();
                    row.add(date);
                    row.add(rs.getFloat("bill_value"));
                    list.add(row);
                }
                ObjectMapper mapper = new ObjectMapper();
                data = mapper.writeValueAsString(list);
            }
        }catch (Exception e) {
            System.out.println(e);
        }
        return data;
    }
        
    public List<Bill> getByAccountID(int accountId) {
        String sql = "select * from tblBill where account_id=?";
        List<Bill> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Bill getCourseIdByOrdercode(String ordercode) {
        String sql = "select * from tblBill where order_code=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, ordercode);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Bill getAllByAccountIdAndCourseID(String accountId, int courseId ) {
        String sql = "select * from tblBill WHERE account_id = ? AND course_id = ? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, accountId);
            stmt.setInt(2, courseId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Bill getAllByAccountIdAndCourseID(int accountId, int courseId ) {
        String sql = "select * from tblBill WHERE account_id = ? AND course_id = ? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, courseId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Bill getBillRecentByAccountIdAndCourseID(int accountId, int courseId ) {
        String sql = "select * from tblBill WHERE account_id = ? AND course_id = ? order by bill_id DESC";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, courseId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateStatus(String ordercode, String date, int status) throws ParseException {
        boolean check = false;
        LocalDateTime sqlDate = null;
        if (!date.isEmpty()) {
             DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            sqlDate = LocalDateTime.parse(date, formatter);
        }
        
        String sql = "UPDATE tblBill SET bill_status = ? , payment_date =? WHERE order_code = ?";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setObject(2, sqlDate);
            stmt.setString(3, ordercode);
            check = stmt.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }
        public boolean updateStatus(int id, int status) {
        String sql = "UPDATE tblBill SET bill_status = ? WHERE bill_id = ?";
        int updateStatus = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setInt(2, id);

            updateStatus = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return updateStatus == 1;
    }

    public Bill detail(int id) {
        String sql = "select * from tblBill where bill_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(Bill c) {
        String sql = "INSERT INTO tblBill (course_id, account_id, bill_status,"
                + " bill_is_active, bill_value, bill_discount, bill_date, "
                + "order_code, payment_method) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getCourse().getId());
            stmt.setInt(2, c.getAccount().getId());
            stmt.setInt(3, c.getStatus());
            stmt.setBoolean(4, c.isIsActive());
            stmt.setFloat(5, c.getValue());
            stmt.setInt(6, c.getDiscount());
            stmt.setDate(7, c.getDate());
            stmt.setString(8, c.getOrdercode());
            stmt.setString(9, c.getMethod());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(Bill c) {
        String sql = "UPDATE tblBill SET course_id = ?, account_id = ?, "
                + "bill_status = ?, bill_is_active = ?, bill_value = ?, "
                + "bill_discount = ?, bill_date = ?, order_code = ?, payment_method = ?, paymenmt_date =? "
                + "WHERE bill_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getCourse().getId());
            stmt.setInt(2, c.getAccount().getId());
            stmt.setInt(3, c.getStatus());
            stmt.setBoolean(4, c.isIsActive());
            stmt.setFloat(5, c.getValue());
            stmt.setInt(6, c.getDiscount());
            stmt.setDate(7, c.getDate());
            stmt.setInt(8, c.getId());
            stmt.setString(9, c.getOrdercode());
            stmt.setString(10, c.getMethod());
            stmt.setDate(11, c.getPaymentDate());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }



    public boolean delete(int id) {
        String sql = "UPDATE tblBill SET bill_is_active = 0 WHERE bill_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }


    public List<Bill> searchId(int search) {
        String sql = "select * from tblBill where bill_id=? ";
        List<Bill> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, search);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    Bill c = new Bill();
                    c.setCourse(cr.detail(rs.getInt("course_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        BillRepository b = new BillRepository();
        
        System.out.println(b.getBillRecentByAccountIdAndCourseID(2, 1).getId());
    }

}
