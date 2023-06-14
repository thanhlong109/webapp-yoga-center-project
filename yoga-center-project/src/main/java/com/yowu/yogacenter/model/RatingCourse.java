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

    public RatingCourse() {
    }

    public RatingCourse(int ratingStar, String feedback, RegistrationCourse registrationCourse) {
        this.ratingStar = ratingStar;
        this.feedback = feedback;
        this.registrationCourse = registrationCourse;
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

}
