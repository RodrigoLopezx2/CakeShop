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
@WebServlet(name = "sUser", urlPatterns = {"/User"})
public class sUser extends HttpServlet {

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
            out.println("<title>Servlet sUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sUser at " + request.getContextPath() + "</h1>");
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
        if (sessionUser.getAttribute("email") == null) {
            response.sendRedirect("index.html");
            System.out.println("Sesion no creada sUser");
        }
        String emailUser = (String) sessionUser.getAttribute("email");
        IDaoUser userDao = new UserDaoSQL();
        User userInfo = userDao.searchUser(emailUser);
        System.out.println("Usuario \n" + userInfo);
        request.setAttribute("userInfo", userInfo);
        request.setAttribute("update", "false");
        request.getRequestDispatcher("pages/userProfile.jsp").forward(request, response);
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
        IDaoUser userDao = new UserDaoSQL();
        User createUser = new User();
        createUser.setAge(Integer.parseInt(request.getParameter("ageUser")));
        createUser.setEmail(request.getParameter("emailUser"));
        String emailUser = createUser.getEmail();
        createUser.setLastName(request.getParameter("lastNameUser"));
        createUser.setName(request.getParameter("nameUser"));
        createUser.setPassword(request.getParameter("passwordUser"));
        createUser.setPhone(request.getParameter("phoneUser"));
        createUser.setUriImage("src/");
        createUser.setDirection(fullDirection);
        if (userDao.createUser(createUser).equals("registered user")) {
            createUser = userDao.searchUser(emailUser);
            HttpSession sessionUser = request.getSession(true);
            sessionUser.setAttribute("email", createUser.getEmail());
            sessionUser.setAttribute("userId", createUser.getId());
            response.sendRedirect("pages/home.jsp");
        } else {
            request.setAttribute("userCreated", "false");
            request.getRequestDispatcher("pages/createUser.jsp").forward(request, response);
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
