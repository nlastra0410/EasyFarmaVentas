/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarmaventas.conexion;

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
            // Conexión a la base de datos
            //jdbc:mysql://localhost:3306/tu_basedatos";
            //"jdbc:postgresql://localhost:5432/easyfarmaVentas";
           // String url = "jdbc:mysql://localhost:3306/easyfarmaventas";
            //sitio web hosting easyvent_easyfarmaventas
            String url = "jdbc:mysql://localhost:3306/easyvent_easyfarmaventas";
            String usuario = "easyvent";
            //String contraseña = "";
            String contraseña = "fRS4d.;Sm85h6Z";
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
