/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Category;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER
 */
public class CategoryRepository {

    public List<Category> getAll() {
        String sql = "select * from tblCategory";
        List<Category> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Category c = new Category();
                    c.setId(rs.getInt("category_id"));
                    c.setName(rs.getString("category_name"));
                    c.setIsActive(rs.getBoolean("category_is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Category detail(int id) {
        String sql = "select * from tblCategory where category_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Category c = new Category();
                    c.setId(rs.getInt("category_id"));
                    c.setName(rs.getString("category_name"));
                    c.setIsActive(rs.getBoolean("category_is_active"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean update(Category c) {
        String sql = "update tblCategory set category_name=? , category_is_active=? where category_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getName());
            stmt.setBoolean(2, c.isIsActive());
            stmt.setInt(3, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "update tblCategory set category_is_active=? where category_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setBoolean(1, false);
            stmt.setInt(2, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean update(int id, String name) {
        String sql = "update tblCategory set category_name=? where category_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setInt(2, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public void add(String name, boolean isActive) {
        String sql = "INSERT INTO tblCategory (category_name, category_is_active) VALUES (?, ?)";

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setBoolean(2, isActive);
            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Category> searchName(String search) {
        String sql = "select * from tblCategory where category_name Like ? ";
        List<Category> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, search);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Category c = new Category();
                    c.setId(rs.getInt("category_id"));
                    c.setName(rs.getString("category_name"));
                    c.setIsActive(rs.getBoolean("category_is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkDuplicate(String name) {
        String sql = "select category_name from tblCategory where category_name Like ? ";
        boolean status = false;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, name);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    status = true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
     public List<Category> getAllFollowPagination(int offset, int next) {
        String sql = "select * from tblCategory order by category_id desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<Category> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                     Category c = new Category();
                    c.setId(rs.getInt("category_id"));
                    c.setName(rs.getString("category_name"));
                    c.setIsActive(rs.getBoolean("category_is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int count() {
        String sql = "select count(*) as num from tblCategory ";
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
        CategoryRepository cr = new CategoryRepository();
        System.out.println(cr.getAll().get(0).getName());
    }
}
