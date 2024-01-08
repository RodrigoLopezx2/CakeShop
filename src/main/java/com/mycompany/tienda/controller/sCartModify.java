/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.tienda.controller;

import com.mycompany.tienda.dao.OrderDetailsDaoSQL;
import com.mycompany.tienda.models.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rodri
 */
public class sCartModify extends HttpServlet {

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
            out.println("<title>Servlet sCartModify</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sCartModify at " + request.getContextPath() + "</h1>");
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
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        System.out.println("OrderId = " + orderId);
        System.out.println("productId = " + productId);
        OrderDetailsDaoSQL orderDetailsDaoSQL = new OrderDetailsDaoSQL();
        String mjs = orderDetailsDaoSQL.deleteOrderDetails(orderId, productId);
        if (mjs.equals("OrderDetails deleted")) {
            System.out.println("OrderDetails deleted ");
        } else {
            System.out.println("sCartModify = " + mjs);
        }
        response.sendRedirect("sCart");
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
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantutyOrderD = Integer.parseInt(request.getParameter("quantityOrderD"));
        System.out.println("OrderId = " + orderId);
        System.out.println("productId = " + productId);
        System.out.println("quantutyOrderD = " + quantutyOrderD);
        OrderDetailsDaoSQL orderDetailsDaoSQL = new OrderDetailsDaoSQL();
        OrderDetails orderDetails = orderDetailsDaoSQL.searchOrderDetails(orderId, productId);
        orderDetails.setQuantity(quantutyOrderD);
        String mjs = orderDetailsDaoSQL.updateOrderDetails(orderDetails);
        if (mjs.equals("orderDetails info updated")) {
            System.out.println("orderDetails info updated ");
        } else {
            System.out.println("sCartModify = " + mjs);
        }
        response.sendRedirect("sCart");
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
