/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author DungVNT
 */
public class Comment {

    private Blog blog;
    private String content;
    private Timestamp date;
    private Account account;

    public Comment() {
    }

    public Comment(Blog blog, String content, Timestamp date, Account account) {
        this.blog = blog;
        this.content = content;
        this.date = date;
        this.account = account;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
