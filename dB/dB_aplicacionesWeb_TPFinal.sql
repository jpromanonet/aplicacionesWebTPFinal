-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-11-2020 a las 02:12:52
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aplicacionesweb_tpfinal`
--
CREATE DATABASE IF NOT EXISTS `aplicacionesweb_tpfinal` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `aplicacionesweb_tpfinal`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `tiempo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `horas` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_mesas`
--

CREATE TABLE `inscripciones_mesas` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `mesa_final_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` bigint(20) NOT NULL,
  `carrera_id` bigint(20) DEFAULT NULL,
  `aula_id` bigint(20) DEFAULT NULL,
  `nombre` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias_usuarios`
--

CREATE TABLE `materias_usuarios` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `materia_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas_finales`
--

CREATE TABLE `mesas_finales` (
  `id` bigint(20) NOT NULL,
  `materia_id` bigint(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` bigint(20) NOT NULL,
  `materia_usuario_id` bigint(20) DEFAULT NULL,
  `calificacion` double DEFAULT NULL,
  `estado` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Administrador', 'Administradores', '2020-11-13 02:49:39', '2020-11-15 15:47:01', 0),
(2, 'Profesor', 'Profesores', '2020-11-13 02:49:39', '2020-11-13 02:49:39', 0),
(3, 'Alumno', 'Alumnos', '2020-11-13 02:50:01', '2020-11-13 02:50:01', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `rol_id` bigint(20) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `rol_id`, `email`, `password`, `nombre`, `apellido`, `dni`, `token`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 1, 'paredbaez.martin@gmail.com', '$2y$10$zqiMDiDosRwYW7WPz0zwheSpdN8OTxfj0DR29l4qNgcXkMzB.E9AC', 'Martin Jose', 'Pared Baez', '12345679', NULL, '2020-11-15 00:19:07', '2020-11-17 02:11:13', 0),
(33, 2, 'pared.martin@gmail.com', '$2y$10$CYPKOeM0V/DuoVOhnPfJNODIW6Ed8O5sg0NJ/HyHBPNsV9SwzHDne', 'Martin', 'Pared', '12345678', NULL, '2020-11-15 04:34:54', '2020-11-17 00:40:01', 1),
(34, 1, 'garcia81@email.com', NULL, 'María', 'García', '53052515', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(35, 2, 'sanz67@mail.com', NULL, 'Manuel', 'Sanz', '86391305', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(36, 1, 'jsantos@email.com', NULL, 'Javier', 'Santos', '19471859', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(37, 2, 'jperez@email.es', NULL, 'Juan', 'Pérez', '44515971', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(38, 1, 'joszafra@mail.es', NULL, 'José Manuel', 'Zafra', '52837049', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(39, 3, 'jreina@mail.com', NULL, 'José María', 'Reina', '81585921', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(40, 1, 'josediez@email.net', NULL, 'José', 'Diez', '50440395', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(41, 3, 'mrincon@correo.es', NULL, 'Manuela', 'Rincón', '80393926', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(42, 3, 'm.garrigos@correo.com', NULL, 'María Isabel', 'Garrigós', '71419888', NULL, '2020-11-15 04:35:12', '2020-11-17 00:50:03', 0),
(43, 3, 'beatrizdomenech55@correo.com', NULL, 'Beatriz', 'Domenech', '85039168', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(44, 2, 'c.jimenez@mail.net', NULL, 'Concepción', 'Jiménez', '23381391', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(45, 1, 'muñoz10@mail.com', NULL, 'Nuria', 'Muñoz', '35013679', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(46, 1, 'ale.gil@mail.com', NULL, 'Alejandro', 'Gil', '10773315', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(47, 2, 'p.olmedo@correo.com', NULL, 'Pablo', 'Olmedo', '08356236', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(48, 1, 'f.vargas@mail.es', NULL, 'Francisco', 'Vargas', '93139420', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(49, 1, 'cruz16@correo.com', NULL, 'Jesús', 'Cruz', '98546899', NULL, '2020-11-15 04:35:12', '2020-11-16 01:24:08', 0),
(50, 3, 'enriquez20@email.net', NULL, 'Lucia', 'Enríquez', '03680026', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(51, 2, 'josefa.cuesta@correo.com', NULL, 'Josefa', 'Cuesta', '75838470', NULL, '2020-11-15 04:35:12', '2020-11-16 01:24:13', 0),
(52, 3, 'car.pelayo@mail.net', NULL, 'Carmen', 'Pelayo', '13554849', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(53, 2, 'c.rodriguez@correo.net', NULL, 'Concepción', 'Rodríguez', '37164936', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(54, 2, 'conmorillo@correo.net', NULL, 'Concepción', 'Morillo', '51023289', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(55, 2, 'marruiz@mail.es', NULL, 'María Isabel', 'Ruiz', '86552162', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(56, 1, 'svega@email.net', NULL, 'Salvador', 'Vega', '58560618', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(57, 2, 'yolandaleiva43@email.es', NULL, 'Yolanda', 'Leiva', '69798044', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(58, 1, 's.valero@mail.com', NULL, 'Sergio', 'Valero', '64968070', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(59, 3, 'carlos.martinez@correo.com', NULL, 'Carlos', 'Martínez', '86877265', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(60, 3, 'msanchez@email.com', NULL, 'María', 'Sánchez', '20590436', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(61, 3, 'martin21@correo.com', NULL, 'Lucia', 'Martin', '55336664', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(62, 2, 'manuelgallego@email.es', NULL, 'Manuel', 'Gallego', '71205774', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0),
(63, 2, 'laura.santana@mail.com', NULL, 'Laura', 'Santana', '71265515', NULL, '2020-11-15 04:35:12', '2020-11-15 04:35:12', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripciones_mesas`
--
ALTER TABLE `inscripciones_mesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `mesa_final_id` (`mesa_final_id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `aula_id` (`aula_id`);

--
-- Indices de la tabla `materias_usuarios`
--
ALTER TABLE `materias_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `mesas_finales`
--
ALTER TABLE `mesas_finales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_usuario_id` (`materia_usuario_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `usuarios_ibfk_1` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones_mesas`
--
ALTER TABLE `inscripciones_mesas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias_usuarios`
--
ALTER TABLE `materias_usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas_finales`
--
ALTER TABLE `mesas_finales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripciones_mesas`
--
ALTER TABLE `inscripciones_mesas`
  ADD CONSTRAINT `inscripciones_mesas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `inscripciones_mesas_ibfk_2` FOREIGN KEY (`mesa_final_id`) REFERENCES `mesas_finales` (`id`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`),
  ADD CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`);

--
-- Filtros para la tabla `materias_usuarios`
--
ALTER TABLE `materias_usuarios`
  ADD CONSTRAINT `materias_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `materias_usuarios_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `mesas_finales`
--
ALTER TABLE `mesas_finales`
  ADD CONSTRAINT `mesas_finales_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`materia_usuario_id`) REFERENCES `materias_usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
