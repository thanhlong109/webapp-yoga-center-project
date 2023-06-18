/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

import java.sql.Date;

/**
 *
 * @author DungVNT
 */
public class Bill {
    
    public static enum BillStatus{COMPLETED,CANCELLED,PENDING};

    private Course course;
    private Account account;
    private int id;
    private int status;
    private boolean isActive;
    private float value;
    private int discount;
    private Date date;

    public Bill() {
    }
    
    public Bill(Course course, Account account, int id, int status, boolean isActive, float value, int discount, Date date) {
        this.course = course;
        this.account = account;
        this.id = id;
        this.status = status;
        this.isActive = isActive;
        this.value = value;
        this.discount = discount;
        this.date = date;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    public static BillStatus getEnumIndex(int i){
        BillStatus[] arr = BillStatus.values();
        if(i>=0&&i<arr.length){
            return arr[i];
        }
        return null;
    }
}
