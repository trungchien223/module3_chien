package com.example.productmanagement.repository;

import com.example.productmanagement.entity.Product;
import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    Product findById(int id);
    void save(Product product);
    void update(Product product);
    void delete(int id);
    List<Product> searchByName(String name);
} 