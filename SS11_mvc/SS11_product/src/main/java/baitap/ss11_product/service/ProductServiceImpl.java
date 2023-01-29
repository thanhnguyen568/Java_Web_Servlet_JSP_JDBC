package baitap.ss11_product.service;

import baitap.ss11_product.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService{
    private static final Map<Integer, Product> PRODUCTS = new HashMap<>();

    static {
        Product productA = new Product(1,"Iphone 14",1000.00,"Smart phone", "Apple Inc.");
        PRODUCTS.put(1,productA);
        Product productB = new Product(2,"Samsung galaxy",900.00,"Smart phone", "Samsung");
        PRODUCTS.put(2,productB);
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(PRODUCTS.values());
    }

    @Override
    public void save(Product product) {
        PRODUCTS.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        PRODUCTS.put(id, product);
    }

    @Override
    public void delete(int id) {
        PRODUCTS.remove(id);
    }

    @Override
    public Product findById(int id) {
        return PRODUCTS.get(id);
    }
}
