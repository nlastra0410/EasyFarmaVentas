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
    <!-- ======== sidebar-nav start =========== -->
     <aside class="sidebar-nav-wrapper">
      <div class="navbar-logo">
        <a href="dashboard.jsp">
            <img style=" height:56px ; width:46 " src="assets/images/logo/easyfarma.png" alt="logo" />
        </a>
      </div>
      <nav class="sidebar-nav">
        <ul>
          <li class="nav-item nav-item-has-children">
            <a
              href="#0"
              data-bs-toggle="collapse"
              data-bs-target="#ddmenu_1"
              aria-controls="ddmenu_1"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22">
                  <path
                    d="M17.4167 4.58333V6.41667H13.75V4.58333H17.4167ZM8.25 4.58333V10.0833H4.58333V4.58333H8.25ZM17.4167 11.9167V17.4167H13.75V11.9167H17.4167ZM8.25 15.5833V17.4167H4.58333V15.5833H8.25ZM19.25 2.75H11.9167V8.25H19.25V2.75ZM10.0833 2.75H2.75V11.9167H10.0833V2.75ZM19.25 10.0833H11.9167V19.25H19.25V10.0833ZM10.0833 13.75H2.75V19.25H10.0833V13.75Z"
                  />
                </svg>
              </span>
              <span class="text">Menú</span>
            </a>
            <ul id="ddmenu_1" class="active dropdown-nav">
              <li>
                <a href="dashboard.jsp" > Inicio </a>
              </li>
              <li>
                <a href="ventas.jsp"> Sistema de Ventas </a>
              </li>
              <li>
                <a href="traeProductos.jsp" > Productos </a>
              </li>
              <li>
                <a href="traeEmpleados.jsp" > Empleados </a>
              </li>
              <li>
                <a href="traeClientes.jsp" > Clientes </a>
              </li>
              <li>
                <a href="traeProveedores.jsp" > Proveedores </a>
              </li>
              <li>
                <a href="calendario.jsp" > Calendario </a>
              </li>
              <li>
                <a href="estadisticas.jsp" > Estadisticas </a>
              </li>
              <li>
                <a href="inventario.jsp" > Inventario </a>
              </li>
              <li>
                <a href="ventaOnline.jsp" > Venta Online </a>
              </li>
              <li>
                <a href="ajustes.jsp" > Ajustes </a>
              </li>
              <li>
                <a href="mensajes.jsp" > Mensajes </a>
              </li>
            </ul>
          </li>
         
        </ul>
      </nav>
      <div class="">
        
      </div>
    </aside>
    <div class="overlay"></div>
    <!-- ======== sidebar-nav end =========== -->

    <!-- ======== main-wrapper start =========== -->
    <main class="main-wrapper">
      <!-- ========== header start ========== -->
      <header class="header">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-5 col-md-5 col-6">
              <div class="header-left d-flex align-items-center">
                <div class="menu-toggle-btn mr-20">
                  <button
                    id="menu-toggle"
                    class="main-btn primary-btn btn-hover"
                  >
                    <i class="lni lni-chevron-left me-2"></i> Menu
                  </button>
                </div>
                <div class="header-search d-none d-md-flex">
                  <form action="#">
                    <input type="text" placeholder="Search..." />
                    <button><i class="lni lni-search-alt"></i></button>
                  </form>
                </div>
              </div>
            </div>
            <div class="col-lg-7 col-md-7 col-6">
              <div class="header-right">
                <!-- notification start -->
                <div class="notification-box ml-15 d-none d-md-flex">
                  <button
                    class="dropdown-toggle"
                    type="button"
                    id="notification"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <i class="lni lni-alarm"></i>
                    <span>2</span>
                  </button>
                  <ul
                    class="dropdown-menu dropdown-menu-end"
                    aria-labelledby="notification"
                  >
                    <li>
                      <a href="#0">
                        <div class="image">
                          <img src="assets/images/lead/lead-6.png" alt="" />
                        </div>
                        <div class="content">
                          <h6>
                            <c:out value="${usuario.getNombreUsuario()}"/>
                            <span class="text-regular">
                              comment on a product.
                            </span>
                          </h6>
                          <p>
                            Lorem ipsum dolor sit amet, consect etur adipiscing
                            elit Vivamus tortor.
                          </p>
                          <span>10 mins ago</span>
                        </div>
                      </a>
                    </li>
                    <li>
                      <a href="#0">
                        <div class="image">
                          <img src="assets/images/lead/lead-1.png" alt="" />
                        </div>
                        <div class="content">
                          <h6>
                            Jonathon
                            <span class="text-regular">
                              like on a product.
                            </span>
                          </h6>
                          <p>
                            Lorem ipsum dolor sit amet, consect etur adipiscing
                            elit Vivamus tortor.
                          </p>
                          <span>10 mins ago</span>
                        </div>
                      </a>
                    </li>
                  </ul>
                </div>
                <!-- notification end -->
                <!-- message start -->
                <div class="header-message-box ml-15 d-none d-md-flex">
                  <button
                    class="dropdown-toggle"
                    type="button"
                    id="message"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <i class="lni lni-envelope"></i>
                    <span>3</span>
                  </button>
                  <ul
                    class="dropdown-menu dropdown-menu-end"
                    aria-labelledby="message"
                  >
                    <li>
                      <a href="#0">
                        <div class="image">
                          <img src="assets/images/lead/lead-5.png" alt="" />
                        </div>
                        <div class="content">
                          <h6>Jacob Jones</h6>
                          <p>Hey!I can across your profile and ...</p>
                          <span>10 mins ago</span>
                        </div>
                      </a>
                    </li>
                    <li>
                      <a href="#0">
                        <div class="image">
                          <img src="assets/images/lead/lead-3.png" alt="" />
                        </div>
                        <div class="content">
                          <h6><c:out value="${usuario.getNombreUsuario()}"/></h6>
                          <p>Would you mind please checking out</p>
                          <span>12 mins ago</span>
                        </div>
                      </a>
                    </li>
                    <li>
                      <a href="#0">
                        <div class="image">
                          <img src="assets/images/lead/lead-2.png" alt="" />
                        </div>
                        <div class="content">
                          <h6>Anee Lee</h6>
                          <p>Hey! are you available for freelance?</p>
                          <span>1h ago</span>
                        </div>
                      </a>
                    </li>
                  </ul>
                </div>
                <!-- message end -->
                <!-- filter start -->
                <div class="filter-box ml-15 d-none d-md-flex">
                  <button class="" type="button" id="filter">
                    <i class="lni lni-funnel"></i>
                  </button>
                </div>
                <!-- filter end -->
                <!-- profile start -->
                <div class="profile-box ml-15">
                  <button
                    class="dropdown-toggle bg-transparent border-0"
                    type="button"
                    id="profile"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <div class="profile-info">
                      <div class="info">
                        <h6><c:out value="${usuario.getNombreUsuario()}"/></h6>
                        <div class="image">
                          <img
                            src="assets/images/profile/profile-image.png"
                            alt=""
                          />
                          <span class="status"></span>
                        </div>
                      </div>
                    </div>
                    <i class="lni lni-chevron-down"></i>
                  </button>
                  <ul
                    class="dropdown-menu dropdown-menu-end"
                    aria-labelledby="profile"
                  >
                    <li>
                      <a href="#0">
                        <i class="lni lni-user"></i> View Profile
                      </a>
                    </li>
                    <li>
                      <a href="#0">
                        <i class="lni lni-alarm"></i> Notifications
                      </a>
                    </li>
                    <li>
                      <a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
                    </li>
                    <li>
                      <a href="#0"> <i class="lni lni-cog"></i> Settings </a>
                    </li>
                    <li>
                      <a href="#0"> <i class="lni lni-exit"></i> Sign Out </a>
                    </li>
                  </ul>
                </div>
                <!-- profile end -->
              </div>
            </div>
          </div>
        </div>
      </header>
      <!-- ========== header end ========== -->

      <!-- ========== table components start ========== -->
      <section class="table-components">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title mb-30">
                  <h2>Colaboradores</h2>
                </div>
              </div>
              <!-- end col -->
              <div class="col-md-6">
                <div class="breadcrumb-wrapper mb-30">
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a href="#0">Informacion</a>
                      </li>
                      <li class="breadcrumb-item active" aria-current="page">
                        De Ventas
                      </li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
          <!-- ========== title-wrapper end ========== -->

          <!-- ========== tables-wrapper start ========== -->
          <div class="col-lg-6">
              <div class="card-style settings-card-2 mb-30">
                <div class="title mb-30">
                  <h6>Agregar Colaborador</h6>
                </div>
                <form action="#">
                  <div class="row">
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Nombres</label>
                        <input type="text" placeholder="Nombre Colaborador" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Apellidos</label>
                        <input type="email" placeholder="Apellidos Colaborador" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Rut</label>
                        <input type="text" placeholder="Rut Colaborador" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Correo Electronico</label>
                        <input type="text" placeholder="Correo" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Telefono</label>
                        <input type="text" placeholder="Telefono" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Profesion</label>
                        <input type="text" placeholder="Profesion" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Cargo</label>
                        <div class="select-position">
                          <select class="light-bg">
                            <option value="">Administrador</option>
                            <option value="">Colaborador</option>
                            <option value="">Bodeguero</option>
                            <option value="">Repartidor</option>
                          </select>
                        </div>
                      </div>
                    </div>
                      <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Contrao</label>
                        <div class="select-position">
                          <select class="light-bg">
                            <option value="">Indefinido</option>
                            <option value="">Plazo Fijo</option>
                            <option value="">Part-Time</option>
                          </select>
                        </div>
                      </div>
                    </div>
                     <div class="col-12">
                      <div class="input-style-1">
                        <label>Direccion</label>
                        <input type="text" placeholder="Direccion" />
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
                      
                        <div class="title mb-30">
                        <h6>Fecha Ingreso</h6>
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
                    
                      <div class="title mb-30">
                        <h6>Fecha Termino</h6>
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
                    
                      <div class="col-12">
                      <div class="input-style-1">
                        <label>Sueldo Base</label>
                        <input type="text" placeholder="Sueldo" />
                      </div>
                     </div>
                      
                        <div class="col-12">
                      <div class="input-style-1">
                        <label>Bonos</label>
                        <input type="text" placeholder="Bonos" />
                      </div>
                     </div>
                      
                        <div class="col-12">
                      <div class="input-style-1">
                        <label>Contraseña</label>
                        <input type="password" placeholder="Password" />
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
