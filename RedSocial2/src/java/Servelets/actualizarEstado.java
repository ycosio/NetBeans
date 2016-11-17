/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sesion.ConexionBD;

/**
 *
 * @author Terriquez
 */
@WebServlet(name = "actualizarEstado", urlPatterns = {"/actualizarEstado"})
public class actualizarEstado extends HttpServlet {

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
        
        String valor = "nada";
        String bandera = "10";
        if (valor.equals("nada"))
        {
            valor = request.getParameter("valor2"); //Pendiente
            bandera = "2";
        }
        if (valor == null)
        {
            valor =request.getParameter("valor1"); //Autorizar
            bandera = "1";
        }
        
        ConexionBD conexion = new ConexionBD();
        conexion.conecta();
        if (bandera.equals("1")) 
            conexion.ejecuta("UPDATE planeaciones SET estado = 'Autorizado' where idplaneacion ='"+ valor+ "';");
        else if (bandera.equals("2"))
            conexion.ejecuta("UPDATE planeaciones SET estado = 'Pendiente' where idplaneacion ='"+ valor+ "';");
        
        
        response.sendRedirect("planeaciones.jsp");
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
