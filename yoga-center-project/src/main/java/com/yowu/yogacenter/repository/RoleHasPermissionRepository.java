/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Role;
import com.yowu.yogacenter.model.RoleHasPermission;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class RoleHasPermissionRepository {

    public List<RoleHasPermission> getAll() {
        String sql = "select * from tblRoleHasPermission";
        List<RoleHasPermission> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RoleRepository rl = new RoleRepository();
                    PermissionRepository cr = new PermissionRepository();
                    RoleHasPermission c = new RoleHasPermission();
                    c.setPermission(cr.detail(rs.getInt("permission_id")));
                    c.setRole(rl.detail(rs.getInt("role_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public RoleHasPermission detail(int roleId, int permissionId) {
        String sql = "SELECT * FROM tblRoleHasPermission "
                + "WHERE role_id = ? AND permission_id = ?";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, roleId);
            stmt.setInt(2, permissionId);

            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RoleRepository rl = new RoleRepository();
                    PermissionRepository cr = new PermissionRepository();
                    RoleHasPermission c = new RoleHasPermission();
                    c.setPermission(cr.detail(rs.getInt("permission_id")));
                    c.setRole(rl.detail(rs.getInt("role_id")));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(RoleHasPermission roleHasPermission) {
        String sql = "INSERT INTO tblRoleHasPermission (role_id, permission_id) "
                + "VALUES (?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, roleHasPermission.getRole().getId());
            stmt.setInt(2, roleHasPermission.getPermission().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(RoleHasPermission roleHasPermission) {
        String sql = "UPDATE tblRoleHasPermission SET role_id = ?, permission_id = ? "
                + "WHERE role_id = ? AND permission_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, roleHasPermission.getRole().getId());
            stmt.setInt(2, roleHasPermission.getPermission().getId());
            stmt.setInt(3, roleHasPermission.getRole().getId());
            stmt.setInt(4, roleHasPermission.getPermission().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }
}