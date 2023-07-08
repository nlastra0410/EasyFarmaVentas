
package cl.easyfarma.ventas.vo;


public class Productos {
    
    
    
    private int codigoProducto;
    private String nombre;
    private int precio;
    private String imagen;
    
    //Agregamos el constructor siguiendo los mismos pasos del getter y setter
    
    public Productos(int codigoProducto, String nombre, int precio, String imagen) {
        this.codigoProducto = codigoProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
    }
    
    //Agregamos un contructor vacio que utilice los metodos get y set para insertar los datos
    public Productos(){
        
    }
    
    //Agregamos los metodos getter y setter seleccionanlo los private, clic derecho, insertar código...

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
    
    
    
}
