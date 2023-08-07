<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="shortcut icon"
      href="assets/images/favicon.svg"
      type="image/x-icon"
    />
    <title>Tables | PlainAdmin Demo</title>

    <!-- ========== All CSS files linkup ========= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lineicons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fullcalendar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
  </head>
  <body>
   
    
    <!-- ======== main-wrapper start =========== -->
    <main class=" ">
      <!-- ========== header start ========== -->
       
      <!-- ========== header end ========== -->

      <!-- ========== table components start ========== -->
      <section class="table-components">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
         
          <!-- ========== title-wrapper end ========== -->

          <!-- ========== tables-wrapper start ========== -->
          <div class="">
              <div class="card-style settings-card-2 mb-30">
                <div class="title mb-30">
                  <h6>Agregar Empleado</h6>
                </div>
                  <form action="${pageContext.request.contextPath}/empleadoServlet" method="post">
                      <input type="hidden" name="accion" id="accion" value="agregar">
                  <div class="row">
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Rut</label>
                        <input type="text" placeholder="Rut Cliente" id="rut" name="rut" placeholder="Escribe tu RUT" onblur="formatoRut(this)" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Nombres </label>
                        <input type="text" placeholder="Nombre" id="nombre" name="nombre" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Apellidos</label>
                        <input type="text" placeholder="Apellidos" id="apellido" name="apellido"/>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Correo Electronico</label>
                        <input type="email" placeholder="Correo Electronico" id="correo" name="correo" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Telefono</label>
                        <input type="text" placeholder="Telefono" id="tel" name="tel"/>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Sexo</label>
                        <input type="text" placeholder="Sexo" id="Sexo" name="Sexo"/>
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>fechaNacimiento</label>
                        <input type="text" placeholder="fecha de Nacimiento 01/01/88" id="fechaNacimiento" name="fechaNacimiento" onblur="formatearFechaInput()"/>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Profesion</label>
                        <input type="text" placeholder="Profesion" id="profesion" name="profesion"/>
                      </div>
                    </div>
                     
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Direccion</label>
                        <textarea placeholder="Direccion" rows="6" name="direccion" id="direccion"></textarea>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="main-btn primary-btn btn-hover">
                        GUARDAR
                      </button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- end card -->
            </div>
          <!-- ========== tables-wrapper end ========== -->
        </div>
        <!-- end container -->
      </section>
      <!-- ========== table components end ========== -->

      <!-- ========== footer start =========== -->
      <footer class="footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6 order-last order-md-first">
              <div class="copyright text-center text-md-start">
                <p class="text-sm">
                  Designed and Developed by
                  <a
                    href="https://plainadmin.com"
                    rel="nofollow"
                    target="_blank"
                  >
                    PlainAdmin
                  </a>
                </p>
              </div>
            </div>
            <!-- end col-->
            <div class="col-md-6">
              <div
                class="
                  terms
                  d-flex
                  justify-content-center justify-content-md-end
                "
              >
                <a href="#0" class="text-sm">Term & Conditions</a>
                <a href="#0" class="text-sm ml-15">Privacy & Policy</a>
              </div>
            </div>
          </div>
          <!-- end row -->
        </div>
        <!-- end container -->
      </footer>
      <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->

    <!-- ========= All Javascript files linkup ======== -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dynamic-pie-chart.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/fullcalendar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jvectormap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/world-merc.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/polyfill.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/assets/validadores/validadores.js" type="text/javascript"></script>
  </body>
</html>
