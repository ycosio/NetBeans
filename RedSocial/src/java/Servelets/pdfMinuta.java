/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelets;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sesion.ConexionBD;

/**
 *
 * @author ycosio
 */
@WebServlet(name = "pdfMinuta", urlPatterns = {"/pdfMinuta"})
public class pdfMinuta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
              HttpSession sesion = request.getSession();
            String user = (String) sesion.getAttribute("varUsuario");
            String tipo = (String) sesion.getAttribute("varTipo");
            String minuta = (String) sesion.getAttribute("varReunion");
            String reunion = (String) sesion.getAttribute("varReunion");
            String academia = (String) sesion.getAttribute("varAcademia");

            String fecha = (String) sesion.getAttribute("varFecha");
            String semestre = (String) sesion.getAttribute("varSemestre");
            String asunto = (String) sesion.getAttribute("varTitulo");
            String lugar = (String) sesion.getAttribute("varLugar");
            String presidente = (String) sesion.getAttribute("varPresidente");
            
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            ResultSet resultado=conexion.consulta("select  nombre from academias where idacademia='" + academia + "';");
            
            while(resultado.next())
            {
                academia=resultado.getString("nombre");
            }
            
            resultado=conexion.consulta("select  acuerdos,ordendeldia,detalles,fechaSiguiente from minuta where idminuta='" + reunion + "';");
            String orden="";
            String acuerdos="";
            String detalles="";
            String fechaS="";
            
            while(resultado.next())
            {
                acuerdos+=resultado.getString("acuerdos");
                orden+=resultado.getString("ordendeldia");
                detalles+=resultado.getString("detalles");
                fechaS+=resultado.getString("fechaSiguiente");
            }
            
            
            
            String encabezado="Universidad de Colima" + "\n" + "Facultad de Telematica" + "\n"+ "\n" + "MINUTA DE LA REUNION " + academia + "\n" + "\n" ;
            //out.println("<script>alert('" + academia +  "')</script>");
            
            /*Fuente utilizada para el encabezado*/
            Font fuente = new Font(Font.getFamily("ARIAL"), 12, Font.BOLD);
            /*Almacenaremos la imagen que ira en la parte superior y la alineamos a la izquierda*/
            Image imagen = Image.getInstance(("C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\img\\UDC.jpg"));
            //Image imagen = Image.getInstance(("C:\\Users\\Terriquez\\Downloads\\ProyectoIntegrador\\RedSocial\\web\\img\\UDC.jpg"));
            imagen.setAlignment(Image.ALIGN_CENTER|Image.TEXTWRAP);
            java.util.Date data = new java.util.Date();
            /*Empesaremos a estructurar el contenido*/
            try {
                /*Pasaremos nuestras cadenas a elementos de Itext*/
                /*Definimos una frase que sera el string encabezado y le aplicamos la fuente*/
                Paragraph linea = new Paragraph(encabezado, fuente);
                linea.setAlignment(Element.ALIGN_CENTER);
               
                /*Ya que se tiene todos los elementos se agregan al documento, para ello
                 * definimos un documento e indicamos el tamaño*/
                Document documento = new Document(PageSize.LETTER);
                /*Definimos el nombre del archivo con extension pdf*/
                String ruta = "C:/Users/ycosio/Documents/NetBeansProjects/RedSocial/web/Documentos/";
                //String ruta = "C:/Users/Terriquez/Downloads/ProyectoIntegrador/RedSocial/web/Documentos/";
                FileOutputStream archivo = new FileOutputStream(ruta + "Minuta-Reunion" + minuta + ".pdf");
                /*A traves del siguiente metodo (getInstance) y un flujo de salida del paquet .io
                 * asociamos el documento de Itext con el archivo de java */
                PdfWriter.getInstance(documento, archivo);
                
                //------------------------------------------------Tabla reunion
                PdfPTable tabla= new PdfPTable(3);
                tabla.setWidthPercentage(100);
                
                PdfPCell celda1 = new PdfPCell(new Paragraph("Semestre",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell celda2 = new PdfPCell(new Paragraph("Fecha",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda2.setBackgroundColor(BaseColor.GRAY);
                celda2.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell celda3 = new PdfPCell(new Paragraph("No. Reunion",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda3.setBackgroundColor(BaseColor.GRAY);
                celda3.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                float[] columnWidths = new float[] {20f, 60f, 20f};
                tabla.setWidths(columnWidths);
                
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                
                tabla.addCell(semestre);
                tabla.addCell(data.toString());
                tabla.addCell(reunion);
                
                /*Abrimos el documento y agregamos los elementos en el orden que deben de aparecer*/
                documento.open();
                documento.add(imagen);
                documento.add(linea);
                documento.add(tabla);
                
                //------------------------------------------------Tabla Asunto
                tabla= new PdfPTable(2);
                tabla.setWidthPercentage(100);
                
                celda1 = new PdfPCell(new Paragraph("Asunto:",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
              
                celda2 = new PdfPCell(new Paragraph(asunto,FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
            
                columnWidths = new float[] {20f, 80f};
                tabla.setWidths(columnWidths);
                
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                
                celda1 = new PdfPCell(new Paragraph("Lugar:",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
              
                celda2 = new PdfPCell(new Paragraph(lugar,FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
            
                columnWidths = new float[] {20f, 80f};
                tabla.setWidths(columnWidths);
                
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                
                celda1 = new PdfPCell(new Paragraph("Secretario:",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
              
                celda2 = new PdfPCell(new Paragraph(user,FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
            
                columnWidths = new float[] {20f, 80f};
                tabla.setWidths(columnWidths);
                
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                
                celda1 = new PdfPCell(new Paragraph("Presidene:",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
              
                celda2 = new PdfPCell(new Paragraph(presidente,FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
            
                columnWidths = new float[] {20f, 80f};
                tabla.setWidths(columnWidths);
                
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                
                documento.add(tabla);
                
                //------------------------------------------------Tabla Orden del dia
                tabla= new PdfPTable(1);
                tabla.setWidthPercentage(100);
                
                celda1 = new PdfPCell(new Paragraph("Orden del dia",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                tabla.addCell(celda1);
                tabla.addCell(orden);
                
                celda1 = new PdfPCell(new Paragraph("Detalles",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                tabla.addCell(celda1);
                tabla.addCell(detalles);
                
                celda1 = new PdfPCell(new Paragraph("Acuerdos",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                tabla.addCell(celda1);
                tabla.addCell(acuerdos);
                
                documento.add(tabla);
                
                //------------------------------------------------Tabla Fecha Siguiente
                tabla= new PdfPTable(2);
                tabla.setWidthPercentage(100);
                
                celda1 = new PdfPCell(new Paragraph("Fecha de la Siguiente Reunion:",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
              
                columnWidths = new float[] {40f, 60f};
                tabla.setWidths(columnWidths);
                
                tabla.addCell(celda1);
                tabla.addCell(fechaS);
                
                documento.add(tabla);
               
                //------------------------------------------------Tabla Fecha Participantes
                tabla= new PdfPTable(1);
                tabla.setWidthPercentage(100);
                
                celda1 = new PdfPCell(new Paragraph("Participantes",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.GRAY);
                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                tabla.addCell(celda1);
                
                documento.add(tabla);
                
                tabla= new PdfPTable(3);
                tabla.setWidthPercentage(100);
                
                celda1 = new PdfPCell(new Paragraph("Nombre del profesor",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda1.setBackgroundColor(BaseColor.LIGHT_GRAY);
                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                celda2 = new PdfPCell(new Paragraph("Asistencia",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda2.setBackgroundColor(BaseColor.LIGHT_GRAY);
                celda2.setHorizontalAlignment(Element.ALIGN_CENTER);
                
                celda3 = new PdfPCell(new Paragraph("Firma",FontFactory.getFont("arial",10,Font.BOLD,BaseColor.BLACK)));
                celda3.setBackgroundColor(BaseColor.LIGHT_GRAY);
                celda3.setHorizontalAlignment(Element.ALIGN_CENTER);
              
                columnWidths = new float[] {60f, 15f, 25f};
                tabla.setWidths(columnWidths);
                
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                
            String[] asistencia = new String[100];
            String[] convocados = new String[100];
            String nombre;
            int j=0;
            int i =0;    
            
            resultado=conexion.consulta("select  nCuenta_convocado,asistencia from lista where idlista='" + reunion + "';");
            while(resultado.next())
            {
                convocados[i]=resultado.getString("nCuenta_convocado");
                asistencia[i]=resultado.getString("asistencia");
                i++;
                j++;
            }
            
            resultado=conexion.consulta("select nombre from profesor where no_cuenta='" + convocados[0] + "';");
            
            i=0;
            while(resultado.next())
            {
                nombre=resultado.getString("nombre");
                tabla.addCell(nombre);
                tabla.addCell(asistencia[i]);
                tabla.addCell("");
                i++;
                
                if(i<j)
                    resultado=conexion.consulta("select nombre from profesor where no_cuenta='" + convocados[i] + "';");
            }
            
                    
                documento.add(tabla);
                /*Cerramos el documento*/
                documento.close();
                
                response.sendRedirect("reuniones.jsp");
            } catch (DocumentException ex) {

            }
            
        } catch (SQLException ex) {
            Logger.getLogger(pdfMinuta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MalformedURLException ex) {
            Logger.getLogger(pdfMinuta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadElementException ex) {
            Logger.getLogger(pdfMinuta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
