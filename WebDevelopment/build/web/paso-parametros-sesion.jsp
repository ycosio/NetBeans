<%-- 
    Document   : paso-parametros-sesion
    Created on : 19/11/2014, 10:34:43 AM
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
        <form action="guarda-parametros.jsp" method="post">
            Nombre: <input type="text" name="nombre" size="20" /><br>
            Apellido: <input type="text" name="apellido" size="20" /><br>
            Edad: <input type="text" name="edad" size="10" /><br>
            <input type="submit" />
        </form>
    </body>
</html>
