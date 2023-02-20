package example.account.controller;

import example.account.model.SavingAccount;
import example.account.service.SavingAccServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SavingAccServlet", urlPatterns = "/accounts")
public class SavingAccServlet extends HttpServlet {
    private SavingAccServiceImpl savingAccService;

    public void init() {
        savingAccService = new SavingAccServiceImpl();
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
//                    showUpdateForm(request, response);
                    break;
                case "delete":
//                    deleteAccount(request, response);
                    break;
                case "search":
//                    listAccById(request, response);
                    break;
                case "sort":
//                    sortAccByName(request, response);
                default:
                    listAll(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<SavingAccount> list = savingAccService.selectAllAcc();

        request.setAttribute("savingAccounts", list);
        request.getRequestDispatcher("account/list.jsp").forward(request, response);
        request.setAttribute("message", "New customer was created");
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SavingAccount account = savingAccService.select(id);

        request.setAttribute("acc",account);
        request.getRequestDispatcher("account/update.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String createDate = request.getParameter("createDate");
        int savingAmount = Integer.parseInt(request.getParameter("savingAmount"));
        String depositDate = request.getParameter("depositDate");
        int interestRate = Integer.parseInt(request.getParameter("interestRate"));
        int termId = Integer.parseInt(request.getParameter("termId"));
        SavingAccount account = new SavingAccount(code, name, createDate, savingAmount, depositDate, interestRate, termId);
        savingAccService.insert(account);

        response.sendRedirect("accounts");
    }
}
