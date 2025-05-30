package com.example.billing.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Invoice {
    @Id
    @GeneratedValue
    private Long id;
    private Double amount;
    private LocalDate date;

    @ManyToOne
    private Customer customer;

    // Getters and Setters
}
