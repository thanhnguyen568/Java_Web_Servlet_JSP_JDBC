package com.example.accounts.controller;

import com.example.accounts.model.Account;
import com.example.accounts.service.AccountServiceImpl;
import com.example.accounts.service.TermService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AccountServlet", urlPatterns = "/accounts")
public class AccountServlet extends HttpServlet {
    private AccountServiceImpl accountService;
    private TermService termService;

    public void init() {
        accountService = new AccountServiceImpl();
        termService = new TermService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(request, response);
                    break;
                case "update":
                    showUpdateForm(request, response);
                    break;
                case "delete":
                    deleteAccount(request, response);
                    break;
                case "search":
                    searchAccount(request, response);
                    break;
                case "multiDel":
                    multiDelete(request, response);
                default:
                    listAccount(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void multiDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String[] list = request.getParameterValues("checkbox");
        for (String item : list) {
            int id = Integer.parseInt(item);
            accountService.delete(id);
        }
    }

    private void searchAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strSearch = request.getParameter("search");

        List<Account> list = accountService.search(strSearch);

        request.setAttribute("listAccount", list);
        request.getRequestDispatcher("account/list.jsp").forward(request, response);
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("accountId"));

        accountService.delete(id);

        response.sendRedirect("accounts");
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("accountId"));

        Account account = accountService.select(id);

        request.setAttribute("updateAccount", account);
        request.getRequestDispatcher("account/update.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        drop list
        List<Term> listTerm = termService.listTerm();
        request.setAttribute("listTerm", listTerm);

        request.getRequestDispatcher("account/create.jsp").forward(request, response);
    }

    private void listAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Account> list = accountService.selectAll();
        request.setAttribute("listAccount", list);
        request.getRequestDispatcher("account/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createAccount(request, response);
                    break;
                case "update":
                    updateAccount(request, response);
                    break;
                default:
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        String accountCode = request.getParameter("accountCode");
        String accountName = request.getParameter("accountName");
//        while (!accountService.validationName(accountName)) {
//            System.out.println(accountName);
//            request.setAttribute("message", "Wrong pattern accountName !");
//            request.getParameter("accountName");
//            request.getRequestDispatcher("account/update.jsp").forward(request, response);
//        }
        Date createDate = Date.valueOf((request.getParameter("createDate")));
        int savingAmount = Integer.parseInt(request.getParameter("amount"));
        Date depositDate = Date.valueOf(request.getParameter("depositDate"));
        int interestRate = Integer.parseInt(request.getParameter("interestRate"));
        int termId = Integer.parseInt(request.getParameter("termId"));

        Account account = new Account(accountId, accountCode, accountName, createDate, savingAmount, depositDate, interestRate, termId);

        accountService.update(account);

        response.sendRedirect("accounts");
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String code = request.getParameter("accountCode");
        String name = request.getParameter("accountName");
        Date createDate = Date.valueOf(request.getParameter("createDate"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        Date depositDate = Date.valueOf(request.getParameter("depositDate"));
        int interestRate = Integer.parseInt(request.getParameter("interestRate"));
        int termId = Integer.parseInt(request.getParameter("termId"));
        Account account = new Account(code, name, createDate, amount, depositDate, interestRate, termId);

        accountService.insert(account);
        request.setAttribute("message", "Create new success");
        response.sendRedirect("accounts");
    }
}
