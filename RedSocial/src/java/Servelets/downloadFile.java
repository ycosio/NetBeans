/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servelets;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sesion.ConexionBD;

/**
 *
 * @author Terriquez
 */
@WebServlet(name = "downloadFile", urlPatterns = {"/downloadFile"})
public class downloadFile extends HttpServlet {

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
      
  
  String filename3 =request.getParameter("valor");
  ConexionBD conexion = new ConexionBD();
  conexion.conecta();
  String sql = "select nombre, nocuenta from planeaciones where idplaneacion='" + filename3 + "';";
  ResultSet resultado = conexion.consulta(sql);
  String nombrefinal2 = "";
        try {
            while(resultado.next())
            {
                nombrefinal2 = resultado.getString("nombre");
            }     } catch (SQLException ex) {
            Logger.getLogger(downloadFile.class.getName()).log(Level.SEVERE, null, ex);
        }
  
  
  String filepath = "C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\Documentos\\"; 
  //String filepath = "C:\\Users\\Terriquez\\Downloads\\ProyectoIntegrador\\RedSocial\\web\\Documentos\\";

  try
{
    		
    java.io.FileInputStream archivo = new java.io.FileInputStream(filepath+filename3); 
    int longitud = archivo.available();
    byte[] datos = new byte[longitud];
    archivo.read(datos);
    archivo.close();
    
    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition","attachment;filename="+nombrefinal2);
    
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(datos);
    ouputStream.flush();
    ouputStream.close();
    	
}
catch(Exception e)
{ 
    e.printStackTrace();
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
