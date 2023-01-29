package baitap.ss11_product.controller;

import baitap.ss11_product.model.Product;
import baitap.ss11_product.service.ProductService;
import baitap.ss11_product.service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private final ProductService PRODUCTSERVICE = new ProductServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        // get name in list.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.PRODUCTSERVICE.findById(id);
        RequestDispatcher dispatcher;

        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.PRODUCTSERVICE.delete(id);
            try {
                response.sendRedirect("/products");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {

        // get name in list.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");

        // findById() impl
        Product product = this.PRODUCTSERVICE.findById(id);
        RequestDispatcher dispatcher;

        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            // update() impl
            product.setId(id);
            product.setNameProduct(nameProduct);
            product.setPrice(price);
            product.setDescription(description);
            product.setManufacturer(manufacturer);
            this.PRODUCTSERVICE.update(id, product);

            // set -> update.jsp
            request.setAttribute("product", product);
            request.setAttribute("message", "Product information was updated");
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {

        // get name in create.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");

        // save() impl
        Product product = new Product(id, nameProduct, price, description, manufacturer);
        this.PRODUCTSERVICE.save(product);

        // -> create.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("message", "New product was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {

        // findAll()
        List<Product> products = this.PRODUCTSERVICE.findAll();
        RequestDispatcher dispatcher;

        // set -> list.jsp
        request.setAttribute("products", products);
        dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));

        Product product = this.PRODUCTSERVICE.findById(id);
        RequestDispatcher dispatcher;

        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {

        // get name in list.jsp
        int id = Integer.parseInt(request.getParameter("id"));

        // findById() impl
        Product product = this.PRODUCTSERVICE.findById(id);
        RequestDispatcher dispatcher;

        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            // set -> update.jsp
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {

        // get name in list.jsp
        int id = Integer.parseInt(request.getParameter("id"));

        // findById() impl
        Product product = this.PRODUCTSERVICE.findById(id);
        RequestDispatcher dispatcher;

        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            // set -> update.jsp
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {

        // -> create.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
