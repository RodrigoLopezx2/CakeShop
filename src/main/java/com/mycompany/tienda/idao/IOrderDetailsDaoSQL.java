/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.tienda.idao;

import com.mycompany.tienda.models.Order;
import com.mycompany.tienda.models.OrderDetails;
import java.util.List;

/**
 *
 * @author rodri
 */
public interface IOrderDetailsDaoSQL {
    String createOrderDetails(OrderDetails orderDetails);/// create
    
    OrderDetails searchOrderDetails(int orderDetailsId, int productId);/// read

    String updateOrderDetails(OrderDetails orderDetails);// update
    
    String deleteOrderDetails(int orderDetailsId, int productId);// delete
    
    List<OrderDetails> searchAllOrdersDetailsUserCart(int orderId);
    
    List<OrderDetails> searchAllOrdersDetailsUser(int orderId);
    
}
