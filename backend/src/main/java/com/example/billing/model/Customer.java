package com.example.billing.model;

import jakarta.persistence.*;

@Entity
public class Customer {
    @Id
    @GeneratedValue
    private Long id;
    private String name;
    private String email;

    // Getters and Setters
}
