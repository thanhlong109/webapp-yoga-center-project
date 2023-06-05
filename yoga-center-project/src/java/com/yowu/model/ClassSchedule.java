/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author DungVNT
 */
public class ClassSchedule {

    private int id;
    private Date date;
    private Time startTime;
    private Time endTime;
    private int status;
    private RegistrationCourse registrationCourse;

    public ClassSchedule() {
    }

    public ClassSchedule(int id, Date date, Time startTime, Time endTime, int status, RegistrationCourse registrationCourse) {
        this.id = id;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
        this.registrationCourse = registrationCourse;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public RegistrationCourse getRegistrationCourse() {
        return registrationCourse;
    }

    public void setRegistrationCourse(RegistrationCourse registrationCourse) {
        this.registrationCourse = registrationCourse;
    }

}
