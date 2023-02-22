package com.example.accounts.controller;

public class Term {
    private int termId;
    private String termName;

    public Term() {
    }

    public Term(int termId, String termName) {
        this.termId = termId;
        this.termName = termName;
    }

    public int getTermId() {
        return termId;
    }

    public void setTermId(int termId) {
        this.termId = termId;
    }

    public String getTermName() {
        return termName;
    }

    public void setTermName(String termName) {
        this.termName = termName;
    }

    @Override
    public String toString() {
        return "Term{" +
                "termId=" + termId +
                ", termName='" + termName + '\'' +
                '}';
    }
}
