<%-- 
    Document   : registrarProducto
    Created on : 12/11/2018, 12:23:14 PM
    Author     : Sebastian Castro C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession sesion = request.getSession();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevos Productos</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <img src="imagenes_/banner2.PNG" width="100%">
        <h3>
            <table id="menu" border="1"  align="center">

                <tr>
                    <th><a href="index.jsp">Catálogo</a></th>
                    <th><a href="registrarProducto.jsp">Registrar Productos</a></th>
                    <th><a href="login.jsp?cerrar=true">Cerrar Sesión</a></th>
                    <th width="200"><%= sesion.getAttribute("user").toString()%></th>
                </tr>
            </table>
        </h3>
        <h1 align="center">Nuevos Productos</h1>
        <h3 align="center">¡Ingresa nuevos productos para que tus clientes compren lo último en celulares!</h3>
        <form action="ServletControlador">
            <table id="regispro" border="0" width="400" align="center">
                <tr>
                    <td rowspan="5"><img src="imagenes_/newpro.jpg" width="250px"></td>
                    
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input  type="text" name="txtNom"></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input  type="text" name="txtPre"></td>
                </tr>
                <tr>
                    <td>Imagen:</td>
                    <td><input  type="text" name="txtImg"></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button type="submit"  id="registrar" value="Registrar Producto" name="btn1">Registrar Producto</button>
                    </th>
                </tr>

            </table>
            <input type="hidden" name="accion" value="insertar">
        </form>
    </body>
</html>
