<%-- 
    Document   : guarda-nombre
    Created on : 19/11/2014, 10:37:18 AM
    Author     : ismaelamezcua
--%>

<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    int edad = Integer.parseInt(request.getParameter("edad"));
    
    session.setAttribute("param-nombre", nombre);
    session.setAttribute("param-apellido", apellido);
    session.setAttribute("param-edad", edad);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paso de par&aacute;metros de sesi&oacute;n</title>
    </head>
    <body>
        <h1>Paso de par&aacute;metros</h1>
        En la <a href="muestra-parametros.jsp">siguiente p&aacute;gina</a> se muestran los datos.
    </body>
</html>
