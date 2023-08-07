

<%@page import="cl.easyfarma.venta.modelo.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cl.easyfarma.venta.modelo.ProductoDB"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>

<%-- Este fragmento de código nos permite llamar la funcion obtener producto, que trae los datos desde
un procedimiento almacenado en MySQL--%>

<%
    Productos p = ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
    HttpSession sesion = request.getSession();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <img src="imagenes_/banner2.PNG" width="100%">
        <h3>
            <table id="menu" border="1"  align="center">
                <tr>
                    <th><a href="indexUser.jsp">Catálogo</a></th>
                    <th><a href="carrito.jsp">Carro de compras</a></th>
                    <th><a href="login.jsp?cerrar=true">Cerrar Sesión</a></th>
                    <th width="200"> </th>
                </tr>
            </table>
        </h3>

        <h2 align="center">Añadir producto al carrito</h2>

        <table id="anadircar" border="0" align="center">
            <form method="post" action="ServletAgregarCarrito">
                <tr>
                    <th rowspan="4"><img src="imagenes/<%= p.getImagen()%>" width="200px"</th>
                    <th>Código:</th>
                    <th><input type="text" id="i" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly></th>
                </tr>
                <tr>
                    <th>Nombre:</th>
                    <th><input type="text" id="i" name="txtNombre" value="<%= p.getNombre()%>" readonly></th>
                </tr>
                <tr>
                    <th>Precio:</th>
                    <th><input type="text" id="i" name="txtPrecio" value="<%= p.getPrecio()%>" readonly></th>
                </tr>
                <tr>
                    <th>Cantidad:</th>
                    <th><input type="number" id="ic" value="1" min="0" name="txtCantidad"></th>
                </tr>
                <tr>
                    <th colspan="3">
                        <button type="submit"  id="anadir" value="Añadir" >Añadir</button>
                    </th>
                </tr>
                <input type="hidden" name="codigoProducto" value="<%= p.getCodigoProducto()%>"  />
            </form>
        </table>


    </body>
</html>
