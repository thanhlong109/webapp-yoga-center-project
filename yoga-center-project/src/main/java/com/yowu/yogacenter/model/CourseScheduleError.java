/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

import java.sql.Time;

/**
 *
 * @author DatTGT
 */
public class CourseScheduleError {

    private String dateOfWeekError;
    private String dateOfWeekEmptyError;
    private String startTimeError;
    private String endTimeError;
    private String Error;

    public CourseScheduleError() {
    }

    public CourseScheduleError(String dateOfWeekError, String dateOfWeekEmptyError, String startTimeError, String endTimeError, String Error) {
        this.dateOfWeekError = dateOfWeekError;
        this.dateOfWeekEmptyError = dateOfWeekEmptyError;
        this.startTimeError = startTimeError;
        this.endTimeError = endTimeError;
        this.Error = Error;
    }

    public String getDateOfWeekEmptyError() {
        return dateOfWeekEmptyError;
    }

    public void setDateOfWeekEmptyError(String dateOfWeekEmptyError) {
        this.dateOfWeekEmptyError = dateOfWeekEmptyError;
    }

    public String getDateOfWeekError() {
        return dateOfWeekError;
    }

    public void setDateOfWeekError(String dateOfWeekError) {
        this.dateOfWeekError = dateOfWeekError;
    }

    public String getStartTimeError() {
        return startTimeError;
    }

    public void setStartTimeError(String startTimeError) {
        this.startTimeError = startTimeError;
    }

    public String getEndTimeError() {
        return endTimeError;
    }

    public void setEndTimeError(String endTimeError) {
        this.endTimeError = endTimeError;
    }

    public String getError() {
        return Error;
    }

    public void setError(String Error) {
        this.Error = Error;
    }

}
