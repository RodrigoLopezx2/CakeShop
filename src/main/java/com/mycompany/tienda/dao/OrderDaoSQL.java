/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.dao;

import com.mycompany.tienda.DB.MySQLConnection;
import com.mycompany.tienda.idao.IOrderDaoSQL;
import com.mycompany.tienda.models.Order;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author rodri
 */
public class OrderDaoSQL implements IOrderDaoSQL {

    private final String SAVE_DATA_ORDER_PROCEDURE = "{call saveDataOrder(?,?,?,?,?)}";
    private final String SEARCH_ORDER_PROCEDURE = "{call searchOrder(?,?,?,?)}";
    private final String SEARCH_ALL_ORDER_PROCEDURE = "{call searchAllOrders()}";

    private Connection connectionSQL;
    MySQLConnection connection = new MySQLConnection();

    public OrderDaoSQL() {
        this.connectionSQL = connection.getConectar();
    }

    @Override
    public String createOrder(Order order) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "create";
            st = connectionSQL.prepareCall(SAVE_DATA_ORDER_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, 0);
            st.setInt(3, order.getIdUser());
            st.setString(4, order.getDate() + "");
            st.setString(5, order.getStatus());

            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException e) {
            System.out.println("error en createOrder " + e.toString());
            return "error en createOrder ";
        } finally {
        }
//        try {
//            connection.cerrarConectar();
//        } catch (SQLException ex) {
//            System.out.println("Error en la conexion SQL");
//            return "error en createUSer ";
//        }
        return "error en createOrder ";
    }

    @Override
    public Order searchOrder(int orderId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String updateOrder(Order order) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "update";
            st = connectionSQL.prepareCall(SAVE_DATA_ORDER_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, order.getId());
            st.setInt(3, order.getIdUser());
            st.setString(4, order.getDate() + "");
            st.setString(5, order.getStatus());

            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException e) {
            System.out.println("error en createOrder " + e.toString());
            return "error en createOrder ";
        } finally {
        }
//        try {
//            connection.cerrarConectar();
//        } catch (SQLException ex) {
//            System.out.println("Error en la conexion SQL");
//            return "error en createUSer ";
//        }
        return "error en createOrder ";
    }

    @Override
    public String deleteOrder(int orderDetailsId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order> searchAllOrders() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String activeOrders(int userId) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "active";
            st = connectionSQL.prepareCall(SEARCH_ORDER_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, userId);
            st.setString(3, "");
            st.setString(4, "");
//            st.setString(5, "");

            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                String orderExists = rs.getString("orderExists");
                return orderExists;
            }
        } catch (SQLException e) {
            System.out.println("error en activeOrders " + e.toString());
            return "error en activeOrders ";
        } finally {
        }
//        try {
//            connection.cerrarConectar();
//        } catch (SQLException ex) {
//            System.out.println("Error en la conexion SQL");
//            return "error en createUSer ";
//        }
        return "error en activeOrders ";
    }

    @Override
    public Order searchOrderByUserId(int userId) {
        ResultSet rs = null;
        CallableStatement st = null;
        Order orderFound = new Order();
        try {
            String seletion = "find-Actives";
            st = connectionSQL.prepareCall(SEARCH_ORDER_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, userId);
            st.setString(3, "");
            st.setString(4, "");
//            st.setString(5, "");

            rs = st.executeQuery();
            if (rs.next()) {
                orderFound.setId(Integer.parseInt(rs.getString("Order_id")));
                orderFound.setIdUser(Integer.parseInt(rs.getString("User_id")));
                orderFound.setDate(rs.getString("Order_Date"));
                orderFound.setStatus(rs.getString("Order_Status"));
                return orderFound;
            }
        } catch (SQLException e) {
            System.out.println("error en searchOrderByUserId " + e.toString());
            return orderFound;
        } finally {
        }
//        try {
//            connection.cerrarConectar();
//        } catch (SQLException ex) {
//            System.out.println("Error en la conexion SQL");
//            return "error en createUSer ";
//        }
        return orderFound;
    }

}
