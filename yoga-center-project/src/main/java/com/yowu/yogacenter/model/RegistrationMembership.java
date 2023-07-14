/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author DungVNT
 */
public class RegistrationMembership {

    private Membership membership;
    private Account account;
    private Date registrationDate;
    private Date expirationDate;
    private boolean registrationtatus;
    
    private LocalDateTime regisDate;
    private LocalDateTime expirDate;

    public RegistrationMembership() {
    }
    
    public RegistrationMembership(Membership membership, Account account, Date registrationDate, Date expirationDate) {
        this.membership = membership;
        this.account = account;
        this.registrationDate = registrationDate;
        this.expirationDate = expirationDate;
    }
    
    public RegistrationMembership(Membership membership, Account account, Date registrationDate, Date expirationDate, boolean registrationtatus) {
        this.membership = membership;
        this.account = account;
        this.registrationDate = registrationDate;
        this.expirationDate = expirationDate;
        this.registrationtatus = registrationtatus;
    }

    public RegistrationMembership(Membership membership, Account account, boolean registrationtatus, LocalDateTime regisDate, LocalDateTime expirDate) {
        this.membership = membership;
        this.account = account;
        this.registrationtatus = registrationtatus;
        this.regisDate = regisDate;
        this.expirDate = expirDate;
    }

    public LocalDateTime getRegisDate() {
        return regisDate;
    }

    public void setRegisDate(LocalDateTime regisDate) {
        this.regisDate = regisDate;
    }

    public LocalDateTime getExpirDate() {
        return expirDate;
    }

    public void setExpirDate(LocalDateTime expirDate) {
        this.expirDate = expirDate;
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

    public boolean getRegistrationtatus() {
        return registrationtatus;
    }

    public void setRegistrationtatus(boolean registrationtatus) {
        this.registrationtatus = registrationtatus;
    }
    
    

}
