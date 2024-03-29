<%-- 
    Document   : catalog
    Created on : Jan 6, 2024, 1:39:13 AM
    Author     : rodri
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.tienda.models.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="../ErrorPage.html"%>
<!DOCTYPE html>
<%
    List<Product> listProducts = new ArrayList<>();
    listProducts = (List<Product>) request.getAttribute("listProducts");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products CRUD</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Mi Tienda</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="pages/home.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sProducts">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sCart">Carrito</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sUserPurchases">Mis compras</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sUser">Mi perfil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Session">Cerrar Sesion</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-5" name='productsConteiner' id='productsConteiner'>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <form  action="sProducts" method="POST" enctype="multipart/form-data" >
                        <div class="card">
                            <!--                            <img src="../images/image1.jpg" class="card-img-top img-fluid img-thumbnail" alt="Nombre del producto">-->
                            <div class="m-1">
                                <label for="formFile" class="form-label">Imagen del  producto:</label>
                                <input class="form-control form-control-sm" type="file" id="imageProduct" name="imageProduct" >
                            </div>
                            <div class="card-body">
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Nombre producto:</label>
                                    <input type="text" class="form-control" placeholder="First name" aria-label="First name" name="nameProduct">
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Descripcion:</label>
                                    <textarea type="text" class="form-control" id="description" name="descriptionProduct"></textarea>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Sabores:</label>
                                    <textarea type="text" class="form-control" id="description"  name="flavorsProduct"></textarea>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Tamaño:</label>
                                    <textarea type="text" class="form-control" id="description"  name="sizeProduct"></textarea>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Precio:</label>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">$</span>
                                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="priceProduct" >
                                        <span class="input-group-text">.00</span>
                                    </div>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Stock:</label>
                                    <input type="text" class="form-control" id="validationCustom05"  name="stockProduct">
                                </div>
                                <div class="mb-1">
                                    <input class="btn btn-primary btn-block mb-3" type="submit" value="Crear Producto" name="Envia">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <%                for (int i = 0; i < listProducts.size(); i++) {
                        Product product = listProducts.get(i);
                %> 
                <div class="col-md-4 mb-4">
                    <form  action="sProductsModify" method="POST" id="form_registerOrder" enctype="multipart/form-data">
                        <div class="card">
                            <img src="<%= product.getUriImage()%>" class="card-img-top img-fluid img-thumbnail" alt="Nombre del producto">
                            <div class="m-1">
                                <label for="formFile" class="form-label">Imagen del  producto:</label>
                                <input class="form-control form-control-sm" type="file" id="formFile" value="<%= product.getUriImage()%>" name="imageProduct">
                                <input  type="hidden" value="<%= product.getUriImage()%>" name="imageProductConsult">
                            </div>
                            <div class="card-body">
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Nombre producto:</label>
                                    <input type="text" class="form-control" placeholder="First name" aria-label="First name" name="nameProduct" value="<%= product.getName()%>">
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Descripcion:</label>
                                    <textarea type="text" class="form-control" id="description" value="<%= product.getDescription()%>" name="descriptionProduct"><%= product.getDescription()%></textarea>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Sabores:</label>
                                    <textarea type="text" class="form-control" id="description" value="<%= product.getDescription()%>" name="flavorsProduct"><%= product.getFlavores()%></textarea>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Tamaño:</label>
                                    <textarea type="text" class="form-control" id="description" value="<%= product.getDescription()%>" name="sizeProduct"><%= product.getSize()%></textarea>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Precio:</label>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">$</span>
                                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" value="<%= product.getPrice()%>" name="priceProduct">
                                        <span class="input-group-text">.00</span>
                                    </div>
                                </div>
                                <div class="mb-1">
                                    <label for="formGroupExampleInput" class="form-label">Stock:</label>
                                    <input type="text" class="form-control" id="validationCustom05" required value="<%= product.getStock()%>" name="stockProduct">
                                </div>
                                <div class="mb-1">
                                    <input type="hidden" value="<%= product.getId()%>" name="idProduct">
                                    <input class="btn btn-warning btn-block mb-3" type="submit" value="Modificar Producto" name="Envia">
                                    </form>
                                    <form  action="sProductsModify" method="GET" id="form_registerOrder">
                                        <input type="hidden" value="<%= product.getId()%>" name="idProduct">
                                        <input type="hidden" value="<%= product.getName()%>" name="nameProduct">
                                        <input type="hidden" value="<%= product.getDescription()%>" name="descriptionProduct">
                                        <input class="btn btn-danger btn-block mb-3" type="submit" value="Eliminar Producto" name="Envia">
                                    </form>
                                </div>
                            </div>
                        </div>
                </div>
                <%
                    }
                %>
            </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
\