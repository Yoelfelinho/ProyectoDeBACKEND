-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2025 a las 21:05:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` char(2) NOT NULL,
  `nomcategoria` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `nomcategoria`) VALUES
('C1', 'Electrodomésticos'),
('C2', 'Computadoras'),
('C3', 'Oficina'),
('C4', 'Muebles'),
('C5', 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` varchar(10) NOT NULL,
  `nomcliente` varchar(128) DEFAULT NULL,
  `ruccliente` varchar(11) DEFAULT NULL,
  `dircliente` varchar(128) DEFAULT NULL,
  `telcliente` varchar(9) DEFAULT NULL,
  `emailcliente` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nomcliente`, `ruccliente`, `dircliente`, `telcliente`, `emailcliente`) VALUES
('C001', 'Juan Pérez', '10456789012', 'Av. Lima 123', '987654321', 'juan@gmail.com'),
('C002', 'María Gómez', '20456789013', 'Jr. Arequipa 456', '956321789', 'maria@gmail.com'),
('C003', 'Carlos López', '30456789014', 'Calle Piura 789', '923456123', 'carlos@gmail.com'),
('C004', 'Ana Torres', '40456789015', 'Av. Grau 222', '945612378', 'ana@gmail.com'),
('C005', 'Pedro Ruiz', '50456789016', 'Jr. Cusco 333', '934562187', 'pedro@gmail.com'),
('C006', 'Luisa Sánchez', '60456789017', 'Av. Brasil 987', '954321678', 'luisa@gmail.com'),
('C007', 'Andrés Vega', '70456789018', 'Calle Tarapacá 101', '967823456', 'andres@gmail.com'),
('C008', 'Rosa Ríos', '80456789019', 'Av. Colonial 202', '913214567', 'rosa@gmail.com'),
('C009', 'Felipe Ramírez', '90456789020', 'Jr. Amazonas 303', '978123456', 'felipe@gmail.com'),
('C010', 'Elena Castro', '10456789021', 'Calle Loreto 404', '999888777', 'elena@gmail.com'),
('C011', 'Juan', '89561221', 'AA.HH San Ignacio Mz D Lt 1', '945030225', 'juan@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicionventa`
--

CREATE TABLE `condicionventa` (
  `idcondicion` char(2) NOT NULL,
  `nomcondicion` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `condicionventa`
--

INSERT INTO `condicionventa` (`idcondicion`, `nomcondicion`) VALUES
('C1', 'Contado'),
('C2', 'Crédito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `iddetalle` int(11) NOT NULL,
  `idfactura` int(11) DEFAULT NULL,
  `idproducto` varchar(10) DEFAULT NULL,
  `cant` int(11) DEFAULT NULL,
  `cosuni` decimal(19,4) DEFAULT NULL,
  `preuni` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`iddetalle`, `idfactura`, `idproducto`, `cant`, `cosuni`, `preuni`) VALUES
(1, 8, 'PRD008', 1, 400.0000, 550.0000),
(2, 9, 'PRD010', 1, 10.0000, 18.0000),
(3, 10, 'PRD002', 10, 1800.0000, 2200.0000),
(4, 11, 'PRD006', 2, 600.0000, 800.0000),
(5, 12, 'PRD007', 4, 15.0000, 22.0000),
(6, 13, 'PRD006', 3, 600.0000, 800.0000),
(7, 14, 'PRD009', 1, 80.0000, 110.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idfactura` int(11) NOT NULL,
  `fechaf` date DEFAULT NULL,
  `idcliente` varchar(10) DEFAULT NULL,
  `idusuario` varchar(3) DEFAULT NULL,
  `fechareg` datetime DEFAULT NULL,
  `idcondicion` char(2) DEFAULT NULL,
  `valorneto` decimal(10,4) DEFAULT NULL,
  `igv` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idfactura`, `fechaf`, `idcliente`, `idusuario`, `fechareg`, `idcondicion`, `valorneto`, `igv`) VALUES
(8, '2025-07-02', 'C001', 'U01', '2025-07-26 00:43:04', 'C1', 550.0000, 99.0000),
(9, '2025-07-16', 'C005', 'U01', '2025-07-26 00:43:48', 'C1', 18.0000, 3.2400),
(10, '2025-07-09', 'C003', 'U01', '2025-07-26 00:59:59', 'C1', 22000.0000, 3960.0000),
(11, '2025-07-16', 'C001', 'U01', '2025-07-26 01:27:38', 'C1', 1600.0000, 288.0000),
(12, '2025-07-26', 'C009', 'U01', '2025-07-26 01:33:19', 'C1', 88.0000, 15.8400),
(13, '2025-07-11', 'C001', 'U01', '2025-07-26 19:54:21', 'C1', 2400.0000, 432.0000),
(14, '2025-07-26', 'C001', 'U01', '2025-07-26 19:54:44', 'C1', 110.0000, 19.8000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` varchar(10) NOT NULL,
  `idproveedor` varchar(3) DEFAULT NULL,
  `nomproducto` varchar(128) DEFAULT NULL,
  `unimed` varchar(15) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cosuni` decimal(10,4) DEFAULT NULL,
  `preuni` decimal(10,4) DEFAULT NULL,
  `idcategoria` char(2) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `idproveedor`, `nomproducto`, `unimed`, `stock`, `cosuni`, `preuni`, `idcategoria`, `estado`) VALUES
('PRD001', 'P01', 'Refrigeradora LG', 'Unidad', 15, 1000.0000, 1300.0000, 'C1', '1'),
('PRD002', 'P02', 'Laptop HP 14\"', 'Unidad', 10, 1800.0000, 2200.0000, 'C2', '1'),
('PRD003', 'P03', 'Silla Ejecutiva', 'Unidad', 50, 120.0000, 180.0000, 'C4', '1'),
('PRD004', 'P04', 'Escritorio de Oficina', 'Unidad', 30, 200.0000, 270.0000, 'C4', '1'),
('PRD005', 'P05', 'Mouse Inalámbrico', 'Unidad', 100, 20.0000, 35.0000, 'C5', '1'),
('PRD006', 'P06', 'Monitor Samsung 24\"', 'Unidad', 20, 600.0000, 800.0000, 'C2', '1'),
('PRD007', 'P07', 'Resma de Papel A4', 'Paquete', 196, 15.0000, 22.0000, 'C3', '1'),
('PRD008', 'P08', 'Smartphone Xiaomi', 'Unidad', 39, 400.0000, 550.0000, 'C1', '1'),
('PRD009', 'P09', 'Cámara Web HD', 'Unidad', 59, 80.0000, 110.0000, 'C5', '1'),
('PRD010', 'P10', 'Lápiz Óptico', 'Unidad', 69, 10.0000, 18.0000, 'C5', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` varchar(3) NOT NULL,
  `nomproveedor` varchar(128) DEFAULT NULL,
  `rucproveedor` varchar(11) DEFAULT NULL,
  `dirproveedor` varchar(128) DEFAULT NULL,
  `telproveedor` varchar(9) DEFAULT NULL,
  `emailproveedor` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `nomproveedor`, `rucproveedor`, `dirproveedor`, `telproveedor`, `emailproveedor`) VALUES
('P01', 'Electro Perú SAC', '20123456789', 'Av. Industria 101', '987001122', 'contacto@electroperu.com'),
('P02', 'CompuExpress', '20234567890', 'Calle Tecnología 202', '945223344', 'ventas@compuexpress.com'),
('P03', 'Ofimundo', '20345678901', 'Jr. Papelería 303', '934334455', 'ventas@ofimundo.com'),
('P04', 'Mueblería El Roble', '20456789012', 'Av. Muebles 404', '923445566', 'info@roble.com'),
('P05', 'TecnoAccesorios', '20567890123', 'Av. Gadgets 505', '912556677', 'contacto@tecno.com'),
('P06', 'SmartTech', '20678901234', 'Calle Chips 606', '901667788', 'info@smarttech.com'),
('P07', 'OfiPaper', '20789012345', 'Jr. Documentos 707', '934778899', 'ventas@ofipaper.com'),
('P08', 'Mundo Digital', '20890123456', 'Av. Digital 808', '945889900', 'info@mdigital.com'),
('P09', 'Importadora Vega', '20901234567', 'Calle Importaciones 909', '956990011', 'contacto@vega.com'),
('P10', 'Distribuciones Lima', '21012345678', 'Jr. Mayoristas 010', '967001122', 'dlima@ventas.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` varchar(3) NOT NULL,
  `nomusuario` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `apellidos` varchar(64) DEFAULT NULL,
  `nombres` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nomusuario`, `password`, `apellidos`, `nombres`, `email`, `estado`) VALUES
('U01', 'admin', '456a', 'Martínez', 'José', 'admin@empresa.com', '1'),
('U02', 'ventas1', '456b', 'García', 'Laura', 'laura@empresa.com', '1'),
('U03', 'soporte', '654p', 'Zúñiga', 'Carlos', 'carlos@empresa.com', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `condicionventa`
--
ALTER TABLE `condicionventa`
  ADD PRIMARY KEY (`idcondicion`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`iddetalle`),
  ADD KEY `idfactura` (`idfactura`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idfactura`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idcondicion` (`idcondicion`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idproveedor` (`idproveedor`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`idfactura`) REFERENCES `facturas` (`idfactura`),
  ADD CONSTRAINT `detallefactura_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`idcondicion`) REFERENCES `condicionventa` (`idcondicion`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
