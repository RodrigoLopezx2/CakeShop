/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.tienda.controller;

import com.mycompany.tienda.dao.OrderDaoSQL;
import com.mycompany.tienda.dao.OrderDetailsDaoSQL;
import com.mycompany.tienda.models.Order;
import com.mycompany.tienda.models.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
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
public class sUserPurchases extends HttpServlet {

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
            out.println("<title>Servlet sUserPurchases</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sUserPurchases at " + request.getContextPath() + "</h1>");
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
//      Order order = new Order();
//      int orderId = Integer.parseInt(request.getParameter("orderId"));
        
        int userId = (int) sessionUser.getAttribute("userId");

        List<List<OrderDetails>> detailsEachOrder = new ArrayList<>();

        List<Order> listOrder = new ArrayList<>();
        listOrder = orderDao.searchOrdersUser(userId);

        System.out.println(listOrder);

        for (Order order : listOrder) {
            OrderDetailsDaoSQL orderDetailsDaoSQL = new OrderDetailsDaoSQL();
            List<OrderDetails> listOrderDetails = new ArrayList<>();
            listOrderDetails = orderDetailsDaoSQL.searchAllOrdersDetailsUser(order.getId());
            detailsEachOrder.add(listOrderDetails);
        }

        if (listOrder.size() >= 0) {
            System.out.println("Sending list orders");
            request.setAttribute("detailsEachOrder", detailsEachOrder);
            request.setAttribute("listOrder", listOrder);
            request.getRequestDispatcher("pages/userPurchases.jsp").forward(request, response);
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
        processRequest(request, response);
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
