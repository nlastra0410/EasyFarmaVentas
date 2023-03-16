/*banco  banco (nombre,cuenta)
bancomovimiento INSERT INTO bancomovimiento(codigo, fecha, monto, cuenta,tipo, observacion,cuentabancaria)
saldobanco banco saldo
datosfacturacion (rut,razonsocial,direccion,ciudad,fono,giro,cliente,periodo)
logconexion codigo, usuario, ip, ipcliente, host, hostcliente, conectado
logocurrencias fecha, hora, firmado, detalle
impuestos(nombre,valoractual,operacion,kilo,excento)
"INSERT INTO venta(documento, numerodocumento, fecha, domicilio, guiasalida, rutfacturacion, cliente, sucursal) VALUES (?, ?, ?, ?, ?, ?, ?, ?); ";
"INSERT INTO productoventa(documento, numerodocumento, producto, proveedor, cantidad, valor) VALUES (?, ?, ?, ?, ?, ?); ";
"INSERT INTO impuestosdocumentofinanciero(impuesto, numero, documento, valor, monto) VALUES (?, ?, ?, ?, ?); ";
"UPDATE pedidodestino SET documento=?, numerodocumento=? where pedido=? and vendedor=? and guiasalida=?; ";
"select cliente, rutfacturacion, metodo from pedido where codigo = ";
SQL = "INSERT INTO pagodocumento(id, numero, documento, metodopago, fecha, monto, pagadopor, sucursal)VALUES (?, ?, ?, ?, ?, ?, ? ,?); ";
String SQL2 = "INSERT INTO cajamovimiento(codigo, fecha, hora, cantidad, monto, metodo, cuenta,tipo, observacion,sucursal)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
String SQL3 = "INSERT INTO cajabodega(codigo, fecha, hora, cantidad, monto, metodo, cuenta, tipo, observacion, sucursal) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
String SQL = "INSERT INTO venta(documento, numerodocumento, fecha, domicilio, guiasalida, rutfacturacion, cliente, sucursal) VAL
String SQL1 = "INSERT INTO productoventa(documento, numerodocumento, producto, proveedor, cantidad, valor) VALUES (?, ?, ?, ?, ?
String SQL2 = "INSERT INTO impuestosdocumentofinanciero(impuesto, numero, documento, valor, monto) VALUES (?, ?, ?, ?, ?); ";
String SQL = "INSERT INTO pagodocumento(id, numero, documento, metodopago, fecha, monto, pagadopor, sucursal)VALUES (?, ?, ?, ?,
String SQL2 = "INSERT INTO cajamovimiento(codigo, fecha, hora, cantidad, monto, metodo, cuenta,tipo, observacion,sucursal)VALUES
String SQL3 = "INSERT INTO cajabodega(codigo, fecha, hora, cantidad, monto, metodo, cuenta, tipo, observacion, sucursal) VALUES 
String SQL = "INSERT INTO venta(documento, numerodocumento, fecha, rutfacturacion, cliente,sucursal) VALUES (?, ?, ?, ?, ?, ?); 
String SQL1 = "INSERT INTO productoventa(documento, numerodocumento, producto, proveedor, cantidad, valor) VALUES (?, ?, ?, ?, ?
String SQL2 = "INSERT INTO impuestosdocumentofinanciero(impuesto, numero, documento, valor, monto) VALUES (?, ?, ?, ?, ?); ";
String SQL = "INSERT INTO venta(documento, numerodocumento, fecha, rutfacturacion, cliente, sucursal) VALUES (?, ?, ?, ?, ?,?); 
String SQL1 = "INSERT INTO detalledocumento(nombre, cantidad, valor, numero, documento, servicio) VALUES (?, ?, ?, ?, ?, ?); ";
String SQL2 = "INSERT INTO impuestosdocumentofinanciero(impuesto, numero, documento, valor, monto) VALUES (?, ?, ?, ?, ?); ";
String SQL = "INSERT INTO venta(documento, numerodocumento, fecha, cliente,rutfacturacion, domicilio,sucursal) VALUES (?, ?, ?, 
String SQL1 = "INSERT INTO productoventa(documento, numerodocumento, producto, proveedor, cantidad, valor) VALUES (?, ?, ?, ?, ?
String SQL2 = "INSERT INTO impuestosdocumentofinanciero(impuesto, numero, documento, valor, monto) VALUES (?, ?, ?, ?, ?); ";
String SQL3 = "insert into salida (codigo,fecha,motivo,observacion,sucursal) values (?,?,?,?,?); ";
String SQL4 = "insert into detallesalida (idsalida, producto, proveedor,cantidad,valor,costo) values (?,?,?,?,?,?); ";
String SQL = "INSERT INTO venta(documento, numerodocumento, fecha,domicilio, rutfacturacion, cliente,guiasalida,sucursal) VALUES
String SQL1 = "INSERT INTO productoventa(documento, numerodocumento, producto, proveedor, cantidad, valor) VALUES (?, ?, ?, ?, ?
String SQL2 = "INSERT INTO impuestosdocumentofinanciero(impuesto, numero, documento, valor, monto) VALUES (?, ?, ?, ?, ?); ";
String SQL3 = "INSERT INTO detalledocumento(nombre, cantidad, valor, numero, documento) VALUES (?, ?, ?, ?, ?); ";
String SQL = "INSERT INTO venta(documento, numerodocumento, fecha,domicilio, rutfacturacion, cliente,guiasalida,sucursal) VALUES
String SQL1 = "INSERT INTO productoventa(documento, numerodocumento, producto, proveedor, cantidad, valor) VALUES (?, ?, ?, ?, ?
String SQL2 = "INSERT INTO impuestosdocumentofinanciero(impuesto, numero, documento, valor, monto) VALUES (?, ?, ?, ?, ?); ";
String SQL3 = "INSERT INTO detalledocumento(nombre, cantidad, valor, numero, documento) VALUES (?, ?, ?, ?, ?); ";
String SQL = "INSERT INTO pagoproveedor( id, numerodocumento, documento, metodopago, fecha, monto, proveedor) VALUES (?, ?, ?, ?
String SQL2 = "INSERT INTO cajamovimiento(codigo, fecha, hora, cantidad, monto, metodo, cuenta,tipo, observacion,causal,sucursal
String SQL1 = "INSERT INTO bancomovimiento(codigo, fecha, monto, cuenta,tipo, observacion,cuentabancaria,causal)VALUES (?, ?, ?,
String SQL = "INSERT INTO pagodocumento(id, numero, documento, metodopago, fecha, monto,sucursal)VALUES (?, ?, ?, ?, ?, ?,?); ";
*/

--http://localhost/phpmyadmin/
--bd easyfarma
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2023 a las 02:15:33
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdsys`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRECARGO` varchar(20) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formafarmaceutica`
--

CREATE TABLE `formafarmaceutica` (
  `ID` bigint(20) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `Id` bigint(20) DEFAULT NULL,
  `nombre` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `principioactivo`
--

CREATE TABLE `principioactivo` (
  `Id` bigint(20) DEFAULT NULL,
  `nombre` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `NOMBREUSUARIO`, `CLAVE`, `ESTADO`, `IDCARGO`, `IMAGEN`, `APELLIDOUSUARIO`, `EMAIL`) VALUES
(1, 'nlastra@gmail.com', '123', b'1', 1, NULL, NULL, NULL),
(3, 'bebo@gmail.com', '123', b'1', 1, NULL, NULL, NULL);

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
