package baitap.ss11_product.service;

import baitap.ss11_product.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    void save(Product product);
    void update(int id, Product product);
    void delete(int id);
    Product findById(int id);
}
