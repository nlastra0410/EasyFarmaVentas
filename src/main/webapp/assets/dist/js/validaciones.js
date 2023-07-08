$(document).ready(function () {
    //variables
    var pass1 = $('[name=inputPassword]');
    var pass2 = $('[name=inputPasswordConfirm]');
    var confirmacion = "Las password si coinciden";
    var longitud = "La password debe estar formada entre 6-10 caracteres (ambos inclusive)";
    var negacion = "No coinciden las password";
    var vacio = "La password no puede estar vacía";
    //oculto por defecto el elemento span
    var span = $('<span></span>').insertAfter(pass2);
    span.hide();
    //función que comprueba las dos contraseñas
    function coincidePassword() {
        var valor1 = pass1.val();
        var valor2 = pass2.val();
        //muestro el span
        span.show().removeClass();
        //condiciones dentro de la función
        if (valor1 != valor2) {
            span.text(negacion).addClass('negacion');
            document.getElementById("crearCuenta").disabled = true
        }
        if (valor1.length == 0 || valor1 == "") {
            span.text(vacio).addClass('negacion');
            document.getElementById("crearCuenta").disabled = true
        }
        if (valor1.length < 6 || valor1.length > 10) {
            span.text(longitud).addClass('negacion');
            document.getElementById("crearCuenta").disabled = true
        }
        if (valor1.length != 0 && valor1 == valor2) {
            span.text(confirmacion).removeClass("negacion").addClass('confirmacion');
            document.getElementById("crearCuenta").disabled = false
        }
    }
    //ejecuto la función al soltar la tecla
    pass2.keyup(function () {
        coincidePassword();
    });
});