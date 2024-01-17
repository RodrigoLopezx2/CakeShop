<%-- 
    Document   : homePage.jsp
    Created on : Jan 5, 2024, 1:02:45 AM
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String sessionUser = (String) request.getAttribute("sessionUser");
    if (sessionUser.equals("false")) {
        out.println("<script>alert('El email o password no corresponden');</script>");
    }
    if (sessionUser.equals("null")) {
        out.println("<script>alert('El usuario no existe');</script>");
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Dulzura Main</title>
        <link rel="stylesheet" href="Css/home.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>

        <div class="main">
            <div class="navbar">
                <div class="icon">
                    <h2 class="logo">Dulzura</h2>
                </div>

                <div class="menu">
                    <ul>
                        <li><a href="#">INICIO</a></li>
                        <li><a href="#">NOSTROS</a></li>
                        <li><a href="#">CATALOGO</a></li>
                        <li><a href="#">ORDENA</a></li>
                        <li><a href="#">CONTACTO</a></li>
                    </ul>
                </div>

            </div> 
            <div class="content">
                <div class="Description">
                    <h1>Web Design & <br><span>Development</span> <br>Course</h1>
                    <div class="DescriptionP">
                        <p class="par">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt neque  
                            expedita atque eveniet <br> quis nesciunt. Quos nulla vero consequuntur, fugit nemo ad delectus 
                            <br> a quae totam ipsa illum minus laudantium?</p>
                    </div>
                    <button class="cn"><a href="#">JOIN US</a></button>                
                </div>
                <div class="form" id="loginPanel">
                    <h2>Login Here</h2>
                    <form action="Session" method="POST">
                        <input class="inputForm" type="email" id="emailUser" name="emailUser" placeholder="Enter Email Here">
                        <input class="inputForm" type="password"  id="passwordUser" name="passwordUser" placeholder="Enter Password Here">
                        <!--                    <button class="btnn" id="submit_button">Entrar</button>-->
                        <input type="submit" class="btnn"  name="login" id="login" value="Ingresar"/>
                    </form>                   
                    <p class="link">Don't have an account<br>
                        <a href="pages/createUser.jsp">Sign up </a> here</p>
                </div>
            </div>
        </div>
        <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
    </body>

</html>

