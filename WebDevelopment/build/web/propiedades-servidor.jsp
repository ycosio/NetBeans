<%-- 
    Document   : propiedades-servidor
    Created on : 19/11/2014, 10:27:37 AM
    Author     : ismaelamezcua
--%>

<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Propiedades del servidor</title>
    </head>
    <body>
        <h1>Propiedades del servidor</h1>
        <br>
        Fecha actual: <%= new Date() %><br>
        Versi&oacute;n de Java: <%= System.getProperty("java.version") %><br>
        Directorio ra&iacute;z: <%= System.getProperty("java.home") %><br>
        Sistema operativo: <%= System.getProperty("os.name") %><br>        
        
        <br>
        <br>
        Regresar al <a href="index.html">inicio</a>.
    </body>
</html>
