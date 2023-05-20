-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2023 a las 11:13:30
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
-- Estructura de tabla para la tabla `idot`
--

CREATE TABLE `idot` (
  `iddot` int(11) NOT NULL,
  `fecha_inspeccion` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_cot` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `UsuarioCreador` varchar(50) DEFAULT NULL,
  `Planta` varchar(50) DEFAULT NULL,
  `Cliente` varchar(50) DEFAULT NULL,
  `Serie` varchar(50) DEFAULT NULL,
  `Marca` varchar(20) DEFAULT NULL,
  `Medida` varchar(20) DEFAULT NULL,
  `Modelo` varchar(10) DEFAULT NULL,
  `TipoCompuesto` varchar(5) DEFAULT NULL,
  `GRemanente` varchar(10) DEFAULT NULL,
  `MaquinaTrabajo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idot`
--

INSERT INTO `idot` (`iddot`, `fecha_inspeccion`, `fecha_ingreso`, `fecha_cot`, `fecha_salida`, `UsuarioCreador`, `Planta`, `Cliente`, `Serie`, `Marca`, `Medida`, `Modelo`, `TipoCompuesto`, `GRemanente`, `MaquinaTrabajo`) VALUES
(2, '2023-05-19', '2023-05-20', '2023-05-19', '2023-05-19', 'rentunez', 'Hermosillo', 'Ford', '12', 'Goodyear', '40', 'Mamalon', 'Chilo', '12', '2'),
(4, '2023-05-19', '2023-05-20', '2023-05-19', '2023-05-19', 'rentunez', 'Hermosillo', 'chevrrolet', '123', 'michelin', '40', 'Mamalon', 'Chilo', '12', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `tipo`, `nombre`, `apellidos`, `usuario`, `password`) VALUES
(1, 'admin', 'Rene', 'Antunez', 'rentunez', 'des1'),
(2, 'admin', 'Jose', 'Alanis', 'theAlanis', 'alanis1'),
(3, 'cliente', 'Luis', 'Lopez', 'mambo', 'alanis1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `idot`
--
ALTER TABLE `idot`
  ADD PRIMARY KEY (`iddot`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `idot`
--
ALTER TABLE `idot`
  MODIFY `iddot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
