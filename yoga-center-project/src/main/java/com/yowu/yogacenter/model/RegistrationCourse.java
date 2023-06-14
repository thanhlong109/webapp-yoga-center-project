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
public class RegistrationCourse {

    private int id;
    private Date registrationDate;
    private Date endDate;
    private int courseStatus;
    private Course course;
    private CourseSchedule courseSchedule;
    private Account account;

    public RegistrationCourse() {
    }

    public RegistrationCourse(int id, Date registrationDate, Date endDate, int courseStatus, Course course, CourseSchedule courseSchedule, Account account) {
        this.id = id;
        this.registrationDate = registrationDate;
        this.endDate = endDate;
        this.courseStatus = courseStatus;
        this.course = course;
        this.courseSchedule = courseSchedule;
        this.account = account;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getCourseStatus() {
        return courseStatus;
    }

    public void setCourseStatus(int courseStatus) {
        this.courseStatus = courseStatus;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public CourseSchedule getCourseSchedule() {
        return courseSchedule;
    }

    public void setCourseSchedule(CourseSchedule courseSchedule) {
        this.courseSchedule = courseSchedule;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
