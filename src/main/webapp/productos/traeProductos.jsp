<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="shortcut icon"
            href="${pageContext.request.contextPath}/assets/img/favicon.svg"
            type="image/x-icon"
            />
        <title>Tables | PlainAdmin Demo</title>
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- ========== All CSS files linkup ========= -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lineicons.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/materialdesignicons.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fullcalendar.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
        <script src="${pageContext.request.contextPath}/assets/login.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src='https://code.jquery.com/jquery-1.12.4.min.js'></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("img[name=btn_accion]").click(function () {
                    var url = 'productos.jsp';
                    $('#inlineFrameExample').attr('src', url);
                });
            });
            $(document).ready(function () {
                $("img[name=btn_guardar]").click(function () {
                    var url = 'listaProductos.jsp';
                    $('#inlineFrameExample').attr('src', url);
                });
            });
            $(document).ready(function () {
                $("img[name=btn_cambio]").click(function () {
                    var url = 'eliminarProductos.jsp';
                    $('#inlineFrameExample').attr('src', url);
                });
            });
                       $(document).ready(function () {
                $("img[name=btn_dev]").click(function () {
                    var url = 'buscarProductos.jsp';
                    $('#inlineFrameExample').attr('src', url);
                });
            });
             $(document).ready(function () {
                $("img[name=btn_boleta]").click(function () {
                    var url = '${pageContext.request.contextPath}/Otros/ventas_2_1.jsp';
                    $('#inlineFrameExample').attr('src', url);
                });
            });
             $(document).ready(function () {
                $("img[name=btn_mayoreo]").click(function () {
                    var url = '${pageContext.request.contextPath}/Otros/calculadora_1.jsp';
                    $('#inlineFrameExample').attr('src', url);
                });
            });
             $(document).ready(function () {
                $("img[name=btn_cierre]").click(function () {
                    var url = 'ventas_2.jsp';
                    $('#inlineFrameExample').attr('src', url);
                });
            });
             $(document).ready(function () {
                $("img[name=btn_calculadora]").click(function () {
                    var url = '${pageContext.request.contextPath}/Otros/calculadora_1.jsp';
                    window.open(url,"calculadora","width=400,height=460,scrollbars=NO") 

                   // $('#inlineFrameExample').attr('src', url);
                });
            });
        </script>
    </head>
    <body>
        <!-- ======== sidebar-nav start =========== -->
        <aside class="sidebar-nav-wrapper">
            <div class="navbar-logo">
                <a href="dashboard.jsp">
                    <img style=" height:56px ; width:46 " src="${pageContext.request.contextPath}/assets/img/logo/easyfarma.png" alt="logo" />
                </a>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0"
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
                  <a href="${pageContext.request.contextPath}/dashboard.jsp" > Inicio </a>
              </li>
              <li>
                  <a href="${pageContext.request.contextPath}/ventas/ventas.jsp"> Sistema de Ventas </a>
              </li>
              <li>
                  <a href="${pageContext.request.contextPath}/productos/traeProductos.jsp" > Productos </a>
              </li>
              <li>
                  <a href="${pageContext.request.contextPath}/empleados/traeEmpleados.jsp" > Empleados </a>
              </li>
              <li>
                  <a href="${pageContext.request.contextPath}/clientes/traeClientes.jsp" > Clientes </a>
              </li>
              <li>
                  <a href="${pageContext.request.contextPath}/proveedores/traeProveedores.jsp" > Proveedores </a>
              </li>
              <li>
                  <a href="${pageContext.request.contextPath}/Otros//calendario.jsp" > Calendario </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/Otros/estadisticas.jsp" > Estadisticas </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/Otros/inventario.jsp" > Inventario </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/Otros/ventaOnline.jsp" > Venta Online </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/Otros/ajustes.jsp" > Ajustes </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/Otros/mensajes.jsp" > Mensajes </a>
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
                                                    <img src="${pageContext.request.contextPath}/assets/img/lead/lead-6.png" alt="" />
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
                                                    <img src="${pageContext.request.contextPath}/assets/img/lead/lead-1.png" alt="" />
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
                                                    <img src="${pageContext.request.contextPath}/assets/img/lead/lead-5.png" alt="" />
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
                                                    <img src="${pageContext.request.contextPath}/assets/img/lead/lead-3.png" alt="" />
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
                                                    <img src="${pageContext.request.contextPath}/assets/img/lead/lead-2.png" alt="" />
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
                                                        src="${pageContext.request.contextPath}/assets/img/profile/profile-image.png"
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
                                            <button class="lni lni-exit" id="cerrarSesion" onclick="cerrarSesionCarp();">Sign Out</button>  
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
                                    <h2>Menu Productos</h2>
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
                        <div class="icon-card mb-30">
                            <div class="imagenes-container ">
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/assets/iconosoposibles/agregarSinFondo.png" alt="Post"  id="btn_accion" name="btn_accion"/> 
                                </div>
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/assets/iconosoposibles/modificarSinFondo.png" alt="Guardado"  id="btn_guardar" name="btn_guardar"/> 
                                </div>
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/assets/iconosoposibles/eliminarSinFondo.png" alt="Cambio" id="btn_cambio" name="btn_cambio" /> 
                                </div>
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/assets/iconosoposibles/buscarSinFondo.png" alt="Devolucion" id="btn_dev" name="btn_dev"  /> 
                                </div>
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/assets/iconosoposibles/estadisticaSinFondo.png" alt="Boleta" id="btn_boleta" name="btn_boleta" /> 
                                </div>
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/assets/iconosoposibles/calculadoraSinFondo.png" alt="Mayoreo" id="btn_mayoreo" name="btn_mayoreo" /> 
                                </div>
                            </div>
                            <!-- End Icon Cart -->
                        </div>
                    </div>
                    <!-- ========== title-wrapper end ========== -->

            </section>
            <iframe 
                width="100%" 
                height="380px" 
                frameborder="0" 
                scrolling="yes" 
                id="inlineFrameExample">
            </iframe>

        </div>
        <!-- end container -->

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
    <script src="${pageContext.request.contextPath}/assets/validadores/validadores.js"></script>

</body>
</html>
