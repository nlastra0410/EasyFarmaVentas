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
            Class.forName("org.postgresql.Driver");
            // Conexión a la base de datos
            String url = "jdbc:postgresql://localhost:5432/easyfarmaVentas";
            String usuario = "postgres";
            String contraseña = "1234";
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
