/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarmaventas.controler;

import cl.easyfarmaventas.dao.productoDAO;
import cl.easyfarmaventas.vo.productoVO;
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
public class productoServlet extends HttpServlet {

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
                    String accionEdit = request.getParameter("accionEdit");
                    System.out.println("accion " + request.getParameter("accion"));
                    System.out.println("accionEdit " + request.getParameter("accionEdit"));
                    String CodSKU = request.getParameter("CodSKU");
                    String nombreProd = request.getParameter("nombreProd");
                    String PrincipioActivo = request.getParameter("PrincipioActivo");
                    String Contenido = request.getParameter("Contenido");
                    String Usos = request.getParameter("Usos");
                    String Contraindicaciones = request.getParameter("Contraindicaciones");
                    String Departamento = request.getParameter("Departamento");
                    String EscribirAqui = request.getParameter("EscribiraquiDesc");
                    String CantidadStr = request.getParameter("Cantidad");
                    String MinimoStr = request.getParameter("Minimo");
                    String MaximoStr = request.getParameter("Maximo");
                    String Sucursal = request.getParameter("Sucursal");
                    String EscribirAquiDesc = request.getParameter("EscribirAquiDesc");
                    String precioCompraStr = request.getParameter("precioCompra");
                    String ivaStr = request.getParameter("iva");
                    String impuesto2Str = request.getParameter("impuesto2");
                    String impuesto3Str = request.getParameter("impuesto3");
                    String margenStr = request.getParameter("margen");
                    String descuentoStr = request.getParameter("descuento");
                    String precioSugeridoStr = request.getParameter("precioSugerido");
                    String precio1Str = request.getParameter("precio1");
                    String precio2Str = request.getParameter("precio2");
                    String precioSuscripcionStr = request.getParameter("precioSuscripcion");
                    String precioConvenioStr = request.getParameter("precioConvenio");
                    String ventaPresencialStr = request.getParameter("ventaPresencial");
                    String ventaOnlineStr = request.getParameter("ventaOnline");
                    String recetaStr = request.getParameter("receta");
                    String recetaRetenidaStr = request.getParameter("recetaRetenida");
                    String retiroTiendaStr = request.getParameter("retiroTienda");
                    String descripcion = request.getParameter("Descripcion");

                   // System.out.println("89 " + request.getParameter("ventaPresencial"));
                   
                    // Validación de campos nulos
                    /* if (CodSKU == null || nombreProd == null || PrincipioActivo == null || Contenido == null || Usos == null
                || Contraindicaciones == null || Departamento == null || EscribirAqui == null || CantidadStr == null
                || MinimoStr == null || MaximoStr == null || Sucursal == null || EscribirAquiDesc == null
                || precioCompraStr == null || ivaStr == null || impuesto2Str == null || impuesto3Str == null
                || margenStr == null || descuentoStr == null || precioSugeridoStr == null || precio1Str == null
                || precio2Str == null || precioSuscripcionStr == null || precioConvenioStr == null
                || ventaPresencialStr == null || ventaOnlineStr == null || recetaStr == null
                || recetaRetenidaStr == null || retiroTiendaStr == null) {
            response.sendRedirect("error.jsp");
            return;
        }*/
                    // Convertir los campos numéricos a sus respectivos tipos
                    Integer Cantidad = Integer.parseInt(CantidadStr);
                    Integer Minimo = Integer.parseInt(MinimoStr);
                    Integer Maximo = Integer.parseInt(MaximoStr);
                    Double precioCompra = Double.parseDouble(precioCompraStr);
                    Double iva = Double.parseDouble(ivaStr);
                    Double impuesto2 = Double.parseDouble(impuesto2Str);
                    Double impuesto3 = Double.parseDouble(impuesto3Str);
                    Double margen = Double.parseDouble(margenStr);
                    Double descuento = Double.parseDouble(descuentoStr);
                    Double precioSugerido = Double.parseDouble(precioSugeridoStr);
                    Double precio1 = Double.parseDouble(precio1Str);
                    Double precio2 = Double.parseDouble(precio2Str);
                    Double precioSuscripcion = Double.parseDouble(precioSuscripcionStr);
                    Double precioConvenio = Double.parseDouble(precioConvenioStr);
                    Boolean ventaPresencial = Boolean.parseBoolean(ventaPresencialStr);
                    Boolean ventaOnline = Boolean.parseBoolean(ventaOnlineStr);
                    Boolean receta = Boolean.parseBoolean(recetaStr);
                    Boolean recetaRetenida = Boolean.parseBoolean(recetaRetenidaStr);
                    Boolean retiroTienda = Boolean.parseBoolean(retiroTiendaStr);

                    productoDAO producto = new productoDAO();
                    String mensaje = "";
                    if(accion.equals("agregar2")){
                        mensaje = producto.Agregar_Producto(CodSKU, nombreProd, PrincipioActivo, Contenido, Usos, Contraindicaciones, Departamento, EscribirAqui, Cantidad, Minimo, Maximo, Sucursal, EscribirAquiDesc, precioCompra, iva, impuesto2, impuesto3, margen, descuento, precioSugerido, precio1, precio2, precioSuscripcion, precioConvenio, ventaPresencial, ventaOnline, receta, recetaRetenida, retiroTienda, descripcion);
                        request.setAttribute("msje", "se realizo: " + mensaje);
                        request.getRequestDispatcher("productos.jsp").forward(request, response);
                    }else if(accionEdit.equals("editar")){
                        System.out.println("editar productos 118");
                        mensaje = producto.Editar_Producto(CodSKU, nombreProd, PrincipioActivo, Contenido, Usos, Contraindicaciones, Departamento, EscribirAqui, Cantidad, Minimo, Maximo, Sucursal, EscribirAquiDesc, precioCompra, iva, impuesto2, impuesto3, margen, descuento, precioSugerido, precio1, precio2, precioSuscripcion, precioConvenio, ventaPresencial, ventaOnline, receta, recetaRetenida, retiroTienda, descripcion);
                        request.setAttribute("msje", "se realizo: " + mensaje);
                        String SKU = request.getParameter("SKU");
                        productoDAO editarProd = new productoDAO();
                        System.out.println("SKU "+ SKU);
                        System.out.println("1 editar productos ");
                        productoVO editarProductos = editarProd.listarProductosEdit(SKU);
                        System.out.println("2 editar productos ");
                        request.setAttribute("productoEdit", editarProductos);
                        request.getRequestDispatcher("editproductos.jsp").forward(request, response);
                    }
                    
                    break;
                case "actualizar":
                    productoDAO productoDAO1 = new productoDAO();
                    System.out.println("listar productos ");
                    String codProd = request.getParameter("codProd");
                    List<productoVO> listaProducto1 = productoDAO1.listarProductos(codProd);
                    System.out.println("Listar productos ");
                    request.setAttribute("listaProd", listaProducto1);
                    request.getRequestDispatcher("listaProductos.jsp").forward(request, response);
                    break;
                case "eliminar":
                    productoDAO productoDAO2 = new productoDAO();
                    System.out.println("listar productos ");
                    String codiProd = request.getParameter("codProd");
                    String SKU2 = request.getParameter("SKU");
                    productoDAO editarProd2 = new productoDAO();
                    System.out.println("SKU "+ SKU2);
                    System.out.println("1 editar productos ");
                    String mensajeE = editarProd2.Editar_Producto_Eliminar(SKU2);
                    List<productoVO> listaProducto2 = productoDAO2.listarProductos(codiProd);
                    System.out.println("Listar productos eliminar");
                    request.setAttribute("msje", "se realizo: " + mensajeE);
                    request.setAttribute("listaProd", listaProducto2);
                    request.getRequestDispatcher("eliminarProductos.jsp").forward(request, response);
                    break;
                case "buscar":
                    productoDAO productoDAO3 = new productoDAO();
                    System.out.println("listar productos ");
                    String codiProd3 = request.getParameter("codProd");
                    List<productoVO> listaProducto3 = productoDAO3.listarProductos(codiProd3);
                    System.out.println("Listar productos ");
                    request.setAttribute("listaProd", listaProducto3);
                    request.getRequestDispatcher("buscarProductos.jsp").forward(request, response);
                case "editar":
                    String accionEd = request.getParameter("accionEdit");
                    System.out.println("accion " + request.getParameter("accion"));
                    System.out.println("accion2 " + request.getParameter("accionEdit"));
                    productoDAO editarProd = new productoDAO();
                    String SKU = request.getParameter("SKU");
                    System.out.println("SKU "+ SKU);
                    System.out.println("1 editar productos ");
                    productoVO editarProductos = editarProd.listarProductosEdit(SKU);
                    System.out.println("2 editar productos ");
                    request.setAttribute("productoEdit", editarProductos);
                    request.getRequestDispatcher("editproductos.jsp").forward(request, response);
                    break;    
               default:
            }
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(productoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet productoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productoServlet at " + request.getContextPath() + "</h1>");
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
