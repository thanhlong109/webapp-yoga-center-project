/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author DungVNT
 */
public class Role {
    
    public static enum RoleList {VIEWER ,TRAINEE, TRAINER, ADMIN, CASHER};

    private int id;
    private String name;

    public Role() {
        
    }

    public Role(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public RoleList getRoleListIndex(int i){
        RoleList[] list = RoleList.values();
        if (i>=0&&i<list.length) {
            return list[i];
        }
        return null;
    }

}
