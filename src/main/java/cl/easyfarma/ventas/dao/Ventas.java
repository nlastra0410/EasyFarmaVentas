/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.dao;

import cl.easyfarma.ventas.conexion.conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

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
                           String sku) {
    conexion con = null;
    Connection cn = null;
    String respuesta = "";
    String sql = "{ CALL guardar_venta(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
    
    try {
        con = new conexion();
        cn = con.conectar();
      
        // Preparar la llamada al procedimiento almacenado
        CallableStatement statement = cn.prepareCall(sql);
        statement.setString(1, tipoDoc); 
        statement.setString(2, nombre);
        statement.setString(3, proveedor);
        statement.setInt(4, cantidad);
        statement.setDouble(5, p1);
        statement.setDouble(6, p2);
        statement.setInt(7, descuento);
        statement.setString(8, rutPlus);
        statement.setString(9, usuario);
        statement.setString(10, sku);
        statement.setString(11, correo);

        // Ejecutar el procedimiento almacenado
        statement.executeUpdate();
        System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX INICIO");
                System.out.println("TRAE LO SIGUIENTE: ");
                System.out.println("rutPlus: "+rutPlus);
                System.out.println("nombre: "+nombre);
                System.out.println("p1: "+p1);
                System.out.println("p2 "+p2);
                System.out.println("cantidad: "+cantidad);
                System.out.println("totalFinal: "+totalFinal);
                System.out.println("totalFinalEasy: "+totalFinalEasy);
                System.out.println("descuento: "+descuento);
                System.out.println("correo, tipoDoc y numeroDoc: "+correo+" "+tipoDoc+" "+numeroDoc);
                System.out.println("proveedor: "+proveedor);
                System.out.println("usuario: "+usuario);
                System.out.println("sku: "+sku);
                System.out.println("FIN TRAE LO SIGUIENTE: ");
                System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        respuesta = "Venta guardada con éxito";

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
private int obtenerFolio(Connection cn) throws SQLException {
    String funcSQL = "{ ? = CALL generarFolio() }";
    CallableStatement stmt = cn.prepareCall(funcSQL);
    stmt.registerOutParameter(1, Types.INTEGER);
    stmt.execute();
    return stmt.getInt(1);
}

}
