/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sesion.ConexionBD;

/**
 *
 * @author Ycosio
 */
@WebServlet(name = "redireccionMinuta", urlPatterns = {"/redireccionMinuta"})
public class redireccionMinuta extends HttpServlet {

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
        try (ServletOutputStream out = response.getOutputStream ()) {
            /* TODO output your page here. You may use following sample code. */
            String nombre=request.getParameter("valor");
            if(nombre!=null)
            descargarPDF(request,response, nombre);
            else
            {
             HttpSession sesion = request.getSession();
            String academia = (String)sesion.getAttribute("varAcademia");
            String parametro;
            String id;
            int i =0;    
            
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();
            ResultSet resultado=conexion.consulta("select idreunion,semestre,fecha,titulo,lugar from reunion where idacademia='" + academia + "';");
            
             
            
            try {
                while(resultado.next())
                {
                    i++;
                    parametro = i+"";
                    id=request.getParameter(parametro);
                    
                    if(id!=null)
                    {
                        sesion.setAttribute("varReunion", id);
                        sesion.setAttribute("varSemestre", resultado.getString("semestre"));
                        sesion.setAttribute("varFecha", resultado.getString("fecha"));
                        sesion.setAttribute("varTitulo", resultado.getString("titulo"));
                        sesion.setAttribute("varLugar", resultado.getString("lugar"));
                        
                        
                        resultado = conexion.consulta("select nombre from profesor where idacademia='" + academia + "' && tipo='Presidente';");
                        try {
                            while (resultado.next()) {
                                sesion.setAttribute("varPresidente", resultado.getString("nombre"));
                                response.sendRedirect("minuta.jsp");
                            }
                        } catch (SQLException ex) {
                            Logger.getLogger(redireccionMinuta.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(redireccionMinuta.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
        }
    }

     public void descargarPDF(HttpServletRequest request, HttpServletResponse response, String nombre)
    {
        String filepath = "C:\\Users\\ycosio\\Documents\\NetBeansProjects\\RedSocial\\web\\Documentos\\" + nombre;
        //String filepath = "C:\\Users\\Terriquez\\Downloads\\ProyectoIntegrador\\RedSocial\\web\\Documentos\\" + nombre;
                try {

                    java.io.FileInputStream archivo = new java.io.FileInputStream(filepath);
                    int longitud = archivo.available();
                    byte[] datos = new byte[longitud];
                    archivo.read(datos);
                    archivo.close();

                    response.setContentType("application/octet-stream");
                    response.setHeader("Content-Disposition", "attachment;filename=" + nombre);

                    ServletOutputStream ouputStream = response.getOutputStream();
                    ouputStream.write(datos);
                    ouputStream.flush();
                    ouputStream.close();

                } catch (Exception e) {
                    System.out.print(e);
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
