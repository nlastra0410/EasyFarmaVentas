/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarma.ventas.controler;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nlast
 */
public class buscadorFarmacia extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet buscadorFarmacia</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet buscadorFarmacia at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
 private List<String> performSearch(String keyword, String category, String price) {
    // Implementa la lógica personalizada de búsqueda utilizando los parámetros recibidos

    // Aquí se muestra un ejemplo básico con 40 resultados simulados
    List<String> searchResults = new ArrayList<>();

    // Agrega 40 resultados simulados a la lista de resultados de búsqueda
    for (int i = 1; i <= 40; i++) {
        
        searchResults.add("Resultado " + i + " para " + keyword + " en la categoría " + category + " con precio " + price);
      //  System.out.println("Resultado " + i + " para " + keyword + " en la categoría " + category + " con precio " + price);
    }

    return searchResults;
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
        response.setContentType("text/html;charset=UTF-8");
        String keyword = "ejemplo";//request.getParameter("keyword");
        String category = "ejemplo 2"; //request.getParameter("category");
        String price = "preicio "; //request.getParameter("price");

        // Realiza la lógica de búsqueda utilizando los parámetros recibidos
        List<String> searchResults = performSearch(keyword, category, price);
        
        // Convierte los resultados de búsqueda a formato JSON
        String jsonResponse = new Gson().toJson(searchResults);
        System.out.println("searchResults "+jsonResponse);

        // Establece el tipo de contenido de la respuesta como JSON
        response.setContentType("application/json");

        // Envía la respuesta con los resultados de búsqueda en formato JSON
        response.getWriter().write(jsonResponse);
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
