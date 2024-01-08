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
    String createProduct(Product product);/// create
    
    Product searchProduct(int productId);/// read

    String updateProduct(Product product);// update
    
    String deleteProduct(int productId);// delete
    
    List<Product> searchAllProducts();
}
