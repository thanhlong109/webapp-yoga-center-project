/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author DungVNT
 */
public class CourseError {

    private String courseTitleLengthError;
    private String courseTitleDuplicateError;
    private String courseDurationError;
    private String coursePriceError;
    private String courseDetailLengthError;
    private String error;

    public CourseError() {
    }

    public CourseError(String courseTitleLengthError, String courseTitleDuplicateError, String courseDurationError, String coursePriceError, String courseDetailLengthError, String error) {
        this.courseTitleLengthError = courseTitleLengthError;
        this.courseTitleDuplicateError = courseTitleDuplicateError;
        this.courseDurationError = courseDurationError;
        this.coursePriceError = coursePriceError;
        this.courseDetailLengthError = courseDetailLengthError;
        this.error = error;
    }

    public String getCourseTitleLengthError() {
        return courseTitleLengthError;
    }

    public void setCourseTitleLengthError(String courseTitleLengthError) {
        this.courseTitleLengthError = courseTitleLengthError;
    }

    public String getCourseTitleDuplicateError() {
        return courseTitleDuplicateError;
    }

    public void setCourseTitleDuplicateError(String courseTitleDuplicateError) {
        this.courseTitleDuplicateError = courseTitleDuplicateError;
    }

    public String getCourseDurationError() {
        return courseDurationError;
    }

    public void setCourseDurationError(String courseDurationError) {
        this.courseDurationError = courseDurationError;
    }

    public String getCoursePriceError() {
        return coursePriceError;
    }

    public void setCoursePriceError(String coursePriceError) {
        this.coursePriceError = coursePriceError;
    }

    public String getCourseDetailLengthError() {
        return courseDetailLengthError;
    }

    public void setCourseDetailLengthError(String courseDetailLengthError) {
        this.courseDetailLengthError = courseDetailLengthError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
