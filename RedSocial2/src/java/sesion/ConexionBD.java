/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sesion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Ycosio
 */
public class ConexionBD {
    
    private static final String direccion = "jdbc:mysql://localhost:3306/sca";
    private static final String usuario = "root";
    private static final String clave = "12345";
    private Connection conexion;
    private Statement consulta;
    ResultSet resultado = null;
    private String sql;
    
    
    public ConexionBD() {
      
    }
    
    public void conecta() {
        try {
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             conexion =DriverManager.getConnection(direccion,usuario,clave);
             consulta = conexion.createStatement();
        }
        catch(Exception e) {
            System.out.println("ConexionSQL: Error al conectar: " + e.toString());
        }
    }
    
    public ResultSet consulta(String sql) {
        if(conexion == null) {
            System.out.println("ConexionSQL: No está conectado a la base de datos");
            return null;
        }
        else {
            try {
                ResultSet resultado = consulta.executeQuery(sql);
                return resultado;
            }
            catch(Exception e) {
                System.out.println("ConexionSQL: Error al consultar " + e.toString());
                return null;
            }
        }
    }
    
    public void ejecuta(String sql) {
        if(conexion == null) {
            System.out.println("ConexionSQL: No está conectado a la base de datos");
        }
        else {
            try {
                consulta.executeUpdate(sql);
            }
            catch(Exception e) {
                System.out.println("ConexionSQL: Error al ejecutar sentencia " + e.toString());
            }
        }            
    }
    
    public int cerrar() {
        try {
            if(consulta != null)
                consulta.close();
            if(conexion != null)
                conexion.close();
            return 0;
        }
        catch(Exception e) {
            System.out.println("ConexionSQL: Error al cerrar sesión " + e.toString());
            return 1;
        }
    }    
    
}
