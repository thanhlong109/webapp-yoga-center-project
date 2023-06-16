/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
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
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
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
                + " bill_is_active, bill_value, bill_discount, bill_date) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getCourse().getId());
            stmt.setInt(2, c.getAccount().getId());
            stmt.setInt(3, c.getStatus());
            stmt.setBoolean(4, c.isIsActive());
            stmt.setFloat(5, c.getValue());
            stmt.setInt(6, c.getDiscount());
            stmt.setDate(7, c.getDate());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(Bill c) {
        String sql = "UPDATE tblBill SET course_id = ?, account_id = ?, "
                + "bill_status = ?, bill_is_active = ?, bill_value = ?, "
                + "bill_discount = ?, bill_date = ? WHERE bill_id = ?";
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

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
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
    public static void main(String[] args) {
        BillRepository b = new BillRepository();
        System.out.println(b.getByAccountID(2).get(0).getCourse().getTitle());
    }
}
