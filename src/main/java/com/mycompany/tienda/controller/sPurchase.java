/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.tienda.controller;

import com.mycompany.tienda.dao.OrderDaoSQL;
import com.mycompany.tienda.dao.OrderDetailsDaoSQL;
import com.mycompany.tienda.dao.UserDaoSQL;
import com.mycompany.tienda.models.Order;
import com.mycompany.tienda.models.OrderDetails;
import com.mycompany.tienda.models.User;
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
public class sPurchase extends HttpServlet {

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
            out.println("<title>Servlet sPurchase</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sPurchase at " + request.getContextPath() + "</h1>");
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
        
        int userId = (int) sessionUser.getAttribute("userId");
        String emailUser = (String) sessionUser.getAttribute("email");
        Order order = new Order();
        order = orderDao.searchOrderByUserId(userId);
        UserDaoSQL userDAO = new UserDaoSQL();
        User user = userDAO.searchUser(emailUser);
        OrderDetailsDaoSQL orderDetailsDaoSQL = new OrderDetailsDaoSQL();
        List<OrderDetails> listOrderDetails = new ArrayList<>();
        listOrderDetails = orderDetailsDaoSQL.searchAllOrdersDetailsUserCart(order.getId());
        if (listOrderDetails.size() >= 0) {
            System.out.println(listOrderDetails);
            request.setAttribute("listOrderDetails", listOrderDetails);
            request.setAttribute("direction_User", user.getDirection());
            request.getRequestDispatcher("pages/purchase.jsp").forward(request, response);
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

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        int userId = (int) sessionUser.getAttribute("userId");
        order.setId(orderId);
        order.setIdUser(userId);
        order = orderDao.searchOrderByUserId(userId);

        String directionSaved = (String) request.getParameter("directionSaved");
        String directionNew = (String) request.getParameter("newDirectionOrder");
        System.out.println("directionSaved " + directionSaved);
        System.out.println("directionNew " + directionNew);
        if (!directionNew.equals("newDirectionOrder") || directionSaved.equals("//////")) {
            String stateDirection = (String) request.getParameter("stateDirection");
            String municipioDirection = (String) request.getParameter("municipioDirection");
            String coloniaDirection = (String) request.getParameter("coloniaDirection");
            String streetDirection = (String) request.getParameter("streetDirection");
            String numberInDirection = (String) request.getParameter("numberInDirection");
            String numberOutDirection = (String) request.getParameter("numberOutDirection");
            String referenceDirection = (String) request.getParameter("referenceDirection");
            String fullDirection = stateDirection + "/" + municipioDirection + "/"
                    + coloniaDirection + "/" + streetDirection + "/" + numberInDirection
                    + "/" + numberOutDirection + "/" + referenceDirection;
            order.setDirection(fullDirection);
        }

        order.setDirection(directionSaved);

        String nameCard = (String) request.getParameter("nameCard");
        String numberCard = (String) request.getParameter("numberCard");
        String mouthCard = (String) request.getParameter("mouthCard");
        String yearCard = (String) request.getParameter("yearCard");
        String codeCard = (String) request.getParameter("codeCard");
        String fullPayment = nameCard + "/" + numberCard + "/"
                + mouthCard + ":" + yearCard + "/" + codeCard;

        order.setStatus("En camino");
        order.setPayment(fullPayment);

        String mjs = orderDao.updateOrder(order);
        if (mjs.equals("Order info updated")) {
            System.out.println("Carrito comprado");
        }
        response.sendRedirect("pages/home.jsp");
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
