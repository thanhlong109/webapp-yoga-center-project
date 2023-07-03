/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 *
 * @author DungVNT
 */
public class Blog implements Serializable{

    private int id;
    private String title;
    private String detail;
    private Account account;
    private Timestamp date;
    private String img;

    public Blog() {
    }

    public Blog(int id, String title, String detail, Account account, Timestamp date, String img) {
        this.id = id;
        this.title = title;
        this.detail = detail;
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

    
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
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


    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
