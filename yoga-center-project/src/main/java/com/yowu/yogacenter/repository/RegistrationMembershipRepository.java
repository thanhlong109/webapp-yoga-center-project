/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

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
                    c.setExpirationDate(rs.getDate("expiration_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public RegistrationMembership detail(int id) {
        String sql = "select * from tblRegistrationMembership where membership_id=? ";
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
                    c.setExpirationDate(rs.getDate("expiration_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(RegistrationMembership registrationMembership) {
        String sql = "INSERT INTO tblRegistrationMembership "
                + "(membership_id, account_id, registration_date, expiration_date)"
                + "VALUES (?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationMembership.getMembership().getId());
            stmt.setInt(2, registrationMembership.getAccount().getId());
            stmt.setDate(3, registrationMembership.getRegistrationDate());
            stmt.setDate(4, registrationMembership.getExpirationDate());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(RegistrationMembership registrationMembership) {
        String sql = "UPDATE tblRegistrationMembership SET account_id = ?, "
                + "registration_date = ?, expiration_date = ? "
                + "WHERE membership_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, registrationMembership.getAccount().getId());
            stmt.setDate(2, registrationMembership.getRegistrationDate());
            stmt.setDate(3, registrationMembership.getExpirationDate());
            stmt.setInt(4, registrationMembership.getMembership().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }
}
