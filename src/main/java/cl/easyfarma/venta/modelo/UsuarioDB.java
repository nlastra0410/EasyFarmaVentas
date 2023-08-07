
package cl.easyfarma.venta.modelo;

import cl.easyfarma.ventas.conexion.ConexionDB;
import java.sql.CallableStatement;
import java.sql.ResultSet;


public class UsuarioDB {
    
    public int obtenerUsuario(String user, String pass){
        int nivel = 0;
        String sql = "SELECT nivel FROM login WHERE usuario='"+user+"'and contra='"+pass+"'";
        try{
            CallableStatement cl = ConexionDB.getConexion().prepareCall(sql);
            ResultSet rs = cl.executeQuery();
            while(rs.next()){
                nivel = rs.getInt(1);
            }
        }catch(Exception e){
            System.out.println("Error al encontrar el usuario: "+e);
        }
        return nivel;
    }
    
    
}
