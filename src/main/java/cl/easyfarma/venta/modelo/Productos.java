
package cl.easyfarma.venta.modelo;


public class Productos {
    
    
    
    private int codigoProducto;
    private String nombre;
    private int precio;
    private String imagen;
    private String Descripcion;
    private String Cantidad;
    private String Stock;
    private String PrecioEasyFarmaPlus;
    
    //Agregamos el constructor siguiendo los mismos pasos del getter y setter

    public Productos(int codigoProducto, String nombre, int precio, String imagen, String Descripcion, String Cantidad, String Stock, String PrecioEasyFarmaPlus) {
        this.codigoProducto = codigoProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
        this.Descripcion = Descripcion;
        this.Cantidad = Cantidad;
        this.Stock = Stock;
        this.PrecioEasyFarmaPlus = PrecioEasyFarmaPlus;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getStock() {
        return Stock;
    }

    public void setStock(String Stock) {
        this.Stock = Stock;
    }

    public String getPrecioEasyFarmaPlus() {
        return PrecioEasyFarmaPlus;
    }

    public void setPrecioEasyFarmaPlus(String PrecioEasyFarmaPlus) {
        this.PrecioEasyFarmaPlus = PrecioEasyFarmaPlus;
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
