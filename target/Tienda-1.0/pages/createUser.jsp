<%-- 
    Document   : createUser
    Created on : Jan 5, 2024, 6:32:31 PM
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="../ErrorPage.html"%>
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
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <form method = "POST" action="../sUser" name="Actualizar" onsubmit="return enviar(this)">
            <div class="container-fluid mt-4">
                <h1>Crear usuario</h1>
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
                                        <input class="form-control" id="nameUser" name="nameUser" placeholder="Silvia" onkeypress="return sololetras(event)" pattern="^[A-Za-z\s]{1,30}$">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="email"> correo </label>
                                        <input class="form-control" id="emailUser" name="emailUser" placeholder="a@gmail.com" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="firstname"> Apellido</label>
                                        <input class="form-control" id="lastNameUser" name="lastNameUser" placeholder="Lopez" onkeypress="return sololetras(event)" pattern="^[A-Za-z\s]{1,30}$">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Telefono</label>
                                        <input class="form-control" id="phoneUser" name="phoneUser" placeholder="5512345678" onkeypress="return solonumeros(event)" pattern="[0-9]{1,10}">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Contraseña</label>
                                        <input type="password"class="form-control" id="passwordUser" name="passwordUser">
                                    </div>
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="password">Confirma contraseña</label>
                                        <input type="password" class="form-control" id="confirmPasswordUser" name="confirmPasswordUser">
                                    </div>
                                    
                                    <div class="form-group col-lg-6 col-md-12">
                                        <label for="phone">Edad</label>
                                        <input class="form-control" id="ageUser" name="ageUser" placeholder="22" pattern="[0-9]{1,2}" onkeypress="return solonumeros(event)">
                                    </div>
                                    

                                </div>
                                <h4>Direccion</h4>
                                <div class="col-lg-12 col-md-8 col-sm-6">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="stateDirection">Estado</label>
                                            <input class="form-control" name="stateDirection"  id="stateDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="CDMX" pattern="^[A-Za-z\s]{1,30}$"
                                                   onkeypress="return sololetras(event)"   >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="municipioDirection">Municipio/Alcandia</label>
                                            <input class="form-control" name="municipioDirection"  id="municipioDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Iztapalapa" pattern="^[A-Za-z\s]{1,30}$"
                                                   onkeypress="return sololetras(event)"   >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="coloniaDirection">Colonia</label>
                                            <input class="form-control" name="coloniaDirection"  id="coloniaDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Col hangares" 
                                                   onkeypress="return soloLetrasYNumeros()(event)">
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="streetDirection">Calle</label>
                                            <input class="form-control" name="streetDirection"  id="streetDirection" 
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Calle 3" 
                                                   onkeypress="return soloLetrasYNumeros(event)" >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="numberInDirection">Numero interior</label>
                                            <input class="form-control" name="numberInDirection"  id="numberInDirection"
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Numero interior" 
                                                   onkeypress="return soloLetrasYNumeros(event)"  >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="numberOutDirection">Numero exterior</label>
                                            <input class="form-control" name="numberOutDirection"  id="numberOutDirection"
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="numero exterior" 
                                                   onkeypress="return soloLetrasYNumeros(event)" >
                                        </div>
                                        <div class="form-group col-lg-6 col-md-12">
                                            <label for="referenceDirection">Informacion adicional</label>
                                            <input class="form-control" name="referenceDirection"  id="referenceDirection"
                                                   title="Este campo debe de llenarse unicamente con letras y numeros" placeholder="Entre calles"
                                                   onkeypress="return soloLetrasYNumeros(event)" >
                                        </div>
                                    </div>
                                    <input class="btn btn-primary btn-block" type="submit" value="Crear usuario" name="Envia">
                                    </form>
                                </div>
                            </div>
                            <div class="col"><a href="../index.html" class="btn btn-primary">Regresar al home</a></div>

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
