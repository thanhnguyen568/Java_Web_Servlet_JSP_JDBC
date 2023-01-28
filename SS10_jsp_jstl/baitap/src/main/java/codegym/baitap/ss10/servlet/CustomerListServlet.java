package codegym.baitap.ss10.servlet;

import codegym.baitap.ss10.model.Customer;
import codegym.baitap.ss10.DBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerListServlet", urlPatterns = "/CustomerListServlet")
public class CustomerListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Truy vấn dữ liệu từ DB (Mô phỏng).
        List<Customer> list = DBUtil.queryCustomer();

        // Lưu dữ liệu vào thuộc tính 'customers' của request.
        request.setAttribute("customers", list);

        // Tạo đối tượng RequestDispatcher
        // để Forward (chuyển tiếp) yêu cầu tới .jsp
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/content.jsp");

        // Forward (Chuyển tiếp) yêu cầu, để hiển thị dữ liệu trên trang JSP.
        dispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
