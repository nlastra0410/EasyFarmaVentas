/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarma.ventas.controler;

import cl.easyfarma.ventas.dao.usuarioDAO;
import cl.easyfarma.ventas.vo.usuarioVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nlast
 */
public class usuarioServlets extends HttpServlet {

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

            if (accion != null) {
                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "registrar":
                        System.out.println("Reistrar "+accion);
                        String inputFirstName = null;
                        String inputLastName = null;
                        String inputEmail = null;
                        String inputPassword = null;
                        
                        inputFirstName = request.getParameter("name");
                        inputLastName = request.getParameter("lastname");
                        inputEmail = request.getParameter("email");
                        inputPassword = request.getParameter("password");
                        
                        System.out.println(inputFirstName);
                        System.out.println(inputLastName);
                        System.out.println(inputEmail);
                        System.out.println(inputPassword);
                        usuarioDAO dao;
                        
                        dao = new usuarioDAO();
                        String mensaje = dao.Agregar_Usuario(inputFirstName, inputLastName, inputEmail, inputPassword);
                        request.setAttribute("msje", "Registro con " + mensaje);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                    default:
                        response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            System.out.println("error "+e);
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }

        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet usuarioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet usuarioServlet at " + request.getContextPath() + "</h1>");
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
    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion;
        usuarioDAO dao;
        usuarioVO usuario;
        usuario = this.obtenerUsuario(request);
        dao = new usuarioDAO();
        usuario = dao.identificar(usuario);
        if (usuario != null && usuario.getNombreCargo().equals("ADMINISTRADOR")) {
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            request.setAttribute("usuario", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            HttpSession session = request.getSession();
            session.setAttribute("usuario2", usuario);
            System.out.println("usuario "+usuario.getNombreCargo());
            this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
        } else if (usuario != null && usuario.getNombreCargo().equals("VENDEDOR")) {
            sesion = request.getSession();
            sesion.setAttribute("vendedor", usuario);
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            this.getServletConfig().getServletContext().getRequestDispatcher("/dashboardVendedor.jsp").forward(request, response);
        } else {
             usuarioVO usumsj = new usuarioVO(); // Inicializar la variable usumsj
             System.out.println("USUARIO MENSAJE ");
             usumsj.setMsjusuario("Credenciales Incorrectas");
             System.out.println("USUARIO MENSAJE " + usumsj.getMsjusuario());
             request.setAttribute("msje", usumsj.getMsjusuario());
             request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

     

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", null);
        sesion.invalidate();
        response.sendRedirect("index.jsp");

    }

    private usuarioVO obtenerUsuario(HttpServletRequest request) {
        usuarioVO u = new usuarioVO();
        u.setEmail(request.getParameter("correo"));
        u.setClave(request.getParameter("password"));
        return u;
    }
}
