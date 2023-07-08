/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.dao;

import cl.easyfarma.ventas.conexion.conexion;
import cl.easyfarma.ventas.vo.empleadoVO;
import cl.easyfarma.ventas.vo.usuarioVO;
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
public class empleadoDAO {
     public String Agregar_Empleado(String rut, String nombre, String apellido, String correo, String telefono, String profesion, String direccion) {
        empleadoVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "INSERT INTO easyvent_easyfarmaventas.empleado\n" +
                     "(rut, dv, nombre, apellido, direccion, email, telefono, profesion, empleadoactivo, direccion)\n" +
                     "VALUES (?,?,?,?,?,?,?,?,?,?) ;";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        
        String rutSplit = rut;
        String[] partes = rutSplit.split("-");
        Integer rutSolo = Integer.parseInt(partes[0]);
        String dv = partes[1];
        // Resto del código para guardar el producto en la base de datos
        try {
            cn = con.conectar();
            st = cn.createStatement();
            ps = cn.prepareStatement(sql);
            PreparedStatement stmt = cn.prepareStatement(sql);
            stmt.setInt(1, rutSolo);
            stmt.setString(2, dv);
            stmt.setString(3, nombre);
            stmt.setString(4, apellido);
            stmt.setString(5, direccion);
            stmt.setString(6, correo);
            stmt.setString(7, telefono);
            stmt.setString(8, profesion);
            stmt.setString(8, "Si");
            stmt.setString(8, direccion);
            
            
            // Ejecuta la sentencia SQL
            stmt.executeUpdate();

            // Cierra la conexión con la base de datos
            stmt.close();
            cn.close();
            
            respuesta = "Empleado Guardado con Exito ";

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
public List listaEmpleados(String codProd) {
        List<empleadoVO> lista = new ArrayList<>();
        
       String sql = "SELECT  rut, dv, nombre, apellido, direccion, email, telefono, profesion, empleadoactivo, direccion FROM easyvent_easyfarmaventas.empleado where nombre like ? or rut like ? or apellido like ? or ? or email like ? and empleadoactivo = 'Si' ";
        
        String respuesta = "";
        PreparedStatement ps;
        ResultSet rs;
        conexion c = new conexion();
        Connection con;
        
        String string = "";
        String part1 = "";
        String part2 = "";
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, codProd);
            ps.setString(2, codProd);
            ps.setString(3, codProd);
            ps.setString(4, codProd);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                empleadoVO p = new empleadoVO();
                p.setRUT(rs.getString(1));
                p.setDV(rs.getString(2));
                p.setNOMBRE(rs.getString(3));
                p.setAPELLIDOS(rs.getString(4));
                p.setDIRECCION(rs.getString(5));
                p.setEMAIL(rs.getString(6));
                p.setTELEFONO(rs.getString(7));
                p.setPROFESION(rs.getString(8));
                p.setEMPLEADOACTIVO(rs.getString(9));
                System.out.println("B " + p.getRUT());
                System.out.println("B " + p.getDV());
                System.out.println("B " + p.getNOMBRE());
                System.out.println("B " + p.getAPELLIDOS());
                System.out.println("B " + p.getDIRECCION());
                System.out.println("B " + p.getEMAIL());
                System.out.println("B " + p.getTELEFONO());
                System.out.println("B " + p.getPROFESION());
                System.out.println("B " + p.getEMPLEADOACTIVO());
                     
                lista.add(p);
                
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
public empleadoVO listaEmpleado(String codProd) {
        List<empleadoVO> lista = new ArrayList<>();
        empleadoVO p = new empleadoVO();
        String sql = "SELECT  rut, dv, nombre, apellido, direccion, email, telefono, profesion, empleadoactivo, direccion FROM easyvent_easyfarmaventas.empleado where nombre like ? or rut like ? or apellido like ? or ? or email like ? and empleadoactivo = 'Si' ";
        
        String respuesta = "";
        PreparedStatement ps;
        ResultSet rs;
        conexion c = new conexion();
        Connection con;
        
        String string = "";
        String part1 = "";
        String part2 = "";
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, codProd);
            ps.setString(2, codProd);
            ps.setString(3, codProd);
            ps.setString(4, codProd);
           
            rs = ps.executeQuery();
            
            while (rs.next()) {
                
                p.setRUT(rs.getString(1));
                p.setDV(rs.getString(2));
                p.setNOMBRE(rs.getString(3));
                p.setAPELLIDOS(rs.getString(4));
                p.setDIRECCION(rs.getString(5));
                p.setEMAIL(rs.getString(6));
                p.setTELEFONO(rs.getString(7));
                p.setPROFESION(rs.getString(8));
                p.setEMPLEADOACTIVO(rs.getString(9));
                System.out.println("B " + p.getRUT());
                System.out.println("B " + p.getDV());
                System.out.println("B " + p.getNOMBRE());
                System.out.println("B " + p.getAPELLIDOS());
                System.out.println("B " + p.getDIRECCION());
                System.out.println("B " + p.getEMAIL());
                System.out.println("B " + p.getTELEFONO());
                System.out.println("B " + p.getPROFESION());
                System.out.println("B " + p.getEMPLEADOACTIVO());
                     
                     
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
         
        return p;
    }

public String Editar_Empleado(String rut, String nombre, String apellido, String correo, String telefono, String profesion, String direccion) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        
        String sql = "UPDATE easyvent_easyfarmaventas.empleado " +
                            "SET NOMBRE = ?, " +
                            "	APELLIDOS = ?, " +
                            "	TELEFONO = ?, " +
                            "	EMPLEADOACTIVO = ?, " +
                            "	rut = ?, " +
                            "	email = ?, " +
                            "	dv = ?, " +
                            "	profesion = ? " +
                            "WHERE rut = ? ; ";
    
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        // Resto del código para guardar el producto en la base de datos
        String rutSplit = rut;
        String[] partes = rutSplit.split("-");
        Integer rutSolo = Integer.parseInt(partes[0]);
        String dv = partes[1];
        
        try {
            cn = con.conectar();
            System.out.println("editar EMPLEADO 308");
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, telefono);
            statement.setString(4, "Si");
            statement.setInt(5, rutSolo);
            statement.setString(6, correo);
            statement.setString(7, dv);
            statement.setString(8, profesion);
            statement.setInt(9, rutSolo);
                      
            System.out.println("editar EMPLEADO 341");
            statement.executeUpdate();
            respuesta = "EMPLEADO actualizado correctamente.";
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
public String Editar_Empleado(String rutE, String Activo) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        
        String sql = "UPDATE easyvent_easyfarmaventas.empleado set empleadoActivo = ? where rut = ? ";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        // Resto del código para guardar el producto en la base de datos
        String rutSplit = rutE;
        String[] partes = rutSplit.split("-");
        Integer rutSolo = Integer.parseInt(partes[0]);
        String dv = partes[1];
        
        try {
            cn = con.conectar();
            System.out.println("editar empleado 308");
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, Activo);
            statement.setInt(2, rutSolo);
            System.out.println("editar empleado 341");
            statement.executeUpdate();
            respuesta = "empleado actualizado correctamente.";
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
}
