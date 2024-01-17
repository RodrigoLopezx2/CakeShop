<%-- 
    Document   : cart
    Created on : Jan 7, 2024, 7:42:25 PM
    Author     : rodri
--%>

<%@page import="com.mycompany.tienda.models.Product"%>
<%@page import="com.mycompany.tienda.dao.ProductDaoSQL"%>
<%@page import="com.mycompany.tienda.models.OrderDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="../ErrorPage.html"%>
<%
    List<OrderDetails> listOrderDetails = new ArrayList<>();
    ProductDaoSQL productDao = new ProductDaoSQL();
    listOrderDetails = (List<OrderDetails>) request.getAttribute("listOrderDetails");
    OrderDetails orderDetailsActual = new OrderDetails();
    if (listOrderDetails.size() > 0) {
        orderDetailsActual = listOrderDetails.get(0);
    }
    double totalCost = 0;
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Carrito de Compras</title>

        <!-- Agrega los enlaces a los archivos CSS de Bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Mi Tienda</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Inicio</a>
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
            <h2 class="mb-4">Carrito de Compras</h2>
            <div class="row">
                <div class="col-md-8">
                    <table class="table">
                        <thead>

                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Total</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>

                        </thead>
                        <tbody>
                            <!-- Ejemplo de un artículo en el carrito -->
                            <%                                for (int i = 0; i < listOrderDetails.size(); i++) {
                                    OrderDetails orderDetails = listOrderDetails.get(i);
                                    Product product = productDao.searchProduct(orderDetails.getIdProdcut());
                            %> 
                            <tr>

                                <th scope="row"><%= i + 1%></th>
                                <td><%= product.getName()%></td>
                                <td>$ <%= product.getPrice()%></td>
                                <td>
                                    <form  action="sCartModify" method="POST" id="form_registerOrder">
                                        <input type="hidden" name="orderId" id="orderId" value="<%= orderDetails.getIdOrder()%>">
                                        <input type="hidden" name="productId" id="productId" value="<%= product.getId()%>">
                                        <input type="number" class="form-control form-control-sm" min="1" id="quantityOrderD" name="quantityOrderD" value="<%= orderDetails.getQuantity()%>">
                                        </td>
                                        <%
                                            double totalUnitario = product.getPrice() * orderDetails.getQuantity();
                                            totalCost += totalUnitario;
                                        %> 
                                        <td>$ <%= totalUnitario%></td>
                                        <td>
                                            <input class="btn btn-success" type="submit" value="X" name="X">
                                    </form>
                                </td>

                                <td>
                                    <form  action="sCartModify" method="GET" id="form_registerOrder">
                                        <input type="hidden" name="productId" id="productId" value="<%= product.getId()%>">
                                        <input type="hidden" name="orderId" id="orderId" value="<%= orderDetails.getIdOrder()%>">
                                        <input class="btn btn-danger" type="submit" value="X" name="X">
                                    </form>
                                </td>

                            </tr>
                            <%
                                }
                            %>
                            <!-- Puedes agregar más filas según sea necesario -->
                        </tbody>
                    </table>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Resumen del Pedido</h5>
                            <p class="card-text">Subtotal:</p>
                            <p class="card-text">$<%= totalCost%></p>
                            <p class="card-text">Envío:</p>
                            <p class="card-text">$5.00</p>
                            <h4>Total: $<%= totalCost + 5%></h4>
                            <form  action="sPurchase" method="GET"id="form_registerOrder">
                                <input type="hidden" name="orderId" id="orderId" value="<%= orderDetailsActual.getId()%>">
                                <input class="btn btn-primary" type="submit" value="Pagar" name="Pagar">
                            </form>

                        </div>
                    </div>
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
