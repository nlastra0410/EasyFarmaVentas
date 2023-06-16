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
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/lineicons.css" />
    <link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="assets/css/fullcalendar.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
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
                  <h6>Agregar Clientes</h6>
                </div>
                  <form action="clienteServlet" method="post">
                      <input type="hidden" name="accion" id="accion" value="actualizar">
                  <div class="row">
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Rut</label>
                        <input type="text" placeholder="Rut Cliente" id="rut" name="rut" value="<c:out value="${listaCli.getRut()}-${listaCli.getDv()}"/>" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Nombres </label>
                        <input type="text" placeholder="Nombre" id="nombre" name="nombre" value="<c:out value="${listaCli.getNombre()}"/>"/>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Apellidos</label>
                        <input type="text" placeholder="Apellidos" id="apellido" name="apellido" value="<c:out value="${listaCli.getApellido()}"/>"/>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Correo Electronico</label>
                        <input type="email" placeholder="Correo Electronico" id="correo" name="correo" value="<c:out value="${listaCli.getEmail()}"/>"/>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Telefono</label>
                        <input type="text" placeholder="Telefono" id="tel" name="tel" value="<c:out value="${listaCli.getTelefono()}"/>"/>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Profesion</label>
                        <input type="text" placeholder="Profesion" id="profesion" name="profesion" value="<c:out value="${listaCli.getProfesion()}"/>"/>
                      </div>
                    </div>
                    <div class="title mb-30">
                        <h6>Fecha Nacimiento</h6>
                    </div>
                      <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Día</label>
                        <div class="select-position">
                          <select class="light-bg">
                            <option value="">1</option>
                            <option value="">2</option>
                            <option value="">3</option>
                            <option value="">4</option>
                            <option value="">5</option>
                            <option value="">6</option>
                            <option value="">7</option>
                            <option value="">8</option>
                            <option value="">9</option>
                            <option value="">10</option>
                            <option value="">11</option>
                            <option value="">12</option>
                            <option value="">13</option>
                            <option value="">14</option>
                            <option value="">15</option>
                            <option value="">16</option>
                            <option value="">17</option>
                            <option value="">18</option>
                            <option value="">19</option>
                            <option value="">20</option>
                            <option value="">21</option>
                            <option value="">22</option>
                            <option value="">23</option>
                            <option value="">24</option>
                            <option value="">25</option>
                            <option value="">26</option>
                            <option value="">27</option>
                            <option value="">28</option>
                            <option value="">29</option>
                            <option value="">30</option>
                            <option value="">31</option>
                          </select>
                        </div>
                      </div>
                    </div>
                     <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Mes</label>
                        <div class="select-position">
                          <select class="light-bg">
                            <option value="">Enero</option>
                            <option value="">Febrero</option>
                            <option value="">Marzo</option>
                            <option value="">Abril</option>
                            <option value="">Mayo</option>
                            <option value="">Junio</option>
                            <option value="">Julio</option>
                            <option value="">Agosto</option>
                            <option value="">Septiembre</option>
                            <option value="">Octubre</option>
                            <option value="">Noviembre</option>
                            <option value="">Diciembre</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Año</label>
                        <div class="select-position">
                          <select>
                            <c:forEach begin="1930" end="2005" var="year">
                              <option value="${year}">${year}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                      <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Easy Farma Plus</label>
                        <input type="text" placeholder="EasyFarma Plus" id="plus" name="plus" value="<c:out value="${listaCli.getPlus()}"/>"/>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Direccion</label>
                        <textarea placeholder="Direccion" rows="6" name="direccion" id="direccion"><c:out value="${listaCli.getDireccion()}"/></textarea>
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
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/Chart.min.js"></script>
    <script src="assets/js/dynamic-pie-chart.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/fullcalendar.js"></script>
    <script src="assets/js/jvectormap.min.js"></script>
    <script src="assets/js/world-merc.js"></script>
    <script src="assets/js/polyfill.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>
