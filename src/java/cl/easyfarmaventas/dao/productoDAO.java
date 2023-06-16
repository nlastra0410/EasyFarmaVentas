/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarmaventas.dao;

import cl.easyfarmaventas.conexion.conexion;
import cl.easyfarmaventas.vo.usuarioVO;
import cl.easyfarmaventas.vo.productoVO;
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
public class productoDAO {
         
    public String Agregar_Producto(String CodSKU,
            String nombreProd,
            String PrincipioActivo,
            String Contenido,
            String Usos,
            String Contraindicaciones,
            String Departamento,
            String EscribirAqui,
            Integer Cantidad,
            Integer Minimo,
            Integer Maximo,
            String Sucursal,
            String EscribirAquiDesc,
            Double precioCompra,
            Double iva,
            Double impuesto2,
            Double impuesto3,
            Double margen,
            Double descuento,
            Double precioSugerido,
            Double precio1,
            Double precio2,
            Double precioSuscripcion,
            Double precioConvenio,
            Boolean ventaPresencial,
            Boolean ventaOnline,
            Boolean receta,
            Boolean recetaRetenida,
            Boolean retiroTienda, 
            String descripcion) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "INSERT INTO easyvent_easyfarmaventas.productofarma (SKU, nombre, Activo, Contenido, Usos, Contraindicaciones, Departamento, EscribirAqui, Cantidad, Minimo, Maximo, Sucursal, EscribirAquiDesc, precioCompra, iva, impuesto2, impuesto3, margen, descuento, precioSugerido, precio1, precio2, precioSuscripcion, precioConvenio, ventaPresencial, ventaOnline, RequiereReceta, recetaRetenida, retiroTienda, descripcion) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        
        // Resto del código para guardar el producto en la base de datos
        try {
            cn = con.conectar();
            st = cn.createStatement();
            ps = cn.prepareStatement(sql);
            PreparedStatement stmt = cn.prepareStatement(sql);
            stmt.setString(1, CodSKU);
            stmt.setString(2, nombreProd);
            stmt.setString(3, PrincipioActivo);
            stmt.setString(4, Contenido);
            stmt.setString(5, Usos);
            stmt.setString(6, Contraindicaciones);
            stmt.setString(7, Departamento);
            stmt.setString(8, EscribirAqui);
            stmt.setInt(9, Cantidad);
            stmt.setInt(10, Minimo);
            stmt.setInt(11, Maximo);
            stmt.setString(12, Sucursal);
            stmt.setString(13, EscribirAquiDesc);
            stmt.setDouble(14, precioCompra);
            stmt.setDouble(15, iva);
            stmt.setDouble(16, impuesto2);
            stmt.setDouble(17, impuesto3);
            stmt.setDouble(18, margen);
            stmt.setDouble(19, descuento);
            stmt.setDouble(20, precioSugerido);
            stmt.setDouble(21, precio1);
            stmt.setDouble(22, precio2);
            stmt.setDouble(23, precioSuscripcion);
            stmt.setDouble(24, precioConvenio);
            stmt.setBoolean(25, ventaPresencial);
            stmt.setBoolean(26, ventaOnline);
            stmt.setBoolean(27, receta);
            stmt.setBoolean(28, recetaRetenida);
            stmt.setBoolean(29, retiroTienda);
            stmt.setString(30, descripcion);

            // Ejecuta la sentencia SQL
            stmt.executeUpdate();

            // Cierra la conexión con la base de datos
            stmt.close();
            cn.close();
            
            respuesta = "Productos Guardados con Exito ";

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
    public List listarProductos(String codProd) {
        List<productoVO> lista = new ArrayList<>();
        String sql = "SELECT sku, "
                        + "nombre, "
                        + "cantidad, "
                        + "precio1, "
                        + "precioconvenio, "
                        + "maximo, "
                        + "Activo, "
                        + "descripcion "
                        + "FROM easyvent_easyfarmaventas.productofarma "
                        + "WHERE activo = 'Si' ";
             
        String sqlFinal = "";
        if (codProd != null) {
            sqlFinal += sql;
            sqlFinal += "and SKU LIKE '%"+codProd+"%' or nombre like '%"+codProd+"%' ; ";
        }
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
            ps = con.prepareStatement(sqlFinal);
           // ps.setString(1, "'%"+codProd+"%'");
            rs = ps.executeQuery();
            while (rs.next()) {
                productoVO p = new productoVO();
                p.setSKU(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setCantidad(rs.getString(3));
                p.setPrecio1(rs.getString(4));
                p.setPrecioConvenio(rs.getString(5));
                p.setMaximo(rs.getString(6));
                p.setActivo(rs.getString(7));
                p.setDescripcion(rs.getString(8));
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
    
    public productoVO listarProductosEdit(String SKU) {
        productoVO producto = new productoVO();
        String sql = "SELECT SKU, nombre, Activo, Contenido, Usos, Contraindicaciones, Departamento, EscribirAqui, Cantidad, Minimo, Maximo, Sucursal, EscribirAquiDesc, precioCompra, iva, impuesto2, impuesto3, margen, descuento, precioSugerido, precio1, precio2, precioSuscripcion, precioConvenio, ventaPresencial, ventaOnline, RequiereReceta, recetaRetenida, retiroTienda, descripcion "
                        + "FROM easyvent_easyfarmaventas.productofarma "
                        + "WHERE activo = 'Si' ";
             
        String sqlFinal = "";
        if (SKU != null) {
            sqlFinal += sql;
            sqlFinal += "and SKU LIKE '%"+SKU+"%' ; ";
        }
        System.out.println("sql " + sql);
        System.out.println("sql " + sqlFinal);
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
            ps = con.prepareStatement(sqlFinal);
           // ps.setString(1, "'%"+codProd+"%'");
            rs = ps.executeQuery();
            while (rs.next()) {
                //productoVO p = new productoVO();
                producto.setSKU(rs.getString(1));
                producto.setNombre(rs.getString(2));
                producto.setActivo(rs.getString(3));
                producto.setContenido(rs.getString(4));
                producto.setUsos(rs.getString(5));
                producto.setContraindicaciones(rs.getString(6));
                producto.setDepartamento(rs.getString(7));
                producto.setEscribirAqui(rs.getString(8));
                producto.setCantidad(rs.getString(9));
                producto.setMinimo(rs.getString(10));
                producto.setMaximo(rs.getString(11));
                producto.setSucursal(rs.getString(12));
                producto.setEscribirAquiDesc(rs.getString(13));
                producto.setPrecioCompra(rs.getString(14));
                producto.setIva(rs.getString(15));
                producto.setImpuesto2(rs.getString(16));
                producto.setImpuesto3(rs.getString(17));
                producto.setMargen(rs.getString(18));
                producto.setDescuento(rs.getString(19));
                producto.setPrecioSugerido(rs.getString(20));
                producto.setPrecio1(rs.getString(21));
                producto.setPrecio2(rs.getString(22));
                producto.setPrecioSuscripcion(rs.getString(23));
                producto.setPrecioConvenio(rs.getString(24));
                producto.setVentaPresencial(rs.getString(25));
                producto.setVentaOnline(rs.getString(26));
                producto.setRequiereReceta(rs.getString(27));
                producto.setRecetaRetenida(rs.getString(28));
                producto.setRetiroTienda(rs.getString(29));
                producto.setDescripcion(rs.getString(30));
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
         
        return producto;
    }
    
    public String Editar_Producto(String CodSKU,
            String nombreProd,
            String PrincipioActivo,
            String Contenido,
            String Usos,
            String Contraindicaciones,
            String Departamento,
            String EscribirAqui,
            Integer Cantidad,
            Integer Minimo,
            Integer Maximo,
            String Sucursal,
            String EscribirAquiDesc,
            Double precioCompra,
            Double iva,
            Double impuesto2,
            Double impuesto3,
            Double margen,
            Double descuento,
            Double precioSugerido,
            Double precio1,
            Double precio2,
            Double precioSuscripcion,
            Double precioConvenio,
            Boolean ventaPresencial,
            Boolean ventaOnline,
            Boolean receta,
            Boolean recetaRetenida,
            Boolean retiroTienda, 
            String descripcion) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        System.out.println("editar productos 293");
        String sql = "UPDATE easyvent_easyfarmaventas.productofarma SET nombre = ?, activo = ?, contenido = ?, usos = ?, "
                + "contraindicaciones = ?, departamento = ?, escribirAqui = ?, cantidad = ?, minimo = ?, maximo = ?, "
                + "sucursal = ?, escribirAquiDesc = ?, precioCompra = ?, iva = ?, impuesto2 = ?, impuesto3 = ?, "
                + "margen = ?, descuento = ?, precioSugerido = ?, precio1 = ?, precio2 = ?, precioSuscripcion = ?, "
                + "precioConvenio = ?, ventaPresencial = ?, ventaOnline = ?, requiereReceta = ?, recetaRetenida = ?, "
                + "retiroTienda = ?, descripcion = ? WHERE SKU = ?";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
              
        System.out.println("editar productos 304");
        // Resto del código para guardar el producto en la base de datos
        try {
            cn = con.conectar();
             System.out.println("editar productos 308");
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, nombreProd);
            statement.setString(2, PrincipioActivo);
            statement.setString(3, Contenido);
            statement.setString(4, Usos);
            statement.setString(5, Contraindicaciones);
            statement.setString(6, Departamento);
            statement.setString(7, EscribirAqui);
            statement.setInt(8, Cantidad);
            statement.setInt(9, Minimo);
            statement.setInt(10, Maximo);
            statement.setString(11, Sucursal);
            statement.setString(12, EscribirAquiDesc);
            statement.setDouble(13, precioCompra);
            statement.setDouble(14, iva);
            statement.setDouble(15, impuesto2);
            statement.setDouble(16, impuesto3);
            statement.setDouble(17, margen);
            statement.setDouble(18, descuento);
            statement.setDouble(19, precioSugerido);
            statement.setDouble(20, precio1);
            statement.setDouble(21, precio2);
            statement.setDouble(22, precioSuscripcion);
            statement.setDouble(23, precioConvenio);
            statement.setBoolean(24, ventaPresencial);
            statement.setBoolean(25, ventaOnline);
            statement.setBoolean(26, receta);
            statement.setBoolean(27, recetaRetenida);
            statement.setBoolean(28, retiroTienda);
            statement.setString(29, descripcion);
            statement.setString(30, CodSKU);
System.out.println("editar productos 341");
            statement.executeUpdate();
            respuesta = "Producto actualizado correctamente.";
            // Ejecuta la sentencia SQL
            statement.executeUpdate();

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
    
    
    public String Editar_Producto_Eliminar(String CodSKU) {
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        System.out.println("editar productos 293");
        String sql = "UPDATE easyvent_easyfarmaventas.productofarma SET  activo = ? WHERE SKU = ?";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
              
        System.out.println("editar productos 304");
        // Resto del código para guardar el producto en la base de datos
        try {
            cn = con.conectar();
            System.out.println("editar productos 308");
            ps = cn.prepareStatement(sql);
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, "No");
            statement.setString(2, CodSKU);
            System.out.println("editar productos 341");
            respuesta = "Producto actualizado correctamente.";
            // Ejecuta la sentencia SQL
            statement.executeUpdate();

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
    
    public ArrayList<String> getProductos(String codProd) {
        ArrayList<String> lista = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;
        conexion c = new conexion();
        Connection con;
        System.out.println("codProd "+codProd);
        String sql = "SELECT  "
                        + "nombre "
                        + "FROM easyvent_easyfarmaventas.productofarma "
                        + "WHERE activo = 'Si' "
                        + "and nombre like '%"+codProd+"%' or principioactivo like '%"+codProd+"%' or sku like '%"+codProd+"%' ORDER BY nombre ASC limit 100 ";
        String respuesta = "";
        try {     
            con = c.conectar();
            ps = con.prepareStatement(sql);
            System.out.println("el SQL IMPRESO ES: "+sql);
         //   ps.setString(1, codProd +"%");
         //   ps.setString(2, codProd +"%");
         //   ps.setString(3, codProd +"%");
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
    }

