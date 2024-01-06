<%-- 
    Document   : userProfile
    Created on : Jan 5, 2024, 3:24:49 AM
    Author     : rodri
--%>

<%@page import="com.mycompany.tienda.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

        User user = (User) request.getAttribute("userInfo");
        if (request.getAttribute("update").equals("true")) {
            out.println("<script>alert('usuario actualizado');</script>");
        }


    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Perfil de Usuario</title>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>

    </head>
    

    <body>
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
                                        <label for="phone">Contraseña</label>
                                        <input type="password"class="form-control" id="passwordUser" name="passwordUser" value="<%=user.getPassword()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="password">Confirma contraseña</label>
                                        <input type="password" class="form-control" id="confirmPasswordUser" name="confirmPasswordUser" value="<%=user.getPassword()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Telefono</label>
                                        <input class="form-control" id="phoneUser" name="phoneUser"  value="<%=user.getPhone()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Edad</label>
                                        <input class="form-control" id="ageUser" name="ageUser"  value="<%=user.getAge()%>">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Direccion</label>
                                        <input class="form-control" id="directionUser" name="directionUser"  value="<%=user.getDirection()%>">
                                    </div>
                                    <input class="btn btn-primary btn-block" type="submit" value="Actualizar Perfil" name="Envia">
                                    </form>
                                </div>
                            </div>
                            <div class="col"></div>
                            <a href="pages/home.jsp">Regresar al menu</a>
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
