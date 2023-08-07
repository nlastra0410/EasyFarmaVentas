
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
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
    </head>
    <body>
        <h3>
            <table border="1" width="1000" align="center">
                <tr bgcolor="skyblue">
                    <th><a href="index.jsp">Catálogo</a></th>
                    <th><a href="registrarProducto.jsp">Registrar Productos</a></th>
                    <th><a href="">Ventas realizadas</a></th>
                    <th><a href="login.jsp?cerrar=true">Cerrar Sesión</a></th>
                    <th width="200"><%= sesion.getAttribute("user").toString()%></th>
                </tr>
            </table>
        </h3>

        <h2 align="center">Modificar producto</h2>

        <table border="0" width="500" align="center">
            <form method="post" action="ServletModificarProducto">
                <tr>
                    <th>Código</th>
                    <th><input type="text" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly></th>
                </tr>
                <tr>
                    <th>Imagen</th>
                    <th><input type="text" name="txtImagen" value="<%= p.getImagen()%>"></th>
                    
                </tr>
                <tr>
                    <th>Nombre</th>
                    <th><input type="text" name="txtNombre" value="<%= p.getNombre()%>" ></th>
                </tr>
                <tr>
                    <th>Precio</th>
                    <th><input type="text" name="txtPrecio" value="<%= p.getPrecio()%>" ></th>
                </tr>
                <tr>
                    <th colspan="3"><input type="submit" value="Actualizar" name="btnAnadir"></th>
                </tr>
                <input type="hidden" name="codigoProducto" value="<%= p.getCodigoProducto()%>"  />
            </form>
        </table>


    </body>
</html>

