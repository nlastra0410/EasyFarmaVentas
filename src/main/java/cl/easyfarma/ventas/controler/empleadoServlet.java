/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarma.ventas.controler;

import cl.easyfarma.ventas.dao.empleadoDAO;
import cl.easyfarma.ventas.vo.empleadoVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nlast
 */
public class empleadoServlet extends HttpServlet {

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
         String accionEliminar = request.getParameter("accionEliminar");
         String accionModificar = request.getParameter("accionModificar");
        try {
            switch (accion) {
                case "agregar":
                    empleadoVO cli = new empleadoVO();
                    // Convertir los campos numéricos a sus respectivos tipos
                    String rut = request.getParameter("rut");
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String correo = request.getParameter("correo");
                    String telefono = request.getParameter("tel");
                    String profesion = request.getParameter("profesion");
                    String direccion = request.getParameter("direccion");
                    String mensaje = "";
                    if (rut == null || nombre == null || apellido == null || correo == null || telefono == null || profesion == null || direccion == null ) {
                        request.setAttribute("msje", "Fallo el flujo por datos nulos: ");
                        response.sendRedirect("clientes.jsp");
                    return;
                    }
                    empleadoDAO cliDao = new empleadoDAO();
                    mensaje = cliDao.Agregar_Empleado(rut, nombre, apellido, correo, telefono, profesion, direccion);
                    request.setAttribute("msje", "se realizo: " + mensaje);
                    request.getRequestDispatcher("clientes.jsp").forward(request, response);
                    
                    break;
                case "actualizar":
                    empleadoDAO cliE = new empleadoDAO();
                    // Convertir los campos numéricos a sus respectivos tipos
                    String rutE = request.getParameter("rut");
                    String nombreE = request.getParameter("nombre");
                    String apellidoE = request.getParameter("apellido");
                    String correoE = request.getParameter("correo");
                    String telefonoE = request.getParameter("tel");
                    String profesionE = request.getParameter("profesion");
                    String direccionE = request.getParameter("direccion");
                    String plusE = request.getParameter("plus");
                    String mensajeE = "";
                    if (rutE == null || nombreE == null || apellidoE == null || correoE == null || telefonoE == null || profesionE == null || direccionE == null || plusE == null ) {
                        request.setAttribute("msje", "Fallo el flujo por datos nulos: ");
                        response.sendRedirect("modificarClientes.jsp");
                    return;
                    }
                    mensajeE = cliE.Editar_Empleado(rutE, nombreE, apellidoE, correoE, telefonoE, profesionE, direccionE);
                    request.setAttribute("msje", "se realizo: " + mensajeE);
                    request.getRequestDispatcher("modificarClientes.jsp").forward(request, response);
                    break;
                case "eliminar":
                    empleadoDAO cliEli = new empleadoDAO();
                    String mensajeEli = "";
                    String rutEli = request.getParameter("rut");
                    mensajeEli = cliEli.Editar_Empleado(rutEli, "No");
                    request.setAttribute("msje", "se realizo: " + mensajeEli);
                    request.getRequestDispatcher("eliminarCliente.jsp").forward(request, response);
                    break;
                case "listaEditar":
                    empleadoDAO CliListaEdit = new empleadoDAO();
                    String rutCli = request.getParameter("rut");
                    empleadoVO listClientEdit = CliListaEdit.listaEmpleado(rutCli);
                    System.out.println("Listar Clientes ");
                    request.setAttribute("listaCli", listClientEdit);
                    request.getRequestDispatcher("editarclientes.jsp").forward(request, response);
                    break;
                case "buscar":
                    empleadoDAO cliDAO = new empleadoDAO();
                    String codiProd = request.getParameter("codProd");
                    List<empleadoVO> listClient = cliDAO.listaEmpleados(codiProd);
                    System.out.println("Listar Clientes 107");
                    request.setAttribute("listaCli", listClient);
                    if(accionEliminar.equals("eliminarPersona")){
                     request.getRequestDispatcher("eliminarCliente.jsp").forward(request, response);   
                    }else if(accionModificar.equals("modificarPersona")){
                        System.out.println("Listar Clientes 112");
                     request.getRequestDispatcher("modificarClientes.jsp").forward(request, response); 
                    }else{    
                     request.getRequestDispatcher("listaClientes.jsp").forward(request, response);   
                    }
                    break;
                case "editar":
                    
                    break;    
               default:
            }
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(empleadoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet empleadoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet empleadoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
