<%-- 
    Document   : pruebaServlet
    Created on : 05-03-2023, 14:23:50
    Author     : nlast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="usuarioControlador" method="POST" >
            <input type="hidden" value="registrar" name="accion" id="accion">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputImagen" name="inputImagen" type="file" />
                                                <label for="inputImagen">Foto de Perfil</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputFirstName" name="inputFirstName" type="text" placeholder="Enter your first name" />
                                                        <label for="">Nombre</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputLastName" name="inputLastName" type="text" placeholder="Enter your last name" />
                                                        <label for="">Apellido</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" name="inputEmail" type="email" placeholder="name@example.com" />
                                                <label for="">Email</label>
                                            </div>
                                            <div class="form-floating mb-3 ">
                                                        <input class="form-control" id="inputPassword" name="inputPassword" type="password" placeholder="Create a password" />
                                                        <label for="">Password</label>
                                                        <input class="form-control" id="inputPasswordConfirm"  name="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                        <label for="">Confirma Password</label>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                    <input type="submit" value="Crear Cuenta">
                                                    <button class="btn btn-primary btn-block" id="crearCuenta" disabled>Crear Cuenta</button>
                                                     
                                                    
                                            </div>
                                        </form>
    </body>
</html>
