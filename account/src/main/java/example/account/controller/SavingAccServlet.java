package example.account.controller;

import example.account.model.SavingAccount;
import example.account.service.SavingAccServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SavingAccServlet", urlPatterns = "/saving-accounts")
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
//                    deleteUser(request, response);
                    break;
                case "find":
//                    listAccById(request, response);
                    break;
                case "sort":
//                    sortAccByName(request, response);
                default:
                    listAcc(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("account/create.jsp").forward(request, response);
    }

    private void listAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
        List<SavingAccount> list = savingAccService.selectAllAcc();

        request.setAttribute("savingAccounts", list);
        request.getRequestDispatcher("account/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
