/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.dao;

import cl.easyfarma.ventas.conexion.conexion;
import cl.easyfarma.ventas.vo.clienteVO;
import cl.easyfarma.ventas.vo.usuarioVO;
import java.sql.CallableStatement;
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
public class clienteDAO {
    public String Agregar_Cliente(String rut, String nombre, String apellido, String correo, String telefono, String profesion, String direccion, String plus) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "INSERT INTO easyvent_easyfarmaventas.cliente\n" +
                     "(rut, dv, nombre, apellido, direccion, email, plus, telefono, profesion)\n" +
                     "VALUES (?,?,?,?,?,?,?,?,?) ;";
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
            stmt.setString(7, plus);
            stmt.setString(8, telefono);
            stmt.setString(9, profesion);
            
            // Ejecuta la sentencia SQL
            stmt.executeUpdate();

            // Cierra la conexión con la base de datos
            stmt.close();
            cn.close();
            
            respuesta = "Clientes Guardados con Exito ";

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
    
    
 public List<clienteVO> listaClientes(String codProd) {
    List<clienteVO> lista = new ArrayList<>();
    
    String sql = "{CALL sp_buscarClientes_lista(?)}";
    PreparedStatement ps;
    ResultSet rs;
    conexion c = new conexion();
    Connection con;
    
    try {
        con = c.conectar();
        ps = con.prepareStatement(sql);
        ps.setString(1, codProd);
  
        rs = ps.executeQuery();
        
        while (rs.next()) {
            clienteVO p = new clienteVO();
            p.setRut(rs.getInt("rut"));
            p.setDv(rs.getString("dv"));
            p.setNombre(rs.getString("nombre"));
            p.setApellido(rs.getString("apellido"));
            p.setDireccion(rs.getString("direccion"));
            p.setEmail(rs.getString("email"));
            p.setPlus(rs.getString("plus"));
            p.setTelefono(rs.getString("telefono"));
            p.setProfesion(rs.getString("profesion"));
            p.setFechanac(rs.getString("fechanac"));
             System.out.println("B " + p.getRut());
                 System.out.println("B " + p.getDv());
                  System.out.println("B " + p.getNombre());
                   System.out.println("B " + p.getApellido());
                    System.out.println("B " + p.getDireccion());
                     System.out.println("B " + p.getEmail());
                      System.out.println("B " + p.getPlus());
                       System.out.println("B " + p.getTelefono());
                        System.out.println("B " + p.getProfesion());
                         System.out.println("B " + p.getFechanac());
            lista.add(p);
        }
        con.close();
    } catch (SQLException ex) {
        System.out.println("cl.easyfarma.ventas.dao.clienteDAO.listaClientes() error" +ex);
        ex.printStackTrace();
    } catch (Exception ex) {
        System.out.println("cl.easyfarma.ventas.dao.clienteDAO.listaClientes() error 2" +ex);
        ex.printStackTrace();
    } 
     
    return lista;
}   
/*public List listaClientes(String codProd) {
        List<clienteVO> lista = new ArrayList<>();
        
       String sql = "SELECT  rut, dv,  nombre, apellido, direccion, email, plus, telefono, profesion, fechanac FROM easyvent_easyfarmaventas.cliente where nombre like ? or rut like ? or apellido like ? or plus like ? or email like ? and clienteActivo = 'Si' ";
        
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
            ps.setString(5, codProd);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                clienteVO p = new clienteVO();
                p.setRut(rs.getInt(1));
                p.setDv(rs.getString(2));
                p.setNombre(rs.getString(3));
                p.setApellido(rs.getString(4));
                p.setDireccion(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setPlus(rs.getString(7));
                p.setTelefono(rs.getString(8));
                p.setProfesion(rs.getString(9));
                p.setFechanac(rs.getString(10));
                System.out.println("B " + p.getRut());
                 System.out.println("B " + p.getDv());
                  System.out.println("B " + p.getNombre());
                   System.out.println("B " + p.getApellido());
                    System.out.println("B " + p.getDireccion());
                     System.out.println("B " + p.getEmail());
                      System.out.println("B " + p.getPlus());
                       System.out.println("B " + p.getTelefono());
                        System.out.println("B " + p.getProfesion());
                         System.out.println("B " + p.getFechanac());
                     
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
    }*/
public clienteVO listaCliente(String codProd) {
        List<clienteVO> lista = new ArrayList<>();
        clienteVO p = new clienteVO();
       String sql = "SELECT  rut, dv,  nombre, apellido, direccion, email, plus, telefono, profesion, fechanac FROM easyvent_easyfarmaventas.cliente where nombre like ? or rut like ? or apellido like ? or plus like ? or email like ? and clienteActivo = 'Si' ";
        
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
            ps.setString(5, codProd);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                
                p.setRut(rs.getInt(1));
                p.setDv(rs.getString(2));
                p.setNombre(rs.getString(3));
                p.setApellido(rs.getString(4));
                p.setDireccion(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setPlus(rs.getString(7));
                p.setTelefono(rs.getString(8));
                p.setProfesion(rs.getString(9));
                p.setFechanac(rs.getString(10));
                System.out.println("B " + p.getRut());
                System.out.println("B " + p.getDv());
                System.out.println("B " + p.getNombre());
                System.out.println("B " + p.getApellido());
                System.out.println("B " + p.getDireccion());
                System.out.println("B " + p.getEmail());
                System.out.println("B " + p.getPlus());
                System.out.println("B " + p.getTelefono());
                System.out.println("B " + p.getProfesion());
                System.out.println("B " + p.getFechanac());
                     
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

public String Editar_Cliente(String rutE, String nombreE, String apellidoE, String correoE, String telefonoE, String profesionE, String direccionE, String plusE) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        
        String sql = "UPDATE easyvent_easyfarmaventas.cliente set rut = ?, dv = ?, nombre = ?, apellido = ?, direccion = ?, email = ?, plus = ?, "
                + "telefono = ?, "
                + "profesion = ?, fechanac = ? "
                + "where rut = ? ";
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
            System.out.println("editar productos 308");
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setInt(1, rutSolo);
            statement.setString(2, dv);
            statement.setString(3, nombreE);
            statement.setString(4, apellidoE);
            statement.setString(5, direccionE);
            statement.setString(6, correoE);
            statement.setString(7, plusE);
            statement.setString(8, telefonoE);
            statement.setString(9, profesionE);
            statement.setString(10, "");
            statement.setString(11, rutE);
            
            System.out.println("editar productos 341");
            statement.executeUpdate();
            respuesta = "Producto actualizado correctamente.";
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
public String Editar_Cliente(String rutE, String Activo) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        
        String sql = "UPDATE easyvent_easyfarmaventas.cliente set clienteActivo = ? where rut = ? ";
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
            System.out.println("editar productos 308");
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, Activo);
            statement.setInt(2, rutSolo);
            System.out.println("editar productos 341");
            statement.executeUpdate();
            respuesta = "Producto actualizado correctamente.";
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
        public List<String> buscarClientes(String codProd) {
            List<String> nombres = new ArrayList<>();
            conexion con;
            con = new conexion();
            try (Connection cn = con.conectar();CallableStatement statement = cn.prepareCall("{CALL sp_buscarClientes(?)}")) {

                statement.setString(1, codProd);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        String nombre = resultSet.getString("nombre");
                        nombres.add(nombre);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return nombres;
        }
        public ArrayList<String> getClientes(String codProd) {
                ArrayList<String> lista = new ArrayList<>();
                PreparedStatement ps;
                ResultSet rs;
                conexion c = new conexion();
                Connection con;
                System.out.println("codProd "+codProd);
                String sql = "SELECT  CONCAT(nombre, ' ', apellido) AS nombre FROM easyvent_easyfarmaventas.cliente WHERE clienteActivo = 'Si' "    
                        + "and CONCAT(nombre, ' ', apellido) like '%"+codProd+"%' or email like '%"+codProd+"%' or rut like '%"+codProd+"%' ORDER BY nombre ASC limit 100 ";
                String respuesta = "";
                try {     
                    con = c.conectar();
                    ps = con.prepareStatement(sql);
                    System.out.println("el SQL IMPRESO ES: "+sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        lista.add(rs.getString("nombre"));
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
        
public List<String> buscarClientesPlus(String varRut) {
    List<String> nombres = new ArrayList<>();
    Connection cn = null;
    CallableStatement statement = null;
    ResultSet resultSet = null;

    try {
        conexion con = new conexion();
        cn = con.conectar();
        statement = cn.prepareCall("{CALL obtenerClientePlus(?)}");
        statement.setString(1, varRut);
        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            String nombre = resultSet.getString("nombre");
            nombres.add(nombre);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Cerrar recursos en orden inverso de apertura
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (cn != null) {
            try {
                cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    return nombres;
}

}
