/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.tienda.controller;

import com.mycompany.tienda.dao.ProductDaoSQL;
import com.mycompany.tienda.idao.IProductDaoSQL;
import com.mycompany.tienda.models.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author rodri
 */
@MultipartConfig
public class sProducts extends HttpServlet {

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
            out.println("<title>Servlet sProducts</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sProducts at " + request.getContextPath() + "</h1>");
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
        } else {

            String userEmail = (String) sessionUser.getAttribute("email");

            IProductDaoSQL productsDao = new ProductDaoSQL();
            List<Product> listProducts = new ArrayList<>();
            listProducts = productsDao.searchAllProducts();
            if (listProducts.size() != 0) {
                //            System.out.println(listProducts);
                request.setAttribute("listProducts", listProducts);
                if (userEmail.equals("admin@gmail.com")) {
                    request.getRequestDispatcher("pages/productsAdmin.jsp").forward(request, response);
                }
                request.getRequestDispatcher("pages/catalog.jsp").forward(request, response);
            }
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
        String directorioDestino = "C:\\Users\\rodri\\OneDrive\\Documentos\\NetBeansProjects\\Tienda\\src\\main\\webapp\\images\\";

        Part archivoPart = request.getPart("imageProduct");

        String nombreArchivo = getNombreArchivo(archivoPart);

        archivoPart.write(directorioDestino + File.separator + nombreArchivo);

        IProductDaoSQL productDao = new ProductDaoSQL();
        Product createProduct = new Product();
        File archivo = new File(directorioDestino + nombreArchivo);
        if (archivo.exists()) {
            createProduct.setName(request.getParameter("nameProduct"));
            createProduct.setDescription(request.getParameter("descriptionProduct"));
            createProduct.setPrice(Double.parseDouble(request.getParameter("priceProduct")));
            createProduct.setStock(Double.parseDouble(request.getParameter("stockProduct")));
            createProduct.setStock(Double.parseDouble(request.getParameter("stockProduct")));
            createProduct.setFlavores(request.getParameter("flavorsProduct"));
            createProduct.setSize(request.getParameter("sizeProduct"));
            createProduct.setUriImage("images/" + nombreArchivo);
            String mjs = productDao.createProduct(createProduct);
            if (mjs.equals("registered product")) {
                response.sendRedirect("sProducts");
            }
        } else {
            System.out.println("El archivo no existe.");
        }

    }

    private String getNombreArchivo(final Part part) {
        final String parteHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
