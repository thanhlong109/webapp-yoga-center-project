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
    private String roleIDError;
    private String passwordError;
    private String confirmError;
    private String error;

    public AccountError() {
        this.fullNameError = "";
        this.roleIDError = "";
        this.passwordError = "";
        this.confirmError = "";
        this.error = "";
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
     * @return the roleIDError
     */
    public String getRoleIDError() {
        return roleIDError;
    }

    /**
     * @param roleIDError the roleIDError to set
     */
    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
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
     * @return the confirmError
     */
    public String getConfirmError() {
        return confirmError;
    }

    /**
     * @param confirmError the confirmError to set
     */
    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
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
