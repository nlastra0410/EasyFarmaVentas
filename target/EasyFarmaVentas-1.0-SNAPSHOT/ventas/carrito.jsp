

<%@page import="Modelo.ProductoDB"%>
<%@page import="Modelo.Productos"%>
<%@page import="Controlador.ServletAgregarCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Recuperamos la variable de sesion que trae los productos --%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/carro.js"></script> 
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
                    <th width="200"><%= sesion.getAttribute("user").toString()%></th>
                </tr>
            </table>
        </h3>

        <h2 align="center">Carro de compras</h2>

        <form action="ServletControlador" method="post">

            <table id="productoscarro" border="1" align="center">
                <thead id="thcarro">
                    <tr align="center">
                        <td>ITEM</td>
                        <td>DESCRIPCIÓN</td>
                        <td>PRECIO</td>
                        <td>CANTIDAD</td>
                        <td>TOTAL</td>
                    </tr>
                </thead>

                <tbody>
                    <%--Mostramos los productos seleccionados para el carrito de compras--%>
                    <%
                        ServletAgregarCarrito ac = new ServletAgregarCarrito();
                        int total = 0;
                        if (articulos != null) {
                            for (Articulo a : articulos) {
                                Productos producto = ProductoDB.obtenerProducto(a.getCodigoProducto());
                                total += a.getCantidad() * producto.getPrecio();

                    %>
                    <tr align="center">
                        <td>
                            <a align="center"><img src="imagenes/<%= producto.getImagen()%>" width="100px"></a>

                        </td>
                        <td>
                            <a> <%= producto.getNombre()%></a><br>
                            <a> Código: <%= producto.getCodigoProducto()%></a>
                        </td>
                        <td>
                            <a>$<%= producto.getPrecio()%></a>
                        </td>
                        <td>
                            <a><%= a.getCantidad()%></a>
                        </td>
                        <td>
                            <a>$<%= Math.round(producto.getPrecio() * a.getCantidad())%></a>
                        </td>


                    </tr>

                    <% }
                    } else {%>
                <h1 align="center"> No hay articulos en el carro</h1>


                <%}%>
                <tr id="thcarro" align="center">
                    <td colspan="5">
                        <a>El valor total de su compra es: $<%= total%></a>

                    </td>

                </tr>
                </tbody>
            </table>


            <%-- Usamos el historial del usuario para devolverlo dos paginas atras --%>
            <h3 id="seguircom" align="center"> <a  id="seguircom" href="indexUser.jsp">Seguir Comprando</a></h3>

            <button id="comprar" align="center" type="submit" value="Realizar Compra">Realizar Compra</button>
            <input type="hidden" name="accion" value="insertar2">
        </form>
        <script src="js/carro.js"></script>




    </body>
</html>
