/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author Chien Thang
 */
public class AccountError {
    private String fullNameError;
    private String EmailError;
    private String passwordError;
    private String error;

    public AccountError() {
        
    }

    public AccountError(String fullNameError, String EmailError, String passwordError, String error) {
        this.fullNameError = fullNameError;
        this.EmailError = EmailError;
        this.passwordError = passwordError;
        this.error = error;
    }

    /**
     * @return the fullNameError
     */
    public String getFullNameError() {
        return fullNameError;
    }

    /**
     * @param fullNameError the fullNameError to set
     */
    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    /**
     * @return the EmailError
     */
    public String getEmailError() {
        return EmailError;
    }

    /**
     * @param EmailError the EmailError to set
     */
    public void setEmailError(String EmailError) {
        this.EmailError = EmailError;
    }

    /**
     * @return the passwordError
     */
    public String getPasswordError() {
        return passwordError;
    }

    /**
     * @param passwordError the passwordError to set
     */
    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    /**
     * @return the error
     */
    public String getError() {
        return error;
    }

    /**
     * @param error the error to set
     */
    public void setError(String error) {
        this.error = error;
    }

    
    
    

    

    
    
}
