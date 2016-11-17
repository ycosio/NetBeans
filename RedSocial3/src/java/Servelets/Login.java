/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
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
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            
            ConexionBD conexion = new ConexionBD();
            conexion.conecta();

            int b = 0;//variable booleana
            String us = null; //para tomar el usuario de la base de datos
            String nC = null;
            String pa = null; // para tomar el pass de la base de datos
            String tipo = null;
            String idAcademia = null;
            String progEducativo = null;
            String materia = null;

            //recogemos lo que viene del formulatio
            String nCuenta = request.getParameter("nCuenta");
            String passs = request.getParameter("pass");
            String sql = "select no_cuenta,nombre,contrasena,tipo,idacademia,progEducativo,materia from profesor where no_cuenta='" + nCuenta + "' ";
//la consulta SQL
            ResultSet resultado = conexion.consulta(sql);
            try {

                while (resultado.next())//desplegamos los resultados
                {
                    us = resultado.getString("nombre");
                    nC = resultado.getString("no_cuenta");
                    pa = resultado.getString("contrasena");
                    tipo = resultado.getString("tipo");
                    idAcademia = resultado.getString("idacademia");
                    progEducativo = resultado.getString("progEducativo");
                    materia = resultado.getString("materia");
                    if (nC.equals(nCuenta) && pa.equals(passs)) {
                        b = 1;//si se cumple es 1
                    } else {
                        b = 0; //sino es 0
                    }

                }

                //luego comparamos si es uno es usuario existente y bien validado sino error
                if (b == 1) {
                    //String usuario = new String(us);
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("varUsuario", us);
                    sesion.setAttribute("varTipo", tipo);
                    sesion.setAttribute("varAcademia", idAcademia);
                    sesion.setAttribute("varNcuenta", nCuenta);
                    sesion.setAttribute("varProgEducativo", progEducativo);
                    sesion.setAttribute("varMateria", materia);
                    out.println("<script>alert('Usuario Identificado Correctamente')</script>");
                    response.sendRedirect("home.jsp");
                } else {

                    out.println("<script>alert('Datos Erroneos  ')</script>");
                    response.sendRedirect("index.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }


            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
             /*HttpSession session = request.getSession();
            
            String nombreS = request.getParameter("nombre");
            String pass = request.getParameter("pass");
            String sql = "INSERT INTO profesor VALUES ('20107777', 'Osvaldo', '12345', '0', 'Secretario', '1', 1)";

            ConexionBD conexion=new ConexionBD();
            conexion.conecta();
            
            ResultSet resultado = conexion.consulta(sql);
            conexion.consulta(sql);
            try {
                String nombre = "";
                String tipo = "";
                    
                
                while(resultado.next())
                {
                    nombre = resultado.getString("nombre");
                    tipo = resultado.getString("tipo");
                }
                
                if(nombre!=null)
                {
                    /*
                    while(resultado.next())
                    {
                    nombre = resultado.getString("nombre");
                    tipo = resultado.getString("tipo");
                    }
                    
                    session.setAttribute("param-logeo", 1);
                    session.setAttribute("param-nombre", nombre);
                    session.setAttribute("param-tipo", tipo);
 
                    response.sendRedirect("presidente.jsp");
                }
                else
                {
                    session.setAttribute("param-logeo", 0);
                    response.sendRedirect("index.jsp");
                }
                
            } catch (Exception e) {
                System.out.println("Error: " + e.toString());
            }
            conexion.cerrar();*/
            
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
