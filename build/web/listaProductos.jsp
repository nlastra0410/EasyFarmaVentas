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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    $(function() {
  var availableTags = new Array();

  $("#codProd").bind("keydown", function(event) {
    var data = { codProd: $("#codProd").val() };
    $.getJSON("buscadorPredictivo", data, function(res, est, jqXHR) {
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
                  <form method="post" action="productoServlet" id="f_listar" name="f_listar">
                      <input id="codProd" name="codProd" type="text" placeholder="Search..."  />
                    <button><i class="lni lni-search-alt"></i></button>
                    <input type="hidden" name="accion" id="accion" value="actualizar"> 
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
                          <th><h6>SKU</h6></th>
                          <th><h6>Producto</h6></th>
                          <th><h6>Stock</h6></th>
                          <th><h6>Valor</h6></th>
                          <th><h6>Veces</h6></th>
                          <th><h6>Principio Activo</h6></th>
                          <th><h6>Detalle</h6></th>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                         <c:forEach var="listaProd" items="${listaProd}">
                             <tr>
                                <td scope="row"><a href="productoServlet?SKU=${listaProd.getSKU()}&accion=editar&accionEdit=accionEdit"><img src="dist/img/edit.png" alt="Modificar" style="width: 30px; height: 30px"/></a></td>
                                <td scope="row">${listaProd.getSKU()}</td>
                                <td scope="row">${listaProd.getNombre()}</td>
                                <td scope="row">${listaProd.getCantidad()}</td>
                                <td scope="row">${listaProd.getPrecio1()}</td>
                                <td scope="row">${listaProd.getPrecioConvenio()}</td>
                                <td scope="row">${listaProd.getMaximo()}</td>
                                <td scope="row">${listaProd.getActivo()}</td>
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
