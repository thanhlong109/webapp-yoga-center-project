/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author DungVNT
 */
public class CategoryError {

    private String categoryNameError;
    private String categoryNameDuplicateError;
    private String error;

    public CategoryError() {
    }

    public CategoryError(String categoryNameError, String categoryNameDuplicateError, String error) {
        this.categoryNameError = categoryNameError;
        this.categoryNameDuplicateError = categoryNameDuplicateError;
        this.error = error;
    }

    public String getCategoryNameError() {
        return categoryNameError;
    }

    public void setCategoryNameError(String categoryNameError) {
        this.categoryNameError = categoryNameError;
    }

    public String getCategoryNameDuplicateError() {
        return categoryNameDuplicateError;
    }

    public void setCategoryNameDuplicateError(String categoryNameDuplicateError) {
        this.categoryNameDuplicateError = categoryNameDuplicateError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
