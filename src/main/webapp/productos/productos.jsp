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
                  <h6>Agregar Productos</h6>
                </div>
                  <form action="${pageContext.request.contextPath}/productoServlet" method="POST" >
                      <input type="hidden" value="agregar" name="accion">
                      <input type="hidden" value="agregar2" name="accionEdit">
                  <div class="row">
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>SKU</label>
                        <input id="CodSKU" name="CodSKU" type="text" placeholder="Codigo SKU" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Nombre Producto</label>
                        <input id="nombreProd" name="nombreProd" type="text" placeholder="Producto" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Principio Activo</label>
                        <input id="PrincipioActivo" name="PrincipioActivo" type="text" placeholder="Principio Activo" />
                      </div>
                    </div>
                    <div class="title mb-30">
                        <h6>Sobre el Producto</h6>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Contenido</label>
                        <input id="Contenido" name="Contenido" type="text" placeholder="Contenido" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Usos</label>
                        <input name="Usos" id="Usos" type="text" placeholder="Usos" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Contraindicaciones</label>
                        <input id="Contraindicaciones" name="Contraindicaciones" type="text" placeholder="Contraindicaciones" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Departamento</label>
                        <div class="select-position">
                            <select class="light-bg" id="Departamento" name="Departamento">
                            <option >Select category</option>
                            <option value="Perfumeria">Perfumeria</option>
                            <option value="Dermatologia">Dermatologia</option>
                            <option value="Cosmetica">Cosmetica</option>
                            <option value="Medicamentos">Medicamentos</option>
                            <option value="Liquidos">Liquidos</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Descripci�n</label>
                        <textarea id="Escribiraqui" name="Escribiraqui" placeholder="Escribir aqu�" rows="6"></textarea>
                      </div>
                    </div>
                      <div class="title mb-30">
                        <h6>Stock</h6>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Cantidad</label>
                        <input id="Cantidad" name="Cantidad" type="text" placeholder="Cantidad" oninput="validarNumeros(this)" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Minimo</label>
                        <input id="Minimo" name="Minimo" type="text" placeholder="M�nimo" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Maximo</label>
                        <input id="Maximo" name="Maximo" type="text" placeholder="M�ximo" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="select-style-1">
                        <label>Sucursal</label>
                        <div class="select-position">
                            <select class="light-bg" id="Sucursal" name="Sucursal">
                            <option value="">Select category</option>
                            <option value="OVALLE">OVALLE</option>
                            <option value="PROVIDENCIA">PROVIDENCIA</option>
                            <option value="WEB">PAGINA WEB</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Descripci�n</label>
                        <textarea id="EscribiraquiDesc" name="EscribiraquiDesc" placeholder="Escribir aqu�" rows="6"></textarea>
                      </div>
                    </div>
                     <div class="title mb-30">
                        <h6>Precio</h6>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Precio de compra</label>
                        <input id="precioCompra" name="precioCompra" type="text" placeholder="Precio" oninput="validarNumeros(this)" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Iva</label>
                        <input id="iva" name="iva" type="text" placeholder="Iva" oninput="validarNumeros(this)" />
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Impuesto 2</label>
                        <input id="impuesto2" name="impuesto2" type="text" placeholder="Impuesto" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                    <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Impuesto 3</label>
                        <input id="impuesto3" name="impuesto3" type="text" placeholder="Impuesto" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Margen</label>
                        <input id="margen" name="margen" type="text" placeholder="Margen" oninput="validarNumeros(this)" />
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Descuento</label>
                        <input id="descuento" name="descuento" type="text" placeholder="Descuento" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                      <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio Sugerido</label>
                        <input id="precioSugerido" name="precioSugerido" type="text" placeholder="Precio" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio 1</label>
                        <input id="precio1" name="precio1" type="text" placeholder="Precio" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio 2</label>
                        <input id="precio2" name="precio2" type="text" placeholder="Precio" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio Suscripcion</label>
                        <input id="precioSuscripcion" name="precioSuscripcion" type="text" placeholder="Suscripcion" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                       <div class="col-xxl-4">
                      <div class="input-style-1">
                        <label>Precio Convenio</label>
                        <input id="precioConvenio" name="precioConvenio" type="text" placeholder="Convenio" oninput="validarNumeros(this)"/>
                      </div>
                    </div>
                    <div class="col-xxl-6 col-lg-12 col-md-6">
                        <div class="form-check checkbox-style mb-30">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            value="Venta Presencial"
                            id="ventaPresencial"
                            name="ventaPresencial"
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
                            value="Venta Online"
                            id="ventaOnline"
                            name="ventaOnline"
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
                            value="Receta"
                            id="receta"
                            name="receta"
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
                            value="Receta Retenida"
                            id="recetaRetenida"
                            name="recetaRetenida"
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
                            value="Solo Retiro en Tienda"
                            id="retiroTienda"
                            name="retiroTienda"
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
                        <label>Descripci�n</label>
                        <textarea id="Descripcion" name="Descripcion" placeholder="Escribir aqu�" rows="6"></textarea>
                      </div>
                    </div>
                      <div id="mensaje"></div>
                    <div class="col-12">
                      <button id="botonGuardar" disabled class="main-btn primary-btn btn-hover">
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
    <script src="${pageContext.request.contextPath}/assets/validadores/validadores.js"></script>
  </body>
</html>
