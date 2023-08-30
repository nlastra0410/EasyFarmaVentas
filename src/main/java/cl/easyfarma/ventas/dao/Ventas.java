/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.dao;

import cl.easyfarma.ventas.conexion.conexion;
import cl.easyfarma.ventas.vo.ProductoVenta;
import cl.easyfarma.ventas.vo.clienteVO;
import com.google.gson.JsonObject;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nlast
 */

/*
                

*/
public class Ventas {
   public String guardarVenta(String rutPlus, 
                           String nombre, 
                           Integer p1, 
                           Integer p2, 
                           Integer cantidad, 
                           Integer totalFinal, 
                           Integer totalFinalEasy, 
                           Integer descuento, 
                           String correo, 
                           String tipoDoc, 
                           String numeroDoc,
                           String proveedor,
                           String usuario, 
                           String sku, 
                           int folio) {
    conexion con = null;
    Connection cn = null;
    String respuesta = "";
    String sql = "{ CALL guardar_venta(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
    
    try {
        con = new conexion();
        cn = con.conectar();
      
        // Preparar la llamada al procedimiento almacenado
        CallableStatement statement = cn.prepareCall(sql);
        statement.setString(1, tipoDoc); 
        statement.setString(2, String.valueOf(folio)); // Asignar el número de documento
        statement.setString(3, nombre);
        statement.setString(4, proveedor);
        statement.setInt(5, cantidad);
        statement.setDouble(6, p1);
        statement.setDouble(7, p2);
        statement.setInt(8, descuento);
        statement.setString(9, rutPlus);
        statement.setString(10, usuario);
        statement.setString(11, sku);
        statement.setString(12, correo);
        statement.setInt(13, totalFinal);
        statement.setInt(14, totalFinalEasy);
        
        // Agregar 2 parámetros para OUT
        statement.registerOutParameter(15, Types.INTEGER); // Parámetro OUT para el número de documento
        statement.registerOutParameter(16, Types.VARCHAR); // Parámetro OUT para el tipo de documento

        // Ejecutar el procedimiento almacenado
        statement.executeUpdate();

        // Obtener los valores de los parámetros OUT
        int numerodocumento = statement.getInt(15);
        String tipodocumento = statement.getString(16);

        respuesta = "true-"+numerodocumento+"-"+tipodocumento+"-GuardadoOK";

    } catch (SQLException ex) {
        System.out.println("Error SQL: " + ex.getMessage());
        respuesta = "Error SQL: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error general: " + ex.getMessage());
        respuesta = "Error general: " + ex.getMessage();
    } finally {
        try {
            if (cn != null) {
                cn.close();
            }
        } catch (Exception ex) {
            // Manejar la excepción de cierre de conexión si es necesario
        }
    }
    return respuesta;
}

public List<ProductoVenta> obtenerProductosPorNumeroDocumento(int numeroDocumento) throws Exception {
    List<ProductoVenta> productos = new ArrayList<>();
    
    conexion con = null;
    Connection cn = null;
    ResultSet resultSet = null;
    String respuesta = null;
    PreparedStatement statement = null;
    try {
        con = new conexion();
        cn = con.conectar();

        String query = "SELECT \n" +
                        "    documento, \n" +
                        "    numerodocumento, \n" +
                        "    producto, \n" +
                        "    SUM(cantidad) AS cantidad, \n" +
                        "    precio, \n" +
                        "    precioeasyplus, \n" +
                        "    descuentoaplicado, \n" +
                        "    rutcliente, \n" +
                        "    fecha, \n" +
                        "    hora, \n" +
                        "    sku,"
                        + "  correo,"
                        + "  usuario, totalfinal, totalfinaleasy \n" +
                        "FROM easyvent_easyfarmaventas.productoventa \n" +
                        "WHERE numerodocumento = ?\n" +  // Agregar el marcador de posición
                        "GROUP BY \n" +
                        "    documento, \n" +
                        "    numerodocumento, \n" +
                        "    producto, \n" +
                        "    rutcliente \n" +
                        "LIMIT 0, 1000;";
                        
        statement = cn.prepareStatement(query); // Usar PreparedStatement
        statement.setInt(1, numeroDocumento);

        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            ProductoVenta producto = new ProductoVenta();
            producto.setDocumento(resultSet.getString("documento"));
            producto.setNumeroDocumento(resultSet.getInt("numerodocumento"));
            producto.setProducto(resultSet.getString("producto"));
            producto.setCantidad(resultSet.getInt("cantidad"));
            producto.setPrecio(resultSet.getBigDecimal("precio"));
            producto.setPrecioEasyPlus(resultSet.getBigDecimal("precioeasyplus"));
            producto.setDescuentoAplicado(resultSet.getInt("descuentoaplicado"));
            producto.setRutCliente(resultSet.getString("rutcliente"));
            producto.setFecha(resultSet.getDate("fecha"));
            producto.setHora(resultSet.getTime("hora"));
            producto.setSku(resultSet.getString("sku"));
            producto.setCorreo(resultSet.getString("correo"));
            producto.setUsuario(resultSet.getString("usuario"));
            producto.setTotalfinal(resultSet.getInt("totalfinal"));
            producto.setTotalfinaleasy(resultSet.getInt("totalfinaleasy"));

            productos.add(producto); // Agregar el objeto producto a la lista
        }
    } catch (SQLException ex) {
        System.out.println("Error SQL: " + ex.getMessage());
        respuesta = "Error SQL: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error general: " + ex.getMessage());
        respuesta = "Error general: " + ex.getMessage();
    } finally {
    try {
        if (resultSet != null) {
            resultSet.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (cn != null) {
            cn.close();
        }
    } catch (SQLException ex) {
        System.out.println("Error al cerrar conexiones: " + ex.getMessage());
        respuesta = "Error al cerrar conexiones: " + ex.getMessage();
    }
}

    return productos;
}

public ProductoVenta obtenerUsuarioVendedorPorNumeroDocumento(int numeroDocumento) throws Exception {
    ProductoVenta productos = null;
    
    conexion con = null;
    Connection cn = null;
    ResultSet resultSet = null;
    String respuesta = null;
    PreparedStatement statement = null;
    try {
        con = new conexion();
        cn = con.conectar();

        String query = "SELECT USUARIO, CORREO FROM easyvent_easyfarmaventas.PRODUCTOVENTA WHERE NUMERODOCUMENTO = ? LIMIT 1 "; 
                        
        statement = cn.prepareStatement(query); // Usar PreparedStatement
        statement.setInt(1, numeroDocumento);

        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            productos = new ProductoVenta();
            productos.setCorreo(resultSet.getString("correo"));
            productos.setUsuario(resultSet.getString("usuario"));

            //productos.add(producto); // Agregar el objeto producto a la lista
        }
    } catch (SQLException ex) {
        System.out.println("Error SQL: " + ex.getMessage());
        respuesta = "Error SQL: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error general: " + ex.getMessage());
        respuesta = "Error general: " + ex.getMessage();
    } finally {
    try {
        if (resultSet != null) {
            resultSet.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (cn != null) {
            cn.close();
        }
    } catch (SQLException ex) {
        System.out.println("Error al cerrar conexiones: " + ex.getMessage());
        respuesta = "Error al cerrar conexiones: " + ex.getMessage();
    }
}

    return productos;
}

public clienteVO obtenerClientePorNumeroDocumento(Integer numeroDoc) throws Exception {
    clienteVO Cliente = null;
    
    conexion con = null;
    Connection cn = null;
    ResultSet resultSet = null;
    String respuesta = null;
    CallableStatement cstmt = null;
    try {
        con = new conexion();
        cn = con.conectar();

        String sql = "SELECT pv.rutcliente AS rut, \n" +
                    "       CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo, \n" +
                    "       c.direccion, \n" +
                    "       c.email, \n" +
                    "       c.plus, \n" +
                    "       c.telefono\n" +
                    "FROM easyvent_easyfarmaventas.productoventa pv\n" +
                    "INNER JOIN easyvent_easyfarmaventas.cliente c ON pv.rutcliente = c.rut\n" +
                    "WHERE pv.numerodocumento = ? AND c.clienteactivo = 'Si'\n" +
                    "LIMIT 1 ; ";
        cstmt = cn.prepareCall(sql); // Usar la variable 'sql' aquí
        cstmt.setInt(1, numeroDoc);

        resultSet = cstmt.executeQuery();

        if (resultSet.next()) {
            // Continuar con el proceso de obtener los datos del cliente
            Cliente = new clienteVO();
            Cliente.setRut(resultSet.getString("rut"));
            Cliente.setNombre(resultSet.getString("nombre_completo"));
            Cliente.setDireccion(resultSet.getString("direccion"));
            Cliente.setEmail(resultSet.getString("email"));
            Cliente.setPlus(resultSet.getString("plus"));
            Cliente.setTelefono(resultSet.getString("telefono"));
        }

    } catch (SQLException ex) {
        System.out.println("Error SQL: " + ex.getMessage());
        respuesta = "Error SQL: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error general: " + ex.getMessage());
        respuesta = "Error general: " + ex.getMessage();
    } finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (cstmt != null) {
                cstmt.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar conexiones: " + ex.getMessage());
            respuesta = "Error al cerrar conexiones: " + ex.getMessage();
        }
    }

    return Cliente;
}






public int obtenerFolio(Connection cn) throws SQLException {
    String funcSQL = "{ ? = CALL generarFolioVenta() }";
    CallableStatement stmt = cn.prepareCall(funcSQL);
    stmt.registerOutParameter(1, Types.INTEGER);
    stmt.execute();
    return stmt.getInt(1);
}

}
