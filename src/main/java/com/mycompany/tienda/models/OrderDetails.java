/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.models;

/**
 *
 * @author rodri
 */
public class OrderDetails {
    private int id;
    private int idOrder;
    private int idProdcut;
    private int quantity;
    private String unitPrice;

    public OrderDetails() {
    }

    public OrderDetails(int id, int idOrder, int idProdcut, int quantity, String unitPrice) {
        this.id = id;
        this.idOrder = idOrder;
        this.idProdcut = idProdcut;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdProdcut() {
        return idProdcut;
    }

    public void setIdProdcut(int idProdcut) {
        this.idProdcut = idProdcut;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "id=" + id + ", idOrder=" + idOrder + ", idProdcut=" + idProdcut + ", quantity=" + quantity + ", unitPrice=" + unitPrice + '}';
    }
    
}
