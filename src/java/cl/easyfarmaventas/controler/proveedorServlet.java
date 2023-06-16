/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarmaventas.controler;

import cl.easyfarmaventas.dao.proveedorDAO;
import cl.easyfarmaventas.vo.proveedorVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nlast
 */
public class proveedorServlet extends HttpServlet {

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
         String accion = request.getParameter("accion");
                
        try {
            switch (accion) {
                case "agregar":
                    proveedorVO cli = new proveedorVO();
                    // Convertir los campos numéricos a sus respectivos tipos
                    System.out.println("Listar proveedor 44");
                    String rut = request.getParameter("rut");
                    String nombres = request.getParameter("Nombres");
                    String correo = request.getParameter("Correo");
                    String telefono = request.getParameter("Telefono");
                    String nacionalidad = request.getParameter("nac");
                    String direccion = request.getParameter("direccion");
                    
                    String mensaje = "";
                    System.out.println("Listar proveedor 53");
                    if (rut == null || nombres == null || correo == null || telefono == null || nacionalidad == null || direccion == null ) {
                        request.setAttribute("msje", "Fallo el flujo por datos nulos: ");
                        response.sendRedirect("agregarProveedores.jsp");
                    return;
                    }
                    
                    proveedorDAO proveedorDao = new proveedorDAO();
                    mensaje = proveedorDao.Agregar_Proveedor(rut, nombres, correo, telefono, nacionalidad, direccion);
                    System.out.println("Listar proveedor 62: "+mensaje);
                    request.setAttribute("msje", "se realizo: " + mensaje);
                    request.getRequestDispatcher("agregarProveedores.jsp").forward(request, response);
                    
                    break;
                case "actualizar":
                    proveedorVO prov = new proveedorVO();
                    // Convertir los campos numéricos a sus respectivos tipos
                    String rutE = request.getParameter("rut");
                    String nombresE = request.getParameter("Nombres");
                    String correoE = request.getParameter("Correo");
                    String telefonoE = request.getParameter("Telefono");
                    String nacionalidadE = request.getParameter("nac");
                    String direccionE = request.getParameter("direccion");

                    String mensajeE = "";
                    
                     if (rutE == null || nombresE == null || correoE == null || telefonoE == null || nacionalidadE == null || direccionE == null ) {
                        request.setAttribute("msje", "Fallo el flujo por datos nulos: ");
                        response.sendRedirect("agregarProveedores.jsp");
                    return;
                    }
                    proveedorDAO provDAO = new proveedorDAO();
                    mensajeE = provDAO.Editar_Proveedor(rutE, nombresE, correoE, telefonoE, nacionalidadE, direccionE);
                    request.setAttribute("msje", "se realizo: " + mensajeE);
                    request.getRequestDispatcher("agregarProveedores.jsp").forward(request, response);
                    break;
                case "eliminar":
                    proveedorDAO proEli = new proveedorDAO();
                    String mensajeEli = "";
                    String rutEli = request.getParameter("rut");
                    mensajeEli = proEli.Editar_Proveedor(rutEli);
                    request.setAttribute("msje", "se realizo: " + mensajeEli);
                    request.getRequestDispatcher("eliminarProveedor.jsp").forward(request, response);
                    break;
                 
               default:
            }
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(productoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
