package com.example.productmanagement.repository;

import com.example.productmanagement.entity.Product;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static final List<Product> products = new ArrayList<>();
    static {
        products.add(new Product(1, "Iphone 15", 250000, "Flagship Apple", "Apple"));
        products.add(new Product(2, "Samsung S23", 200000, "Flagship Samsung", "Samsung"));
        products.add(new Product(3, "Xiaomi 13", 150000, "Flagship Xiaomi", "Xiaomi"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products);
    }

    @Override
    public Product findById(int id) {
        for (Product p : products) {
            if (p.getId() == id) return p;
        }
        return null;
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public void update(Product product) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == product.getId()) {
                products.set(i, product);
                return;
            }
        }
    }

    @Override
    public void delete(int id) {
        products.removeIf(p -> p.getId() == id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product p : products) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(p);
            }
        }
        return result;
    }
} 