package com.example.productmanagement.service;

import com.example.productmanagement.entity.Product;
import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findById(int id);
    void save(Product product);
    void update(Product product);
    void delete(int id);
    List<Product> searchByName(String name);
} 