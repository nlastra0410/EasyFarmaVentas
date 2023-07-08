
package cl.easyfarma.ventas.conexion;


//Importamos la libreria necesaria para la conexión
import java.sql.*;

public class ConexionDB {
    
    //Creamos el metodo que permite la conexion a la DB
    public static Connection getConexion(){
        Connection cn = null;
        try{
            //Cargamos el driver MYSQL
            //El Driver se encuentra en la carpeta de "Programación" de U Sexto semestre, archivo tipo JAR
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carritocomprasjsp", "root", "");
            System.out.println("Conexion Satisfactoria :)");
                    
        }catch(Exception e){
            System.out.println("Error de Conexión"+e);
        }
        return cn; 
    }
    
    
    
    public static void main(String[] args) {
        getConexion();
    }
    
}
