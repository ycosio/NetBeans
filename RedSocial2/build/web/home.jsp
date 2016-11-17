<%--
    Document   : presidente
    Created on : 28-oct-2015, 18:43:27
    Author     : Terriquez
--%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="sesion.ConexionBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sesion.ConexionBD"%>
<%@page import="sesion.Usuario"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

 <%
      
     
      String user = (String)session.getAttribute("varUsuario");
      String tipo = (String)session.getAttribute("varTipo");
      String ncuenta = (String)session.getAttribute("varNcuenta");
      String academia = (String)session.getAttribute("varAcademia");
      String progEducativo = (String)session.getAttribute("varProgEducativo");

      String[] tipos= new String[5];
      tipos[0] = "Presidente";
      tipos[1] = "Coordinador";
      tipos[2] = "Subdirector";
      tipos[3] = "Profesor";
      tipos[4] = "Secretario";
  %>
  
<%  if(tipo != null){ %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="iso-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Sistema Control Academias </title>

    <!-- Bootstrap CSS -->    
    <link href="css2/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css2/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css2/elegant-icons-style.css" rel="stylesheet" />
    <link href="css2/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css2/style.css" rel="stylesheet">
    <link href="css2/style-responsive.css" rel="stylesheet" />


  </head>

  <body>
  <!-- container section start -->
  <section id="container" class="">
      <!--header start-->
      
      <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
            </div>

            <!--logo start-->
            <a href="home.jsp" class="logo">Sistema <span class="lite">Academias</span></a>
            <!--logo end-->
            
<%-- ----------------------------------------------------------------------------------------------- --%>
<%-- -----------------------------------BUSQUEDA INSERVIBLE----------------------------------------- --%>
<%-- ----------------------------------------------------------------------------------------------- --%>

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text" style='display:none;'>
                        </form>
                    </li>                    
                </ul>
                <!--  search form end -->                
            </div>

            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    
                    

                    
 <%-- ----------------------------------------------------------------------------------------------- --%>
<%-- ---------------------------------------MENU USUARIO--------------------------------------------- --%>
<%-- ----------------------------------------------------------------------------------------------- --%>


                    
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                
                                <%
                                String usuariotemporal = ncuenta;
                                String ubicacionArchivo2 = "C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\img\\";
                                //String ubicacionArchivo2 = "C:\\Users\\Terriquez\\Downloads\\ProyectoIntegrador\\RedSocial\\web\\img\\";

                                File archivo2 = new File(ubicacionArchivo2 + ncuenta + ".png"); 
                                try {
                                BufferedReader br = new BufferedReader(new FileReader(archivo2));
                                //if(br.readLine() == null)

                                }catch(IOException e) {
                                    e.printStackTrace();
                                    ncuenta = "z";
                                }
                                
                                out.println("<img alt='' src='img/"+ ncuenta+".png' style='width:30px;height:30px' class='img-circle'>");
                                ncuenta = usuariotemporal;
                                
                                %>
                                <!--img alt="" src="img/avatar-mini.jpg"--> <%-- AVATAR --%>
                            </span>
                            <span class="username">
                            
                                
                                <% 
                                ConexionBD conexionNombreAcademia  = new ConexionBD();
                                conexionNombreAcademia.conecta();
                                ResultSet resultadoNombreAcademia = conexionNombreAcademia.consulta("select nombre from academias where idacademia='"+academia+"'");
                                resultadoNombreAcademia.next();
                                String nombreAcademia = resultadoNombreAcademia.getString("nombre");
                                
                                out.print(user + " | " + tipo + " ( " + nombreAcademia+" )");
                                
                                %>
                                
                                
                            
                            </span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="subirfoto.jsp"><i class="icon_profile"></i> Mi Perfil</a>
                            </li>
                            
                            <li>
                                <a href="elijeRol.jsp"><i class="icon-pages-l"></i> Cambiar de Rol</a>
                            </li>
                            
                            <li>
                                <a href="index.jsp"><i class="icon_key_alt"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header>      
      <!--header end-->

      
<%-- ----------------------------------------------------------------------------------------------- --%>
<%-- --------------------------------------BARRA LATERAL-------------------------------------------- --%>
<%-- ----------------------------------------------------------------------------------------------- --%>      
      
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="">
                      <a class="" href="home.jsp">
                          <i class="icon_house_alt"></i>
                          <span>Inicio</span>
                      </a>
                  </li>
                  
       
         
                  
   <%
        if(tipos[0].equals(session.getAttribute("varTipo"))){                           
                  out.println("<li><a href='convocareunion.jsp'><i class='icon_genius'></i><span>Convocar Reunion</span> </a></li>");
        }    
        else if(tipos[1].equals(session.getAttribute("varTipo"))){                           
                  out.println("<li><a href='agregarmiembro.jsp'><i class='icon_genius'></i><span>Agregar Miembro</span></a></li>");
                  out.println("<li><a href='eliminarMiembro.jsp'><i class='icon_genius'></i><span>Eliminar Miembro</span></a></li>");

        }
                          %>
        <%-- -----------------------------CONVOCAR----------------------------------- --%>
         
        <% if(!tipos[1].equals(session.getAttribute("varTipo")))
        {
        %>
        <%-- -----------------------------PLANEACIONES----------------------------------- --%>         
                  <li>
                      <a class="" href="planeaciones.jsp">  <%--PLANEACIONES --%>
                          <i class="icon_clipboard"></i>
                          <span>Planeaciones</span>
                      </a>
                  </li>     
                  
                   <%-- -----------------------------REUNIONES----------------------------------- --%>
                  <li>
                      <a class="" href="reuniones.jsp">  <%--REUNIONES --%>
                          <i class="icon_genius"></i>
                          <span>Reuniones</span>
                      </a>
                  </li>
                   <%}%> 
                   
                  <li>                     
                      <a class="" href="cerrar.jsp">
                          <i class="icon_lock"></i>
                          <span>Salir</span>
                          
                      </a>
                                         
                  </li>
                     
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
<%-- ----------------------------------------------------------------------------------------------- --%>
<%-- ---------------------------------------BLANK SPACE--------------------------------------------- --%>
<%-- ----------------------------------------------------------------------------------------------- --%>


      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
                         
                                    
                                    
                                    
                                    
                                    
        <div class="container">
         <form class="form-horizontal" name ="publicacion" method="post">
  
            <div class="form-group col-x-12" id="search">
              <h4>Comparte algo con tu academia</h4>
             <br>
              <textarea name="post" class="form-control" id="post" placeholder="Introduce tu comentario aquí..." style="height: 90px; resize: none;"></textarea>
            </div>

            <div class="form-group col-xs-2 navbar-right" id="search">
              <input type="submit" class="form-control btn-primary" value="Publicar">
            </div>

            </form>
        </div> 
                                            
                                            
                                            
                                            <%
            if(request.getParameter("post")!=null)
            {
                String archivo = "No";
                String texto = request.getParameter("post");
                
                java.util.Date dNow = new java.util.Date(); 
                SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm");
                String fecha = ft.format(dNow);
             
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            conexion.ejecuta("INSERT INTO publicacion(no_cuenta,texto,fecha,archivo,idacademia,plan,progEducativo)VALUES ('" + ncuenta + "','" + texto + "','" + fecha + "','" + archivo + "','" + academia + "', 'NOPLAN','" + progEducativo + "');");
                  
            
          }
               %>                                       
                                            
                                            
                                            
                  <%-- AQUI SE PROGRAMA LAS TABLAS --%>       
                  
                  <br>
               <div class="container"><div class="row"><div class="col-md-12"><div class="panel"><div class="panel-body"><!--/stories-->
                                            
           <%
            
            String no_cuenta;
            String nombre = "";
            String texto;
            java.util.Date fecha = new java.util.Date();
            //java.util.Date fechaactual = new java.util.Date();
            String mes = "Enero";
            
                        
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            ConexionBD conexion2 = new ConexionBD();
            conexion2.conecta();
            
            //ResultSet resultado=conexion.consulta("select no_cuenta,texto,fecha from publicacion where idacademia='" + academia + "';");
            ResultSet resultado=conexion.consulta("select no_cuenta,texto,fecha from publicacion where idacademia='" + academia + "' and plan='NOPLAN' order by idpublicacion desc;");
            
            
            while(resultado.next())
            {
                no_cuenta=resultado.getString("no_cuenta");
                
                ResultSet resultado2=conexion2.consulta("select nombre from profesor where no_cuenta='" + no_cuenta + "';");
                resultado2.next();
                nombre = resultado2.getString("nombre");
                
                
                texto=resultado.getString("texto");
                fecha = resultado.getTimestamp("fecha");
                String temp = fecha.toString();
                //AAAA-MM-DD HH:MM:SS               
                int mes2 = Integer.parseInt(temp.substring(5,7));
                String hora = temp.substring(11,16);
                String dia = temp.substring(8,10);
                String anio = temp.substring(0,4);
                //java.util.Date ago = new java.util.Date();
               
                if(mes2 == 1)
                    mes = "Enero";
                else if (mes2 == 2)
                    mes = "Febrero";
                else if (mes2 == 3)
                    mes = "Marzo";
                else if (mes2 == 4)
                    mes = "Abril";
                else if (mes2 == 5)
                    mes = "Mayo";
                else if (mes2 == 6)
                    mes = "Junio";
                else if (mes2 == 7)
                    mes = "Julio";
                else if (mes2 == 8)
                    mes = "Agosto";
                else if (mes2 == 9)
                    mes = "Septiembre";
                else if (mes2 == 10)
                    mes = "Octubre";
                else if (mes2 == 11)
                    mes = "Noviembre";
                else if (mes2 == 12)
                    mes = "Dicimebre";

                
                String stringfecha =  hora + " - " + dia + " de " + mes;
                
                
                String ubicacionArchivo = "C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\img\\";
                //String ubicacionArchivo = "C:\\Users\\Terriquez\\Downloads\\ProyectoIntegrador\\RedSocial\\web\\img\\";

                File archivo = new File(ubicacionArchivo + no_cuenta + ".png");
                try {
                BufferedReader br = new BufferedReader(new FileReader(archivo));
                //if(br.readLine() == null)
                    
                }catch(IOException e) {
                    e.printStackTrace();
                    no_cuenta = "z";
                }
                
                out.println("<div class='row' ><div class='col-md-2 col-sm-3 text-center'><a class='story-title' href='#'>"
                        + "<img alt='' src='img/"+no_cuenta+".png' style='width:90px;height:90px' class='img-circle'></a></div><div class='col-md-10 col-sm-9'><h5 style = 'color:black;'>");
                out.print(texto);
                out.println("</h5><div class='row'><div class='col-xs-9'><h4><span class='label label-default'><strong>");
                out.print(nombre);
                out.println("</strong></span></h4><h4><small style='font-family:courier,'new courier';' class='text-muted'><strong>");
                out.print(stringfecha + " ");
                out.println("</strong><a href='#' class='text-muted'></a></small></h4></div><div class='col-xs-3'></div></div></div></div><hr>");
            }                                      //muted'>COMENTAR

%>                     
                                            
                             </div>               
				</div>
			</div>
              <!-- page start-->
              
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
    <script src="js/scripts.js"></script>


  </body>
</html>


<%
}
  else{         
%>

	<center>
<table width="326" border="0">
  <tr>
    <td height="54"><div align="center">Usuario No Registrado</div>      <div align="center"></div></td>
  </tr>
  <tr>
      <td><div align="center"><img src="no.png"  width="128" height="128" /></div><div align="center"></div></td>
  </tr>
</table>
</center>
        <%
        }
        %>
    </body>
</html>
