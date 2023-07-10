/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author ACER
 */
public class Course {

    private int id, duration;
    private String title, img, detail;
    private Category category;
    private boolean isActive;
    private float price;
    private Account account;

    public Course() {
    }

    public Course(int id, int duration, String title, String img, String detail, Category category, boolean isActive, float price, Account account) {
        this.id = id;
        this.duration = duration;
        this.title = title;
        this.img = img;
        this.detail = detail;
        this.category = category;
        this.isActive = isActive;
        this.price = price;
        this.account = account;
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

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

}
