/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarmaventas.dao;

import cl.easyfarmaventas.conexion.conexion;
import cl.easyfarmaventas.vo.usuarioVO;
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
"                FROM \"easyfarmaVentas\".usuario u inner JOIN \"easyfarmaVentas\".cargo c on u.idcargo = c.idcargo  \n" +
"		 where u.estado = 1 \n" +
"                and u.email = ? " +
"                and u.clave = ? ;";
       
        try {
        con = new conexion();
        cn = con.conectar();
        //Statement stat = cn.createStatement();
        int i = 1;
        PreparedStatement stat = cn.prepareStatement(sql);
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
    
    
    public String Agregar_Usuario(String nombre, String apellido, String correo, String clave){
        usuarioVO usu = null;
        conexion con;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "INSERT INTO usuario (idusuario, nombreusuario, apellidousuario, email, clave, estado, idcargo) VALUES (?,?,?,?,?,?,?);";
        String respuesta = "";
        con = new conexion();
        PreparedStatement ps = null;
        try{
            Integer codigoMaximo = idusuario();
            cn = con.conectar();
            st = cn.createStatement();
            ps = cn.prepareStatement(sql);
            
            System.out.println("inputFirstName "+nombre);
            System.out.println("143inputLastName "+apellido);
            System.out.println("inputEmail "+correo);
            System.out.println("inputPassword "+clave);
            
            usuarioVO registroUsuario = new usuarioVO();
            
            registroUsuario.setId_usuario((codigoMaximo+1));
            registroUsuario.setNombre(nombre);
            registroUsuario.setApellido(apellido);
            registroUsuario.setNombreUsuario(correo);
            registroUsuario.setClave(clave);
            registroUsuario.setEstado(1);
            registroUsuario.setCodigoCargo(2);
            System.out.println("registraaaao nombre "+registroUsuario.getId_usuario());
            System.out.println("registro nombre "+registroUsuario.getApellido());
            System.out.println("registro nombre "+registroUsuario.getNombre());
            System.out.println("registro nombre "+registroUsuario.getNombreUsuario());
            System.out.println("registro nombre "+registroUsuario.getClave());
            System.out.println("registro nombre "+registroUsuario.getEstado());
            System.out.println("registro nombre "+registroUsuario.getCodigoCargo());
            // registroUsuario.setImagen(inputStream);
            
            
            ps.setInt(1,registroUsuario.getId_usuario());
            ps.setString(2, registroUsuario.getNombreUsuario());
            ps.setString(3, registroUsuario.getApellido());
            ps.setString(4, registroUsuario.getEmail());
            ps.setString(5, registroUsuario.getClave());
            ps.setInt(6, registroUsuario.getEstado());
            ps.setInt(7, registroUsuario.getCodigoCargo());
            ps.executeUpdate();
            respuesta = "Exito ";
        }catch(SQLException ex){
            System.out.println("A "+ex.getMessage());
            respuesta = "Error "+ex.getMessage();
        }catch(Exception ex){
            System.out.println("B "+ex.getMessage());
            respuesta = "Error "+ex.getMessage();
        }finally{
            try{
                ps.close();
                cn.close();
            }catch(Exception ex){}
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
        String sql = "SELECT max(idusuario) AS IDUSUARIO FROM bdsys.usuario";
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
