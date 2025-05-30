package com.example.billing.controller;

import com.example.billing.model.Invoice;
import com.example.billing.repository.InvoiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/invoices")
public class InvoiceController {

    @Autowired
    private InvoiceRepository repo;

    @GetMapping
    public List<Invoice> getAll() {
        return repo.findAll();
    }

    @PostMapping
    public Invoice save(@RequestBody Invoice i) {
        return repo.save(i);
    }
}
