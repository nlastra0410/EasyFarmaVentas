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
    <div class="overlay"></div>
    <!-- ======== sidebar-nav end =========== -->
    <!-- ======== main-wrapper start =========== -->
    
      <!-- ========== header start ========== -->
      <header class="header">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-5 col-md-5 col-6">
              <div class="header-left d-flex align-items-center" >
                 INGRESE SKU
                  <div class="header-search d-none d-md-flex"width="100%">
                  <form action="#">
                      <input type="text" placeholder="Search..."  />
                    <button><i class="lni lni-search-alt"></i></button>
                    
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
                          <th><h6>Cantidad</h6></th>
                          <th><h6>Valor</h6></th>
                          <th><h6>Convenio</h6></th>
                          <th><h6>Codigo Descuento</h6></th>
                          <th><h6>Total</h6></th>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                        <tr>
                            <td class="min-width"><input type="checkbox"></td>
                          <td class="min-width"></td>
                          <td class="min-width"></td>
                          <td class="min-width"></td>
                          <td class="min-width"></td>
                          <td class="min-width"></td>
                          <td class="min-width"></td>
                          <td class="min-width"></td>                          
                        </tr>
                        <!-- end table row -->
                      </tbody>
                    </table>
                    <!-- end table -->
                  </div>
          </div>
        </div>
      </header>
      <!-- ========== header end ========== -->
      </section>
   
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
