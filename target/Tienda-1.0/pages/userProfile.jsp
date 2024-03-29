<%-- 
    Document   : userProfile
    Created on : Jan 5, 2024, 3:24:49 AM
    Author     : rodri
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.tienda.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page errorPage="../ErrorPage.html"%>--%>
<%
    User user = (User) request.getAttribute("userInfo");
    if (request.getAttribute("update").equals("true")) {
        out.println("<script>alert('usuario actualizado');</script>");
    }

    String[] dataDirection = user.getDirection().split("/");
    if (dataDirection.length == 0 || (dataDirection.length == 1 && dataDirection[0].isEmpty())) {
        // Asignar espacio en blanco al array
        dataDirection = new String[]{"","","","","","",""};
    }
    System.out.println("DataDirection = " + dataDirection.length);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Perfil de Usuario</title>

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
        <form method = "POST" action="sUserModify" name="Actualizar" onsubmit="return validar(this)">
            <div class="container-fluid mt-4">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true"> Actualizar Perfil </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="notify-tab" data-toggle="tab" href="#notify" role="tab" aria-controls="notify" aria-selected="true"> Eliminar Perfil </a>
                    </li>

                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labbelledby="profile-tab">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col-lg-6 col-md-8 col-sm-12 pt-4">
                                <h4> Informacion de Usuario </h4>
                                <hr/>
                                <div class="form-row">
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="username"> Nombre </label>
                                        <input class="form-control" id="nameUser" name="nameUser" value="<%=user.getName()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="email"> correo </label>
                                        <input class="form-control" id="emailUser" name="emailUser" value="<%=user.getEmail()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="firstname"> Apellido</label>
                                        <input class="form-control" id="lastNameUser" name="lastNameUser" value="<%=user.getLastName()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Telefono</label>
                                        <input class="form-control" id="phoneUser" name="phoneUser"  value="<%=user.getPhone()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Contraseña</label>
                                        <input type="password"class="form-control" id="passwordUser" name="passwordUser" value="<%=user.getPassword()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="password">Confirma contraseña</label>
                                        <input type="password" class="form-control" id="confirmPasswordUser" name="confirmPasswordUser" value="<%=user.getPassword()%>">
                                    </div>

                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Edad</label>
                                        <input class="form-control" id="ageUser" name="ageUser"  value="<%=user.getAge()%>">
                                    </div>

                                </div>
                                <h4>Direccion</h4>
                                <div class="col-lg-12 col-md-8 col-sm-6">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="stateDirection">Estado</label>
                                            <input class="form-control" name="stateDirection"  id="stateDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="CDMX" value="<%=dataDirection[0]%>"
                                                   onkeypress="return sololetras()(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="municipioDirection">Municipio/Alcandia</label>
                                            <input class="form-control" name="municipioDirection"  id="municipioDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Iztapalapa" value="<%=dataDirection[1]%>"
                                                   onkeypress="return sololetras()(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="coloniaDirection">Colonia</label>
                                            <input class="form-control" name="coloniaDirection"  id="coloniaDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Col hangares" value="<%=dataDirection[2]%>"
                                                   onkeypress="return sololetras()(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="streetDirection">Calle</label>
                                            <input class="form-control" name="streetDirection"  id="streetDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Calle 3" value="<%=dataDirection[3]%>"
                                                   onkeypress="return soloLetrasYNumeros(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="numberInDirection">Numero interior</label>
                                            <input class="form-control" name="numberInDirection"  id="numberInDirection"
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Numero interior" value="<%=dataDirection[4]%>"
                                                   onkeypress="return soloLetrasYNumeros(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="numberOutDirection">Numero exterior</label>
                                            <input class="form-control" name="numberOutDirection"  id="numberOutDirection"
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="numero exterior" value="<%=dataDirection[5]%>"
                                                   onkeypress="return soloLetrasYNumeros(event)" required  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="referenceDirection">Informacion adicional</label>
                                            <input class="form-control" name="referenceDirection"  id="referenceDirection"
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Entre calles" value="<%=dataDirection[6]%>"
                                                   onkeypress="return soloLetrasYNumeros(event)" required  >
                                        </div>
                                    </div>
                                    <input class="btn btn-primary btn-block" type="submit" value="Actualizar usuario" name="Envia">
                                    </form>
                                </div>
                            </div>
                            <div class="col"><a href="pages/home.jsp" class="btn btn-primary">Regresar al home</a></div>

                        </div>

                    </div>
                    <div class="tab-pane fade" id="notify" role="tabpanel" aria-labelledby="notify-tab">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col-lg-6 col-md-8 col-sm-12 pt-4">
                                <h4>Eliminar Usuario</h4>
                                <Label for="Informacion">Si elimina el perfil de usuario de eliminara toda la informacion relacionada con este, y se perdera todo la reputacion que haya adquiero con este 
                                    perfil , aun asi, ¿Desea Eliminar el perfil de usuario?.
                                </Label>
                                <form action="sUserModify" method="GET" onsubmit="return eliminar(this)" name="Eliminar">
                                    <input type="hidden" id="emailUser" name="emailUser" value="<%=user.getEmail()%>" >
                                    <input type="submit" value="Eliminar Perfil" name="Envia">
                                </form>
                                <hr />
                            </div>
                            <div class="col-lg-6 col-md-8 col-sm-12 pt-4">

                            </div>
                            <div class="col"></div>
                        </div>
                    </div>

                </div>
            </div>

            <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
            <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
            <script>
                                    function eliminar(Eliminar) {
                                        if (confirm('¿Estas seguro de eliminar tu perfil?')) {
                                            document.Eliminar.submit();
                                        } else {
                                            return false;
                                        }
                                    }
            </script>
    </body>

</html>
