package com.relojdepulsera.model;

public class CustomerModel {
    private String name;
    private int orderCount;
    
    public CustomerModel(String name, int orderCount) {
        this.name = name;
        this.orderCount = orderCount;
    }
    
    // Getters
    public String getName() { return name; }
    public int getOrderCount() { return orderCount; }
}