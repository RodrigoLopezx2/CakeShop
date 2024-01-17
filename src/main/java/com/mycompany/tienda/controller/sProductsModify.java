/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.tienda.controller;

import com.mycompany.tienda.dao.ProductDaoSQL;
import com.mycompany.tienda.idao.IProductDaoSQL;
import com.mycompany.tienda.models.Product;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
public class sProductsModify extends HttpServlet {

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
            out.println("<title>Servlet sProductsModify</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sProductsModify at " + request.getContextPath() + "</h1>");
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
        int idProduct = (int) Integer.parseInt(request.getParameter("idProduct"));
        String nameProduct = (String) request.getParameter("nameProduct");
        String descriptionProduct = (String) request.getParameter("descriptionProduct");
        IProductDaoSQL productDao = new ProductDaoSQL();
        String mjs = productDao.deleteProduct(idProduct, descriptionProduct, nameProduct);
        if (mjs.equals("Product deleted")) {
            response.sendRedirect("sProducts");
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

        File archivo = new File(directorioDestino + nombreArchivo);
        if (!archivo.exists()) {
            archivoPart.write(directorioDestino + File.separator + nombreArchivo);
        } else {
            System.out.println("El archivo ya existe.");
        }
        IProductDaoSQL productDao = new ProductDaoSQL();
        Product updateProduct = new Product();
        updateProduct.setId(Integer.parseInt(request.getParameter("idProduct")));
        updateProduct.setName(request.getParameter("nameProduct"));
        updateProduct.setDescription(request.getParameter("descriptionProduct"));
        updateProduct.setFlavores(request.getParameter("flavorsProduct"));
        updateProduct.setSize(request.getParameter("sizeProduct"));
        updateProduct.setPrice(Double.parseDouble(request.getParameter("priceProduct")));
        updateProduct.setStock(Double.parseDouble(request.getParameter("stockProduct")));
        if (nombreArchivo.equals("")) {
            nombreArchivo = (String) request.getParameter("imageProductConsult");
            updateProduct.setUriImage(nombreArchivo);
        } else {
            updateProduct.setUriImage("images/" + nombreArchivo);
        }
        String mjs = productDao.updateProduct(updateProduct);
        if (mjs.equals("Product info updated")) {
            response.sendRedirect("sProducts");
        }
    }

    private String getNombreArchivo(final Part part) {
        final String parteHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        String reponse = "";
        return reponse;
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
