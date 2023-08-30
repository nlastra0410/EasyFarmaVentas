<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Boton Pagar con Popup</title>
  <style >
    /* Estilo del popup */
    #popup {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #f9f9f9;
      padding: 20px;
      border: 1px solid #ccc;
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
      z-index: 9999;
    }
    /* Estilo de los botones dentro del popup */
    #popup button {
      margin-right: 10px;
      background-color: #0a58ca; /* Blue color for the buttons */
      color: #fff; /* White text color */
      border: none;
      padding: 10px 20px;
      cursor: pointer;
      border-radius: 5px; /* Adding rounded corners to the buttons */
    }
    /* Estilo del texto dentro del popup */
    #popup p {
      color: #000; /* White text color */
    }

    /* Estilo para que las cajas de texto ocupen todo el ancho */
    #popup input[type="text"], #popup select {
      width: 100%;
    }
     /* Estilo para alinear el botón a la derecha */
    #popup .boton-derecha {
      text-align: right;
    }
    
    
    /* Estilo del botón para abrir el modal */
button {
  padding: 10px 20px;
  background-color: #0a58ca;
  color: #fff;
  border: none;
  cursor: pointer;
}

/* Estilo del modal */
.modal {
  display: none;
  position: absolute;
  top: 50%;
  left:50%;
  transform: translate(-50%, -50%);
  background-color: #f9f9f9;
  padding: 40px;
  border: 0.5px solid #ccc;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
  z-index: 9999;
}

/* Estilo del contenido del modal */
.modal-content {
  color: #000;
}

/* Estilo del botón para cerrar el modal */
.close {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 18px;
  cursor: pointer;
}

    

    
  </style>

  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js" integrity="sha512-qZvrmS2ekKPF2mSznTQsxqPgnpkI4DNTlrdUmTzrDgektczlKNRRhy5X5AAOnx5S09ydFYWWNSfcEqDTTHgtNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</head>
<body onload="mostrarPopup();mostrarModal();recopilarInfo();disableInputFields();traeCiudades();">
  <!-- Botón para abrir el popup -->
  <!-- Contenido del popup -->
  <div id="popup">
    <p><img src="../assets/img/iconosVentas/signoPeso.png" alt="" style="width: 26px; height: 26px;"/>   Metodo de pago:</p>
    <p>Selecciona el metodo de pago:</p>
    <input type="radio" name="medioPagoTarjeta" id="medioPagoTarjeta" value="tarjeta">TARJETA
    <input type="radio" name="medioPagoEfectivo" id="medioPagoEfectivo" value="efectivo">EFECTIVO
    <br>
    <br>
    <!-- Modal -->
  <div class="modal" id="myModal">
    <div class="modal-content">
      <span class="close" onclick="cerrarModal()">&times;</span>
      <h2 style="font-size: 20px">Recuerda los beneficios de ser cliente registrado</h2>
      <button id="botonModal" name="botonModal" onclick="cerrarModal()">OK</button>
    </div>
  </div>
    <br>
    <br>
        <input placeholder="Rut" type="text" id="rut" style ="width: 47%;">
        <button id="agregarCliente" name="agregarCliente" onclick="agregarCliente()">AGREGAR CLIENTE</button>
    <br>
    <br>
    <hr>
            <input type="hidden" id="hiddenRutPlus" value="">
            <input type="hidden" id="hiddenNombre" value="">
            <input type="hidden" id="hiddenP1" value="">
            <input type="hidden" id="hiddenP2" value="">
            <input type="hidden" id="hiddenCantidad" value="">
            <input type="hidden" id="hiddenTotalFinal" value="">
            <input type="hidden" id="hiddenTotalFinalEasy" value="">
            <input type="hidden" id="hiddenDescuento" value="">
            <input type="hidden" id="hiddenCorreo" value="">
            <input type="hidden" id="hiddenTipoDoc" value="">
            <input type="hidden" id="hiddenNumeroDoc" value="">
            <input type="hidden" id="hiddenProveedor" value="">
            <input type="hidden" id="hiddenUsuario" value="">
            <input type="hidden" id="hiddenSku" value="">
            <input type="hidden" id="hiddenDireccion" value="">
            <input type="hidden" id="hiddenZip" value="">
            <input type="hidden" id="hiddenRegion" value="">
            <input type="hidden" id="hiddenCiudad" value="">
            <input type="hidden" id="hiddenProvincia" value="">
     
          
   

    <br>
        <input placeholder="NOMBRE CLIENTE" type="text" id="nombreCliente">
    <br>
    <br>
        <input placeholder="CORREO ELECTRONICO" type="text" id="correo">
    <br>
    <br>
        <input type="checkbox" id="usarMismaDireccion">
        <label for="usarMismaDireccion">DIRECCION CLIENTE</label>
    <br> 
    <br>
        <input placeholder="DIRECCION" type="text" id="address">
    <br>
    <br>
        <input placeholder="ZIP/CODIGO POSTAL" type="text" id="zipCode">
    <br>
    <br>
        <label for="country">PAIS/REGION:</label>
    <br> 
        <input type="hidden" value="" name="sku" id="sku">
<br><br>
    Ciudad:
        <select name="ciudad" id="ciudad">
       
        </select>
<br><br>
    Provincia:
        <select name="provincia" id="provincia">
           
        </select>
<br><br>
    Region:
        <select name="region" id="region">
           
        </select>
    <br>
    <br>
    Total a Pagar
    <div class="">
        
        <br>
        <td><input placeholder="Total" type="text" id="totalTD" name="totalTD"></td>
        <br>
        <br>
        <button onclick="cerrarPopup()">Generar Pago</button>
    </div>
       
    <div id="tablaProductos" style="display: none"></div>   
         
       
  </div>
  <!-- Script para mostrar y ocultar el popup -->
  <script>
    function disableInputFields() {
             var inputFields = document.querySelectorAll('input[type="text"]');
            var buttons = document.querySelectorAll('button');

            for (var i = 0; i < inputFields.length; i++) {
                inputFields[i].disabled = true;
            }

            for (var i = 0; i < buttons.length; i++) {
                if (buttons[i].id !== 'botonModal') {
                    buttons[i].disabled = true;
                }
            }
    }
    function agregarCliente(){
        
    }
    function recopilarInfo(){
        // Get the URL parameters
        var urlParams = new URLSearchParams(window.location.search);

        // Extract the values
        var rutPlus = urlParams.get('rutPlus');
        var nombre = urlParams.get('nombre');
        var p1 = urlParams.get('p1');
        var p2 = urlParams.get('p2');
        var cantidad = urlParams.get('cantidad');
        var totalFinal = urlParams.get('totalFinal');
        var totalFinalEasy = urlParams.get('totalFinalEasy');
        var descuento = urlParams.get('descuento');
        var usuarioVentas = urlParams.get('usuario');
        var proveedor = urlParams.get('proveedor');
        var sku = urlParams.get('sku');
        var TipoDoc = urlParams.get('TipoDoc');
        var correo = urlParams.get('correo');
        

                    
        var message = 
             "rutPlus: " + rutPlus + "\n" +
             "nombre: " + nombre + "\n" +
             "p1: " + p1 + "\n" +
             "p2: " + p2 + "\n" +
             "cantidad: " + cantidad + "\n" +
             "totalFinal: " + totalFinal + "\n" +
             "totalFinalEasy: " + totalFinalEasy + "\n" +
             "descuento: " + descuento + "\n" +
             "usuarioVentas: " + usuarioVentas + "\n" +
             "proveedor: " + proveedor + "\n" +
             "sku: " + sku + "\n" +
             "TipoDoc: " + TipoDoc + "\n" +
             "correo: " + correo;
            // Display the extracted values
            console.log("rutPlus:", rutPlus);
            console.log("nombre:", nombre);
            console.log("p1:", p1);
            console.log("p2:", p2);
            console.log("cantidad:", cantidad);
            console.log("totalFinal:", totalFinal);
            console.log("totalFinalEasy:", totalFinalEasy);
            console.log("descuento:", descuento);
            console.log("usuarioVentas:", usuarioVentas);
            console.log("proveedor:", proveedor);
            console.log("sku:", sku);
            console.log("TipoDoc:", TipoDoc);
            console.log("correo:", correo);
            
            // Get the input element
            var rutInput = document.getElementById('rut');
            var nombreInput = document.getElementById('nombreCliente');
            var correoInput = document.getElementById('correo');
            var direccionInput = document.getElementById('address');
            var zipInput = document.getElementById('zipCode');
            var regionInput = document.getElementById('region');
            var ciudadInput = document.getElementById('ciudad');
            var provinciaInput = document.getElementById('provincia');
            var totalInput = document.getElementById('totalTD');
            var skuInput = document.getElementById("sku");
            var ndoc = document.getElementById("ndoc");

            // Set the value of the input if rutPlus is not null
            if (rutPlus !== null) {
                rutInput.value = rutPlus;
            }
  
            if (correo !== null) {
                correoInput.value = correo;
            }
             
            if (totalFinal !== null) {
                 totalInput.value = totalFinal;   
            }
            
            if (sku !== null) {
                 skuInput.value = sku;   
            }
         //alert(message);
    }
    function mostrarPopup() {
      var popup = document.getElementById('popup');
      popup.style.display = 'block';
    }
    function cerrarPopup() {
      
      var confirmarCerrar = window.confirm('¿Está seguro de que desea Pagar y cerrar el popup?');
      if (confirmarCerrar) {
        var popup = document.getElementById('popup');
        popup.style.display = 'none';
       // window.close();
            saveFormData();
      console.log("Se cierra WINDOWS")
        }
    }
    
    function mostrarModal(){
      //LLENA CAMPOS OCULTOS
            var urlParams = new URLSearchParams(window.location.search);
            document.getElementById("hiddenRutPlus").value          	    =  urlParams.get('rutPlus');
            document.getElementById("hiddenNombre").value                   =  urlParams.get('nombre');
            (document.getElementById("hiddenP1").value)                     =  urlParams.get('p1');
            (document.getElementById("hiddenP2").value)                     =  urlParams.get('p2');
            (document.getElementById("hiddenCantidad").value)               =  urlParams.get('cantidad'); 
            (document.getElementById("hiddenTotalFinal").value)             =  urlParams.get('totalFinal');
            (document.getElementById("hiddenTotalFinalEasy").value)         =  urlParams.get('totalFinalEasy'); 
            (document.getElementById("hiddenDescuento").value)              =  urlParams.get('descuento');
            document.getElementById("hiddenCorreo").value                   =  urlParams.get('correo');
            document.getElementById("hiddenTipoDoc").value                  =  urlParams.get('TipoDoc');
            document.getElementById("hiddenNumeroDoc").value                =  urlParams.get('ndoc');
            document.getElementById("hiddenProveedor").value                =  urlParams.get('proveedor');
            document.getElementById("hiddenUsuario").value                  =  urlParams.get('usuario');
            document.getElementById("hiddenSku").value                      =  urlParams.get('sku');
            document.getElementById("hiddenDireccion").value                =  document.getElementById("address").value;
            document.getElementById("hiddenZip").value                      =  document.getElementById("zipCode").value;
            document.getElementById("hiddenNumeroDoc").value                =  urlParams.get('ndoc');
      //FIN LLENA CAMBIOS OCULTOS
      //obtenerProductosVenta();
      var modal = document.getElementById('myModal');
      modal.style.display = 'block';
    }

    function cerrarModal() {
      var modal = document.getElementById('myModal');
      modal.style.display = 'none';
    }
    
        function traeCiudades() {
         $.ajax({
        url: "${pageContext.request.contextPath}/ciudadServlet",
        type: "GET",
        dataType: "text",
        success: function(data) {
            var ubicaciones = data.split("|");
            llenarCombobox(ubicaciones[0].split(":")[1].split(","), "ciudad");
            llenarCombobox(ubicaciones[1].split(":")[1].split(","), "provincia");
            llenarCombobox(ubicaciones[2].split(":")[1].split(","), "region");
        },
        error: function(xhr, status, error) {
            console.log("Error al cargar la información de ubicación: " + error);
        }
    });
}

function llenarCombobox(data, comboboxId) {
    var combobox = document.getElementById(comboboxId);
    for (var i = 0; i < data.length; i++) {
        var option = document.createElement("option");
        option.text = data[i];
        combobox.appendChild(option);
    }
}              

    function saveFormData() {
    var formData = {
        rut: $('#rut').val(),
        nombre: $('#hiddenNombre').val(),
        direccion: $('#address').val(),
        zip: $('#zipCode').val(),
        region: $('#region').val(),
        ciudad: $('#ciudad').val(),
        provincia: $('#provincia').val(),
        correo: $('#correo').val(),
        sku: $('#sku').val(),
        total: $('#totalTD').val(),
        p1: $('#hiddenP1').val(),
        p2: $('#hiddenP2').val(),
        cantidad: $('#hiddenCantidad').val(),
        totalFinal: $('#hiddenTotalFinal').val(),
        totalFinalEasy: $('#hiddenTotalFinalEasy').val(),
        descuento: $('#hiddenDescuento').val(),
        usuario: $('#hiddenUsuario').val(),
        proveedor: $('#hiddenProveedor').val(),
        TipoDoc: $('#hiddenTipoDoc').val(),
        numeroDoc: $('#hiddenNumeroDoc').val(),
        mpagoTarjeta: $('#medioPagoTarjeta').val(),
        mpagoEfectivo: $('#medioPagoEfectivo').val(),
        cuotas: '0'
    };
    //alert('${pageContext.request.contextPath}/SaveDataServlet');
    fetch('${pageContext.request.contextPath}/SaveDataServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Error saving data');
        }
        return response.text();
    })
    .then(data => {
        generatePDF(formData);
    })
    .catch(error => {
        console.error('Error saving data:', error);
    });
}

function generatePDF(formData) {
    var fechaHoraActual = new Date();
    var horas = fechaHoraActual.getHours();
    var minutos = fechaHoraActual.getMinutes();
    var segundos = fechaHoraActual.getSeconds();

    // Determinar si es AM o PM
    var periodo = horas >= 12 ? "PM" : "AM";

    // Convertir las horas al formato de 12 horas
    if (horas > 12) {
        horas -= 12;
    } else if (horas === 0) {
        horas = 12; // La medianoche se muestra como 12 AM
    }

    // Formatear los minutos y segundos para asegurarse de que tengan dos dígitos
    if (minutos < 10) {
        minutos = "0" + minutos;
    }
    if (segundos < 10) {
        segundos = "0" + segundos;
    }

    // Mostrar la hora en el formato "HH:mm:ss AM/PM"
    var horaFormateada = horas + ":" + minutos + ":" + segundos + " " + periodo;
    var fechaFormateada = moment(fechaHoraActual).format('DD/MM/YY');
        horaFormateada = moment(fechaHoraActual).format('hh:mm:ss A');
    var total = parseInt(formData.p1 * formData.cantidad);
    var porcentaje = 0.19;
    var impuesto = total * porcentaje;
    var metodoPago = formData.metodoPago === 'tarjeta' ? 'Tarjeta' : 'Efectivo';
    var pagoInfo = metodoPago + '-XXX-VVV-' + formData.cuotas;
    var content = [
                    '-------------------------------------------------------------',
                    { text: 'TICKET DE COMPRA', style: 'header' },
                    '-------------------------------------------------------------',
                    { text: 'EASY FARMA 76846124-4' },
                    { text: 'Direccion: Manuel Peñafiel' },
                    { text: ' 2840 L4y5 Ovalle' },
                    { text: 'Vendedor: Administrador' },
                    { text: fechaFormateada + ' ' + horaFormateada },
                    '-------------------------------------------------------------',
                    { text: 'sku-producto-cantidad-Unitario-total ' },
                    { text: formData.sku },
                    { text: formData.nombre + '-' + formData.cantidad + '-' + formData.p1 + '-' + parseInt(formData.p1 * formData.cantidad) },
                    '-------------------------------------------------------------',
                    { text: 'Sub Total: ' + parseInt(total - impuesto) },
                    { text: 'Iva:       ' + impuesto },
                    { text: 'Total:     ' + total },
                    '-------------------------------------------------------------',
                    { text: 'Tipo-Codigo-Autorizacion-Cuotas ' },
                    { text: pagoInfo + '-XXX-VVV-' + formData.cuotas },
                    '-------------------------------------------------------------',
                    { text: 'Total: $' + formData.totalFinalEasy },
                    '-------------------------------------------------------------',
                    { text: 'Codigo De Barra' },
                    { text: 'e' },
                    { text: 'Informacion Para Añadir' },
    ];

    var docDefinition = {
        content: content,
        styles: {
            header: {
                fontSize: 16,
                bold: true
            }
        }
    };

    pdfMake.createPdf(docDefinition).download('client_report.pdf');

    // Llamar a la función para imprimir (si es necesario)
    printTicket();
}

// Función para imprimir el ticket (debe estar implementada en tu código)
function printTicket() {
    // Implementa la lógica para imprimir el ticket aquí
    // Esto puede requerir una interacción con la impresora y su controlador
    alert('Ticket impreso');
}
 


  document.addEventListener("DOMContentLoaded", function() {
    // Get radio buttons
    var medioPagoTarjetaRadio = document.getElementById("medioPagoTarjeta");
    var medioPagoEfectivoRadio = document.getElementById("medioPagoEfectivo");

    // Get input fields and buttons
    var inputFields = document.querySelectorAll('input[type="text"]');
    var buttons = document.querySelectorAll('button');

    // Function to enable input fields and buttons
    function enableInputFieldsAndButtons() {
        for (var i = 0; i < inputFields.length; i++) {
            inputFields[i].disabled = false;
        }

        for (var i = 0; i < buttons.length; i++) {
            buttons[i].disabled = false;
        }
    }

    // Function to disable input fields and buttons
    function disableInputFieldsAndButtons() {
        for (var i = 0; i < inputFields.length; i++) {
            inputFields[i].disabled = true;
        }

        for (var i = 0; i < buttons.length; i++) {
            buttons[i].disabled = true;
        }
         for (var i = 0; i < buttons.length; i++) {
                if (buttons[i].id !== 'botonModal') {
                    buttons[i].disabled = true;
                }
            }
    }

    // Listen for radio button changes
    medioPagoTarjetaRadio.addEventListener("change", function() {
        if (medioPagoTarjetaRadio.checked) {
            enableInputFieldsAndButtons();
            medioPagoEfectivoRadio.checked = false; // Uncheck the other radio button
        }
    });

    medioPagoEfectivoRadio.addEventListener("change", function() {
        if (medioPagoEfectivoRadio.checked) {
            enableInputFieldsAndButtons();
            medioPagoTarjetaRadio.checked = false; // Uncheck the other radio button
        }
    });

    // Initial state: Disable all input fields and buttons
    disableInputFields();
});
    
    function obtenerProductosVenta() {
                var numerodocumento = document.getElementById("hiddenNumeroDoc").value; // El número de documento que deseas obtener

                $.ajax({
                    url: "${pageContext.request.contextPath}/productoVentaServlet?numerodocumento=" + numerodocumento,
                    type: "GET",
                    dataType: "text",
                    success: function(data) {
                        mostrarProductos(data);
                    },
                    error: function(xhr, status, error) {
                        console.log("Error al obtener productos de venta: " + error);
                    }
                });
            }

        function mostrarProductos(data) {
            var productos = JSON.parse(data); // Parsear el JSON

            var tabla = document.createElement("table");
            tabla.setAttribute("border", "1");

            // Crear encabezado de la tabla
            var encabezado = tabla.createTHead();
            var filaEncabezado = encabezado.insertRow();
            for (var propiedad in productos[0]) {
                var celdaEncabezado = filaEncabezado.insertCell();
                celdaEncabezado.innerHTML = propiedad;
            }

            // Crear filas con los productos
            var cuerpoTabla = tabla.createTBody();
            for (var i = 0; i < productos.length; i++) {
                var filaProducto = cuerpoTabla.insertRow();
                for (var propiedad in productos[i]) {
                    var celdaProducto = filaProducto.insertCell();
                    celdaProducto.innerHTML = productos[i][propiedad];
                }
            }

            // Agregar la tabla al elemento deseado en tu página HTML
            var contenedorTabla = document.getElementById("tablaProductos");
            contenedorTabla.innerHTML = ""; // Limpiar el contenido previo
            contenedorTabla.appendChild(tabla);
           // obtenerProductosYCantidadDeTabla();
        }

 /*function obtenerProductosYCantidadDeTabla() {
    var tabla = document.getElementById("tablaProductos"); // Obtener la tabla por su ID
    var filas = tabla.getElementsByTagName("tr"); // Obtener todas las filas de la tabla
    
    var productosYCantidad = [];

    for (var i = 1; i < filas.length; i++) { // Comenzar desde 1 para omitir la fila de encabezado
        var celdas = filas[i].getElementsByTagName("td"); // Obtener las celdas de la fila

        var producto = celdas[2].innerText; // El valor de la tercera celda (índice 2) es el producto
        var cantidad = celdas[3].innerText; // El valor de la cuarta celda (índice 3) es la cantidad

        productosYCantidad.push({
            producto: producto,
            cantidad: cantidad
        });
    }

    return productosYCantidad;
}
function mostrarProductosYCantidadEnTextarea() {
    var productosYCantidad = obtenerProductosYCantidadDeTabla(); // Llama a la función anterior para obtener los datos

    var textareaProductosCantidad = document.getElementById("textareaProductosCantidad");
    var contenido = "";

    for (var i = 0; i < productosYCantidad.length; i++) {
        contenido += productosYCantidad[i].producto + ": " + productosYCantidad[i].cantidad + "\n";
    }

    textareaProductosCantidad.value = contenido;
}*/


 
    
    
  </script>
</body>
</html>
