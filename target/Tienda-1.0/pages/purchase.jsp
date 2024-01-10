<%-- 
    Document   : purchase
    Created on : Jan 8, 2024, 3:01:02 AM
    Author     : rodri
--%>

<%@page import="com.mycompany.tienda.models.Product"%>
<%@page import="com.mycompany.tienda.dao.ProductDaoSQL"%>
<%@page import="com.mycompany.tienda.models.OrderDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderDetails> listOrderDetails = new ArrayList<>();
    ProductDaoSQL productDao = new ProductDaoSQL();
    listOrderDetails = (List<OrderDetails>) request.getAttribute("listOrderDetails");
    OrderDetails orderDetailsActual = new OrderDetails();
    
    if (listOrderDetails.size()>0) {
        orderDetailsActual = listOrderDetails.get(0);
    }
    double totalCost = 0;
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Proceso de Compra</title>

        <!-- Agrega los enlaces a los archivos CSS de Bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light text-left">
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
                        <a class="nav-link" href="../sProducts">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../sCart">Carrito</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sUserPurchases">Mis compras</a>
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
        <!--        <div class="container mt-5" id="carrito">
                    <h2>Carrito de Compras</h2>
        
                     Tabla de Carrito 
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                             Ejemplo de un artículo en el carrito 
                            <tr>
                                <th scope="row">1</th>
                                <td>Producto 1</td>
                                <td>$20.00</td>
                                <td>2</td>
                                <td>$40.00</td>
                            </tr>
                             Puedes agregar más filas según sea necesario 
                        </tbody>
                    </table>
        
                     Total del Carrito 
                    <h4 class="mb-3">Total: $40.00</h4>
        
                     Enlace para proceder al siguiente paso 
                    <a class="btn btn-primary" href="#direccion">Continuar con la Dirección</a>
                </div>-->
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
                                <td><%= orderDetails.getQuantity()%></td>
                                <%
                                    double totalUnitario = product.getPrice() * orderDetails.getQuantity();
                                    totalCost += totalUnitario;
                                %> 
                                <td>$ <%= totalUnitario%></td>
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
                            <h4>Total: $<%= totalCost+5 %></h4>
                            <form  action="sPurchase" method="POST"id="form_registerOrder">
                                <input type="hidden" name="orderId" id="orderId" value="<%= orderDetailsActual.getId()%>">
                                <input class="btn btn-primary" type="submit" value="Pagar" name="Pagar">
                            </form>

                        </div>
                    </div>
                    <a href="pages/home.jsp" class="btn btn-primary">Regresar al home</a>
                </div>
            </div>
        </div>
        <div class="container mt-5" id="direccion">
            <h2>Dirección de Envío</h2>

            <!-- Formulario de Dirección -->
            <form>
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre Completo</label>
                    <input type="text" class="form-control" id="nombre" required>
                </div>
                <div class="mb-3">
                    <label for="direccion" class="form-label">Dirección</label>
                    <input type="text" class="form-control" id="direccion" required>
                </div>
                <!-- Agrega más campos según sea necesario -->

                <!-- Enlace para proceder al siguiente paso -->
                <a class="btn btn-primary" href="#pago">Continuar con el Pago</a>
            </form>
        </div>

        <div class="container mt-5" id="pago">
            <h2>Confirmación de Pago</h2>

            <!-- Formulario de Confirmación de Pago -->
            <form>
                <div class="mb-3">
                    <label for="nombreTarjeta" class="form-label">Nombre en la Tarjeta</label>
                    <input type="text" class="form-control" id="nombreTarjeta" required>
                </div>
                <div class="mb-3">
                    <label for="numeroTarjeta" class="form-label">Número de Tarjeta</label>
                    <input type="text" class="form-control" id="numeroTarjeta" required>
                </div>
                <div class="mb-3">
                    <label for="fechaVencimiento" class="form-label">Fecha de Vencimiento</label>
                    <input type="text" class="form-control" id="fechaVencimiento" placeholder="MM/AA" required>
                </div>
                <div class="mb-3">
                    <label for="codigoSeguridad" class="form-label">Código de Seguridad</label>
                    <input type="text" class="form-control" id="codigoSeguridad" required>
                </div>
                <button type="submit" class="btn btn-primary">Confirmar Pago</button>
            </form>
        </div>

        <!-- Agrega los enlaces a los archivos JavaScript de Bootstrap (si es necesario) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
