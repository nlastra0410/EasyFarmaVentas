/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.easyfarma.ventas.controler;

import cl.easyfarma.ventas.dao.productoDAO;
import cl.easyfarma.ventas.vo.productoVO;
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
                    
                    System.out.println("accion " + request.getParameter("CodSKU"));
                    System.out.println("NOMBREPROD " + request.getParameter("nombreProd"));
                    System.out.println("PRINCIPIOACTIVO " + request.getParameter("PrincipioActivo"));
                    System.out.println("CONTENIDO " + request.getParameter("Contenido"));
                    System.out.println("USOS " + request.getParameter("Usos"));
                    System.out.println("Contraindicaciones " + request.getParameter("Contraindicaciones"));
                    System.out.println("Departamento " + request.getParameter("Departamento"));
                    System.out.println("EscribiraquiDesc " + request.getParameter("EscribiraquiDesc"));
                    System.out.println("Cantidad " + request.getParameter("Cantidad"));
                    System.out.println("Minimo " + request.getParameter("Minimo"));
                    System.out.println("Maximo " + request.getParameter("Maximo"));
                    System.out.println("Sucursal " + request.getParameter("Sucursal"));
                    System.out.println("EscribiraquiDesc " + request.getParameter("EscribirAquiDesc"));
                    System.out.println("PRECIOCOMPRA" + request.getParameter("precioCompra"));
                    System.out.println("IVA " + request.getParameter("iva"));
                    System.out.println("IMPUESTO2 " + request.getParameter("impuesto2"));
                    System.out.println("IMPUESTO3 " + request.getParameter("impuesto3"));
                    System.out.println("MARGEN " + request.getParameter("margen"));
                    System.out.println("DESCUENTO " + request.getParameter("descuento"));
                    System.out.println("PRECIOSUGERIDO " + request.getParameter("precioSugerido"));
                    System.out.println("PRECIO1 " + request.getParameter("precio1"));
                    System.out.println("PRECIO2 " + request.getParameter("precio2"));
                    System.out.println("PRECIOSUSCRIPCION " + request.getParameter("precioSuscripcion"));
                    System.out.println("PRECIOCONVENIO " + request.getParameter("precioConvenio"));
                    System.out.println("VENTAPRESENCIAL " + request.getParameter("ventaPresencial"));
                    System.out.println("VENTAONLINE " + request.getParameter("ventaOnline"));
                    System.out.println("RECETA " + request.getParameter("receta"));
                    System.out.println("RECETARETENIDA " + request.getParameter("recetaRetenida"));
                    System.out.println("RETIROTIENDA " + request.getParameter("retiroTienda"));
                    System.out.println("DESCRIPCION " + request.getParameter("Descripcion"));
                    Boolean ventaPresencial = false;
                    Boolean ventaOnline = false;
                    Boolean receta = false;
                    Boolean recetaRetenida = false;
                    Boolean retiroTienda = false;
                    Integer Cantidad = 0;
                    Integer Minimo = 0;
                    Integer Maximo = 0;
                    Double precioCompra = 0.0;
                    Double iva = 0.0;
                    Double impuesto2 = 0.0;
                    Double impuesto3 = 0.0;
                    Double margen = 0.0;
                    Double descuento = 0.0;
                    Double precioSugerido = 0.0;
                    Double precio1 = 0.0;
                    Double precio2 = 0.0;
                    Double precioSuscripcion = 0.0;
                    Double precioConvenio = 0.0;

                    if (CantidadStr == null || MinimoStr == null || MaximoStr == null || precioCompraStr == null || ivaStr == null ||
                        impuesto2Str == null || impuesto3Str == null || margenStr == null || descuentoStr == null ||
                        precioSugeridoStr == null || precio1Str == null || precio2Str == null || precioSuscripcionStr == null ||
                        precioConvenioStr == null || ventaPresencialStr == null || ventaOnlineStr == null || recetaStr == null ||
                        recetaRetenidaStr == null || retiroTiendaStr == null) {
                        // Redirigir al usuario a un JSP que muestre un mensaje de error o realice alguna acción adecuada
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    } else {
                        Cantidad = Integer.parseInt(CantidadStr);
                        Minimo = Integer.parseInt(MinimoStr);
                        Maximo = Integer.parseInt(MaximoStr);
                        precioCompra = Double.parseDouble(precioCompraStr);
                        iva = Double.parseDouble(ivaStr);
                        impuesto2 = Double.parseDouble(impuesto2Str);
                        impuesto3 = Double.parseDouble(impuesto3Str);
                        margen = Double.parseDouble(margenStr);
                        descuento = Double.parseDouble(descuentoStr);
                        precioSugerido = Double.parseDouble(precioSugeridoStr);
                        precio1 = Double.parseDouble(precio1Str);
                        precio2 = Double.parseDouble(precio2Str);
                        precioSuscripcion = Double.parseDouble(precioSuscripcionStr);
                        precioConvenio = Double.parseDouble(precioConvenioStr);
                        ventaPresencial = Boolean.parseBoolean(ventaPresencialStr);
                        ventaOnline = Boolean.parseBoolean(ventaOnlineStr);
                        receta = Boolean.parseBoolean(recetaStr);
                        recetaRetenida = Boolean.parseBoolean(recetaRetenidaStr);
                        retiroTienda = Boolean.parseBoolean(retiroTiendaStr);
                    }
                    

                    productoDAO producto = new productoDAO();
                    if(accionEdit.equals("editar"))accion = "noagregar";
                    String mensaje = "";
                    System.out.println("zxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                    System.out.println("accion "+accion);
                    System.out.println("accionEDIT "+accionEdit);
                    if(accion.equals("agregar")){
                        mensaje = producto.Agregar_Producto(CodSKU, nombreProd, PrincipioActivo, Contenido, Usos, Contraindicaciones, Departamento, EscribirAqui, Cantidad, Minimo, Maximo, Sucursal, EscribirAquiDesc, precioCompra, iva, impuesto2, impuesto3, margen, descuento, precioSugerido, precio1, precio2, precioSuscripcion, precioConvenio, ventaPresencial, ventaOnline, receta, recetaRetenida, retiroTienda, descripcion);
                        request.setAttribute("msje", "se realizo: " + mensaje);
                        System.out.println(request.getContextPath() + "/productos/productos.jsp");
                        //request.getRequestDispatcher(request.getContextPath() + "/productos/productos.jsp").forward(request, response);
                        String jspPath = "/productos/productos.jsp";
                        //response.sendRedirect(request.getContextPath() + jspPath);
                        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
                        dispatcher.forward(request, response);
                    }if(accionEdit.equals("editar")){
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
                        String jspPath = "/productos/editproductos.jsp";
                        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
                        dispatcher.forward(request, response);
                    }
                    
                    break;
                case "actualizar":
                    String jspPath = "/productos/listaProductos.jsp";
                    productoDAO productoDAO1 = new productoDAO();
                    System.out.println("listar productos ");
                    String codProd = request.getParameter("codProd");
                    List<productoVO> listaProducto1 = productoDAO1.listarProductos(codProd);
                    System.out.println("Listar productos ");
                    request.setAttribute("listaProd", listaProducto1);
                    request.getRequestDispatcher(/*request.getContextPath() + */jspPath).forward(request, response);
                    
                    //response.sendRedirect(request.getContextPath() + jspPath);
                    break;
                case "eliminar":
                    productoDAO productoDAO2 = new productoDAO();
                    System.out.println("listar productos eliminar ");
                    String codiProd = request.getParameter("codProd");
                    String SKU2 = request.getParameter("SKU");
                    productoDAO editarProd2 = new productoDAO();
                    System.out.println("SKU "+ SKU2);
                    System.out.println("1 editar productos eliminar");
                    String mensajeE = editarProd2.Editar_Producto_Eliminar(SKU2);
                    List<productoVO> listaProducto2 = productoDAO2.listarProductos(codiProd);
                    System.out.println("Listar productos eliminar");
                    request.setAttribute("msje", "se realizo: " + mensajeE);
                    request.setAttribute("listaProd", listaProducto2);
                    System.out.println("Listar productos eliminar 185");
                    jspPath = "/productos/eliminarProductos.jsp";
                    RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
                    System.out.println("dispatcher " +dispatcher.getClass().getName());
                    dispatcher.forward(request, response);
                    break;
                case "buscar":
                    productoDAO productoDAO3 = new productoDAO();
                    System.out.println("listar productos ");
                    String codiProd3 = request.getParameter("codProd");
                    List<productoVO> listaProducto3 = productoDAO3.listarProductos(codiProd3);
                    System.out.println("Listar productos ");
                    request.setAttribute("listaProd", listaProducto3);
                    jspPath = "/productos/buscarProductos.jsp";
                    RequestDispatcher dispatcherB = request.getRequestDispatcher(jspPath);
                    dispatcherB.forward(request, response);
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
                    jspPath = "/productos/editproductos.jsp";
                    RequestDispatcher dispatcherE = request.getRequestDispatcher(jspPath);
                    dispatcherE.forward(request, response);
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
