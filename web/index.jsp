<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, width=device-width"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login | Easy Farma</title>

    <!--========================================
        Fuentes - Tipo de letra - Iconografia 
    ==========================================-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap" rel="stylesheet">


    <!--========================================
       Mis estilos
    ==========================================-->
    <link rel="stylesheet" href="dist/css/estilo.css">


</head>
<body>

    <!--========================================
       contenido
    ==========================================-->

    <div class="contenedor-login">

        <!--========================================
            Slider
        ==========================================-->
        <div class="contenedor-slider">

            <div class="slider">

                <!-- Slide 1 -->
                <div class="slide fade ">
                    <img src="dist/img/portada2.png" alt="">

                    <div class="contenido-slider">

                        <div class="logo">
                            <img src="dist/img/easyfarma.png" alt="">
                        </div>

                        <p class="slider-texto" style="color:black">
                            Todo lo que tu familia necesita
                        </p>

                    </div>

                </div>

                <!-- Slide 2 -->
                <div class="slide fade">
                    <img src="dist/img/portada1.png" alt="">

                    <div class="contenido-slider">

                        <div class="logo">
                            <img src="dist/img/easyfarma.png" alt="">
                        </div>

                        <p class="slider-texto" style="color:black">
                            Todo lo que tu familia necesita
                        </p>

                    </div>

                </div>


            </div>

            <!-- Botones next y prev -->
            <a href="#" class="prev"><i class="fas fa-chevron-left"></i></a>
            <a href="#" class="next"><i class="fas fa-chevron-right"></i></a>

            <!-- dots -->
            <div class="dots">

                <!-- <span class="dot active"></span> -->

            </div>

        </div>

        <!--========================================
            Formularios
        ==========================================-->
        <div class="contenedor-texto" style="background-color: #e7ecfe;">

            <div class="contenedor-form" >

                <h1 class="titulo">¡Bienvenido a Easy Farma!</h1>
                <p class="descripcion">Ingresa a tu cuenta para iniciar el uso del sistema.</p>

                <!-- Tabs -->
                <ul class="tabs-links">
                    <li class="tab-link active">Iniciar Sesión</li>
                    <li class="tab-link ">Registrate</li>
                </ul>

                <!--========================================
                    Formulario logue
                ==========================================-->
                <form action="usuarioServlet" method="POST" id="formLogin" class="formulario active">

                    <div class="error-text">
                        <p>aqui los errores del formualrio</p>
                    </div>
                    <input type="hidden" name="accion" id="accion" value="verificar">
                    <input type="text" placeholder="Correo electrónico" class="input-text" name="correo" autocomplete="off"> 
                    <div class="grupo-input">

                        <input type="password" placeholder="Contraseña" name="password" class="input-text clave">
                        <button type="button" class="icono fas fa-eye mostrarClave"></button>
                        
                    </div>

                    <a href="#" class="link">¿Ovidaste tu contraseña?</a>
                    <button class="btn" id="btnLogin" type="button">Iniciar Sesión</button>

                </form>

                 <!--========================================
                    Formulario de Registro
                ==========================================-->
                <form action="usuarioServlet" method="POST" id="formRegistro" class="formulario ">
                <input type="hidden" name="accion" id="accion" value="registrar">
                    <div class="error-text ">
                        
                    </div>

                    <input type="text" placeholder="Nombre" class="input-text" name="nombre" autocomplete="off"> 
                    <input type="text" placeholder="Apellidos" class="input-text" name="apellido" autocomplete="off"> 
                    <input type="text" placeholder="Correo electrónico" class="input-text" name="correo" autocomplete="off">

                    <div class="grupo-input">

                        <input type="password" placeholder="Contraseña" name="password" class="input-text clave">
                        <button type="button" class="icono fas fa-eye mostrarClave"></button>
                        
                    </div>

                    <!-- Checkbox Personalizados -->
                    <label class="contenedor-cbx animate">
                        Me gustaría recibir notificaciones sobre productos
                        <input type="checkbox" name="cbx_notificaciones" checked>
                        <span class="cbx-marca"></span>
                    </label>

                     <label class="contenedor-cbx animate">
                        He leído y acepto los
                        <a href="#" class="link">Términos y Condiciones</a>
                        <a href="#" class="link">y Política de privacidad de mi Aplicativo</a>

                        <input type="checkbox" name="cbx_terminos" >
                        <span class="cbx-marca"></span>

                    </label>

                    <button class="btn" id="btnRegistro" type="button">Crear Cuenta</button>

                </form>


            </div>

        </div>

    </div>
   
   
   
    <!--========================================
       Mis Scripts
    ==========================================-->
    <script src="dist/js/app.js"></script>
    
</body>
</html>