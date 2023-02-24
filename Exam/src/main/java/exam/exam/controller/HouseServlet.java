package exam.exam.controller;

import exam.exam.model.House;
import exam.exam.service.HouseServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AccountServlet", urlPatterns = "/houses")
public class HouseServlet extends HttpServlet {
    private HouseServiceImpl houseService;

    public void init() {
        houseService = new HouseServiceImpl();
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
                case "delete":
                    deleteHouse(request, response);
                    break;
//                case "search":
//                    searchAccount(request, response);
//                    break;
//                case "multiDel":
//                    multiDelete(request, response);
                default:
                    listHouse(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void deleteHouse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String houseCode = request.getParameter("houseCode");

        houseService.delete(houseCode);

        response.sendRedirect("houses");

        List<House> list = houseService.selectAll();
        request.setAttribute("listHouse", list);
        request.getRequestDispatcher("house/list.jsp").forward(request, response);
//        request.getRequestDispatcher("house/create.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("house/create.jsp").forward(request, response);
    }

    private void listHouse(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<House> list = houseService.selectAll();
        request.setAttribute("listHouse", list);
        request.getRequestDispatcher("house/list.jsp").forward(request, response);
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
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String houseCode = request.getParameter("houseCode");
        int houseArea = Integer.parseInt(request.getParameter("houseArea"));
        String houseStatus = request.getParameter("houseStatus");
        int houseFlour = Integer.parseInt(request.getParameter("houseFlour"));
        String houseType = request.getParameter("houseType");
        String houseDes = request.getParameter("houseDes");
        int housePrice = Integer.parseInt(request.getParameter("housePrice"));
        Date houseStart = Date.valueOf(request.getParameter("houseStart"));
        Date houseEnd = Date.valueOf(request.getParameter("houseEnd"));
        House house = new House(houseCode, houseArea, houseStatus, houseFlour, houseType, houseDes, housePrice, houseStart,houseEnd);

        houseService.insert(house);
        request.setAttribute("message", "Create new success");
        response.sendRedirect("houses");
    }
}
