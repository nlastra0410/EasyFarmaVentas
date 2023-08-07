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
import javax.servlet.RequestDispatcher;
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
                    String sexo = request.getParameter("Sexo");
                    String fechaNacimiento = request.getParameter("fechaNacimiento");
                    
                    String mensaje = "";
                    if (rut == null || nombre == null || apellido == null || correo == null || telefono == null || profesion == null || direccion == null ) {
                        request.setAttribute("msje", "Fallo el flujo por datos nulos: ");
                        response.sendRedirect("clientes.jsp");
                    return;
                    }
                    
                    String rutCompleto = rut;
                    // Dividir el RUT en cuerpo y dígito verificador
                    String[] partes = rutCompleto.split("-");
                    int cuerpoRut = Integer.parseInt(partes[0]);
                    String digitoVerificador = partes[1];
                    System.out.println("Cuerpo del RUT: " + cuerpoRut);
                    System.out.println("Dígito verificador: " + digitoVerificador);
                    empleadoDAO cliDao = new empleadoDAO();
                    /*
                    String nombre, ok
                    String apellido, ok
                    String sexo, no
                    String telefono, ok 
                    String fechaNacimiento, no 
                    String tipoDocumento, no
                    String numeroDocumento, no
                    int idUsuario, 
                    String empleadoActivo, 
                    int rut, 
                    String email, 
                    String dv, 
                    String profesion*/
                    mensaje = cliDao.AgregarEmpleado(nombre, apellido, sexo, telefono, fechaNacimiento, "0", "0", "Si", cuerpoRut, correo, digitoVerificador, profesion); 
                    request.setAttribute("msje", "se realizo: " + mensaje);
                    //request.getRequestDispatcher("clientes.jsp").forward(request, response);
                    String jspPath = "/empleados/empleados.jsp";
                    //response.sendRedirect(request.getContextPath() + jspPath);
                    RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
                    dispatcher.forward(request, response);
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
                    if (accionEliminar.equals("eliminarPersona")) {
                        jspPath = "/empleados/eliminarEmpleados.jsp";
                        dispatcher = request.getRequestDispatcher(jspPath);
                        dispatcher.forward(request, response);
                    } else if (accionModificar.equals("modificarPersona")) {
                        System.out.println("Listar Clientes 112");
                        jspPath = "/empleados/listaEmpleados.jsp";
                        dispatcher = request.getRequestDispatcher(jspPath);
                        dispatcher.forward(request, response);
                        // No es necesario despachar la solicitud nuevamente a "modificarClientes.jsp"
                        // request.getRequestDispatcher("modificarClientes.jsp").forward(request, response); 
                    } else {
                        empleadoDAO cliDAO = new empleadoDAO();
                        String codiProd = request.getParameter("codProd");
                        System.out.println("Listar Clientes 132 "+codiProd);
                        List<empleadoVO> listClient = cliDAO.listaEmpleados(codiProd);
                        for(empleadoVO p : listClient){
                            System.out.println("a1 " + p.getRUT());
                            System.out.println("a2 " + p.getDV());
                            System.out.println("a3 " + p.getNOMBRE());
                            System.out.println("a4 " + p.getAPELLIDOS());
                            System.out.println("a6 " + p.getEMAIL());
                            System.out.println("a7 " + p.getTELEFONO());
                            System.out.println("a8 " + p.getPROFESION());
                            System.out.println("a9 " + p.getEMPLEADOACTIVO());
                        }
                       
                        System.out.println("Listar Clientes 133");
                        request.setAttribute("listaCli", listClient);
                        System.out.println("Listar Clientes 149");
                        jspPath = "/empleados/listaEmpleados.jsp";
                        dispatcher = request.getRequestDispatcher(jspPath);
                        dispatcher.forward(request, response);
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
