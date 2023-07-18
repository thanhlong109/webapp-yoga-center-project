/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.model;

/**
 *
 * @author DungVNT
 */
public class MembershipError {

    private String membershipNameLengthError;
    private String membershipNameDuplicateError;
    private String membershipDurationError;
    private String membershipPriceError;
    private String membershipDescriptionError;
    private String membershipDiscountError;
    private String error;

    public MembershipError() {
    }

    public MembershipError(String membershipNameLengthError, String membershipNameDuplicateError, String membershipDurationError, String membershipPriceError, String membershipDescriptionError, String membershipDiscountError, String error) {
        this.membershipNameLengthError = membershipNameLengthError;
        this.membershipNameDuplicateError = membershipNameDuplicateError;
        this.membershipDurationError = membershipDurationError;
        this.membershipPriceError = membershipPriceError;
        this.membershipDescriptionError = membershipDescriptionError;
        this.membershipDiscountError = membershipDiscountError;
        this.error = error;
    }

    public String getMembershipNameLengthError() {
        return membershipNameLengthError;
    }

    public void setMembershipNameLengthError(String membershipNameLengthError) {
        this.membershipNameLengthError = membershipNameLengthError;
    }

    public String getMembershipNameDuplicateError() {
        return membershipNameDuplicateError;
    }

    public void setMembershipNameDuplicateError(String membershipNameDuplicateError) {
        this.membershipNameDuplicateError = membershipNameDuplicateError;
    }

    public String getMembershipDurationError() {
        return membershipDurationError;
    }

    public void setMembershipDurationError(String membershipDurationError) {
        this.membershipDurationError = membershipDurationError;
    }

    public String getMembershipPriceError() {
        return membershipPriceError;
    }

    public void setMembershipPriceError(String membershipPriceError) {
        this.membershipPriceError = membershipPriceError;
    }

    public String getMembershipDescriptionError() {
        return membershipDescriptionError;
    }

    public void setMembershipDescriptionError(String membershipDescriptionError) {
        this.membershipDescriptionError = membershipDescriptionError;
    }

    public String getMembershipDiscountError() {
        return membershipDiscountError;
    }

    public void setMembershipDiscountError(String membershipDiscountError) {
        this.membershipDiscountError = membershipDiscountError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
