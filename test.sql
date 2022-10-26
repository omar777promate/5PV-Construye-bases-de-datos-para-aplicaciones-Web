-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 02:23:42
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(15) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `lider_academia` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Vespertino', 'Eduardo Martinez'),
('Electricidad', 'Matutino', 'Josué Conrriquez'),
('Logística', 'Vespertino', 'Ramiro Valadez'),
('Mecanica', 'Matutino', 'Angel'),
('Programacion', 'Vespertino', 'Gabriel Barrón'),
('Recursos Humano', 'Vespertino', 'Liliana Cecilia'),
('Soporte y maten', 'Vespertino', 'Ramiro López');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante1`
--

CREATE TABLE `estudiante1` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` tinyint(4) NOT NULL,
  `domicilio` text NOT NULL,
  `teléfono` varchar(10) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante1`
--

INSERT INTO `estudiante1` (`num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `teléfono`, `grupo`) VALUES
('01029080485450', 'Tania', 'Álvarez Anguiano', 17, 'Guanajuato 29', '4181111986', '5SV'),
('10290819281245', 'Christopher', 'Conrriquez González', 17, 'Martín López 17', '4181113936', '5MM'),
('20311050750482', 'Ángel Martín', 'Almaguer Aguilar', 17, 'Maclovio Herrera 16', '4181395055', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` varchar(4) NOT NULL,
  `calificación` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(60) DEFAULT NULL,
  `tutor` varchar(60) DEFAULT NULL,
  `carrera` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5CM', 'Matutino', 'Dulce Alejandra', 'Cristian Meza', 'Contabilidad'),
('5EM', 'Matutino', 'Luis', 'Martín Silva ', 'Electricidad'),
('5LV', 'Vespertino', 'Maria Rosario', 'Luis Godínez Almaguer', 'Logística'),
('5MM', 'Matutino', 'Dulce Giovvana', 'Ramiro Godínez', 'Mecánica'),
('5PV', 'Vespertino', 'Diana Alejandra', 'Silvia Carrillo Mastache', 'Programación'),
('5RV', 'Vespertino', 'Christian', 'Alma Cecilia ', 'Recursos Humano'),
('5SV', 'Vespertino', 'Bryan González', 'Liliana Carrillo', 'Soporte y maten');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante1`
--
ALTER TABLE `estudiante1`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `idb_estudiante` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `idx_carrera` (`carrera`) USING BTREE;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante1`
--
ALTER TABLE `estudiante1`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `estudiante_asignatura_ibfk_1` FOREIGN KEY (`num_control`) REFERENCES `estudiante1` (`num_control`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
