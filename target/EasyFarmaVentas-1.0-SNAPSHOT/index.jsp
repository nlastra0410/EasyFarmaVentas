<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Muhamad Nauval Azhar">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta name="description" content="This is a login page template based on Bootstrap 5">
	<title>Easy Farma Ventas</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        
</head>

<body>
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
                                            <img src="assets/img/easyfarma.png" alt="logo" width="100" height="100">
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Login</h1>
                                                        <form method="POST" class="needs-validation" novalidate="" autocomplete="off" action="usuarioServlets">
                                                            <input type="hidden" name="accion" id="accion" value="verificar">
								<div class="mb-3">
                                                                        <label class="mb-2 text-muted" for="email">Dirección E-mail</label>
									<input id="email" type="email" class="form-control" name="correo" value="" required autofocus>
									<div class="invalid-feedback">
										Email incorrecto
									</div>
								</div>

								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="text-muted" for="password">Password</label>
                                                                                <a href="incioSesion/forgot.html" class="float-end">
											Olvido su Password?
										</a>
									</div>
									<input id="password" type="password" class="form-control" name="password" required>
								    <div class="invalid-feedback">
								    	Password es requerido
							    	</div>
                                                                 <c:if test="${not empty msje}">
                                                                    <p>Ocurrio un error: ${msje}</p>
                                                                </c:if>
								</div>

								<div class="d-flex align-items-center">
									<div class="form-check">
										<input type="checkbox" name="remember" id="remember" class="form-check-input">
										<label for="remember" class="form-check-label">Recordar Datos</label>
									</div>
									<button type="submit" class="btn btn-primary ms-auto">
										Loguearse
									</button>
								</div>
							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
                                                            No Tiene una cuenta ? <a href="incioSesion/register.html" class="text-dark">Crear Cuenta</a>
							</div>
						</div>
					</div>
					<div class="text-center mt-5 text-muted">
						Copyright &copy; 2017-2023 &mdash; Perspectiva Digital SA 
					</div>
				</div>
			</div>
		</div>
	</section>
    
    <script src="assets/login.js"></script>
</body>
</html>
