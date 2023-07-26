/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Role;
import com.yowu.yogacenter.util.DBHelpler;
import java.io.Serializable;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class AccountRepository {

    private final String LOGIN_ACCOUNT = "SELECT * from tblAccount where ( account_email =? AND account_password =? )";
    private final String CHECK_DUPLICATE_GOOGLE_LOGIN = "SELECT * FROM tblAccount WHERE account_email = ? OR social_id = ?";
    private final String CREATE_ACCOUNT = "INSERT INTO tblAccount ("
            + "account_img, account_name, account_password, account_email, "
            + "account_phone, account_is_active, role_id, social_id, biography) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SEARCH_ACCOUNT = "select * from tblAccount where account_id=? ";
    private final String GET_ALL = "select * from tblAccount";
    private final String UPDATE_ACCOUNT = "update tblAccount set account_name=? , "
            + "account_password=? ,account_img=? , account_email=? , account_phone=?  ,"
            + "account_is_active= ?, biography=? where account_id=? ";
    private final String DELETE_ACCOUNT = "update tblAccount set account_is_active =? where account_id=? ";
    private final String CHECK_DUPLICATE = "select account_email from tblAccount where account_email =?";
    private final String UPDATE_GENERAL = "update tblAccount set account_name=? , account_email=? ,account_phone=?, biography=? where account_id=?";

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
                    c.setCreateDate(rs.getDate("create_date"));
                    c.setBiography(rs.getString("biography"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int getTotalAccount(){
        String sql = "select count(*) as num from tblAccount where account_is_active=1";
        int total = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if(rs.next()){
                    total = rs.getInt("num");
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return total;
    }
    
    public int getTotalAccount(Date to){
        String sql = "select count(*) as num from tblAccount where account_is_active=1 and create_date<=?";
        int total = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, to);
            try ( ResultSet rs = stmt.executeQuery()) {
                if(rs.next()){
                    total = rs.getInt("num");
                }
            }
        }catch(Exception e){
            System.out.println("getTotalAccount: "+e);
        }
        return total;
    }
    
    public List<Account> getIntructorList(){
        String sql ="select * from (select account_id from tblCourse where course_is_active=1 group by account_id )c join tblAccount a on (c.account_id=a.account_id and a.account_is_active=1)";
         List<Account> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
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
                    c.setCreateDate(rs.getDate("create_date"));
                    c.setBiography(rs.getString("biography"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Account checkLogin(String accountemail, String password) {

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(LOGIN_ACCOUNT)) {
            stmt.setString(1, accountemail);
            stmt.setString(2, password);
            try ( ResultSet rs = stmt.executeQuery()) {
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
                    c.setSocialID(rs.getString("social_id"));
                    c.setBiography(rs.getString("biography"));
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
            stmt.setString(9, c.getBiography());
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
                    c.setCreateDate(rs.getDate("create_date"));
                    c.setBiography(rs.getString("biography"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }


    public boolean update(Account c) {
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(UPDATE_ACCOUNT)) {
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getPassword());
            stmt.setString(3, c.getImg());
            stmt.setString(4, c.getEmail());
            stmt.setString(5, c.getPhone());
            stmt.setBoolean(6, c.isIsActive());
            stmt.setString(7, c.getBiography());
            stmt.setInt(8, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean updateGeneral(Account c) {

        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(UPDATE_GENERAL)) {
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getEmail());
            stmt.setString(3, c.getPhone());
            stmt.setString(4, c.getBiography());
            stmt.setInt(5, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean updateImg(Account c) {
        String sql = "update tblAccount set account_img=? where account_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getImg());
            stmt.setInt(2, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean updatePassword(Account c) {
        String sql = "update tblAccount set account_password=? where account_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getPassword());
            stmt.setInt(2, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
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
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(CHECK_DUPLICATE)) {
            stmt.setString(1, accountEmail);
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

    public Account checkLoginGoogle(String accountemail, String socialID) {

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(CHECK_DUPLICATE_GOOGLE_LOGIN)) {
            stmt.setString(1, accountemail);
            stmt.setString(2, socialID);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    RoleRepository cr = new RoleRepository();
                    Account c = new Account();
                    c.setId(rs.getInt("account_id"));
                    c.setImg(rs.getString("account_img"));
                    c.setName(rs.getString("account_name"));
                    c.setPassword(rs.getString("account_password"));
                    c.setEmail(accountemail);
                    c.setPhone(rs.getString("account_phone"));
                    c.setIsActive(rs.getBoolean("account_is_active"));
                    c.setRole(cr.detail(rs.getInt("role_id")));
                    c.setSocialID(socialID);
                    c.setBiography(rs.getString("biography"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
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
                    c.setCreateDate(rs.getDate("create_date"));
                    c.setBiography(rs.getString("biography"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

public String getAccountDateJson(int year){
    String sql = "SELECT DATEPART(MONTH, create_date) AS [Month], COUNT(account_id) AS [total] FROM tblAccount where role_id=? and YEAR(create_date)=? GROUP BY DATEPART(MONTH, [create_date]) ORDER BY [Month]";
    String data="";
    try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, Role.RoleList.TRAINEE.ordinal());
            stmt.setInt(2, year);
             try ( ResultSet rs = stmt.executeQuery()) {
                 int[] array;// at index 0 defind maximum month to display
                 LocalDate now = LocalDate.now();
                 if(now.getYear()==year){
                     int month = now.getMonthValue();
                     array = new int[month];
                 }else{
                     array = new int[12];
                 }
                 while(rs.next()){
                     array[rs.getInt("Month")-1]=rs.getInt("total");
                 }
                 ObjectMapper objMapper = new ObjectMapper();
                 data = objMapper.writeValueAsString(array);
             }
     }catch (Exception e) {
        System.out.println("getAccountDateJson:"+e);
    }
     return data;
}


public List<Integer> getYearList(){
    String sql = "select YEAR(create_date) as year from tblAccount where role_id=? group by YEAR(create_date) order by YEAR(create_date) desc";
    List<Integer> list = new ArrayList<>();
     try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, Role.RoleList.TRAINEE.ordinal());
             try ( ResultSet rs = stmt.executeQuery()) {
                 while(rs.next()){
                     list.add(rs.getInt("year"));
                 }
             }
     }catch (Exception e) {
        System.out.println("getYearList:"+e);
    }
    
     
     return list;
}

    public static void main(String[] args) {
        AccountRepository accountRepository = new AccountRepository();
        Account c = accountRepository.detail(2);
        c.setBiography("ahihi");
        accountRepository.updateGeneral(c);
        c = accountRepository.detail(2);
        System.out.println(c.getBiography());
        System.out.println(accountRepository.checkDuplicate("daniel.wilson@example.com"));

    }


    public List<Account> getAllFollowPagination(int offset, int next) {
        String sql = "select * from tblAccount order by account_id desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<Account> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
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

    public int count() {
        String sql = "select count(*) as num from tblAccount ";
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
