package com.example.goshopping.domain;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CartRepository extends CrudRepository<Cart, Long> {
    List<Cart> findByUser(User user);
    
}
