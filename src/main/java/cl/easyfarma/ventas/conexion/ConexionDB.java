
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
       /*PRUEBA*/cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carritocomprasjsp", "root", "");
       //*Prod*/ cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/easyvent_carritocomprasjsp?noAccessToProcedureBodies=true", "easyvent_easyvent", "fRS4d.;Sm85h6Z");
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
