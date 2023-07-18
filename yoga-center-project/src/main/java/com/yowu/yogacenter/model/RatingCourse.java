/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author DungVNT
 */
public class RatingCourse {

    private int ratingStar;
    private String feedback;
    private RegistrationCourse registrationCourse;
    private Course course;

    public RatingCourse() {
    }

    public RatingCourse(int ratingStar, String feedback, RegistrationCourse registrationCourse, Course course) {
        this.ratingStar = ratingStar;
        this.feedback = feedback;
        this.registrationCourse = registrationCourse;
        this.course = course;
    }

    public int getRatingStar() {
        return ratingStar;
    }

    public void setRatingStar(int ratingStar) {
        this.ratingStar = ratingStar;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public RegistrationCourse getRegistrationCourse() {
        return registrationCourse;
    }

    public void setRegistrationCourse(RegistrationCourse registrationCourse) {
        this.registrationCourse = registrationCourse;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
}
