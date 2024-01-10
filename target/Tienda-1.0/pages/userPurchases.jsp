<%-- 
    Document   : cart
    Created on : Jan 7, 2024, 7:42:25 PM
    Author     : rodri
--%>

<%@page import="com.mycompany.tienda.models.Order"%>
<%@page import="com.mycompany.tienda.models.Product"%>
<%@page import="com.mycompany.tienda.dao.ProductDaoSQL"%>
<%@page import="com.mycompany.tienda.models.OrderDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<List<OrderDetails>> detailsEachOrder = new ArrayList<>();
    List<Order> listOrder = new ArrayList<>();
//    List<OrderDetails> listOrderDetails = new ArrayList<>();
    ProductDaoSQL productDao = new ProductDaoSQL();
    detailsEachOrder = (List<List<OrderDetails>>) request.getAttribute("detailsEachOrder");
    listOrder = (List<Order>) request.getAttribute("listOrder");
//    OrderDetails orderDetailsActual = new OrderDetails();
//    if (detailsEachOrder.size() > 0) {
//        orderDetailsActual = listOrderDetails.get(0);
//    }
    double totalCost = 0;
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Mis Compras</title>

        <!-- Agrega los enlaces a los archivos CSS de Bootstrap -->
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
        <div class="container mt-5"  name='productsConteiner' id='productsConteiner'>
            <h2 class="mb-4">Mis Compras</h2>
            <div class="row">
                <%
                    for (int i = 0; i < listOrder.size(); i++) {
                        List<OrderDetails> listOrderDetails = detailsEachOrder.get(i);
                %> 
                <div class="col-md-12">


                    <h4 class="mb-3">Compra <%= i + 1 %></h4>
                    <h5 class="mb-3">Estado de la orden : <%= listOrder.get(i).getStatus() %></h5>
                    <table class="table">
                        <thead>

                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Producto</th>
                                <th scope="col-4">Precio</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col-4">Total</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>

                        </thead>
                        <tbody>
                            <%      for (int j = 0; j < listOrderDetails.size(); j++) {
                                    OrderDetails orderDetails = listOrderDetails.get(j);
                                    Product product = productDao.searchProduct(orderDetails.getIdProdcut());
                            %>
                            <tr>

                                <th scope="col"><%= j + 1%></th>
                                <td><%= product.getName()%></td>
                                <td>$ <%= product.getPrice()%></td>
                                <td>$ <%= orderDetails.getQuantity()%></td>
                                <%
                                    double totalUnitario = product.getPrice() * orderDetails.getQuantity();
                                    totalCost += totalUnitario;
                                %> 
                                <td>$ <%= totalUnitario%></td>

                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td>Total : </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ <%= totalCost%></td>
                            </tr>
                            <!-- Puedes agregar más filas según sea necesario -->
                        </tbody>
                    </table>

                </div>
                <%
                    totalCost=0;
                    }
                %>
                <a href="pages/home.jsp" class="btn btn-primary">Regresar al home</a>
            </div>
        </div>
    </div>

    <!-- Agrega los enlaces a los archivos JavaScript de Bootstrap (si es necesario) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
