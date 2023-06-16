/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarmaventas.dao;

import cl.easyfarmaventas.conexion.conexion;
import cl.easyfarmaventas.vo.proveedorVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nlast
 */
public class proveedorDAO {
   public String Agregar_Proveedor(String rut,
                                 String nombres,
                                 String correo,
                                 String telefono,
                                 String nacionalidad,
                                 String direccion) {
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "INSERT INTO easyvent_easyfarmaventas.proveedor\n" +
                        "            (rut,\n" +
                        "             nombres,\n" +
                        "             correo,\n" +
                        "             telefono,\n" +
                        "             nacionalidad,\n" +
                        "             direccion)\n" +
                        "VALUES (?,?,?,?,?,?); ";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        // Resto del código para guardar el producto en la base de datos
        try {
            cn = con.conectar();
            st = cn.createStatement();
            ps = cn.prepareStatement(sql);
            PreparedStatement stmt = cn.prepareStatement(sql);
            System.out.println("rut " + rut);
            System.out.println("nombres " + nombres);
            System.out.println("correo " + correo);
            System.out.println("telefono " + telefono);
            System.out.println("nacionalidad " + nacionalidad);
            System.out.println("direccion " + direccion);
            stmt.setString(1, rut);
            stmt.setString(2, nombres);
            stmt.setString(3, correo);
            stmt.setString(4, telefono);
            stmt.setString(5, nacionalidad);
            stmt.setString(6, direccion);
            // Ejecuta la sentencia SQL
            stmt.executeUpdate();

            // Cierra la conexión con la base de datos
            stmt.close();
            cn.close();
            
            respuesta = "Proveedores Guardados con Exito ";

        } catch (SQLException ex) {
            System.out.println("A " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } catch (Exception ex) {
            System.out.println("B " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } finally {
            try {
                ps.close();
                cn.close();
            } catch (Exception ex) {
            }
        }
        return respuesta;
    }
   public String Editar_Proveedor(String rut,
                                 String nombres,
                                 String correo,
                                 String telefono,
                                 String nacionalidad,
                                 String direccion) {
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        
        String sql = "UPDATE easyvent_easyfarmaventas.proveedor\n" +
                        "SET rut = ?,\n" +
                        "  nombres = ?,\n" +
                        "  correo = ?,\n" +
                        "  telefono = ?,\n" +
                        "  nacionalidad = ?,\n" +
                        "  direccion = ?,\n" +
                        "WHERE rut = ?;";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        // Resto del código para guardar el producto en la base de datos
                 
        try {
            cn = con.conectar();
            
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, rut);
            statement.setString(2, nombres);
            statement.setString(3, correo);
            statement.setString(4, telefono);
            statement.setString(5, nacionalidad);
            statement.setString(6, direccion);
            statement.setString(7, rut);
            
            statement.executeUpdate();
            respuesta = "Proveedor actualizado correctamente.";
            // Ejecuta la sentencia SQL
        

            // Cierra la conexión con la base de datos
            statement.close();
            cn.close();
        } catch (SQLException ex) {
            System.out.println("A " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } catch (Exception ex) {
            System.out.println("B " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } finally {
            try {
                ps.close();
                cn.close();
            } catch (Exception ex) {
            }
        }
        return respuesta;
    }
   
    public String Editar_Proveedor(String rut) {
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        
        String sql = "UPDATE easyvent_easyfarmaventas.proveedor\n" +
                        "SET activo = ? WHERE rut = ?;";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        // Resto del código para guardar el producto en la base de datos
                 
        try {
            cn = con.conectar();
            
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, "No");
            statement.setString(2, rut);
            
            statement.executeUpdate();
            respuesta = "Proveedor actualizado correctamente.";
            // Ejecuta la sentencia SQL
            // Cierra la conexión con la base de datos
            statement.close();
            cn.close();
        } catch (SQLException ex) {
            System.out.println("A " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } catch (Exception ex) {
            System.out.println("B " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } finally {
            try {
                ps.close();
                cn.close();
            } catch (Exception ex) {
            }
        }
        return respuesta;
    }
   public ArrayList<String> getProveedores(String codProd) {
        ArrayList<String> lista = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;
        conexion c = new conexion();
        Connection con;
        System.out.println("codProd "+codProd);
        String sql ="SELECT\n" +
                    "  rut,\n" +
                    "  nombres,\n" +
                    "  correo,\n" +
                    "  telefono,\n" +
                    "  nacionalidad,\n" +
                    "  direccion\n" +
                    "FROM easyvent_easyfarmaventas.proveedor"
                + " where rut like ? or nombres like ? or correo like ? or telefono like ? or nacionalidad like ? ORDER BY nombres ASC limit 100"; 

               String respuesta = "";
        try {     
            con = c.conectar();
            ps = con.prepareStatement(sql);
            System.out.println("el SQL IMPRESO ES: "+sql);
            ps.setString(1, codProd +"%");
            ps.setString(2, codProd +"%");
            ps.setString(3, codProd +"%");
            ps.setString(4, codProd +"%");
            ps.setString(5, codProd +"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(rs.getString("nombres"));
                respuesta = "Todo OK";
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("A " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } catch (Exception ex) {
            System.out.println("B " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        }         
        return lista;
    }   
}
