/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.tienda.controller;

import com.mycompany.tienda.dao.UserDaoSQL;
import com.mycompany.tienda.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mycompany.tienda.idao.IDaoUser;

/**
 *
 * @author rodri
 */
//@WebServlet(name = "sUserModify", urlPatterns = {"/UserMod"})
public class sUserModify extends HttpServlet {

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
            out.println("<title>Servlet sUserModify</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sUserModify at " + request.getContextPath() + "</h1>");
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
        IDaoUser userDao = new UserDaoSQL();
        
        if (userDao.deleteUser(request.getParameter("emailUser")).equals("User deleted")) {
            response.sendRedirect("index.html");
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
        IDaoUser userDao = new UserDaoSQL();
        User updateUser = new User();
        updateUser.setAge(Integer.parseInt(request.getParameter("ageUser")));
        updateUser.setEmail(request.getParameter("emailUser"));
        updateUser.setLastName(request.getParameter("lastNameUser"));
        updateUser.setName(request.getParameter("nameUser"));
        updateUser.setPassword(request.getParameter("passwordUser"));
        updateUser.setPhone(request.getParameter("phoneUser"));
        updateUser.setDirection(request.getParameter("directionUser"));
        updateUser.setUriImage(request.getParameter("src/"));
//            updateUser.setUriImage(request.getParameter("phoneUser"));
        if (userDao.updateUser(updateUser).equals("User info updated")) {
            request.setAttribute("userInfo", updateUser);
            request.setAttribute("update", "true");
            request.getRequestDispatcher("pages/userProfile.jsp").forward(request, response);
        }
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
