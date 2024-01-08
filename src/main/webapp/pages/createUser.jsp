<%-- 
    Document   : createUser
    Created on : Jan 5, 2024, 6:32:31 PM
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : userProfile
    Created on : Jan 5, 2024, 3:24:49 AM
    Author     : rodri
--%>
<%
    String linkIndex = "../index.html";
    try {
        String isUserCreated = (String) request.getAttribute("userCreated");
        if (isUserCreated.equals("false")) {
            out.println("<script>alert('El usuario no fue creado ya existe');</script>");
            linkIndex = "index.html";
        }
    } catch (Exception e) {

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registrar Usuario</title>
        <script type="text/javascript" src="../JavaScript/validateForm.js"></script>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
        <!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>-->
    </head>
    <body>
        
        <form  action="../sUser" method="post" onsubmit="return enviar();" id="form_register">
            <div class="container-fluid mt-4">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true"> Registrar usuario </a>
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
                                        <label for="username" class="form-label"> Nombre </label>
                                        <input type="text" class="form-control" name="nameUser"  id="nameUser" pattern="[A-Za-z]{1,20}" 
                                               title="Este campo debe de llenarse unicamente con letras" placeholder="Silvia"
                                               onkeypress="return sololetras(event)" required  >
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="email" class="form-label"> correo </label>
                                        <!--<input class="form-control" id="emailUser" name="emailUser" >-->
                                        <input type="email" class="form-control" placeholder="user@example.com" 
                                               name="emailUser" id="emailUser" required> 
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="firstname"> Apellido</label>
                                        <!--<input class="form-control" id="lastNameUser" name="lastNameUser" >-->
                                        <input type="text" class="form-control" placeholder="Rivas Lopez" 
                                               name="lastNameUser" id="lastNameUser" pattern="[A-Za-z]{1,20}" 
                                               title="Este campo debe de llenarse unicamente con letras" 
                                               onkeypress="return sololetras(event)" required > <br/>
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="age">Edad</label>
                                        <!--<input class="form-control" id="ageUser" name="ageUser">-->
                                        <input type="text" class="form-control" name="ageUser" id="ageUser"  
                                               placeholder="25" pattern="[0-9]{1,2}" 
                                               title="Este campo debe de llenarse unicamente con numeros" 
                                               onkeypress="return solonumeros(event)" required >
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Contraseña</label>
                                        <!--<input type="password"class="form-control" id="passwordUser" name="passwordUser" >-->
                                        <input type="password" class="form-control" placeholder="*******" 
                                               name="passwordUser" id="passwordUser" required/> 
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="password">Confirma contraseña</label>
                                        <!--                                        <input type="password" class="form-control" id="confirmPasswordUser" name="confirmPasswordUser" >-->
                                        <input type="password" class="form-control" placeholder="*******" 
                                               name="confirmPasswordUser" id="confirmPasswordUser" required/> 
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Telefono</label>
                                        <!--                                        <input class="form-control" id="phoneUser" name="phoneUser" >-->
                                        <input type="text" class="form-control" name="phoneUser" id="phoneUser"  
                                               placeholder="55..." pattern="[0-9]{1,10}" 
                                               title="Este campo debe de llenarse unicamente con 10 numeros" 
                                               onkeypress="return solonumeros(event)" required >
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="username" class="form-label"> Direccion </label>
                                        <input class="form-control" name="directionUser"  id="directionUser"
                                               title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Calle 3"
                                               onkeypress="return soloLetrasYNumeros(event)" required  >
                                    </div>
                                    <input class="btn btn-primary btn-block" type="submit" value="Crear usuario" name="Envia">
                                    </form>
                                </div>
                            </div>
                            <div class="col"></div>
                            <a href="<%out.println(linkIndex);%>" class="btn btn-primary">Regresar al menu</a>
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
                                    <input type="hidden" id="emailUser" name="emailUser"  >
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
