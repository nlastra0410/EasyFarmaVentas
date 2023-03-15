<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link href="dist/css/validaPass.css" rel="stylesheet" type="text/css"/>
  <script src="dist/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
     

      
</script> 
    
    </head>
    <body class="hold-transition login-page">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="login-box">
                        <div class="row justify-content-center">
                            <div class="">
                                <div class="login-box-body">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Crear una cuenta</h3></div>
                                    <div class="card-body">
                                        <form action="usuarioControlador?accion=registrar" method="POST" enctype="multipart/form-data">
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
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="index.jsp">Si tienes cuenta ir a iniciar sesion</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            
                <footer class="py-4 bg-light mt-auto">
                    <div class="card-footer text-center py-3">
                        <div class="">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
             
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="dist/js/validaciones.js"></script>
    </body>
</html>
