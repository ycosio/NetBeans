<%-- 
    Document   : uploadPhoto
    Created on : 19/11/2015, 11:21:13 AM
    Author     : ycosio
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="sesion.ConexionBD"%>
<%@page import="sesion.Usuario"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.disk.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.*" %> 
<%@ page import="org.apache.commons.io.*" %> 
<%@ page import="java.io.*" %> 
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

<%

String user = (String)session.getAttribute("varNcuenta");
String academia = (String)session.getAttribute("varAcademia");
String tipo = (String)session.getAttribute("varTipo");
String progEducativo = (String)session.getAttribute("varProgEducativo");
String materia = (String)session.getAttribute("varMateria");

String ubicacionArchivo = "C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\img\\";
//String ubicacionArchivo = "C:\\Users\\Terriquez\\Downloads\\ProyectoIntegrador\\RedSocial\\web\\img\\";

DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024); 
factory.setRepository(new File(ubicacionArchivo));

ServletFileUpload upload = new ServletFileUpload(factory);

try
{
List<FileItem> partes = upload.parseRequest(request);

String nombre = "";
    for(FileItem item : partes)
    {

        File file = new File( ubicacionArchivo, user+".png");
        item.write(file);
    }
        out.write("El archivo " + nombre +" se ha subido correctamente, vuelve y recarga la pagina porfa");
    }
        catch(FileUploadException ex)
    {
        out.write("Error al subir archivo "+ex.getMessage());
    }

              response.sendRedirect("home.jsp");
%>
