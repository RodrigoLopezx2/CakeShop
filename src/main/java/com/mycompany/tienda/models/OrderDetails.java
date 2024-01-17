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
    private String Flavor;
    private String Size;

    public OrderDetails() {
    }

    public OrderDetails(int id, int idOrder, int idProdcut, int quantity, String unitPrice, String Flavor, String Size) {
        this.id = id;
        this.idOrder = idOrder;
        this.idProdcut = idProdcut;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.Flavor = Flavor;
        this.Size = Size;
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

    public String getFlavor() {
        return Flavor;
    }

    public void setFlavor(String Flavor) {
        this.Flavor = Flavor;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "id=" + id + ", idOrder=" + idOrder + ", idProdcut=" + idProdcut + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", Flavor=" + Flavor + ", Size=" + Size + '}';
    }
    
}
