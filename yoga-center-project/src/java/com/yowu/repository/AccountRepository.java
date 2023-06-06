/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.repository;

import com.yowu.model.Account;
import com.yowu.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ThangNC
 */
public class AccountRepository {
    public List<Account> getAll(){
        String sql = "select * from tblAccount"; 
        List<Account> list = new ArrayList<>();
        
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    RoleRepository cr = new RoleRepository();
                    Account c = new Account();
                    c.setId(rs.getInt("account_id"));
                    c.setImg(rs.getString("account_img"));
                    c.setName(rs.getString("accoubnt_name"));
                    c.setPassword(rs.getString("account_password"));
                    c.setEmail(rs.getString("account_email"));
                    c.setPhone(rs.getString("account_phone"));
                    c.setIsActive(rs.getBoolean("account_is_active"));
                    c.setRole(cr.detail(rs.getInt("role_id")));
                    list.add(c);
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public Account detail(int id){
        String sql = "select * from tblAccount where account_id=? ";
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setInt(1, id);
            try(ResultSet rs = stmt.executeQuery()){
                while(rs.next()){
                    RoleRepository cr = new RoleRepository();
                    Account c = new Account();
                    c.setId(rs.getInt("account_id"));
                    c.setImg(rs.getString("account_img"));
                    c.setName(rs.getString("accoubnt_name"));
                    c.setPassword(rs.getString("account_password"));
                    c.setEmail(rs.getString("account_email"));
                    c.setPhone(rs.getString("account_phone"));
                    c.setIsActive(rs.getBoolean("account_is_active"));
                    c.setRole(cr.detail(rs.getInt("role_id")));
                    return c;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    
    public boolean update(Account c){
        String sql = "update tblAccount set account_name=? , account_password=? ,account_img=? , account_email=? , account_phone=? , account_is_active where account_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getPassword());
            stmt.setString(3, c.getImg());
            stmt.setString(4, c.getEmail());
            stmt.setString(5, c.getPhone());
            stmt.setBoolean(6, c.isIsActive());
            stmt.setInt(7, c.getId());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    public boolean updateGeneral(Account c){
        String sql = "update tblAccount set account_name=? , account_email=? ,account_phone=? where account_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getEmail());
            stmt.setString(3, c.getPhone());
            stmt.setInt(4, c.getId());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    
    public boolean updateImg(Account c){
        String sql = "update tblAccount set account_img=? where account_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, c.getImg());
            stmt.setInt(2, c.getId());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    
    public boolean updatePassword(Account c){
        String sql = "update tblAccount set account_password=? where account_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setString(1, c.getPassword());
            stmt.setInt(2, c.getId());
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    public boolean delete(int id){
         String sql = "update tblAccount set account_is_active=? where account_id=? ";
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)){
            stmt.setBoolean(1, false);
            stmt.setInt(2, id);
            status = stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status==1;
    }
    
    public static void main(String[] args) {
        CourseRepository cr = new CourseRepository();
        System.out.println(cr.delete(1));
    }
    
    
}
