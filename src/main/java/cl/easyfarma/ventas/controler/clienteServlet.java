/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarma.ventas.controler;

import cl.easyfarma.ventas.dao.clienteDAO;
import cl.easyfarma.ventas.vo.clienteVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nlast
 */
public class clienteServlet extends HttpServlet {

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
                    clienteVO cli = new clienteVO();
                    // Convertir los campos numéricos a sus respectivos tipos
                    String rut = request.getParameter("rut");
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String correo = request.getParameter("correo");
                    String telefono = request.getParameter("tel");
                    String profesion = request.getParameter("profesion");
                    String direccion = request.getParameter("direccion");
                    String plus = request.getParameter("plus");

                    String mensaje = "";
                    
                    if (rut == null || nombre == null || apellido == null || correo == null || telefono == null || profesion == null || direccion == null || plus == null ) {
                        request.setAttribute("msje", "Fallo el flujo por datos nulos: ");
                        response.sendRedirect("clientes.jsp");
                    return;
                    }
                    clienteDAO cliDao = new clienteDAO();
                    mensaje = cliDao.Agregar_Cliente(rut, nombre, apellido, correo, telefono, profesion, direccion,  plus);
                    request.setAttribute("msje", "se realizo: " + mensaje);
                    String jspPath = "/clientes/clientes.jsp";
                    RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
                    dispatcher.forward(request, response);
                    //request.getRequestDispatcher("clientes.jsp").forward(request, response);
                    
                    break;
                case "actualizar":
                    clienteDAO cliE = new clienteDAO();
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
                    
                    mensajeE = cliE.Editar_Cliente(rutE, nombreE, apellidoE, correoE, telefonoE, profesionE, direccionE, plusE);
                    request.setAttribute("msje", "se realizo: " + mensajeE);
                    //request.getRequestDispatcher("modificarClientes.jsp").forward(request, response);
                    String mod = "/clientes/modificarClientes.jsp";
                    RequestDispatcher dispatcherMod = request.getRequestDispatcher(mod);
                    dispatcherMod.forward(request, response);  
                    break;
                case "eliminar":
                    clienteDAO cliEli = new clienteDAO();
                    String mensajeEli = "";
                    String rutEli = request.getParameter("rut");
                    mensajeEli = cliEli.Editar_Cliente(rutEli, "No");
                    request.setAttribute("msje", "se realizo: " + mensajeEli);
                    //request.getRequestDispatcher("eliminarCliente.jsp").forward(request, response);
                    String PathlistaEliminar = "/clientes/eliminarCliente.jsp";
                    RequestDispatcher dispatcherEL = request.getRequestDispatcher(PathlistaEliminar);
                    dispatcherEL.forward(request, response);  
                    break;
                case "listaEditar":
                    clienteDAO CliListaEdit = new clienteDAO();
                    String rutCli = request.getParameter("rut");
                    clienteVO listClientEdit = CliListaEdit.listaCliente(rutCli);
                    System.out.println("Listar Clientes ");
                    request.setAttribute("listaCli", listClientEdit);
                    //request.getRequestDispatcher("editarclientes.jsp").forward(request, response);
                    String PathlistaEditar = "/clientes/editarclientes.jsp";
                    RequestDispatcher dispatcherlE = request.getRequestDispatcher(PathlistaEditar);
                    dispatcherlE.forward(request, response);  
                    break;
                case "buscar":
                    clienteDAO cliDAO = new clienteDAO();
                    String codiProd = request.getParameter("codProd");
                    List<clienteVO> listClient = cliDAO.listaClientes(codiProd);
                    System.out.println("Listar Clientes 107");
                    request.setAttribute("listaCli", listClient);
                    if(accionEliminar.equals("eliminarPersona")){
                    String PathEliminar = "/clientes/eliminarCliente.jsp";
                    RequestDispatcher dispatcherE = request.getRequestDispatcher(PathEliminar);
                    dispatcherE.forward(request, response);   
                    //request.getRequestDispatcher("eliminarCliente.jsp").forward(request, response);   
                    }else if(accionModificar.equals("modificarPersona")){
                     System.out.println("Listar Clientes 112");
                     String PathModificar = "/clientes/modificarClientes.jsp";
                     RequestDispatcher dispatcherM = request.getRequestDispatcher(PathModificar);
                     dispatcherM.forward(request, response);  
                     //request.getRequestDispatcher("modificarClientes.jsp").forward(request, response); 
                    }else{   
                     String PathLista = "/clientes/listaClientes.jsp";
                     RequestDispatcher dispatcherL = request.getRequestDispatcher(PathLista);
                     dispatcherL.forward(request, response);     
                     request.getRequestDispatcher("listaClientes.jsp").forward(request, response);   
                    }
                    break;
                case "editar":
                    
                    break;    
               default:
            }
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(clienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet clienteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet clienteServlet at " + request.getContextPath() + "</h1>");
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
