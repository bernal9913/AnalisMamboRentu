-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2023 a las 08:19:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemaregistro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tipo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`idAdmin`, `nombre`, `apellido1`, `apellido2`, `password`, `tipo`) VALUES
(1, 'juan', 'lopez', 'perez', 'pass', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `mina` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idot`
--

CREATE TABLE `idot` (
  `idIdot` int(11) NOT NULL,
  `OT_planta` varchar(50) DEFAULT NULL,
  `fecha_inspeccion` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_cot` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `idPlanta` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idNeumatico` int(11) DEFAULT NULL,
  `idTipoOperador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `neumatico`
--

CREATE TABLE `neumatico` (
  `idNeumatico` int(11) NOT NULL,
  `serie` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `tipo_compuesto` varchar(50) DEFAULT NULL,
  `medida` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planta`
--

CREATE TABLE `planta` (
  `idPlanta` int(11) NOT NULL,
  `nombre_planta` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_operador`
--

CREATE TABLE `tipo_operador` (
  `idTipoOperador` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `tipo`, `nombre`, `apellidos`, `usuario`, `password`) VALUES
(1, 'admin', 'Rene', 'Antunez', 'rentunez', 'des1'),
(2, 'admin', 'Jose', 'Alanis', 'theAlanis', 'alanis1'),
(3, 'cliente', 'Luis', 'Lopez', 'mambo', 'alanis1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `idot`
--
ALTER TABLE `idot`
  ADD PRIMARY KEY (`idIdot`),
  ADD KEY `idAdmin` (`idAdmin`),
  ADD KEY `idPlanta` (`idPlanta`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idNeumatico` (`idNeumatico`),
  ADD KEY `idTipoOperador` (`idTipoOperador`);

--
-- Indices de la tabla `neumatico`
--
ALTER TABLE `neumatico`
  ADD PRIMARY KEY (`idNeumatico`);

--
-- Indices de la tabla `planta`
--
ALTER TABLE `planta`
  ADD PRIMARY KEY (`idPlanta`);

--
-- Indices de la tabla `tipo_operador`
--
ALTER TABLE `tipo_operador`
  ADD PRIMARY KEY (`idTipoOperador`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idot`
--
ALTER TABLE `idot`
  MODIFY `idIdot` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `neumatico`
--
ALTER TABLE `neumatico`
  MODIFY `idNeumatico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planta`
--
ALTER TABLE `planta`
  MODIFY `idPlanta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_operador`
--
ALTER TABLE `tipo_operador`
  MODIFY `idTipoOperador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `idot`
--
ALTER TABLE `idot`
  ADD CONSTRAINT `idot_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`idAdmin`),
  ADD CONSTRAINT `idot_ibfk_2` FOREIGN KEY (`idPlanta`) REFERENCES `planta` (`idPlanta`),
  ADD CONSTRAINT `idot_ibfk_3` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `idot_ibfk_4` FOREIGN KEY (`idNeumatico`) REFERENCES `neumatico` (`idNeumatico`),
  ADD CONSTRAINT `idot_ibfk_5` FOREIGN KEY (`idTipoOperador`) REFERENCES `tipo_operador` (`idTipoOperador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
