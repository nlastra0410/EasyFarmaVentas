/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.dao;

import cl.easyfarma.ventas.conexion.conexion;
import cl.easyfarma.ventas.vo.usuarioVO;
import cl.easyfarma.ventas.vo.productoVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
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
        conexion con;
        Connection cn = null;
        String sql = "{CALL Agregar_Producto(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"; // Nombre del procedimiento almacenado
        String respuesta = "";
        con = new conexion();
        
        try {
            cn = con.conectar();
            CallableStatement stmt = cn.prepareCall(sql);
            
            stmt.setString(1, CodSKU);
            stmt.setString(2, nombreProd);
            stmt.setString(3, "Si");
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
            stmt.setString(31, PrincipioActivo);

            // Ejecuta el procedimiento almacenado
            stmt.executeUpdate();

            respuesta = "Productos Guardados con Exito";

        } catch (SQLException ex) {
            System.out.println("A " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } catch (Exception ex) {
            System.out.println("B " + ex.getMessage());
            respuesta = "Error " + ex.getMessage();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception ex) {
            }
        }
        return respuesta;
    }
   
   /* public String Agregar_Producto(String CodSKU,
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
        String sql = "INSERT INTO easyvent_easyfarmaventas.productofarma (SKU, nombre, Activo, Contenido, Usos, Contraindicaciones, Departamento, EscribirAqui, Cantidad, Minimo, Maximo, Sucursal, EscribirAquiDesc, precioCompra, iva, impuesto2, impuesto3, margen, descuento, precioSugerido, precio1, precio2, precioSuscripcion, precioConvenio, ventaPresencial, ventaOnline, RequiereReceta, recetaRetenida, retiroTienda, descripcion, principioactivo) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            stmt.setString(3, "Si");
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
            stmt.setString(31, PrincipioActivo);

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
    }*/
   /* public List listarProductos(String codProd) {
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
    }*/
    public List<productoVO> listarProductos(String codProd) {
    List<productoVO> lista = new ArrayList<>();
    String respuesta = "";
    String sql = "CALL obtenerProductos(?)"; // Nombre del procedimiento almacenado
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
            productoVO p = new productoVO();
            p.setSKU(rs.getString("sku"));
            p.setNombre(rs.getString("nombre"));
            p.setCantidad(rs.getString("cantidad"));
            p.setPrecio1(rs.getString("precio1"));
            p.setPrecioConvenio(rs.getString("precioconvenio"));
            p.setMaximo(rs.getString("maximo"));
            p.setPrincipioactivo(rs.getString("principioactivo"));
            p.setDescripcion(rs.getString("descripcion"));
            lista.add(p);
            
            respuesta = "Todo OK";
        }
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    }
    
    return lista;
}

    public productoVO listarProductosEdit(String SKU) {
    productoVO producto = new productoVO();
    String respuesta = "";
    String sql = "CALL listaProductosEDIT(?)"; // Nombre del procedimiento almacenado
    PreparedStatement ps;
    ResultSet rs;
    conexion c = new conexion();
    Connection con;
    
    try {
        con = c.conectar();
        ps = con.prepareStatement(sql);
        ps.setString(1, SKU);
  
        rs = ps.executeQuery();
        if (rs.next()) {
            producto.setSKU(rs.getString("SKU"));
            producto.setNombre(rs.getString("nombre"));
            producto.setActivo(rs.getString("Activo"));
            producto.setContenido(rs.getString("Contenido"));
            producto.setUsos(rs.getString("Usos"));
            producto.setContraindicaciones(rs.getString("Contraindicaciones"));
            producto.setDepartamento(rs.getString("Departamento"));
            producto.setEscribirAqui(rs.getString("EscribirAqui"));
            producto.setCantidad(rs.getString("Cantidad"));
            producto.setMinimo(rs.getString("Minimo"));
            producto.setMaximo(rs.getString("Maximo"));
            producto.setSucursal(rs.getString("Sucursal"));
            producto.setEscribirAquiDesc(rs.getString("EscribirAquiDesc"));
            producto.setPrecioCompra(rs.getString("precioCompra"));
            producto.setIva(rs.getString("iva"));
            producto.setImpuesto2(rs.getString("impuesto2"));
            producto.setImpuesto3(rs.getString("impuesto3"));
            producto.setMargen(rs.getString("margen"));
            producto.setDescuento(rs.getString("descuento"));
            producto.setPrecioSugerido(rs.getString("precioSugerido"));
            producto.setPrecio1(rs.getString("precio1"));
            producto.setPrecio2(rs.getString("precio2"));
            producto.setPrecioSuscripcion(rs.getString("precioSuscripcion"));
            producto.setPrecioConvenio(rs.getString("precioConvenio"));
            producto.setVentaPresencial(rs.getString("ventaPresencial"));
            producto.setVentaOnline(rs.getString("ventaOnline"));
            producto.setRequiereReceta(rs.getString("RequiereReceta"));
            producto.setRecetaRetenida(rs.getString("recetaRetenida"));
            producto.setRetiroTienda(rs.getString("retiroTienda"));
            producto.setDescripcion(rs.getString("descripcion"));
            
            respuesta = "Todo OK";
        }
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    }
    
    return producto;
}

    /*public productoVO listarProductosEdit(String SKU) {
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
    }*/
    
    /*public String Editar_Producto(String CodSKU,
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
                + "retiroTienda = ?, descripcion = ? , principioactivo = ? WHERE SKU = ?";
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
            statement.setString(2, "Si");
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
            statement.setString(30, PrincipioActivo);
            statement.setString(31, CodSKU);
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
    }*/
    
    public String Editar_Producto(String CodSKU, String nombreProd, String PrincipioActivo, String Contenido, String Usos, String Contraindicaciones, String Departamento,String EscribirAqui, Integer Cantidad, Integer Minimo, Integer Maximo, String Sucursal, String EscribirAquiDesc, Double precioCompra, Double iva, Double impuesto2, Double impuesto3, Double margen, Double descuento, Double precioSugerido, Double precio1, Double precio2, Double precioSuscripcion, Double precioConvenio, Boolean ventaPresencial, Boolean ventaOnline, Boolean receta, Boolean recetaRetenida, Boolean retiroTienda, String descripcion) {
    usuarioVO usu = null;
    conexion con;
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    System.out.println("editar productos 293");
    String respuesta = "";
    con = new conexion();
    PreparedStatement ps = null;
    
    System.out.println("editar productos 304");
    try {
        cn = con.conectar();
        System.out.println("editar productos 308");
        CallableStatement statement = cn.prepareCall("{ CALL Editar_Producto(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
        statement.setString(1, CodSKU);
        statement.setString(2, nombreProd);
        statement.setString(3, PrincipioActivo);
        statement.setString(4, Contenido);
        statement.setString(5, Usos);
        statement.setString(6, Contraindicaciones);
        statement.setString(7, Departamento);
        statement.setString(8, EscribirAqui);
        statement.setInt(9, Cantidad);
        statement.setInt(10, Minimo);
        statement.setInt(11, Maximo);
        statement.setString(12, Sucursal);
        statement.setString(13, EscribirAquiDesc);
        statement.setDouble(14, precioCompra);
        statement.setDouble(15, iva);
        statement.setDouble(16, impuesto2);
        statement.setDouble(17, impuesto3);
        statement.setDouble(18, margen);
        statement.setDouble(19, descuento);
        statement.setDouble(20, precioSugerido);
        statement.setDouble(21, precio1);
        statement.setDouble(22, precio2);
        statement.setDouble(23, precioSuscripcion);
        statement.setDouble(24, precioConvenio);
        statement.setBoolean(25, ventaPresencial);
        statement.setBoolean(26, ventaOnline);
        statement.setBoolean(27, receta);
        statement.setBoolean(28, recetaRetenida);
        statement.setBoolean(29, retiroTienda);
        statement.setString(30, descripcion);
        
        statement.registerOutParameter(31, Types.VARCHAR); // Parámetro de salida
        
        statement.executeUpdate();
        
        respuesta = statement.getString(31);
        
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

    
    /*
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
    */
    public String Editar_Producto_Eliminar(String CodSKU) {
    usuarioVO usu = null;
    conexion con;
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    System.out.println("editar productos 293");
    String respuesta = "";
    con = new conexion();
    PreparedStatement ps = null;
    
    System.out.println("editar productos 304");
    try {
        cn = con.conectar();
        System.out.println("editar productos 308");
        CallableStatement statement = cn.prepareCall("{ CALL Editar_Producto_Eliminar(?, ?) }");
        statement.setString(1, CodSKU);
        
        statement.registerOutParameter(2, Types.VARCHAR); // Parámetro de salida
        
        statement.executeUpdate();
        
        respuesta = statement.getString(2);
        
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

    /*public ArrayList<String> getProductos(String codProd) {
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
    public ArrayList<String> getProductos(String codProd) {
    ArrayList<String> lista = new ArrayList<>();
    try (Connection con = new conexion().conectar();
         CallableStatement statement = con.prepareCall("{ CALL getProductos(?) }")) {
        statement.setString(1, codProd);
        try (ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                lista.add(rs.getString("nombre"));
            }
        }
        return lista;
    } catch (SQLException ex) {
        System.err.println("Error al obtener productos: " + ex.getMessage());
    } catch (Exception ex) {
        System.err.println("Error inesperado: " + ex.getMessage());
    }
    return lista;
}*/
    public ArrayList<String> getProductos(String codProd) {
    ArrayList<String> lista = new ArrayList<>();
    try (Connection con = new conexion().conectar();
         CallableStatement statement = con.prepareCall("{ CALL getProductos(?) }")) {
        statement.setString(1, codProd);
        try (ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                System.out.println("respuesta select "+rs.getString("nombre"));
                lista.add(rs.getString("nombre"));
            }
        }
    } catch (SQLException ex) {
        throw new RuntimeException("Error al obtener productos", ex);
    } catch (Exception ex) {
        throw new RuntimeException("Error inesperado", ex);
    }
    return lista;
}

    }

