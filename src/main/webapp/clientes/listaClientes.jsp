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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    $(function() {
            var availableTags = new Array();

            $("#codProd").bind("keydown", function(event) {
              var data = { codProd: $("#codProd").val() };
              $.getJSON("${pageContext.request.contextPath}/buscadorClientePredictivo", data, function(res, est, jqXHR) {
                availableTags.length = 0;
                $.each(res, function(i, item) {
                  availableTags[i] = item;
                });
              });
            });

            $("#codProd").autocomplete({
              source: availableTags,
              minLength: 1
            });
          });

        </script>
  </head>
  <body>
    <div class="overlay"></div>
    <!-- ======== sidebar-nav end =========== -->
    <!-- ======== main-wrapper start =========== -->
    
      <!-- ========== header start ========== -->
      <header class="header">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-5 col-md-5 col-6">
              <div class="header-left d-flex align-items-center"  >
                 INGRESE SKU
                  <div class="header-search d-none d-md-flex">
                  <form method="post" action="${pageContext.request.contextPath}/clienteServlet" id="f_listar" name="f_listar">
                      <input id="codProd" name="codProd" type="text" placeholder="Search..."  />
                    <button><i class="lni lni-search-alt"></i></button>
                    <input type="hidden" name="accion" id="accion" value="buscar"> 
                    <input type="hidden" name="accionModificar" id="accionModificar" value="modificarPersona2"> 
                    <input type="hidden" name="accionEliminar" id="accionEliminar" value="accionEliminar2"> 
                  </form>
                </div>
                
                 
              </div>
                
            </div>
             
              <br>
              <br>
              <br>
         <div class="table-wrapper table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th><h6>Check</h6></th>
                          <th><h6>Rut</h6></th>
                          <th><h6>Nombre</h6></th>
                          <th><h6>Direccion</h6></th>
                          <th><h6>Email</h6></th>
                          <th><h6>Plus</h6></th>
                          <th><h6>Profesion</h6></th>
                          <th><h6>Telefono</h6></th>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                         <c:forEach var="listaCli" items="${listaCli}">
                             <tr>
                                <td scope="row"></td>
                                <td scope="row">${listaCli.getRut()}-${listaCli.getDv()}</td>
                                <td scope="row">${listaCli.getNombre()} ${listaCli.getApellido()}</td>
                                <td scope="row">${listaCli.getDireccion()}</td>
                                <td scope="row">${listaCli.getEmail()}</td>
                                <td scope="row">${listaCli.getPlus()}</td>
                                <td scope="row">${listaCli.getProfesion()}</td>
                                <td scope="row">${listaCli.getTelefono()}</td>
                                <%--  <td scope="row">${listaProd.getDescripcion()}</td> --%>
                            </tr>
                          </c:forEach> 
                        <!-- end table row -->
                      </tbody>
                    </table>
                    <!-- end table -->
                  </div>
          </div>
        </div>
      </header>
      <!-- ========== header end ========== -->
      
   
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
  </body>
</html>
