<%-- 
    Document   : cerrar
    Created on : 29-oct-2015, 1:06:34
    Author     : Ycosio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%session.invalidate();
     out.println("<meta http-equiv='refresh' content='0;url=index.jsp'");

%>
    </body>
</html>
