/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function validarNumeros(input) {
  const valor = input.value.trim();
  const esNumero = /^[0-9]+$/.test(valor);
  const botonGuardar = document.getElementById('botonGuardar'); // Reemplaza 'botonGuardar' con el ID real de tu botón
  
  if (esNumero) {
    input.style.borderColor = 'blue'; // Cambia el borde a azul si es un número válido
    botonGuardar.disabled = false; // Habilita el botón de guardar
    mensaje.textContent = ''; // Muestra el mensaje
  } else {
    input.style.borderColor = 'red'; // Cambia el borde a rojo si no es un número válido
    botonGuardar.disabled = true; // Deshabilita el botón de guardar
    mensaje.textContent = 'Ingrese solo numeros'; // Muestra el mensaje
  }
}

function submitForm() {
     
    $('#f_listar').submit();
     
  }
  
function setCheckboxValue(checkboxName) {
    var checkbox = document.getElementById(checkboxName);
    var checkboxValue = checkbox.checked;

    if (checkboxValue) {
      // Checkbox marcado, establecer valor en true
      
      checkbox.value = "true";
    } else {
      // Checkbox desmarcado, establecer valor en false
       
      checkbox.value = "false";
    }
  }
  
function formatoRut(input) {
  var rut = input.value;
  // Eliminar caracteres especiales y espacios en blanco
  rut = rut.replace(/[^\dkK]/g, "");
  // Verificar si se ingresó un RUT válido
  if (rut.length > 1) {
    // Obtener el dígito verificador
    var dv = rut.slice(-1);
    // Formatear el número sin el dígito verificador
    var num = rut.slice(0, -1);
    // Agregar puntos y guión al número
    num = num.replace(/\B(?=(\d{3})+(?!\d))/g, "");
    // Combinar número y dígito verificador
    rut = num + "-" + dv;
  }
    // Asignar el valor formateado al campo de entrada
    input.value = rut;
}
function formatearFechaInput() {
  var fechaInput = document.getElementById("fechaNacimiento").value;
  var fechaFormateada = formatearFecha(fechaInput);
  document.getElementById("fechaNacimiento").value = fechaFormateada;
}
function formatearFecha(fecha) {
  // Obtener los componentes de la fecha
  var fechaObj = new Date(fecha);
  var anio = fechaObj.getFullYear();
  var mes = fechaObj.getMonth() + 1;
  var dia = fechaObj.getDate();

  // Asegurar que el mes y el día tengan dos dígitos
  if (mes < 10) {
    mes = "0" + mes;
  }
  if (dia < 10) {
    dia = "0" + dia;
  }

  // Formatear la fecha en YYYY-MM-DD
  var fechaFormateada = anio + "-" + mes + "-" + dia;

  return fechaFormateada;
}