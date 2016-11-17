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
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

 <%
      String user = (String)session.getAttribute("varUsuario");
      String tipo = (String)session.getAttribute("varTipo");
      String ncuenta = (String)session.getAttribute("varNcuenta");
      String academiaUSUARIO = (String)session.getAttribute("varAcademia");
      String progEducativo = (String)session.getAttribute("varProgEducativo");
      
      String[] tipos= new String[5];
      tipos[0] = "Presidente";
      tipos[1] = "Coordinador";
      tipos[2] = "Subdirector";
      tipos[3] = "Profesor";
      tipos[4] = "Secretario";
  %>
  
  <script>
        function nueva()
        {
            
            alert(document.botones.2.value;);
        }
        
        function descargar()
        {
        <%
           String filepath = "C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\Documentos\\" + request.getParameter("valor");
           //String filepath = "C:\\Users\\Terriquez\\Downloads\\ProyectoIntegrador\\RedSocial\\web\\Documentos\\" + request.getParameter("valor");
                try {

                    java.io.FileInputStream archivo = new java.io.FileInputStream(filepath);
                    int longitud = archivo.available();
                    byte[] datos = new byte[longitud];
                    archivo.read(datos);
                    archivo.close();

                    response.setContentType("application/octet-stream");
                    response.setHeader("Content-Disposition", "attachment;filename=" + request.getParameter("valor"));

                    ServletOutputStream ouputStream = response.getOutputStream();
                    ouputStream.write(datos);
                    ouputStream.flush();
                    ouputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
        %>
        }
        
         function tangible()
        {
            if(document.reunion.nuevaReunion.checked)
            document.reunion.fecha.disabled=false;
            else
            document.reunion.fecha.disabled=true;
            
        }
        
    </script>
  
<%  if(tipo != null){ %>

<!DOCTYPE html>
<html lang="en">
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
                                ResultSet resultadoNombreAcademia = conexionNombreAcademia.consulta("select nombre from academias where idacademia='"+academiaUSUARIO+"'"); 
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
					<h3 class="page-header"><i class="fa fa fa-bars"></i> Estas son tus ultimas reuniones</h3>
					
                                        
                                     
                                        <form name="botones" action="redireccionMinuta">
              
          <%
                
            String academia = (String)session.getAttribute("varAcademia");
            
            String titulo = "empty";
            String fechaR;
            String lugar;
            String fechatemp;
            String reunion;
            int i =0;    
            
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            ResultSet resultado=conexion.consulta("select idreunion, fecha, titulo, lugar from reunion where idacademia='" + academia + "';");
                            
            
            while(resultado.next())
            {
                i++;
                reunion = resultado.getString("idreunion");
                fechaR=resultado.getString("fecha");
                titulo=resultado.getString("titulo");
                lugar = resultado.getString("lugar");
                
                
                int mes2 = Integer.parseInt(fechaR.substring(5,7));
                String mes = "";
                String hora = fechaR.substring(11,16);
                String dia = fechaR.substring(8,10);
                String anio = fechaR.substring(0,4);
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

                
                fechatemp =  dia + " de " + mes + " de " + anio + " | " + hora + "h";
                
                out.println("<div class='row' style = 'background-color: white; margin-top: 0.5cm;color:black;'><div class='col-sm-10' ><h4> <span class='label label-default'>");
                out.print(fechatemp);
                out.println("</span> </h4> <h4 style='margin-top: 0.5cm;'><strong>"); 
                out.print(titulo);
                out.println("</strong></h4><h5 class='text-muted' style= 'color:black;'>Lugar: "); 
                out.print(lugar);
                out.println("</h5><button type='submit' name='valor' value='Minuta-Reunion" + reunion + ".pdf' class='btn btn-success btn-sm' style='margin-right: 7px;font-weight:bold;' '>Descargar</button>");
                
                if(tipos[4].equals(session.getAttribute("varTipo")))
                {
                out.println("<button style='margin-left: 13px;font-weight:bold;' type='submit' class='btn btn-info btn-sm' value=" + reunion);  
                out.print(i);
                out.println(" name=" + i);
                out.print(i);
                out.println(">Redactar</button>");
                
                }
                
                out.println("<br> <br></div></div>");
           }      
           if(titulo == "empty"){
               %>
          
               <h4> No tienes ninguna reunión pendiente <h4>
               
            <%
           }  
            %>
   
                                </form>
        
        
        
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





















<div class="wrapper">
    <div class="box">
        <div class="row">
            <!-- sidebar -->
            <div class="column col-sm-3" id="sidebar">
            </div>
            <!-- /sidebar -->
          
            <!-- main -->
            <div class="column col-sm-9" id="main">
                <div class="padding">
                    <div class="full col-sm-9">
                      
                        <!-- content -->
                        
                        <div class="col-sm-12" id="featured">   
                          <div class="page-header text-muted">
                            <h4> Ultimas reuniones de tu academia </h4>
                          </div> 
                        </div>
                        
                        <!--/top story-->
                        <div class="row"><div class="col-sm-10" ><h4> <span class="label label-default">
                        12 de Agosto del 2015
                        </span> </h4><h4 style="margin-top: 0.7cm;">
                        Planeaciones finales para matematicas
                        </h4><h5 class="text-muted">
                        Auditorio 2 
                        <a href="#" class="text-muted"> ? Redactar la minuta</a></h5><br></div></div>
                      
                      
                    </div><!-- /col-9 -->
                </div><!-- /padding -->
            </div>
            <!-- /main -->
        </div>
    </div>
</div>



--%>
            