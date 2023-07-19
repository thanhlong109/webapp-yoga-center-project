/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class MembershipRepository {

    public List<Membership> getAll() {
        String sql = "select * from tblMembership";
        List<Membership> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Membership c = new Membership();
                    c.setId(rs.getInt("membership_id"));
                    c.setName(rs.getString("membership_name"));
                    c.setDuration(rs.getInt("membership_duration"));
                    c.setPrice(rs.getFloat("membership_price"));
                    c.setDescription(rs.getString("membership_description"));
                    c.setDiscount(rs.getInt("membership_discours"));
                    c.setIsActive(rs.getBoolean("membership_is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Membership> getAllMembershipIsActive() {
        String sql = "select * from tblMembership where membership_is_active = 1";
        List<Membership> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Membership c = new Membership();
                    c.setId(rs.getInt("membership_id"));
                    c.setName(rs.getString("membership_name"));
                    c.setDuration(rs.getInt("membership_duration"));
                    c.setPrice(rs.getFloat("membership_price"));
                    c.setDescription(rs.getString("membership_description"));
                    c.setDiscount(rs.getInt("membership_discours"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Membership detail(int id) {
        String sql = "select * from tblMembership where membership_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Membership c = new Membership();
                    c.setId(rs.getInt("membership_id"));
                    c.setName(rs.getString("membership_name"));
                    c.setDuration(rs.getInt("membership_duration"));
                    c.setPrice(rs.getFloat("membership_price"));
                    c.setDescription(rs.getString("membership_description"));
                    c.setDiscount(rs.getInt("membership_discours"));
                    c.setIsActive(rs.getBoolean("membership_is_active"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Membership discountByAccountID(int id) {
        String sql = "select * from tblRegistrationMembership rm "
                + "join tblMembership m on m.membership_id = rm.membership_id "
                + "where rm.account_id = ?";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Membership c = new Membership();
                    c.setId(rs.getInt("membership_id"));
                    c.setName(rs.getString("membership_name"));
                    c.setDuration(rs.getInt("membership_duration"));
                    c.setPrice(rs.getFloat("membership_price"));
                    c.setDescription(rs.getString("membership_description"));
                    c.setDiscount(rs.getInt("membership_discours"));
                    c.setIsActive(rs.getBoolean("membership_is_active"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public boolean add(Membership c) {
        String sql = "INSERT INTO tblMembership (membership_name, "
                + "membership_duration, membership_price, membership_description, "
                + "membership_discours, membership_is_active) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getName());
            stmt.setInt(2, c.getDuration());
            stmt.setFloat(3, c.getPrice());
            stmt.setString(4, c.getDescription());
            stmt.setInt(5, c.getDiscount());
            stmt.setBoolean(6, c.isIsActive());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "UPDATE tblMembership SET membership_is_active = 0 "
                + "WHERE membership_id = ?";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean update(Membership c) {
        String sql = "UPDATE tblMembership SET membership_name = ?, "
                + "membership_duration = ?, membership_price = ?, "
                + "membership_description = ?, membership_discours = ?, "
                + "membership_is_active = ? WHERE membership_id = ?";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getName());
            stmt.setInt(2, c.getDuration());
            stmt.setFloat(3, c.getPrice());
            stmt.setString(4, c.getDescription());
            stmt.setInt(5, c.getDiscount());
            stmt.setBoolean(6, c.isIsActive());
            stmt.setInt(7, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public static void main(String[] args) {
        MembershipRepository repository = new MembershipRepository();
        int membershipId = 4; // ID của đối tượng Membership cần lấy thông tin

        Membership membership = repository.detail(membershipId);

        if (membership != null) {
            // Hiển thị thông tin chi tiết của đối tượng Membership
            System.out.println("Membership ID: " + membership.getId());
            System.out.println("Membership Name: " + membership.getName());
            System.out.println("Membership Duration: " + membership.getDuration());
            System.out.println("Membership Price: " + membership.getPrice());
            System.out.println("Membership Description: " + membership.getDescription());
            System.out.println("Membership Discount: " + membership.getDiscount());
            System.out.println("Membership Is Active: " + membership.isIsActive());
        } else {
            System.out.println("Membership not found!");
        }
    }

    public List<Membership> searchName(String search) {
        String sql = "select * from tblMembership where membership_name Like ? ";
        List<Membership> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, search);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Membership c = new Membership();
                    c.setId(rs.getInt("membership_id"));
                    c.setName(rs.getString("membership_name"));
                    c.setDuration(rs.getInt("membership_duration"));
                    c.setPrice(rs.getFloat("membership_price"));
                    c.setDescription(rs.getString("membership_description"));
                    c.setDiscount(rs.getInt("membership_discours"));
                    c.setIsActive(rs.getBoolean("membership_is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
   


     public boolean checkDuplicate(String name) {
        String sql = "select membership_name from tblMembership where membership_is_active = 1 and membership_name Like ? ";
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
          public boolean checkDuplicateUpdate(String name) {
        String sql = "SELECT a.membership_name FROM (SELECT membership_name FROM tblMembership where membership_is_active=1 and membership_name not like ?) a  where a.membership_name like ?";
        boolean status = false;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, name);
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
     public List<Membership> getAllFollowPagination(int offset, int next) {
        String sql = "select * from tblMembership order by membership_id desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<Membership> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Membership c = new Membership();
                    c.setId(rs.getInt("membership_id"));
                    c.setName(rs.getString("membership_name"));
                    c.setDuration(rs.getInt("membership_duration"));
                    c.setPrice(rs.getFloat("membership_price"));
                    c.setDescription(rs.getString("membership_description"));
                    c.setDiscount(rs.getInt("membership_discours"));
                    c.setIsActive(rs.getBoolean("membership_is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int count() {
        String sql = "select count(*) as num from tblMembership ";
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
