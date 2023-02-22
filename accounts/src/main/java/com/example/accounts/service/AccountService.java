package com.example.accounts.service;

import com.example.accounts.model.Account;

import java.sql.SQLException;
import java.util.List;

public interface AccountService {
    List<Account> selectAll();

    void insert(Account account) throws SQLException;

    Account select(int accountId);

    boolean update(Account account) throws SQLException;

    boolean delete(int accountId) throws SQLException;

    List<Account> search(String strSearch);
}
