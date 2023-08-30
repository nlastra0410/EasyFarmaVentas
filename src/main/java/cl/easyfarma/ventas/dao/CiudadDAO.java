package cl.easyfarma.ventas.dao;

import cl.easyfarma.ventas.conexion.conexion;
import cl.easyfarma.ventas.vo.ciudad;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CiudadDAO {
     

    public List<ciudad> obtenerCiudades() {
        List<ciudad> ciudades = new ArrayList<>();
        conexion con;
        Connection cn = null;
        con = new conexion();
        try {
            cn = con.conectar();
            String query = "SELECT * FROM `easyvent_easyfarmaventas`.`ciudad`; ";
             
                Statement statement = cn.createStatement();
                ResultSet resultSet = statement.executeQuery(query);
                while (resultSet.next()) {
                    ciudad ciudad = new ciudad();
                    ciudad.setNombre(resultSet.getString("CIUDAD"));
                     
                    ciudades.add(ciudad);
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ciudades;
    }
    
    public List<ciudad> obtenerProvincias() {
        List<ciudad> ciudades = new ArrayList<>();
        conexion con;
        Connection cn = null;
        con = new conexion();
        try {
            cn = con.conectar();
            String query = "SELECT * FROM `easyvent_easyfarmaventas`.`ciudad`; ";
             
                Statement statement = cn.createStatement();
                ResultSet resultSet = statement.executeQuery(query);
                while (resultSet.next()) {
                    ciudad ciudad = new ciudad();
                     
                    ciudad.setProvincia(resultSet.getString("PROVINCIA"));
                     
                    ciudades.add(ciudad);
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ciudades;
    }
    
    public List<ciudad> obtenerRegiones() {
        List<ciudad> ciudades = new ArrayList<>();
        conexion con;
        Connection cn = null;
        con = new conexion();
        try {
            cn = con.conectar();
            String query = "SELECT * FROM `easyvent_easyfarmaventas`.`ciudad`; ";
             
                Statement statement = cn.createStatement();
                ResultSet resultSet = statement.executeQuery(query);
                while (resultSet.next()) {
                    ciudad ciudad = new ciudad();
                     
                    ciudad.setRegion(resultSet.getString("REGION"));
                    ciudades.add(ciudad);
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ciudades;
    }
}
