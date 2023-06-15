/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Permission;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class PermissionRepository {

    public List<Permission> getAll() {
        String sql = "select * from tblPermission";
        List<Permission> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Permission c = new Permission();
                    c.setId(rs.getInt("permission_id"));
                    c.setName(rs.getString("permission_name"));
                    c.setDescription(rs.getString("permission_description"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Permission detail(int id) {
        String sql = "select * from tblPermission where permission_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Permission c = new Permission();
                    c.setId(rs.getInt("permission_id"));
                    c.setName(rs.getString("permission_name"));
                    c.setDescription(rs.getString("permission_description"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(Permission permission) {
        String sql = "INSERT INTO tblPermission (permission_name, "
                + "permission_description) VALUES (?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, permission.getName());
            stmt.setString(2, permission.getDescription());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(Permission permission) {
        String sql = "UPDATE tblPermission SET permission_name = ?, "
                + "permission_description = ? WHERE permission_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, permission.getName());
            stmt.setString(2, permission.getDescription());
            stmt.setInt(3, permission.getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }
}
