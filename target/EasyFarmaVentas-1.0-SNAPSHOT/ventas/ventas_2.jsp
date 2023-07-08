<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>Carrito de Compra</title>
</head>
<body>
    <h1>Carrito de Compra</h1>
    <form action="CarritoServlet" method="POST">
        <select name="producto">
            <option value="producto1">Producto 1</option>
            <option value="producto2">Producto 2</option>
            <option value="producto3">Producto 3</option>
            <option value="producto4">Producto 4</option>
            <option value="producto5">Producto 5</option>
            <option value="producto6">Producto 6</option>
            <option value="producto7">Producto 7</option>
            <option value="producto8">Producto 8</option>
            <option value="producto9">Producto 9</option>
            <option value="producto10">Producto 10</option>
        </select>
        <input type="submit" value="Agregar al carrito">
    </form>
    <h2>Productos en el carrito:</h2>
    <ul>
        <% 
            List<String> carrito = (List<String>) session.getAttribute("carrito");
            if (carrito != null) {
                for (String producto : carrito) { 
        %>
        <li><%= producto %></li>
        <% 
                } 
            } 
        %>
    </ul>
    <form action="CarritoServlet" method="POST">
        <select name="producto">
            <% 
                if (carrito != null) {
                    for (String producto : carrito) { 
            %>
            <option value="<%= producto %>"><%= producto %></option>
            <% 
                    } 
                } 
            %>
        </select>
        <input type="submit" value="Eliminar del carrito">
    </form>
</body>
</html>
