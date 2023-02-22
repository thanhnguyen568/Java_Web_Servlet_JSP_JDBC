package example.account.controller;

import example.account.model.SavingAccount;
import example.account.model.Term;
import example.account.service.SavingAccServiceImpl;
import example.account.service.TermServiceImpl;
import example.account.util.RegexPattern;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SavingAccServlet", urlPatterns = "/accounts")
public class SavingAccServlet extends HttpServlet implements RegexPattern {
    private SavingAccServiceImpl accService;
    private TermServiceImpl termService;

    public void init() {
        accService = new SavingAccServiceImpl();
        termService = new TermServiceImpl();
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
                case "yyy":
                    bulkDelete(request, response);
                    break;
                default:
                    listAccount(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void bulkDelete(HttpServletRequest request, HttpServletResponse response) {
        String[] ids = request.getParameterValues("checkbox");
        System.out.println(ids);
    }

    private void listAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<SavingAccount> list = accService.selectAllAcc();

        request.setAttribute("listAccount", list);

        request.getRequestDispatcher("account/list.jsp").forward(request, response);
        request.setAttribute("message", "New customer was created");
    }

    private void searchAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strSearch = request.getParameter("search");

        List<SavingAccount> list = accService.search(strSearch);

        request.setAttribute("listAccount", list);
        request.getRequestDispatcher("account/list.jsp").forward(request, response);
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("accountId"));

        accService.delete(id);

        response.sendRedirect("/accounts");
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("accountId"));

        SavingAccount account = accService.select(id);

        request.setAttribute("updateAccount", account);
        request.getRequestDispatcher("account/update.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //drop list
        List<Term> listTerm = termService.listTerm();
        request.setAttribute("listTerm", listTerm);

        request.getRequestDispatcher("account/create.jsp").forward(request, response);
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

//    private void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        int id = Integer.parseInt(request.getParameter("accountId"));
//        String code = request.getParameter("accountCode");
//        String name = request.getParameter("accountName");
//        Date createDate = Date.valueOf(request.getParameter("accountCreateDate"));
//        int savingAmount = Integer.parseInt(request.getParameter("savingAmount"));
//        Date depositDate = Date.valueOf(request.getParameter("savingDepositDate"));
//        int interestRate = Integer.parseInt(request.getParameter("savingInterestRate"));
//        int termId = Integer.parseInt(request.getParameter("termId"));
//        SavingAccount account = new SavingAccount(id, code, name, createDate, savingAmount, depositDate, interestRate, termId);
//
//        accService.update(account);
//
//        response.sendRedirect("accounts");
//
//    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));

        String accountCode = request.getParameter("accountCode");

        String accountName = request.getParameter("accountName");
        while (!accService.validationName(accountName)){
            System.out.println(accountName);
            request.setAttribute("message", "Wrong pattern accountName !");
            request.getRequestDispatcher("account/update.jsp").forward(request,response);
        }

        Date createDate = Date.valueOf(request.getParameter("accountCreateDate"));
        int savingAmount = Integer.parseInt(request.getParameter("savingAmount"));
        Date depositDate = Date.valueOf(request.getParameter("savingDepositDate"));
        int interestRate = Integer.parseInt(request.getParameter("savingInterestRate"));
        int termId = Integer.parseInt(request.getParameter("termId"));

        SavingAccount account = new SavingAccount(accountId, accountCode, accountName, createDate, savingAmount, depositDate, interestRate, termId);

        accService.update(account);

        response.sendRedirect("accounts");
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("accountCode");
        String name = request.getParameter("accountName");
        Date createDate = Date.valueOf(request.getParameter("accountCreateDate"));
        int savingAmount = Integer.parseInt(request.getParameter("savingAmount"));
        Date depositDate = Date.valueOf(request.getParameter("savingDepositDate"));
        int interestRate = Integer.parseInt(request.getParameter("savingInterestRate"));
        int termId = Integer.parseInt(request.getParameter("termId"));
        SavingAccount account = new SavingAccount(code, name, createDate, savingAmount, depositDate, interestRate, termId);

        accService.insert(account);
        request.setAttribute("message","Create new success");
        response.sendRedirect("accounts");
    }
}
