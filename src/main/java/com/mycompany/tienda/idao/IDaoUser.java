/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.tienda.idao;

import com.mycompany.tienda.models.Product;
import com.mycompany.tienda.models.User;
import java.util.List;

/**
 *
 * @author rodri
 */
public interface IDaoUser {

    String createUser(User user);/// create

    String loginUser(User user);

    User searchUser(String emailUser);/// read

    String updateUser(User user);// update

    String deleteUser(String emailUser);// delete
    
    List<Product> searchLastProductsUser(String emailUser);

    boolean closeDBConnection();
}
