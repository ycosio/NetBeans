<%-- 
    Document   : muestra-parametros
    Created on : 19/11/2014, 10:41:39 AM
    Author     : ismaelamezcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paso de par&aacute;metros de sesi&oacute;n</title>
    </head>
    <body>
        <h1>Paso de par&aacute;metros</h1>
        Hola,
        
        <%
            out.print(session.getAttribute("param-nombre") + " ");
            out.print(session.getAttribute("param-apellido"));
            out.print(". Tu edad es: " + session.getAttribute("param-edad"));
        %>
        
        <br>
        <br>
        Regresar al <a href="index.html">inicio</a>.                
    </body>
</html>
