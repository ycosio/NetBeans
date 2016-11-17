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
<script> 

    function change(button)
    {
        document.frm.hide.name="NADA";
        button.value= button.name;
        button.name = "valor";
        document.frm.action = 'downloadFile';
        document.frm.submit();
        
         if(location.search.indexOf('reloaded=yes') < 0){
	var hash = window.location.hash;
	var loc = window.location.href.replace(hash, '');
	setTimeout(function(){window.location.href = loc + hash;}, 1000);
    }
    }
    
     function descargar(button)
    {
        button.name = "valor";
        document.frm.action = 'downloadFile';
        document.frm.submit();
    }
    
    function comentario(button)
    {
        button.value= button.name;
        button.name = "valor";
        document.frm.action = 'redireccionPlan';
        document.frm.submit(); 
    }
    
    function verificarSeleccion(f)
    {
        if(f.archivo.value === '')
        {
        alert ('====> ATENCIÓN <==== \n \nNo has seleccionado un archivo aún\nPorfavor selecciona tu planeación\n\n\n\n  ');  
        f.archivo.focus(); 
        return false;
    }
    return true;
    
    }
    
    function estado(button)
    {
        if(button.value === "Autorizar")
        {
        button.value= button.name;
        button.name = "valor1";
        document.frm.action = 'actualizarEstado';
        document.frm.submit();
        
        alert("\n\n\n\n SE HA AUTORIZADO LA PLANEACION \n\n\n\n");
        
        }
        
        else if (button.value === "Rechazar")
        {
        button.value= button.name;
        button.name = "valor2";
        document.frm.action = 'actualizarEstado';
        document.frm.submit();    
        
        alert("\n\n\n\n LA PLANEACION SE HA PUESTO COMO PENDIENTE\n\n\n\n");
        
        }
    }
    
    
    function estado2(button)
    {
        if(button.name === "Autorizar")
        {
            
        button.name = "valor1";
        document.frm.action = 'actualizarEstado';
        document.frm.submit();
        
        alert("\n\n\n\n SE HA AUTORIZADO LA PLANEACION \n\n\n\n");
        
        }
        
        else if (button.name === "Rechazar")
        {
        button.name = "valor2";
        document.frm.action = 'actualizarEstado';
        document.frm.submit();    
        
        alert("\n\n\n\n LA PLANEACION SE HA PUESTO COMO PENDIENTE\n\n\n\n");
        
        }
    }
    
</script>
 <%
      String user = (String)session.getAttribute("varUsuario");
      String tipo = (String)session.getAttribute("varTipo");
      String academia = (String)session.getAttribute("varAcademia");
      String progEducativo = (String)session.getAttribute("varProgEducativo");
      String materia = (String)session.getAttribute("varMateria");
      String[] tipos= new String[5];
      String ncuenta = (String)session.getAttribute("varNcuenta");
      
      tipos[0] = "Presidente";
      tipos[1] = "Coordinador";
      tipos[2] = "Subdirector";
      tipos[3] = "Profesor";
      tipos[4] = "Secretario";
  %>


  
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
//=========================================================================================================\\
//========================================= SUBDIRECTOR ===================================================\\
//=========================================================================================================\\
if(tipos[2].equals(session.getAttribute("varTipo"))){ //SUBDIRECTOR
//MOSTRAR PLANES AUTORIZADOS DESDE LA BASE DE DATOS SEPARADO POR ACADEMIAS => DIFICULTAD: PELADO <=
    ConexionBD conexion = new ConexionBD();
    conexion.conecta();
    String nombre;
    String materiaDocumento;
    String idplaneacion;
    String estadini;
         

    out.println("<div class='panel panel-primary'><div class='panel-heading'>"
     + "<h3 class='panel-title'><strong>Planes autorizados de la facultad</strong></h3>"
    + "</div><div class='panel-body'>");
    
         ResultSet resultado = conexion.consulta("select nombre,idplaneacion,materia from planeaciones where estado='Autorizado';");
         
         while(resultado.next())
            {
                nombre = resultado.getString("nombre");
                idplaneacion = resultado.getString("idplaneacion");
                materiaDocumento = resultado.getString("materia");
                
             
                out.println("<br><input type='hidden' name='hide'/><label>Materia <strong>"+materiaDocumento+"</strong> ("+ nombre+")</label><br>"
                        + "<input type='submit' class='btn btn-info btn-sm' value='Descargar' name= '"+ idplaneacion +"' onclick='return change(this);' />"
                        + "<hr style='color: gray;background-color: #007aff;height:1px;'>");
            }
      
         out.println("</div></div>");
%>
</form>   

<%
 }
    else if (tipo != null)
 {
 %>
        
 

<form name="frm" action=""  method="post">  
    <%//action='downloadFile'
    
//=========================================================================================================\\
//========================================== PERSONALES ===================================================\\
//=========================================================================================================\\
     
    ncuenta = (String)session.getAttribute("varNcuenta");
    String nombre = "empty";
    String idplaneacion = "";
    String materiaDocumento = "";
    String estadini = "";
    
    ConexionBD conexion = new ConexionBD();
    conexion.conecta();
    
    out.println("<div class='panel panel-success'><div class='panel-heading'>"
     + "<h3 class='panel-title'><strong>Tus planes personales</strong></h3>"
    + "</div><div class='panel-body'>");
    
    ResultSet resultado = conexion.consulta("select nombre,idplaneacion,materia,estado from planeaciones where progEducativo='" + progEducativo + "' && materia='" + materia + "';");
    while(resultado.next())
            {
                nombre = resultado.getString("nombre");
                idplaneacion = resultado.getString("idplaneacion");
                materiaDocumento = resultado.getString("materia");
                estadini = resultado.getString("estado");
             
                out.println("<input type='hidden' name='hide'/><label>Materia <strong>"+materiaDocumento+"</strong> - "+ estadini +" ("+ nombre+")</label><br>");
                
                out.println("<button style='font-weight:bold;' type='submit' class='btn btn-default btn-sm' value='"+idplaneacion+"'"); 
                out.println(" name='" + idplaneacion + "' onclick='return descargar(this);' />Descargar</button>");
                
                ////////////////////////COMENTARIOS COMENTARIOS COMENTARIOS ////////////////////////////////////////
                out.println("<button style='margin-left: 13px;font-weight:bold;' type='submit' class='btn btn-info btn-sm' value='comentar'");
                out.println(" name='" + idplaneacion + "' onclick='return comentario(this);' />");
                out.println("Ver Comentarios</button>");
                
                out.print("<hr style='color: gray;background-color: #a3d781;height:1px;'>");
            }
    if(nombre == "empty")
        out.println("<label>Aún no has subido nada</label>");
    
    out.println("</div></div>"); //DIV DEL PANEL
    

//=========================================================================================================\\
//========================================= PROFESOR ===================================================\\
//=========================================================================================================\\
    
    if(tipos[3].equals(session.getAttribute("varTipo"))){
    
    out.println("<div class='panel panel-primary'><div class='panel-heading'>"
     + "<h3 class='panel-title'><strong>Planes de tu academia</strong></h3>"
    + "</div><div class='panel-body'>");
    
    nombre = "empty"; 
    String propietario="";
    //resultado = conexion.consulta("select nombre,idplaneacion,nocuenta,materia,estado from planeaciones where idacademia='" + academia + "' and estado = 'Autorizado';");
    resultado = conexion.consulta("select nombre,idplaneacion,nocuenta,materia,estado from planeaciones where idacademia='" + academia + "';");
    while(resultado.next())
            {
                propietario = resultado.getString("nocuenta");
                nombre = resultado.getString("nombre");
                idplaneacion = resultado.getString("idplaneacion");
                materiaDocumento = resultado.getString("materia");
                estadini = resultado.getString("estado");
                
                out.println("<br><input type='hidden' name='hide'/><label>Materia: <strong>"+materiaDocumento+"</strong>  - "+estadini+" ("+ nombre+") </label><br>");
                
                out.println("<button style='font-weight:bold;' type='submit' class='btn btn-default btn-sm' value='"+idplaneacion+"'"); 
                out.println(" name='" + idplaneacion + "' onclick='return descargar(this);' />Descargar</button>");
                
                out.println("<button style='margin-left: 13px;font-weight:bold;' type='submit' class='btn btn-info btn-sm' value='comentar'");
                out.println(" name='" + idplaneacion + "' onclick='return comentario(this);' />");
                out.println("Ver Comentarios</button><hr style='color: gray;background-color: #007aff;height:1px;'>");
            }
    
    if(nombre == "empty")
        out.println("<label>Tu academia no ha subido nada aún</label>");
    out.println("</div></div>"); //AQUI VAN LOS DIV
    }
    
//=========================================================================================================\\
//====================================== SECRE Y PERSIDENTE ===============================================\\
//=========================================================================================================\\
    
    if(tipos[4].equals(session.getAttribute("varTipo")) || tipos[0].equals(session.getAttribute("varTipo"))){
    
        out.println("<div class='panel panel-primary'><div class='panel-heading'>"
     + "<h3 class='panel-title'><strong>Planes a revisar de tu academia</strong></h3>"
    + "</div><div class='panel-body'>");
    
    nombre = "empty";
    resultado = conexion.consulta("select nombre,idplaneacion,nocuenta,materia, estado from planeaciones where idacademia='" + academia + "';");
    while(resultado.next())
            {
                nombre = resultado.getString("nombre");
                idplaneacion = resultado.getString("idplaneacion");
                materiaDocumento = resultado.getString("materia");
                estadini = resultado.getString("estado");
             
                out.println("<input style='margin-left: 12px;font-weight:bold;' type='hidden' name='hide'/><label>Materia: <strong>"+materiaDocumento+"</strong> - "+estadini+" ("+ nombre+")</label><br>");
                
                out.println("<button style='font-weight:bold;' type='submit' class='btn btn-default btn-sm' value='"+idplaneacion+"'"); 
                out.println(" name='" + idplaneacion + "' onclick='return descargar(this);' />Descargar</button>");
                
                out.println("<button style='margin-left: 12px;font-weight:bold;' onclick='return comentario(this);' type='submit' class='btn btn-info btn-sm' value='comentar'");
                out.println(" name=");
                out.print(idplaneacion);
                out.println(">Ver Comentarios</button>");
                
                ////INTERESANTE! :D
                
                out.println("<button style='margin-left: 12px;font-weight:bold;' type='submit' class='btn btn-success btn-sm' value='"+idplaneacion+"'"); 
                out.println(" name='Autorizar' onclick='return estado2(this);' />Autorizar</button>");
                
                out.println("<button style='margin-left: 12px;font-weight:bold;' type='submit' class='btn btn-warning btn-sm' value='"+idplaneacion+"'"); 
                out.println(" name='Rechazar' onclick='return estado2(this);' />Rechazar</button>");
                
                
                //out.println("<input style='margin-left: 12px;font-weight:bold;' type='submit' class='btn btn-success btn-sm' value='Autorizar' onclick='return estado(this)'");
                //out.println(" name=");
                //out.print(idplaneacion);
                //out.println(">");
                
                //out.println("<input style='margin-left: 12px;font-weight:bold;' type='submit' class='btn btn-warning btn-sm' value='Rechazar' onclick='return estado(this)'");
                //out.println(" name=");
                //out.print(idplaneacion);
                //out.println("><hr style='background-color: #007aff;height:1px;'>");
                               
                
            }
    if(nombre == "empty")
        out.println("<label>Tu academia no ha subido nada aún</label>");
    out.println("</div></div>");
                
    } //AQUI ACABA EL IF
    
    
    
 
      
        } ///AQUI TERMINA EL ELSE
%>
</form> 

<% 
if(tipos[2].equals(session.getAttribute("varTipo")) == false)
{
    %>


                                                               
<div class='panel panel-warning'><div class='panel-heading'>
      <h3 class='panel-title'><strong>Subir nueva planeación</strong></h3>
    </div><div class='panel-body'>
        <br>
    <form action="uploadFile.jsp" method="post" enctype="multipart/form-data" margin-left="422px" onsubmit="return verificarSeleccion(this)"> 
        <input type="file" name="archivo" />
        <br /> 
        <input style="font-weight:bold;" type="submit" name = 'nada' class='btn btn-info btn-sm' value="Subir archivo"/> 
    </form>
        
    </div>
</div>
        

    <!--/body> 
</html> !-->
<%
}
    %>                               
                                    
                            
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