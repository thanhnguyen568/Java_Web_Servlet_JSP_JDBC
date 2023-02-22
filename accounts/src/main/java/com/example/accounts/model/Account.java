package com.example.accounts.model;

import java.sql.Date;

public class Account {
    private int accountId;
    private String accountCode;
    private String accountName;
    private Date createDate;
    private int amount;
    private Date depositDate;
    private int interestRate;
    private int termId;

    public Account() {
    }

    public Account(String accountCode, String accountName, Date createDate, int amount, Date depositDate, int interestRate, int termId) {
        this.accountCode = accountCode;
        this.accountName = accountName;
        this.createDate = createDate;
        this.amount = amount;
        this.depositDate = depositDate;
        this.interestRate = interestRate;
        this.termId = termId;
    }

    public Account(int accountId, String accountCode, String accountName, Date createDate, int Amount, Date depositDate, int interestRate, int termId) {
        this.accountId = accountId;
        this.accountCode = accountCode;
        this.accountName = accountName;
        this.createDate = createDate;
        this.amount = Amount;
        this.depositDate = depositDate;
        this.interestRate = interestRate;
        this.termId = termId;
    }


    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAccountCode() {
        return accountCode;
    }

    public void setAccountCode(String accountCode) {
        this.accountCode = accountCode;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getDepositDate() {
        return depositDate;
    }

    public void setDepositDate(Date depositDate) {
        this.depositDate = depositDate;
    }

    public int getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(int interestRate) {
        this.interestRate = interestRate;
    }

    public int getTermId() {
        return termId;
    }

    public void setTermId(int termId) {
        this.termId = termId;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", accountCode='" + accountCode + '\'' +
                ", accountName='" + accountName + '\'' +
                ", accountCreateDate=" + createDate +
                ", amount=" + amount +
                ", depositDate=" + depositDate +
                ", interestRate=" + interestRate +
                ", termId=" + termId +
                '}';
    }
}
