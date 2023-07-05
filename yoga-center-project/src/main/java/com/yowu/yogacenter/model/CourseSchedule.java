/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

import java.sql.Time;

/**
 *
 * @author ACER
 */
public class CourseSchedule {
    public static enum DayOfWeek{MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY,SUNDAY};
    private int id;
    private String dateOfWeek;
    private boolean isActive;
    private Time startTime, endTime;
    private Course course;
    
    
    public CourseSchedule() {
    }

    public CourseSchedule(int id, String dateOfWeek, boolean isActive, Time startTime, Time endTime, Course course) {
        this.id = id;
        this.dateOfWeek = dateOfWeek;
        this.isActive = isActive;
        this.startTime = startTime;
        this.endTime = endTime;
        this.course = course;
    }
    
    public static DayOfWeek getDayIndex(int i){
        DayOfWeek[] arr = DayOfWeek.values();
        if(i>=0&&i<arr.length){
            return arr[i];
        }
        return null;
    } 
    
    public String dateToString(){
        String[] days = dateOfWeek.split(",");
        String daysTxt = "";
        for(String day : days){
            daysTxt+=DayOfWeek.values()[Integer.parseInt(day)].name().toLowerCase()+", ";
        }
        return daysTxt;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateOfWeek() {
        return dateOfWeek;
    }

    public void setDateOfWeek(String dateOfWeek) {
        this.dateOfWeek = dateOfWeek;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
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

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    public static DayOfWeek getEnumIndex(int i){
        DayOfWeek[] arr = DayOfWeek.values();
        if(i>=0&&i<arr.length){
            return arr[i];
        }
        return null;
    }
    
}
