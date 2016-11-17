<%-- 
    Document   : upload
    Created on : 5/11/2015, 05:42:00 PM
    Author     : Terriquez
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

<%

String user = (String)session.getAttribute("varNcuenta");
String academia = (String)session.getAttribute("varAcademia");
String tipo = (String)session.getAttribute("varTipo");
String progEducativo = (String)session.getAttribute("varProgEducativo");
String materia = (String)session.getAttribute("varMateria");

String ubicacionArchivo = "C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\Documentos\\";

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

        //CONEXION CON DATABASE;
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            nombre = item.getName();

            ResultSet resultado = conexion.consulta("select idplaneacion from planeaciones where idplaneacion=(select max(idplaneacion) from planeaciones);");
            int folio_plan=0;
            String folio="";
            
            while(resultado.next()){
            folio_plan=Integer.parseInt(resultado.getString("idplaneacion"));
            }
            
            folio= String.valueOf(folio_plan + 1);

            item.setFieldName(folio);

        File file = new File( ubicacionArchivo, item.getFieldName());
        //Guardado en base de datos.
        conexion.ejecuta("INSERT INTO planeaciones (nombre,idacademia,nocuenta,estado,progEducativo,materia) VALUES ('" + item.getName() + "','" + academia + "','" + user + "','Pendiente','" + progEducativo + "','" + materia + "');");
        out.println("INSERT INTO planeaciones (nombre,academia,nocuenta,autorizado) VALUES ('" + item.getName() + "','" + academia + "','" + user + "', 'true');");

        item.write(file);
    }
        out.write("El archivo " + nombre +" se ha subido correctamente, vuelve y recarga la pagina porfa");
    }
        catch(FileUploadException ex)
    {
        out.write("Error al subir archivo "+ex.getMessage());
    }
%>


<script>
              alert("Vamos a regresar a la pagina de planeaciones, oki?" );
</script> 

<%
              response.sendRedirect("planeaciones.jsp");
%>