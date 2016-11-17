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

 <%
      String user = (String)session.getAttribute("varUsuario");
      String tipo = (String)session.getAttribute("varTipo");
      String academia2 = (String)session.getAttribute("varAcademia");
      String nombretemp = "";
      String ncuentatemp = "";
       String ncuenta = (String)session.getAttribute("varNcuenta");

      String[] tipos= new String[5];
      tipos[0] = "Presidente";
      tipos[1] = "Coordinador";
      tipos[2] = "Subdirector";
      tipos[3] = "Profesor";
      tipos[4] = "Secretario";
  %>
  

<% 
if(tipos[1].equals(session.getAttribute("varTipo"))){ %>

<!DOCTYPE html>
<html lang="en">
    <script>
        function valida()
        {
            document.reunion.action="nuevaReunion.jsp";//proxima validacion campos agregarmiembro
            document.reunion.submit();
        }
        
    </script>
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
					<h3 class="page-header"><i class="fa fa fa-bars"></i> Ingresa los datos <% out.print(user);%>...</h3>
					
						
 <form class="form-horizontal" role="form" name="agregarMiembro" method="post" style="color: black">
  
      <div class="form-group">
    <label class="col-lg-2 control-label">Numero de Cuenta</label>
    <div class="col-lg-10">
        <input type="text" class="form-control" name="nCuenta" id="ejemplo_email_3"
             placeholder="Número de cuenta">
    </div>
  </div>
     
     <div class="form-group">
    <label class="col-lg-2 control-label">Nombre</label>
    <div class="col-lg-10">
        <input type="text" class="form-control" name="nombre"id="ejemplo_email_3"
             placeholder="Nombre Completo">
    </div>
  </div>
     
  
  <div class="form-group">
    <label for="ejemplo_password_3" class="col-lg-2 control-label">Contraseña</label>
    <div class="col-lg-10">
      <input type="password" class="form-control" name="pass"id="ejemplo_password_3" 
             placeholder="Contraseña">
    </div>
  </div>
     
     <div class="form-group">
    <label for="ejemplo_email_3" class="col-lg-2 control-label">Email</label>
    <div class="col-lg-10">
      <input type="email" class="form-control"name="email" id="ejemplo_email_3"
             placeholder="Correo Electrónico">
    </div>
  </div>
     
  <div class="form-group">
    <label class="col-lg-2 control-label">Tipo</label>
    <div class="col-lg-10">
        <SELECT NAME="tipo" SIZE=1 class="form-control"> 
            <OPTION VALUE="Presidente">Presidente</OPTION>
            <OPTION VALUE="Profesor">Profesor</OPTION>
            <OPTION VALUE="Secretario">Secretario</OPTION>
        </SELECT> 
    </div>
  </div>
  
     <script>
         
         function academia(x)
         {
             var groups=document.agregarMiembro.academia2.options.length;
             var prog=document.agregarMiembro.progEducativo.value;
             var group=new Array(groups);
             for (i=0; i<groups; i++)
                group[i]=new Array();
            
          if(prog==="1" || prog===null)
          {
            group[0][0]=new Option("Fisica");
            group[0][1]=new Option("Matematicas para ingenieria");
            group[0][2]=new Option("Electronica digital");
            group[0][3]=new Option("Calculo diferencial e integral");
            group[0][4]=new Option("Electricidad y magnetismo");
            group[0][5]=new Option("Probabilidad y metodos estadisticos");
            group[0][6]=new Option("Metodos numericos");
            group[0][7]=new Option("Ecuaciones diferenciales");
            group[0][8]=new Option("Analisis de señales");
            
            group[1][0]=new Option("Redes de datos");
            group[1][1]=new Option("Enrutamiento basico");
            group[1][2]=new Option("Enrutamiento WAN y conmutacion");
            group[1][3]=new Option("Sistemas operativos y servicios de internet");
            group[1][4]=new Option("Comunicaciones digitales");
            group[1][5]=new Option("Comunicaciones opticas");
            group[1][6]=new Option("Comunicaciones moviles y satelitales");
            group[1][7]=new Option("Administracion y seguridad de redes");
            group[1][8]=new Option("Redes inalambricas de sensores");
            group[1][9]=new Option("Simulacion y calidad de servicio");
            
            group[2][0]=new Option("Atquitectura de computadors");
            group[2][1]=new Option("Sistemas embebidos");
            group[2][2]=new Option("Robotica");
            
            group[3][0]=new Option("Herramientas de programacion");
            group[3][1]=new Option("Estructuras y bases de datos");
            group[3][2]=new Option("Programacion");
            group[3][3]=new Option("Programacion visual");
            group[3][4]=new Option("Programacion web");
            group[3][5]=new Option("Ingenieria de software");
            group[3][6]=new Option("Bases de datos distribuidas");
            
            group[4][0]=new Option("Etica y comportamiento en las organizaciones");
            group[4][1]=new Option("Derecho informatico");
            group[4][2]=new Option("Formulacion de proyectos");
            group[4][3]=new Option("Evaluacion de proyectos");
            group[4][4]=new Option("Direccion de proyectos");
            
            group[5][0]=new Option("Seminario de investigacion 1");
            group[5][1]=new Option("Seminario de investigacion 2");
            
            group[6][0]=new Option("Pre-Intermediate general english");
            group[6][1]=new Option("Intermediate general english");
            group[6][2]=new Option("Intermediate english for computer users");
            group[6][3]=new Option("Upper-Intermediate english for computer users");
            group[6][4]=new Option("Advanced english for computer users");
            group[6][5]=new Option("English for research");
            group[6][6]=new Option("Occupational english");
        }
        else
        {
            group[0][0]=new Option("Fisica");
            group[0][1]=new Option("Matematicas basicas");
            group[0][2]=new Option("Calculos");
            group[0][3]=new Option("Probabilidad");
            group[0][4]=new Option("Matematicas discretas");
            group[0][5]=new Option("Metodos estadistivos");
            group[0][6]=new Option("Metodos numericos");
            group[0][7]=new Option("Simulacion e investigacion de operaciones");
            
            group[1][0]=new Option("Redes de computadoras");
            group[1][1]=new Option("Sistemas operativos y servicios de internet");
            group[1][2]=new Option("Seguridad de datos");
            
            group[2][0]=new Option("Sistemas digitales");
            group[2][1]=new Option("Atquitectura de computadors");
            group[2][2]=new Option("Sistemas embebidos");
            
            group[3][0]=new Option("Ofimatica");
            group[3][1]=new Option("Lenguajes algoritmicos");
            group[3][2]=new Option("Analisis y modelado de software");
            group[3][3]=new Option("Programacion orientada a objetos");
            group[3][4]=new Option("Sistemas de informacion");
            group[3][5]=new Option("Diseño de software");
            group[3][6]=new Option("Administracion de proyectos de software");
            group[3][7]=new Option("Programacion visual");
            group[3][8]=new Option("Estructura de datos");
            group[3][9]=new Option("Programacion distribuida");
            group[3][10]=new Option("Bases de datos");
            group[3][11]=new Option("Interaccion humano-computadora");
            group[3][12]=new Option("Preogramacion en internet");
            group[3][13]=new Option("Testeo y metodos de usabilidad");
            group[3][14]=new Option("Bases de datos distribuidas");
            group[3][15]=new Option("Sistemas de hipermedia");
            group[3][16]=new Option("Mantenimiento de software");
            group[3][17]=new Option("Programacion de dispositivos moviles");
           
            group[4][0]=new Option("Formulacion de proyectos");
            group[4][1]=new Option("Evaluacion de proyectos");
            group[4][2]=new Option("Etica y comportamiento en las organizaciones");
            group[4][3]=new Option("Direccion de proyectos");
            group[4][4]=new Option("Derecho informatico");
            
            group[5][0]=new Option("Seminario de investigacion 1");
            group[5][1]=new Option("Seminario de investigacion 2");
            
            group[6][0]=new Option("Pre-Intermediate general english");
            group[6][1]=new Option("Intermediate general english");
            group[6][2]=new Option("Intermediate english for computer users");
            group[6][3]=new Option("Upper-Intermediate english for computer users");
            group[6][4]=new Option("Advanced english for computer users");
            group[6][5]=new Option("English for research");
            group[6][6]=new Option("Occupational english");
        }

        var temp=document.agregarMiembro.materia;
             
             while(temp.options[0]!=null)
             {
                temp.options[0]=null;
             }
             
                     
                     for (i=0;i<group[x].length;i++)
                     temp.options[i]=new Option(group[x][i].text,group[x][i].value);
                    
                    temp.options[0].selected=true;
           
         }
         
     </script>

     
  <div class="form-group">
    <label class="col-lg-2 control-label">Programa educativo</label>
    <div class="col-lg-10">
        <SELECT NAME="progEducativo" SIZE=1 class="form-control" onchange="academia(document.agregarMiembro.academia2.options.selectedIndex)"> 
            <OPTION VALUE="Ingenieria en Telematica">Ingenieria en Telematica</OPTION>
            <OPTION VALUE="Ingenieria de Software">Ingenieria de Software</OPTION>
        </SELECT> 
    </div>
  </div>
     
  <div class="form-group">
    <label class="col-lg-2 control-label">Academia</label>
    <div class="col-lg-10">
        <SELECT NAME="academia2" SIZE=1 class="form-control" onchange="academia(this.options.selectedIndex)"> 
            <OPTION VALUE="1">Ciencias Básicas</OPTION>
            <OPTION VALUE="2">Redes y Telecomunicaciones</OPTION>
            <OPTION VALUE="3">Arquitectura de Computadoras</OPTION>
            <OPTION VALUE="4">Software</OPTION>
            <OPTION VALUE="5">Entorno Social</OPTION>
            <OPTION VALUE="6">Introducción a la investigación</OPTION>
            <OPTION VALUE="7">Lengua Inglesa</OPTION>
        </SELECT> 
    </div>
  </div>
     
     <div class="form-group">
    <label class="col-lg-2 control-label">Materia</label>
    <div class="col-lg-10">
        <SELECT name="materia" SIZE=1 class="form-control"> 
            <OPTION VALUE="Fisica">Fisica</OPTION>
            <OPTION VALUE="Matematicas para ingenieria">Matematicas para ingenieria</OPTION>
            <OPTION VALUE="Electronica digital">Electronica digital</OPTION>
            <OPTION VALUE="Calculo diferencial e integral">Calculo diferencial e integral</OPTION>
             <OPTION VALUE="Electricidad y magnetismo">Electricidad y magnetismo</OPTION>
            <OPTION VALUE="Probabilidad y metodos estadisticos">Probabilidad y metodos estadisticos</OPTION>
            <OPTION VALUE="Metodos numericos">Metodos numericos</OPTION>
            <OPTION VALUE="Ecuaciones diferenciales">Ecuaciones diferenciales</OPTION>
            <OPTION VALUE="Analisis de señales">Analisis de señales </OPTION>
        </SELECT> 
        
    </div>
  </div>
     
     
     
  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
        <button type="submit" class="btn btn-default">Enviar</button>
    </div>
  </div><br>
     
     <%
        
       String nombre = request.getParameter("nombre");
            String nCuenta = request.getParameter("nCuenta");
            String pass = request.getParameter("pass");
            String email = request.getParameter("email");
            String tipouser = request.getParameter("tipo");
            String progEducativo = request.getParameter("progEducativo");
            String academia = request.getParameter("academia2");
            String materia = request.getParameter("materia");
                
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            
            
            conexion.ejecuta("INSERT INTO profesor VALUES ('"+ nCuenta +"','" +nombre+ "','"    +pass+ "','" + tipouser + "','" + academia + "','"   +email+ "','" + progEducativo + "','" + materia + "');");
           
            nombretemp = nombre;
            ncuentatemp = nCuenta;
          
        if(nombretemp != null)
        {    
            %>
            <script>alert('Usuario Registrado')</script>
            <%
        out.println("<div class='form-group'><div class='col-lg-offset-2 col-lg-10'><label><strong>");
        out.println("                              " + "Usuario " + nombretemp + " ha sido agregado con el numero de cuenta " + ncuentatemp + ".");
        out.println("</strong></label></div></div>");
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