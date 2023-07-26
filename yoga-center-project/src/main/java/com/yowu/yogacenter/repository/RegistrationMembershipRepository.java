/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class RegistrationMembershipRepository {

    public List<RegistrationMembership> getAll() {
        String sql = "select * from tblRegistrationMembership";
        List<RegistrationMembership> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    MembershipRepository mb = new MembershipRepository();
                    RegistrationMembership c = new RegistrationMembership();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setRegistrationDate(rs.getDate("registration_date"));
                    c.setExpirationDate(rs.getDate("expriration_date"));
                    c.setRegistrationtatus(rs.getBoolean("registration_status"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public RegistrationMembership getRecenRegisByMembershipIdAndAccountId(int membershipId, int accountId){
        String sql = "select * from tblRegistrationMembership "
                + "WHERE membership_id = ? AND account_id = ? order by membership_id desc";
        try (PreparedStatement stm = DBHelpler.makeConnection().prepareStatement(sql)){
            stm.setInt(1, membershipId);
            stm.setInt(2, accountId);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    AccountRepository acc = new AccountRepository();
                    MembershipRepository mem = new MembershipRepository();
                    RegistrationMembership rm = new RegistrationMembership();
                    rm.setAccount(acc.detail(rs.getInt("account_id")));
                    rm.setMembership(mem.detail(rs.getInt("membership_id")));
                    rm.setRegistrationDate(rs.getDate("registration_date"));
                    rm.setExpirationDate(rs.getDate("expriration_date"));
                    rm.setRegistrationtatus(rs.getBoolean("registration_status"));
                    return rm;
                }
            }
        } catch (Exception e) {
             System.out.println(e);
        }
        return null;
    }

    public RegistrationMembership detail(int id) {
        String sql = "select * from tblRegistrationMembership where account_id=? and registration_status = 1";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    MembershipRepository mb = new MembershipRepository();
                    RegistrationMembership c = new RegistrationMembership();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setRegistrationDate(rs.getDate("registration_date"));
                    c.setExpirationDate(rs.getDate("expriration_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public RegistrationMembership detailAndStatus(int id) {
        String sql = "select * from tblRegistrationMembership where account_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    MembershipRepository mb = new MembershipRepository();
                    RegistrationMembership c = new RegistrationMembership();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setRegistrationDate(rs.getDate("registration_date"));
                    c.setExpirationDate(rs.getDate("expriration_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public boolean updateStatusMem(boolean status, String accountId, int memId) {
        String sql = "UPDATE tblRegistrationMembership SET registration_status = ? "
                + "WHERE account_id = ? AND membership_id = ? ";
        boolean updateStatus = false;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setBoolean(1, status);
            stmt.setString(2, accountId);
            stmt.setInt(3, memId);
            updateStatus = stmt.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }

        return updateStatus;
    }
    public boolean updateStatusMemById(boolean status, int memId) {
        String sql = "UPDATE tblRegistrationMembership SET registration_status = ? "
                + "WHERE membership_id = ? ";
        boolean updateStatus = false;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setBoolean(1, status);
           
            stmt.setInt(2, memId);
            updateStatus = stmt.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }

        return updateStatus;
    }

    public boolean add(RegistrationMembership registrationMembership) {
        String sql = "INSERT INTO tblRegistrationMembership "
                + "(membership_id, account_id, registration_date, expriration_date, registration_status)"
                + "VALUES (?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationMembership.getMembership().getId());
            stmt.setInt(2, registrationMembership.getAccount().getId());
            stmt.setObject(3, registrationMembership.getRegisDate());
            stmt.setObject(4, registrationMembership.getExpirDate());
            stmt.setBoolean(5, registrationMembership.getRegistrationtatus());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(RegistrationMembership registrationMembership) {
        String sql = "UPDATE tblRegistrationMembership SET account_id = ?, "
                + "registration_date = ?, expriration_date = ?, registration_status = ? "
                + "WHERE membership_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationMembership.getAccount().getId());
            stmt.setDate(2, registrationMembership.getRegistrationDate());
            stmt.setDate(3, registrationMembership.getExpirationDate());
            stmt.setBoolean(4, registrationMembership.getRegistrationtatus());
            stmt.setInt(5, registrationMembership.getMembership().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }
    
    public boolean updateByAccoutID(RegistrationMembership registrationMembership) {
        String sql = "UPDATE tblRegistrationMembership SET membership_id = ?, "
                + "registration_date = ?, expriration_date = ?, registration_status = ? "
                + "WHERE account_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(5, registrationMembership.getAccount().getId());
            stmt.setDate(2, registrationMembership.getRegistrationDate());
            stmt.setDate(3, registrationMembership.getExpirationDate());
            stmt.setBoolean(4, registrationMembership.getRegistrationtatus());
            stmt.setInt(1, registrationMembership.getMembership().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }
    
    public static void main(String[] args) {
    RegistrationMembershipRepository repository = new RegistrationMembershipRepository();
    int account = 2;

    RegistrationMembership registrationMembership = repository.detail(account);

        System.out.println(registrationMembership.getExpirDate());
}

}
