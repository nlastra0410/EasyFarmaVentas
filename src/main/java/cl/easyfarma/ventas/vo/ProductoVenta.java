/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.vo;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author nlast
 */
public class ProductoVenta {
    private String documento;
    private int numeroDocumento;
    private String producto;
    private int cantidad;
    private BigDecimal precio;
    private BigDecimal precioEasyPlus;
    private int descuentoAplicado;
    private String rutCliente;
    private Date fecha;
    private Time hora;
    private String sku;
    private String correo;
    private String usuario;
    private int totalfinal;
    private int totalfinaleasy;

    public int getTotalfinal() {
        return totalfinal;
    }

    public void setTotalfinal(int totalfinal) {
        this.totalfinal = totalfinal;
    }

    public int getTotalfinaleasy() {
        return totalfinaleasy;
    }

    public void setTotalfinaleasy(int totalfinaleasy) {
        this.totalfinaleasy = totalfinaleasy;
    }
    
    

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    
    
    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public int getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(int numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public BigDecimal getPrecioEasyPlus() {
        return precioEasyPlus;
    }

    public void setPrecioEasyPlus(BigDecimal precioEasyPlus) {
        this.precioEasyPlus = precioEasyPlus;
    }

    public int getDescuentoAplicado() {
        return descuentoAplicado;
    }

    public void setDescuentoAplicado(int descuentoAplicado) {
        this.descuentoAplicado = descuentoAplicado;
    }

    public String getRutCliente() {
        return rutCliente;
    }

    public void setRutCliente(String rutCliente) {
        this.rutCliente = rutCliente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public String getSku() {
        return sku;
    }

    // Constructor, getters y setters
    public void setSku(String sku) {
        this.sku = sku;
    }

    @Override
    public String toString() {
        // Aquí puedes personalizar cómo deseas que se represente un objeto ProductoVenta en forma de texto
        return documento + "|" + numeroDocumento + "|" + producto + "|" + cantidad + "|" + precio + "|" + precioEasyPlus + "|" + descuentoAplicado + "|" + rutCliente + "|" + fecha + "|" + hora + "|" + sku;
    }
}
