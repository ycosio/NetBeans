<%-- 
    Document   : muestra-bean
    Created on : 19/11/2014, 10:49:19 AM
    Author     : ismaelamezcua
--%>

<%@page import="datos.Usuario" %>

<jsp:useBean id="beandatos" scope="session" class="datos.Usuario" />
<jsp:setProperty name="beandatos" property="nombre" />
<jsp:setProperty name="beandatos" property="apellido" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uso de Java Beans</title>
    </head>
    <body>
        <h1>Uso de Java Beans</h1>
        Hola, <jsp:getProperty name="beandatos" property="nombre" /> <jsp:getProperty name="beandatos" property="apellido" />
        
        <br>
        <br>
        Regresar al <a href="index.html">inicio</a>.
    </body>
</html>
