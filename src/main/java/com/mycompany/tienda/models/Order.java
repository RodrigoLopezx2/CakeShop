/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.models;

/**
 *
 * @author rodri
 */
public class Order {
    private int id;
    private int idUser;
    private String date;
    private String status;
    private String payment;
    private String direction;

    public Order() {
    }

    public Order(int id, int idUser, String date, String status, String payment, String direction) {
        this.id = id;
        this.idUser = idUser;
        this.date = date;
        this.status = status;
        this.payment = payment;
        this.direction = direction;
    }

        

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", idUser=" + idUser + ", date=" + date + ", status=" + status + ", payment=" + payment + ", direction=" + direction + '}';
    }    
    
}
