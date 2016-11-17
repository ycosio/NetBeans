/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sesion;

/**
 *
 * @author Ycosio
 */
public class Usuario {
    
    private String nombre;
    private String tipo;
    
    public Usuario() {
        nombre = null;
        tipo = null;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
}
