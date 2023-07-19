/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author DungVNT
 */
public class Account implements Serializable{
    
    public static String DEFAULT_IMG = "hinh-avatar-1.png";

    private int id;
    private String img;
    private String name;
    private String password;
    private String email;
    private String phone;
    private boolean isActive;
    private Role role;
    private String socialID;
    private Date createDate;
    
    private String biography;

    public Account() {
    }

    public Account( String name, String password, String email, String phone, Role role, String socialID) {
        this.img = DEFAULT_IMG;
        this.name = name;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.isActive = true;
        this.role = role;
        this.socialID = socialID;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }
    
    

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    
    public String getSocialID() {
        return socialID;
    }

    
    public void setSocialID(String socialID) {
        this.socialID = socialID;
    }

}
