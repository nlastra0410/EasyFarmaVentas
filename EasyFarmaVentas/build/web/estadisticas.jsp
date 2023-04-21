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
        <a href="index.html">
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
              <span class="text">Men�</span>
            </a>
            <ul id="ddmenu_1" class="active dropdown-nav">
              <li>
                <a href="dashboard.jsp" > Inicio </a>
              </li>
              <li>
                <a href="ventas.jsp"> Sistema de Ventas </a>
              </li>
              <li>
                <a href="productos.jsp" > Productos </a>
              </li>
              <li>
                <a href="empleados.jsp" > Empleados </a>
              </li>
              <li>
                <a href="clientes.jsp" > Clientes </a>
              </li>
              <li>
                <a href="proveedores.jsp" > Proveedores </a>
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
                  <h2>Sistema De Ventas</h2>
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
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <h6 class="mb-10">Data Table</h6>
                  <p class="text-sm mb-20">
                    For basic styling—light padding and only horizontal
                    dividers—use the class table.
                  </p>
                  <div class="table-wrapper table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th><h6>Lead</h6></th>
                          <th><h6>Email</h6></th>
                          <th><h6>Phone No</h6></th>
                          <th><h6>Company</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                        <tr>
                          <td class="min-width">
                            <div class="lead">
                              <div class="lead-image">
                                <img
                                  src="assets/images/lead/lead-1.png"
                                  alt=""
                                />
                              </div>
                              <div class="lead-text">
                                <p>Courtney Henry</p>
                              </div>
                            </div>
                          </td>
                          <td class="min-width">
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td class="min-width">
                            <p>(303)555 3343523</p>
                          </td>
                          <td class="min-width">
                            <p>UIdeck digital agency</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td class="min-width">
                            <div class="lead">
                              <div class="lead-image">
                                <img
                                  src="assets/images/lead/lead-2.png"
                                  alt=""
                                />
                              </div>
                              <div class="lead-text">
                                <p><c:out value="${usuario.getNombreUsuario()}"/></p>
                              </div>
                            </div>
                          </td>
                          <td class="min-width">
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td class="min-width">
                            <p>(303)555 3343523</p>
                          </td>
                          <td class="min-width">
                            <p>Graygrids digital agency</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td class="min-width">
                            <div class="lead">
                              <div class="lead-image">
                                <img
                                  src="assets/images/lead/lead-3.png"
                                  alt=""
                                />
                              </div>
                              <div class="lead-text">
                                <p>David Smith</p>
                              </div>
                            </div>
                          </td>
                          <td class="min-width">
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td class="min-width">
                            <p>(303)555 3343523</p>
                          </td>
                          <td class="min-width">
                            <p>Abc agency</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td class="min-width">
                            <div class="lead">
                              <div class="lead-image">
                                <img
                                  src="assets/images/lead/lead-4.png"
                                  alt=""
                                />
                              </div>
                              <div class="lead-text">
                                <p>Jonathon</p>
                              </div>
                            </div>
                          </td>
                          <td class="min-width">
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td class="min-width">
                            <p>(303)555 3343523</p>
                          </td>
                          <td class="min-width">
                            <p>Creative IT Agency</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="lead">
                              <div class="lead-image">
                                <img
                                  src="assets/images/lead/lead-5.png"
                                  alt=""
                                />
                              </div>
                              <div class="lead-text">
                                <p>Anna Lee</p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td>
                            <p>(303)555 3343523</p>
                          </td>
                          <td>
                            <p>Halal It agency</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="lead">
                              <div class="lead-image">
                                <img
                                  src="assets/images/lead/lead-6.png"
                                  alt=""
                                />
                              </div>
                              <div class="lead-text">
                                <p>Gray Simon</p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td>
                            <p>(303)555 3343523</p>
                          </td>
                          <td>
                            <p>DesignCourse</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                      </tbody>
                    </table>
                    <!-- end table -->
                  </div>
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->

            <div class="row">
              <div class="col-lg-6">
                <div class="card-style mb-30">
                  <h6 class="mb-10">Striped Table</h6>
                  <p class="text-sm mb-20">
                    For Striped Table—light padding and only horizontal
                    dividers.
                  </p>
                  <div class="table-wrapper table-responsive">
                    <table class="table striped-table">
                      <thead>
                        <tr>
                          <th></th>
                          <th><h6>Account No</h6></th>
                          <th><h6>Balance</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <div class="check-input-primary">
                              <input
                                class="form-check-input"
                                type="checkbox"
                                id="checkbox-1"
                              />
                            </div>
                          </td>
                          <td>
                            <p>AC336 508 2157</p>
                          </td>
                          <td>
                            <p>$523</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="check-input-primary">
                              <input
                                class="form-check-input"
                                type="checkbox"
                                id="checkbox-2"
                              />
                            </div>
                          </td>
                          <td>
                            <p>AC336 756 0987</p>
                          </td>
                          <td>
                            <p>$123</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="check-input-primary">
                              <input
                                class="form-check-input"
                                type="checkbox"
                                id="checkbox-3"
                              />
                            </div>
                          </td>
                          <td>
                            <p>AC336 098 8765</p>
                          </td>
                          <td>
                            <p>$223</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="check-input-primary">
                              <input
                                class="form-check-input"
                                type="checkbox"
                                id="checkbox-4"
                              />
                            </div>
                          </td>
                          <td>
                            <p>AC336 897 3242</p>
                          </td>
                          <td>
                            <p>$323</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="check-input-primary">
                              <input
                                class="form-check-input"
                                type="checkbox"
                                id="checkbox-5"
                              />
                            </div>
                          </td>
                          <td>
                            <p>AC336 654 0987</p>
                          </td>
                          <td>
                            <p>$423</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="check-input-primary">
                              <input
                                class="form-check-input"
                                type="checkbox"
                                id="checkbox-6"
                              />
                            </div>
                          </td>
                          <td>
                            <p>AC336 234 9804</p>
                          </td>
                          <td>
                            <p>$523</p>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                      </tbody>
                    </table>
                    <!-- end table -->
                  </div>
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->
              <div class="col-lg-6">
                <div class="card-style mb-30">
                  <h6 class="mb-10">Table head options</h6>
                  <p class="text-sm mb-20">
                    Use one of two modifier classes to make thead appear light
                    or dark gray.
                  </p>
                  <div class="table-wrapper table-responsive">
                    <table class="table striped-table">
                      <thead>
                        <tr>
                          <th></th>
                          <th><h6>First Name</h6></th>
                          <th><h6>Last Name</h6></th>
                          <th><h6>Username</h6></th>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <h6 class="text-sm">#1</h6>
                          </td>
                          <td>
                            <p>Albert</p>
                          </td>
                          <td>
                            <p>Miles</p>
                          </td>
                          <td>
                            <p>@albert_miles</p>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <h6 class="text-sm">#2</h6>
                          </td>
                          <td>
                            <p><c:out value="${usuario.getNombreUsuario()}"/></p>
                          </td>
                          <td>
                            <p></p>
                          </td>
                          <td>
                            <p>@<c:out value="${usuario.getEmail()}"/></p>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <h6 class="text-sm">#3</h6>
                          </td>
                          <td>
                            <p>David</p>
                          </td>
                          <td>
                            <p>Smith</p>
                          </td>
                          <td>
                            <p>@davidsmith</p>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <h6 class="text-sm">#4</h6>
                          </td>
                          <td>
                            <p>Jameel</p>
                          </td>
                          <td>
                            <p>Kareem</p>
                          </td>
                          <td>
                            <p>@jkreem</p>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <h6 class="text-sm">#5</h6>
                          </td>
                          <td>
                            <p>Anna</p>
                          </td>
                          <td>
                            <p>Miles</p>
                          </td>
                          <td>
                            <p>@anna_miles</p>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <h6 class="text-sm">#6</h6>
                          </td>
                          <td>
                            <p>Hafiz</p>
                          </td>
                          <td>
                            <p>Miles</p>
                          </td>
                          <td>
                            <p>@hafiz_miles</p>
                          </td>
                        </tr>
                        <!-- end table row -->
                      </tbody>
                    </table>
                    <!-- end table -->
                  </div>
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->

            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <h6 class="mb-10">Data Table</h6>
                  <p class="text-sm mb-20">
                    For basic styling—light padding and only horizontal
                    dividers—use the class table.
                  </p>
                  <div class="table-wrapper table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th><h6>#</h6></th>
                          <th><h6>Name</h6></th>
                          <th><h6>Email</h6></th>
                          <th><h6>Project</h6></th>
                          <th><h6>Status</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <div class="employee-image">
                              <img src="assets/images/lead/lead-1.png" alt="" />
                            </div>
                          </td>
                          <td class="min-width">
                            <p>Esther Howard</p>
                          </td>
                          <td class="min-width">
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td class="min-width">
                            <p>Admin Dashboard Design</p>
                          </td>
                          <td class="min-width">
                            <span class="status-btn active-btn">Active</span>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="employee-image">
                              <img src="assets/images/lead/lead-2.png" alt="" />
                            </div>
                          </td>
                          <td class="min-width">
                            <p>D. Jonathon</p>
                          </td>
                          <td class="min-width">
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td class="min-width">
                            <p>React Dashboard</p>
                          </td>
                          <td class="min-width">
                            <span class="status-btn active-btn">Active</span>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="employee-image">
                              <img src="assets/images/lead/lead-3.png" alt="" />
                            </div>
                          </td>
                          <td>
                            <p>John Doe</p>
                          </td>
                          <td>
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td>
                            <p>Bootstrap Template</p>
                          </td>
                          <td>
                            <span class="status-btn success-btn">Done</span>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="employee-image">
                              <img src="assets/images/lead/lead-4.png" alt="" />
                            </div>
                          </td>
                          <td>
                            <p>Rayhan Jamil</p>
                          </td>
                          <td>
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td>
                            <p>Css Grid Template</p>
                          </td>
                          <td>
                            <span class="status-btn info-btn">Pending</span>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="employee-image">
                              <img src="assets/images/lead/lead-5.png" alt="" />
                            </div>
                          </td>
                          <td>
                            <p>Esther Howard</p>
                          </td>
                          <td>
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td>
                            <p>Admin Dashboard Design</p>
                          </td>
                          <td>
                            <span class="status-btn close-btn">Close</span>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                        <tr>
                          <td>
                            <div class="employee-image">
                              <img src="assets/images/lead/lead-6.png" alt="" />
                            </div>
                          </td>
                          <td>
                            <p>Anee Doe</p>
                          </td>
                          <td>
                            <p><a href="#0">yourmail@gmail.com</a></p>
                          </td>
                          <td>
                            <p>Space Template Update</p>
                          </td>
                          <td>
                            <span class="status-btn active-btn">Active</span>
                          </td>
                          <td>
                            <div class="action">
                              <button class="text-danger">
                                <i class="lni lni-trash-can"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <!-- end table row -->
                      </tbody>
                    </table>
                    <!-- end table -->
                  </div>
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
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
