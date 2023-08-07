
package cl.easyfarma.venta.modelo;

import java.sql.*;
import java.util.*;
import cl.easyfarma.ventas.conexion.ConexionDB;
import cl.easyfarma.ventas.conexion.conexion;



public class ProductoDB {
    //Metodo que permite traer todos los productos
    public static ArrayList<Productos> obtenerProductos(){
        ArrayList<Productos> lista = new ArrayList<>();
        Connection cn = ConexionDB.getConexion();
        //Esto es para llamar a los procedimientos almacenados
        try{
            CallableStatement csta = cn.prepareCall("{call listar_producto()}");
            ResultSet rs = csta.executeQuery();
            while (rs.next()){
                Productos p = new Productos(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7),rs.getString(8));
                lista.add(p);
            }
        }catch(SQLException e){
            System.out.println("Error al traer los productos: "+e);
        }
        return lista;
    }
    
     

    
    
public ArrayList<Productos> getProductos(String codProd) {
    ArrayList<Productos> lista = new ArrayList<>();
    try (Connection cn = ConexionDB.getConexion();
         CallableStatement statement = cn.prepareCall("{ CALL listar_producto(?) }")) {
        statement.setString(1, codProd);
        try (ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                
                while (rs.next()){
                Productos p = new Productos(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7),rs.getString(8));
                lista.add(p);
                }
            }
        }
    } catch (SQLException ex) {
        throw new RuntimeException("Error al obtener productos", ex);
    } catch (Exception ex) {
        throw new RuntimeException("Error inesperado", ex);
    }
    return lista;
}
    //Metodo que permite insertar productos a la base de datos
    public static boolean insertarProducto(Productos pro){
        boolean rpta = false;
        Connection cn = null;
        CallableStatement csta = null;
        cn = ConexionDB.getConexion();
        try{
            csta = cn.prepareCall("{call insertar_producto (?,?,?,?)}");
            csta.registerOutParameter(1, Types.INTEGER);
            csta.setString(2, pro.getNombre());
            csta.setInt(3, pro.getPrecio());
            csta.setString(4, pro.getImagen());
            int i = csta.executeUpdate();
            System.out.println(i);
            if (i == 1){
                rpta=true;
            }else{
                rpta=false;
            }
        }catch(Exception e){
            System.out.println("Error al insertar el producto: "+e);
        }
        return rpta;
        
    }
    
    //Metodo que permite actualizar un producto de la base de datos
    
    //Creamos el metodo que nos permitirá mostrar un producto al dar clic en "Añadir"
    
    public static Productos obtenerProducto(int codigo){
        Productos p = null;
        try{
            CallableStatement cl = ConexionDB.getConexion().prepareCall("{CALL sp_ProductoCod(?)}");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()){
                p = new Productos(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6)
                        ,rs.getString(7),rs.getString(8));
            }
            
        }catch(Exception e){
            System.out.println("Error al traer el producto: "+e);
        }
        return p;
        
    }
    
}
