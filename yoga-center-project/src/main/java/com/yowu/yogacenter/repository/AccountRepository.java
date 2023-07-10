/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Role;
import com.yowu.yogacenter.util.DBHelpler;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class AccountRepository {
    
    private final String LOGIN_ACCOUNT = "SELECT * from tblAccount where ( account_email =? AND account_password =? )";
    private final String CREATE_ACCOUNT = "INSERT INTO tblAccount ("
            + "account_img, account_name, account_password, account_email, "
            + "account_phone, account_is_active, role_id, social_id) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SEARCH_ACCOUNT = "select * from tblAccount where account_id=? ";
    private final String GET_ALL = "select * from tblAccount";
    private final String UPDATE_ACCOUNT = "update tblAccount set account_name=? , "
            + "account_password=? ,account_img=? , account_email=? , account_phone=? , "
            + "account_is_active where account_id=? ";
    private final String DELETE_ACCOUNT = "update tblAccount set account_is_active=? where account_id=? ";
    private final String CHECK_DUPLICATE = "select account_email from tblAccount where account_email=?";
    private final String UPDATE_GENERAL = "update tblAccount set account_name=? , account_email=? ,account_phone=? where account_id=?";

    public List<Account> getAll() {

        List<Account> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(GET_ALL)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RoleRepository cr = new RoleRepository();
                    Account c = new Account();
                    c.setId(rs.getInt("account_id"));
                    c.setImg(rs.getString("account_img"));
                    c.setName(rs.getString("account_name"));
                    c.setPassword(rs.getString("account_password"));
                    c.setEmail(rs.getString("account_email"));
                    c.setPhone(rs.getString("account_phone"));
                    c.setIsActive(rs.getBoolean("account_is_active"));
                    c.setRole(cr.detail(rs.getInt("role_id")));
                    c.setSocialID(rs.getString("social_id"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Account checkLogin(String accountemail, String password) {
        
    try (PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(LOGIN_ACCOUNT)) {
        stmt.setString(1, accountemail);
        stmt.setString(2, password);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                RoleRepository cr = new RoleRepository();
                Account c = new Account();
                c.setId(rs.getInt("account_id"));
                c.setImg(rs.getString("account_img"));
                c.setName(rs.getString("account_name"));
                c.setPassword(password);
                c.setEmail(accountemail);
                c.setPhone(rs.getString("account_phone"));
                c.setIsActive(rs.getBoolean("account_is_active"));
                c.setRole(cr.detail(rs.getInt("role_id"))); 
                return c;
            }
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return null;
}


    public boolean createAccount(Account c) {
//private final String CREATE_ACCOUNT = "INSERT INTO tblAccount ("
//            + "account_img, account_name, account_password, account_email, "
//            + "account_phone, account_is_active, role_id, socialID) "
//            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(CREATE_ACCOUNT)) {
            stmt.setString(1, c.getImg());
            stmt.setString(2, c.getName());
            stmt.setString(3, c.getPassword());
            stmt.setString(4, c.getEmail());
            stmt.setString(5, c.getPhone());
            stmt.setBoolean(6, c.isIsActive());
            stmt.setInt(7, c.getRole().getId());
            stmt.setString(8, c.getSocialID());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public Account detail(int id) {

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(SEARCH_ACCOUNT)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RoleRepository cr = new RoleRepository();
                    Account c = new Account();
                    c.setId(rs.getInt("account_id"));
                    c.setImg(rs.getString("account_img"));
                    c.setName(rs.getString("account_name"));
                    c.setPassword(rs.getString("account_password"));
                    c.setEmail(rs.getString("account_email"));
                    c.setPhone(rs.getString("account_phone"));
                    c.setIsActive(rs.getBoolean("account_is_active"));
                    c.setRole(cr.detail(rs.getInt("role_id")));
                    c.setSocialID(rs.getString("social_id"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean update(Account c){
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(UPDATE_ACCOUNT)) {
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getPassword());
            stmt.setString(3, c.getImg());
            stmt.setString(4, c.getEmail());
            stmt.setString(5, c.getPhone());
            stmt.setBoolean(6, c.isIsActive());
            stmt.setInt(7, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }
    
    public boolean updateGeneral(Account c){
            
        int status = 0;
        try(PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(UPDATE_GENERAL)){
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
    
    public boolean delete(int id) {
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(DELETE_ACCOUNT)) {
            stmt.setBoolean(1, false);
            stmt.setInt(2, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }


    public boolean checkDuplicate(String accountEmail) {
    boolean status = false;
    try (PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(CHECK_DUPLICATE)) {
        stmt.setString(1, accountEmail);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                status = true;
            }
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return status;
}
public List<Account> searchName(String search) {
        String sql = "select * from tblAccount where account_name Like ? ";
        List<Account> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, search);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RoleRepository cr = new RoleRepository();
                    Account c = new Account();
                    c.setId(rs.getInt("account_id"));
                    c.setImg(rs.getString("account_img"));
                    c.setName(rs.getString("account_name"));
                    c.setPassword(rs.getString("account_password"));
                    c.setEmail(rs.getString("account_email"));
                    c.setPhone(rs.getString("account_phone"));
                    c.setIsActive(rs.getBoolean("account_is_active"));
                    c.setRole(cr.detail(rs.getInt("role_id")));
                    c.setSocialID(rs.getString("social_id"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
    AccountRepository cr = new AccountRepository();
    boolean isCreated = cr.checkDuplicate("anmobieblog@gmail.com");
    
    if (isCreated) {
        System.out.println("Trung email!");
    } else {
        System.out.println("Khong trung email.");
    }
}

// public static void main(String[] args) {
//    AccountRepository cr = new AccountRepository();
//    Role rl = new Role();
//    RoleRepository rr = new RoleRepository();
////    private final String CREATE_ACCOUNT = "INSERT INTO tblAccount ("
////            + "account_img, account_name, account_password, account_email, "
////            + "account_phone, account_is_active, role_id, socialID) "
////            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
////Account( String name, String password, String email, String phone, Role role, String socialID)
//    Account c = new Account("thang", "thang123", "thang1@gmail", null, rr.detail(Role.RoleList.TRAINEE.ordinal()),"12345");
//    System.out.println(c.getRole().getName());
//    boolean isCreated = cr.createAccount(c);
//     
//    if (isCreated) {
//        System.out.println("Tao tai khoan thanh cong!");
//    } else {
//        System.out.println("Không thể tạo tài khoản.");
//    }
//}

}
