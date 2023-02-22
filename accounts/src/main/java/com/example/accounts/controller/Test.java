package com.example.accounts.controller;


import com.example.accounts.model.Account;
import com.example.accounts.repository.AccountRepository;
import com.example.accounts.repository.AccountRepositoryImpl;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        AccountRepository repository = new AccountRepositoryImpl();
        List<Account> list = repository.selectAll();
        for (Account o : list) {
            System.out.println(o);
        }
    }
}
