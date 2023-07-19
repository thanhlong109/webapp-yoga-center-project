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
public class Bill implements Serializable{
    
    public static enum BillStatus{COMPLETED,CANCELLED,PENDING};
    
    private Course course;
    private Account account;
    private int id;
    private int status;
    private boolean isActive;
    private float value;
    private int discount;
    private Date date;
    private String orderCode;
    private String paymentMethod;
    private Date paymentDate;

    public Bill() {
    }
    
    public Bill(Course course, Account account, int status, boolean isActive, float value, int discount, Date date, String orderCode, String paymentMethod, Date paymentDate) {

        this.course = course;
        this.account = account;
        this.status = status;
        this.isActive = isActive;
        this.value = value;
        this.discount = discount;
        this.date = date;
        this.orderCode = orderCode;
        this.paymentMethod = paymentMethod;
        this.paymentDate = paymentDate;
    }

    public Bill(Course course, Account account, int status, boolean isActive, float value, int discount, Date date, String orderCode, String paymentMethod) {
        this.course = course;
        this.account = account;
        this.id = id;
        this.status = status;
        this.isActive = isActive;
        this.value = value;
        this.discount = discount;
        this.date = date;
        this.orderCode = orderCode;
        this.paymentMethod = paymentMethod;
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

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public static BillStatus getEnumIndex(int i) {
        BillStatus[] arr = BillStatus.values();
        if (i >= 0 && i < arr.length) {
            return arr[i];
        }
        return null;
    }
   
}
