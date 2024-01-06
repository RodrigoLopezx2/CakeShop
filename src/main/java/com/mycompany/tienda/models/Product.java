/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.models;

/**
 *
 * @author rodri
 */
public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private double stock;
    private String uriImage;

    public Product() {
        
    }

    public Product(int id, String name, String description, double price, double stock, String uriImage) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.uriImage = uriImage;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public double getStock() {
        return stock;
    }

    public String getUriImage() {
        return uriImage;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", stock=" + stock + ", uriImage=" + uriImage + '}';
    }
}
