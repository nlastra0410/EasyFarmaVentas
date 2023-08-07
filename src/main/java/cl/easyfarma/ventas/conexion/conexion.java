/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nlast
 */
public class conexion {

  public Connection conectar() {
        Connection connection = null;
        try {
            // Cargar el controlador JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            //String url = "jdbc:mysql://localhost:3306/easyfarmaventas";
            //sitio web hosting easyvent_easyfarmaventas
            String url = "jdbc:mysql://localhost:3306/easyvent_easyfarmaventas";
            //String url = "jdbc:mysql://localhost:3306/easyvent_easyfarmaventas?noAccessToProcedureBodies=true";
            //String usuario = "easyvent_easyvent";
            //String contraseña = "fRS4d.;Sm85h6Z";
            String usuario = "root";
            String contraseña = "";
            connection = DriverManager.getConnection(url, usuario, contraseña);
             if(connection != null){
                System.out.println("conexion es correcta");
            }else{
                System.out.println("conexion erronea");
        }
        } catch (SQLException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }
}
