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
    private String ordercode;
    private String method;
    private Date paymentDate;

    public Bill() {
    }

    public Bill(Course course, Account account, int status, boolean isActive, float value, int discount, Date date, String ordercode, String method) {
        this.course = course;
        this.account = account;
        this.status = status;
        this.isActive = isActive;
        this.value = value;
        this.discount = discount;
        this.date = date;
        this.ordercode = ordercode;
        this.method = method;
    }

    
    public Bill(Course course, Account account,  int status, boolean isActive, float value, int discount, Date date, String ordercode) {
        this.course = course;
        this.account = account;
        this.status = status;
        this.isActive = isActive;
        this.value = value;
        this.discount = discount;
        this.date = date;
        this.ordercode = ordercode;
    }
    
    
    public static BillStatus getEnumIndex(int i){
        BillStatus[] arr = BillStatus.values();
        if(i>=0&&i<arr.length){
            return arr[i];
        }
        return null;
    }

    /**
     * @return the course
     */
    public Course getCourse() {
        return course;
    }

    /**
     * @param course the course to set
     */
    public void setCourse(Course course) {
        this.course = course;
    }

    /**
     * @return the account
     */
    public Account getAccount() {
        return account;
    }

    /**
     * @param account the account to set
     */
    public void setAccount(Account account) {
        this.account = account;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the isActive
     */
    public boolean isIsActive() {
        return isActive;
    }

    /**
     * @param isActive the isActive to set
     */
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the value
     */
    public float getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(float value) {
        this.value = value;
    }

    /**
     * @return the discount
     */
    public int getDiscount() {
        return discount;
    }

    /**
     * @param discount the discount to set
     */
    public void setDiscount(int discount) {
        this.discount = discount;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the ordercode
     */
    public String getOrdercode() {
        return ordercode;
    }

    /**
     * @param ordercode the ordercode to set
     */
    public void setOrdercode(String ordercode) {
        this.ordercode = ordercode;
    }

    /**
     * @return the method
     */
    public String getMethod() {
        return method;
    }

    /**
     * @param method the method to set
     */
    public void setMethod(String method) {
        this.method = method;
    }

    /**
     * @return the paymentDate
     */
    public Date getPaymentDate() {
        return paymentDate;
    }

    /**
     * @param paymentDate the paymentDate to set
     */
    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }
    
}
