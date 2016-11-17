<%-- 
    Document   : elijeRol
    Created on : 24/11/2015, 09:21:12 PM
    Author     : Terriquez
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sesion.ConexionBD"%>
<%
    String user = (String)session.getAttribute("varUsuario");
    String ncuenta = (String)session.getAttribute("varNcuenta");
    String tipo = (String)session.getAttribute("varTipo");
    String academia = (String)session.getAttribute("varAcademia");
    String progEducativo2 = (String)session.getAttribute("varProgEducativo");

%>

 <%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <script>
  function valida_envio(){
	}
    </script>
    <meta charset="iso-8859-1">
    
    <link rel="shortcut icon" href="img/favicon.png">
    <title>Elige tu Rol para poder trabajar</title>
    
    <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
    <link rel="stylesheet" href="css/style.css">
  </head>

  <body>
      <div class="wrapper">                         <!--Login-->
          <form class="form-signin" style='margin-top:  4cm' name="Accesar" action="Login" method="post">
      
      <h4> <% out.print(user);%>, selecciona un rol: </h4>   <br>     
                 
        <%
        ConexionBD conexion = new ConexionBD();
        ConexionBD conexion2 = new ConexionBD();
        conexion.conecta();
        conexion2.conecta();
        String academiaTemporal;
        String academiaNombre;
        String tipoTemporal;
        String programaTemporal;
        String materiaTemporal;
        
        String us = null; //para tomar el usuario de la base de datos
        String nC = null;
        String pa = null; // para tomar el pass de la base de datos
        String tipousuario = null;
        String idAcademia = null;
        String progEducativo = null;
        String materia = null;
        
        
        ResultSet result2;
        ResultSet resultado3;
        
        resultado3 = conexion2.consulta("select no_cuenta,nombre,contrasena,tipo,idacademia,progEducativo,materia from profesor where no_cuenta='" + ncuenta + "';");
        
        
        try {

                while (resultado3.next())//desplegamos los resultados
                {
                    us = resultado3.getString("nombre");
                    nC = resultado3.getString("no_cuenta");
                    pa = resultado3.getString("contrasena");
                    tipousuario = resultado3.getString("tipo");
                    idAcademia = resultado3.getString("idacademia");
                    progEducativo = resultado3.getString("progEducativo");
                    materia = resultado3.getString("materia");
                    }

            } catch (Exception e) {
                e.printStackTrace();
            }
        
        resultado3.close();
        
        result2 = conexion2.consulta("Select nombre from academias where idacademia='"+idAcademia+"';");
        result2.next();
        academia = result2.getString("nombre");
        out.print("<div class='radio'><label><input type='radio' name='optradio' value='"+idAcademia+","+tipousuario+","+progEducativo+","+materia+"'>"
                +tipousuario+ " - "+ academia+
                "</label></div>");
        result2.close();
        
        ResultSet result = conexion.consulta("Select * from sudoprofesor where no_cuenta='" +nC+"';");
        while(result.next())
        {
            academiaTemporal = result.getString("idacademia");
            tipoTemporal = result.getString("tipo");
            programaTemporal = result.getString("progEducativo");
            materiaTemporal = result.getString("materia");
            
            result2 = conexion2.consulta("Select nombre from academias where idacademia='"+academiaTemporal+"';");
            result2.next();
            academiaNombre = result2.getString("nombre");
            out.print("<div class='radio'><label><input type='radio' name='optradio' value='"+academiaTemporal+","+tipoTemporal+","+programaTemporal+","+materiaTemporal+"'>"
                    +tipoTemporal+ " - "+ academiaNombre+""
                    + "</label></div>");
        }
            
        %>
      <br>
              <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button> 
              
              
    </form>
  </div>
  </body>
</html>   
    
