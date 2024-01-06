/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.tienda.idao;

import com.mycompany.tienda.models.Product;
import java.util.List;

/**
 *
 * @author rodri
 */
public interface IProductDaoSQL {
    String createUser(Product product);/// create
    
    Product searchUser(int productId);/// read

    String updateUser(Product product);// update
    
    String deleteUser(String emailUser);// delete
    
    List<Product> searchAllProducts();
}
