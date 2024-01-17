/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.tienda.controller;

import com.mycompany.tienda.dao.OrderDaoSQL;
import com.mycompany.tienda.dao.OrderDetailsDaoSQL;
import com.mycompany.tienda.idao.IOrderDaoSQL;
import com.mycompany.tienda.models.Order;
import com.mycompany.tienda.models.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rodri
 */
public class sCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessionUser = request.getSession();
        if ((sessionUser.getAttribute("email") == null)) {
            response.sendRedirect("index.html");
            System.out.println("Sesion no creada");
        }
        OrderDaoSQL orderDao = new OrderDaoSQL();
        Order order = new Order();
        int userId = (int) sessionUser.getAttribute("userId");
        System.out.println("User id " + userId);
        int orderExists = Integer.parseInt(orderDao.activeOrders(userId));
        System.out.println("OrderExists =" + orderExists);
        if (orderExists == 0) {
            order.setIdUser(userId);
            LocalDate fechaActual = LocalDate.now();
            order.setDate(fechaActual + "");
            order.setStatus("Carrito");
            order.setPayment("");
            order.setDirection("");
            if (orderDao.createOrder(order).equals("registered order")) {
                System.out.println("registered order");
            }
        }
        order = orderDao.searchOrderByUserId(userId);
        OrderDetailsDaoSQL orderDetailsDaoSQL = new OrderDetailsDaoSQL();
        List<OrderDetails> listOrderDetails = new ArrayList<>();
        listOrderDetails = orderDetailsDaoSQL.searchAllOrdersDetailsUserCart(order.getId());
        if (listOrderDetails.size() >= 0) {
            System.out.println(listOrderDetails);
            request.setAttribute("listOrderDetails", listOrderDetails);
            request.getRequestDispatcher("pages/cart.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDaoSQL orderDao = new OrderDaoSQL();
        Order order = new Order();
        HttpSession sessionUser = request.getSession();
        int userId = (int) sessionUser.getAttribute("userId");
        System.out.println("User id " + userId);
        int orderExists = Integer.parseInt(orderDao.activeOrders(userId));
        System.out.println("OrderExists =" + orderExists);
        if (orderExists == 0) {
            order.setIdUser(userId);
            LocalDate fechaActual = LocalDate.now();
            order.setDate(fechaActual + "");
            order.setStatus("Carrito");
            order.setPayment("");
            order.setDirection("");
            if (orderDao.createOrder(order).equals("registered order")) {
                System.out.println("registered order");
            }
        }
        order = orderDao.searchOrderByUserId(userId);
        int requestProductId = Integer.parseInt(request.getParameter("productId"));
        int requestProductQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        String requestProductPrice = request.getParameter("productQuantity");
        String requestProductFlavor = request.getParameter("productFlavor");
        String requestProductSize = request.getParameter("productSize");
        System.out.println("Product id = " + requestProductId);
        System.out.println(requestProductFlavor);
        System.out.println(requestProductSize);
        OrderDetailsDaoSQL orderDetailsDaoSQL = new OrderDetailsDaoSQL();
        OrderDetails createOrderDetails = new OrderDetails();
        createOrderDetails.setIdOrder(order.getId());
        createOrderDetails.setIdProdcut(requestProductId);
        createOrderDetails.setQuantity(requestProductQuantity);
        createOrderDetails.setUnitPrice(requestProductPrice);
        createOrderDetails.setFlavor(requestProductFlavor);
        createOrderDetails.setSize(requestProductSize);
        String mjs = orderDetailsDaoSQL.createOrderDetails(createOrderDetails);
        if (mjs.equals("registered orderDetails")) {
            System.out.println("Producto agregado a la orden");
        } else if (mjs.equals("no posiible registered orderDetails")) {
            System.out.println("Error-" + mjs);
            int orderId = createOrderDetails.getIdOrder();
            int productId = createOrderDetails.getIdProdcut();
            createOrderDetails = orderDetailsDaoSQL.searchOrderDetails(orderId, productId, requestProductFlavor, requestProductSize);
            System.out.println("createOrderDetails = " + createOrderDetails);
            int units = createOrderDetails.getQuantity();
            units++;
            System.out.println("createOrderDetailsU = " + createOrderDetails);
            createOrderDetails.setQuantity(units);
            String mjsR = orderDetailsDaoSQL.updateOrderDetails(createOrderDetails);
            if (mjsR.equals("registered orderDetails")) {
                System.out.println("Producto agregado a la orden");
            }
        }
        response.sendRedirect("sProducts");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
