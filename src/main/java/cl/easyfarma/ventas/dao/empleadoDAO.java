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
    
public String AgregarEmpleado(String nombre, 
                              String apellido, 
                              String sexo, 
                              String telefono, 
                              String fechaNacimiento, 
                              String tipoDocumento, 
                              String numeroDocumento, 
                              String empleadoActivo, 
                              int rut, 
                              String email, 
                              String dv, 
                              String profesion) {
    empleadoVO usu = null;
    conexion con;
    Connection cn = null;
    String respuesta = "";
    con = new conexion();
    PreparedStatement ps = null;
    ResultSet rs = null;
    usuarioDAO usuario = new usuarioDAO();
    try {
        cn = con.conectar();
        
        // Obtener el nuevo ID de usuario
        String consultaIDUsuario = "SELECT MAX(IDUSUARIO) + 1 AS NuevoIDUsuario FROM easyvent_easyfarmaventas.usuario";
        PreparedStatement psConsulta = cn.prepareStatement(consultaIDUsuario);
        ResultSet rsConsulta = psConsulta.executeQuery();
        
        int idUsuario = 0;
        if (rsConsulta.next()) {
            idUsuario = rsConsulta.getInt("NuevoIDUsuario");
        }
        
        // Preparar la consulta para agregar el empleado
        String sql = "CALL AgregarEmpleado(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ps = cn.prepareStatement(sql);
        ps.setString(1, nombre);
        ps.setString(2, apellido);
        ps.setString(3, sexo);
        ps.setString(4, telefono);
        ps.setString(5, fechaNacimiento);
        ps.setString(6, tipoDocumento);
        ps.setString(7, numeroDocumento);
        ps.setInt(8, idUsuario);
        ps.setString(9, empleadoActivo);
        ps.setInt(10, rut);
        ps.setString(11, email);
        ps.setString(12, dv);
        ps.setString(13, profesion);
        
        // Ejecuta la llamada al procedimiento almacenado
        ps.executeUpdate();

        // Cierra los recursos
        rsConsulta.close();
        psConsulta.close();
        ps.close();
        cn.close();
        
        respuesta = "Empleado guardado";
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (Exception ex) {
            System.out.println("Error al cerrar conexión: " + ex.getMessage());
        }
    }
    /*
    registroUsuario.setNombre(nombre);
    registroUsuario.setClave(clave);
    registroUsuario.setEstado(1);
    registroUsuario.setCodigoCargo(1);
    registroUsuario.setApellido(apellido);
    registroUsuario.setEmail(correo);
    registroUsuario.setIdEmpleado(1);
    */
    if(respuesta.equalsIgnoreCase("Empleado guardado"))
        usuario.Agregar_Usuario(nombre, apellido, email, "123456");
    return respuesta;
}
   
/*public String AgregarEmpleado(String nombre, String apellido, String sexo, String telefono, String fechaNacimiento, String tipoDocumento, String numeroDocumento, int idUsuario, String empleadoActivo, int rut, String email, String dv, String profesion) {
    empleadoVO usu = null;
    conexion con;
    Connection cn = null;
    String respuesta = "";
    con = new conexion();
    PreparedStatement ps = null;
    
    try {
        cn = con.conectar();
        String sql = "CALL AgregarEmpleado(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ps = cn.prepareStatement(sql);
        ps.setString(1, nombre);
        ps.setString(2, apellido);
        ps.setString(3, sexo);
        ps.setString(4, telefono);
        ps.setString(5, fechaNacimiento);
        ps.setString(6, tipoDocumento);
        ps.setString(7, numeroDocumento);
        ps.setInt(8, idUsuario);
        ps.setString(9, empleadoActivo);
        ps.setInt(10, rut);
        ps.setString(11, email);
        ps.setString(12, dv);
        ps.setString(13, profesion);
        
        // Ejecuta la llamada al procedimiento almacenado
        ps.executeUpdate();

        // Cierra la conexión con la base de datos
        ps.close();
        cn.close();
        
        respuesta = "Empleado Guardado con Éxito";
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (Exception ex) {
            System.out.println("Error al cerrar conexión: " + ex.getMessage());
        }
    }
    
    return respuesta;
}*/


public List<empleadoVO> listaEmpleados(String codProd) {
    List<empleadoVO> lista = new ArrayList<>();
    
    String sql = "SELECT rut, dv, nombre, apellido, email, telefono, profesion, empleadoactivo " +
                 "FROM easyvent_easyfarmaventas.empleado " +
                 "WHERE nombre LIKE ? OR rut LIKE ? OR apellido LIKE ? OR email LIKE ?";
    
    String respuesta = "";
    PreparedStatement ps;
    ResultSet rs;
    conexion c = new conexion();
    Connection con;
    
    try {
        con = c.conectar();
        ps = con.prepareStatement(sql);
        ps.setString(1, "%" + codProd + "%");
        ps.setString(2, "%" + codProd + "%");
        ps.setString(3, "%" + codProd + "%");
        ps.setString(4, "%" + codProd + "%");
        rs = ps.executeQuery();
        
        while (rs.next()) {
            empleadoVO p = new empleadoVO();
            p.setRUT(rs.getString("rut"));
            p.setDV(rs.getString("dv"));
            p.setNOMBRE(rs.getString("nombre"));
            p.setAPELLIDOS(rs.getString("apellido"));
            p.setEMAIL(rs.getString("email"));
            p.setTELEFONO(rs.getString("telefono"));
            p.setPROFESION(rs.getString("profesion"));
            p.setEMPLEADOACTIVO(rs.getString("empleadoactivo"));
            
            lista.add(p);
            
            respuesta = "Todo OK";
        }
        con.close();
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } 
    
    return lista;
}

public empleadoVO listaEmpleado(String codProd) {
    empleadoVO p = new empleadoVO();
    String sql = "SELECT rut, dv, nombre, apellido, email, telefono, profesion, empleadoactivo " +
                 "FROM easyvent_easyfarmaventas.empleado " +
                 "WHERE (nombre LIKE ? OR rut LIKE ? OR apellido LIKE ? OR email LIKE ?) AND empleadoactivo = 'Si'";
    
    String respuesta = "";
    PreparedStatement ps;
    ResultSet rs;
    conexion c = new conexion();
    Connection con;
    
    try {
        con = c.conectar();
        ps = con.prepareStatement(sql);
        ps.setString(1, "%" + codProd + "%");
        ps.setString(2, "%" + codProd + "%");
        ps.setString(3, "%" + codProd + "%");
        ps.setString(4, "%" + codProd + "%");
       
        rs = ps.executeQuery();
        
        while (rs.next()) {
            p.setRUT(rs.getString("rut"));
            p.setDV(rs.getString("dv"));
            p.setNOMBRE(rs.getString("nombre"));
            p.setAPELLIDOS(rs.getString("apellido"));
            p.setEMAIL(rs.getString("email"));
            p.setTELEFONO(rs.getString("telefono"));
            p.setPROFESION(rs.getString("profesion"));
            p.setEMPLEADOACTIVO(rs.getString("empleadoactivo"));
            
            System.out.println("B " + p.getRUT());
            System.out.println("B " + p.getDV());
            System.out.println("B " + p.getNOMBRE());
            System.out.println("B " + p.getAPELLIDOS());
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
    conexion con;
    Connection cn = null;
    PreparedStatement ps = null;
    
    String sql = "UPDATE easyvent_easyfarmaventas.empleado " +
                 "SET NOMBRE = ?, " +
                 "    APELLIDOS = ?, " +
                 "    TELEFONO = ?, " +
                 "    EMAIL = ?, " +
                 "    PROFESION = ?, " +
                 "    DIRECCION = ? " +
                 "WHERE rut = ?";

    String respuesta = "";
    con = new conexion();
    
    try {
        cn = con.conectar();
        ps = cn.prepareStatement(sql);
        ps.setString(1, nombre);
        ps.setString(2, apellido);
        ps.setString(3, telefono);
        ps.setString(4, correo);
        ps.setString(5, profesion);
        ps.setString(6, direccion);
        ps.setString(7, rut);

        int filasActualizadas = ps.executeUpdate();

        if (filasActualizadas > 0) {
            respuesta = "Empleado actualizado correctamente.";
        } else {
            respuesta = "No se encontró ningún empleado con el rut especificado.";
        }

    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (Exception ex) {
            System.out.println("Error al cerrar conexión: " + ex.getMessage());
        }
    }
    return respuesta;
}

public String Editar_Empleado(String rutE, String Activo) {
    conexion con;
    Connection cn = null;
    PreparedStatement ps = null;

    String sql = "UPDATE easyvent_easyfarmaventas.empleado " +
                 "SET empleadoActivo = ? " +
                 "WHERE rut = ?";
    
    String respuesta = "";
    con = new conexion();

    try {
        cn = con.conectar();
        ps = cn.prepareStatement(sql);
        ps.setString(1, Activo);
        ps.setString(2, rutE);

        int filasActualizadas = ps.executeUpdate();

        if (filasActualizadas > 0) {
            respuesta = "Empleado actualizado correctamente.";
        } else {
            respuesta = "No se encontró ningún empleado con el rut especificado.";
        }

    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (Exception ex) {
            System.out.println("Error al cerrar conexión: " + ex.getMessage());
        }
    }
    return respuesta;
}

}
