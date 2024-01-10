<%-- 
    Document   : catalog
    Created on : Jan 6, 2024, 1:39:13 AM
    Author     : rodri
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.tienda.models.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<Product> listProducts = new ArrayList<>();

    listProducts = (List<Product>) request.getAttribute("listProducts");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <%                for (int i = 0; i < listProducts.size(); i++) {
                        Product product = listProducts.get(i);
                %> 
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="<%= product.getUriImage()%>" class="card-img-top img-fluid img-thumbnail" alt="Nombre del producto">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p class="card-text"><%= product.getDescription()%></p>
                            <p class="card-text"><%= product.getPrice()%></p>
                            <p class="card-text"><%= product.getStock()%></p>
                            <form  action="sCart" method="POST" id="form_registerOrder">
                                <input type="hidden" name="productId" id="productId" value="<%= product.getId()%>">
                                <input type="hidden" name="productQuantity" id="productQuantity" value="1">
                                <input type="hidden" name="productPrice" id="productPrice" value="<%= product.getPrice()%>">
                                <input class="btn btn-primary btn-block" type="submit" value="Agregar al carrito" name="Envia">
                            </form>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
    </body>
<!--    <script>
        // Selecciona todas las imágenes dentro del contenedor
        var imagenes = document.querySelectorAll('#productsConteiner img');

        // Cambia el tamaño de todas las imágenes
        imagenes.forEach(function (imagen) {
             // Establece el ancho al 100% para que se ajuste al contenedor
        imagen.style.width = '100%';
        // Establece la altura automática para mantener la proporción original
        imagen.style.height = 'auto';
        });
    </script>-->
</html>
