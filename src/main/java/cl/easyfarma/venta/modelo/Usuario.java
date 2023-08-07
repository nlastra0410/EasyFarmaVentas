
package cl.easyfarma.venta.modelo;


public class Usuario {
    
    private int id;
    private String usuario;
    private String contraseña;
    private int nivel;

    public Usuario(int id, String usuario, String contraseña, int nivel) {
        this.id = id;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.nivel = nivel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    
    
    
    
    
    
}
