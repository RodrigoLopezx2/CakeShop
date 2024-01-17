/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.dao;

import com.mycompany.tienda.DB.MySQLConnection;
import com.mycompany.tienda.idao.IOrderDetailsDaoSQL;
import com.mycompany.tienda.models.OrderDetails;
import com.mycompany.tienda.models.Product;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rodri
 */
public class OrderDetailsDaoSQL implements IOrderDetailsDaoSQL {

    private final String SAVE_DATA_ORDER_DETAILS_PROCEDURE = "{call saveDataOrderDetails(?,?,?,?,?,?,?,?)}";
    private final String SEARCH_ORDER_DETAILS_PROCEDURE = "{call searchOrderDetails(?,?,?,?,?)}";
    private final String SEARCH_ALL_ORDER_DETAILS_PROCEDURE = "{call searchOrderDetails(?,?,?)}";

    private Connection connectionSQL;
    MySQLConnection connection = new MySQLConnection();

    public OrderDetailsDaoSQL() {
        this.connectionSQL = connection.getConectar();
    }

    @Override
    public String createOrderDetails(OrderDetails orderDetails) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "create";
            st = connectionSQL.prepareCall(SAVE_DATA_ORDER_DETAILS_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, 0);
            st.setInt(3, orderDetails.getIdOrder());
            st.setInt(4, orderDetails.getIdProdcut());
            st.setInt(5, orderDetails.getQuantity());
            st.setString(6, orderDetails.getUnitPrice());
            st.setString(7, orderDetails.getFlavor());
            st.setString(8, orderDetails.getSize());
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException e) {
            System.out.println("error en createOrderDetails " + e.toString());
            return "error en createOrderDetails ";
        } finally {
        }
        try {
            connection.cerrarConectar();
        } catch (SQLException ex) {
            System.out.println("Error en la conexion SQL");
            return "error en createOrderDetails ";
        }
        return "error en createOrderDetails ";
    }

    @Override
    public OrderDetails searchOrderDetails(int orderDetailsId, int productId, String orderDetailFlavor, String orderDetailSize) {
        ResultSet rs = null;
        CallableStatement st = null;
//        List<OrderDetails> listOrderD = new ArrayList<>();
        OrderDetails orderDetails = new OrderDetails();
        try {
            String seletion = "search";
            st = connectionSQL.prepareCall(SEARCH_ORDER_DETAILS_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, orderDetailsId);
            st.setInt(3, productId);
            st.setString(4, orderDetailFlavor);
            st.setString(5, orderDetailSize);
            rs = st.executeQuery();
            while (rs.next()) {
                orderDetails = resultSetToOrderDetails(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error searchOrderDetails");
        } finally {
//            try {
//                connection.cerrarConectar();
//            } catch (Exception ex) {
//            }
        }
        return orderDetails;
    }

    @Override
    public String updateOrderDetails(OrderDetails orderDetails) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "update";

            st = connectionSQL.prepareCall(SAVE_DATA_ORDER_DETAILS_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, orderDetails.getId());
            st.setInt(3, orderDetails.getIdOrder());
            st.setInt(4, orderDetails.getIdProdcut());
            st.setInt(5, orderDetails.getQuantity());
            st.setString(6, orderDetails.getUnitPrice());
            st.setString(7, orderDetails.getFlavor());
            st.setString(8, orderDetails.getSize());
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException e) {
            System.out.println("error en updateOrderDetails " + e.toString());
            return "error en updateOrderDetails ";
        } finally {
        }
//        try {
//            connection.cerrarConectar();
//        } catch (SQLException ex) {
//            System.out.println("Error en la conexion SQL");
//            return "error en updateOrderDetails ";
//        }
        return "error en updateOrderDetails ";
    }

    @Override
    public String deleteOrderDetails(int orderDetailsId, int productId, String orderDetailFlavor, String orderDetailSize) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "delete";
            st = connectionSQL.prepareCall(SEARCH_ORDER_DETAILS_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, orderDetailsId);
            st.setInt(3, productId);
            st.setString(4, orderDetailFlavor);
            st.setString(5, orderDetailSize);
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException ex) {
            System.out.println("Error searchOrderDetails");
        } finally {
        }
        return "Error searchOrderDetails";
    }

    @Override
    public List<OrderDetails> searchAllOrdersDetailsUserCart(int orderId) {
        ResultSet rs = null;
        CallableStatement st = null;
        List<OrderDetails> listOrderD = new ArrayList<>();

        try {
            String seletion = "searchByOrder";
            st = connectionSQL.prepareCall(SEARCH_ORDER_DETAILS_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, orderId);
            st.setInt(3, 0);
            st.setString(4, "");
            st.setString(5, "");
            rs = st.executeQuery();
            while (rs.next()) {
                listOrderD.add((resultSetToOrderDetails(rs)));
            }
        } catch (SQLException ex) {
            System.out.println("Error searchAllOrdersDetailsUser" + ex.toString());
        } finally {
//            try {
//                connection.cerrarConectar();
//            } catch (Exception ex) {
//            }
        }
        return listOrderD;
    }

    private OrderDetails resultSetToOrderDetails(ResultSet rs) throws SQLException {
        OrderDetails orderD = new OrderDetails(
                rs.getInt("Detail_id"),
                rs.getInt("Order_id"),
                rs.getInt("Product_id"),
                rs.getInt("Detail_Quantity"),
                rs.getString("Detail_UnitPrice"),
                rs.getString("Detail_Product_Flavor"),
                rs.getString("Detail_Product_Size"));
        return orderD;
    }

    @Override
    public List<OrderDetails> searchAllOrdersDetailsUser(int orderId) {
        ResultSet rs = null;
        CallableStatement st = null;
        List<OrderDetails> listOrderD = new ArrayList<>();

        try {
            String seletion = "searchAllOrderUser";
            st = connectionSQL.prepareCall(SEARCH_ORDER_DETAILS_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, orderId);
            st.setInt(3, 0);
            st.setString(4, "");
            st.setString(5, "");
            rs = st.executeQuery();
            while (rs.next()) {
                listOrderD.add((resultSetToOrderDetails(rs)));
            }
        } catch (SQLException ex) {
            System.out.println("Error searchAllOrdersDetailsUser" + ex.toString());
        } finally {
//            try {
//                connection.cerrarConectar();
//            } catch (Exception ex) {
//            }
        }
        return listOrderD;
    }

}
