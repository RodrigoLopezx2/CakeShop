<%-- 
    Document   : home
    Created on : Jan 5, 2024, 2:52:11 AM
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Dulzura Main</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    </head>
    <body>
        <div class="container mt-5">
            <!--            <div class="">
                            <div class="">
                                <h2 class="">Dulzura</h2>
                            </div>
            
                            <div class="">
                                <ul>
                                    <li><a href="../pages/home.jsp">INICIO</a></li>
                                    <li><a href="#">NOSTROS</a></li>
                                    <li><a href="#">CATALOGO</a></li>
                                    <li><a href="#">ORDENA</a></li>
                                    <li><a href="#">CONTACTO</a></li>
                                    <li><a href="../sUser"> Mi perfil </a></li>
                                    <li><a href="../Session"> Cerrar Sesion </a></li>
                                </ul>
                            </div>
            
                        </div> -->
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
                            <a class="nav-link" href="../sProducts">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contacto</a>
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
            <div id="carouselExample" class="carousel slide " data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../images/image1.jpg" class="d-block w-100 img-fluid" alt="Slide 1">
                    </div>
                    <div class="carousel-item">
                        <img src="../images/image1.jpg" class="d-block w-100 img-fluid" alt="Slide 2">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

        </div>    
                <div class="container mt-5">
                    <div class="card" style="width: 18rem;">
                        <img src="../images/image1.jpg" class="card-img-top" alt="Nombre del producto">
                        <div class="card-body">
                            <h5 class="card-title">Nombre del Producto</h5>
                            <p class="card-text">Descripción del producto.</p>
                            <p class="card-text">$99.99</p>
                            <a href="#" class="btn btn-primary">Agregar al carrito</a>
                        </div>
                    </div>
                </div>
<!--        <div class="container">
             Crea una fila (row) 
            <div class="row">
                 Define columnas con clases col. En este ejemplo, se divide en 3 columnas iguales para dispositivos grandes y 12 para dispositivos pequeños 
                <div class="col-lg-4 col-sm-12">
                    <div class="bg-primary text-white p-3">Contenido 1</div>
                </div>
                <div class="col-lg-4 col-sm-12">
                    <div class="bg-success text-white p-3">Contenido 2</div>
                </div>
                <div class="col-lg-4 col-sm-12">
                    <div class="bg-warning text-white p-3">Contenido 3</div>
                </div>
            </div>
        </div>-->
        <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
