/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.tienda.idao;

import com.mycompany.tienda.models.Order;
import com.mycompany.tienda.models.Product;
import java.util.List;

/**
 *
 * @author rodri
 */
public interface IOrderDaoSQL {
    String createOrder(Order order);/// create
    
    Order searchOrder(int orderId);/// read
    
    Order searchOrderByUserId(int orderId);/// read

    String updateOrder(Order order);// update
    
    String activeOrders(int userId);// update
    
    String deleteOrder(int orderDetailsId);// delete
    
    List<Order> searchAllOrders();
    
    
}
