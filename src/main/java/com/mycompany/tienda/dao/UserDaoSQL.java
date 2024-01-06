/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tienda.dao;

import com.mycompany.tienda.DB.MySQLConnection;
import com.mycompany.tienda.models.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mycompany.tienda.idao.IDaoUser;

/**
 *
 * @author rodri
 */
public class UserDaoSQL implements IDaoUser {

    private final String SAVE_DATA_USER_PROCEDURE = "{call saveDataUser(?,?,?,?,?,?,?,?,?)}";
    private final String SEARCH_USER_PROCEDURE = "{call searchUser(?,?,?)}";

    private Connection connectionSQL;

    MySQLConnection connection = new MySQLConnection();

    public UserDaoSQL() {
        this.connectionSQL = connection.getConectar();
    }

    @Override
    public String createUser(User user) {
        ResultSet rs = null;
        CallableStatement st = null;
        try {
            String seletion = "create";
            st = connectionSQL.prepareCall(SAVE_DATA_USER_PROCEDURE);
            st.setString(1, seletion);
            st.setString(2, user.getName());
            st.setString(3, user.getLastName());
            st.setString(4, user.getAge() + "");
            st.setString(5, user.getEmail());
            st.setString(6, user.getPassword());
            st.setString(7, user.getPhone());
            st.setString(8, user.getUriImage());
            st.setString(9, user.getDirection());

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
    public String loginUser(User user) {
        ResultSet rs = null;
        CallableStatement st = null;
        String id = "login";
        try {
            st = connectionSQL.prepareCall(SEARCH_USER_PROCEDURE);
            st.setString(1, id);
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (Exception e) {
            System.out.println("error login " + e.toString());
        } finally {

            try {
                connection.cerrarConectar();
            } catch (SQLException ex) {

            }
        }
        return "error login";
    }

    @Override
    public User searchUser(String emailUser) {
        User user = new User();
        try {
            ResultSet rs = null;
            CallableStatement st = null;
            String id = "search";
            st = connectionSQL.prepareCall(SEARCH_USER_PROCEDURE);
            st.setString(1, id);
            st.setString(2, emailUser);
            st.setString(3, "");
            rs = st.executeQuery();
            if (rs.next()) {
                user.setName(rs.getString("User_Name"));
                user.setLastName(rs.getString("User_LastName"));
                user.setAge(Integer.parseInt(rs.getString("User_Age")));
                user.setEmail(rs.getString("User_Email"));
                user.setPassword(rs.getString("User_Password"));
                user.setPhone(rs.getString("User_Phone"));
                user.setUriImage(rs.getString("User_UriImage"));
                user.setDirection(rs.getString("User_Direction"));
                return user;
            }
        } catch (Exception e) {
            System.out.println("error searchUser " + e.toString());
        } finally {

            try {
                connection.cerrarConectar();
            } catch (SQLException ex) {

            }
        }
        return user;
    }

    @Override
    public String updateUser(User u) {
        try {
            String seletion = "update";
            CallableStatement st = connectionSQL.prepareCall(SAVE_DATA_USER_PROCEDURE);
            st.setString(1, seletion);
            st.setString(2, u.getName());
            st.setString(3, u.getLastName());
            st.setString(4, u.getAge() + "");
            st.setString(5, u.getEmail());
            st.setString(6, u.getPassword());
            st.setString(7, u.getPhone());
            st.setString(8, u.getUriImage());
            st.setString(9, u.getDirection());

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (SQLException e) {
            System.out.println("error en updateUSer" + e.toString());
            return "error en updateUSer";
        } finally {
        }
        try {
            connection.cerrarConectar();
        } catch (SQLException ex) {
            System.out.println("Error en la conexion SQL");
            return "error en updateUSer";
        }

        return "error en updateUSer";
    }

    @Override
    public String deleteUser(String emailUser) {
        try {
            ResultSet rs = null;
            CallableStatement st = null;
            String id = "delete";
            st = connectionSQL.prepareCall(SEARCH_USER_PROCEDURE);
            st.setString(1, id);
            st.setString(2, emailUser);
            st.setString(3, "");
            rs = st.executeQuery();
            if (rs.next()) {
                String msj = rs.getString("Message");
                return msj;
            }
        } catch (Exception e) {
            System.out.println("error deleteUser " + e.toString());
        } finally {

            try {
                connection.cerrarConectar();
            } catch (SQLException ex) {

            }
        }
        return "error deleteUser";
    }

}
