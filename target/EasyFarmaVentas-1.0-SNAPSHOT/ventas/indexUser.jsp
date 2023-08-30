<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="viewport"  content="width=device-width, initial-scale=1, maximun-scale=2" />

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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/estilos.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <link href="${pageContext.request.contextPath}/assets/css/modal.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/123assets/validadores/validadores.js" type="text/javascript"></script>
        <script>

            $(function () {
                $("#codProd").autocomplete({
                    source: function (request, response) {
                        $.getJSON("${pageContext.request.contextPath}/ProductoGSON", {codProd: request.term})
                                .done(function (data) {
                                    response(data);
                                })
                                .fail(function () {
                                    response([]);
                                });
                    },
                    minLength: 1,

                    select: function (event, ui) {

                        var pFinal = ui.item.value;
                        var valores = pFinal.split(" $");
                        var n1 = valores[0].trim();
                        var p1 = parseFloat(valores[1].trim());
                        var p2 = parseFloat(valores[2].trim());
                        var sku = String(valores[3].trim());
                        // Obtener los datos del producto desde el servidor
                        // var producto = obtenerDatosProducto(ui.item.value);
                        // Buscar si ya existe un <td> con el mismo producto
                        var tdExistente = buscarTdExistente(n1);
                        //alert(tdExistente);

                        if (tdExistente !== null) {
                            // Si el <td> existe, incrementar en 1 la cantidad
                            var cantidadExistente = parseInt(tdExistente);
                            document.getElementById("id-" + n1).innerHTML = parseInt(cantidadExistente + 1);
                        } else {

                            obtenerPreciosProducto(n1)
                                    .then(function (precios) {

                                        var tdNombreHidden = $("<td>").text(n1).attr("id", "" + n1);
                                        // Agregar campo oculto para guardar el nombre del producto
                                        var hiddenNombre = $("<input>").attr("type", "hidden").val(n1);
                                        tdNombreHidden.append(hiddenNombre);
                                        var tdNombre = $("<td>").text(n1).attr("id", "" + n1);
                                        var tdPrecio1 = $("<td>").text(p1).attr("id", "p1" + n1);

                                        //hidden input
                                        var inputHidden = $("<input>").attr({
                                            type: "hidden",
                                            id: "skuVentas" + n1, // Reemplaza "inputHiddenId" por el id deseado
                                            name: "skuVentas" + n1, // Reemplaza "inputHiddenName" por el name deseado
                                            value: sku // Reemplaza "valor del input hidden" por el valor deseado
                                        });

                                        var tdPrecio2 = $("<td>").text(p2).attr("id", "p2" + n1);

                                        // Crear el icono de basurero utilizando <span> y <i>
                                        var iconoBasurero = $("<span>").addClass("icono-basurero").html("<i class='fas fa-trash'></i>");

                                        // Crear el elemento <td> para el icono basurero y asignar el evento onclick
                                        var tdIconoBasurero = $("<td>").addClass("td-icono-basurero").append(iconoBasurero).attr("onclick", "eliminarFila(this)").attr("id", "basurero-" + n1).attr("value", n1);

                                        // Crear el botón de flecha hacia abajo
                                        var botonFlechaAbajo = $("<button>").html("&#9660;").addClass("boton-flecha").attr("id", "flechaD" + n1).attr("onclick", "disminuirValor(this)").attr("value", n1);
                                        // Crear el botón de flecha hacia arriba
                                        var botonFlechaArriba = $("<button>").html("&#9650;").addClass("boton-flecha").attr("id", "flechaU" + n1).attr("onclick", "aumentarValor(this)").attr("value", n1);
                                        var tdBotonFlechaAbajo = $("<td>").append(botonFlechaAbajo).attr("style", "width: 5px;");
                                        var tdBotonFlechaArriba = $("<td>").append(botonFlechaArriba).attr("style", "width: 5px;");


                                        // Crear el elemento <td> de la cantidad y agregar los botones y el número de cantidad
                                        var tdCantidad = $("<td>").attr("id", "id-" + n1).addClass("cantidad-td");
                                        //var spanCantidad = $("<span>").text(1).addClass("cantidad-numero").css("font-size", "20px").attr("id", "miSpan");
                                        // tdCantidad.append(botonFlechaAbajo, " ", spanCantidad, " ", botonFlechaArriba);

                                        // Después de crear el elemento tdNombreHidden y el campo oculto hiddenNombre
                                        var selectProducto = $("#productoSeleccionado");
                                        var optionProducto = $("<option>").text(n1).attr("value", n1);
                                        selectProducto.append(optionProducto);

                                        var nuevoTr = $("<tr>").append(tdNombre, tdPrecio1, tdPrecio2, tdBotonFlechaAbajo, tdCantidad, tdBotonFlechaArriba, tdIconoBasurero, inputHidden)/*.addClass("scope").attr("scope", "row")*/;

                                        $("#miTablaBody").append(nuevoTr).addClass("scope").attr("scope", "row");
                                        document.getElementById("id-" + n1).innerHTML = 1;//la primera vez que agregamos un producto al carro lo deja en 1 
                                        var totalFinalElement = document.getElementById("totalFinal");
                                        var totalFinalContent = totalFinalElement.innerHTML;

                                        var totalFinalValue = parseInt(totalFinalContent);
                                        var PreciP1 = parseInt(document.getElementById("p1" + n1).innerHTML);

                                        totalFinalValue += PreciP1;
                                        totalFinalElement.innerHTML = totalFinalValue;

                                        var totalFinalElementEasy = document.getElementById("totalFinalEasy");
                                        var totalFinalContentEasy = totalFinalElementEasy.innerHTML;


                                        var totalFinalValueEasy = parseInt(totalFinalContentEasy);
                                        var PreciP2 = parseInt(document.getElementById("p2" + n1).innerHTML);

                                        totalFinalValueEasy += PreciP2;
                                        totalFinalElementEasy.innerHTML = totalFinalValueEasy;
                                        // Verificar si el elemento existe y su valor es null o undefined
                                        if (document.getElementById("traeModal") === "Nada" || document.getElementById("traeModal").value === "Nada") {
                                            // Llamar a la función para abrir el modal (openModal) aquí
                                            openModal();
                                        }
                                        // Obtener una referencia al botón por su ID
                                        var btnPagar = document.getElementById("btnPagar");
                                        // Habilitar el botón
                                        btnPagar.disabled = false;
                                    })
                                    .catch(function (error) {
                                        console.error('Error al obtener los precios:', error);
                                    });
                        }

                    }




                });

            });
            function AgregaCliente() {
                document.getElementById("inputRut").value;
                document.getElementById("clienteVenta").value;

            }
            function obtenerProd(ui) {
                $("#codProd").val("").focus();

                var pFinal = String(ui);
                //var pFinal = ui;
                //alert(pFinal);
                var valores = pFinal.split(" $");
                var n1 = valores[0].trim();
                var p1 = parseFloat(valores[1].trim());
                var p2 = parseFloat(valores[2].trim());
                var sku = parseFloat(valores[3].trim());
                // Obtener los datos del producto desde el servidor
                // var producto = obtenerDatosProducto(ui.item.value);
                // Buscar si ya existe un <td> con el mismo producto
                var tdExistente = buscarTdExistente(n1);
                //alert(tdExistente);

                if (tdExistente !== null) {
                    // Si el <td> existe, incrementar en 1 la cantidad
                    var cantidadExistente = parseInt(tdExistente);
                    document.getElementById("id-" + n1).innerHTML = parseInt(cantidadExistente + 1);
                } else {

                    obtenerPreciosProducto(n1)
                            .then(function (precios) {

                                var tdNombreHidden = $("<td>").text(n1).attr("id", "" + n1);
                                // Agregar campo oculto para guardar el nombre del producto
                                var hiddenNombre = $("<input>").attr("type", "hidden").val(n1);
                                tdNombreHidden.append(hiddenNombre);
                                var tdNombre = $("<td>").text(n1).attr("id", "" + n1);
                                var tdPrecio1 = $("<td>").text(p1).attr("id", "p1" + n1);

                                //hidden input
                                var inputHidden = $("<input>").attr({
                                    type: "hidden",
                                    id: "skuVentas" + n1, // Reemplaza "inputHiddenId" por el id deseado
                                    name: "skuVentas" + n1, // Reemplaza "inputHiddenName" por el name deseado
                                    value: sku // Reemplaza "valor del input hidden" por el valor deseado
                                });

                                var tdPrecio2 = $("<td>").text(p2).attr("id", "p2" + n1);

                                // Crear el icono de basurero utilizando <span> y <i>
                                var iconoBasurero = $("<span>").addClass("icono-basurero").html("<i class='fas fa-trash'></i>");

                                // Crear el elemento <td> para el icono basurero y asignar el evento onclick
                                var tdIconoBasurero = $("<td>").addClass("td-icono-basurero").append(iconoBasurero).attr("onclick", "eliminarFila(this)").attr("id", "basurero-" + n1).attr("value", n1);

                                // Crear el botón de flecha hacia abajo
                                var botonFlechaAbajo = $("<button>").html("&#9660;").addClass("boton-flecha").attr("id", "flechaD" + n1).attr("onclick", "disminuirValor(this)").attr("value", n1);
                                // Crear el botón de flecha hacia arriba
                                var botonFlechaArriba = $("<button>").html("&#9650;").addClass("boton-flecha").attr("id", "flechaU" + n1).attr("onclick", "aumentarValor(this)").attr("value", n1);
                                var tdBotonFlechaAbajo = $("<td>").append(botonFlechaAbajo).attr("style", "width: 5px;");
                                var tdBotonFlechaArriba = $("<td>").append(botonFlechaArriba).attr("style", "width: 5px;");


                                // Crear el elemento <td> de la cantidad y agregar los botones y el número de cantidad
                                var tdCantidad = $("<td>").attr("id", "id-" + n1).addClass("cantidad-td");
                                //var spanCantidad = $("<span>").text(1).addClass("cantidad-numero").css("font-size", "20px").attr("id", "miSpan");
                                // tdCantidad.append(botonFlechaAbajo, " ", spanCantidad, " ", botonFlechaArriba);

                                // Después de crear el elemento tdNombreHidden y el campo oculto hiddenNombre
                                var selectProducto = $("#productoSeleccionado");
                                var optionProducto = $("<option>").text(n1).attr("value", n1);
                                selectProducto.append(optionProducto);

                                var nuevoTr = $("<tr>").append(tdNombre, tdPrecio1, tdPrecio2, tdBotonFlechaAbajo, tdCantidad, tdBotonFlechaArriba, tdIconoBasurero, inputHidden)/*.addClass("scope").attr("scope", "row")*/;

                                $("#miTablaBody").append(nuevoTr).addClass("scope").attr("scope", "row");
                                document.getElementById("id-" + n1).innerHTML = 1;//la primera vez que agregamos un producto al carro lo deja en 1 
                                var totalFinalElement = document.getElementById("totalFinal");
                                var totalFinalContent = totalFinalElement.innerHTML;

                                var totalFinalValue = parseInt(totalFinalContent);
                                var PreciP1 = parseInt(document.getElementById("p1" + n1).innerHTML);

                                totalFinalValue += PreciP1;
                                totalFinalElement.innerHTML = totalFinalValue;

                                var totalFinalElementEasy = document.getElementById("totalFinalEasy");
                                var totalFinalContentEasy = totalFinalElementEasy.innerHTML;


                                var totalFinalValueEasy = parseInt(totalFinalContentEasy);
                                var PreciP2 = parseInt(document.getElementById("p2" + n1).innerHTML);

                                totalFinalValueEasy += PreciP2;
                                totalFinalElementEasy.innerHTML = totalFinalValueEasy;

                                // Obtener una referencia al botón por su ID
                                var btnPagar = document.getElementById("btnPagar");
                                // Habilitar el botón
                                btnPagar.disabled = false;

                            })
                            .catch(function (error) {
                                console.error('Error al obtener los precios:', error);
                            });
                }

            }
            function eliminarFila(elemento) {
                // Obtener el <tr> padre (fila) del elemento clickeado (icono basurero)
                var tr = $(elemento).closest("tr");
                var nombreProducto = elemento.getAttribute("value");
                //alert("elemento.value "+valorBoton);

                // Obtener el valor de los precios a restar
                var precio1 = parseInt(document.getElementById("p1" + nombreProducto).innerHTML);
                var precio2 = parseInt(document.getElementById("p2" + nombreProducto).innerHTML);

                // Obtener el totalFinalEasy y restar los precios eliminados
                var totalFinalElementEasy = document.getElementById("totalFinalEasy");
                var totalFinalValueEasy = parseInt(totalFinalElementEasy.innerHTML);

                // Comprobar si totalFinalValueEasy es un número válido antes de continuar
                if (isNaN(totalFinalValueEasy)) {
                    totalFinalValueEasy -= precio2;
                    totalFinalElementEasy.innerHTML = totalFinalValueEasy;
                } else {
                    totalFinalElementEasy.innerHTML = 0;
                }

                // Obtener el totalFinal y restar los precios eliminados
                var totalFinalElement = document.getElementById("totalFinal");
                var totalFinalValue = parseInt(totalFinalElement.innerHTML);

                // Comprobar si totalFinalValue es un número válido antes de continuar
                if (isNaN(totalFinalValue)) {
                    totalFinalValue -= precio1;
                    totalFinalElement.innerHTML = totalFinalValue;
                } else {
                    totalFinalElement.innerHTML = 0;
                }

                // Eliminar la fila (tr) del producto seleccionado
                tr.remove();
            }

            function sumarUnoSiExiste(valor) {
                var encontrado = false;
                $(".cant" + valor).each(function () {
                    if ($(this).text() === valor) {
                        encontrado = true;
                        var contenido = parseInt($(this).text());
                        contenido = contenido + 1;
                        $(this).text(contenido);
                        return false; // Detiene el ciclo each, ya que ya se encontró el valor
                    }
                });
                return encontrado;
            }

            //function buscarTdExistente(nombreProducto) {
            function buscarTdExistente(valor) {
                var tbody = document.getElementById('miTablaBody');
                var celdas = tbody.getElementsByTagName('td');
                var encontrado = null;

                for (var i = 0; i < celdas.length; i++) {
                    var celda = celdas[i];
                    if (celda.innerHTML === valor) {
                        var idValor = "id-" + valor;
                        var elemento = document.getElementById(idValor);

                        if (elemento) {
                            var contenido = parseInt(elemento.innerHTML);

                            elemento.innerHTML = contenido;
                            if (isNaN(elemento.innerHTML)) {
                                encontrado = 1;
                                return encontrado;
                            } else {
                                encontrado = elemento.innerHTML;
                                return encontrado;
                            }

                        }
                        break;
                    }
                }

                return encontrado;
            }
            function obtenerValoresSeleccionados() {
                var selectElement = document.getElementById("productoSeleccionado");
                var selectedValues = [];
                for (var i = 0; i < selectElement.options.length; i++) {
                    var option = selectElement.options[i];
                    if (option.selected) {
                        selectedValues.push(option.value);
                    }
                }
                return selectedValues;
            }

            function aumentarValor(value) {
                var valor = value.value; // Obtener el valor del atributo "value"
                var idValor = "id-" + valor;
                var tdElementTotalFinal = document.getElementById("totalFinal");
                var tdElementTotalFinalEasy = document.getElementById("totalFinalEasy");
                var tdElement = document.getElementById(idValor);
                var tdElementPrecio1 = parseInt(document.getElementById("p1" + valor).innerHTML); // Convertir a número entero
                var tdElementPrecio2 = parseInt(document.getElementById("p2" + valor).innerHTML); // Convertir a número entero

                if (tdElement) {
                    var cantProd = parseInt(tdElement.innerHTML); // Convertir a número entero
                    if (!isNaN(cantProd)) {
                        var nuevoValor = cantProd + 1;
                        var precio1Nuevo = parseInt(tdElementTotalFinal.innerHTML) + tdElementPrecio1; // Convertir a número entero
                        var precio2Nuevo = parseInt(tdElementTotalFinalEasy.innerHTML) + tdElementPrecio2; // Convertir a número entero
                        tdElement.innerHTML = nuevoValor;
                        tdElementTotalFinal.innerHTML = precio1Nuevo;
                        tdElementTotalFinalEasy.innerHTML = precio2Nuevo;

                    } else {
                        console.error("Error al obtener el valor del elemento.");
                    }
                } else {
                    console.error("Elemento no encontrado.");
                }
            }

            function disminuirValor(value) {
                var valor = value.getAttribute("value");
                var idValor = "id-" + valor;
                var tdElement = document.getElementById(idValor);
                var tdElementTotalFinal = document.getElementById("totalFinal");
                var tdElementTotalFinalEasy = document.getElementById("totalFinalEasy");
                var tdElementPrecio1 = parseInt(document.getElementById("p1" + valor).innerHTML); // Convertir a número entero
                var tdElementPrecio2 = parseInt(document.getElementById("p2" + valor).innerHTML); // Convertir a número entero

                if (tdElement) {
                    var cantProd = parseInt(tdElement.innerHTML); // Convertir a número entero
                    if (!isNaN(cantProd)) {
                        var nuevoValor = cantProd - 1;
                        tdElement.innerHTML = (nuevoValor >= 0) ? nuevoValor : 0; // Restar el valor y asegurarse de que no sea negativo
                        tdElementTotalFinal.innerHTML = (parseInt(tdElementTotalFinal.innerHTML) - tdElementPrecio1 >= 0) ? parseInt(tdElementTotalFinal.innerHTML) - tdElementPrecio1 : 0; // Restar el precio1 y asegurarse de que no sea negativo
                        tdElementTotalFinalEasy.innerHTML = (parseInt(tdElementTotalFinalEasy.innerHTML) - tdElementPrecio2 >= 0) ? parseInt(tdElementTotalFinalEasy.innerHTML) - tdElementPrecio2 : 0; // Restar el precio2 y asegurarse de que no sea negativo
                    } else {
                        console.error("Error al obtener el valor del elemento.");
                    }
                } else {
                    console.error("Elemento no encontrado.");
                }
            }



            function obtenerPreciosProducto(nombreProducto) {
                return new Promise((resolve, reject) => {
                    // Realizar la solicitud HTTP al servlet Java
                    const xhr = new XMLHttpRequest();
                    var cadena = (nombreProducto);
                    var valores = cadena.split(",");
                    var nombreProducto1 = valores[0];
                    var nom = nombreProducto1.split(" $");
                    var nom1 = nom[0];
                    //alert(nom1);  
                    xhr.open('GET', '${pageContext.request.contextPath}/ProductoGSON?codProd=' + nom1);
                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            try {
                                // Procesar la respuesta JSON recibida
                                const productos1 = JSON.parse(xhr.responseText);

                                resolve(productos1);
                            } catch (error) {
                                console.log(error);
                                reject(error);
                            }
                        } else {
                            console.log(xhr.status);
                            reject(new Error('Error en la solicitud: ' + xhr.status));
                        }
                    };
                    xhr.onerror = function () {
                        reject(new Error('Error en la solicitud'));
                    };
                    xhr.send();
                });
            }




            document.addEventListener("DOMContentLoaded", function () {
                const chkDescuento = document.getElementById("chkDescuento");
                const descuentoContainer = document.getElementById("descuentoContainer");

                chkDescuento.addEventListener("change", function () {
                    const cmbDescuento = document.getElementById("cmbDescuento");
                    if (chkDescuento.checked) {
                        descuentoContainer.style.display = "block";
                        cmbDescuento.disabled = false;
                    } else {
                        descuentoContainer.style.display = "none";
                        cmbDescuento.disabled = true;
                    }
                });
            });



            function recopilarInformacion() {
                // ... tu código actual para recopilar los datos ...
                var url = null;
                var rutPlus = null;
                var nombre = null;
                var p1 = null;
                var p2 = null;
                var cantidad = null;
                var totalFinal = null;
                var totalFinalEasy = null;
                var descuento = null;
                var usuarioVentas = null;
                var sku = null;
                var proveedor = null;
                var tipoDoc = null;
                var correo = null;
                var ndoc = null;
                var mensaje = null;
                var folio = null;
                 
                const selectElement = document.getElementById('productoSeleccionado');
                const options = selectElement.querySelectorAll('option');
                const optionValues = [];
                options.forEach(option => {
                    optionValues.push(option.value);
                    rutPlus = document.getElementById("inputRut").value;
                    nombre = document.getElementById(option.value).innerHTML;
                    p1 = document.getElementById("p1" + option.value).innerHTML;
                    p2 = document.getElementById("p2" + option.value).innerHTML;
                    cantidad = document.getElementById("id-" + option.value).innerHTML;
                    totalFinal = document.getElementById("totalFinal").innerHTML;
                    totalFinalEasy = document.getElementById("totalFinalEasy").innerHTML;
                    descuento = document.getElementById("cmbDescuento").value;
                    usuarioVentas = document.getElementById("usuarioVenta").value;
                    sku = document.getElementById("skuVentas" + option.value).value;
                    proveedor = "No";
                    tipoDoc = document.getElementById("cmbTipoDocumento").value;
                    correo = document.getElementById("correoUsuarioVenta").value;
                    folio = document.getElementById("folioHidden").value;
                    console.log(tipoDoc);
                    // Concatenar los valores en una cadena
                    var mensaje = "rutPlus: " + rutPlus + "\n" +
                            "nombre: " + nombre + "\n" +
                            "p1: " + p1 + "\n" +
                            "p2: " + p2 + "\n" +
                            "cantidad: " + cantidad + "\n" +
                            "totalFinal: " + totalFinal + "\n" +
                            "totalFinalEasy: " + totalFinalEasy + "\n" +
                            "descuento: " + descuento + "\n" +
                            "usuarioVentas: " + usuarioVentas + "\n" +
                            "sku: " + sku + "\n" +
                            "proveedor: " + proveedor + "\n" +
                            "TipoDoc: " + tipoDoc + "\n" +
                            "correo: " + correo;

                    // Mostrar el alert con los valores
                    //alert("Datos Recopilados: "+mensaje);
                    //console.log(rutPlus +" "+ nombre +" "+ p1 +" "+ p2 +" "+ cantidad +" "+ totalFinal +" "+ totalFinalEasy +" "+ descuento)    
                    // Crear un objeto con los datos recopilados
                    const datos = {
                        rutPlus: rutPlus,
                        nombre: nombre,
                        p1: p1,
                        p2: p2,
                        cantidad: cantidad,
                        totalFinal: totalFinal,
                        totalFinalEasy: totalFinalEasy,
                        descuento: descuento,
                        usuario: usuarioVentas,
                        proveedor: proveedor,
                        sku: sku,
                        tipoDoc: tipoDoc,
                        correo: correo,
                        folio: folio
                    };
                    console.log(tipoDoc);
                    // Realizar la solicitud HTTP POST al servlet
                    //fetch('${pageContext.request.contextPath}/ventas', {
                    // Realizar la solicitud POST al servidor
                    fetch('${pageContext.request.contextPath}/ventas', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(datos)
                    })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error al enviar los datos al servidor.');
                                }
                                return response.json();
                            })
                            .then(data => {
                                console.log('Datos recibidos:', data.success);

                                if (data.success) {
                                    // La venta se guardó exitosamente
                                    // Usar los valores de numerodocumento y tipodocumento
                                    ndoc = data.numerodocumento;
                                    tipoDoc = data.tipodocumento;
                                    console.log('NUMERO DOC Y TIPO DOC');
                                    console.log('Tipo Doc: ' + tipoDoc);
                                    console.log('Numero Doc: ' + ndoc);
                                    mensaje = "rutPlus: " + rutPlus + "\n" +
                                            "nombre: " + nombre + "\n" +
                                            "p1: " + p1 + "\n" +
                                            "p2: " + p2 + "\n" +
                                            "cantidad: " + cantidad + "\n" +
                                            "totalFinal: " + totalFinal + "\n" +
                                            "totalFinalEasy: " + totalFinalEasy + "\n" +
                                            "descuento: " + descuento + "\n" +
                                            "usuarioVentas: " + usuarioVentas + "\n" +
                                            "sku: " + sku + "\n" +
                                            "proveedor: " + proveedor + "\n" +
                                            "TipoDoc: " + tipoDoc + "\n" +
                                            "correo: " + correo + "\n" +
                                            "ndoc: " + ndoc;
                                    console.log(mensaje);
                                    // Mostrar el alert con los valores
                                    // alert("Datos Recopilados: " + mensaje);

                                    url = '?rutPlus=' + rutPlus + '&nombre=' + nombre + '&p1=' + p1 + '&p2=' + p2 + '&cantidad=' + cantidad +
                                            '&totalFinal=' + totalFinal + '&totalFinalEasy=' + totalFinalEasy + '&descuento=' + descuento +
                                            '&usuario=' + usuarioVentas + '&proveedor=' + proveedor + '&sku=' + sku + '&TipoDoc=' + tipoDoc + '&correo=' + correo + '&ndoc=' + ndoc;
                                    console.log('Numero Doc: ' + ndoc);
                                      // Obtener el botón por su id
                                        var btnPagar = document.getElementById("btnPagar");
                                        // Deshabilitar el botón
                                        btnPagar.disabled = true;
                                    mostrarPopup(url);
                                    // Resto de tu código aquí...
                                } else {
                                    // Hubo un error al guardar la venta
                                    console.error('Error al guardar la data:', data.message);
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                            });
                });

            }
            function mostrarPopup(url) {
                window.open("${pageContext.request.contextPath}/ventas/popupVentas.jsp" + url, "ventana1", "width=650,height=700,scrollbars=NO,align=center")
            }
            function openModal() {
                // Muestra el modal 17015600-5
                document.getElementById("inputRut").value = "";
                var modal = document.getElementById("myModal");
                modal.style.display = "block";
            }

            function closeModal() {

                 
                    const folioHidden = document.getElementById("folioHidden");
                        $.ajax({
                            url: '${pageContext.request.contextPath}/ObtenerFolioServlet',
                            type: 'POST',
                            success: function(data) {
                                console.log('Dato recibido:', data);
                                folioHidden.value = data;

                                // Resto de tu código aquí...
                            },
                            error: function(xhr, status, error) {
                                console.error('Error en la solicitud:', error);
                            }
                        });
               

                var rutModal = document.getElementById("inputRut").value;
                document.getElementById("traeModal").value = "1";
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
            }

            function cerrarPopup() {
                var popup = document.getElementById('popup');
                popup.style.display = 'none';
            }

        </script>


        <script>
            $(document).ready(function () {
                $('#btnBuscar').click(function () {
                    var rut = $('#inputRut').val(); // Obtener el valor del campo de texto
                    // Validar que el Rut no esté vacío
                    if (rut.trim() !== '') {
                        // Realizar el split del Rut utilizando el guión como separador
                        var partes = rut.split("-");
                        var cuerpo = partes[0]; // Obtener el cuerpo del Rut (sin el dígito verificador)
                        var digitoVerificador = partes[1]; // Obtener el dígito verificador del Rut
                        rut = cuerpo;
                        // Mostrar los resultados en la consola (puedes hacer lo que necesites con estas variables)
                        console.log("Cuerpo del Rut:", cuerpo);
                        console.log("Dígito Verificador:", digitoVerificador);
                    } else {
                        console.log("Ingrese un Rut válido.");
                    }
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/buscarClientePlus', // Reemplaza 'NombreDeTuServlet' por la URL de tu servlet
                        data: {codProd: rut},
                        dataType: 'json',
                        success: function (data) {
                            // Maneja la respuesta del servidor aquí
                            if (data.length > 0) {
                                var cliente = data[0]; // Tomar el primer cliente del resultado

                                // Construir el nuevo <td> con los datos del cliente
                                var nuevoTd = '<td>' + 'Cliente Easy Farma Plus  - ' + cliente + '</td>';

                                // Actualizar el contenido del <td> existente con el id 'clienteInfo'
                                $('#clienteInfo').html(nuevoTd);
                                $('#totalFinalEasy').css('background-color', 'red');

                                var final = parseInt(document.getElementById("totalFinal").innerHTML);
                                var finalPlus = parseInt(document.getElementById("totalFinalEasy").innerHTML);
                                // Agregar el mensaje al lado del cambio de color
                                var mensaje = 'Has ahorrado la cantidad de $' + parseInt(final - finalPlus) + ' pesos.';
                                $('#mensajeAhorro').text(mensaje);
                            }
                        },
                        error: function (xhr, status, error) {
                            console.log('Error en la solicitud AJAX:', error);
                        }
                    });
                });
            });


            function validarNumeros(event) {

                const input = event.target;
                const maxLength = 8;
                const regex = /^[0-9]{0,8}$/;

                if (!regex.test(input.value)) {
                    input.value = input.value.replace(/[^0-9]/g, '').substring(0, maxLength);
                }
            }

            function aplicarDescuento() {
                var descuentoSeleccionado = parseFloat(document.getElementById("cmbDescuento").value);
                var totalOriginal = parseFloat(document.getElementById("totalFinal").textContent);
                var totalOriginalEPlus = parseFloat(document.getElementById("totalFinalEasy").textContent);
                var descuentoCalculado = totalOriginal * (descuentoSeleccionado / 100);
                var descuentoCalculadoEPlus = totalOriginalEPlus * (descuentoSeleccionado / 100);
                var totalConDescuento = totalOriginal - descuentoCalculado;
                var totalConDescuentoEplus = totalOriginalEPlus - descuentoCalculadoEPlus;

                document.getElementById("totalFinal").textContent = totalConDescuento;
                document.getElementById("totalFinalEasy").textContent = totalConDescuentoEplus;
            }
            // Asignar el evento click a los botones usando .on()
            $(".boton-flecha").on("click", function (event) {
                event.preventDefault(); // Evitar el comportamiento predeterminado del botón

                // Obtener el valor del botón para aumentar o disminuir
                var valor = parseInt($(this).val(), 10);

                if ($(this).attr("id").startsWith("flechaD")) {
                    // Si es el botón de flecha hacia abajo, llama a la función disminuirValor
                    disminuirValor(valor);
                } else if ($(this).attr("id").startsWith("flechaU")) {
                    // Si es el botón de flecha hacia arriba, llama a la función aumentarValor
                    aumentarValor(valor);
                }
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
                            BUSCAR PRODUCTO 
                            <div class="header-search d-none d-md-flex" >
                                <input  id="codProd" name="codProd" type="text" placeholder="Search..."  Style="width: 1100px;
                                        border: 1px solid #efefef;
                                        background: rgba(239, 239, 239, 0.5);
                                        border-radius: 10px;
                                        height: 46px;
                                        padding-left: 44px;
                                        -webkit-transition: all 0.3s ease-out 0s;
                                        -moz-transition: all 0.3s ease-out 0s;
                                        -ms-transition: all 0.3s ease-out 0s;
                                        -o-transition: all 0.3s ease-out 0s;
                                        transition: all 0.3s ease-out 0s;"/>
                                <input type="hidden" name="accion" id="accion" value="ventas"> 
                                <input type="hidden" id="jsonData" name="jsonData" />
                                <input type="hidden" id="usuarioVenta" name="usuarioVenta" value="${sessionScope.usuario.getNombreUsuario()}" />
                                <input type="hidden" id="correoUsuarioVenta" name="correoUsuarioVenta" value="${sessionScope.usuario.getEmail()}"  />
                                <input type="hidden" id="clienteVenta" name="clienteVenta" value=""  />
                                <input type="hidden" id="folioHidden" name="folio" value="">
                            </div>
                        </div>
                        <div class="searchbox">

                            <input type="hidden" id="bc-product-search" placeholder="Search...">
                        </div>
                        <div class="result-ajax-search-desktop">
                            <ul class="search-results-desktop"></ul>
                        </div>
                    </div>

                    <br>
                    <br>
                    <br>
                    <input type="hidden" value="Nada" id="traeModal" name="traeModal" >
                    <!-- The Modal -->
                    <div id="myModal" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close" onclick="closeModal()">&times;</span>
                            <h2>Ingrese el Rut de cliente:</h2>
                            <form>
                                <label for="rut">Rut:</label>
                                <input type="text" id="inputRut" name="inputRut" onblur="formatoRut(this)">
                                <input class="btn btn-primary" id="btnBuscar" value="Buscar" style="width: 80px; height: 30px;" maxlength="8"  onclick="closeModal()" >
                            </form>
                        </div>
                    </div>
                    <div class="table-wrap">

                        <select id="productoSeleccionado" style="display: none;"></select>
                        <table class="table">
                            <thead class="thead-primary">

                                <tr>
                                    <th><h6>Nombre</h6></th>
                                    <th><h6>Precio</h6></th>
                                    <th><h6>Precio EasyFarma Plus</h6></th>
                                    <th><h6>Cantidad</h6></th>
                                </tr>
                                <!-- end table row-->
                            </thead>
                            <tbody id="miTablaBody">

                            <br>

                            <div class="header-search d-none d-md-flex">

                                <input class="ui-autocomplete-input" type="hidden" id="correoVenta" name="correoVenta" placeholder="Ingrese Correo Cliente">


                            </div>
                            <br>

                            <div class="header-search d-none d-md-flex">

                                <input class="ui-autocomplete-input" type="hidden" id="nombreVenta" name="nombreVenta" placeholder="Ingrese Nombre Cliente">


                            </div>
                            <br>

                            <div class="header-search d-none d-md-flex">

                                <input class="ui-autocomplete-input" type="hidden" id="direccionVenta" name="direccionVenta" placeholder="Ingrese Direccion Cliente">


                            </div>

                            </tbody>

                        </table>

                    </div>
                    <div class="table-wrapper table-responsive">
                        <table class="table" id="miTabla" >


                            <tbody id="miTablaTotalBody">
                                <tr>
                                    <td>Total:</td>
                                    <td id="totalFinal">0</td>
                                    <td id="totalFinalEasy">0</td>
                                    <td id="mensajeAhorro"></td>
                                </tr>

                            </tbody>

                        </table>
                        <div id="tipoDocumentoContainer">

                        </div>

                        <div>
                            <label for="cmbTipoDocumento">Tipo de documento:</label>
                            <select id="cmbTipoDocumento" onchange="aplicarDescuento()">
                                <option value="Boleta" selected>Boleta</option>
                                <option value="Factura">Factura</option>
                                <!-- Agrega más opciones de tipo de documento si lo deseas -->
                            </select>
                            <label for="chkDescuento">¿Tienes algún descuento?</label>
                            <input type="checkbox" id="chkDescuento">
                        </div>
                        <div id="descuentoContainer" style="display: none;">
                            <label for="cmbDescuento">Selecciona el descuento:</label>
                            <select id="cmbDescuento" onchange="aplicarDescuento()">
                                <option value="0">Sin descuento</option>
                                <option value="5">5% de descuento</option>
                                <option value="10">10% de descuento</option>
                                <option value="15">15% de descuento</option>
                                <option value="20">20% de descuento</option>
                                <option value="25">25% de descuento</option>
                                <option value="30">30% de descuento</option>
                                <option value="35">35% de descuento</option>
                                <option value="40">40% de descuento</option>
                                <!-- Agrega más opciones de descuento si lo deseas -->
                            </select>
                        </div>
                        <input id="btnPagar" class="btn btn-primary" onclick="recopilarInformacion()" value="Pagar" disabled="true">
                        <input type="hidden" value="probar" onclick="recopilarInformacion();">
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
        <script src="${pageContext.request.contextPath}/assets/validadores/validadores.js" type="text/javascript"></script>
    </body>
</html>