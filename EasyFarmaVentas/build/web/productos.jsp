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
                  <h6>Agregar Productos</h6>
                </div>
                <form action="#">
                  <div class="row">
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>SKU</label>
                        <input type="text" placeholder="Codigo SKU" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Nombre Producto</label>
                        <input type="email" placeholder="Email" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Principio Activo</label>
                        <input type="text" placeholder="Principio Activo" />
                      </div>
                    </div>
                    <div class="title mb-30">
                        <h6>Sobre el Producto</h6>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Contenido</label>
                        <input type="text" placeholder="Contenido" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Usos</label>
                        <input type="text" placeholder="Usos" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Contraindicaciones</label>
                        <input type="text" placeholder="Contraindicaciones" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Departamento</label>
                        <div class="select-position">
                          <select class="light-bg">
                            <option value="">Select category</option>
                            <option value="">Perfumeria</option>
                            <option value="">Dermatologia</option>
                            <option value="">Cosmetica</option>
                            <option value="">Medicamentos</option>
                            <option value="">Liquidos</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Descripción</label>
                        <textarea placeholder="Escribir aquí" rows="6"></textarea>
                      </div>
                    </div>
                      <div class="title mb-30">
                        <h6>Stock</h6>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Cantidad</label>
                        <input type="text" placeholder="Cantidad" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Minimo</label>
                        <input type="text" placeholder="Mínimo" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Maximo</label>
                        <input type="text" placeholder="Máximo" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Sucursal</label>
                        <div class="select-position">
                          <select class="light-bg">
                            <option value="">Select category</option>
                            <option value="">Perfumeria</option>
                            <option value="">Dermatologia</option>
                            <option value="">Cosmetica</option>
                            <option value="">Medicamentos</option>
                            <option value="">Liquidos</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Descripción</label>
                        <textarea placeholder="Escribir aquí" rows="6"></textarea>
                      </div>
                    </div>
                     <div class="title mb-30">
                        <h6>Precio</h6>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Precio de compra</label>
                        <input type="text" placeholder="Precio" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Iva</label>
                        <input type="text" placeholder="Iva" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Impuesto 2</label>
                        <input type="text" placeholder="Impuesto" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Impuesto 3</label>
                        <input type="text" placeholder="Impuesto" />
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Margen</label>
                        <input type="text" placeholder="Margen" />
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Descuento</label>
                        <input type="text" placeholder="Descuento" />
                      </div>
                    </div>
                      <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio Sugerido</label>
                        <input type="text" placeholder="Precio" />
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio 1</label>
                        <input type="text" placeholder="Precio" />
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio 2</label>
                        <input type="text" placeholder="Precio" />
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio Suscripcion</label>
                        <input type="text" placeholder="Suscripcion" />
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio Convenio</label>
                        <input type="text" placeholder="Convenio" />
                      </div>
                    </div>
                    <div class="col-xxl-6 col-lg-12 col-md-6">
                        <div class="form-check checkbox-style mb-30">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            value=""
                            id="checkbox-remember"
                          />
                          <label
                            class="form-check-label"
                            for="checkbox-remember"
                          >
                            Venta Presencial</label
                          >
                          
                        </div>
                         <div class="form-check checkbox-style mb-30">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            value=""
                            id="checkbox-remember"
                          />
                          <label
                            class="form-check-label"
                            for="checkbox-remember"
                          >
                            Venta Online</label
                          >
                          
                        </div>
                         <div class="form-check checkbox-style mb-30">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            value=""
                            id="checkbox-remember"
                          />
                          <label
                            class="form-check-label"
                            for="checkbox-remember"
                          >
                            Receta</label
                          >
                          
                        </div>
                         <div class="form-check checkbox-style mb-30">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            value=""
                            id="checkbox-remember"
                          />
                          <label
                            class="form-check-label"
                            for="checkbox-remember"
                          >
                            Receta Retenida</label
                          >
                          
                        </div>
                         <div class="form-check checkbox-style mb-30">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            value=""
                            id="checkbox-remember"
                          />
                          <label
                            class="form-check-label"
                            for="checkbox-remember"
                          >
                            Solo Retiro en Tienda</label
                          >
                          
                        </div>
                      </div>
                   <div class="col-12">
                      <div class="input-style-1">
                        <label>Descripción</label>
                        <textarea placeholder="Escribir aquí" rows="6"></textarea>
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
