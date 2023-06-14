/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author DungVNT
 */
public class RoleHasPermission {

    private Role role;
    private Permission permission;

    public RoleHasPermission() {
    }

    public RoleHasPermission(Role role, Permission permission) {
        this.role = role;
        this.permission = permission;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

}
