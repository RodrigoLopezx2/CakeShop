<%-- 
    Document   : home
    Created on : Jan 5, 2024, 2:52:11 AM
    Author     : rodri
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.tienda.models.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="../ErrorPage.html"%>
<%

    HttpSession sessionUser = (HttpSession) request.getSession();
    List<Product> listProducts = new ArrayList<>();
    String emailUser = (String) sessionUser.getAttribute("email");
    listProducts = (List<Product>) sessionUser.getAttribute("listLastsProducts");
    System.out.println("ListaHome :" + listProducts );

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Dulzura Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Mi Tienda</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../sProducts">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../sCart">Carrito</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../sUserPurchases">Mis compras</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../sUser">Mi perfil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Session">Cerrar Sesion</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../images/image1.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="../images/image2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="../images/image3.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
        </div>
        
        <div class="container mt-5" name='productsConteiner' id='productsConteiner'>
            <<h2>Ultimos productos comprados</h2>
            <div class="row">
                <%                for (int i = 0; i < listProducts.size(); i++) {
                        Product product = listProducts.get(i);
                        List<String> dataFlavors = new ArrayList<String>();
                        dataFlavors = Arrays.asList(product.getFlavores().split("/"));
                        List<String> dataSizes = new ArrayList<String>();
                        dataSizes = Arrays.asList(product.getSize().split("/"));
                %> 

                <div class="col-md-4 mb-4">
                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#<%= product.getName()%><%= product.getId()%>">
                        <div class="card">
                            <img src="../<%= product.getUriImage()%>" class="card-img-top img-fluid img-thumbnail" alt="Nombre del producto">
                            <div class="card-body">
                                <h5 class="card-title"><%= product.getName()%></h5>
                                <p class="card-text"><%= product.getDescription()%></p>
                                <p class="card-text"><%= product.getPrice()%></p>
                            </div>
                        </div>
                    </button>      
                    <form  action="../sCart" method="POST" id="form_registerOrder">
                        <div class="modal fade" id="<%= product.getName()%><%= product.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel"><%= product.getName()%></h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body">
                                        <div class="card">
                                            <img src="../<%= product.getUriImage()%>" class="card-img-top img-fluid img-thumbnail" alt="Nombre del producto">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= product.getName()%></h5>
                                                <p class="card-text"><%= product.getDescription()%></p>
                                                <p class="card-text"><%= product.getPrice()%></p>
                                                <select class="form-select" aria-label="Default select example"  name="productFlavor">
                                                    <option selected>Elige el sabor</option>
                                                    <%
                                                        for (int j = 0; j < dataFlavors.size(); j++) {
                                                    %>
                                                    <option value="<%= dataFlavors.get(j)%>"><%= dataFlavors.get(j)%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                                <hr>
                                                <select class="form-select" aria-label="Default select example" name="productSize">
                                                    <option selected>Elige el tamaño</option>
                                                    <%
                                                        for (int j = 0; j < dataSizes.size(); j++) {
                                                    %>
                                                    <option value="<%= dataSizes.get(j)%>"><%= dataSizes.get(j)%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>

                                                <input type="hidden" name="productId" id="productId" value="<%= product.getId()%>">
                                                <input type="hidden" name="productQuantity" id="productQuantity" value="1">
                                                <input type="hidden" name="productPrice" id="productPrice" value="<%= product.getPrice()%>">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <input class="btn btn-primary btn-block" type="submit" value="Agregar al carrito" name="Envia">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>    
                </div>

                <%
                    }
                %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    </body>

</html>
