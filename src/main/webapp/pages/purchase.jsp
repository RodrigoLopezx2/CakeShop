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
<%@ page errorPage="../ErrorPage.html"%>
<%
    List<OrderDetails> listOrderDetails = new ArrayList<>();
    ProductDaoSQL productDao = new ProductDaoSQL();
    listOrderDetails = (List<OrderDetails>) request.getAttribute("listOrderDetails");
    String direction_User = (String) request.getAttribute("direction_User");
    System.out.println("Direction = " + direction_User);
    OrderDetails orderDetailsActual = new OrderDetails();
    String[] splitDirection = direction_User.split("/");
    String[] nameDirection = {"Estado", "Municipio/Ciudad", "Colonia", "Calle", "Numero Interior", "Numero Exterior", "Informacion adicional"};
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
        <title>Proceso de Compra</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="JavaScript/validateForm.js"></script>
    </head>
    <body class="col">
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
        <form  action="sPurchase" method="POST"id="form_registerOrder">
            <div class="container-fluid mt-4">
                <h1>Crear usuario</h1>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labbelledby="profile-tab">
                        <div class="row">
                            <!--                                <div class="col"></div>-->
                            <div class="col-lg-9 col-md-5 col-sm-12 pt-4">
                                <div class="container mt-5"  name='productsConteiner' id='productsConteiner'>
                                    <h2 class="mb-4">Carrito de Compras</h2>
                                    <div class="row-lg-12">
                                        <div class="col">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Producto</th>
                                                        <th scope="col">Precio</th>
                                                        <th scope="col">Sabor</th>
                                                        <th scope="col">Tamaño</th>
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
                                                        <td>$<%= product.getPrice()%></td>
                                                        <td> <%= orderDetails.getFlavor()%></td>
                                                        <td> <%= orderDetails.getSize()%></td>
                                                        <td><%= orderDetails.getQuantity()%></td>
                                                        <%
                                                            double totalUnitario = product.getPrice() * orderDetails.getQuantity();
                                                            totalCost += totalUnitario;
                                                        %> 
                                                        <td>$<%= totalUnitario%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                    <!-- Puedes agregar más filas según sea necesario -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="p-1">Direccion</h4>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="customRadioInline1" name="customRadioInline" class="custom-control-input" required>
                                    <label class="custom-control-label" for="customRadioInline1">Usar la direccion guardada</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="customRadioInline2" name="customRadioInline" class="custom-control-input" required>
                                    <label class="custom-control-label" for="customRadioInline2">Nueva direccion</label>
                                </div>
                                <div class="" id="directionSave" style="display: none;">
                                    <div class="col-lg-12 col-md-8 col-sm-6">
                                        <h6>Direccion guardada</h6>
                                        <%
                                            for (int i = 0; i < splitDirection.length; i++) {
                                        %>
                                        <p><%=nameDirection[i]%> : <%=splitDirection[i]%></p>
                                        <%                                            }
                                        %>
                                    </div>
                                    <input type="hidden" name="directionSaved" id="directionSaved" value="<%=direction_User%>">
                                </div>
                                
                                

                                <div class="" id="directionNew" style="display: none;">
                                    <div class="col-lg-12 col-md-8 col-sm-6">
                                        <div class="form-row">
                                            <div class="form-group col-lg-6 col-md-12">
                                                <label for="stateDirection">Estado</label>
                                                <input class="form-control" type="text" name="stateDirection"  id="stateDirection" required
                                                       title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="CDMX" pattern="^[A-Za-z\s]{1,40}$"
                                                       onkeypress="return sololetras(event)"   >
                                            </div>
                                            <div class="form-group col-lg-6 col-md-12">
                                                <label for="municipioDirection">Municipio/Alcandia</label>
                                                <input class="form-control" type="text" name="municipioDirection"  id="municipioDirection" required
                                                       title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Iztapalapa"  pattern="^[A-Za-z0-9\s]{1,30}$"
                                                       onkeypress="return sololetras(event)"   >
                                            </div>
                                            <div class="form-group col-lg-6 col-md-12">
                                                <label for="coloniaDirection">Colonia</label>
                                                <input class="form-control" type="text" name="coloniaDirection"  id="coloniaDirection" required
                                                       title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Col hangares"  pattern="^[A-Za-z0-9\s]{1,30}$"
                                                       onkeypress="return soloLetrasYNumeros(event)"   >
                                            </div>
                                            <div class="form-group col-lg-6 col-md-12">
                                                <label for="streetDirection">Calle</label>
                                                <input class="form-control" type="text" name="streetDirection"  id="streetDirection" required
                                                       title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Calle 3"  pattern="^[A-Za-z0-9\s]{1,30}$"
                                                       onkeypress="return soloLetrasYNumeros(event)"   >
                                            </div>
                                            <div class="form-group col-lg-6 col-md-12">
                                                <label for="numberInDirection">Numero interior</label>
                                                <input class="form-control" type="text"  name="numberInDirection"  id="numberInDirection" required
                                                       title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Numero interior"  pattern="^[A-Za-z0-9\s]{1,30}$"
                                                       onkeypress="return soloLetrasYNumeros(event)"   >
                                            </div>
                                            <div class="form-group col-lg-6 col-md-12">
                                                <label for="numberOutDirection">Numero exterior</label>
                                                <input class="form-control" type="text" name="numberOutDirection"  id="numberOutDirection" required
                                                       title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="numero exterior"  pattern="^[A-Za-z0-9\s]{1,30}$"
                                                       onkeypress="return soloLetrasYNumeros(event)"   >
                                            </div>
                                            <div class="form-group col-lg-6 col-md-12">
                                                <label for="referenceDirection">Informacion adicional</label>
                                                <input class="form-control" type="text" name="referenceDirection"  id="referenceDirection"
                                                       title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Entre calles"  pattern="^[A-Za-z0-9\s]{1,60}$"
                                                       onkeypress="return soloLetrasYNumeros(event)"   >
                                            </div>


                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="newDirectionOrder" id="newDirectionOrder" value="newDirectionOrder">

                                <h4>Metodo de pago</h4>
                                <div class="col-lg-12 col-md-8 col-sm-6">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="stateDirection">Nombre en la tarjeta</label>
                                            <input class="form-control" name="nameCard"  id="nameCard" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Roberto Beltran Lom" pattern="[A-Za-z]{1,80}"
                                                   onkeypress="return sololetras(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="municipioDirection">Numero de la tarjeta</label>
                                            <input class="form-control" name="numberCard"  id="numberCard" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="4312313123124" pattern="[0-9]{16}"
                                                   onkeypress="return solonumeros(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="coloniaDirection">Fecha de Vencimiento</label>
                                            <input class="form-control" name="mouthCard"  id="mouthCard" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="mes" pattern="[0-9]{2}"
                                                   onkeypress="return solonumeros(event)" required  >
                                            <hr>
                                            <input class="form-control" name="yearCard"  id="yearCard" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="year" pattern="[0-9]{2}"
                                                   onkeypress="return solonumeros(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="streetDirection">Código de Seguridad</label>
                                            <input class="form-control" name="codeCard"  id="codeCard" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="321" pattern="[0-9]{3}"
                                                   onkeypress="return soloLetrasYNumeros(event)" required  >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="col">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Resumen del Pedido</h5>
                                            <p class="card-text">Subtotal:</p>
                                            <p class="card-text">$<%= totalCost%></p>
                                            <p class="card-text">Envío:</p>
                                            <p class="card-text">$5.00</p>
                                            <h4>Total: $<%= totalCost + 5%></h4>

                                            <input type="hidden" name="orderId" id="orderId" value="<%= orderDetailsActual.getId()%>">
                                            <input class="btn btn-primary btn-block" type="submit" value="Pagar" name="Pagar">
                                        </div>
                                    </div>
                                    <a href="pages/home.jsp" class="btn btn-primary btn-block m-1">Regresar al home</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script>
            

            var checkbox1 = document.getElementById("customRadioInline1");
            var checkbox2 = document.getElementById("customRadioInline2");
            var div1 = document.getElementById("directionSave");
            var direction = document.getElementById("directionSaved").value;
            var div2 = document.getElementById("directionNew");
            if (direction === "//////") {
                checkbox1.disabled = true;
            } else {
                checkbox1.disabled = false;
            }
            

            // Agregar eventos de cambio a los checkboxes
            checkbox1.addEventListener("change", function () {
                // Mostrar u ocultar el Div 1 según el estado del checkbox1
                div1.style.display = checkbox1.checked ? "block" : "none";

                // Ocultar el Div 2 si el checkbox1 está seleccionado
                div2.style.display = checkbox1.checked ? "none" : "block";

                var elementosInternos = div2.getElementsByTagName('*');
                for (var i = 0; i < elementosInternos.length; i++) {
                    elementosInternos[i].disabled = true;
                }
            });

            checkbox2.addEventListener("change", function () {
                // Mostrar u ocultar el Div 2 según el estado del checkbox2
                div2.style.display = checkbox2.checked ? "block" : "none";
                var elementosInternos = div2.getElementsByTagName('*');
                for (var i = 0; i < elementosInternos.length; i++) {
                    elementosInternos[i].disabled = false;
                }
                // Ocultar el Div 1 si el checkbox2 está seleccionado
                div1.style.display = checkbox2.checked ? "none" : "block";

            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
