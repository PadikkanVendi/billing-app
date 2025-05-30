package com.example.billing.controller;

import com.example.billing.model.Customer;
import com.example.billing.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    @Autowired
    private CustomerRepository repo;

    @GetMapping
    public List<Customer> getAll() {
        return repo.findAll();
    }

    @PostMapping
    public Customer save(@RequestBody Customer c) {
        return repo.save(c);
    }
}
