/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.model;

import java.sql.Date;

/**
 *
 * @author DungVNT
 */
public class Blog {

    private int id;
    private String title;
    private String detail;
    private boolean isActive;
    private Account account;
    private Date date;
    private String img;

    public Blog() {
    }

    public Blog(int id, String title, String detail, boolean isActive, Account account, Date date, String img) {
        this.id = id;
        this.title = title;
        this.detail = detail;
        this.isActive = isActive;
        this.account = account;
        this.date = date;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
