/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarma.venta.controladorVenta;

import cl.easyfarma.ventas.dao.Ventas;
import cl.easyfarma.ventas.vo.DatosVenta;
import cl.easyfarma.ventas.vo.JsonResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nlast
 */
public class ventas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
                Ventas vent = new Ventas();
        
        // Leer el cuerpo de la solicitud para obtener los datos enviados desde la página
                BufferedReader reader = request.getReader();
                StringBuilder stringBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    stringBuilder.append(line);
                }
                String jsonBody = stringBuilder.toString();

                // Procesar los datos JSON recibidos convirtiéndolos a objetos Java
                Gson gson = new Gson();
                DatosVenta datosVenta = gson.fromJson(jsonBody, DatosVenta.class);

                // Ahora puedes acceder a los datos como atributos del objeto Java
                String rutPlus = datosVenta.getRutPlus();
                String nombre = datosVenta.getNombre();
                Integer p1 = datosVenta.getP1();
                Integer p2 = datosVenta.getP2();
                Integer cantidad = datosVenta.getCantidad();
                Integer totalFinal = datosVenta.getTotalFinal();
                Integer totalFinalEasy = datosVenta.getTotalFinalEasy();
                Integer descuento = datosVenta.getDescuento();
                String correo = datosVenta.getCorreo();
                String tipoDoc = datosVenta.getTipoDoc();
                String numeroDoc = datosVenta.getNumeroDoc();
                String proveedor = datosVenta.getProveedor();
                String usuario = datosVenta.getUsuario();
                String sku = datosVenta.getSku();
                int folio = datosVenta.getFolio();
                
                System.out.println("rutPlus: " + rutPlus);
                System.out.println("nombre: " + nombre);
                System.out.println("p1: " + p1);
                System.out.println("p2: " + p2);
                System.out.println("cantidad: " + cantidad);
                System.out.println("totalFinal: " + totalFinal);
                System.out.println("totalFinalEasy: " + totalFinalEasy);
                System.out.println("descuento: " + descuento);
                System.out.println("correo: " + correo);
                System.out.println("tipoDoc: " + tipoDoc);
                System.out.println("numeroDoc: " + numeroDoc);
                System.out.println("proveedor: " + proveedor);
                System.out.println("usuario: " + usuario);
                System.out.println("sku: " + sku);
                
                //String rutPlus, String nombre, Integer p1, Integer p2, Integer cantidad, Integer totalFinal, Integer totalFinalEasy, Integer descuento, String correo, String tipoDoc, String numeroDoc
                String mensaje = vent.guardarVenta(rutPlus, 
                                                    nombre, 
                                                    p1, 
                                                    p2, 
                                                    cantidad, 
                                                    totalFinal, 
                                                    totalFinalEasy, 
                                                    descuento, 
                                                    correo, 
                                                    tipoDoc, 
                                                    numeroDoc, 
                                                    proveedor, 
                                                    usuario, 
                                                    sku, 
                                                    folio);
                System.out.println("cantidad XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXSS");
                // Simular una respuesta con un objeto Java y convertirlo a JSON usando Gson
                //Gson gson = new Gson();
                // Crear un objeto JSON de respuesta
                String respuesta = mensaje;
                 
                // Realizar el split utilizando el guión (-) como separador
                String[] partesRespuesta = respuesta.split("-");

                // Acceder a las partes individuales
                String success = partesRespuesta[0].trim();
                String numerodocumento = partesRespuesta[1].trim();
                String tipodocumento = partesRespuesta[2].trim();
                String mensajeFinal = partesRespuesta[3].trim();
                
                System.out.println("success "+success);
                System.out.println("numerodocumento "+numerodocumento);
                System.out.println("tipodocumento "+tipodocumento);
                System.out.println("mensajeFinal "+mensajeFinal);
                
                JsonResponse jsonResponse = new JsonResponse(success, numerodocumento, tipodocumento, mensajeFinal);
                String json = new Gson().toJson(jsonResponse);
                // Escribir la respuesta JSON en el cuerpo de la respuesta
                // Responder con el objeto JSON
                response.setContentType("application/json");
                response.getWriter().write(json);
        
        
        }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
