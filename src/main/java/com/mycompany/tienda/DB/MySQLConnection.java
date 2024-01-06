/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author rodri
 */
public class MySQLConnection {
    private Connection connect;

    public MySQLConnection() {

        String server = "localhost";
        String baseDatos = "CakeShop";
        String usr = "root";
        String pswd = "n0m3l0_416";
        String url = "jdbc:mysql://"+server+"/"+baseDatos;

        try {
            // Cargar el driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Obtener la conexión
            connect = DriverManager.getConnection(url,usr,pswd);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Manejo básico de errores. En un entorno de producción, considera usar un sistema de registro adecuado.
            throw new RuntimeException("Error al conectar a la base de datos", e);
        }
    }
    
    public Connection getConectar() {
        return connect;
    }
    
    public void cerrarConectar() throws SQLException{
        connect.close();
    }
}
