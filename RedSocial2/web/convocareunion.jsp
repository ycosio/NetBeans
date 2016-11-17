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
      String ncuenta = (String)session.getAttribute("varNcuenta");
      String tipo = (String)session.getAttribute("varTipo");
      String progEducativo = (String)session.getAttribute("varProgEducativo");
      String academiaUSUARIO = (String)session.getAttribute("varAcademia");
      
      String[] tipos= new String[5];
      tipos[0] = "Presidente";
      tipos[1] = "Coordinador";
      tipos[2] = "Subdirector";
      tipos[3] = "Profesor";
      tipos[4] = "Secretario";
  %>
  

<%  
if(tipos[0].equals(session.getAttribute("varTipo"))){ %>

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


    <link href="css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="css2/bootstrap-datetimepicker.min.css">
    
    
    <!--TARRUDA-->
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
    <!--TERMINA TARRUDA-->
    
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
					<h3 class="page-header"><i class="fa fa fa-bars"></i> ¡Hola <% out.print(user);%>, programa una reunion !</h3>
					
                                        

               
    <form class="form-horizontal" name ="convocarlareunion" method="post">
       <div class="form-group">
        <label class="col-xs-3 control-label">Titulo</label>
        <div class="col-xs-5">
        <input type="text" class="form-control" name="nombre" placeholder="Titulo">
        </div>
        </div>
        
        <div class="form-group">
        <label class="col-xs-3 control-label">Lugar</label>
        <div class="col-xs-5">
        <input type="text" class="form-control" name="lugar" placeholder="Lugar">
        </div>
        </div>
        
        <div class="form-group">
        <label class="col-xs-3 control-label">Semestre</label>
        <div class="col-xs-5">
        <SELECT NAME="semestre" SIZE=1 class="form-control"> 
            <OPTION VALUE="1">1</OPTION>
            <OPTION VALUE="2">2</OPTION>
            <OPTION VALUE="3">3</OPTION>
            <OPTION VALUE="4">4</OPTION>
            <OPTION VALUE="5">5</OPTION>
            <OPTION VALUE="6">6</OPTION>
            <OPTION VALUE="7">7</OPTION>
        </SELECT>
        </div>
        </div>
        
        
        <div class="form-group">
            
         <!--FECHA CHAFA-->
         <label class="col-xs-3 control-label">Fecha</label>
         <script language="javascript" type="text/javascript" src="js/datetimepicker.js"></script>
         <input id="demo3" type="text" size="25"><a href="javascript:NewCal('demo3','ddmmyyyy',true,24)"><img src="img/cal.gif" width="16" height="16" border="0" alt="Elije una fecha"></a>
         <!--TERMINA FECHA CHAFA-->
         
         
         <!--FECHA CHIDA-->
         <label class="col-xs-3 control-label">Fecha</label>
         <div class="col-xs-5"> 
            <div id="datetimepicker" class="input-append date">
                <input type="text" class="form-control" name="fecha" placeholder="Fecha"></input><label> </label><label> </label><label> </label>
                  <span class="add-on">  
                    <i data-time-icon="icon-time" data-date-icon="icon-calendar"><img src="img/cal.gif" width="16" height="16" border="0" alt="Elije una fecha"></i>
                  </span>
         </div>
         <!--TERMINA FECHA CHIDA-->
             
     <!--SCRIPT INTERNET-->
     <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> 
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript"src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js"></script>
    
    <!--SCRIPT SIN INTERNET-->
    <script type="text/javascript" src="js/jquery.min.js"></script> 
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.pt-BR.js"></script>
    
    <script type="text/javascript">
      $('#datetimepicker').datetimepicker({
        format: 'yyyy-MM-dd hh:mm',
        language: 'en'
      });
    </script>
         
         </div>
         </div>
        
         <div class="form-group">
        <label class="col-xs-3 control-label">Miembros a convocar</label>
        <div class="col-xs-5">                 
            <br><label style="font-style: italic"> Selecciona los miembros de tu academia que necesitan asistir. (Incluyéndote) </label>
       <%
                
            String academia = (String)session.getAttribute("varAcademia"); 
            String[] nCuenta = new String[100];
            String nombre;
            int i =0;    
            
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            ResultSet resultado=conexion.consulta("select no_cuenta,nombre from profesor where idacademia='" + academia + "';");
            
            
            while(resultado.next())
            {
                nCuenta[i]=resultado.getString("no_cuenta");
                nombre=resultado.getString("nombre");
                i++;
       %> 
       
       <div  id = "cb" ></div> 
<script  type = "text/javascript" > 
    var cbh = document . getElementById ( 'cb' ); 
    var val =  "<%out.print(i); %>" ; 
    var cap =  "<%out.print(nombre); %>" ;

    var p = document.createElement('p');
    var br = document . createElement ( 'br' );
    p . appendChild (br);
    cbh . appendChild ( p );

    var cb = document . createElement ( 'input' ); 
    cb . type =  'checkbox' ; 
    
    cb . name = val ; 
    cb . value = cap ; 
    cbh . appendChild ( cb ); 
    cbh . appendChild ( document . createTextNode ( cap )); 
   
</script>
        <%
           }                            
        %>

        
        </div>
        </div>
        
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
              <button type="submit" class="btn btn-default">Programar</button>
            </div>
        </div>
        
        
    </form>
                                        
                                        
                                        
                                        
                                        
                                        
				</div>
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
              
            
            
            if(request.getParameter("fecha")!=null && request.getParameter("nombre")!=null)
            {
            
                String fecha = request.getParameter("fecha");
                String titulo = request.getParameter("nombre");
                String semestre = request.getParameter("semestre");
                String lugar = request.getParameter("lugar");
                
            resultado = conexion.consulta("select idreunion from reunion where idreunion=(select max(idreunion) from reunion)");
            int idlista=0;
            int idminuta=0;
             
            while(resultado.next())
            {
                idlista = Integer.parseInt(resultado.getString("idreunion"));
                idminuta = idlista;
            }
            
            if(idminuta==0)
            {
                idlista=1;
                idminuta=1;
            }
            
            conexion.ejecuta("INSERT INTO reunion (idlista,idacademia,fecha,lugar,semestre,titulo,idminuta, progEducativo) VALUES ('" + idlista + "','" + academia + "','" + fecha + "','" + lugar + "','" + semestre + "','" + titulo + "','" + idminuta + "','" + progEducativo + "');");
                   //out.print("INSERT INTO reunion (idlista,folio_plan,idacademia,fecha,lugar,semestre,titulo,archivodeminuta) VALUES ('" + idlista + "','" + folio_plan + "','" + academia + "','" + fecha + "','" + lugar + "','" + semestre + "','" + titulo + "', 'No creada aun');");
   
            String check;
                    
            for(int j=0; j<i; j++)
            {
                check = (j+1) + "";
                if(request.getParameter(check) != null)
                    conexion.ejecuta("INSERT INTO lista VALUES ('" + idlista + "', '" + nCuenta[j] + "', '-');");
            }
            
            //PARCHESITO
                          //  INSERT INTO minuta values ("12312313");
            //conexion.ejecuta("INSERT INTO planes_de_estudio VALUES ('" + idminuta + "','-',"+ "'academia'" + "'-');");
            conexion.ejecuta("INSERT INTO minuta VALUES ('" + idminuta + "','-','-','-','1999-11-11 11:11:11');");
            
            %>
            <script>alert('Reunion Convocada')</script>
            <%
          }
                    
        %>





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
