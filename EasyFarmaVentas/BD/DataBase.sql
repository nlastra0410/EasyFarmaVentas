-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-03-2023 a las 02:58:35
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `easy_farma_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `ID` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `cuenta` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancomovimiento`
--

CREATE TABLE `bancomovimiento` (
  `codigo` bigint(20) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `monto` bigint(20) DEFAULT NULL,
  `cuenta` bigint(20) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `cuentabancaria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bioequivalente`
--

CREATE TABLE `bioequivalente` (
  `ID` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Productos` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL,
  `Orden` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajabodega`
--

CREATE TABLE `cajabodega` (
  `Id` bigint(20) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `metodo` varchar(255) DEFAULT NULL,
  `cuenta` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `sucursal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajamovimiento`
--

CREATE TABLE `cajamovimiento` (
  `Id` bigint(20) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `metodo` varchar(255) DEFAULT NULL,
  `cuenta` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `sucursal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRECARGO` varchar(20) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`IDCARGO`, `NOMBRECARGO`, `ESTADO`) VALUES
(1, 'ADMINISTRADOR', b'1'),
(2, 'VENDEDOR', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `categorias` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL,
  `Orden` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `Rut` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Ceular` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Suscripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

CREATE TABLE `cupones` (
  `NOrden` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellidos` varchar(255) DEFAULT NULL,
  `Rut` varchar(255) DEFAULT NULL,
  `Cupon` varchar(255) DEFAULT NULL,
  `Pasarela` varchar(255) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Descuento` bigint(20) DEFAULT NULL,
  `Fecha` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosfacturacion`
--

CREATE TABLE `datosfacturacion` (
  `Id` bigint(20) DEFAULT NULL,
  `rut` varchar(255) DEFAULT NULL,
  `razonsocial` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `fono` varchar(255) DEFAULT NULL,
  `giro` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentodetalle`
--

CREATE TABLE `descuentodetalle` (
  `Id` bigint(20) DEFAULT NULL,
  `SKU` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Precio` bigint(20) DEFAULT NULL,
  `LimiteUsos` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledocumento`
--

CREATE TABLE `detalledocumento` (
  `Id` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `servicio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesalida`
--

CREATE TABLE `detallesalida` (
  `Id` bigint(20) DEFAULT NULL,
  `idsalida` varchar(255) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `proveedor` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `costo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IDEMPLEADO` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `TELEFONO` char(9) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `TIPODOCUMENTO` char(1) DEFAULT NULL,
  `NUMERODOCUMENTO` char(11) DEFAULT NULL,
  `IDUSUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `ID` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `enfermedades` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL,
  `Orden` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formafarmaceutica`
--

CREATE TABLE `formafarmaceutica` (
  `ID` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

CREATE TABLE `impuestos` (
  `Id` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `valoractual` varchar(255) DEFAULT NULL,
  `operacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestosdocumentofinanciero`
--

CREATE TABLE `impuestosdocumentofinanciero` (
  `Id` bigint(20) DEFAULT NULL,
  `impuesto` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `Id` bigint(20) DEFAULT NULL,
  `nombre` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logconexion`
--

CREATE TABLE `logconexion` (
  `Id` bigint(20) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ipcliente` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `hostcliente` varchar(255) DEFAULT NULL,
  `conectado` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logocurrencias`
--

CREATE TABLE `logocurrencias` (
  `Id` bigint(20) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ipcliente` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `hostcliente` varchar(255) DEFAULT NULL,
  `conectado` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagodocumento`
--

CREATE TABLE `pagodocumento` (
  `Id` bigint(20) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `pagadopor` varchar(255) DEFAULT NULL,
  `sucursal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoproveedor`
--

CREATE TABLE `pagoproveedor` (
  `Id` bigint(20) DEFAULT NULL,
  `numerodocumento` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `metodopago` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `proveedor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Id` bigint(20) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `rutfacturacion` varchar(255) DEFAULT NULL,
  `metodo` varchar(255) DEFAULT NULL,
  `pedido` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidodestino`
--

CREATE TABLE `pedidodestino` (
  `Id` bigint(20) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `numerodocumento` varchar(255) DEFAULT NULL,
  `vendedor` varchar(255) DEFAULT NULL,
  `documentotributario` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `pedido` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principioactivo`
--

CREATE TABLE `principioactivo` (
  `Id` bigint(20) DEFAULT NULL,
  `nombre` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id` bigint(20) DEFAULT NULL,
  `SKU` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Precio` bigint(20) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL,
  `Receta` tinyint(1) DEFAULT NULL,
  `PrecioFración` bigint(20) DEFAULT NULL,
  `FormaFarmaceutica` varchar(255) DEFAULT NULL,
  `DosisForma` varchar(255) DEFAULT NULL,
  `PrecioDosis` bigint(20) DEFAULT NULL,
  `Stock` bigint(20) DEFAULT NULL,
  `OtrosMedicamentos` varchar(255) DEFAULT NULL,
  `Categorias` varchar(255) DEFAULT NULL,
  `Imagen` tinyint(1) DEFAULT NULL,
  `UrlImagen` varchar(255) DEFAULT NULL,
  `MostrarDescripcion` tinyint(1) DEFAULT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `ManejoStock` varchar(255) DEFAULT NULL,
  `PrecioPlus` bigint(20) DEFAULT NULL,
  `Enfermedades` varchar(255) DEFAULT NULL,
  `Medicamento` tinyint(1) DEFAULT NULL,
  `PrincipioActivo` varchar(255) DEFAULT NULL,
  `Laboratorio` varchar(255) DEFAULT NULL,
  `Bioequivalente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoventa`
--

CREATE TABLE `productoventa` (
  `Id` bigint(20) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `numerodocumento` varchar(255) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `proveedor` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldobanco`
--

CREATE TABLE `saldobanco` (
  `ID` bigint(20) DEFAULT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `saldo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `Id` bigint(20) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `sucursal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL,
  `NOMBREUSUARIO` varchar(20) DEFAULT NULL,
  `CLAVE` varchar(10) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL,
  `IMAGEN` longblob DEFAULT NULL,
  `APELLIDOUSUARIO` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `NOMBREUSUARIO`, `CLAVE`, `ESTADO`, `IDCARGO`, `IMAGEN`, `APELLIDOUSUARIO`, `EMAIL`) VALUES
(1, 'nlastra@gmail.com', '123', b'1', 1, NULL, NULL, NULL),
(3, 'bebo@gmail.com', '123', b'1', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Id` bigint(20) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `numerodocumento` varchar(255) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `documentotributario` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `sucursal` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDCARGO`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD KEY `FK_EMPLEADO_USU` (`IDUSUARIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `FK_USUARIO_CARGO` (`IDCARGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `IDCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `IDEMPLEADO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_USU` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
