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
import javax.servlet.http.HttpSession;
import com.mycompany.tienda.idao.IDaoUser;

/**
 *
 * @author rodri
 */
@WebServlet(name = "sUserSession", urlPatterns = {"/Session"})
public class sUserSession extends HttpServlet {

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
            out.println("<title>Servlet Sessions login logout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sessions at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.html");
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

        String requestEmail = request.getParameter("emailUser");
        String requestPassword = request.getParameter("passwordUser");
//        System.out.println(requestEmail);
//        System.out.println(requestPassword);
        IDaoUser userDao = new UserDaoSQL();
        User userLogIn = new User(requestEmail, requestPassword);
//        System.out.println(userDao.loginUser(userLogIn));
        String responseSQL = userDao.loginUser(userLogIn);
        if (responseSQL.equals("login true")) {
            userLogIn = userDao.searchUser(requestEmail);
            HttpSession sessionUser = request.getSession(true);
            sessionUser.setAttribute("email", requestEmail);
            sessionUser.setAttribute("userId", userLogIn.getId());
            response.sendRedirect("pages/home.jsp");
        } else if (responseSQL.equals("login false")) {
            request.setAttribute("sessionUser", "false");
            request.getRequestDispatcher("main.jsp").forward(request, response);
        } else if (responseSQL.equals("Email doesnt exists")) {
            request.setAttribute("sessionUser", "null");
            request.getRequestDispatcher("main.jsp").forward(request, response);
        }
        userDao.closeDBConnection();
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
