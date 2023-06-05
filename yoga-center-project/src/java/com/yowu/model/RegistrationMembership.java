/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.model;

import java.sql.Date;

/**
 *
 * @author DungVNT
 */
public class RegistrationMembership {

    private Membership membership;
    private Account account;
    private Date registrationDate;
    private Date expirationDate;

    public RegistrationMembership() {
    }

    public RegistrationMembership(Membership membership, Account account, Date registrationDate, Date expirationDate) {
        this.membership = membership;
        this.account = account;
        this.registrationDate = registrationDate;
        this.expirationDate = expirationDate;
    }

    public Membership getMembership() {
        return membership;
    }

    public void setMembership(Membership membership) {
        this.membership = membership;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

}
