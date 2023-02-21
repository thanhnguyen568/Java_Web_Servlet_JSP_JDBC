package example.account.model;

import java.sql.Date;

public class SavingAccount {
    private int accountId;
    private String accountCode;
    private String accountName;
    private Date accountCreateDate;
    private int savingAmount;
    private Date savingDepositDate;
    private int savingInterestRate;
    private int termId;

    public SavingAccount() {
    }

    public SavingAccount(String accountCode, String accountName, Date accountCreateDate, int savingAmount, Date savingDepositDate, int savingInterestRate, int termId) {
        this.accountCode = accountCode;
        this.accountName = accountName;
        this.accountCreateDate = accountCreateDate;
        this.savingAmount = savingAmount;
        this.savingDepositDate = savingDepositDate;
        this.savingInterestRate = savingInterestRate;
        this.termId = termId;
    }

    public SavingAccount(int accountId, String accountCode, String accountName, Date accountCreateDate, int savingAmount, Date savingDepositDate, int savingInterestRate, int termId) {
        this.accountId = accountId;
        this.accountCode = accountCode;
        this.accountName = accountName;
        this.accountCreateDate = accountCreateDate;
        this.savingAmount = savingAmount;
        this.savingDepositDate = savingDepositDate;
        this.savingInterestRate = savingInterestRate;
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

    public Date getAccountCreateDate() {
        return accountCreateDate;
    }

    public void setAccountCreateDate(Date accountCreateDate) {
        this.accountCreateDate = accountCreateDate;
    }

    public int getSavingAmount() {
        return savingAmount;
    }

    public void setSavingAmount(int savingAmount) {
        this.savingAmount = savingAmount;
    }

    public Date getSavingDepositDate() {
        return savingDepositDate;
    }

    public void setSavingDepositDate(Date savingDepositDate) {
        this.savingDepositDate = savingDepositDate;
    }

    public int getSavingInterestRate() {
        return savingInterestRate;
    }

    public void setSavingInterestRate(int savingInterestRate) {
        this.savingInterestRate = savingInterestRate;
    }

    public int getTermId() {
        return termId;
    }

    public void setTermId(int termId) {
        this.termId = termId;
    }

    @Override
    public String toString() {
        return "SavingAccount{" +
                "accountId=" + accountId +
                ", accountCode='" + accountCode + '\'' +
                ", accountName='" + accountName + '\'' +
                ", accountCreateDate=" + accountCreateDate +
                ", savingAmount=" + savingAmount +
                ", savingDepositDate=" + savingDepositDate +
                ", savingInterestRate=" + savingInterestRate +
                ", termId=" + termId +
                '}';
    }
}
