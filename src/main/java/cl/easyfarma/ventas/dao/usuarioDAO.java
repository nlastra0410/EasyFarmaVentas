/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.dao;

import cl.easyfarma.ventas.conexion.conexion;
import cl.easyfarma.ventas.vo.usuarioVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author nlast
 */
public class usuarioDAO {
    public usuarioVO identificar(usuarioVO user) throws Exception{
        usuarioVO usu = null;
        conexion con = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
    
        String sql = 
                "SELECT u.idusuario, u.nombreusuario, u.clave, u.idcargo, u.apellidousuario, u.email, u.estado, c.nombrecargo \n" +
"                FROM easyvent_easyfarmaventas.usuario u inner JOIN easyvent_easyfarmaventas.cargo c on u.idcargo = c.idcargo  \n" +
"		 where u.estado = 1 \n" +
"                and u.email = ? " +
"                and u.clave = ? ;";
       
        try {
        con = new conexion();
        cn = con.conectar();
        //Statement stat = cn.createStatement();
        int i = 1;
        PreparedStatement stat = cn.prepareStatement(sql);
            System.out.println("email "+user.getEmail());
            System.out.println("clave "+user.getClave());
        stat.setString(i++, user.getEmail());
        stat.setString(i++, user.getClave());
        rs = stat.executeQuery();
        while(rs.next()){
                i = 1;
                usu = new usuarioVO();
                usu.setId_usuario(rs.getInt(i++));
                usu.setNombreUsuario(rs.getString(i++));
                usu.setClave(rs.getString(i++));
                usu.setCodigoCargo(rs.getInt(i++));
                usu.setApellido(rs.getString(i++));
                usu.setEmail(rs.getString(i++));
                usu.setEstado(rs.getInt(i++));
                usu.setNombreCargo(rs.getString(i++));
        }
        
            rs.close();
            stat.close();
        }
        catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
        return usu;
    }
    
    
    public String Agregar_Usuario(String nombre, String apellido, String correo, String clave) {
    usuarioVO usu = null;
    conexion con;
    Connection cn = null;
    CallableStatement cs = null;
    String respuesta = "";
    con = new conexion();
    try {
        Integer codigoMaximo = idusuario();
        cn = con.conectar();
        cs = cn.prepareCall("{CALL sp_InsertarUsuario(?,?,?,?,?,?,?)}");

        usuarioVO registroUsuario = new usuarioVO();

        registroUsuario.setNombre(nombre);
        registroUsuario.setClave(clave);
        registroUsuario.setEstado(1);
        registroUsuario.setCodigoCargo(1);
        registroUsuario.setApellido(apellido);
        registroUsuario.setEmail(correo);
        registroUsuario.setIdEmpleado(1);
        /*`NOMBREUSUARIO`,
        `CLAVE`,
        `ESTADO`,
        `IDCARGO`,
        `APELLIDOUSUARIO`,
        `EMAIL`,
        `IDEMPLEADO`*/
        cs.setString(1, registroUsuario.getNombre());
        cs.setString(2, registroUsuario.getClave());
        cs.setInt(3, registroUsuario.getEstado());
        cs.setInt(4, registroUsuario.getCodigoCargo());
        cs.setString(5, registroUsuario.getApellido());
        cs.setString(6, registroUsuario.getEmail());
        cs.setInt(7, registroUsuario.getIdEmpleado());
        cs.executeUpdate();
        respuesta = "Éxito";
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        respuesta = "Error: " + ex.getMessage();
    } finally {
        try {
            if (cs != null) {
                cs.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (Exception ex) {
        }
    }
    return respuesta;
}

    
    public Integer idusuario() throws Exception{
        usuarioVO usu = null;
        conexion con;
        Integer codigoMaximo = 0;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "SELECT max(idusuario) AS IDUSUARIO FROM easyvent_easyfarmaventas.usuario";
        con = new conexion();
        try{
            cn = con.conectar();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                    usu = new usuarioVO();
                    usu.setId_usuario(rs.getInt(1));
                    codigoMaximo = usu.getId_usuario();
                }
        }catch(Exception e){
            System.out.println("Error" + e.getMessage());
        }finally{
            if (rs !=null && rs.isClosed() == false){
                rs.close();
            }
            rs = null;
            if(st!= null && st.isClosed() == false){
                st.close();
                
            }
            st = null;
            if(cn != null & cn.isClosed() == false){
                cn.close();
                
            }
            cn = null;
        }
        return codigoMaximo;
    }
    
}
