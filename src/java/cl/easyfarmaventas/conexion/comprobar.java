/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarmaventas.conexion;

/**
 *
 * @author nlast
 */
public class comprobar {
    public comprobar(){
    conexion c = new conexion();
        if(c.conectar()!= null){
            System.out.println("conexion es correcta");
        }else{
            System.out.println("conexion erronea");
        }
    }
}
