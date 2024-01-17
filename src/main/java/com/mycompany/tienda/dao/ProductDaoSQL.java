/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.dao;

import com.mycompany.tienda.DB.MySQLConnection;
import com.mycompany.tienda.idao.IProductDaoSQL;
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
public class ProductDaoSQL implements IProductDaoSQL {

    private final String SAVE_DATA_PRODUCT_PROCEDURE = "{call saveDataProduct(?,?,?,?,?,?,?,?,?)}";
    private final String SEARCH_PRODUCT_PROCEDURE = "{call searchProduct(?,?,?,?,?,?,?)}";
    private final String SEARCH_ALL_PRODUCT_PROCEDURE = "{call searchAllProduct()}";

    private Connection connectionSQL;

    MySQLConnection connection = new MySQLConnection();

    public ProductDaoSQL() {
        this.connectionSQL = connection.getConectar();
    }

    @Override
    public String createProduct(Product product) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "create";
            st = connectionSQL.prepareCall(SAVE_DATA_PRODUCT_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, product.getId());
            st.setString(3, product.getName());
            st.setString(4, product.getDescription());
            st.setString(5, product.getFlavores());
            st.setString(6, product.getSize());
            st.setDouble(7, product.getPrice());
            st.setDouble(8, product.getStock());
            st.setString(9, product.getUriImage());
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException e) {
            System.out.println("error en createUSer " + e.toString());
            return "error en createUSer ";
        } finally {
        }
        try {
            connection.cerrarConectar();
        } catch (SQLException ex) {
            System.out.println("Error en la conexion SQL");
            return "error en createUSer ";
        }
        return "error en createUSer ";
    }

    @Override
    public Product searchProduct(int productId) {
        ResultSet rs = null;
        CallableStatement st = null;
        Product product = new Product();

        try {
            String seletion = "searchById";
            st = connectionSQL.prepareCall(SEARCH_PRODUCT_PROCEDURE);
            st.setString(1, seletion);
            st.setString(2, "");
            st.setString(3, "");
            st.setString(4, "");
            st.setString(5, "");
            st.setString(6, "");
            st.setInt(7, productId);
            rs = st.executeQuery();
            while (rs.next()) {
                product = resultSetToProduct(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error searchProducts");
        } finally {
//            try {
//                connection.cerrarConectar();
//            } catch (Exception ex) {
//            }
        }
        return product;
    }

    @Override
    public String updateProduct(Product product) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "update";
            st = connectionSQL.prepareCall(SAVE_DATA_PRODUCT_PROCEDURE);
            st.setString(1, seletion);
            st.setInt(2, product.getId());
            st.setString(3, product.getName());
            st.setString(4, product.getDescription());
            st.setString(5, product.getFlavores());
            st.setString(6, product.getSize());
            st.setDouble(7, product.getPrice());
            st.setDouble(8, product.getStock());
            st.setString(9, product.getUriImage());
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException e) {
            System.out.println("error en createUSer " + e.toString());
            return "error en createUSer ";
        } finally {
        }
        try {
            connection.cerrarConectar();
        } catch (SQLException ex) {
            System.out.println("Error en la conexion SQL");
            return "error en createUSer ";
        }
        return "error en createUSer ";
    }

    @Override
    public String deleteProduct(int productId, String decriptionProduct, String nameProduct) {
        ResultSet rs = null;
        CallableStatement st = null;
        Product product = new Product();

        try {
            String seletion = "delete";
            st = connectionSQL.prepareCall(SEARCH_PRODUCT_PROCEDURE);
            st.setString(1, seletion);
            st.setString(2, nameProduct);
            st.setString(3, decriptionProduct);
            st.setString(4, "");
            st.setString(5, "");
            st.setString(6, "");
            st.setInt(7, productId);
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException ex) {
            System.out.println("Error deleteProduct");
        } finally {
//            try {
//                connection.cerrarConectar();
//            } catch (Exception ex) {
//            }
        }
        return "Error deleteProduct";
    }

    @Override
    public List<Product> searchAllProducts() {
        ResultSet rs = null;
        CallableStatement st = null;
        List<Product> product = new ArrayList<>();

        try {
            st = connectionSQL.prepareCall(SEARCH_ALL_PRODUCT_PROCEDURE);
            rs = st.executeQuery();
            while (rs.next()) {
                product.add((resultSetToProduct(rs)));
            }
        } catch (SQLException ex) {
            System.out.println("Error searchAllProducts");
        } finally {
//            try {
//                connection.cerrarConectar();
//            } catch (Exception ex) {
//            }
        }
        return product;
    }

    public static Product resultSetToProduct(ResultSet rs) throws SQLException {
        Product product = new Product(
                rs.getInt("Product_id"),
                rs.getString("Product_Name"),
                rs.getString("Product_Description"),
                rs.getString("Product_Flavors"),
                rs.getString("Product_Size"),
                Double.parseDouble(rs.getString("Product_Price")),
                Double.parseDouble(rs.getString("Product_Stock")),
                rs.getString("Product_UriImage"));
        return product;

    }
}
