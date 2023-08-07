function cerrarSesion(){
   $.post("${pageContext.request.contextPath}/CerrarSesionServlet", function(data) {
   // Cuando la sesión se cierra en el servidor, redirigir a la página de inicio de sesión o cualquier otra página que desees
   window.location.href = "index.jsp";
   });   
}
function cerrarSesionCarp(){
    var ruta="${pageContext.request.contextPath}/";
   $.post("../CerrarSesionServlet", function(data) {
   // Cuando la sesión se cierra en el servidor, redirigir a la página de inicio de sesión o cualquier otra página que desees
   window.location.href = "../index.jsp";
   });   
}