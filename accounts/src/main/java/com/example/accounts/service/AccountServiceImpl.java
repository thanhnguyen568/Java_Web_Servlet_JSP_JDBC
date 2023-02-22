package com.example.accounts.service;

import com.example.accounts.model.Account;
import com.example.accounts.repository.AccountRepository;
import com.example.accounts.repository.AccountRepositoryImpl;
import com.example.accounts.util.RegexPattern;

import java.sql.SQLException;
import java.util.List;

public class AccountServiceImpl implements AccountService, RegexPattern {
    AccountRepository repository = new AccountRepositoryImpl();

    @Override
    public List<Account> selectAll() {
        return repository.selectAll();
    }

    @Override
    public void insert(Account account) throws SQLException {
        repository.insert(account);
    }

    @Override
    public Account select(int accountId) {
        return repository.select(accountId);
    }

    @Override
    public boolean update(Account account) throws SQLException {
        return repository.update(account);
    }

    @Override
    public boolean delete(int accountId) throws SQLException {
        return repository.delete(accountId);
    }

    @Override
    public List<Account> search(String strSearch) {
        return repository.search(strSearch);
    }

    public boolean validationCode(String input) {
        return input.matches(REGEX_CODE_ACC);
    }

    public boolean validationName(String input) {
        return input.matches(REGEX_NAME_ACC);
    }

    public boolean validationDate(String input) {
        return input.matches(REGEX_DATE_ACC);
    }

    public boolean validationNum(String input) {
        return input.matches(REGEX_NUMBER_ACC);
    }
}

