/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.Category;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ACER
 */
public class CategoryRepository {

    public List<Category> getAll() {
        String sql = "select * from tblCategory";
        List<Category> list = new ArrayList<>();
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
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
    public List<Category> getAllActive(){
        String sql = "select * from tblCategory where category_is_active=1";
        List<Category> list = new ArrayList<>();
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    Category c = new Category();
                    c.setId(rs.getInt("category_id"));
                    c.setName(rs.getString("category_name"));
                    c.setIsActive(true);
                    list.add(c);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    public String getCategoryJson(){
        String sql = "select ct.category_name,COUNT(cs.category_id) as num from (select * from tblCourse  where course_is_active=1 ) cs join (select * from tblCategory where category_is_active=1) ct on cs.category_id=ct.category_id group by ct.category_name";
        String data="";
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                List<String> lst1 = new ArrayList<>();
                List<Integer> lst2 = new ArrayList<>();
                while(rs.next()){
                    lst1.add(rs.getString("category_name"));
                    lst2.add(rs.getInt("num"));
                }
                HashMap<String,Object> dataMap = new HashMap<>();
                ObjectMapper mapper = new ObjectMapper();
                dataMap.put("categoryName", lst1);
                dataMap.put("categoryNum", lst2);
                data=mapper.writeValueAsString(dataMap);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return data;
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

    public static void main(String[] args) {
        CategoryRepository cr = new CategoryRepository();
        System.out.println(cr.getAllActive().get(0).getName());
    }
}
