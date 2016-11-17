<%--
    Document   : presidente
    Created on : 28-oct-2015, 18:43:27
    Author     : Ycosio
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
  <script>
             function change(button)
    {
        button.value= button.name;

        button.name = "valor";
        document.frm.action = 'downloadFile';
        document.frm.submit();
        
        
    }
    
</script>
            
<% 
    String idplaneacion = (String)session.getAttribute("varIdPlaneacion");
    String user = (String)session.getAttribute("varUsuario");
    String tipo = (String)session.getAttribute("varTipo");
    String ncuenta = (String)session.getAttribute("varNcuenta");
    String academia = (String)session.getAttribute("varAcademia");
    String progEducativo2 = (String)session.getAttribute("varProgEducativo");

    String[] tipos= new String[5];
    tipos[0] = "Presidente";
    tipos[1] = "Coordinador";
    tipos[2] = "Subdirector";
    tipos[3] = "Profesor";
    tipos[4] = "Secretario";
 
 %>


     
        <!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
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
            <a href="home.jps" class="logo">Sistema <span class="lite">Academias</span></a>
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
                            
                                
                                <% out.print(user);
                                   out.print(", ");
                                   out.print(tipo);
                                %>
                                
                                
                            
                            </span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="subirfoto.jsp"><i class="icon_profile"></i> My Profile</a>
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
        
        
        
        
<form name="frm"  method="post"> 
       <%
        
        ConexionBD conexion  = new ConexionBD();
        ConexionBD conexion4 = new ConexionBD();
        ConexionBD conexion5 = new ConexionBD();
        conexion.conecta();
        conexion4.conecta();  
        conexion5.conecta();  
        
        ResultSet resultado = conexion.consulta("Select * from planeaciones where idplaneacion='" + idplaneacion + "';");
        
        while(resultado.next())
        {
            String nombre = resultado.getString("nombre");
            String idacademia = resultado.getString("idacademia");
            String nocuenta = resultado.getString("nocuenta");
            String estado = resultado.getString("estado");
            String progEducativo = resultado.getString("progEducativo");
            String materia = resultado.getString("materia");
            
            ResultSet resultado2 = conexion4.consulta("select nombre from profesor where no_cuenta='"+nocuenta+"'");
            resultado2.next();
            String nombreProfesor = resultado2.getString("nombre");
            ResultSet resultado3 = conexion5.consulta("select nombre from academias where idacademia='"+idacademia+"'");
            resultado3.next();
            String nombreAcademia = resultado3.getString("nombre");
            

                out.println("<div contentEditable=false ALIGN='JUSTIFY' style='width: calc(100% - 1px);height: 170px;border: 1px solid #999;background-color: white;padding: 14px;margin-bottom: 10px; overflow: auto;white-space: nowrap;'><strong style ='color:#005BB5'><strong style ='color:#005BB5;font-size: large'>");
                out.print(materia +" para "+ progEducativo);
                out.println("</Strong>  - <em  style ='font-weight: normal;color:#787878'>");
                out.print("Subido por " + nombreProfesor + " de la Academia de " + nombreAcademia);
                out.println("</em> <br><br><label style='font-weight: normal; color:black;'>");
                out.print("Estado: "+ estado +"<br><br>");//<label>Si desea ver el archivo, clic en descargar</label>
                out.println("<br><input type='submit' value='¡Descargar!' name= '"+ idplaneacion +"' onclick='return change(this);' /><br>");
                out.println("</label></div>");
            
             }
        %>
</form>
    
        
                                            
                                            
                                            
                                            <%
            if(request.getParameter("post")!=null)
            {
                String archivo = "No";
                String texto = request.getParameter("post");
                
                java.util.Date dNow = new java.util.Date(); 
                SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm");
                String fecha = ft.format(dNow);
             
            //ConexionBD conexion = new ConexionBD();
            //conexion.conecta();
            conexion.ejecuta("INSERT INTO publicacion(no_cuenta,texto,fecha,archivo,idacademia,plan,progEducativo)VALUES ('" + ncuenta + "','" + texto + "','" + fecha + "','" + archivo + "','" + academia + "', '" + idplaneacion + "','" + progEducativo2 + "');");
                   //out.print("INSERT INTO publicacion VALUES ('" + ncuenta + "','" + texto + "','" + fecha + "','" + archivo + "','" + academia + "');");
                  
            
          }
               %> 
        
        
    <%
            java.util.Date fecha = new java.util.Date();
            String no_cuenta = "";
            String nombre = "";
            String texto = "";
            String mes = "";
            
            ConexionBD conexion3 = new ConexionBD();
            conexion3.conecta();
            ConexionBD conexion2 = new ConexionBD();
            conexion2.conecta();
            
            //ResultSet resultado=conexion.consulta("select no_cuenta,texto,fecha from publicacion where idacademia='" + academia + "';");
            ResultSet resultado3=conexion3.consulta("select no_cuenta,texto,fecha from publicacion where idacademia='" + academia + "' and plan='"+idplaneacion+"' order by idpublicacion desc;");
            
            
            while(resultado3.next())
            {
                no_cuenta=resultado3.getString("no_cuenta");
                
                ResultSet resultado2=conexion2.consulta("select nombre from profesor where no_cuenta='" + no_cuenta + "';");
                resultado2.next();
                nombre = resultado2.getString("nombre");
                
                
                texto=resultado3.getString("texto");
                fecha = resultado3.getTimestamp("fecha");
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
                
                out.println("<div class='row' style='background-color: white;'><br><div class='col-md-2 col-sm-3 text-center'><a class='story-title' href='#'>"
                        + "<img alt='' src='img/"+no_cuenta+".png' style='width:90px;height:90px' class='img-circle'></a></div><div class='col-md-10 col-sm-9'><h4 style = 'color:black;'>");
                out.print(texto);
                out.println("</h5><div class='row'><div class='col-xs-9'><h4><span class='label label-default'>");
                out.print(nombre);
                out.println("</span></h4><h4><small style='font-family:courier,'new courier';' class='text-muted'>");
                out.print(stringfecha + " • ");
                out.println("<a href='#' class='text-muted'>Comentar</a></small></h4></div><div class='col-xs-3'></div></div></div></div><hr>");

                
                /*
                <div contentEditable=false ALIGN="JUSTIFY" style="width: calc(100% - 1px);height: calc(100% - 1px);border: 1px solid #999;background-color: white;padding: 14px;margin-bottom: 10px; overflow: auto;white-space: nowrap;"><strong style ="color:#005BB5">
                USER 
                </Strong>  - <em  style ="color:#787878">
                12:12 - 12 de agosto del 2015
                </em> <br><br>
                TEXTO
                </div>
           
                */
                
                
            
            
            }
        
        %>
    
</form>

<div class="container">
         <form class="form-horizontal" name ="publicacion" method="post">
  
            <div class="form-group col-x-12" id="search">
                <h4>¿Tu qué opinas?</h4>
             <br>
              <textarea name="post" class="form-control" id="post" placeholder="¿Que te pareció el documento?" style="height: 90px; resize: none;"></textarea>
            </div>

            <div class="form-group col-xs-2 navbar-right" id="search">
              <input type="submit" class="form-control btn-primary" value="Publicar">
            </div>

            </form>
        </div> 
       
    
        
        
                         </div>               
				</div>
			<!--/div>
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

