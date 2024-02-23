-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2024 a las 14:46:44
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
-- Base de datos: `basepractica`
--
CREATE DATABASE IF NOT EXISTS `basepractica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `basepractica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `username` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'desconectado',
  `nombre` varchar(255) DEFAULT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`username`, `estado`, `nombre`, `img`) VALUES
('AdrikIII', 'desconectado', 'Ivan', 'ivan.jpg'),
('Amlo4T', 'en linea', 'Dennis', 'dennis.jpg'),
('Jayy', 'desconectado', 'Javier', 'jayy.jpg'),
('Mexicano', 'en linea', 'Rafael', 'mexicano.jpg'),
('Nelnat', 'desconectado', 'Jezer', 'nelnat.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`username`);
--
-- Base de datos: `bd_farmacia`
--
CREATE DATABASE IF NOT EXISTS `bd_farmacia` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bd_farmacia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_empleado`
--

CREATE TABLE `direccion_empleado` (
  `id_direccionE` int(10) UNSIGNED NOT NULL,
  `NO_empleado` int(10) UNSIGNED NOT NULL,
  `calle` varchar(60) NOT NULL,
  `numero` int(13) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `CP` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_farmacia`
--

CREATE TABLE `direccion_farmacia` (
  `id_direccionF` int(10) UNSIGNED NOT NULL,
  `id_farmacia` int(10) UNSIGNED NOT NULL,
  `calle` varchar(60) NOT NULL,
  `numero` int(13) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `CP` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_laboratorio`
--

CREATE TABLE `direccion_laboratorio` (
  `id_direccionL` int(10) UNSIGNED NOT NULL,
  `id_laboratorio` int(10) UNSIGNED NOT NULL,
  `calle` varchar(60) NOT NULL,
  `numero` int(13) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `CP` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `NO_empleado` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidoPaterno` varchar(60) NOT NULL,
  `apellidoMaterno` varchar(60) DEFAULT NULL,
  `CURP` varchar(18) NOT NULL,
  `id_farmacia` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado`
--

CREATE TABLE `encargado` (
  `id_farmacia` int(10) UNSIGNED NOT NULL,
  `NO_empleado` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacia`
--

CREATE TABLE `farmacia` (
  `id_farmacia` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacia_telefono`
--

CREATE TABLE `farmacia_telefono` (
  `id_farmacia` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fempleado_telefono`
--

CREATE TABLE `fempleado_telefono` (
  `NO_empleado` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboran`
--

CREATE TABLE `laboran` (
  `id_farmacia` int(10) UNSIGNED NOT NULL,
  `NO_empleado` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_laboratorio` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `nombre_contacto` varchar(60) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio_telefono`
--

CREATE TABLE `laboratorio_telefono` (
  `id_laboratorio` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int(10) UNSIGNED NOT NULL,
  `nombre_comercial` varchar(60) NOT NULL,
  `componente_activo` varchar(60) NOT NULL,
  `idTipo_presentacion` int(10) UNSIGNED NOT NULL,
  `acciones_terapeuticas` varchar(200) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `id_laboratorio` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id_farmacia` int(10) UNSIGNED NOT NULL,
  `id_medicamento` int(10) UNSIGNED NOT NULL,
  `cantidad` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_presentacion`
--

CREATE TABLE `tipos_presentacion` (
  `idTipo_presentacion` int(10) UNSIGNED NOT NULL,
  `presentacion` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_telefono`
--

CREATE TABLE `tipos_telefono` (
  `idTipo` int(10) UNSIGNED NOT NULL,
  `tipoTelefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direccion_empleado`
--
ALTER TABLE `direccion_empleado`
  ADD PRIMARY KEY (`id_direccionE`),
  ADD KEY `NO_empleado` (`NO_empleado`);

--
-- Indices de la tabla `direccion_farmacia`
--
ALTER TABLE `direccion_farmacia`
  ADD PRIMARY KEY (`id_direccionF`),
  ADD KEY `id_farmacia` (`id_farmacia`);

--
-- Indices de la tabla `direccion_laboratorio`
--
ALTER TABLE `direccion_laboratorio`
  ADD PRIMARY KEY (`id_direccionL`),
  ADD KEY `id_laboratorio` (`id_laboratorio`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`NO_empleado`,`id_farmacia`),
  ADD UNIQUE KEY `CURP` (`CURP`),
  ADD KEY `id_farmacia` (`id_farmacia`);

--
-- Indices de la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD PRIMARY KEY (`id_farmacia`,`NO_empleado`),
  ADD KEY `NO_empleado` (`NO_empleado`);

--
-- Indices de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`id_farmacia`);

--
-- Indices de la tabla `farmacia_telefono`
--
ALTER TABLE `farmacia_telefono`
  ADD PRIMARY KEY (`id_farmacia`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `fempleado_telefono`
--
ALTER TABLE `fempleado_telefono`
  ADD PRIMARY KEY (`NO_empleado`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `laboran`
--
ALTER TABLE `laboran`
  ADD PRIMARY KEY (`id_farmacia`,`NO_empleado`),
  ADD KEY `NO_empleado` (`NO_empleado`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `laboratorio_telefono`
--
ALTER TABLE `laboratorio_telefono`
  ADD PRIMARY KEY (`id_laboratorio`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamento`),
  ADD KEY `idTipo_presentacion` (`idTipo_presentacion`),
  ADD KEY `id_laboratorio` (`id_laboratorio`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_farmacia`,`id_medicamento`),
  ADD KEY `id_medicamento` (`id_medicamento`);

--
-- Indices de la tabla `tipos_presentacion`
--
ALTER TABLE `tipos_presentacion`
  ADD PRIMARY KEY (`idTipo_presentacion`);

--
-- Indices de la tabla `tipos_telefono`
--
ALTER TABLE `tipos_telefono`
  ADD PRIMARY KEY (`idTipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direccion_empleado`
--
ALTER TABLE `direccion_empleado`
  MODIFY `id_direccionE` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion_farmacia`
--
ALTER TABLE `direccion_farmacia`
  MODIFY `id_direccionF` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion_laboratorio`
--
ALTER TABLE `direccion_laboratorio`
  MODIFY `id_direccionL` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `NO_empleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  MODIFY `id_farmacia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_laboratorio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_presentacion`
--
ALTER TABLE `tipos_presentacion`
  MODIFY `idTipo_presentacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_telefono`
--
ALTER TABLE `tipos_telefono`
  MODIFY `idTipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `direccion_empleado`
--
ALTER TABLE `direccion_empleado`
  ADD CONSTRAINT `direccion_empleado_ibfk_1` FOREIGN KEY (`NO_empleado`) REFERENCES `empleado` (`NO_empleado`);

--
-- Filtros para la tabla `direccion_farmacia`
--
ALTER TABLE `direccion_farmacia`
  ADD CONSTRAINT `direccion_farmacia_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`);

--
-- Filtros para la tabla `direccion_laboratorio`
--
ALTER TABLE `direccion_laboratorio`
  ADD CONSTRAINT `direccion_laboratorio_ibfk_1` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`);

--
-- Filtros para la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD CONSTRAINT `encargado_ibfk_1` FOREIGN KEY (`NO_empleado`) REFERENCES `empleado` (`NO_empleado`),
  ADD CONSTRAINT `encargado_ibfk_2` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`);

--
-- Filtros para la tabla `farmacia_telefono`
--
ALTER TABLE `farmacia_telefono`
  ADD CONSTRAINT `farmacia_telefono_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`),
  ADD CONSTRAINT `farmacia_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);

--
-- Filtros para la tabla `fempleado_telefono`
--
ALTER TABLE `fempleado_telefono`
  ADD CONSTRAINT `fempleado_telefono_ibfk_1` FOREIGN KEY (`NO_empleado`) REFERENCES `empleado` (`NO_empleado`),
  ADD CONSTRAINT `fempleado_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);

--
-- Filtros para la tabla `laboran`
--
ALTER TABLE `laboran`
  ADD CONSTRAINT `laboran_ibfk_1` FOREIGN KEY (`NO_empleado`) REFERENCES `empleado` (`NO_empleado`),
  ADD CONSTRAINT `laboran_ibfk_2` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`);

--
-- Filtros para la tabla `laboratorio_telefono`
--
ALTER TABLE `laboratorio_telefono`
  ADD CONSTRAINT `laboratorio_telefono_ibfk_1` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`),
  ADD CONSTRAINT `laboratorio_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`idTipo_presentacion`) REFERENCES `tipos_presentacion` (`idTipo_presentacion`),
  ADD CONSTRAINT `medicamentos_ibfk_2` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`);
--
-- Base de datos: `bd_productos`
--
CREATE DATABASE IF NOT EXISTS `bd_productos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_productos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio`, `imagen`) VALUES
(1, 'chetos', 'chetos amarillos', 13.00, 'chetos.webp'),
(2, 'cocacola', 'coca 600ml', 20.00, 'coca.webp'),
(3, 'frijol', 'frijol en lata', 15.00, 'frijol.webp'),
(4, 'cocacola', 'coca 1L', 40.00, 'coca.webp');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);
--
-- Base de datos: `bootcamp`
--
CREATE DATABASE IF NOT EXISTS `bootcamp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bootcamp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chirps`
--

CREATE TABLE `chirps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `chirps`
--

INSERT INTO `chirps` (`id`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Estoy aprendiendo laravel', 1, '2024-01-22 09:30:05', '2024-01-22 09:30:05'),
(2, 'Estoy aprendiendo laravel', 1, '2024-01-22 09:41:29', '2024-01-22 09:41:29'),
(3, 'Waos', 1, '2024-01-22 09:54:13', '2024-01-22 09:54:13'),
(4, 'equis de', 1, '2024-01-22 11:01:26', '2024-01-22 11:01:26'),
(5, 'jsjsjsjsjs', 1, '2024-01-22 11:02:56', '2024-01-22 11:02:56'),
(6, 'E S E N C I A', 1, '2024-01-22 11:04:24', '2024-01-22 11:04:24'),
(8, 'E P I C A R D O', 1, '2024-01-22 11:07:37', '2024-01-22 11:07:37'),
(9, 'XDXDXDXDDX', 1, '2024-01-26 17:44:42', '2024-01-26 17:44:42'),
(10, 'Heriberto', 1, '2024-01-26 17:59:02', '2024-01-26 17:59:02'),
(11, 'qwerty', 1, '2024-01-27 22:30:12', '2024-01-27 22:30:12'),
(12, 'hello', 1, '2024-01-28 00:04:18', '2024-01-28 00:04:18'),
(13, 'tilin', 1, '2024-01-28 00:04:41', '2024-01-28 00:04:41'),
(14, 'no ultimo', 1, '2024-01-28 01:52:49', '2024-01-29 06:54:33'),
(16, 'que ondaaaaaaaas', 2, '2024-01-29 09:08:52', '2024-01-29 09:08:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2024_01_22_025658_create_chirps_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'PDS-Jezer Samuel Chimal Ruiz', 'j3z3rsamuel@gmail.com', NULL, '$2y$12$ZgK0rsUq2VZVOQgulpqZOuTZ51l0xxQmICX4bjTB9BMRJSGKD5FlS', NULL, '2024-01-21 20:54:29', '2024-01-21 20:54:29'),
(2, 'Nelnat XL', 'nelnatxl@gmail.com', NULL, '$2y$12$stYTpzveooiXiyMFAaosA.v9GM9VPUl7CiS3b70DA5ImeQ4/SLjR2', NULL, '2024-01-29 07:22:06', '2024-01-29 07:22:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chirps`
--
ALTER TABLE `chirps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chirps_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chirps`
--
ALTER TABLE `chirps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chirps`
--
ALTER TABLE `chirps`
  ADD CONSTRAINT `chirps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Base de datos: `centro_capacitacion`
--
CREATE DATABASE IF NOT EXISTS `centro_capacitacion` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `centro_capacitacion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_talleres`
--

CREATE TABLE `catalogo_talleres` (
  `codigo_taller` int(10) UNSIGNED NOT NULL,
  `nombreTaller` varchar(200) NOT NULL,
  `duracion` int(3) UNSIGNED NOT NULL,
  `requisitos` text DEFAULT NULL,
  `costo` decimal(5,2) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `idMunicipio` int(10) UNSIGNED NOT NULL,
  `idCiudad` int(10) UNSIGNED NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idEstado`, `idMunicipio`, `idCiudad`, `ciudad`, `created_at`, `modified_at`) VALUES
(23, 1, 1, 'Cozumel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 21, 'Punta Celarain\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 22, 'Punta Molas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 57, 'Las Palmitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 67, 'El Cedral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 115, 'Palancar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 122, 'Punta Morena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 141, 'Xel-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 165, 'Buenavista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 232, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 265, 'Presidente Intercontinental\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 270, 'Punta Chiqueros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 295, 'San Bernardo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 301, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 305, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 373, 'PASA Cozumel [Basurero Municipal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 379, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 384, 'Los Garañones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 385, 'Caleta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 391, 'CAPA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 402, 'Mayan Bee\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 414, 'Fiesta Americana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 418, 'María Luisa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 419, 'Cerro Chumul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 422, 'Dos Arbolitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 426, 'La Estrella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 427, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 432, 'Gallo de Oro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 452, 'Aldea Isla Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 456, 'Sol Estéreo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 462, 'Los Pinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 465, 'San Andrés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 468, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 474, 'México Lindo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 475, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 480, 'Rancho Lulú\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 487, 'María Magdalena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 491, 'Mezcalitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 494, 'Nuestra Señora de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 498, 'Palmar Primero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 505, 'Aqua Dorada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 515, 'Rancho Argüelles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 543, 'San Gervasio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 546, 'Paloma Negra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 561, 'Grand Occidental\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 563, 'San Miguel Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 576, 'La Milpa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 593, 'Sunscape\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 595, 'San Bartolo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 617, 'Ramonales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 628, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 735, 'La Amistad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 737, 'Punta Arrecifes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 738, 'La Cabaña del Pescador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 739, 'CALICA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 740, 'CALICA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 741, 'Paso María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 744, 'Chen Río\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 745, 'Chichihualco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 746, 'Xkaliahche\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 749, 'Allegro Resort Cozumel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 750, 'The Money Bar Beach Club\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 752, 'Los Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 758, 'Villa Mafi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 760, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 763, 'Zazil-Beh\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 764, 'Ubaldo Verde\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 766, 'Edilberto Sosa León\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 767, 'Ix-Chel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 768, 'Kilómetro Ocho y Medio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 769, 'Los Nueve Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 774, 'Tamaulipas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 776, 'Kilómetro Cuatro Punto Cinco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 777, 'Ecoparque Cuzam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 781, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 787, 'Quinta Vimar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 788, 'Kilómetro Doce\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 790, 'El Mariachi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 793, 'Las Palmeras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 794, 'Playa Bosh\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 795, 'El Paso del Cedral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 797, 'Los Pinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 798, 'Playa Corona\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 799, 'Playa Mía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 800, 'Pueblo Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 801, 'Punta Francesa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 802, 'El Divino Niño Jesús\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 809, 'Las Gemelas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 810, 'Garañones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 811, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 813, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 814, 'San Miguel Tercero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 816, 'Javier Escalante\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 817, 'San Gabriel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 818, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 819, 'Santa Cecilia Nueva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 820, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 825, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 836, 'Playa Bonita (Punta Chiqueros)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 837, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 840, 'San Cipriano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 841, 'Playa San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 845, 'Nueva Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 848, 'Chankanaab [Parque]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 854, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 856, 'Fausto Coral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 858, 'San Fernando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 859, 'Maya Luum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 861, 'Iberostar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 862, 'Iguanas Ranas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 869, 'El Refugio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 870, 'Hacienda Antigua\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 873, 'Los Tres Regalos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 874, 'Laguna Ciega\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 876, 'La Media Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 877, 'La Selva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 878, 'Nachi Cocom\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 879, 'Rancho Palmitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 881, 'Elio Carmichael [Escuela]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 887, 'Rancho Alegre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 888, 'Rancho Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 889, 'Don Ranulfo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 890, 'El Refugio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 891, 'Ranchitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 893, 'Quinta la Bonita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 895, 'Santa Teresa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 898, 'El Curvato\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 899, 'Varadero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 901, 'Yumka\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 907, 'Casa Tunich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 914, 'Turquesa [Radio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 916, 'Isabel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 917, 'Juan Leyenda Trigo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 919, 'Mundo Palancar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 924, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 926, 'Casa de las Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 927, 'Mister Sanchos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 928, 'Villas Pavo Real\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 929, 'El Rincón [Héctor]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 931, 'Costa del Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 932, 'Las Fincas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 933, 'Paradise Condominiums\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 934, 'Casa Birdie\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 935, 'Osio Meliporas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 936, 'El Cielo [Villas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 937, 'Paradise Beach\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 938, 'Residencias Reef\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 939, 'Las Uvas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 940, 'Las Ventanas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 941, 'Villa Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 942, 'Villa Tikal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 943, 'Los Abuelos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 944, 'Cozumeleño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 947, 'La Esperanza AC\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 948, 'Guadalupe del Carmen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 949, 'La Huerta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 950, 'Kilómetro Ocho y Medio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 953, 'Katia Soto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 955, 'Rancho Enríquez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 956, 'Rancho Palomo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 957, 'El Refugio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 958, 'San Nicolás\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 960, 'Bodoquito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 961, 'Bosh Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 962, 'De los Santos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 963, 'Discover México\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 964, 'Don Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 965, 'Eduardo Toledo Parra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 967, 'Tres Marías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 968, 'Gabriel y Gabriela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 969, 'Gastón Cantarell\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 970, 'El Gato\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 971, 'Isla de la Pasión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 972, 'Isla Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 973, 'Luis Alcérreca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 974, 'Peña Bohemia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 975, 'Las Perlitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 976, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 977, 'San Judas Tadeo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 978, 'Universo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 979, 'Costa Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 981, 'Don Raúl\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 982, 'El Capitán [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 984, 'Ilusión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 985, 'La Princesa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 987, 'Mariposas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 988, 'Kilómetro Dieciocho Punto Veinticinco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 989, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 991, 'Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 992, 'Santa Zitta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 993, 'San Manuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 994, 'Góngora [Palapas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 999, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1000, 'Nazario Uc Ciau\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1001, 'Daniel Gamboa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1002, 'Linda Vista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1004, 'Patricio (Kilómetro Siete)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1006, 'Nojoch Suku\'un\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1008, 'El Pastorcito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1009, 'San Anselmo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1010, 'San Gervasio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1011, 'San Lucas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1012, 'Sandoval\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1014, 'Cozumel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1015, 'Villa Caracoles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1016, 'Villa Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1017, 'Villa el Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1018, 'Villa M II\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1019, 'Villa Yak\'alil [Kilómetro Doce Punto Cinco]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1020, 'Las Uvas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1029, 'Campeche\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1030, 'Arturo Pavía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1031, 'Rincón de Cervantes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1032, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1033, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1034, 'Los Potros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1035, 'Campestre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1036, 'Las Brisas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1037, 'Las Glorias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1038, 'Lirios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1039, 'Palmar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1040, 'Residencial\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1041, 'Salgado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1042, 'X-Kanha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1043, 'Kilómetro 3.5\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1044, 'El Porvenir [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1045, 'Villas Cozumel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1046, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1047, 'Santa Teresa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1048, 'Cuatro Amores [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1049, 'Carlos Eduardo Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1050, 'Tres Potros [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1051, 'César\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1052, 'Miguel Isidro [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1053, 'Almaluja\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1054, 'Mini Súper Dael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1055, 'Magdaleno Avilés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1056, 'San Benito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1057, 'Palmar Beach Club\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1058, 'La Terquedad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1059, 'Ek Nah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1060, 'Ejido Cozumel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1061, 'Antonio Novelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1062, 'Bugambilias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1063, 'Escondido [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1064, 'Martha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1065, 'Reyes Baltazar Cauich [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1066, 'Santiago Vivas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1067, 'Javier Novelo Buenfil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1068, 'Elder Portillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1069, 'Landmark\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 1, 1070, 'Mauro Villanueva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1, 'Felipe Carrillo Puerto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 6, 'Ignacio Manuel Altamirano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 11, 'Betania\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 33, 'Chancah Derrepente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 34, 'Chancah Veracruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 36, 'Chanchén Comandante\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 39, 'Chucab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 41, 'Chun On\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 42, 'Chumpón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 43, 'Chunhuás\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 44, 'Chunhuhub\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 52, 'Dzoyola\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 53, 'Dzulá\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 58, 'Filomeno Mata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 65, 'Hobompich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 73, 'Kancabchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 84, 'Kopchen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 87, 'Laguna Kaná\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 101, 'Melchor Ocampo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 105, 'Naranjal Poniente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 108, 'Noh-Bec\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 110, 'Noh-Cah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 111, 'La Noria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 118, 'Petcacab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 125, 'Polinkín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 126, 'Polyuc\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 128, 'Pozo Blanco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 131, 'Presidente Juárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 137, 'Casa Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 139, 'Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 144, 'Sacrificio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 149, 'San Andrés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 169, 'San Felipe Berriozábal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 172, 'San Francisco Aké\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 181, 'San José Primero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 182, 'San José Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 193, 'San Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 207, 'San Ramón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 221, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 225, 'Santa María Poniente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 232, 'Santa Rosa Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 239, 'Señor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 243, 'Tabi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 244, 'Tac-Chivo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 248, 'Tepich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 250, 'Tihosuco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 251, 'Tixcacal Guardia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 254, 'Trapich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 259, 'Tuzik\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 262, 'Uh May\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 269, 'Xaan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 276, 'X-Hazil Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 282, 'X-Pichil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 284, 'X-Yatil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 285, 'Yaxché Chal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 287, 'Yaxley\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 288, 'Yoactún\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 292, 'Yodzonot Chico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 306, 'Andrés Quintana Roo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 307, 'Bella Flor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 308, 'Canzepchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 309, 'El Corozo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 312, 'Chan Chen Chuc\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 314, 'Chan Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 322, 'Emiliano Zapata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 324, 'Francisco I. Madero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 325, 'Francisco May\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 332, 'Camilo Varilla Jiménez [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 334, 'Lal-Cah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 336, 'Mixtequilla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 339, 'Nueva Loría\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 340, 'Nuevo Israel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 354, 'San Bartolo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 358, 'San Hipólito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 364, 'El Triunfo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 368, 'X-Konha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 381, 'San Antonio Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 385, 'El Albur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 392, 'Chan-Yodzonot\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 399, 'José María Pino Suárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 400, 'Kampokolché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 407, 'Kilómetro Sesenta y Ocho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 416, 'Pomká\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 420, 'Reforma Agraria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 421, 'San Vicente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 423, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 428, 'El Santísimo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 431, 'Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 432, 'Santa Isabel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 434, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 445, 'Yodzonot Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 447, 'Kancab Chén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 450, 'Roberto Pérez Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 454, 'Lagos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 455, 'María Elena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 456, 'Punta Herrero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 459, 'San Román\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 461, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 481, 'Anexa Santa Fe Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 492, 'Cacab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 501, 'Fitosanitaria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 502, 'Felipe Carrillo Puerto [CBTA 80]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 511, 'Columpich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 517, 'La Curva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 520, 'Chanchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 524, 'Chan Xcán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 526, 'Chapas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 532, 'Chun Akidz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 535, 'Chun-Yah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 536, 'Chunyaxché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 541, 'Dzitbalché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 553, 'Santa Teresa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 555, 'Filadelfia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 557, 'Frontera Norte\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 558, 'Charys\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 566, 'Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 567, 'El Coleguita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 571, 'Hazil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 574, 'Los Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 584, 'Kankabdzonot\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 585, 'Chumpón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 587, 'Cecilio Chí (Kilómetro Sesenta y Cuatro)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 591, 'Los Lagartos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 593, 'La Lagunita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 598, 'Lirios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 599, 'Las Lomas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 604, 'Montalvo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 605, 'Punta Mosquitero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 607, 'Marín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 612, 'Nohkancab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 618, 'Mil Caminos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 620, 'Laguna Pucté\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 622, 'Punta Herrero [Faro]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 625, 'La Caoba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 626, 'Kilómetro Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 634, 'Isla Zitipal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 635, 'Rancho Chico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 641, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 643, 'Ninguno [Rastro Municipal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 647, 'Zona Arqueológica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 648, 'Sahcabchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 652, 'San Andrés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 657, 'San Antonio Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 658, 'San Antonio Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 665, 'San Daniel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 681, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 684, 'La Bendición de Dios [Balneario]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 685, 'San Lorenzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 688, 'San Lorenzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 691, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 695, 'San Pablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 701, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 707, 'Santa Amalia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 710, 'Santa Fe Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 711, 'Santa Gertrudis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 713, 'Santa Matilde\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 729, 'Tasistal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 737, 'Tres Pocitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 738, 'Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 740, 'Tuzik II\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 752, 'Tuzik\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 753, 'Ninguno [Vivero Municipal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 762, 'Caña Brava\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 763, 'Tepich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 768, 'X-Hazil Norte\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 769, 'Xhulmi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 781, 'La Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 835, 'Seis de Enero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 837, 'Bachoco [Granja]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 840, 'Industria Silvícola Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 847, 'Flor de Jazmín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 853, 'Rancho Tadeo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 869, 'Tzukum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 878, 'El Vergel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 879, 'El Girasol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 885, 'Dos Cedritos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 887, 'La Gloria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 899, 'San Lorenzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 904, 'Los Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 905, 'Omega\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 906, 'Andrea Angélica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 909, 'CERESO\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 911, 'Dzaptún\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 912, 'Ernesto Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 915, 'El Girasol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 922, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 927, 'Santa Clara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 935, 'Silvestre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 936, 'Rancho Víctor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 944, 'Los Laureles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 947, 'El Roble\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 949, 'Mi Ranchito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 950, 'Nicte Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 951, 'El Olvido (Kulché)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 956, 'Punta Estrella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 957, 'El Resbalón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 962, 'San Antonio de Pucté\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 967, 'San Nicolás\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 969, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 970, 'Santa Leticia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 974, 'Sisbic\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 978, 'X-Hazil Primero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 979, 'XECPQ [Estación de Radio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 980, 'Xijun Kah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 985, 'Gustavo Ché Montalvo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 989, 'Fernando Serrano Trujillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 994, 'Radio Turquesa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 995, 'San Marcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 996, 'SEDENA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1004, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1008, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1014, 'Chunhuhub\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1019, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1026, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1028, 'El Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1035, 'El Rey\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1038, 'Nuevo Amanecer [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1043, 'Balam Nah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1046, 'Yodzonot\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1048, 'Las Bugambilias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1050, 'Ninguno [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1051, 'Alfonso Argüelles Suárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1054, 'Kilómetro Noventa y Tres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1056, 'La Librada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1058, 'Rastafari Mens Club\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1060, 'El Charro [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1061, 'Cruz-Chen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1065, 'San Salvador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1066, 'Villahermosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1067, 'Akachén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1070, 'Chan Koh\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1072, 'José María Pino Suárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1073, 'Mulichén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1075, 'San Silverio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1078, 'Yalchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1079, 'La Maravilla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1081, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1082, 'San Juan Dieguito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1085, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1086, 'Las Golondrinas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1087, 'Kiichpam K\'áax\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1088, 'Ignacio Xool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1089, 'Las Isabeles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1090, 'José Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1092, 'Juan Carlos Martínez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1095, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1100, 'Novelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1104, 'El Perico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1105, 'Los Ponchos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1106, 'El Progreso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1108, 'Shekkinha (la Gloria de Dios)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1110, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1111, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1112, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1113, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1114, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1115, 'San Valentín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1116, 'Sijiil Noh Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1117, 'Suku\'un Rich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1118, 'Tierra Bonita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1120, 'Tricasa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1121, 'SEDARI [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1123, 'Amadamaya S.A. de C.V. [Kilómetro Ochenta y Uno]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1124, 'Casa Arvimi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1126, 'El Paso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1129, 'Emilio Che Tuz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1130, 'Estanislao Bolio Caamal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1133, 'La Estrella [Kilómetro Ochenta y Uno]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1135, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1136, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1138, 'Sian Kaan Villas [Cabañas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1139, 'María Magdalena Dzul Chuc\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1143, 'Nueva Vida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1144, 'Pablo Jiménez Villanueva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1145, 'Pollos a la Leña [Restaurante]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1150, 'Casa Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1151, 'La Querendona\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1152, 'Rancho Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1153, 'Betania Tiixmul [Pozo Trece]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1154, 'Daniel Pech Poot\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1155, 'El Cenote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1156, 'El Descanso [Paradero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1157, 'Genny Pech Herrera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1158, 'Kambulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1159, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1160, 'La Fortaleza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1161, 'La Ilusión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1162, 'María de los Ángeles Xiu García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1163, 'María del Socorro Herrera Herrera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1164, 'Martínez [Restaurante]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1165, 'Moisés López López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1166, 'Muyil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1167, 'Salmos a Jehová\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1168, 'Samuel Chan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1169, 'José Aban Che\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1170, 'Casa Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1171, 'Tranquilo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1172, 'Los Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1173, 'Las Gemelas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1174, 'Espíritu Santo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1175, 'Calacuaya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1176, 'Los Cocos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1177, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1178, 'Layli Meyaa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1179, 'Amado Tun Castillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 2, 1180, 'Cristo en el Huerto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 1, 'Isla Mujeres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 46, 'La Providencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 54, 'Chacmuchuch\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 76, 'Sueño Guajiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 87, 'Flamingos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 91, 'La Proa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 92, 'Punta Sam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 93, 'Rancho Viejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 95, 'El Meco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 103, 'Isla Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 115, 'Cabo Catoche\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 117, 'Palo Bravo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 118, 'Boca Iglesia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 122, 'Boca Nueva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 123, 'Punta Norte de Contoy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 128, 'Francisco Javier\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 129, 'Kart\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 156, 'Santa Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 167, 'Santa Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 171, 'Los Compadres [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 172, 'El Abuelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 173, 'La Estrella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 177, 'La Morena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 180, 'Centauros [Colonia]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 190, 'Villas Punta Sam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 191, 'Hacienda Punta Sam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 193, 'Playa Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 227, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 249, 'Isla Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 252, 'Las Dos Glorias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 256, 'Santa Fe [Sascabera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 258, 'Bonsai\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 260, 'El Corzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 261, 'Cuba Can\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 269, 'Las Gaviotas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 270, 'Fátima\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 273, 'Continental\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 274, 'Nicte-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 286, 'Zona Urbana Ejido Isla Mujeres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 289, 'Luis Barocio de la Lama\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 290, 'Número 19\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 297, 'Las Tres Cruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 299, 'Cayo Sucio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 300, 'Maracatu\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 306, 'La Mina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 307, 'Santa Fátima\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 310, 'Rancho Viejo [Club Deportivo]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 313, 'San Valentín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 314, 'Santa Lucía (El Tigre)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 315, 'Santa Odila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 318, 'Refugio del Pirata Morgan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 320, 'Villas Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 323, 'El Manglar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 324, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 327, 'Alberto Cauch\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 328, 'El Azabache\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 330, 'El Campet\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 332, 'Asis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 334, 'Casa Tangara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 337, 'Costa Mujeres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 339, 'Chalet Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 341, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 342, 'El Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 347, 'La Trinidad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 352, 'Francisco May\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 353, 'Fundación Renacimiento\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 354, 'El Gran Chaparral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 356, 'Héctor Da Silva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 357, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 367, 'Los Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 379, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 381, 'Marina Isla Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 386, 'El Palomo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 387, 'Paradise Beach Club\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 388, 'Pedregal del Río Manatí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 391, 'Punta Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 392, 'El Sauce y la Palma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 395, 'Residencial Arrecifes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 398, 'El Sacrificio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 399, 'El Oriental\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 403, 'San Manuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 406, 'Santa Rosario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 411, 'Hermosa Provincia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 412, 'Uchben Cah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 414, 'Villa Erfica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 415, 'Villa Fragata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 416, 'Villa Nifers\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 418, 'Banco de León\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 420, 'Cayo Alcatraz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07');
INSERT INTO `ciudades` (`idEstado`, `idMunicipio`, `idCiudad`, `ciudad`, `created_at`, `modified_at`) VALUES
(23, 3, 421, 'Escénica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 427, 'Mecades\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 433, 'Chico Cenote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 434, 'Playa Mujeres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 435, 'El Dorado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 436, 'La Bendición de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 437, 'Gaviota\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 438, 'Dos Arbolitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 440, 'San Fernando de los Núñez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 442, 'Rancho Jordán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 443, 'José Canché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 444, 'Los Mariachis Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 445, 'Los Mariachis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 446, 'Los Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 448, 'Tres de Septiembre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 449, 'Jabalí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 451, 'La Bellota\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 452, 'Casa de Sachll\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 453, 'Casa Ricardo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 454, 'Cayo Cahum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 455, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 456, 'Daniel de los Cobos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 458, 'Familia Sanntage\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 459, 'Felipe Trejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 462, 'Los Pinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 464, 'Rancho Arena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 465, 'Rancho Oasis de Paz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 466, 'Rey Arturo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 467, 'Ricardo Rovira Iglesias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 468, 'San Agustín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 469, 'La Providencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 470, 'San Germán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 471, 'Santa María Ecab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 472, 'La Siria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 473, 'Tres Angelitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 474, 'La Trigueña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 475, 'La Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 476, 'La Amada [Residencial]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 477, 'Bugambilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 478, 'El Alba [Colonia]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 479, 'El Charro [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 480, 'El Corchal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 481, 'El Veinticuatro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 483, 'El Jordán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 484, 'El Palomar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 485, 'Las Tres Cruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 486, 'El Sonora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 489, 'La Franela [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 490, 'La Joyita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 491, 'La Verbena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 492, 'Las 2 Potras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 493, 'Las Magnolias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 494, 'Los 3 Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 495, 'Los Dibujos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 496, 'Los Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 497, 'Los Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 498, 'Isla Icacos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 499, 'María [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 500, 'Minas de Rancho Viejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 501, 'Los Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 502, 'El Recuerdo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 509, 'La Bellota\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 516, 'El Palmar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 518, 'Oscar Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 520, 'Parcela Lirio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 521, 'Samuel Couoh Peraza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 523, 'Casona Julia Linda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 524, 'Ikarus\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 525, 'Maankinal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 526, 'Riu [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 527, 'Cándida Román\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 528, 'Carlos Xiu\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 529, 'La Fortuna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 530, 'Lucio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 531, 'Miguel Otero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 532, 'Montecristo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 533, 'Paco [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 535, 'La Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 536, 'Aurora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 537, 'Bendición de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 538, 'Don Emiliano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 539, 'Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 540, 'Guadapero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 541, 'Hacienda Morena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 542, 'Irma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 543, 'Juan Eduardo Poot Uchín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 544, 'Los Balanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 545, 'Los Retoños\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 546, 'Manuel Zacarías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 547, 'Moisés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 548, 'Nueva Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 549, 'Pavo Real\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 550, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 551, 'Veintisiete [Parcela]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 552, 'La Esperanza 2\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 553, 'Víctor Pelle\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 554, 'Alfonso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 556, 'La Continental\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 557, 'La Fortaleza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 558, 'Casa Playa Tortuga\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 559, 'El Ramal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 560, 'La Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 561, 'San Valentín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 562, 'El Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 563, 'El Palomo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 564, 'Cinco Hermanos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 566, 'Kinich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 569, 'Las Águilas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 3, 572, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1, 'Chetumal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 6, 'Los Alacranes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 7, 'Álvaro Obregón Viejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 8, 'Allende\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 14, 'Cacao\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 16, 'Calderitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 17, 'Esteban Baca Calderón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 18, 'Caobas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 20, 'Cocoyol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 31, 'Estero Franco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 32, 'San Francisco Botes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 33, 'Francisco Villa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 37, 'Huay-Pix\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 38, 'Jesús González Ortega\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 39, 'Juan Sarabia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 50, 'Laguna Guerrero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 53, 'Mahahual\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 60, 'Nachi Cocom\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 64, 'Nicolás Bravo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 67, 'Palmar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 70, 'Revolución\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 73, 'Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 75, 'Río Indio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 77, 'Sabidos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 85, 'San Manuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 98, 'Subteniente López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 104, 'Ucum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 106, 'La Unión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 107, 'Rancho de los Vallejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 110, 'Sacxán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 111, 'Xcalak\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 114, 'Xul-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 117, 'Tomás Garrido Canabal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 119, 'San Pedro Peralta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 123, 'Javier Rojo Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 124, 'Álvaro Obregón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 136, 'Carlos A. Madrazo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 159, 'Kohunlich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 163, 'Lázaro Cárdenas Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 184, 'Pucté\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 190, 'San Fernando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 191, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 197, 'Juan Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 201, 'Sergio Butrón Casas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 205, 'Tres Garantías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 214, 'La Adelita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 216, 'Arco Iris\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 220, 'La Carlota\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 225, 'Luis Echeverría Álvarez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 229, 'Dos Aguadas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 240, 'Limonar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 245, 'Morocoy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 249, 'Isidro Bernabé\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 252, 'Nuevo Bécar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 264, 'Raudales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 267, 'José Narciso Rovirosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 288, 'Calderas de Barlovento\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 290, 'Cinco de Mayo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 303, 'La Libertad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 305, 'Nuevo Caanán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 308, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 314, 'Punta Gavilán Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 319, 'San José de la Montaña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 321, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 327, 'Veracruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 330, 'Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 346, 'Las Palomas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 362, 'Tres Garantías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 363, 'Xahuachol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 364, 'Xtepen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 365, 'Xóchitl\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 367, 'Inchatiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 372, 'California\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 383, 'Santuario [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 406, 'El Arca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 407, 'Emiliano Zapata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 411, 'Arrocera del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 419, 'Gallo Prieto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 424, 'El Caballo Blanco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 433, 'El Cardenal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 440, 'Cocodrilas (UMA)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 443, 'Sal y Salma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 447, 'El Cedral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 472, 'Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 475, 'Emiliano Zapata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 479, 'Tapatío\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 484, 'La Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 513, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 517, 'Los Cedros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 523, 'El Henequén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 524, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 527, 'Los Cuatro Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 532, 'Chetumal [Campo Experimental]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 533, 'Ninguno [Instituto Tecnológico de la Zona Maya]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 546, 'Okotuil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 555, 'La Juventud\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 556, 'Kaluma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 564, 'El Mirador (Familia Avineda)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 571, 'La Lupita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 577, 'Marcos Requena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 581, 'El Matorral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 590, 'El Semental\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 598, 'Los Tulipanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 605, 'Icaiché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 614, 'El Palomar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 615, 'Las Dos Y\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 618, 'El Arca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 619, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 623, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 624, 'Don Cuchito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 627, 'Peto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 630, 'Los Pinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 638, 'La Ponderosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 639, 'Seis Hermanos (El Ranchito)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 640, 'San Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 641, 'El Porvenir (La Pila)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 656, 'Puerto Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 657, 'Valher\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 665, 'Anita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 669, 'Chactemal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 671, 'El Rosal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 680, 'La Finca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 681, 'Sac-Nicté\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 689, 'San Silvestre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 690, 'Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 694, 'Sol y Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 703, 'San Armando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 714, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 723, 'San Joseph\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 725, 'San Martín de Porres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 732, 'Cox Farms\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 739, 'Coral Garden Inn\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 741, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 742, 'Las Olas Tranquilas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 743, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 745, 'Santa Teresa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 750, 'Don Jacobo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 760, 'Cayo Centro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 776, 'El Tajín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 783, 'La Carolina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 785, 'Loma Linda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 791, 'Carolina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 799, 'El Naranjo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 800, 'Pedro Joaquín Coldwell\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 812, 'Cárcamo de Rebombeo Número Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 813, 'Corozal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 814, 'Francisco Alfaro Silvarán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 818, 'La Aventura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 819, 'Buenos Aires\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 821, 'Kilómetro Diez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 823, 'La Conchita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 824, 'Kilómetro Ocho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 826, 'Los Encinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 829, 'Las Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 830, 'Hermanos Lagos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 832, 'San Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 834, 'Subteniente López [Quebradora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 837, 'El Naranjo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 839, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 840, 'Parque Industrial\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 843, 'Hermanos Martínez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 844, 'La Fe en Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 851, 'Grand Bahía Diamante\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 854, 'Calquín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 859, 'La Cocotina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 867, 'El Rayito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 874, 'El Arca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 880, 'Héctor Esquiliano Solís\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 883, 'Luis Buenfil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 885, 'Casa Dany Pau\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 894, 'Juan Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 896, 'Don Nacho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 900, 'Las Margaritas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 908, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 912, 'San Andrés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 913, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 914, 'Francisco Godoy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 916, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 918, 'Don Douglas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 919, 'San Marcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 922, 'El Encuentro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 926, 'Missie\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 929, 'Colonia Ejidal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 931, 'El Esfuerzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 933, 'Rancho Ferrara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 944, 'Los Tamarindos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 955, 'Rancho Alegre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 956, 'Mireya Martínez (Kilómetro Veintiuno)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 957, 'Los Tres Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 958, 'La Penca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 959, 'La Flor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 960, 'Santa Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 966, 'San Alfonso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 969, 'Chaparral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 971, 'Linda Vista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 972, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 973, 'San Pablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 976, 'Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 977, 'El Encanto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 978, 'Fernando López Domínguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1003, 'Costa de Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1009, 'Tul Chi-Haltunha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1013, 'Playa Sonrisa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1016, 'Sol Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1033, 'El Castillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1089, 'Agua Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1090, 'Paulino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1093, 'El Bobal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1114, 'El Teco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1116, 'Rancho Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1119, 'Los Manguitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1134, 'Agustín Canul Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1153, 'Ninguno [CBTA Número 11]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1156, 'Alejandro Catana Mulato\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1160, 'Grúas Raza de Chetumal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1171, 'El Griego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1175, 'Río Huache\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1184, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1187, 'San Lorenzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1200, 'Raymundo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1208, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1209, 'La Sabana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1212, 'Casa Carolina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1220, 'Casa las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1221, 'Xkan-Lol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1224, 'El Cochinito de Oro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1225, 'El Crucero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1229, 'Bel-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1237, 'Francisco Vázquez Solís\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1250, 'El Bajío\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1254, 'La Calavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1256, 'El Achiotal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1258, 'El Admirable\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1261, 'El Querreque\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1264, 'Agua Potable\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1265, 'El Águila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1268, 'Cubano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1269, 'Kilómetro 6.5\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1274, 'Los Alpes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1276, 'Amada Carvajal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1277, 'Ana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1285, 'Mari Casa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1297, 'Las Tres Balbinas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1300, 'Beto Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1301, 'Ninguno [Bodega de Insecticidas y Fertilizantes]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1303, 'El Esfuerzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1304, 'Juan Borges y Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1307, 'Casa Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1315, 'Huay-Pix [Campamento]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1319, 'Ucum [Galeras]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1322, 'El Carmen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1323, 'Ninguno [Caseta de Bombeo]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1324, 'Cocoyol [Caseta de Inspección Fitopecuaria]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1327, 'Celaya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1328, 'Celestino Interián\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1329, 'La Forrajera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1332, 'El Chontal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1337, 'La Soledad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1339, 'Los Compadres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1340, 'Estrella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1342, 'La Concepción\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1345, 'Las Jaibas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1346, 'Carralillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1348, 'La Cristiandad (Kilómetro Ochenta y Cuatro)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1350, 'San Isidro Labrador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1351, 'Israel Millán Pelayo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1355, 'DM\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1359, 'Las Flores del Porvenir\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1360, 'Doroteo Pérez Moguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1363, 'Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1364, 'Santa Ana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1365, 'El Duende\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1366, 'Dzibanché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1381, 'Academia Estatal de Seguridad Pública\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1382, 'Las Estrellas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1384, 'Javier Esparza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1385, 'El Espejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1387, 'Bennys\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1390, 'Veinticuatro de Julio (Eduardo Reyes)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1391, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1392, 'El Mangal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1393, 'El Redomón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1394, 'Casa del Alfarero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1397, 'El Kambul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1401, 'El Crucero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1407, 'San Cipriano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1409, 'Claudio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1411, 'El Imán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1415, 'Garita Aduanal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1417, 'Subteniente López [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1419, 'El Gavilán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1421, 'Los Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1423, 'Genaro Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1426, 'Graciano Balam Dzul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1433, 'Hidalgo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1434, 'El Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1436, 'Los Henequenes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1441, 'Ninguno [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1455, 'Los Tigres del Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1456, 'Costa Cristal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1458, 'Alma Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1459, 'El Jardín de los Ángeles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1460, 'Mar y Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1461, 'Brad Zeca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1476, 'Oásis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1483, 'José Luis Andrade\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1486, 'Las Flores de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1493, 'Las Carmelitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1497, 'Mis Cuatro Estrellas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1502, 'Villamil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1509, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1520, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1521, 'El Jarocho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1523, 'Jeremías Córdova Domínguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1524, 'Miguel Palma Tamay\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1525, 'La Fogata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1527, 'Carámicua\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1531, 'Kumul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1533, 'Jorge Navarrete (Leydi)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1538, 'El Encanto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1548, 'Juan Manuel Várguez Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1549, 'Juan Pedro Mercader\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1552, 'Paso María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1554, 'La Cruz Sangrienta Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1559, 'Kinichná\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1562, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1570, 'Chatis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1572, 'Luis García Coria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1575, 'Mala Noche\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1580, 'Manuel Manzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1581, 'La Magdalena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1583, 'Manuel Villanueva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1590, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1591, 'La Isla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1592, 'Máximo Canul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1594, 'Estrella de Suerte\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1595, 'La Rosita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1597, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1602, 'Fabián López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1606, 'El Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1607, 'Monasterio de Nuestra Señora de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1609, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1624, 'La Palma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1627, 'El Porvenir\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1636, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1639, 'PIM Calderón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1641, 'La Pasadita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1644, 'Las Tres P (Paulino Ponce Parra)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1645, 'Joya Maya (Paytocal)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1649, 'Martín Haro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1652, 'Pablo Furió\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1655, 'Pino Suárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1657, 'Los Piratas del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1663, 'La Ponderosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1665, 'La Primavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1666, 'Grano de Oro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1673, 'Punta Estrella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1675, 'Punta Tam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1676, 'Caobas [Caseta de Verificación Fitozoosanitaria]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1677, 'Empedrados de Juan Sarabia [Quebradora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1678, 'Rancho Elizabeth\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1679, 'Hermanos Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1680, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1681, 'Antonio Ek\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1683, 'El Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1684, 'Los Huevos Kenwich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1691, 'Rancho Escondido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1692, 'Rancho Gabriela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1696, 'Rancho Portillas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1701, 'El Roble\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1702, 'Reynaldo Cantú Pérez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1707, 'El Roble\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1708, 'Los Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1712, 'Santa Rosa (La Aguada)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1716, 'El Sagrario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1720, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1726, 'Margaret\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1729, 'San Cristobal Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1730, 'San Fernando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1735, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1738, 'San Gerónimo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1739, 'La Aldea\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1745, 'San Martín Tres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1748, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1749, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1751, 'Sandwood Villas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1755, 'Santa Fátima\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1757, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1760, 'Santa Rosalía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1761, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1763, 'Santo Niño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1765, 'La Borrega\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1768, 'El Socio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1776, 'La Tortolita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1780, 'Los Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1782, 'Los Tucanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1783, 'Julio Geovani Cohuó Paredes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1789, 'María Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1795, 'Wesby\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1806, 'San Enrique\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1820, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1821, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1834, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1836, 'Altamira\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1840, 'Ángeles Unidos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1847, 'Efraín Regalado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1848, 'Cayetano Wenceslao Quimé Cohuo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1852, 'Gavilán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1853, 'María Bonita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1855, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1856, 'El Oasis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1859, 'Melchor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1861, 'El Centenario I\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1865, 'Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1870, 'Joaquín Macías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1873, 'Juan Sarabia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1875, 'El Mirador [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1877, 'Gerardo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1878, 'Los Lirios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1884, 'El Mulato\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1890, 'Las Pulgas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1891, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1892, 'Rancho Escondido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1895, 'Manuel Vega Herrera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1900, 'Rancho Escondido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1906, 'Unión de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1907, 'Pericos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1908, 'La Victoria [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1909, 'Los Amigos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1910, 'El Potrillo [Centro de Acopio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1911, 'El Cielo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1912, 'Los Pocitos (Alfonso IX Peralta)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1913, 'Mecanizado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1914, 'San Gerónimo (Gregorio de la Rosa)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1915, 'Sulivan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1916, 'Villas Bugambilias II (Chintok)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1917, 'Clemente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1919, 'Alberto Zavala\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1922, 'Unión [Club Deportivo]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1930, 'Bernarda Montalvo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1931, 'Los Martínez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1936, 'Ninguno [Caseta Fitozoosanitaria]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1942, 'El Ciruelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1945, 'Constancio Collí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1946, 'El Corozo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1948, 'El Coyol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1949, 'Las Cruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1951, 'El Ángel [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1953, 'El Barón [Deshuesadero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1954, 'Pedregales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1955, 'ECOSUR\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1961, 'San Ramón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1963, 'El Cedral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1972, 'Las Gaviotas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1973, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1974, 'Guadalupe Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1975, 'San Manuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1979, 'El Huiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1987, 'Las Palomas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1992, 'El Manino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 1998, 'San Rafael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2004, 'Buena Vista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2005, 'Carlos López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2006, 'Villa de Leyva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2008, 'Golden Suites [Auto Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2013, 'Jorge Mercader\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2015, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2016, 'José Jesús\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2018, 'José Rafael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2021, 'Las Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2022, 'Julio Caballero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2023, 'La Karlita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2024, 'Ramón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2027, 'Chilapa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2028, 'Rancho Libia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2029, 'El Pihitayo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2033, 'El Manantial\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2039, 'María Luisa Durán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2041, 'Roberto Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2044, 'Mario Villanueva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2050, 'El Milagro del Siglo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2051, 'La Roca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2054, 'Los Nietos (Kilómetro Dieciséis)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2056, 'Oscar Lagos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2057, 'Oxtankah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2058, 'San Clemente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2060, 'El Paraíso Chico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2066, 'El Pedregal (Kilómetro Cinco)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2067, 'Perfecto Hoil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2068, 'El Productor R\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2070, 'Las Pulgas Módulo Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2071, 'El Puma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2080, 'Ninguno [Relleno Sanitario]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2081, 'El Negro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2084, 'La Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2086, 'El Búfalo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2088, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2089, 'San Bernabé\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2091, 'San Isidro Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2093, 'San José de la Torre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2094, 'San Rafael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2098, 'Santa Rosalía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2100, 'Mr. Marlín  [Restaurante]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2101, 'Sergio Vargas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2107, 'The Explorean Kohunlich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2109, 'Los Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2111, 'Unidad Veintisiete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2112, 'Valerio Chuayo Villamil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2114, 'Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2119, 'Administración Portuaria Integral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2120, 'Mahahual [Aeropuerto]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2121, 'Luna Floja (Alfonso Kayler)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2123, 'Las Anonas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2125, 'Atenea\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2132, 'Aventura Mahahual\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2135, 'Juan Mendoza Carvajal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2137, 'Chac-Chí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2138, 'Chaparral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2146, 'Explorean Costa Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2147, 'Félix Altamirano López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2153, 'Guamúchil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2155, 'Hermanos R\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2161, 'Chac Mool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2163, 'Kon Hun Beach\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2164, 'Rodolfo Rosas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2165, 'Rancho Viviana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2176, 'Ninguno [Unidad de Servicios]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2183, 'Cañón de Montaña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2185, 'Ninguno [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2186, 'Los Caballos Aventureros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2188, 'El Jordán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2189, 'El Diamante\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07');
INSERT INTO `ciudades` (`idEstado`, `idMunicipio`, `idCiudad`, `ciudad`, `created_at`, `modified_at`) VALUES
(23, 4, 2191, 'Xavier Gamboa Villafranca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2193, 'Rancho Israel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2194, 'Kabah-Na\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2195, 'Kohunlich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2196, 'El Jahuatal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2198, 'El Makulí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2199, 'Manuel Domínguez Góngora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2200, 'Manuel Palma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2201, 'Martín Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2203, 'Maya Palms Resort\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2207, 'El Mostrenco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2210, 'PIM\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2211, 'BA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2212, 'Paytocal (Kilómetro Once)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2215, 'Poca Cosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2217, 'Primero de Mayo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2219, 'Casa Lorimar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2223, 'Los Mangos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2224, 'Rancho Alegre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2228, 'Roberto Salgado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2230, 'El Esplendor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2231, 'El Porvenir\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2232, 'Rufino Méndez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2239, 'Sin Duda Villas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2240, 'Costa Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2242, 'Las Bugambilias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2243, 'Playa Uvero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2244, 'El Tesoro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2245, 'Tierra Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2247, 'El Tucán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2248, 'Las Uvas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2252, 'La Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2253, 'Villa de Leyva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2254, 'Milton Ruíz Vázquez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2257, 'Galeras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2259, 'La Ceiba (Wilfrido Mendoza)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2261, 'Loma Seca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2271, 'Primer Cementerio de Chetumal [Servicio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2273, 'Tania Gabriela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2275, 'Arsenio Padrón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2277, 'Las Maravillas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2285, 'Natividad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2286, 'Eduardo Ovando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2291, 'La Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2294, 'Casa de los Sueños\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2296, 'La Huerta de Alcalá\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2305, 'Solo Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2310, 'Juan Hernández Rosales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2312, 'Rancho Escondido Hermanos Magaña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2313, 'Jung Matthee\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2317, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2323, 'Nicolás Bravo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2327, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2329, 'PCM\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2330, 'Ramón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2340, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2346, 'Mateo Martín Martínez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2347, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2348, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2349, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2350, 'Félix García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2352, 'Nuevo Jesús\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2356, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2358, 'El Salto del Tigre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2359, 'Los Mangos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2361, 'Rancho Adulam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2362, 'Los Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2363, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2366, 'La Microonda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2368, 'El Mameyal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2369, 'Los Cascabeles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2370, 'El Sacrificio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2373, 'La Unión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2375, 'Venecia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2381, 'Balam Kú\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2385, 'Casa del Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2386, 'La Concepción\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2388, 'Serenity\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2390, 'Ernesto Aguilar Tec\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2391, 'El Abuelo Félix\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2393, 'Mahahual [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2395, 'Granja Acuícola del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2397, 'Las Hermanas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2399, 'El Jardín de Palmira\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2400, 'Melissa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2401, 'Kimmels\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2402, 'El Capricho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2403, 'Maya Chan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2406, 'Los Tres Amigos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2416, 'MACROVI\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2417, 'Casa de Paloma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2419, 'Matehual\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2421, 'Casa Tranquila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2423, 'Montealbán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2424, 'El Oasis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2426, 'La Palapa Campestre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2428, 'El Placer\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2429, 'El Moracue\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2430, 'Rancho Escorpión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2436, 'El Rincón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2440, 'Ninguno [Servicio Internacional de Tratamiento Cuarentenario]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2441, 'CFE [Subestación]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2442, 'Travel Inn\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2446, 'Wilberth Smith\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2450, 'Bougain Villa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2452, 'Margarita del Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2453, 'Maya Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2454, 'Playa Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2455, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2456, 'El Cerro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2457, 'El Jobo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2460, 'El Bronco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2461, 'El Melón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2463, 'El Prieto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2464, 'Albin Casa del Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2465, 'Casas de Xac Zil Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2466, 'Las Chachalacas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2467, 'Casa Escondida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2468, 'Casa Caracola\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2470, 'El Oasis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2481, 'Rogelio Bello Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2482, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2483, 'Maya Pax\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2486, 'Rancho Gabriela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2487, 'Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2489, 'Los Compayitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2491, 'La Casa Playa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2493, 'La Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2494, 'Los Tres Castillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2495, 'Los Camilos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2497, 'El Arco Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2498, 'Chumbec\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2502, 'El Esfuerzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2503, 'Shaloon [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2504, 'Los Dos Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2505, 'Dos Pozos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2506, 'Emiliano Zapata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2507, 'Francisco Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2508, 'El Gaucho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2510, 'Rancho Guzmán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2515, 'Jaime Peraza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2516, 'Jorge Caamal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2517, 'Carlos Soberanis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2521, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2525, 'Alborada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2526, 'La Candelaria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2527, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2529, 'La Perla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2530, 'El Potrillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2531, 'La Primavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2532, 'Progreso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2535, 'El Zuubim\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2536, 'La Virgen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2537, 'Aurelio Uh Xool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2539, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2540, 'Sac-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2541, 'Nicolás Bravo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2544, 'Armando Poot\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2545, 'Panto-Ha [Balneario]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2548, 'Nuevos Inicios [Campamento]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2549, 'Akal-Ki [Centro Holístico]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2550, 'Chacbel-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2552, 'Matías Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2554, 'El Marino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2557, 'Tomza [Gasera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2558, 'Los Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2559, 'Las Glorias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2560, 'Grúas Jaswor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2562, 'Jesús Ceja López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2563, 'José López Zambrano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2564, 'Laguna Bonanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2565, 'Don Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2566, 'Dany\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2568, 'Los Aluxes Mayas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2569, 'Don Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2571, 'La Quinta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2572, 'Marcos Moreno López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2574, 'María Aída Guillen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2578, 'Las Peñas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2579, 'Polo Medina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2580, 'La Potranquita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2581, 'Rancho Chabela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2582, 'La Pimienta (David)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2584, 'Num Ka\'an [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2585, 'Rancho Paquita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2586, 'Rancho Wayac\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2587, 'Raymundo May Azcorra [Chilango]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2588, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2589, 'Don Marcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2590, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2591, 'Santa Martha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2592, 'La Cruz Sangrienta Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2593, 'El Tata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2594, 'Tuxpeño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2596, 'Los Abuelos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2597, 'Acapulquito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2598, 'Agua Clara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2602, 'Alma Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2609, 'La Bendición\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2610, 'Benito Juárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2611, 'Beto Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2612, 'Bills Place\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2613, 'Billy Green\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2615, 'Las Bugambilias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2616, 'Villa Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2618, 'Casa Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2619, 'Casa Colibrí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2620, 'Casa Dolphin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2621, 'La Luz Azul del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2622, 'Casa Milagro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2623, 'Casa Nico Linda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2624, 'Villa Costa Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2626, 'Santa Julia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2628, 'Central Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2631, 'Chícharo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2632, 'Los Cinco Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2633, 'Ciricote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2635, 'El Cocal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2637, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2638, 'El Cocoyol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2639, 'Colonia Electricista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2640, 'El Compadre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2641, 'Los Coquitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2643, 'Las Palmas [Quinta]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2647, 'David Mosqueda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2649, 'La Distancia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2653, 'Eben Ezer\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2659, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2660, 'Emmanuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2661, 'Evaristo García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2662, 'Ex-Aserradero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2663, 'Doña Carmen [Finca]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2664, 'El Palomo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2666, 'La Joya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2667, 'Gilberto Pérez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2670, 'Los González\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2671, 'Gualas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2672, 'La Güera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2673, 'Hacienda Bahía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2674, 'Sarampión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2676, 'Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2679, 'Honorio González\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2683, 'Isidro Navarrete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2684, 'Iván\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2685, 'Los Jardines\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2688, 'José Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2690, 'Juan Diego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2691, 'Mi Viejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2693, 'Langosteros del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2694, 'Lanschu\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2712, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2713, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2714, 'Carlos Sosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2716, 'Carlos Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2717, 'Rubén Díaz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2718, 'San Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2721, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2723, 'Manuel González\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2724, 'Alejandra Yeladaqui Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2726, 'El Príncipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2728, 'Las Piedras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2734, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2735, 'La Bonita (Jesús Escalante)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2736, 'Francisco López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2739, 'La Bendición\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2741, 'Lorenzo Furio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2742, 'La Lulita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2745, 'Los Mangos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2747, 'Manuel Interian\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2749, 'Maple Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2750, 'Mar Cambio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2751, 'Mario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2752, 'Marlboro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2753, 'Los Medina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2755, 'Mi Parcelita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2756, 'Las Mil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2757, 'El Milagro de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2758, 'Mío Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2759, 'El Mirador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2760, 'Los Tamarindos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2764, 'El Moorah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2766, 'La Natividad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2767, 'Nido de Águila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2768, 'Nueva Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2771, 'Pablo Moreno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2772, 'Arges Mayan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2775, 'La Pantera Brava\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2776, 'El Pensamiento\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2778, 'Las Piedras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2779, 'La Higuera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2780, 'Los Pinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2781, 'Pista Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2782, 'Ninguno [Policía Municipal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2783, 'El Poquitito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2784, 'El Potrillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2785, 'Los Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2789, 'Rancho Agropecuario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2790, 'Rancho Aromas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2791, 'Rancho Arrayanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2792, 'Rancho Chobis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2793, 'Rancho Cholo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2796, 'Rancho Milagros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2797, 'Don Mayito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2798, 'Rancho Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2799, 'Rancho Tranquilo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2800, 'Recicladora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2806, 'Rosa Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2807, 'La Rosita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2808, 'Samaritana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2810, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2811, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2816, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2819, 'San Judas Tadeo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2820, 'San Lázaro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2828, 'Santa Sofía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2829, 'Los Sauces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2836, 'Los Piojos del Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2837, 'Las Tres Cruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2838, 'Los Tres Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2839, 'Los Tres Valles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2840, 'El Triunfo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2841, 'El Tucán de Sacxán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2842, 'Ya\'axché Nah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2843, 'El Turix\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2844, 'La Vaca Pinta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2845, 'Veinticuatro de Julio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2846, 'Vermen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2847, 'Villa Águila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2848, 'Villa Alejandra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2849, 'Villa Cariño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2850, 'La Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2851, 'Villa Ixchel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2852, 'Villa Tamar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2853, 'Tumben Kin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2854, 'Adelita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2855, 'Xmakil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2856, 'Yaax-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2857, 'El Yanet\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2859, 'El Zapote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2861, 'El Zaspa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2862, 'Elizalde\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2863, 'El Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2864, 'Fraternidad Antorchista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2865, 'Mártires Antorchistas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2866, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2867, 'Alcaldía Mahahual [Kilómetro Cincuenta y Cuatro]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2868, 'Alfredo López Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2869, 'Alma Plena [Restaurante]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2871, 'Baby Quintal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2872, 'Belhá [Vivero Forestal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2873, 'Bonifacio Alejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2874, 'CAPA [Cárcamo Mahahual]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2875, 'CAPA [Planta Purificadora de Agua Potable]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2876, 'Capitán Carlos Tellos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2877, 'Casa Amarilla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2878, 'Casa Bella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2879, 'Casa Azúcar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2880, 'Casa Bruce y Eva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2881, 'Casa de Cocos [Kilómetro Quince]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2882, 'Casas Chinchorro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2883, 'Ciro Marín López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2884, 'Cochi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2885, 'David Randal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2886, 'Don Porfirio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2887, 'Mahawai\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2889, 'El Barril [Minisuper]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2890, 'Cheyene\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2891, 'Casadía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2892, 'El Diluvio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2893, 'El Gallo Giro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2894, 'El Manantial\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2895, 'El Mirador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2896, 'El Pinito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2897, 'Flor del Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2898, 'Gabina Aguilar Acevedo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2899, 'Grúas de Quintana Roo [Corralón]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2900, 'IPAE\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2902, 'Jerry y Jan Parint\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2903, 'Jorge Polanco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2904, 'José Escudero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2905, 'José Rojas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2906, 'Juan Manuel Barrera Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2907, 'Kaanjá\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2908, 'Kayal Hermanos Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2909, 'Koo Kun\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2910, 'La Cabaña de Papá Moso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2911, 'La Condesa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2912, 'La Despeinada de Jaba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2914, 'La Luz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2915, 'La Media Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2916, 'La Nena Godoy [Cabañas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2917, 'La Roca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2918, 'La Tía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2919, 'Las Artistas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2920, 'Las Camelinas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2921, 'Las Isabeles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2922, 'Las Manzanitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2923, 'Leticia Romero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2924, 'Loma de Lobo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2925, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2926, 'Los Cuates\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2927, 'Los Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2928, 'Jorge Enrique Mercader Rodríguez [Quebradora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2929, 'Playa Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2930, 'Mario Rivero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2931, 'Market Express\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2932, 'Maya Kaan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2933, 'Mayaz [Granja]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2934, 'Mi Ranchito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2936, 'Milagros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2937, 'Montaña a la Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2938, 'Monte de los Olivos [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2939, 'Néstor Lagos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2940, 'Benjamín Gutiérrez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2941, 'Trella González\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2942, 'La Casa de la Gaviota\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2943, 'Caritas Cabañas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2944, 'Luna Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2945, 'La Lussiernaga\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2947, 'Gastón Alegre López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2950, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2956, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2957, 'Ninguno [Campo de Tiro]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2958, 'Santa Elena [Ejido]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2959, 'Oaxaco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2960, 'Okey [Minisuper]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2962, 'Pinolillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2963, 'Playa Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2964, 'Puerta del Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2966, 'Punta Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2967, 'Alejandra [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2968, 'Dragonfly\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2969, 'Rancho JA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2970, 'Rancho Kanik\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2971, 'Rancho Paola\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2972, 'Potenciano [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2973, 'Rancho Vitache\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2974, 'Recicla Centro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2975, 'Refugio (El Dos)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2976, 'Régulo González\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2977, 'Rodolfo Valle Villaseñor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2978, 'Divina Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2979, 'San Arturo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2980, 'San Caralampio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2981, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2984, 'San Miguel Arcángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2985, 'San Rafael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2986, 'San Virgilio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2987, 'Santa Isabel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2988, 'Santa Patricia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2989, 'Sapito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2990, 'Silver Star (Richard Hselen)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2991, 'Kilómetro Seis Punto Cinco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2992, 'Tino Zamora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2993, 'Villa Bethel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2994, 'Villa Lolita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2995, 'Villa Sonrisa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2997, 'Tzotzil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2998, 'Ayar [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 2999, 'Buena Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3001, 'Casita Verde\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3002, 'Chilam Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3003, 'Crucero de Caobas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3004, 'El Amate\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3005, 'El Cocal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3008, 'El Progreso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3009, 'El Rojo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3011, 'Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3012, 'Giltesules\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3013, 'Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3014, 'Hermanos Aguilar [Kilómetro Quince]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3015, 'Juan López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3016, 'La Aguadana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3017, 'La Lagunita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3020, 'Las Palmas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3021, 'Las Tres Cruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3022, 'Los Coquitos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3024, 'Los Reyes [Minisúper]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3029, 'Francisco Arpaiz Landeros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3030, 'Los Tres Antonios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3031, 'Antonio Canul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3032, 'La Anita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3033, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3037, 'El Pavo Real\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3038, 'Gerardo España\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3039, 'La Ranita Feliz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3040, 'Nuevo Zacualpan [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3041, 'Procitrus S.A. de C.V.\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3043, 'Rancho Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3044, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3045, 'San Lucas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3046, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3048, 'Santa Isabel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3050, 'Santiago Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3051, 'Villa Anilú (San Benito)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3052, 'Ya\'ab Kuxtal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3053, 'Benjamín Canché Gil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3054, 'Bonanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3055, 'Cándido Sansores Gamboa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3056, 'Guevara [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3057, 'Eduardo Madera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3058, 'La Puerta del Cielo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3059, 'El Fénix\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3060, 'El Lirio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3062, 'Imperio Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3063, 'Isaías León\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3064, 'Isla Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3065, 'Kilómetro Seis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3066, 'La Doña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3067, 'La Grulla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3068, 'La Magnífica Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3069, 'La Playita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3070, 'La Rosita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3071, 'La Sabana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3072, 'La Sarteneja\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3073, 'Leonardo Xool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3075, 'Punta Juanita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3076, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3077, 'Villa Almita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3078, 'Vicente de Jesús Díaz Calderón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3079, 'Villa Marili\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3080, 'Santa Cruz [Finca]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3081, 'Don Vicente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3082, 'Juan Borges\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3083, 'Ladislao Sboroda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3084, 'Los Rápidos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3085, 'Los Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3086, 'Pedro García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3087, 'San Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3088, 'San Salomón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3089, 'Agustín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3090, 'Antonia Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3091, 'El Paraíso (Kilómetro 245.5)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3092, 'El Regalo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3093, 'El Tío\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3094, 'Ernesto Aros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3095, 'Evencio Hernández Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3096, 'Karenef\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3097, 'La Lomita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3098, 'Las Siete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3099, 'Manuel (El Pastor)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3100, 'Marcos Hamilton\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3101, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3102, 'Hermanos Flores Magón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3103, 'Hermanos Pérez Rodríguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3104, 'Atlantis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3105, 'Doña Fina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3106, 'La Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3107, 'María Elena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3108, 'Playa Sirena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3109, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3110, 'Yax-Ché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3111, 'Don Marcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3112, 'El Petén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3113, 'Fernando Teodosio Camin Cardín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3114, 'Gabriel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3115, 'Hernán Várguez Collí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3116, 'Jesús Ramos Domínguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3117, 'Juan Lerdo Olaya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3118, 'Juventina Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3119, 'La Divina Providencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3120, 'La Fortaleza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3121, 'La Fortuna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3122, 'La Presumida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3123, 'La Rinconada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3124, 'Mayfran\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3125, 'Orlando Alba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3126, 'Rio Hondo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3127, 'Sagrado Corazón de Jesús\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3128, 'Samuel Pérez Borges\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3129, 'Samurio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3130, 'UAIM [Unidad Agrícola Industrial de la Mujer]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3131, 'Vicente Suterdan Navarrete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3132, 'Corrales Rayza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3133, 'Felipe García Rosario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3134, 'Jujutla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3135, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3136, 'Los Carmona\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3137, 'Caña Brava\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3138, 'El Cerrito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3139, 'El Chalauite\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3140, 'El Pañuelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3141, 'El Triunfo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3142, 'Javier Bertelis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3143, 'La Envidia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3144, 'Manuel Salazar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3145, 'Medina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3146, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3147, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3148, 'Tres Garantías [Ecoparque]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3149, 'San Salvador (Mariposario)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3150, 'El Missy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3151, 'Willian Cornejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3152, 'Cabañas del Chital\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3153, 'El Corralito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3154, 'El Moreno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3155, 'Amelia Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3156, 'Finca Orión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3157, 'Villa Ponto (Kilómetro 6.5)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3158, 'El Papayal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3159, 'Pueblo Antiguo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3160, 'De los Santos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3161, 'El Paraíso Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3162, 'El Anturio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3163, 'Finca la Chaparrita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3164, 'Iguanas Ranas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3165, 'Julio César Castillo Quintal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3166, 'Juan Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3167, 'Kimbal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3168, 'La Herencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3169, 'Las Dos Hermanas K\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3170, 'Lol-Kin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3171, 'Los Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3172, 'La Casa Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3173, 'Marino Castro Castro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3174, 'Pez de Oro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3175, 'Paraíso Xul-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3176, 'Xcalak [Purificadora de Agua]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3177, 'La Casa del Capitán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3178, 'Playa Vanesa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3179, 'Noge Mex\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3180, 'El Progreso II\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3181, 'Toledo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3182, 'Aldrete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3183, 'Cocodrilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3184, 'El Hueso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3185, 'El Mirador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3186, 'El Mirador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3187, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3188, 'Felipe Chazarías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3189, 'Jilotepec\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3190, 'Juan Alvarado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3191, 'La Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3192, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3193, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3194, 'Los Dos Socios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3195, 'María Renteral Campos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07');
INSERT INTO `ciudades` (`idEstado`, `idMunicipio`, `idCiudad`, `ciudad`, `created_at`, `modified_at`) VALUES
(23, 4, 3196, 'María Ramírez Velazco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3197, 'Román Jiménez Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3198, 'Rancho Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3199, 'Raymundo Zavala Peña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3200, 'Roberto Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3201, 'Timoteo Rodríguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3202, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3203, 'Bakhalar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3204, 'Cuatro Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3205, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3206, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3207, 'El Viejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3208, 'La Coneja\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3209, 'Las Dos Estrellas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3210, 'El Gallito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3211, 'Basurero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3212, 'Villas Bugambilias Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3213, 'Óscar [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3214, 'El Olivo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3215, 'Los Primos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3216, 'Ruben Montejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3217, 'San Andrés de los Xoles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3218, 'Los Sansores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3219, 'Yohaltun\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3220, 'Divino Niño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3221, 'Los Linares\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3222, 'La Morita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3223, 'El Dorado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3224, 'El Jazmín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3225, 'Juan Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3226, 'Don Noe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3227, 'El Millón [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3228, 'Costa Maya [Cabañas Ecoturísticas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3229, 'El Trébol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3230, 'Santa Julia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3231, 'Casa Macabi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3232, 'San Esteban\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3233, 'Juan Guerrero [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3234, 'El Trébol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3235, 'Los Cocos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3236, 'Villas el Inolvidable\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3237, 'La Canoa [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3238, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3239, 'Santa Clara [Parcela]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3240, 'Jesús Ramos Domínguez [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3241, 'San Judas Tadeo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3242, 'Eloy Campos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3243, 'El Bosque de los Girasoles [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3244, 'Cachimbas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3245, 'El Progreso [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3246, 'Isidro Cruz [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3247, 'Dimas Amezcua Navarro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3248, 'La Guadalupana [Kilómetro Tres]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3249, 'Los Alacranes [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3250, 'Ha-Way\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3251, 'La Muralla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3252, 'Shaddai [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3253, 'El Mezquite [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3254, 'El Pósito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3255, 'Sy Creo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3256, 'San Israel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3257, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3258, 'Los Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3259, 'Alovera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3260, 'El Triunfo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3261, 'La Pimienta [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3262, 'El Nance\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3263, 'Nueva Vida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3264, 'Rigoberto Célis Rico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3265, 'María de Jesús Mercado Placencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3266, 'Las Gaviotas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3267, 'XM\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3268, 'Álvaro Marín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3269, 'Gadiel [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3270, 'Antonio Tuz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3271, 'Los Ángeles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3272, 'Garduza [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3273, 'Rancho Díaz II\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3274, 'Elisa [Quinta]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3275, 'La Parkaa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3276, 'La Candelaria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3277, 'El Viejón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3278, 'Shekinah la Gloria de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3279, 'Santa Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3280, 'El Triunfo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3281, 'El Gavilancillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3282, 'Gutiérrez [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3283, 'La Cheymi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 4, 3284, 'Los Monos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1, 'Cancún\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 2, 'Alfredo V. Bonfil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 7, 'Aeropuerto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 16, 'Candelaria (Santa Julia)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 22, 'Embotelladora del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 25, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 73, 'Nava\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 91, 'CONAGUA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 100, 'El Círculo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 104, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 124, 'Los Pinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 126, 'La Ilusión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 129, 'Los Íñigo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 135, 'Sensaciones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 141, 'Los Naranjos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 158, 'Alicia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 160, 'Chantaman\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 162, 'Rodmen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 163, 'La Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 167, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 171, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 173, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 184, 'Los Vargas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 187, 'Villas de Cancún\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 193, 'El Tiro Fijo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 195, 'Sens [Motel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 196, 'Chilly Willys\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 201, 'Kilómetro Trescientos Tres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 202, 'Las Arboledas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 207, 'Huertos del Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 210, 'Gabilei\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 211, 'El Colís\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 229, 'San José (La Gota de Oro)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 232, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 233, 'Cárcamo Siete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 234, 'Los Dos Hermanos J. y J.\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 236, 'Las Pollitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 237, 'Bosques del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 243, 'Avance Agroindustrial\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 244, 'La Teresita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 245, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 261, 'Benito Juárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 269, 'Cárcamo Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 270, 'Captación Tres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 291, 'Villas de Mora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 305, 'El Orgullo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 316, 'Xoximilco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 317, 'Los Amigos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 318, 'Deymi Marrufo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 330, 'Planta Aeropuerto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 336, 'Pak-Luum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 351, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 353, 'Montalayos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 354, 'El Jabalí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 357, 'El Ana Bárbara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 361, 'Cárcamo Seis (Captación Cuatro)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 376, 'Los Girasoles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 403, 'Río Nizuc\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 405, 'Figueroa [Grúas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 440, 'Divino Redentor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 441, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 472, 'Los Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 476, 'Cárcamo Diez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 477, 'Cárcamo Ocho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 482, 'Álamo [Rentadora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 484, 'Central de Abasto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 492, 'Emiliano Zapata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 502, 'Grupo Zeta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 503, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 509, 'Hermanos Martínez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 513, 'Agregados y Maquinaria del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 517, 'Cancún [Trituradora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 518, 'Jorge Millet\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 520, 'Ricardo Fernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 521, 'Víctor Jiménez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 522, 'El Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 523, 'Construfoam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 531, 'Lagos del Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 535, 'La Virtud\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 540, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 550, 'César\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 552, 'Rincón del Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 565, 'Rancho Alegre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 582, 'El Sauce y la Palma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 587, 'Doble C\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 589, 'Mituchu\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 619, 'Rancho del Carmen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 626, 'Los Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 628, 'Anabel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 646, 'Bepensa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 648, 'José Enrique Manrique\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 655, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 656, 'Santa Ana (Kilómetro Doce)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 658, 'Las Calandrias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 679, 'El Venado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 684, 'Un Nuevo Horizonte\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 705, 'Rancho Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 718, 'La Carmelita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 723, 'Los Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 727, 'El Faisán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 729, 'El Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 730, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 767, 'Don Armando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 770, 'Moon Palace [Centro de Distribución]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 775, 'Gabilei [Minisuper]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 780, 'La Primavera [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 784, 'Campestre Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 786, 'El Carajito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 787, 'Cárcamo Nueve\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 788, 'La Consentida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 811, 'Dieselera de Cancún\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 821, 'Las Palmas [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 828, 'Las Arboledas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 830, 'Edgar [Carpintería]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 839, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 857, 'Xamankán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 864, 'La Finca [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 880, 'Gulf [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 889, 'Tumben Sastal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 922, 'Soluciones Walnut\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 924, 'El Cordobés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 927, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 929, 'Moon Palace\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 936, 'El Palmar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 938, 'Paraíso de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 942, 'Corales [Planta de Tratamiento]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 948, 'Palo Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 951, 'Person Enrejón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 952, 'Eben Ezer\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 953, 'Quinta los Ranos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 969, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 972, 'San Silvestre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 976, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 992, 'Ninguno [Universidad la Salle Cancún]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 993, 'Ninguno [Universidad Tecnológica de Cancún]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1000, 'Ventura Park\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1091, 'Primavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1092, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1099, 'Marcos Ayala\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1102, 'Pasión y Perjuicio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1107, 'Raúl Gómez Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1118, 'Rancho Campana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1120, 'El Tiempo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1121, 'Don Nacho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1123, 'Las Luisitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1127, 'El Duende Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1140, 'Colonia Chiapaneca Siglo XXI\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1144, 'El Gallo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1156, 'El Porvenir\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1176, 'María Estrella del Mar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1183, 'Santa Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1184, 'Ninguno [Universidad Anáhuac]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1201, 'CEMEX [Concretos]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1261, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1269, 'Agustín Figueroa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1274, 'Calisureño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1275, 'Marisol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1290, 'La Gallega\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1294, 'La Ilusión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1303, 'Kilómetro Doscientos Noventa y Nueve\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1309, 'Don Pepe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1314, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1324, 'El Niño de Atocha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1328, 'El Pentatlán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1330, 'La Primavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1343, 'Santa Inés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1345, 'Stone Wall\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1347, 'Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1348, 'Tres Ases\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1352, 'El Andariego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1365, 'El Puma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1373, 'Tekax\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1385, 'Manuel Mendoza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1388, 'Nuevo Amanecer\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1389, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1393, 'Pura Cepa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1394, 'Rancho Marimar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1396, 'Regina Kilómetro Doscientos Noventa y Ocho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1401, 'Tres García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1409, 'Atlantes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1415, 'Cancún Country Club\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1426, 'Flecha Roja\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1434, 'Las Jamaicas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1440, 'Los Laureles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1444, 'Don Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1446, 'Primitivo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1461, 'Ricardo Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1473, 'Maranatha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1478, 'Nueva Jerusalén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1482, 'Península Resort\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1483, 'Las Piedritas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1491, 'Rancho JR\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1494, 'Los Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1503, 'Tres Marías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1504, 'Los Tulipanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1506, 'Unión de Agricultores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1513, 'SMEC [Planta de Composta]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1518, 'Carlos García [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1521, 'Del Parque\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1522, 'Delta Gas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1523, 'Sac-Nicté\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1525, 'Doña Lucha [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1526, 'ECOSUR\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1528, 'El Borrego [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1530, 'El Chofer [Cervefrío]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1531, 'El Cimarrón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1532, 'El Cortijo de la Española [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1533, 'El Encadenado [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1534, 'El Maguey [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1535, 'El Porvenir [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1536, 'El Turillo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1538, 'ESISA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1539, 'Mármol y Granito [Fábrica]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1540, 'Materiales Básicos [Fábrica]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1541, 'Gregorio Pech [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1542, 'Abimeri [Grúas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1544, 'Isaías Varela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1546, 'José Luis Alanís [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1547, 'Juan Espinoza [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1548, 'La Conchita [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1549, 'La Guadalupana [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1550, 'La Herencia [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1551, 'La Quinta Flor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1555, 'María Lourdes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1556, 'Los Lirios [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1560, 'María Cristina Vellador [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1567, 'Bertín Carmona [Chatarrería]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1574, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1577, 'David [Banco de Tierra]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1582, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1584, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1590, 'San Antonio de Abad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1591, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1592, 'Abimerhi [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1593, 'Operadora Marfuza [Planta de Tratamiento]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1594, 'Palma Real\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1595, 'Ipark\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1596, 'Parque Logístico Quintana Roo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1597, 'Las Jícaras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1598, 'Premasa del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1599, 'Quinta del Nazareno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1601, 'Aurorita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1602, 'Cesario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1603, 'Chelina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1604, 'Crispín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1605, 'Guelataos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1609, 'Toledo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1610, 'Ninguno [Recicladora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1611, 'Ninguno [Registro Municipal de Vehículos]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1612, 'San Jorge [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1614, 'Santa Anna [Parque Industrial]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1617, 'Éxito Familiar [Templo]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1618, 'Trituradora y Agregados\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1619, 'Ninguno [Universidad para la Competencia Internacional México]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1620, 'Vicente Espinoza [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1621, 'Víctor Trujillo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1633, 'Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1634, 'Benito Estrada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1643, 'Cubilete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1644, 'Dominga Gijón Vázquez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1645, 'Don Julián\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1656, 'El Jabalí Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1658, 'El Palomar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1661, 'Raúl Lara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1664, 'Ethos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1666, 'Familia Rodríguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1667, 'Fernando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1680, 'Kinil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1681, 'La Aurora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1682, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1691, 'La Pulga\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1696, 'Las Cabañas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1698, 'Las Gemelas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1699, 'Las Margaritas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1706, 'Los Apaches\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1707, 'Los Camachos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1708, 'Los Caracoles [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1709, 'Los Cascos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1710, 'Los Cuates\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1711, 'Los Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1712, 'Magdaleno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1714, 'Los Monchitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1721, 'Marisol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1723, 'Mejía Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1728, 'Nicolás Anaya Ruiz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1731, 'Divino Niño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1740, 'Jady\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1741, 'La Ramona\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1742, 'Flor del Mayab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1744, 'Los Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1774, 'Pablo García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1790, 'Rosa de Lima\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1791, 'Sac-Nicte\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1804, 'Bugambilias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1805, 'Tres Marías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1816, 'Hacienda Margarita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1817, 'Block México [Bloquera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1818, 'Carlos León\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1819, 'Doctor Domínguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1820, 'Don Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1821, 'Don Sebastián\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1822, 'El Roble\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1823, 'Enedina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1824, 'Grupo Rivera [Corralón]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1825, 'Los García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1826, 'Los Lirios [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1827, 'Los Tulipanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1828, 'Rancho Primavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1829, 'Adolfo Valencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1830, 'Adi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1831, 'Casa del Bosque\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1832, 'Daniel Cocom\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1833, 'Don Emilio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1834, 'Don Julio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1835, 'El Amate\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1836, 'Flor Cocom\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1837, 'Isidro Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1838, 'Jesús Escobar López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1839, 'Las Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1840, 'Mi Ranchito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1841, 'Mi Ranchito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1842, 'Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1843, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 5, 1844, 'Vivero de Tilapias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 1, 'Adolfo de la Huerta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 2, 'Chanbarbachano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 3, 'Adolfo López Mateos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 4, 'La Carolina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 10, 'Benito Juárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 14, 'Bulukax\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 15, 'Cafetal Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 16, 'Cafetalito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 18, 'Candelaria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 23, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 24, 'La Ceibita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 26, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 27, 'Othón P. Blanco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 33, 'Javier Rojo Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 35, 'Sabán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 36, 'Sabana San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 38, 'Saczuquil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 39, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 40, 'San Diego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 42, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 48, 'Dos Aguadas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 51, 'Dziuché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 57, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 61, 'Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 62, 'Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 67, 'Huay Max\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 69, 'José María Morelos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 70, 'X-Querol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 71, 'Zafarrancho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 76, 'Kantemó\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 90, 'Lázaro Cárdenas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 96, 'José y María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 99, 'Mariano Matamoros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 100, 'El Martirio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 117, 'Pedro Moreno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 121, 'Piedras Negras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 130, 'Pozo Pirata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 133, 'La Presumida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 135, 'Puerto Arturo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 141, 'Nueva Reforma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 146, 'Sacalaca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 153, 'San Antonio Tuk\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 167, 'San Felipe Primero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 168, 'San Felipe Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 170, 'San Felipe Oriente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 185, 'San José de la Montaña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 195, 'Nuevo San Marcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 217, 'Santa Gertrudis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 235, 'Santo Domingo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 241, 'Tabasco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 246, 'El Tarro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 272, 'X-Cabil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 278, 'Kancabchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 287, 'Insurgentes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 296, 'Plan de la Noria Poniente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 300, 'Rancho Viejo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 308, 'San Isidro Poniente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 330, 'El Triunfo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 331, 'Venustiano Carranza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 336, 'Colmenitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 338, 'Chanchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 343, 'La Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 347, 'Juárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 348, 'El Pitallo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 350, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 351, 'La Coqueta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 353, 'La Gloria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 356, 'X-Peten Hay\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 357, 'La Pimientita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 359, 'Pozo Blanco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 364, 'San Benito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 368, 'San Eustaquio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 378, 'San Juan Oriente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 383, 'San Nicolás\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 384, 'San Nicolás\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 385, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 387, 'San Román\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 389, 'San Roque\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 390, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 393, 'Santa Amalia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 395, 'Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 398, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 399, 'Santa Margarita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 401, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 402, 'Santa Teresita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 412, 'Xnoh Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 413, 'Sazil Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 414, 'Nuevo Plan de la Noria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 422, 'Santa Elena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 425, 'Aguada la Presumida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 428, 'Adriana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 429, 'San Bernardino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 431, 'Santa Margarita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 433, 'San Sebastián\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 440, 'Mina de Oro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 441, 'Nuevo Cunduacán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 442, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 445, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 446, 'La Voluntad de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 448, 'Rancho Vázquez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 451, 'San Juan Cenote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 452, 'Tres Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 455, 'San Nicolás\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 456, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 457, 'San José Ignacio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 458, 'San Nicolás Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 474, 'Camarones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 490, 'San Lorenzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 491, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 493, 'San Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 500, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 506, 'Chan Catzimil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 508, 'Chantuk Águilas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 515, 'El Huanal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 518, 'Kankabchén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 519, 'Los Lagartos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 523, 'Yggdrassil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 526, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 528, 'San Diego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 529, 'San Esteban\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 532, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 537, 'Santa Leonor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 539, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 545, 'San Salvador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 553, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 554, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 560, 'Rancho Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 562, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 565, 'Cecilio Chí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 566, 'Chan Tabasquito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 567, 'La Conchita Primero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 571, 'Garita Aduanal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 572, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 574, 'El Paraíso del Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 575, 'María de Jesús\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 579, 'Kilómetro Sesenta y Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 592, 'Chimay\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 594, 'San Luis Panal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 598, 'San Salvador Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 599, 'La Chaparrita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 600, 'Los Cuatro Pozos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 602, 'Santa Lucía (Los Cabes)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 603, 'Santa Lucía Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 607, 'La Trinidad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 608, 'Villa de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 611, 'Carlos Salinas de Gortari\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 616, 'El Lucero Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 617, 'Nemesio Salazar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 620, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 624, 'Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 625, 'Centro Integrador de Desarrollo Comunitario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 627, 'Casa de los Nares\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 628, 'San Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 630, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 631, 'San Diego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 632, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 636, 'José María Morelos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 639, 'Dos Aguadas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 640, 'Jerónimo Chab Pat\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 642, 'San Leonardo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 645, 'Monte Horeb [Campamento Apostólico]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 646, 'Berlín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 649, 'Los Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 650, 'Chan X-Cunei\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 653, 'Los Compadres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 654, 'X-Cunei\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 656, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 657, 'Su\'ukil Naj\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 658, 'Antonio Sosa Nieto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 659, 'Ninguno [Asociación Ganadera Local]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 660, 'Las Bugambilias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 662, 'Los Cuatitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 663, 'Dziuché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 664, 'Dziuché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 665, 'Dziuché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 666, 'Dziuché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 668, 'Los Girasoles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 669, 'La Aurora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 670, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 672, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 674, 'Matemore\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 675, 'Mis Angelitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 676, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 677, 'El Paraíso Naciente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 678, 'Preciliano Martín Traconis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 680, 'Ninguno [Rastro Municipal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 681, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 682, 'San Cosme\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 686, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 687, 'San Nicolás\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 688, 'El Tesoro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 690, 'Ninguno [Universidad Intercultural Maya de Quintana Roo (UIMQROO)]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 691, 'Arturo Xicum Can\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 692, 'El Crucero [Restaurante]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 693, 'El Paraíso [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 694, 'Esteban Torres Lozada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 695, 'Juan Interián Mejía [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 696, 'La Creación [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 700, 'San Francisco [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 701, 'San Marcelo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 702, 'TEPYOCSA [Centro de Acopio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 703, 'José María Morelos [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 704, 'Tierra de Cristo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 705, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 706, 'Alberto Medina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 707, 'El Pocito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 708, 'Elsa María Landa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 709, 'Jacobo Ciau Pino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 710, 'Juan Parra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 711, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 712, 'Los Laureles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 713, 'Los Tres Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 714, 'Pablo Sosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 715, 'San Cono\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 716, 'San Rubén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 717, 'El Divino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 718, 'El Verdón [Pozo Número Cuatro]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 719, 'El Verdón [Pozo Número Uno]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 720, 'Los Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 721, 'Ocho Venado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 722, 'Crucero Verdon\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 6, 723, 'El Verdon (Pozo Número Cinco)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 1, 'Kantunilkín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07');
INSERT INTO `ciudades` (`idEstado`, `idMunicipio`, `idCiudad`, `ciudad`, `created_at`, `modified_at`) VALUES
(23, 7, 2, 'Agua Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 5, 'El Cedral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 6, 'Cedralito Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 7, 'Cristóbal Colón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 8, 'Chiquilá\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 9, 'Delirios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 10, 'Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 11, 'Héroe de Nacozari\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 12, 'Holbox\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 13, 'El Ideal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 14, 'Juárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 15, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 17, 'Nuevo Durango\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 18, 'Nuevo Xcán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 21, 'El Pocito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 23, 'San Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 25, 'San Cosme\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 26, 'San Eusebio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 28, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 30, 'San Juan de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 31, 'San Lorenzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 32, 'San Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 33, 'San Martiniano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 35, 'San Román\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 38, 'Solferino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 39, 'El Tintal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 40, 'Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 41, 'Nuevo Valladolid\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 42, 'Guadalupe Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 43, 'Ignacio Zaragoza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 46, 'Cedralito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 49, 'Chan Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 52, 'La Ermita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 53, 'Francisco Villa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 57, 'Monte Bravo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 61, 'San Casimiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 63, 'San Javier\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 73, 'Santa Melva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 78, 'Tres Marías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 95, 'Arizona\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 100, 'Jacinto Canek\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 101, 'Ninguno [CBTA 186]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 109, 'Yaxcopil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 114, 'La Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 115, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 124, 'Nuevo Valladolid Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 128, 'José Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 137, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 139, 'Pacchen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 141, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 146, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 153, 'Ninguno [Rastro Municipal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 154, 'San Agustín Primero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 159, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 160, 'San Arturo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 167, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 168, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 174, 'UEEE Número Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 179, 'Vicente Guerrero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 191, 'Rancho Talismán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 194, 'Santo Domingo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 196, 'Villa de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 241, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 247, 'El Chaparral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 250, 'San Bernardo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 255, 'Montecristo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 256, 'San Román\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 265, 'Cacahuamilpa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 268, 'Centro de Investigaciones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 270, 'San Candelario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 271, 'La Concepción\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 273, 'Delagro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 276, 'Kantunilkín [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 278, 'San Javier\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 279, 'Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 282, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 284, 'Santa Julia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 285, 'Santo Domingo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 288, 'Oxil-Kaax\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 292, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 293, 'El Pocito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 298, 'Laguna Costa Rica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 305, 'Planta de Gas LP\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 308, 'Roberto Dzul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 309, 'El Roble\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 318, 'San Javier\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 321, 'San Mateo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 329, 'Popolnah [Subestación Eléctrica]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 334, 'Buenavista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 339, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 340, 'San Valentín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 342, 'Tierra Santa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 344, 'Ninguno [Asociación Ganadera Local]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 346, 'Kantunilkín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 347, 'Kantunilkín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 350, 'Sebastián Poot Gallo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 352, 'Ka\'azihilkabo\'ob\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 355, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 356, 'Diez de Mayo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 363, 'Canul Pool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 367, 'San José Chumpús\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 368, 'Santa Melva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 370, 'Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 371, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 372, 'Los Aluxes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 373, 'La Limonaria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 374, 'San Isidro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 376, 'Pustunich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 377, 'San Pablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 378, 'Chechen Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 379, 'La Gran Familia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 380, 'El Corchal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 382, 'Chapulines\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 383, 'Paraíso (Kilómetro 38)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 386, 'Rancho Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 389, 'Constituyentes del Setenta y Cuatro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 390, 'Banco de Cenotes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 392, 'Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 393, 'Villa Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 394, 'Laguna Chabela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 395, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 400, 'Colonia CAPA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 401, 'San Felipe de las Lomas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 402, 'San Marco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 404, 'Nuevo Pueblo Mercedes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 405, 'Ronnin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 406, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 407, 'Villa Infantil Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 408, 'Cupaima [Ecoturístico]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 410, 'El Ché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 411, 'Manuel Chan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 413, 'La Pequeña Tierra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 414, 'La Querencia [Finca]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 419, 'Lucas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 421, 'San Angelin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 422, 'San Chabel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 426, 'Cándido [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 427, 'El Cairo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 429, 'Jr. Aguilar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 430, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 431, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 432, 'Cabaña Chiquita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 433, 'La Ermita I\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 434, 'La Veleta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 436, 'Santa Elena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 437, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 439, 'Parcela Ejidal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 440, 'Pio Papa May José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 442, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 443, 'Santa María (273)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 444, 'Solferino [Huerta de Frutas y Verduras]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 445, 'Yokdzonot Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 446, 'Zarco Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 447, 'Campo de Tiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 449, 'El Esfuerzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 450, 'Felicidad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 451, 'La Carmelita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 452, 'La Chaya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 454, 'Los Cedros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 455, 'Los Danieles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 456, 'Los Tres Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 457, 'Mariquita Linda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 464, 'El Esfuerzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 465, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 466, 'Rancho del General\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 467, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 468, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 469, 'Villa de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 470, 'José Alfonso Ku Hoil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 471, 'María Rosalba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 472, 'El Campesino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 473, 'Jungla Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 474, 'Dos Ojos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 475, 'Eben Ezer\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 476, 'El Jaguar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 477, 'El Yui\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 478, 'Ixchel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 479, 'La Curva del Diablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 480, 'La Paz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 481, 'Laja\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 482, 'Los Arcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 483, 'Mayan Muuk\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 484, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 485, 'El Vizcaíno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 486, 'Rosa Guadarrama\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 487, 'La Unión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 488, 'Chunhuhub\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 489, 'El Peregrino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 490, 'El Paraíso del Tatich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 491, 'El Pocito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 492, 'Ninguno [Invernadero de Papaya]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 493, 'Tito Santana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 7, 494, 'Santa Melba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 1, 'Playa del Carmen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 16, 'Artesanías Xpu Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 20, 'Banco Playa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 25, 'Chilly Willy\'s [Centro Nocturno]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 29, 'Materiales y Fulminantes del Sureste\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 31, 'El Caracol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 33, 'Ninguno [Caseta de Bombeo]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 37, 'Agua Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 38, 'Cenote Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 52, 'Los Cinco Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 59, 'Concepción Rodríguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 60, 'Mateo y Juana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 69, 'Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 79, 'La Paz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 92, 'Los Gavilanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 94, 'La Gloria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 100, 'Mayan Palace\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 102, 'Honduras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 107, 'Santa Teresita del Niño Jesús\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 111, 'Valentín Maya Resort\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 119, 'Alfredo Canché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 130, 'Izamal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 131, 'El Jabalí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 138, 'El Dorado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 139, 'Kantenah Dos (Rancho Kantenah)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 146, 'Zazil-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 157, 'Blue Diamond [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 158, 'El Manguito [Joyería]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 162, 'Los Picapiedra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 179, 'Paa Mul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 182, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 183, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 189, 'El Caracol (El Pedregal)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 195, 'El Pícaro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 200, 'Playa del Secreto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 201, 'Iberostar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 205, 'El Jardín del Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 210, 'Apasco [Concretos]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 212, 'Puerto Aventuras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 213, 'Puerto Chile\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 217, 'Punta Maroma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 221, 'Punta Venado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 230, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 231, 'Club Tulum Palace\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 232, 'El Ranchito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 239, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 241, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 246, 'San Carlos (Kilómetro Cuarenta y Cinco)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 248, 'San Diego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 263, 'Don Papis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 264, 'San José Ichtzel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 265, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 269, 'San Lorenzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 270, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 272, 'San Mateo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 273, 'Native\'s Park\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 274, 'Lu\'um Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 284, 'San Vicente\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 285, 'Grand Palladium\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 288, 'Santa Elena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 300, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 304, 'La Selva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 308, 'Puerto Aventuras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 312, 'Tazol Chico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 314, 'Tigre Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 331, 'Uxuxubi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 341, 'Xcaret\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 342, 'Xcaret\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 345, 'Xpu Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 356, 'Zazil-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 362, 'Radio Turquesa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 367, 'Agua Viva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 370, 'Arbolada II\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 373, 'Centro de Operadores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 377, 'Artesanías Mexicanas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 382, 'Barceló Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 384, 'Ocean Maya Royale\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 389, 'Cárcel Pública\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 402, 'Cuzel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 410, 'La Estrella del Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 416, 'Guadalupano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 421, 'El Jaguar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 428, 'Río Secreto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 432, 'Chupacabras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 433, 'Kantún Chí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 436, 'Lomar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 447, 'Monte Cristo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 453, 'Nueva Creación\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 457, 'Los Pájaros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 460, 'Paraíso Tucán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 467, 'Puerto Chile (X Catic)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 468, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 469, 'Las Tunas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 472, 'Hard Rock [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 478, 'Los Lachos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 480, 'San Gonzalo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 481, 'Mayan Aventura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 483, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 485, 'IPAE I\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 486, 'Santa Librada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 488, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 495, 'El Trébol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 496, 'Tres Ríos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 547, 'Rancho Escondido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 549, 'Hunab Kú\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 551, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 554, 'Los Faisanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 555, 'San Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 568, 'ABC\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 569, 'San Andrés [Purificadora de Agua]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 572, 'El Sauce\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 577, 'Cavernas Chaak Tun\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 578, 'La Selva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 583, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 587, 'Zeta Gas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 591, 'Lapis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 592, 'Primavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 596, 'Marina Maroma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 603, 'El Pitayo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 604, 'La Popa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 606, 'El Palomar [Salón de Fiestas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 608, 'Las Chabelitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 611, 'San Román\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 612, 'IPAE II\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 613, 'Secrets Capri\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 622, 'Graciela Zapata Ravel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 624, 'Los Marios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 625, 'Baltazar Aguilar Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 626, 'El Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 627, 'Las Golondrinas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 629, 'Baltazar Aguilar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 630, 'Aké Aguilar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 631, 'Hacienda del Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 632, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 633, 'El Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 634, 'Carlos Quiam [Centro Recreativo Ecopark]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 635, 'Los Cinco Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 636, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 637, 'Yumbalam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 638, 'El Pueblito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 639, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 640, 'Vida y Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 641, 'Dorado Royale\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 642, 'Santa Teresita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 643, 'Agua Azul [Caseta de Bomba de Agua]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 646, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 647, 'Pacto Obrero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 648, 'Los Girasoles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 649, 'La Rejoyada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 650, 'Grinch\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 651, 'Tumben Otoch\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 652, 'La Gran Linda Vista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 653, 'Jardines\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 654, 'Tazol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 677, 'La Mocha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 681, 'Clara Aguilar Che\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 684, 'San Marcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 685, 'El Tigre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 688, 'Mayaland\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 691, 'El Andariego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 699, 'La Santísima\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 702, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 706, 'Chun Yaxché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 709, 'Felipe Carrillo Puerto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 710, 'Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 711, 'Hidalgo y Cortez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 714, 'Laguna Luz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 716, 'Punta Laguna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 718, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 721, 'Santa Clara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 722, 'Santa Clara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 736, 'El Áltimo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 737, 'Balam-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 739, 'Los Betos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 764, 'La Güerita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 769, 'Tres Piedras\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 782, 'Santa Lucía [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 787, 'Parcela Isabel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 793, 'Rancho Amor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 799, 'Las Gemelas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 801, 'Balam Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 802, 'Aquismón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 803, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 805, 'Las Tres Cruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 809, 'Los Tres Alazanes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 817, 'Blue Bay Grand Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 818, 'Playa Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 819, 'Actun Pooltunich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 820, 'Hat-Zuts\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 821, 'El Aventurero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 822, 'Balam Tun\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 823, 'Campamento Cristiano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 824, 'Los Campos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 825, 'Los Cayuyas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 827, 'Compich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 828, 'El Engaño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 829, 'Nuevo Noh-Bec\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 831, 'Filiberto Aguilar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 832, 'Finca Yohana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 833, 'Finca Yorogana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 834, 'La Gloria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 835, 'Grand Sirenis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 836, 'Hacienda Agave\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 839, 'El Regalo de Mis Padres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 840, 'El Faisán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 842, 'Lindavista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 844, 'Fernando Aguilar [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 845, 'Okol Kin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 846, 'Las Maravillas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 847, 'María Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 848, 'Las Marías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 851, 'Mudándote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 852, 'Mi Preciosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 853, 'Paula Dzib Quiam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 855, 'La Plumita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 857, 'Rancho Chico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 858, 'Rancho Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 861, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 862, 'San Juan Bautista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 863, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 868, 'Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 869, 'Yaxluum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 871, 'El Porvenir (Casa Vela)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 872, 'Gaby García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 873, 'Granillos [Trituradora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 874, 'Grupo Gorsa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 876, 'Julio Quiam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 878, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 881, 'Los Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 882, 'Los Viveros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 883, 'Mayacoba [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 884, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 885, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 887, 'Mazatlán [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 888, 'Patricia [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 889, 'San Benito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 890, 'San Víctor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 891, 'Tumben Kuxtal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 892, 'Villa de Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 893, 'Aluxes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 897, 'La Nueva Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 898, 'Los Almendros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 899, 'Los Arcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 900, 'Los Lirios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 901, 'Los Vela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 904, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 907, 'Noche Buena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 908, 'Nuevo Guerrero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 909, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 910, 'Quinta Amor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 913, 'San Pablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 914, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 916, 'Yaman Ek\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 919, 'Lázaro Cárdenas del Río\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 920, 'El Pitayo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 922, 'Ozen Cocom\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 923, 'Triple A\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 924, 'Los Pájaros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 925, 'Tumben-Kah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 926, 'Valle Encantado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 927, 'Jacinto Canek (Campesinos Unidos)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 928, 'Torres de la Paz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 929, 'Paseos del Parque\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 930, 'Dolphinaris Park\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 931, 'Los Diez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 932, 'Matis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 933, 'Nuevo Jalisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 934, 'Rancho Corazón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 935, 'Rancho Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 936, 'Santa Margarita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 937, 'Tonantzin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 938, 'Zazil-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 939, 'Boudan I\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 940, 'Boudan II\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 941, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 942, 'Los Palomares\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 943, 'La Orquídea\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 944, 'Yaxkin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 945, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 946, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 947, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 948, 'Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 949, 'Belfast\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 8, 950, 'Monte Sinahí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 1, 'Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 3, 'Selva Latina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 4, 'Aktún Chen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 5, 'Akumal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 6, 'Akumal Beach Resorts\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 7, 'Akumal Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 13, 'Labna Ha [Cenotes]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 15, 'Helimar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 16, 'Aventuras Akumal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 18, 'Gran Bahía Príncipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 20, 'Bahías de Punta Solimán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 21, 'Balam Canché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 22, 'Balam Aktún\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 23, 'El Palancar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 27, 'Boca Paila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 28, 'El Retiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 30, 'Las Cabañas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 33, 'Caleta Tankah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 34, 'SCT [Campamento]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 39, 'Casa del Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 41, 'Casa Nalum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 42, 'Arco Maya [Caseta]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 43, 'Ninguno [Caseta de Revisión Sanitaria]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 44, 'Cayetano Nieto Colín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 45, 'Sian Ka\'an [Centro de Investigaciones]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 46, 'Cesiak\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 49, 'Chan Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 51, 'Chanchén Palmar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 52, 'Chanchen Primero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 53, 'Chan Chemuyil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 54, 'Chumkopó\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 55, 'Ciudad Chemuyil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 56, 'Clínica IMSS Diez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 57, 'Cobá\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 58, 'Los Cocales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 63, 'Playa Manatí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 65, 'Corazón Guadalajara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 67, 'Crucero de las Ruinas de Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 68, 'Bahía Xamach\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 71, 'Doña Leonor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 73, 'Las Dos Hermanas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 74, 'Dos Ojos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 76, 'Dos Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 78, 'EA\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 80, 'Ek Che\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 81, 'El Elegante\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 84, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 85, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 86, 'El Faisán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 87, 'El Faro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 89, 'Faro Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 92, 'Francisco Uh May\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 93, 'Freedom Paradise\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 95, 'El Gran Cenote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 100, 'Hondzonot\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 101, 'Houston\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 102, 'Ixchel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 104, 'Jacinto Pat\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 105, 'El Jaguar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 106, 'Javier Rojo Gómez (Punta Allen)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 107, 'Jorge Portilla Manica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 108, 'Kaape Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 110, 'La Kic-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 111, 'Laguna Kanluum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 113, 'El Lagunero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 115, 'El Pequeño Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 116, 'Kaakulxa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 117, 'El Campesino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 122, 'Kirabo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 124, 'Lol Beh\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 125, 'Lol Che\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 127, 'Maya Kan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 130, 'La Lupita Paso Lágrimas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 133, 'Macario Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 135, 'Casa Canario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 136, 'Manuel Antonio Ay\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 138, 'María Magdalena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 139, 'Las Cabañas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 141, 'Maya Tadeo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 145, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 154, 'Oasis Akumal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 158, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 159, 'Cobá [Minisuper]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 160, 'Casa Amparo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 163, 'Pedro Paila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 164, 'Emily\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 166, 'Pesca Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 167, 'Pez Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 176, 'Los Gatos Negros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 178, 'Punta Pelícano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 182, 'Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 184, 'Casa de los Pelícanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 185, 'Rancho Alegre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 189, 'Rancho Mariposa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 191, 'La Nueva Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 197, 'Ruinas de Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 200, 'Sahcab Mucuy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 201, 'San Agustín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 202, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 206, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 207, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 209, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 210, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 211, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 212, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 213, 'San Mateo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 214, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 217, 'San Rafael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 218, 'Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 219, 'Santa Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 223, 'Alfa y Mega\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 225, 'Los Agaves\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 226, 'Santa Pilar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 227, 'Mukan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 232, 'SEMARNAT\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 233, 'Sol Caribe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 234, 'Sol Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 235, 'Tulum Banco Uno [Subestación]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 236, 'Dreams Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 237, 'Tankah Cuatro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 238, 'Tankah Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 240, 'Tankah Tres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 242, 'Mayamar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 243, 'La Teresita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 245, 'Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 252, 'Uxul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 253, 'El Venado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 257, 'Las Villas Akumal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 262, 'Xamach Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 263, 'Xbecal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 264, 'Xcacel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 265, 'Xel-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 266, 'Yal-Xaan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 267, 'Yaxché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 270, 'El Elefante Volador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 280, 'Casa Godi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 283, 'Casa Merrick\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 291, 'Cibal-Yumtzil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 293, 'Don Renzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 299, 'Hombre de Piedra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 301, 'Los Jaguares\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 304, 'Los Bosques\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 319, 'Quinta la Alborada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 321, 'Koox Campestre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 324, 'Xo Ki\'in\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 325, 'El Teterete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 327, 'Villa Destini\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 328, 'Villa Estrellita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 332, 'Yalkú\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 333, 'Áaktun Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 334, 'El Álamo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 336, 'Alebrijes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 337, 'Aluxes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 338, 'Las Amarantas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 339, 'Antonio Pool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 340, 'El Árbol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 341, 'Balam Ka\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 342, 'Balam Luum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 343, 'La Selva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 344, 'Camino Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 346, 'La Casa de las Mariposas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 347, 'Casa del Niño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 348, 'Yakunah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 349, 'La Casa Leña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 351, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 352, 'Cenote Angelita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 353, 'Cenote Calavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 354, 'Cenote Cristal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 355, 'Cenote Zazil-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 356, 'Ajal Tulum [Hotel-Spa-Restaurant]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 359, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 360, 'El Colomo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 362, 'Cruz Azul [Concretos]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 363, 'Jeremías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 364, 'La Culebra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 367, 'Los Delfines (Xamach Uno)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07');
INSERT INTO `ciudades` (`idEstado`, `idMunicipio`, `idCiudad`, `ciudad`, `created_at`, `modified_at`) VALUES
(23, 9, 368, 'El Deseo de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 369, 'Santa Isabella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 371, 'Las Dos Luces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 372, 'Dos Ojos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 373, 'Dos Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 374, 'Dzonot Sis-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 375, 'Ek Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 377, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 378, 'Villa Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 379, 'PEMEX [Gasolinera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 382, 'La Herencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 383, 'India Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 384, 'Kan-Lu\'um\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 385, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 390, 'Alejandro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 391, 'Morales [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 394, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 395, 'Maya Manzanero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 396, 'Noh Aaktun\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 399, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 401, 'Mucuy [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 402, 'Eulogio Pool May\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 403, 'Lorenzo Nardi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 404, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 405, 'Lorenzo Nardi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 406, 'Naharon [Parque Ecoturístico]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 407, 'La Unión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 413, 'Eugenio Catzin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 414, 'Nubia Aracely González López\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 415, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 416, 'La Pescadora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 417, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 420, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 422, 'José María Pino Suárez (Parcela No. 2055)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 423, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 425, 'Loma Linda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 426, 'La Lunita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 427, 'Alejandro Terrazas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 429, 'El Manantial\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 430, 'Grand Slam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 431, 'Maya Art\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 432, 'Mi Lu\'um\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 435, 'Orión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 437, 'El Palomar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 438, 'Las Palomas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 439, 'Pambi Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 441, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 444, 'Procuraduría General de Justicia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 445, 'El Recuerdo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 446, 'Sac-Be\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 447, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 448, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 449, 'San Edgar (Santiago Canul)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 450, 'San Manuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 451, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 452, 'San Nazarén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 453, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 454, 'Santa Elena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 455, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 456, 'Santo Domingo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 457, 'El Sapote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 458, 'Saya\'b Tunich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 459, 'T. Cañón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 460, 'Tankah Pueblo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 461, 'The Smilling Iguana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 462, 'Tres Hermanos (Emilio)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 463, 'Tres Nietos (Don Lupe)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 464, 'Tres Vírgenes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 465, 'La Bendición de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 466, 'U-Shul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 467, 'Vivero Jardín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 468, 'Ranitas [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 469, 'Yolis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 470, 'Zhunaan Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 471, 'Agua Maya [Planta Purificadora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 472, 'Aventuras Maya [Parque]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 473, 'Balam Ak\'ab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 474, 'Cafeto Cimarrón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 475, 'Casa Chemsi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 476, 'Casa Ikal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 479, 'Cenote Kalimba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 480, 'Cenote Xunaan-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 481, 'Cenote Yax-Kín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 482, 'Doña Martina [Vivienda]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 483, 'El Lince\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 484, 'Chemuyil Club Villas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 485, 'El Zapotal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 486, 'Eleazar Pool [Vivienda]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 487, 'Harumi Fandiño Sakane\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 490, 'Kilómetro Seis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 491, 'La Campana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 492, 'Treinta y Uno [Lote]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 494, 'Manuel Chivero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 495, 'Sastrán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 496, 'Pueblito Chemuyil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 498, 'Chonita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 499, 'India Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 500, 'Dreams Tulum [Poblado de Apoyo del Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 501, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 503, 'Ninguno [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 504, 'Número Siete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 505, 'Oscar y Lalo [Restaurante Bar Grill]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 506, 'Playa Capechén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 507, 'Punta Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 508, 'Canbalan [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 509, 'Caracolito [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 510, 'Rancho de Pablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 511, 'Flores Rojas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 512, 'Ila\'ke\'ch [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 513, 'Ixchel [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 514, 'Najil\'kaax [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 515, 'Paraíso [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 516, 'Predio Norte\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 517, 'Saturnino [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 518, 'Sueños [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 519, 'Yax\'muul [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 520, 'Buena Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 521, 'The Jungle Place\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 522, 'Tulum Monkey Santuary (TMS)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 523, 'Árboles Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 525, 'Casa Sofía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 526, 'Cuatro Hectáreas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 527, 'El Canario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 528, 'El Pit\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 529, 'El Último Maya (Camping)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 530, 'Isabel [Artesanías]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 531, 'Julián Borge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 532, 'Alux\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 533, 'Los Aluxes [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 534, 'Misterio Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 537, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 539, 'Pakchen [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 540, 'Rafael Pérez Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 541, 'Sac-Aktun\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 542, 'San Baltazar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 543, 'Xamach Uno Alma Viva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 544, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 545, 'Cristal [Colonia]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 546, 'Akumal Monkey Santuary\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 547, 'Akunynam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 548, 'Cachito de Cielo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 549, 'Casa Celeste\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 550, 'Casa Tzalam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 551, 'Cueva del Pargo Xamach\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 552, 'Jungla Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 553, 'La Picuda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 554, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 555, 'Rancho Antigua\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 556, 'Santuario Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 557, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 558, 'Mu\'uch Taanbal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 559, 'Paak Malob Macob\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 560, 'Antonio Borges Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 561, 'Cobá [Hacienda]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 562, 'Dzidzilché [Villa]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 563, 'Efraín Cen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 564, 'La Pura Vida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 565, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 566, 'Silvia Canché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 567, 'Yosif\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 568, 'Inlakech\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 569, 'Kilómetro 9.5\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 570, 'Yum\' Kíim\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 571, 'Ana y Camilo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 572, 'Villa Dzidzilche\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 573, 'La Felicidad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 574, 'Taak Bi Ha [Cenote]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 575, 'Tho [Cenote]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 576, 'Nooch [Cenote]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 577, 'Taak Bi Lu\'um [Cenote]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 578, 'Sindicato de Taxistas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 579, 'Marités\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 580, 'Don Brígido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 581, 'Dylan Chimal Herrera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 582, 'Cobá [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 583, 'Valle de Barak\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 584, 'Casa Indi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 585, 'Océano Azul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 586, 'Pacha Mamá\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 587, 'Mauricio [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 588, 'El Cedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 589, 'Kilómetro Doce\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 590, 'Mi Amigo Faisán [Restaurante]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 591, 'Lum Ha [Lotes]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 592, 'Kilómetro Diez Punto Cinco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 593, 'Machete [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 594, 'Koo Muna Selva Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 595, 'San Pablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 596, 'El Tigre [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 597, 'Xcacel [Residencial]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 598, 'Yáax Táanil Kaah [Colonia]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 599, 'Casa Wom\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 600, 'Jorge Góngora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 601, 'Las Jacarandas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 602, 'Dzonot Kaah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 603, 'Aldea Tulum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 604, 'Luis y Orfa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 605, 'Alejo Chimal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 606, 'Xunaán Kab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 607, 'Los Patos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 608, 'Nohoch Mul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 609, 'Temazcal Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 610, 'El Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 611, 'Betania\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 612, 'Clara Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 613, 'Casa Estrella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 614, 'La Jungle\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 615, 'Las Chiapanecas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 616, 'Maya Kala\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 9, 617, 'Dharma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 1, 'Bacalar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 2, 'Áak\' Abal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 3, 'Aarón Merino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 4, 'Aarón Merino [Colonia]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 5, 'Agua Real\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 6, 'Amizamac\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 7, 'Alfonso Álvarez Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 8, 'Altos de Sevilla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 9, 'Anastacio Valdez Huchin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 11, 'Andrés Quintana Roo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 12, 'Ángelo Cortez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 13, 'Año Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 18, 'Bacalar Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 19, 'Bárbara Guerrero Pérez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 20, 'Blanca Flor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 21, 'Buena Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 22, 'Buenavista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 23, 'Caan Lumil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 24, 'Caanán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 25, 'Cámara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 27, 'Cayuco Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 28, 'CECUSE\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 30, 'Chacchoben\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 31, 'Chula Vista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 32, 'Cinco Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 35, 'Cruz del Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 37, 'Cuatro Banderas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 38, 'Cuatro Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 39, 'Cuatro Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 40, 'David Gustavo Gutiérrez Ruiz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 41, 'De Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 42, 'Dieciocho de Marzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 43, 'División del Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 44, 'Ecotucán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 45, 'Eduardo Puchiga\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 46, 'El Bajío\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 47, 'El Buen Pastor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 49, 'El Cafetal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 50, 'El Forastero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 51, 'El Cedral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 52, 'El Cedralito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 53, 'El Cerro de la Campana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 54, 'El Coco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 57, 'El Diamante\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 58, 'El Edén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 60, 'El Encanto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 61, 'El Encanto Segundo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 62, 'El Esfuerzo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 64, 'El Gallito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 65, 'El Higuero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 67, 'El Kiwi\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 68, 'El Mamey\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 69, 'El Milagro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 71, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 72, 'El Naranjal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 74, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 75, 'El Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 77, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 78, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 79, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 81, 'El Progreso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 82, 'El Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 83, 'El Remolino\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 84, 'El Roble\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 85, 'El Rubí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 86, 'El Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 87, 'El Sufrido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 88, 'El Suspiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 89, 'Mia Bacalar [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 90, 'El Zapote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 91, 'El Pescador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 92, 'Emiliano Pantín Góngora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 94, 'Ernesto Chejín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 97, 'Francisco Hurtado Ibarra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 98, 'Francisco J. Mújica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 99, 'Francisco Villa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 100, 'Frontera de los Julios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 101, 'Gabino Vázquez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 102, 'Salsas Habaneras (Km 5)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 106, 'Guadalupe Victoria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 107, 'Gustavo Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 108, 'Gustavo Díaz Ordaz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 109, 'Huatusco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 110, 'Isidro Fabela\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 112, 'Iturbide\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 113, 'Iván Díaz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 114, 'Javier Palacios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 115, 'Javier Sandoval\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 116, 'Jesús Martínez Ross\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 118, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 119, 'Jorge Cano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 120, 'José Méndez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 121, 'Juan Herrera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 122, 'Kuchumatán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 123, 'La Bendición de Dios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 124, 'La Buena Fe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 127, 'La Carmelita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 128, 'La Casona\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 129, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 130, 'La Central\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 131, 'La Chata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 132, 'La Cochinera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 133, 'La Coruña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 134, 'La Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 135, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 136, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 137, 'La Estancia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 139, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 140, 'La Herradura\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 143, 'La Loma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 144, 'La Nueva Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 145, 'La Pantera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 146, 'La Pasadita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 148, 'La Piedra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 150, 'La Primavera\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 153, 'La Retranca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 155, 'La Zarza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 157, 'Las Brisas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 158, 'Las Dos Eses\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 161, 'Las Heliconias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 162, 'Las Ilusiones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 163, 'Tres Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 166, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 170, 'Las Tres Emes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 172, 'Las Velas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 173, 'Laureles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 174, 'Lázaro Cárdenas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 175, 'Lázaro Cárdenas del Río Tercero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 176, 'Leyda Alpuche\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 177, 'Limones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 179, 'Los Alacranes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 181, 'Los Ángeles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 182, 'Los Cardenales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 183, 'Los Cascabeles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 185, 'Los Cinco Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 186, 'Los Compadres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 187, 'Los Cuates\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 188, 'Los Divorciados\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 192, 'Los Humildes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 193, 'Los Laureles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 194, 'Los Laureles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 196, 'Los Siete Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 197, 'Los Socios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 199, 'Manatí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 200, 'Manuel Ávila Camacho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 203, 'Margarita Maza de Juárez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 204, 'Marlboro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 205, 'Maya Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 206, 'Melchor Ocampo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 208, 'Miguel Alemán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 209, 'Miguel Hidalgo y Costilla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 210, 'Mil Millas al Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 211, 'Monte Olivo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 213, 'Narciso Alpuche Rivero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 214, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 225, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 226, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 227, 'Ponciano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 228, 'José Luis Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 229, 'Rubén Méndez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 231, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 233, 'Las Brisas Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 234, 'Los Huastecos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 235, 'Hugo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 236, 'Rudy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 237, 'Osvaldo Morales Correa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 238, 'Ninguno [Corredor Frutícola]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 239, 'Noh-Bec\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 240, 'Nuevo Hoctún\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 241, 'Nuevo Jerusalén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 242, 'Nuevo Tabasco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 245, 'Otilio Montaño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 248, 'Paraíso Escondido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 250, 'Payo Obispo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 251, 'Pedro Antonio Santos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 252, 'Pehaltum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 253, 'Petén Tunich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 254, 'PROFEPA [Caseta de Vigilancia]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 256, 'Puerta del Cielo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 258, 'Punta Pulticub\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 262, 'Los Cinco Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 263, 'Rancho Encantado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 264, 'Rancho Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 265, 'Rancho Juanita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 266, 'Rancho Mayob\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 267, 'Rancho Ramonal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 268, 'Rancho Sur\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 269, 'Rancho Tranquila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 271, 'Reforma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 272, 'San Manuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 273, 'Amalia Lavadores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 274, 'Reyna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 275, 'Río Escondido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 276, 'Río Verde\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 277, 'Rosa de Saarón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 278, 'Sabanitas Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 279, 'Salamanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 280, 'El Mezcal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 282, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 283, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 284, 'San Bernardo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 285, 'San Cosme\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 286, 'San Felipe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 287, 'San Felipe Bacalar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 288, 'San Fernando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 289, 'San Gabriel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 292, 'San Isidro la Laguna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 294, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 295, 'San José (La Silvia)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 297, 'San José los Lirios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 298, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 299, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 300, 'San Judas Tadeo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 303, 'San Manuel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 304, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 305, 'San Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 307, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 308, 'San Rafael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 309, 'San Ramón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 310, 'San Román\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 311, 'San Víctor\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 313, 'Santa Cruz Chico [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 315, 'Santa Julia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 316, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 317, 'Santa Rita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 320, 'Alberto Robledo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 321, 'Serviliano Cohuó Medina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 322, 'Silvia Cerecero Loyola\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 324, 'Sistema de Bombeo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 326, 'Tierra Negra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 327, 'Tito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 328, 'Tito Raúl García Aguilar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 329, 'Ubre Blanca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 330, 'Valentín Gómez Farías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 331, 'Vallehermoso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 334, 'Xtomoc\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 335, 'Xtomoc Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 336, 'Yumpetén\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 337, 'Zak-Chakán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 338, 'Zamora\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 339, 'Zapata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 340, 'Agave Blue\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 341, 'Andrés Ruiz Morcillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 343, 'Azul no me Olvides\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 344, 'Triple Siete [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 345, 'Casa Tibidabo 33\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 349, 'Pucté\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 350, 'Yakare\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 351, 'El Español\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 353, 'El Mirador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 354, 'El Progreso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 356, 'Kilómetro 49 más 870\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 359, 'Las Brisas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 360, 'Las Mariposas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 361, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 362, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 363, 'Los Cuatro Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 364, 'Los Mangos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 366, 'Marie Claude Rodríguez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 368, 'Quinta Bacalar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 369, 'San Fernando Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 370, 'San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 371, 'San Juanito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 372, 'Santa Bárbara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 373, 'Tres Cruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 374, 'Tres Hermanos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 375, 'Yaxché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 376, 'Cerro del Diablo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 377, 'Guerrerense\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 378, 'La Estil (Kilómetro Once)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 379, 'Rancho Escondido\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 380, 'El Aventurero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 381, 'El Esfuerzo Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 382, 'El Espinal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 383, 'Jesús Vitela Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 384, 'Rancho Yaveh\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 385, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 386, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 387, 'Las Ruinas Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 388, 'Las Tres JJJ\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 389, 'Lázaro Cárdenas [Centro de Acopio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 390, 'Los Robles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 391, 'Mayakan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 392, 'Rancho Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 393, 'San Antonio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 394, 'Semental\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 396, 'Armando Cancino Rosales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 397, 'Bomboris\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 398, 'Chiich-Ool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 399, 'Chiquiven\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 400, 'Dos Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 401, 'El Cocal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 402, 'El Emperador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 404, 'Familia Medina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 405, 'Flor de Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 406, 'Huaye\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 407, 'Inocencio Laina Pérez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 408, 'La Sabana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 409, 'La Saga\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 410, 'Los Abuelos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 411, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 412, 'Luis Azuara\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 413, 'Marcelo González\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 414, 'Miguel Bueno Vargas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 415, 'Ramsés\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 416, 'San Filiberto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 417, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 418, 'San Joaquín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 419, 'Sixto Agustín Hernández Ortíz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 420, 'Piegrades\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 421, 'El Jabín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 422, 'El Retiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 423, 'Antorcha Bacalar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 424, 'Ninguno [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 425, 'Irma Montalvo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 426, 'Guillermo Borges\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 427, 'Ninguno [Quinta Orión Costa Maya]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 428, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 429, 'Las Golondrinas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 430, 'Cuatro Hermanos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 431, 'El Cardenal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 432, 'Barlovento\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 433, 'Cocohital\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 434, 'El Bambú\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 435, 'Los Yoyos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 436, 'Blue Matisse\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 437, 'El Tauro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 438, 'Geremías Romero Muñoz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 439, 'Los Corales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 440, 'Margarita Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 441, 'El Rocío\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 442, 'El Arrecife\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 443, 'Mayan Paradise\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 444, 'Don Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 445, 'El Diablito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 446, 'Sandra de la Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 447, 'Héctor Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 448, 'La Casona Palms\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 449, 'Jumboatic\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 450, 'La Brisa Uvero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 451, 'Azteca Duric\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 452, 'Ninguno [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 453, 'Emilio Arisa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 454, 'Las Bugambilias\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 455, 'El Roble\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 456, 'El Rincón de Olivo [El Hong Kong]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 457, 'La Trinidad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 458, 'Don Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 459, 'Las Vacas Locas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 460, 'Santa Elena\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 461, 'César Cejas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 462, 'Bethel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 463, 'Los Dos Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 464, 'Francisco Carlos Bonilla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 465, 'Gema\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 466, 'Parador Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 467, 'El Zapote\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 10, 468, 'Evaristo Coronel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 1, 'Puerto Morelos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 2, '1ro. de Abril\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 3, 'La Derrota Total [Granja 24 Horas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 4, 'Abdiel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 5, 'Addy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 6, 'Adrian Poot Pech\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 7, 'Agua Escondida\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 8, 'Alcatraz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 11, 'Ámel García Ramírez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 12, 'Ángel Bautista\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 13, 'Ángel Esteban\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 14, 'Angélica Dorantes Ordoñez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 16, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 17, 'Aquí la Gloria\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 20, 'Argenis III\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 21, 'Arietes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 22, 'Avestruces\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 23, 'Azul Sensatori [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 25, 'Belosol Beach Club\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 26, 'Benito Juárez [Vivero Forestal]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 27, 'Boca del Puma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 28, 'Campestre Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 29, 'Campo de Sol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 30, 'Campo Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 31, 'Caracolillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 32, 'Casa los Arcos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 33, 'Central Vallarta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 34, 'Centro Cristiano Peniel [Campamento]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 35, 'Chac-Tun Ché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 36, 'Chan Dzonot\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 37, 'Chari\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 38, 'Chilam Balam\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 39, 'El Retoño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 40, 'Colibrí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 41, 'Corazón [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 42, 'Cottini Girolo Renato\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 44, 'Cruz de la Selva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 45, 'Cruz de la Selva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 46, 'Cuna de Lobos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 47, 'David Euan Canché\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 48, 'Dejeos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 49, 'Delta Premezclados\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 50, 'Desiré\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 51, 'Diez de Septiembre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 52, 'DIMASUR\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 53, 'Doctor Alfredo Barrera Marín [Jardín Botánico]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 55, 'Dos Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 56, 'El Abuelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 58, 'El Álamo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 59, 'El Álamo Dos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 60, 'El Álamo Uno [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 62, 'El Bejucal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 63, 'Quinta El Cardenal (Km 288.5)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 64, 'El Cardenal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 65, 'El Carrizal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 66, 'El Cedral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 67, 'El Chaparral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 68, 'El Chus\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 69, 'El Cocal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 70, 'El Colorado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 71, 'El Conquistador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 72, 'Maya Bacab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 73, 'El Corcel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 74, 'El Cubano [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 75, 'El Discípulo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 76, 'El Don\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 77, 'El Dorado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 78, 'El Gran Chaparral\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 79, 'El Jaguar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 80, 'El Maduro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 82, 'El Nido del Águila\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 84, 'El Pájaro Loco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 85, 'El Paradero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07');
INSERT INTO `ciudades` (`idEstado`, `idMunicipio`, `idCiudad`, `ciudad`, `created_at`, `modified_at`) VALUES
(23, 11, 86, 'El Paraíso [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 87, 'El Pavo [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 88, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 89, 'El Pedregal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 90, 'El Porvenir\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 91, 'El Potrillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 92, 'El Quelite\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 94, 'El Retiro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 95, 'El Rey Polo Country\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 97, 'El Tío Gil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 98, 'El Trópico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 100, 'El Willy (Parcela Diecisiete)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 102, 'Eladio Betancourt\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 103, 'Eleodoro Gallegos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 105, 'Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 106, 'Eulalio Caamal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 107, 'Fábrica de Hielo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 108, 'Fedajabu\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 109, 'Fermín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 110, 'Galilea Antiguo Tezón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 111, 'Golden Sky\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 113, 'Gustavo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 114, 'Hare Krishna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 115, 'Herlaz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 116, 'Hermanos Gómez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 117, 'Hermanos Loría Annel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 118, 'Hermanos Olivares\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 119, 'Hernán\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 120, 'Higos y Mandarinas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 122, 'Hueso Blanco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 123, 'Hugo Celis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 124, 'Ignacio Vázquez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 125, 'Interceramic [Bodegas]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 126, 'Ixora [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 127, 'Ixtul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 128, 'Jardines Lol-Be\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 129, 'Jauja\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 130, 'Javier Briseño [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 131, 'Jesús Salgado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 132, 'Jolie Jungle\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 135, 'JR\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 136, 'Juan Cupul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 137, 'Julián Jiménez Montalvo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 138, 'Kiimak in Wo\'ol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 139, 'Kilómetro Catorce Punto Siete\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 140, 'Iglesia de Dios Fuente de Manantial\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 143, 'La Asunción\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 145, 'La Carcajada\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 146, 'La Changa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 147, 'La Concepción\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 148, 'La Cueva del Tapir\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 149, 'La Dama y el Caballero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 150, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 151, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 152, 'La Granja\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 153, 'La Greñuda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 154, 'La Guadalupana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 155, 'La Iguana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 156, 'La Jungla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 157, 'La Jungla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 158, 'La Libertad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 160, 'La Lupita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 161, 'La Milpa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 163, 'La Paz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 164, 'La Pura Reata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 165, 'La Rana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 166, 'La Roca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 167, 'La Selva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 168, 'La Siembra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 174, 'Lagos de San Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 175, 'Las Azucenas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 177, 'Las Carmelitas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 178, 'Las Escondidas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 179, 'Las Fincas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 180, 'Loma Bonita [Parque]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 181, 'Las Orquídeas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 182, 'Las Palmas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 183, 'Las Palomas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 185, 'Las Potrancas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 186, 'Las Ruinas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 187, 'Las Sábilas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 188, 'Lee Much\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 189, 'León de Judá\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 190, 'Leona Vicario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 192, 'Leona Vicario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 193, 'Leona Vicario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 194, 'Leona Vicario [Bloquera]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 196, 'Ecología de Manejo y Residuos [Centro de Acopio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 199, 'Lobo Ranchero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 200, 'Loiritas Band\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 201, 'Loma Bonita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 202, 'Loritas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 206, 'Los Cachorros\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 207, 'Los Caporales\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 208, 'Los Chitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 209, 'Los Columpios\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 210, 'Yum Ki\'n [Cenote]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 214, 'Chi Kuk\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 215, 'Los Laureles\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 216, 'Los Macip\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 217, 'Los Norteños\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 220, 'Los Panchos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 221, 'Los Primos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 222, 'Los Querubines\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 223, 'Los Quiñones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 224, 'Caballo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 225, 'Los Sobrinos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 226, 'Los Tres Castillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 227, 'Los Tres Ceibos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 228, 'Los Tres Compadres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 231, 'GMA Saekhwang Mission Center\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 232, 'Macuspana [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 233, 'Mahanaim\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 234, 'Malonie Carrie\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 235, 'Mama Luum\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 238, 'María Abreu [Invernaderos]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 239, 'Mateo Santos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 240, 'Mau Mau\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 241, 'Mayan Paradise\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 242, 'El Rosario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 243, 'Mi Sueño\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 244, 'Miguel Sosa Burgos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 245, 'Mis Angelitos [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 246, 'Luum Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 247, 'Monte Sión\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 248, 'Moreno [Vulcanizadora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 249, 'La Divina Providencia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 250, 'Elías Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 254, 'Quinta Estrella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 255, 'Gely\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 256, 'Héctor Ortiz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 257, 'Manuel [Salón de Eventos]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 259, 'Luis Canul\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 260, 'El Profe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 262, 'El Garañón Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 264, 'El Ranchito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 265, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 266, 'San Fernando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 267, 'Miguel Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 269, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 270, 'Casa de Silla\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 271, 'Número 36\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 272, 'Antonio Naredo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 273, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 274, 'Cemix\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 276, 'México Lindo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 278, 'Tolook Kaan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 280, 'La Joya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 282, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 284, 'Radio Fórmula  [Repetidora]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 285, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 288, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 291, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 293, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 294, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 295, 'Ninguno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 296, 'El Forastero\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 299, 'Ninguno [Centro de Capacitación del Ayuntamiento]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 300, 'Ninguno [Ecológico]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 301, 'Ninguno [Número Cincuenta y Ocho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 302, 'Ninguno [Número Cincuenta y Seis]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 304, 'Ninguno [Número Cuarenta y Siete]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 307, 'Ninguno [Poste 24]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 308, 'Ninguno [Poste CFE 18-17]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 309, 'Santa Licia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 310, 'Ninguno [Poste CFE 22-23]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 311, 'San José [Poste CFE 23-24]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 312, 'La Agrícola\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 313, 'La Esperanza\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 314, 'Unidad Agrícola Industrial de la Mujer (UAIM)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 316, 'Noble y Bella\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 317, 'Nopalitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 318, 'Octavio Galicia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 319, 'Oliveth\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 320, 'Orenda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 321, 'Oscar Jiménez Córdoba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 322, 'Pacheco Acuatic\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 323, 'Pacheco Acuatic\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 324, 'Palma Areca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 325, 'Palma Seca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 326, 'Panacea\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 327, 'Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 328, 'Paraíso de la Bonita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 330, 'Parcela Cuarenta y Tres\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 331, 'Parcela Doscientos Diecinueve\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 332, 'El Nudo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 333, 'Pedro García May\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 334, 'El Pepen\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 335, 'Pie de Cría Uno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 337, 'Pretecno\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 338, 'Punta Brava\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 339, 'Punta Petempich\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 340, 'Punta Tanchacté\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 341, 'Puño de Tierra\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 342, 'Puros Sueños\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 343, 'Quince de Septiembre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 344, 'Quinta Rico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 345, 'Rancho Alegre\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 346, 'Rancho Cactus\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 347, 'Rancho Chico\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 350, 'Rancho Grande\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 351, 'Rancho Gubiña\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 354, 'Rancho Ochoa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 355, 'Rancho Verde\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 357, 'Rebeca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 359, 'Reserva Toh\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 360, 'Reynoso [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 361, 'Ríos de Agua Viva\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 362, 'Robeli\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 363, 'Rodolfo Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 364, 'Sac Beh de Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 365, 'Sac-Lol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 366, 'Sac-Pakal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 367, 'El Garañón Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 368, 'Las Caribeñas [Vivero]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 369, 'San Antonio de Padua\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 370, 'San Arturo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 372, 'San Diego\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 373, 'San Eduardo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 374, 'San Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 375, 'San Ignacio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 376, 'San Isidro Labrador\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 377, 'San Jarifongo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 379, 'San Joaquín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 380, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 381, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 382, 'San José de los Camotes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 383, 'San Judas Tadeo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 384, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 385, 'San Luis\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 387, 'San Miguel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 388, 'San Polo Mío (Laak Peek)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 389, 'San Pedro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 390, 'San Rafael\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 391, 'Sand Castle\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 392, 'Santa Ana\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 393, 'Santa Apolonia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 394, 'Santa Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 395, 'Santa Fabiola\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 396, 'Santa Lucía\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 397, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 398, 'Santa María\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 399, 'Santa Marta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 400, 'Santa Martha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 401, 'Santa Mercedes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 402, 'Santa Regina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 403, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 404, 'Santa Rosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 405, 'Saraguato\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 406, 'Secrets Silversands [Hotel]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 408, 'Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 409, 'Sinaí\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 410, 'Snorkeling Adventure\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 411, 'Sol y Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 412, 'Tecnorest Equipo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 413, 'Torno Largo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 414, 'Tres Bocas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 415, 'Tres Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 416, 'Tzol Kin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 417, 'Un Jardín en el Paraíso\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 418, 'Unay Keh\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 419, 'Unikteilkustal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 420, 'Valladolid Nuevo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 421, 'Aakaz  Haa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 422, 'Villa Amor [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 423, 'Villa Chankanaab\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 424, 'Villa Delfines\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 425, 'Villa Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 426, 'Villa Lupita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 427, 'Las Dunas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 428, 'Siboney\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 429, 'Xamba Laa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 430, 'Xokipix\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 432, 'Yodzonot Kukulkan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 433, 'Yolanda González\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 434, 'Yuca\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 435, 'Zapotitos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 436, 'Zona Selvática\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 437, 'Chac-Lu\'um [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 438, 'El Tacho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 439, 'Jamsa Avata\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 440, 'Jorpil\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 441, 'Bahenas [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 442, 'La Gloria [Granja]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 444, 'Leobardo Castro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 445, 'Los Cocos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 446, 'Eben Ezer\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 447, 'El Abuelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 448, 'San José\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 449, 'El Ángel\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 450, 'Selva Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 451, 'San Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 452, 'Guadalupe\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 453, 'Los Nietos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 454, 'Aurelia Coot Rodríguez [Llantera López]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 455, 'Casa Costal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 456, 'Pepen Ik\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 457, 'H5 Prefabricados [Artesanías]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 458, 'La Vereda Tropical\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 459, 'Quinta Cecilia\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 460, 'Rogelio Molina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 461, 'Tres Lunas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 462, 'Aguilar y Alvarado [Huerto]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 463, 'Alfredo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 464, 'Armando Rosado\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 465, 'Brenda Berenice de la Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 466, 'Brisandy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 467, 'Buenos Aires\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 468, 'Cantera Luna\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 469, 'Dago\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 470, 'Don Carlos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 471, 'Don Lucio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 472, 'Mayan Sky Eco Park\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 473, 'El Canelo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 474, 'El Capricho\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 475, 'El Corazón\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 476, 'El Diamante\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 477, 'El Lagar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 478, 'El Mangajajal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 479, 'El Paisano\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 480, 'El Palmar\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 481, 'El Por Decir\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 482, 'El Trébol\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 483, 'Eulogio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 484, 'Esmeralda\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 485, 'Fernando\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 486, 'Francisco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 487, 'Galaad\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 488, 'Gustavo Sánchez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 489, 'Humberto\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 490, 'Irene\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 491, 'Irma\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 492, 'Ixmucane\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 493, 'Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 494, 'José Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 495, 'José Santos Tamay\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 496, 'Juan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 497, 'Don Julio\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 498, 'Ninguno [Kilómetro 24]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 499, 'La Bendición\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 500, 'La Ceiba\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 501, 'La Respuesta (Kilómetro Doscientos Ochenta y Siete)\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 502, 'La Selva Alta\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 503, 'La Valentina\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 504, 'Luis Sosa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 505, 'Las Flores\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 506, 'Las Mariposas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 507, 'Leona Vicario\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 508, 'Familia López García\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 509, 'Los Cocos [Posada]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 510, 'Los Hernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 511, 'Los Jaguares\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 512, 'Los Limones\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 513, 'Los Martínez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 514, 'Los Reyes\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 515, 'Los Rosique\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 516, 'Lu\'um-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 517, 'Lu\'um-Maya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 518, 'Maranathas\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 519, 'Martín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 520, 'Martín Chávez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 521, 'Ojo de Agua\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 522, 'Ninguno [Pozo 45]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 523, 'Ninguno [Pozo 48]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 524, 'Ninguno [Pozo 46]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 525, 'Raúl Flota Benítez\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 526, 'Rubén Verdín\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 527, 'San Jorge\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 528, 'Sara María Sánchez Ruíz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 529, 'Silver Sky\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 530, 'Teresita\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 531, 'Tres Castillos Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 532, 'Tres Compadres Dos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 533, 'Tumben-Kah\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 534, 'Ulises Arebola Fernández\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 535, 'Villa Rica\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 536, 'Xul-Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 537, 'Isaías\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 538, 'Koox Kool\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 539, 'San Arturo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 540, 'Aldea Kin\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 541, 'Aldea Ha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 542, 'Aldea Kaan\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 543, 'Manuel Jesús Uex Moo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 544, 'El Mezcalito\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 545, 'Mau\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 546, 'Miguel Angel Uc Castillo\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 547, 'Krneth y Linda [Lote 19]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 548, 'Timothy\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 549, 'Ninguno [Lote 33]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 550, 'Lius [Lote 34]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 551, 'Arturo [Lote 35]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 552, 'David [Lote 37]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 553, 'Ninguno [Lote 38]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 554, 'Ninguno [Lote 39 y 40]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 555, 'Ninguno [Lote 41]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 556, 'Ninguno [Lote 42]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 557, 'Breton [Crematorio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 558, 'Los Dos Potrillos\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 559, 'Jaday\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 560, 'Los Carnales [Rancho]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 561, 'Mis dos Amores [Finca]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 562, 'José Cruz\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 563, 'Casa de Playa\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 564, 'Ninguno [Número Cincuenta y Tres]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 565, 'Popol Vuh [Cenote]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 566, 'Rogelio Betancurt\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 567, 'Jaranchach\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 568, 'Moises Alejandro\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 569, 'Carlos Ivan Dzul Zosaya\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 570, 'Franco\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 571, 'El Corchal\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 572, 'San Pedro [Crematorio]\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07'),
(23, 11, 573, 'Miguel Angel Concha\r', '2023-11-23 16:36:07', '2023-11-23 16:36:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espacios_disponibles`
--

CREATE TABLE `espacios_disponibles` (
  `idEspacio` int(10) UNSIGNED NOT NULL,
  `nombreLugar` varchar(50) NOT NULL,
  `tipoEspacio` int(10) UNSIGNED NOT NULL,
  `capacidad` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `idEspecialidad` int(10) UNSIGNED NOT NULL,
  `especialidad` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `estado` varchar(150) NOT NULL,
  `estado_abr` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstado`, `estado`, `estado_abr`, `created_at`, `modified_at`) VALUES
(1, 'Aguascalientes', 'Ags.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(2, 'Baja California', 'BC\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(3, 'Baja California Sur', 'BCS\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(4, 'Campeche', 'Camp.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(5, 'Coahuila de Zaragoza', 'Coah.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(6, 'Colima', 'Col.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(7, 'Chiapas', 'Chis.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(8, 'Chihuahua', 'Chih.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(9, 'Ciudad de México', 'CDMX\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(10, 'Durango', 'Dgo.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(11, 'Guanajuato', 'Gto.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(12, 'Guerrero', 'Gro.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(13, 'Hidalgo', 'Hgo.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(14, 'Jalisco', 'Jal.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(15, 'México', 'Mex.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(16, 'Michoacán de Ocampo', 'Mich.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(17, 'Morelos', 'Mor.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(18, 'Nayarit', 'Nay.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(19, 'Nuevo León', 'NL\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(20, 'Oaxaca', 'Oax.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(21, 'Puebla', 'Pue.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(22, 'Querétaro', 'Qro.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(23, 'Quintana Roo', 'Q.Roo\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(24, 'San Luis Potosí', 'SLP\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(25, 'Sinaloa', 'Sin.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(26, 'Sonora', 'Son.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(27, 'Tabasco', 'Tab.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(28, 'Tamaulipas', 'Tamps.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(29, 'Tlaxcala', 'Tlax.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(30, 'Veracruz de Ignacio de la Llave', 'Ver.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(31, 'Yucatán', 'Yuc.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28'),
(32, 'Zacatecas', 'Zac.\r', '2023-11-23 16:12:28', '2023-11-23 16:12:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados_estudio`
--

CREATE TABLE `grados_estudio` (
  `idGrado` int(10) UNSIGNED NOT NULL,
  `grado` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `idHorario` int(10) UNSIGNED NOT NULL,
  `dia` varchar(10) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `idInstructor` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidoPaterno` varchar(60) NOT NULL,
  `apellidoMaterno` varchar(60) DEFAULT NULL,
  `idGradoEstudio` int(10) UNSIGNED NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor_email`
--

CREATE TABLE `instructor_email` (
  `idInstructor` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor_especialidad`
--

CREATE TABLE `instructor_especialidad` (
  `idInstructor` int(10) UNSIGNED NOT NULL,
  `idEspecialidad` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor_telefono`
--

CREATE TABLE `instructor_telefono` (
  `idInstructor` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `idMunicipio` int(10) UNSIGNED NOT NULL,
  `municipio` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`idEstado`, `idMunicipio`, `municipio`, `created_at`, `modified_at`) VALUES
(1, 1, 'Aguascalientes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 2, 'Asientos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 3, 'Calvillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 4, 'Cosío\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 5, 'Jesús María\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 6, 'Pabellón de Arteaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 7, 'Rincón de Romos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 8, 'San José de Gracia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 9, 'Tepezalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 10, 'El Llano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(1, 11, 'San Francisco de los Romo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(2, 1, 'Ensenada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(2, 2, 'Mexicali\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(2, 3, 'Tecate\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(2, 4, 'Tijuana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(2, 5, 'Playas de Rosarito\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(2, 6, 'San Quintín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(2, 7, 'San Felipe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(3, 1, 'Comondú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(3, 2, 'Mulegé\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(3, 3, 'La Paz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(3, 8, 'Los Cabos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(3, 9, 'Loreto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 1, 'Calkiní\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 2, 'Campeche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 3, 'Carmen\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 4, 'Champotón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 5, 'Hecelchakán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 6, 'Hopelchén\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 7, 'Palizada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 8, 'Tenabo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 9, 'Escárcega\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 10, 'Calakmul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 11, 'Candelaria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 12, 'Seybaplaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(4, 13, 'Dzitbalché\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 1, 'Abasolo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 2, 'Acuña\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 3, 'Allende\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 4, 'Arteaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 5, 'Candela\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 6, 'Castaños\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 7, 'Cuatro Ciénegas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 8, 'Escobedo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 9, 'Francisco I. Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 10, 'Frontera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 11, 'General Cepeda\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 12, 'Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 13, 'Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 14, 'Jiménez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 15, 'Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 16, 'Lamadrid\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 17, 'Matamoros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 18, 'Monclova\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 19, 'Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 20, 'Múzquiz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 21, 'Nadadores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 22, 'Nava\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 23, 'Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 24, 'Parras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 25, 'Piedras Negras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 26, 'Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 27, 'Ramos Arizpe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 28, 'Sabinas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 29, 'Sacramento\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 30, 'Saltillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 31, 'San Buenaventura\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 32, 'San Juan de Sabinas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 33, 'San Pedro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 34, 'Sierra Mojada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 35, 'Torreón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 36, 'Viesca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 37, 'Villa Unión\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(5, 38, 'Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 1, 'Armería\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 2, 'Colima\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 3, 'Comala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 4, 'Coquimatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 5, 'Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 6, 'Ixtlahuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 7, 'Manzanillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 8, 'Minatitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 9, 'Tecomán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(6, 10, 'Villa de Álvarez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 1, 'Acacoyagua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 2, 'Acala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 3, 'Acapetahua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 4, 'Altamirano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 5, 'Amatán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 6, 'Amatenango de la Frontera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 7, 'Amatenango del Valle\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 8, 'Ángel Albino Corzo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 9, 'Arriaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 10, 'Bejucal de Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 11, 'Bella Vista\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 12, 'Berriozábal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 13, 'Bochil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 14, 'El Bosque\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 15, 'Cacahoatán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 16, 'Catazajá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 17, 'Cintalapa de Figueroa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 18, 'Coapilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 19, 'Comitán de Domínguez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 20, 'La Concordia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 21, 'Copainalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 22, 'Chalchihuitán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 23, 'Chamula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 24, 'Chanal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 25, 'Chapultenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 26, 'Chenalhó\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 27, 'Chiapa de Corzo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 28, 'Chiapilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 29, 'Chicoasén\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 30, 'Chicomuselo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 31, 'Chilón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 32, 'Escuintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 33, 'Francisco León\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 34, 'Frontera Comalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 35, 'Frontera Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 36, 'La Grandeza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 37, 'Huehuetán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 38, 'Huixtán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 39, 'Huitiupán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 40, 'Huixtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 41, 'La Independencia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 42, 'Ixhuatán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 43, 'Ixtacomitán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 44, 'Ixtapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 45, 'Ixtapangajoya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 46, 'Jiquipilas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 47, 'Jitotol\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 48, 'Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 49, 'Larráinzar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 50, 'La Libertad\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 51, 'Mapastepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 52, 'Las Margaritas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 53, 'Mazapa de Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 54, 'Mazatán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 55, 'Metapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 56, 'Mitontic\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 57, 'Motozintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 58, 'Nicolás Ruíz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 59, 'Ocosingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 60, 'Ocotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 61, 'Ocozocoautla de Espinosa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 62, 'Ostuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 63, 'Osumacinta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 64, 'Oxchuc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 65, 'Palenque\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 66, 'Pantelhó\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 67, 'Pantepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 68, 'Pichucalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 69, 'Pijijiapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 70, 'El Porvenir\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 71, 'Villa Comaltitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 72, 'Pueblo Nuevo Solistahuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 73, 'Rayón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 74, 'Reforma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 75, 'Las Rosas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 76, 'Sabanilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 77, 'Salto de Agua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 78, 'San Cristóbal de las Casas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 79, 'San Fernando\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 80, 'Siltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 81, 'Simojovel\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 82, 'Sitalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 83, 'Socoltenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 84, 'Solosuchiapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 85, 'Soyaló\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 86, 'Suchiapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 87, 'Suchiate\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 88, 'Sunuapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 89, 'Tapachula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 90, 'Tapalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 91, 'Tapilula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 92, 'Tecpatán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 93, 'Tenejapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 94, 'Teopisca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 96, 'Tila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 97, 'Tonalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 98, 'Totolapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 99, 'La Trinitaria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 100, 'Tumbalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 101, 'Tuxtla Gutiérrez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 102, 'Tuxtla Chico\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 103, 'Tuzantán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 104, 'Tzimol\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 105, 'Unión Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 106, 'Venustiano Carranza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 107, 'Villa Corzo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 108, 'Villaflores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 109, 'Yajalón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 110, 'San Lucas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 111, 'Zinacantán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 112, 'San Juan Cancuc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 113, 'Aldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 114, 'Benemérito de las Américas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 115, 'Maravilla Tenejapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 116, 'Marqués de Comillas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 117, 'Montecristo de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 118, 'San Andrés Duraznal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 119, 'Santiago el Pinar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 120, 'Capitán Luis Ángel Vidal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 121, 'Rincón Chamula San Pedro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 122, 'El Parral\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 123, 'Emiliano Zapata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 124, 'Mezcalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(7, 125, 'Honduras de la Sierra\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 1, 'Ahumada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 2, 'Aldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 3, 'Allende\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 4, 'Aquiles Serdán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 5, 'Ascensión\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 6, 'Bachíniva\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 7, 'Balleza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 8, 'Batopilas de Manuel Gómez Morín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 9, 'Bocoyna\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 10, 'Buenaventura\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 11, 'Camargo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 12, 'Carichí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 13, 'Casas Grandes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 14, 'Coronado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 15, 'Coyame del Sotol\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 16, 'La Cruz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 17, 'Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 18, 'Cusihuiriachi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 19, 'Chihuahua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 20, 'Chínipas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 21, 'Delicias\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 22, 'Dr. Belisario Domínguez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 23, 'Galeana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 24, 'Santa Isabel\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 25, 'Gómez Farías\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 26, 'Gran Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 27, 'Guachochi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 28, 'Guadalupe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 29, 'Guadalupe y Calvo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 30, 'Guazapares\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 31, 'Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 32, 'Hidalgo del Parral\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 33, 'Huejotitán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 34, 'Ignacio Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 35, 'Janos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 36, 'Jiménez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 37, 'Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 38, 'Julimes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 39, 'López\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 40, 'Madera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 41, 'Maguarichi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 42, 'Manuel Benavides\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 43, 'Matachí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 44, 'Matamoros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 45, 'Meoqui\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 46, 'Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 47, 'Moris\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 48, 'Namiquipa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 49, 'Nonoava\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 50, 'Nuevo Casas Grandes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 51, 'Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 52, 'Ojinaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 53, 'Praxedis G. Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 54, 'Riva Palacio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 55, 'Rosales\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 56, 'Rosario\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 57, 'San Francisco de Borja\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 58, 'San Francisco de Conchos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 59, 'San Francisco del Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 60, 'Santa Bárbara\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 61, 'Satevó\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 62, 'Saucillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 63, 'Temósachic\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 64, 'El Tule\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 65, 'Urique\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 66, 'Uruachi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(8, 67, 'Valle de Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 2, 'Azcapotzalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 3, 'Coyoacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 4, 'Cuajimalpa de Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 5, 'Gustavo A. Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 6, 'Iztacalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 7, 'Iztapalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 8, 'La Magdalena Contreras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 9, 'Milpa Alta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 10, 'Álvaro Obregón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 11, 'Tláhuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 12, 'Tlalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 13, 'Xochimilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 14, 'Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 15, 'Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 16, 'Miguel Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(9, 17, 'Venustiano Carranza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 1, 'Canatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 2, 'Canelas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 3, 'Coneto de Comonfort\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 4, 'Cuencamé\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 5, 'Durango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 6, 'General Simón Bolívar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 7, 'Gómez Palacio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 8, 'Guadalupe Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 9, 'Guanaceví\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 10, 'Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 11, 'Indé\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 12, 'Lerdo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 13, 'Mapimí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 14, 'Mezquital\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 15, 'Nazas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 16, 'Nombre de Dios\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 17, 'Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 18, 'El Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 19, 'Otáez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 20, 'Pánuco de Coronado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 21, 'Peñón Blanco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 22, 'Poanas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 23, 'Pueblo Nuevo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 24, 'Rodeo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 25, 'San Bernardo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 26, 'San Dimas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 27, 'San Juan de Guadalupe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 28, 'San Juan del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 29, 'San Luis del Cordero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 30, 'San Pedro del Gallo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 31, 'Santa Clara\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 32, 'Santiago Papasquiaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 33, 'Súchil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 34, 'Tamazula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 35, 'Tepehuanes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 36, 'Tlahualilo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 37, 'Topia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 38, 'Vicente Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(10, 39, 'Nuevo Ideal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 1, 'Abasolo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 2, 'Acámbaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 3, 'San Miguel de Allende\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 4, 'Apaseo el Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 5, 'Apaseo el Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 6, 'Atarjea\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 7, 'Celaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 8, 'Manuel Doblado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 9, 'Comonfort\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 10, 'Coroneo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 11, 'Cortazar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 12, 'Cuerámaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 13, 'Doctor Mora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 14, 'Dolores Hidalgo Cuna de la Independencia Nacional\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 15, 'Guanajuato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 16, 'Huanímaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 17, 'Irapuato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 18, 'Jaral del Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 19, 'Jerécuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 20, 'León\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 21, 'Moroleón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 22, 'Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 23, 'Pénjamo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 24, 'Pueblo Nuevo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 25, 'Purísima del Rincón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 26, 'Romita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 27, 'Salamanca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 28, 'Salvatierra\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 29, 'San Diego de la Unión\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 30, 'San Felipe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 31, 'San Francisco del Rincón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 32, 'San José Iturbide\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 33, 'San Luis de la Paz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 34, 'Santa Catarina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 35, 'Santa Cruz de Juventino Rosas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 36, 'Santiago Maravatío\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 37, 'Silao de la Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 38, 'Tarandacuao\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 39, 'Tarimoro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 40, 'Tierra Blanca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 41, 'Uriangato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 42, 'Valle de Santiago\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 43, 'Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 44, 'Villagrán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 45, 'Xichú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(11, 46, 'Yuriria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 1, 'Acapulco de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 2, 'Ahuacuotzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 3, 'Ajuchitlán del Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 4, 'Alcozauca de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 5, 'Alpoyeca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 6, 'Apaxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 7, 'Arcelia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 8, 'Atenango del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 9, 'Atlamajalcingo del Monte\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 10, 'Atlixtac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 11, 'Atoyac de Álvarez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 12, 'Ayutla de los Libres\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 13, 'Azoyú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 14, 'Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 15, 'Buenavista de Cuéllar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 16, 'Coahuayutla de José María Izazaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 17, 'Cocula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 18, 'Copala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 19, 'Copalillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 20, 'Copanatoyac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 21, 'Coyuca de Benítez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 22, 'Coyuca de Catalán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 23, 'Cuajinicuilapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 24, 'Cualác\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 25, 'Cuautepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 26, 'Cuetzala del Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 27, 'Cutzamala de Pinzón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 28, 'Chilapa de Álvarez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 29, 'Chilpancingo de los Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 30, 'Florencio Villarreal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 31, 'General Canuto A. Neri\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 32, 'General Heliodoro Castillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 33, 'Huamuxtitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 34, 'Huitzuco de los Figueroa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 35, 'Iguala de la Independencia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 36, 'Igualapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 37, 'Ixcateopan de Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 38, 'Zihuatanejo de Azueta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 39, 'Juan R. Escudero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 40, 'Leonardo Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 41, 'Malinaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 42, 'Mártir de Cuilapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 43, 'Metlatónoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 44, 'Mochitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 45, 'Olinalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 46, 'Ometepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 47, 'Pedro Ascencio Alquisiras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 48, 'Petatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 49, 'Pilcaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 50, 'Pungarabato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 51, 'Quechultenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 52, 'San Luis Acatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 53, 'San Marcos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 54, 'San Miguel Totolapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 55, 'Taxco de Alarcón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 56, 'Tecoanapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 57, 'Técpan de Galeana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 58, 'Teloloapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 59, 'Tepecoacuilco de Trujano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 60, 'Tetipac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 61, 'Tixtla de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 62, 'Tlacoachistlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 63, 'Tlacoapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 64, 'Tlalchapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 65, 'Tlalixtaquilla de Maldonado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 66, 'Tlapa de Comonfort\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 67, 'Tlapehuala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 68, 'La Unión de Isidoro Montes de Oca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 69, 'Xalpatláhuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 70, 'Xochihuehuetlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 71, 'Xochistlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 72, 'Zapotitlán Tablas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 73, 'Zirándaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 74, 'Zitlala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 75, 'Eduardo Neri\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 76, 'Acatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 77, 'Marquelia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 78, 'Cochoapa el Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 79, 'José Joaquín de Herrera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 80, 'Juchitán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 81, 'Iliatenco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 82, 'Las Vigas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 83, 'Ñuu Savi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 84, 'Santa Cruz del Rincón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(12, 85, 'San Nicolás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 1, 'Acatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 2, 'Acaxochitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 3, 'Actopan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 4, 'Agua Blanca de Iturbide\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 5, 'Ajacuba\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 6, 'Alfajayucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 7, 'Almoloya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 8, 'Apan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 9, 'El Arenal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 10, 'Atitalaquia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 11, 'Atlapexco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 12, 'Atotonilco el Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 13, 'Atotonilco de Tula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 14, 'Calnali\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 15, 'Cardonal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 16, 'Cuautepec de Hinojosa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 17, 'Chapantongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 18, 'Chapulhuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 19, 'Chilcuautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 20, 'Eloxochitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 21, 'Emiliano Zapata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 22, 'Epazoyucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 23, 'Francisco I. Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 24, 'Huasca de Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 25, 'Huautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 26, 'Huazalingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 27, 'Huehuetla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 28, 'Huejutla de Reyes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 29, 'Huichapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 30, 'Ixmiquilpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 31, 'Jacala de Ledezma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 32, 'Jaltocán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 33, 'Juárez Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 34, 'Lolotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 35, 'Metepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 36, 'San Agustín Metzquititlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 37, 'Metztitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 38, 'Mineral del Chico\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 39, 'Mineral del Monte\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 40, 'La Misión\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 41, 'Mixquiahuala de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 42, 'Molango de Escamilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 43, 'Nicolás Flores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 44, 'Nopala de Villagrán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 45, 'Omitlán de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 46, 'San Felipe Orizatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 47, 'Pacula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 48, 'Pachuca de Soto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 49, 'Pisaflores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 50, 'Progreso de Obregón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 51, 'Mineral de la Reforma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 52, 'San Agustín Tlaxiaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 53, 'San Bartolo Tutotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 54, 'San Salvador\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 55, 'Santiago de Anaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 56, 'Santiago Tulantepec de Lugo Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 57, 'Singuilucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 58, 'Tasquillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 59, 'Tecozautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 60, 'Tenango de Doria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 61, 'Tepeapulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 62, 'Tepehuacán de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 63, 'Tepeji del Río de Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 64, 'Tepetitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 65, 'Tetepango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 66, 'Villa de Tezontepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 67, 'Tezontepec de Aldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 68, 'Tianguistengo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 69, 'Tizayuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 70, 'Tlahuelilpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 71, 'Tlahuiltepa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 72, 'Tlanalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 73, 'Tlanchinol\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 74, 'Tlaxcoapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 75, 'Tolcayuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 76, 'Tula de Allende\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 77, 'Tulancingo de Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 78, 'Xochiatipan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 79, 'Xochicoatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 80, 'Yahualica\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 81, 'Zacualtipán de Ángeles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 82, 'Zapotlán de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 83, 'Zempoala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(13, 84, 'Zimapán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 1, 'Acatic\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 2, 'Acatlán de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 3, 'Ahualulco de Mercado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 4, 'Amacueca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 5, 'Amatitán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 6, 'Ameca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 7, 'San Juanito de Escobedo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 8, 'Arandas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 9, 'El Arenal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 10, 'Atemajac de Brizuela\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 11, 'Atengo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 12, 'Atenguillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 13, 'Atotonilco el Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 14, 'Atoyac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 15, 'Autlán de Navarro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 16, 'Ayotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 17, 'Ayutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 18, 'La Barca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 19, 'Bolaños\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 20, 'Cabo Corrientes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 21, 'Casimiro Castillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 22, 'Cihuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 23, 'Zapotlán el Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 24, 'Cocula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 25, 'Colotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 26, 'Concepción de Buenos Aires\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 27, 'Cuautitlán de García Barragán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 28, 'Cuautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 29, 'Cuquío\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 30, 'Chapala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 31, 'Chimaltitán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 32, 'Chiquilistlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 33, 'Degollado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 34, 'Ejutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 35, 'Encarnación de Díaz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 36, 'Etzatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 37, 'El Grullo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 38, 'Guachinango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 39, 'Guadalajara\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 40, 'Hostotipaquillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 41, 'Huejúcar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 42, 'Huejuquilla el Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 43, 'La Huerta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 44, 'Ixtlahuacán de los Membrillos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 45, 'Ixtlahuacán del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 46, 'Jalostotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 47, 'Jamay\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 48, 'Jesús María\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 49, 'Jilotlán de los Dolores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 50, 'Jocotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 51, 'Juanacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 52, 'Juchitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 53, 'Lagos de Moreno\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 54, 'El Limón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 55, 'Magdalena\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 56, 'Santa María del Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 57, 'La Manzanilla de la Paz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 58, 'Mascota\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 59, 'Mazamitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 60, 'Mexticacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 61, 'Mezquitic\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 62, 'Mixtlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 63, 'Ocotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 64, 'Ojuelos de Jalisco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 65, 'Pihuamo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 66, 'Poncitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 67, 'Puerto Vallarta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 68, 'Villa Purificación\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 69, 'Quitupan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 70, 'El Salto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 71, 'San Cristóbal de la Barranca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 72, 'San Diego de Alejandría\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 73, 'San Juan de los Lagos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 74, 'San Julián\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 75, 'San Marcos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 76, 'San Martín de Bolaños\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 77, 'San Martín Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 78, 'San Miguel el Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 79, 'Gómez Farías\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 80, 'San Sebastián del Oeste\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 81, 'Santa María de los Ángeles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 82, 'Sayula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 83, 'Tala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 84, 'Talpa de Allende\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 85, 'Tamazula de Gordiano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 86, 'Tapalpa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 87, 'Tecalitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 88, 'Tecolotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 89, 'Techaluta de Montenegro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 90, 'Tenamaxtlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 91, 'Teocaltiche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 92, 'Teocuitatlán de Corona\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 93, 'Tepatitlán de Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 94, 'Tequila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 95, 'Teuchitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 96, 'Tizapán el Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 97, 'Tlajomulco de Zúñiga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 98, 'San Pedro Tlaquepaque\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 99, 'Tolimán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 100, 'Tomatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 101, 'Tonalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 102, 'Tonaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 103, 'Tonila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 104, 'Totatiche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 105, 'Tototlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 106, 'Tuxcacuesco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 107, 'Tuxcueca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 108, 'Tuxpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 109, 'Unión de San Antonio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 110, 'Unión de Tula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 111, 'Valle de Guadalupe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 112, 'Valle de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 113, 'San Gabriel\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 114, 'Villa Corona\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 115, 'Villa Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 116, 'Villa Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 117, 'Cañadas de Obregón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 118, 'Yahualica de González Gallo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 119, 'Zacoalco de Torres\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 120, 'Zapopan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 121, 'Zapotiltic\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 122, 'Zapotitlán de Vadillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 123, 'Zapotlán del Rey\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 124, 'Zapotlanejo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(14, 125, 'San Ignacio Cerro Gordo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 1, 'Acambay de Ruíz Castañeda\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 2, 'Acolman\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 3, 'Aculco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 4, 'Almoloya de Alquisiras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 5, 'Almoloya de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 6, 'Almoloya del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 7, 'Amanalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 8, 'Amatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 9, 'Amecameca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 10, 'Apaxco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 11, 'Atenco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 12, 'Atizapán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 13, 'Atizapán de Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 14, 'Atlacomulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 15, 'Atlautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 16, 'Axapusco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 17, 'Ayapango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 18, 'Calimaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 19, 'Capulhuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 20, 'Coacalco de Berriozábal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 21, 'Coatepec Harinas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 22, 'Cocotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 23, 'Coyotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 24, 'Cuautitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 25, 'Chalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 26, 'Chapa de Mota\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 27, 'Chapultepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34');
INSERT INTO `municipios` (`idEstado`, `idMunicipio`, `municipio`, `created_at`, `modified_at`) VALUES
(15, 28, 'Chiautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 29, 'Chicoloapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 30, 'Chiconcuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 31, 'Chimalhuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 32, 'Donato Guerra\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 33, 'Ecatepec de Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 34, 'Ecatzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 35, 'Huehuetoca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 36, 'Hueypoxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 37, 'Huixquilucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 38, 'Isidro Fabela\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 39, 'Ixtapaluca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 40, 'Ixtapan de la Sal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 41, 'Ixtapan del Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 42, 'Ixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 43, 'Xalatlaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 44, 'Jaltenco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 45, 'Jilotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 46, 'Jilotzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 47, 'Jiquipilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 48, 'Jocotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 49, 'Joquicingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 50, 'Juchitepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 51, 'Lerma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 52, 'Malinalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 53, 'Melchor Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 54, 'Metepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 55, 'Mexicaltzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 56, 'Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 57, 'Naucalpan de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 58, 'Nezahualcóyotl\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 59, 'Nextlalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 60, 'Nicolás Romero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 61, 'Nopaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 62, 'Ocoyoacac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 63, 'Ocuilan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 64, 'El Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 65, 'Otumba\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 66, 'Otzoloapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 67, 'Otzolotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 68, 'Ozumba\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 69, 'Papalotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 70, 'La Paz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 71, 'Polotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 72, 'Rayón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 73, 'San Antonio la Isla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 74, 'San Felipe del Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 75, 'San Martín de las Pirámides\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 76, 'San Mateo Atenco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 77, 'San Simón de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 78, 'Santo Tomás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 79, 'Soyaniquilpan de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 80, 'Sultepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 81, 'Tecámac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 82, 'Tejupilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 83, 'Temamatla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 84, 'Temascalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 85, 'Temascalcingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 86, 'Temascaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 87, 'Temoaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 88, 'Tenancingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 89, 'Tenango del Aire\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 90, 'Tenango del Valle\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 91, 'Teoloyucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 92, 'Teotihuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 93, 'Tepetlaoxtoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 94, 'Tepetlixpa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 95, 'Tepotzotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 96, 'Tequixquiac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 97, 'Texcaltitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 98, 'Texcalyacac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 99, 'Texcoco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 100, 'Tezoyuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 101, 'Tianguistenco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 102, 'Timilpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 103, 'Tlalmanalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 104, 'Tlalnepantla de Baz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 105, 'Tlatlaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 106, 'Toluca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 107, 'Tonatico\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 108, 'Tultepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 109, 'Tultitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 110, 'Valle de Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 111, 'Villa de Allende\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 112, 'Villa del Carbón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 113, 'Villa Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 114, 'Villa Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 115, 'Xonacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 116, 'Zacazonapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 117, 'Zacualpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 118, 'Zinacantepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 119, 'Zumpahuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 120, 'Zumpango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 121, 'Cuautitlán Izcalli\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 122, 'Valle de Chalco Solidaridad\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 123, 'Luvianos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 124, 'San José del Rincón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(15, 125, 'Tonanitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 1, 'Acuitzio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 2, 'Aguililla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 3, 'Álvaro Obregón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 4, 'Angamacutiro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 5, 'Angangueo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 6, 'Apatzingán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 7, 'Aporo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 8, 'Aquila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 9, 'Ario\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 10, 'Arteaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 11, 'Briseñas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 12, 'Buenavista\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 13, 'Carácuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 14, 'Coahuayana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 15, 'Coalcomán de Vázquez Pallares\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 16, 'Coeneo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 17, 'Contepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 18, 'Copándaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 19, 'Cotija\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 20, 'Cuitzeo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 21, 'Charapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 22, 'Charo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 23, 'Chavinda\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 24, 'Cherán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 25, 'Chilchota\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 26, 'Chinicuila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 27, 'Chucándiro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 28, 'Churintzio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 29, 'Churumuco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 30, 'Ecuandureo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 31, 'Epitacio Huerta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 32, 'Erongarícuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 33, 'Gabriel Zamora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 34, 'Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 35, 'La Huacana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 36, 'Huandacareo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 37, 'Huaniqueo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 38, 'Huetamo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 39, 'Huiramba\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 40, 'Indaparapeo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 41, 'Irimbo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 42, 'Ixtlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 43, 'Jacona\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 44, 'Jiménez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 45, 'Jiquilpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 46, 'Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 47, 'Jungapeo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 48, 'Lagunillas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 49, 'Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 50, 'Maravatío\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 51, 'Marcos Castellanos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 52, 'Lázaro Cárdenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 53, 'Morelia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 54, 'Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 55, 'Múgica\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 56, 'Nahuatzen\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 57, 'Nocupétaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 58, 'Nuevo Parangaricutiro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 59, 'Nuevo Urecho\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 60, 'Numarán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 61, 'Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 62, 'Pajacuarán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 63, 'Panindícuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 64, 'Parácuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 65, 'Paracho\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 66, 'Pátzcuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 67, 'Penjamillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 68, 'Peribán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 69, 'La Piedad\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 70, 'Purépero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 71, 'Puruándiro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 72, 'Queréndaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 73, 'Quiroga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 74, 'Cojumatlán de Régules\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 75, 'Los Reyes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 76, 'Sahuayo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 77, 'San Lucas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 78, 'Santa Ana Maya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 79, 'Salvador Escalante\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 80, 'Senguio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 81, 'Susupuato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 82, 'Tacámbaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 83, 'Tancítaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 84, 'Tangamandapio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 85, 'Tangancícuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 86, 'Tanhuato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 87, 'Taretan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 88, 'Tarímbaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 89, 'Tepalcatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 90, 'Tingambato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 91, 'Tingüindín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 92, 'Tiquicheo de Nicolás Romero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 93, 'Tlalpujahua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 94, 'Tlazazalca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 95, 'Tocumbo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 96, 'Tumbiscatío\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 97, 'Turicato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 98, 'Tuxpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 99, 'Tuzantla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 100, 'Tzintzuntzan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 101, 'Tzitzio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 102, 'Uruapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 103, 'Venustiano Carranza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 104, 'Villamar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 105, 'Vista Hermosa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 106, 'Yurécuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 107, 'Zacapu\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 108, 'Zamora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 109, 'Zináparo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 110, 'Zinapécuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 111, 'Ziracuaretiro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 112, 'Zitácuaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(16, 113, 'José Sixto Verduzco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 1, 'Amacuzac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 2, 'Atlatlahucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 3, 'Axochiapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 4, 'Ayala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 5, 'Coatlán del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 6, 'Cuautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 7, 'Cuernavaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 8, 'Emiliano Zapata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 9, 'Huitzilac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 10, 'Jantetelco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 11, 'Jiutepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 12, 'Jojutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 13, 'Jonacatepec de Leandro Valle\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 14, 'Mazatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 15, 'Miacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 16, 'Ocuituco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 17, 'Puente de Ixtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 18, 'Temixco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 19, 'Tepalcingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 20, 'Tepoztlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 21, 'Tetecala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 22, 'Tetela del Volcán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 23, 'Tlalnepantla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 24, 'Tlaltizapán de Zapata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 25, 'Tlaquiltenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 26, 'Tlayacapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 27, 'Totolapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 28, 'Xochitepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 29, 'Yautepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 30, 'Yecapixtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 31, 'Zacatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 32, 'Zacualpan de Amilpas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 33, 'Temoac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 34, 'Coatetelco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 35, 'Xoxocotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(17, 36, 'Hueyapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 1, 'Acaponeta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 2, 'Ahuacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 3, 'Amatlán de Cañas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 4, 'Compostela\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 5, 'Huajicori\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 6, 'Ixtlán del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 7, 'Jala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 8, 'Xalisco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 9, 'Del Nayar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 10, 'Rosamorada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 11, 'Ruíz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 12, 'San Blas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 13, 'San Pedro Lagunillas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 14, 'Santa María del Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 15, 'Santiago Ixcuintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 16, 'Tecuala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 17, 'Tepic\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 18, 'Tuxpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 19, 'La Yesca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(18, 20, 'Bahía de Banderas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 1, 'Abasolo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 2, 'Agualeguas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 3, 'Los Aldamas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 4, 'Allende\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 5, 'Anáhuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 6, 'Apodaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 7, 'Aramberri\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 8, 'Bustamante\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 9, 'Cadereyta Jiménez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 10, 'El Carmen\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 11, 'Cerralvo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 12, 'Ciénega de Flores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 13, 'China\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 14, 'Doctor Arroyo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 15, 'Doctor Coss\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 16, 'Doctor González\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 17, 'Galeana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 18, 'García\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 19, 'San Pedro Garza García\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 20, 'General Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 21, 'General Escobedo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 22, 'General Terán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 23, 'General Treviño\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 24, 'General Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 25, 'General Zuazua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 26, 'Guadalupe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 27, 'Los Herreras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 28, 'Higueras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 29, 'Hualahuises\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 30, 'Iturbide\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 31, 'Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 32, 'Lampazos de Naranjo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 33, 'Linares\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 34, 'Marín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 35, 'Melchor Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 36, 'Mier y Noriega\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 37, 'Mina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 38, 'Montemorelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 39, 'Monterrey\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 40, 'Parás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 41, 'Pesquería\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 42, 'Los Ramones\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 43, 'Rayones\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 44, 'Sabinas Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 45, 'Salinas Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 46, 'San Nicolás de los Garza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 47, 'Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 48, 'Santa Catarina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 49, 'Santiago\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 50, 'Vallecillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(19, 51, 'Villaldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 1, 'Abejones\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 2, 'Acatlán de Pérez Figueroa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 3, 'Asunción Cacalotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 4, 'Asunción Cuyotepeji\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 5, 'Asunción Ixtaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 6, 'Asunción Nochixtlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 7, 'Asunción Ocotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 8, 'Asunción Tlacolulita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 9, 'Ayotzintepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 10, 'El Barrio de la Soledad\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 11, 'Calihualá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 12, 'Candelaria Loxicha\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 13, 'Ciénega de Zimatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 14, 'Ciudad Ixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 15, 'Coatecas Altas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 16, 'Coicoyán de las Flores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 17, 'La Compañía\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 18, 'Concepción Buenavista\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 19, 'Concepción Pápalo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 20, 'Constancia del Rosario\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 21, 'Cosolapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 22, 'Cosoltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 23, 'Cuilápam de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 24, 'Cuyamecalco Villa de Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 25, 'Chahuites\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 26, 'Chalcatongo de Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 27, 'Chiquihuitlán de Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 28, 'Heroica Ciudad de Ejutla de Crespo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 29, 'Eloxochitlán de Flores Magón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 30, 'El Espinal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 31, 'Tamazulápam del Espíritu Santo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 32, 'Fresnillo de Trujano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 33, 'Guadalupe Etla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 34, 'Guadalupe de Ramírez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 35, 'Guelatao de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 36, 'Guevea de Humboldt\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 37, 'Mesones Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 38, 'Villa Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 39, 'Heroica Ciudad de Huajuapan de León\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 40, 'Huautepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 41, 'Huautla de Jiménez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 42, 'Ixtlán de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 43, 'Juchitán de Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 44, 'Loma Bonita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 45, 'Magdalena Apasco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 46, 'Magdalena Jaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 47, 'Santa Magdalena Jicotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 48, 'Magdalena Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 49, 'Magdalena Ocotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 50, 'Magdalena Peñasco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 51, 'Magdalena Teitipac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 52, 'Magdalena Tequisistlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 53, 'Magdalena Tlacotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 54, 'Magdalena Zahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 55, 'Mariscala de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 56, 'Mártires de Tacubaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 57, 'Matías Romero Avendaño\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 58, 'Mazatlán Villa de Flores\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 59, 'Miahuatlán de Porfirio Díaz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 60, 'Mixistlán de la Reforma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 61, 'Monjas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 62, 'Natividad\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 63, 'Nazareno Etla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 64, 'Nejapa de Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 65, 'Ixpantepec Nieves\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 66, 'Santiago Niltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 67, 'Oaxaca de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 68, 'Ocotlán de Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 69, 'La Pe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 70, 'Pinotepa de Don Luis\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 71, 'Pluma Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 72, 'San José del Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 73, 'Putla Villa de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 74, 'Santa Catarina Quioquitani\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 75, 'Reforma de Pineda\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 76, 'La Reforma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 77, 'Reyes Etla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 78, 'Rojas de Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 79, 'Salina Cruz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 80, 'San Agustín Amatengo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 81, 'San Agustín Atenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 82, 'San Agustín Chayuco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 83, 'San Agustín de las Juntas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 84, 'San Agustín Etla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 85, 'San Agustín Loxicha\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 86, 'San Agustín Tlacotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 87, 'San Agustín Yatareni\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 88, 'San Andrés Cabecera Nueva\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 89, 'San Andrés Dinicuiti\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 90, 'San Andrés Huaxpaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 91, 'San Andrés Huayápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 92, 'San Andrés Ixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 93, 'San Andrés Lagunas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 94, 'San Andrés Nuxiño\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 95, 'San Andrés Paxtlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 96, 'San Andrés Sinaxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 97, 'San Andrés Solaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 98, 'San Andrés Teotilálpam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 99, 'San Andrés Tepetlapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 100, 'San Andrés Yaá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 101, 'San Andrés Zabache\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 102, 'San Andrés Zautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 103, 'San Antonino Castillo Velasco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 104, 'San Antonino el Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 105, 'San Antonino Monte Verde\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 106, 'San Antonio Acutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 107, 'San Antonio de la Cal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 108, 'San Antonio Huitepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 109, 'San Antonio Nanahuatípam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 110, 'San Antonio Sinicahua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 111, 'San Antonio Tepetlapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 112, 'San Baltazar Chichicápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 113, 'San Baltazar Loxicha\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 114, 'San Baltazar Yatzachi el Bajo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 115, 'San Bartolo Coyotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 116, 'San Bartolomé Ayautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 117, 'San Bartolomé Loxicha\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 118, 'San Bartolomé Quialana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 119, 'San Bartolomé Yucuañe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 120, 'San Bartolomé Zoogocho\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 121, 'San Bartolo Soyaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 122, 'San Bartolo Yautepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 123, 'San Bernardo Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 124, 'Heroica Villa de San Blas Atempa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 125, 'San Carlos Yautepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 126, 'San Cristóbal Amatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 127, 'San Cristóbal Amoltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 128, 'San Cristóbal Lachirioag\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 129, 'San Cristóbal Suchixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 130, 'San Dionisio del Mar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 131, 'San Dionisio Ocotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 132, 'San Dionisio Ocotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 133, 'San Esteban Atatlahuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 134, 'San Felipe Jalapa de Díaz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 135, 'San Felipe Tejalápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 136, 'San Felipe Usila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 137, 'San Francisco Cahuacuá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 138, 'San Francisco Cajonos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 139, 'San Francisco Chapulapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 140, 'San Francisco Chindúa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 141, 'San Francisco del Mar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 142, 'San Francisco Huehuetlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 143, 'San Francisco Ixhuatán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 144, 'San Francisco Jaltepetongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 145, 'San Francisco Lachigoló\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 146, 'San Francisco Logueche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 147, 'San Francisco Nuxaño\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 148, 'San Francisco Ozolotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 149, 'San Francisco Sola\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 150, 'San Francisco Telixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 151, 'San Francisco Teopan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 152, 'San Francisco Tlapancingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 153, 'San Gabriel Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 154, 'San Ildefonso Amatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 155, 'San Ildefonso Sola\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 156, 'San Ildefonso Villa Alta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 157, 'San Jacinto Amilpas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 158, 'San Jacinto Tlacotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 159, 'San Jerónimo Coatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 160, 'San Jerónimo Silacayoapilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 161, 'San Jerónimo Sosola\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 162, 'San Jerónimo Taviche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 163, 'San Jerónimo Tecóatl\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 164, 'San Jorge Nuchita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 165, 'San José Ayuquila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 166, 'San José Chiltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 167, 'San José del Peñasco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 168, 'San José Estancia Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 169, 'San José Independencia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 170, 'San José Lachiguiri\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 171, 'San José Tenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 172, 'San Juan Achiutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 173, 'San Juan Atepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 174, 'Ánimas Trujano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 175, 'San Juan Bautista Atatlahuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 176, 'San Juan Bautista Coixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 177, 'San Juan Bautista Cuicatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 178, 'San Juan Bautista Guelache\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 179, 'San Juan Bautista Jayacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 180, 'San Juan Bautista Lo de Soto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 181, 'San Juan Bautista Suchitepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 182, 'San Juan Bautista Tlacoatzintepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 183, 'San Juan Bautista Tlachichilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 184, 'San Juan Bautista Tuxtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 185, 'San Juan Cacahuatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 186, 'San Juan Cieneguilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 187, 'San Juan Coatzóspam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 188, 'San Juan Colorado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 189, 'San Juan Comaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 190, 'San Juan Cotzocón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 191, 'San Juan Chicomezúchil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 192, 'San Juan Chilateca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 193, 'San Juan del Estado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 194, 'San Juan del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 195, 'San Juan Diuxi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 196, 'San Juan Evangelista Analco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 197, 'San Juan Guelavía\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 198, 'San Juan Guichicovi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 199, 'San Juan Ihualtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 200, 'San Juan Juquila Mixes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 201, 'San Juan Juquila Vijanos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 202, 'San Juan Lachao\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 203, 'San Juan Lachigalla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 204, 'San Juan Lajarcia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 205, 'San Juan Lalana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 206, 'San Juan de los Cués\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 207, 'San Juan Mazatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 208, 'San Juan Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 209, 'San Juan Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 210, 'San Juan Ñumí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 211, 'San Juan Ozolotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 212, 'San Juan Petlapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 213, 'San Juan Quiahije\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 214, 'San Juan Quiotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 215, 'San Juan Sayultepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 216, 'San Juan Tabaá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 217, 'San Juan Tamazola\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 218, 'San Juan Teita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 219, 'San Juan Teitipac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 220, 'San Juan Tepeuxila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 221, 'San Juan Teposcolula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 222, 'San Juan Yaeé\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 223, 'San Juan Yatzona\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 224, 'San Juan Yucuita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 225, 'San Lorenzo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 226, 'San Lorenzo Albarradas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 227, 'San Lorenzo Cacaotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 228, 'San Lorenzo Cuaunecuiltitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 229, 'San Lorenzo Texmelúcan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 230, 'San Lorenzo Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 231, 'San Lucas Camotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 232, 'San Lucas Ojitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 233, 'San Lucas Quiaviní\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 234, 'San Lucas Zoquiápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 235, 'San Luis Amatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 236, 'San Marcial Ozolotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 237, 'San Marcos Arteaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 238, 'San Martín de los Cansecos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 239, 'San Martín Huamelúlpam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 240, 'San Martín Itunyoso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 241, 'San Martín Lachilá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 242, 'San Martín Peras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 243, 'San Martín Tilcajete\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 244, 'San Martín Toxpalan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 245, 'San Martín Zacatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 246, 'San Mateo Cajonos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 247, 'Capulálpam de Méndez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 248, 'San Mateo del Mar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 249, 'San Mateo Yoloxochitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 250, 'San Mateo Etlatongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 251, 'San Mateo Nejápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 252, 'San Mateo Peñasco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 253, 'San Mateo Piñas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 254, 'San Mateo Río Hondo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 255, 'San Mateo Sindihui\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 256, 'San Mateo Tlapiltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 257, 'San Melchor Betaza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 258, 'San Miguel Achiutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 259, 'San Miguel Ahuehuetitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 260, 'San Miguel Aloápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 261, 'San Miguel Amatitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 262, 'San Miguel Amatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 263, 'San Miguel Coatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 264, 'San Miguel Chicahua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 265, 'San Miguel Chimalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 266, 'San Miguel del Puerto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 267, 'San Miguel del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 268, 'San Miguel Ejutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 269, 'San Miguel el Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 270, 'San Miguel Huautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 271, 'San Miguel Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 272, 'San Miguel Panixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 273, 'San Miguel Peras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 274, 'San Miguel Piedras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 275, 'San Miguel Quetzaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 276, 'San Miguel Santa Flor\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 277, 'Villa Sola de Vega\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 278, 'San Miguel Soyaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 279, 'San Miguel Suchixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 280, 'Villa Talea de Castro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 281, 'San Miguel Tecomatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 282, 'San Miguel Tenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 283, 'San Miguel Tequixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 284, 'San Miguel Tilquiápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 285, 'San Miguel Tlacamama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 286, 'San Miguel Tlacotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 287, 'San Miguel Tulancingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 288, 'San Miguel Yotao\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 289, 'San Nicolás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 290, 'San Nicolás Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 291, 'San Pablo Coatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 292, 'San Pablo Cuatro Venados\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 293, 'San Pablo Etla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 294, 'San Pablo Huitzo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 295, 'San Pablo Huixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 296, 'San Pablo Macuiltianguis\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 297, 'San Pablo Tijaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 298, 'San Pablo Villa de Mitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 299, 'San Pablo Yaganiza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 300, 'San Pedro Amuzgos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 301, 'San Pedro Apóstol\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 302, 'San Pedro Atoyac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 303, 'San Pedro Cajonos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 304, 'San Pedro Coxcaltepec Cántaros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 305, 'San Pedro Comitancillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 306, 'San Pedro el Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 307, 'San Pedro Huamelula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 308, 'San Pedro Huilotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 309, 'San Pedro Ixcatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 310, 'San Pedro Ixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 311, 'San Pedro Jaltepetongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 312, 'San Pedro Jicayán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 313, 'San Pedro Jocotipac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 314, 'San Pedro Juchatengo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 315, 'San Pedro Mártir\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 316, 'San Pedro Mártir Quiechapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 317, 'San Pedro Mártir Yucuxaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 318, 'San Pedro Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 319, 'San Pedro Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 320, 'San Pedro Molinos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 321, 'San Pedro Nopala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 322, 'San Pedro Ocopetatillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 323, 'San Pedro Ocotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 324, 'San Pedro Pochutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 325, 'San Pedro Quiatoni\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 326, 'San Pedro Sochiápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 327, 'San Pedro Tapanatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 328, 'San Pedro Taviche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 329, 'San Pedro Teozacoalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 330, 'San Pedro Teutila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 331, 'San Pedro Tidaá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 332, 'San Pedro Topiltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 333, 'San Pedro Totolápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 334, 'Villa de Tututepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 335, 'San Pedro Yaneri\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 336, 'San Pedro Yólox\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 337, 'San Pedro y San Pablo Ayutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 338, 'Villa de Etla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 339, 'San Pedro y San Pablo Teposcolula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 340, 'San Pedro y San Pablo Tequixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 341, 'San Pedro Yucunama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34');
INSERT INTO `municipios` (`idEstado`, `idMunicipio`, `municipio`, `created_at`, `modified_at`) VALUES
(20, 342, 'San Raymundo Jalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 343, 'San Sebastián Abasolo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 344, 'San Sebastián Coatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 345, 'San Sebastián Ixcapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 346, 'San Sebastián Nicananduta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 347, 'San Sebastián Río Hondo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 348, 'San Sebastián Tecomaxtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 349, 'San Sebastián Teitipac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 350, 'San Sebastián Tutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 351, 'San Simón Almolongas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 352, 'San Simón Zahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 353, 'Santa Ana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 354, 'Santa Ana Ateixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 355, 'Santa Ana Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 356, 'Santa Ana del Valle\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 357, 'Santa Ana Tavela\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 358, 'Santa Ana Tlapacoyan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 359, 'Santa Ana Yareni\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 360, 'Santa Ana Zegache\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 361, 'Santa Catalina Quierí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 362, 'Santa Catarina Cuixtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 363, 'Santa Catarina Ixtepeji\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 364, 'Santa Catarina Juquila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 365, 'Santa Catarina Lachatao\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 366, 'Santa Catarina Loxicha\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 367, 'Santa Catarina Mechoacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 368, 'Santa Catarina Minas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 369, 'Santa Catarina Quiané\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 370, 'Santa Catarina Tayata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 371, 'Santa Catarina Ticuá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 372, 'Santa Catarina Yosonotú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 373, 'Santa Catarina Zapoquila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 374, 'Santa Cruz Acatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 375, 'Santa Cruz Amilpas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 376, 'Santa Cruz de Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 377, 'Santa Cruz Itundujia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 378, 'Santa Cruz Mixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 379, 'Santa Cruz Nundaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 380, 'Santa Cruz Papalutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 381, 'Santa Cruz Tacache de Mina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 382, 'Santa Cruz Tacahua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 383, 'Santa Cruz Tayata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 384, 'Santa Cruz Xitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 385, 'Santa Cruz Xoxocotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 386, 'Santa Cruz Zenzontepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 387, 'Santa Gertrudis\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 388, 'Santa Inés del Monte\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 389, 'Santa Inés Yatzeche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 390, 'Santa Lucía del Camino\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 391, 'Santa Lucía Miahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 392, 'Santa Lucía Monteverde\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 393, 'Santa Lucía Ocotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 394, 'Santa María Alotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 395, 'Santa María Apazco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 396, 'Santa María la Asunción\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 397, 'Heroica Ciudad de Tlaxiaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 398, 'Ayoquezco de Aldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 399, 'Santa María Atzompa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 400, 'Santa María Camotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 401, 'Santa María Colotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 402, 'Santa María Cortijo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 403, 'Santa María Coyotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 404, 'Santa María Chachoápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 405, 'Villa de Chilapa de Díaz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 406, 'Santa María Chilchotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 407, 'Santa María Chimalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 408, 'Santa María del Rosario\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 409, 'Santa María del Tule\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 410, 'Santa María Ecatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 411, 'Santa María Guelacé\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 412, 'Santa María Guienagati\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 413, 'Santa María Huatulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 414, 'Santa María Huazolotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 415, 'Santa María Ipalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 416, 'Santa María Ixcatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 417, 'Santa María Jacatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 418, 'Santa María Jalapa del Marqués\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 419, 'Santa María Jaltianguis\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 420, 'Santa María Lachixío\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 421, 'Santa María Mixtequilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 422, 'Santa María Nativitas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 423, 'Santa María Nduayaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 424, 'Santa María Ozolotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 425, 'Santa María Pápalo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 426, 'Santa María Peñoles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 427, 'Santa María Petapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 428, 'Santa María Quiegolani\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 429, 'Santa María Sola\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 430, 'Santa María Tataltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 431, 'Santa María Tecomavaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 432, 'Santa María Temaxcalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 433, 'Santa María Temaxcaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 434, 'Santa María Teopoxco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 435, 'Santa María Tepantlali\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 436, 'Santa María Texcatitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 437, 'Santa María Tlahuitoltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 438, 'Santa María Tlalixtac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 439, 'Santa María Tonameca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 440, 'Santa María Totolapilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 441, 'Santa María Xadani\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 442, 'Santa María Yalina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 443, 'Santa María Yavesía\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 444, 'Santa María Yolotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 445, 'Santa María Yosoyúa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 446, 'Santa María Yucuhiti\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 447, 'Santa María Zacatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 448, 'Santa María Zaniza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 449, 'Santa María Zoquitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 450, 'Santiago Amoltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 451, 'Santiago Apoala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 452, 'Santiago Apóstol\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 453, 'Santiago Astata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 454, 'Santiago Atitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 455, 'Santiago Ayuquililla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 456, 'Santiago Cacaloxtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 457, 'Santiago Camotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 458, 'Santiago Comaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 459, 'Villa de Santiago Chazumba\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 460, 'Santiago Choápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 461, 'Santiago del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 462, 'Santiago Huajolotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 463, 'Santiago Huauclilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 464, 'Santiago Ihuitlán Plumas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 465, 'Santiago Ixcuintepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 466, 'Santiago Ixtayutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 467, 'Santiago Jamiltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 468, 'Santiago Jocotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 469, 'Santiago Juxtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 470, 'Santiago Lachiguiri\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 471, 'Santiago Lalopa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 472, 'Santiago Laollaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 473, 'Santiago Laxopa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 474, 'Santiago Llano Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 475, 'Santiago Matatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 476, 'Santiago Miltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 477, 'Santiago Minas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 478, 'Santiago Nacaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 479, 'Santiago Nejapilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 480, 'Santiago Nundiche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 481, 'Santiago Nuyoó\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 482, 'Santiago Pinotepa Nacional\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 483, 'Santiago Suchilquitongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 484, 'Santiago Tamazola\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 485, 'Santiago Tapextla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 486, 'Villa Tejúpam de la Unión\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 487, 'Santiago Tenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 488, 'Santiago Tepetlapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 489, 'Santiago Tetepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 490, 'Santiago Texcalcingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 491, 'Santiago Textitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 492, 'Santiago Tilantongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 493, 'Santiago Tillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 494, 'Santiago Tlazoyaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 495, 'Santiago Xanica\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 496, 'Santiago Xiacuí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 497, 'Santiago Yaitepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 498, 'Santiago Yaveo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 499, 'Santiago Yolomécatl\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 500, 'Santiago Yosondúa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 501, 'Santiago Yucuyachi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 502, 'Santiago Zacatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 503, 'Santiago Zoochila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 504, 'Nuevo Zoquiápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 505, 'Santo Domingo Ingenio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 506, 'Santo Domingo Albarradas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 507, 'Santo Domingo Armenta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 508, 'Santo Domingo Chihuitán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 509, 'Santo Domingo de Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 510, 'Santo Domingo Ixcatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 511, 'Santo Domingo Nuxaá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 512, 'Santo Domingo Ozolotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 513, 'Santo Domingo Petapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 514, 'Santo Domingo Roayaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 515, 'Santo Domingo Tehuantepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 516, 'Santo Domingo Teojomulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 517, 'Santo Domingo Tepuxtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 518, 'Santo Domingo Tlatayápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 519, 'Santo Domingo Tomaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 520, 'Santo Domingo Tonalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 521, 'Santo Domingo Tonaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 522, 'Santo Domingo Xagacía\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 523, 'Santo Domingo Yanhuitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 524, 'Santo Domingo Yodohino\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 525, 'Santo Domingo Zanatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 526, 'Santos Reyes Nopala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 527, 'Santos Reyes Pápalo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 528, 'Santos Reyes Tepejillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 529, 'Santos Reyes Yucuná\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 530, 'Santo Tomás Jalieza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 531, 'Santo Tomás Mazaltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 532, 'Santo Tomás Ocotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 533, 'Santo Tomás Tamazulapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 534, 'San Vicente Coatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 535, 'San Vicente Lachixío\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 536, 'San Vicente Nuñú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 537, 'Silacayoápam\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 538, 'Sitio de Xitlapehua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 539, 'Soledad Etla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 540, 'Villa de Tamazulápam del Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 541, 'Tanetze de Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 542, 'Taniche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 543, 'Tataltepec de Valdés\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 544, 'Teococuilco de Marcos Pérez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 545, 'Teotitlán de Flores Magón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 546, 'Teotitlán del Valle\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 547, 'Teotongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 548, 'Tepelmeme Villa de Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 549, 'Heroica Villa Tezoatlán de Segura y Luna\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 550, 'San Jerónimo Tlacochahuaya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 551, 'Tlacolula de Matamoros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 552, 'Tlacotepec Plumas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 553, 'Tlalixtac de Cabrera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 554, 'Totontepec Villa de Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 555, 'Trinidad Zaachila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 556, 'La Trinidad Vista Hermosa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 557, 'Unión Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 558, 'Valerio Trujano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 559, 'San Juan Bautista Valle Nacional\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 560, 'Villa Díaz Ordaz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 561, 'Yaxe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 562, 'Magdalena Yodocono de Porfirio Díaz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 563, 'Yogana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 564, 'Yutanduchi de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 565, 'Villa de Zaachila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 566, 'San Mateo Yucutindoo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 567, 'Zapotitlán Lagunas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 568, 'Zapotitlán Palmas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 569, 'Santa Inés de Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(20, 570, 'Zimatlán de Álvarez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 1, 'Acajete\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 2, 'Acateno\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 3, 'Acatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 4, 'Acatzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 5, 'Acteopan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 6, 'Ahuacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 7, 'Ahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 8, 'Ahuazotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 9, 'Ahuehuetitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 10, 'Ajalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 11, 'Albino Zertuche\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 12, 'Aljojuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 13, 'Altepexi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 14, 'Amixtlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 15, 'Amozoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 16, 'Aquixtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 17, 'Atempan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 18, 'Atexcal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 19, 'Atlixco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 20, 'Atoyatempan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 21, 'Atzala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 22, 'Atzitzihuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 23, 'Atzitzintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 24, 'Axutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 25, 'Ayotoxco de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 26, 'Calpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 27, 'Caltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 28, 'Camocuautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 29, 'Caxhuacan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 30, 'Coatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 31, 'Coatzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 32, 'Cohetzala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 33, 'Cohuecan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 34, 'Coronango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 35, 'Coxcatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 36, 'Coyomeapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 37, 'Coyotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 38, 'Cuapiaxtla de Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 39, 'Cuautempan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 40, 'Cuautinchán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 41, 'Cuautlancingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 42, 'Cuayuca de Andrade\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 43, 'Cuetzalan del Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 44, 'Cuyoaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 45, 'Chalchicomula de Sesma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 46, 'Chapulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 47, 'Chiautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 48, 'Chiautzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 49, 'Chiconcuautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 50, 'Chichiquila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 51, 'Chietla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 52, 'Chigmecatitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 53, 'Chignahuapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 54, 'Chignautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 55, 'Chila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 56, 'Chila de la Sal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 57, 'Honey\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 58, 'Chilchotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 59, 'Chinantla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 60, 'Domingo Arenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 61, 'Eloxochitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 62, 'Epatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 63, 'Esperanza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 64, 'Francisco Z. Mena\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 65, 'General Felipe Ángeles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 66, 'Guadalupe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 67, 'Guadalupe Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 68, 'Hermenegildo Galeana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 69, 'Huaquechula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 70, 'Huatlatlauca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 71, 'Huauchinango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 72, 'Huehuetla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 73, 'Huehuetlán el Chico\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 74, 'Huejotzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 75, 'Hueyapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 76, 'Hueytamalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 77, 'Hueytlalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 78, 'Huitzilan de Serdán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 79, 'Huitziltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 80, 'Atlequizayan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 81, 'Ixcamilpa de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 82, 'Ixcaquixtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 83, 'Ixtacamaxtitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 84, 'Ixtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 85, 'Izúcar de Matamoros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 86, 'Jalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 87, 'Jolalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 88, 'Jonotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 89, 'Jopala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 90, 'Juan C. Bonilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 91, 'Juan Galindo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 92, 'Juan N. Méndez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 93, 'Lafragua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 94, 'Libres\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 95, 'La Magdalena Tlatlauquitepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 96, 'Mazapiltepec de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 97, 'Mixtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 98, 'Molcaxac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 99, 'Cañada Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 100, 'Naupan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 101, 'Nauzontla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 102, 'Nealtican\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 103, 'Nicolás Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 104, 'Nopalucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 105, 'Ocotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 106, 'Ocoyucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 107, 'Olintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 108, 'Oriental\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 109, 'Pahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 110, 'Palmar de Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 111, 'Pantepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 112, 'Petlalcingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 113, 'Piaxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 114, 'Puebla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 115, 'Quecholac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 116, 'Quimixtlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 117, 'Rafael Lara Grajales\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 118, 'Los Reyes de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 119, 'San Andrés Cholula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 120, 'San Antonio Cañada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 121, 'San Diego la Mesa Tochimiltzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 122, 'San Felipe Teotlalcingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 123, 'San Felipe Tepatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 124, 'San Gabriel Chilac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 125, 'San Gregorio Atzompa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 126, 'San Jerónimo Tecuanipan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 127, 'San Jerónimo Xayacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 128, 'San José Chiapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 129, 'San José Miahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 130, 'San Juan Atenco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 131, 'San Juan Atzompa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 132, 'San Martín Texmelucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 133, 'San Martín Totoltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 134, 'San Matías Tlalancaleca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 135, 'San Miguel Ixitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 136, 'San Miguel Xoxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 137, 'San Nicolás Buenos Aires\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 138, 'San Nicolás de los Ranchos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 139, 'San Pablo Anicano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 140, 'San Pedro Cholula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 141, 'San Pedro Yeloixtlahuaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 142, 'San Salvador el Seco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 143, 'San Salvador el Verde\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 144, 'San Salvador Huixcolotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 145, 'San Sebastián Tlacotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 146, 'Santa Catarina Tlaltempan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 147, 'Santa Inés Ahuatempan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 148, 'Santa Isabel Cholula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 149, 'Santiago Miahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 150, 'Huehuetlán el Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 151, 'Santo Tomás Hueyotlipan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 152, 'Soltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 153, 'Tecali de Herrera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 154, 'Tecamachalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 155, 'Tecomatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 156, 'Tehuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 157, 'Tehuitzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 158, 'Tenampulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 159, 'Teopantlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 160, 'Teotlalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 161, 'Tepanco de López\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 162, 'Tepango de Rodríguez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 163, 'Tepatlaxco de Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 164, 'Tepeaca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 165, 'Tepemaxalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 166, 'Tepeojuma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 167, 'Tepetzintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 168, 'Tepexco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 169, 'Tepexi de Rodríguez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 170, 'Tepeyahualco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 171, 'Tepeyahualco de Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 172, 'Tetela de Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 173, 'Teteles de Ávila Castillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 174, 'Teziutlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 175, 'Tianguismanalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 176, 'Tilapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 177, 'Tlacotepec de Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 178, 'Tlacuilotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 179, 'Tlachichuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 180, 'Tlahuapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 181, 'Tlaltenango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 182, 'Tlanepantla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 183, 'Tlaola\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 184, 'Tlapacoya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 185, 'Tlapanalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 186, 'Tlatlauquitepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 187, 'Tlaxco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 188, 'Tochimilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 189, 'Tochtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 190, 'Totoltepec de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 191, 'Tulcingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 192, 'Tuzamapan de Galeana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 193, 'Tzicatlacoyan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 194, 'Venustiano Carranza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 195, 'Vicente Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 196, 'Xayacatlán de Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 197, 'Xicotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 198, 'Xicotlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 199, 'Xiutetelco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 200, 'Xochiapulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 201, 'Xochiltepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 202, 'Xochitlán de Vicente Suárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 203, 'Xochitlán Todos Santos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 204, 'Yaonáhuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 205, 'Yehualtepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 206, 'Zacapala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 207, 'Zacapoaxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 208, 'Zacatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 209, 'Zapotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 210, 'Zapotitlán de Méndez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 211, 'Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 212, 'Zautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 213, 'Zihuateutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 214, 'Zinacatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 215, 'Zongozotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 216, 'Zoquiapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(21, 217, 'Zoquitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 1, 'Amealco de Bonfil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 2, 'Pinal de Amoles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 3, 'Arroyo Seco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 4, 'Cadereyta de Montes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 5, 'Colón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 6, 'Corregidora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 7, 'Ezequiel Montes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 8, 'Huimilpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 9, 'Jalpan de Serra\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 10, 'Landa de Matamoros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 11, 'El Marqués\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 12, 'Pedro Escobedo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 13, 'Peñamiller\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 14, 'Querétaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 15, 'San Joaquín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 16, 'San Juan del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 17, 'Tequisquiapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(22, 18, 'Tolimán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 1, 'Cozumel\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 2, 'Felipe Carrillo Puerto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 3, 'Isla Mujeres\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 4, 'Othón P. Blanco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 5, 'Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 6, 'José María Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 7, 'Lázaro Cárdenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 8, 'Solidaridad\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 9, 'Tulum\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 10, 'Bacalar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(23, 11, 'Puerto Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 1, 'Ahualulco del Sonido 13\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 2, 'Alaquines\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 3, 'Aquismón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 4, 'Armadillo de los Infante\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 5, 'Cárdenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 6, 'Catorce\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 7, 'Cedral\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 8, 'Cerritos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 9, 'Cerro de San Pedro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 10, 'Ciudad del Maíz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 11, 'Ciudad Fernández\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 12, 'Tancanhuitz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 13, 'Ciudad Valles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 14, 'Coxcatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 15, 'Charcas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 16, 'Ebano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 17, 'Guadalcázar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 18, 'Huehuetlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 19, 'Lagunillas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 20, 'Matehuala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 21, 'Mexquitic de Carmona\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 22, 'Moctezuma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 23, 'Rayón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 24, 'Rioverde\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 25, 'Salinas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 26, 'San Antonio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 27, 'San Ciro de Acosta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 28, 'San Luis Potosí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 29, 'San Martín Chalchicuautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 30, 'San Nicolás Tolentino\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 31, 'Santa Catarina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 32, 'Santa María del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 33, 'Santo Domingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 34, 'San Vicente Tancuayalab\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 35, 'Soledad de Graciano Sánchez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 36, 'Tamasopo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 37, 'Tamazunchale\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 38, 'Tampacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 39, 'Tampamolón Corona\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 40, 'Tamuín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 41, 'Tanlajás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 42, 'Tanquián de Escobedo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 43, 'Tierra Nueva\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 44, 'Vanegas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 45, 'Venado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 46, 'Villa de Arriaga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 47, 'Villa de Guadalupe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 48, 'Villa de la Paz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 49, 'Villa de Ramos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 50, 'Villa de Reyes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 51, 'Villa Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 52, 'Villa Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 53, 'Axtla de Terrazas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 54, 'Xilitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 55, 'Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 56, 'Villa de Arista\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 57, 'Matlapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(24, 58, 'El Naranjo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 1, 'Ahome\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 2, 'Angostura\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 3, 'Badiraguato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 4, 'Concordia\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 5, 'Cosalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 6, 'Culiacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 7, 'Choix\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 8, 'Elota\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 9, 'Escuinapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 10, 'El Fuerte\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 11, 'Guasave\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 12, 'Mazatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 13, 'Mocorito\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 14, 'Rosario\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 15, 'Salvador Alvarado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 16, 'San Ignacio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 17, 'Sinaloa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(25, 18, 'Navolato\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 1, 'Aconchi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 2, 'Agua Prieta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 3, 'Álamos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 4, 'Altar\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 5, 'Arivechi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 6, 'Arizpe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 7, 'Atil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 8, 'Bacadéhuachi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 9, 'Bacanora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 10, 'Bacerac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 11, 'Bacoachi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 12, 'Bácum\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 13, 'Banámichi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 14, 'Baviácora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 15, 'Bavispe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 16, 'Benjamín Hill\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 17, 'Caborca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 18, 'Cajeme\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 19, 'Cananea\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 20, 'Carbó\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 21, 'La Colorada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 22, 'Cucurpe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 23, 'Cumpas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 24, 'Divisaderos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 25, 'Empalme\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 26, 'Etchojoa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 27, 'Fronteras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 28, 'Granados\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 29, 'Guaymas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 30, 'Hermosillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 31, 'Huachinera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 32, 'Huásabas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 33, 'Huatabampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 34, 'Huépac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 35, 'Imuris\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 36, 'Magdalena\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 37, 'Mazatán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 38, 'Moctezuma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 39, 'Naco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 40, 'Nácori Chico\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 41, 'Nacozari de García\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 42, 'Navojoa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 43, 'Nogales\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 44, 'Ónavas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 45, 'Opodepe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 46, 'Oquitoa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 47, 'Pitiquito\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 48, 'Puerto Peñasco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 49, 'Quiriego\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 50, 'Rayón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 51, 'Rosario\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 52, 'Sahuaripa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 53, 'San Felipe de Jesús\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 54, 'San Javier\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 55, 'San Luis Río Colorado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 56, 'San Miguel de Horcasitas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 57, 'San Pedro de la Cueva\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 58, 'Santa Ana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 59, 'Santa Cruz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 60, 'Sáric\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 61, 'Soyopa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 62, 'Suaqui Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 63, 'Tepache\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 64, 'Trincheras\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 65, 'Tubutama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 66, 'Ures\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 67, 'Villa Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 68, 'Villa Pesqueira\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 69, 'Yécora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 70, 'General Plutarco Elías Calles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 71, 'Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(26, 72, 'San Ignacio Río Muerto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 1, 'Balancán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 2, 'Cárdenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 3, 'Centla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 4, 'Centro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 5, 'Comalcalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 6, 'Cunduacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 7, 'Emiliano Zapata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 8, 'Huimanguillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 9, 'Jalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 10, 'Jalpa de Méndez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 11, 'Jonuta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 12, 'Macuspana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 13, 'Nacajuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 14, 'Paraíso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 15, 'Tacotalpa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 16, 'Teapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(27, 17, 'Tenosique\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 1, 'Abasolo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 2, 'Aldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 3, 'Altamira\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 4, 'Antiguo Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 5, 'Burgos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 6, 'Bustamante\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 7, 'Camargo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 8, 'Casas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 9, 'Ciudad Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 10, 'Cruillas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 11, 'Gómez Farías\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 12, 'González\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 13, 'Güémez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 14, 'Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 15, 'Gustavo Díaz Ordaz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 16, 'Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 17, 'Jaumave\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 18, 'Jiménez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 19, 'Llera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 20, 'Mainero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 21, 'El Mante\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 22, 'Matamoros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 23, 'Méndez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 24, 'Mier\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 25, 'Miguel Alemán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34');
INSERT INTO `municipios` (`idEstado`, `idMunicipio`, `municipio`, `created_at`, `modified_at`) VALUES
(28, 26, 'Miquihuana\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 27, 'Nuevo Laredo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 28, 'Nuevo Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 29, 'Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 30, 'Padilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 31, 'Palmillas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 32, 'Reynosa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 33, 'Río Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 34, 'San Carlos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 35, 'San Fernando\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 36, 'San Nicolás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 37, 'Soto la Marina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 38, 'Tampico\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 39, 'Tula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 40, 'Valle Hermoso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 41, 'Victoria\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 42, 'Villagrán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(28, 43, 'Xicoténcatl\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 1, 'Amaxac de Guerrero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 2, 'Apetatitlán de Antonio Carvajal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 3, 'Atlangatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 4, 'Atltzayanca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 5, 'Apizaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 6, 'Calpulalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 7, 'El Carmen Tequexquitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 8, 'Cuapiaxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 9, 'Cuaxomulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 10, 'Chiautempan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 11, 'Muñoz de Domingo Arenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 12, 'Españita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 13, 'Huamantla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 14, 'Hueyotlipan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 15, 'Ixtacuixtla de Mariano Matamoros\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 16, 'Ixtenco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 17, 'Mazatecochco de José María Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 18, 'Contla de Juan Cuamatzi\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 19, 'Tepetitla de Lardizábal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 20, 'Sanctórum de Lázaro Cárdenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 21, 'Nanacamilpa de Mariano Arista\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 22, 'Acuamanala de Miguel Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 23, 'Natívitas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 24, 'Panotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 25, 'San Pablo del Monte\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 26, 'Santa Cruz Tlaxcala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 27, 'Tenancingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 28, 'Teolocholco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 29, 'Tepeyanco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 30, 'Terrenate\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 31, 'Tetla de la Solidaridad\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 32, 'Tetlatlahuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 33, 'Tlaxcala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 34, 'Tlaxco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 35, 'Tocatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 36, 'Totolac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 37, 'Ziltlaltépec de Trinidad Sánchez Santos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 38, 'Tzompantepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 39, 'Xaloztoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 40, 'Xaltocan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 41, 'Papalotla de Xicohténcatl\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 42, 'Xicohtzinco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 43, 'Yauhquemehcan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 44, 'Zacatelco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 45, 'Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 46, 'Emiliano Zapata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 47, 'Lázaro Cárdenas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 48, 'La Magdalena Tlaltelulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 49, 'San Damián Texóloc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 50, 'San Francisco Tetlanohcan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 51, 'San Jerónimo Zacualpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 52, 'San José Teacalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 53, 'San Juan Huactzinco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 54, 'San Lorenzo Axocomanitla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 55, 'San Lucas Tecopilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 56, 'Santa Ana Nopalucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 57, 'Santa Apolonia Teacalco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 58, 'Santa Catarina Ayometla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 59, 'Santa Cruz Quilehtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(29, 60, 'Santa Isabel Xiloxoxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 1, 'Acajete\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 2, 'Acatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 3, 'Acayucan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 4, 'Actopan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 5, 'Acula\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 6, 'Acultzingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 7, 'Camarón de Tejeda\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 8, 'Alpatláhuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 9, 'Alto Lucero de Gutiérrez Barrios\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 10, 'Altotonga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 11, 'Alvarado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 12, 'Amatitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 13, 'Naranjos Amatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 14, 'Amatlán de los Reyes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 15, 'Angel R. Cabada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 16, 'La Antigua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 17, 'Apazapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 18, 'Aquila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 19, 'Astacinga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 20, 'Atlahuilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 21, 'Atoyac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 22, 'Atzacan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 23, 'Atzalan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 24, 'Tlaltetela\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 25, 'Ayahualulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 26, 'Banderilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 27, 'Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 28, 'Boca del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 29, 'Calcahualco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 30, 'Camerino Z. Mendoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 31, 'Carrillo Puerto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 32, 'Catemaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 33, 'Cazones de Herrera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 34, 'Cerro Azul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 35, 'Citlaltépetl\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 36, 'Coacoatzintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 37, 'Coahuitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 38, 'Coatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 39, 'Coatzacoalcos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 40, 'Coatzintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 41, 'Coetzala\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 42, 'Colipa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 43, 'Comapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 44, 'Córdoba\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 45, 'Cosamaloapan de Carpio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 46, 'Cosautlán de Carvajal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 47, 'Coscomatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 48, 'Cosoleacaque\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 49, 'Cotaxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 50, 'Coxquihui\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 51, 'Coyutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 52, 'Cuichapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 53, 'Cuitláhuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 54, 'Chacaltianguis\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 55, 'Chalma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 56, 'Chiconamel\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 57, 'Chiconquiaco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 58, 'Chicontepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 59, 'Chinameca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 60, 'Chinampa de Gorostiza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 61, 'Las Choapas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 62, 'Chocamán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 63, 'Chontla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 64, 'Chumatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 65, 'Emiliano Zapata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 66, 'Espinal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 67, 'Filomeno Mata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 68, 'Fortín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 69, 'Gutiérrez Zamora\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 70, 'Hidalgotitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 71, 'Huatusco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 72, 'Huayacocotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 73, 'Hueyapan de Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 74, 'Huiloapan de Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 75, 'Ignacio de la Llave\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 76, 'Ilamatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 77, 'Isla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 78, 'Ixcatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 79, 'Ixhuacán de los Reyes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 80, 'Ixhuatlán del Café\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 81, 'Ixhuatlancillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 82, 'Ixhuatlán del Sureste\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 83, 'Ixhuatlán de Madero\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 84, 'Ixmatlahuacan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 85, 'Ixtaczoquitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 86, 'Jalacingo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 87, 'Xalapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 88, 'Jalcomulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 89, 'Jáltipan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 90, 'Jamapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 91, 'Jesús Carranza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 92, 'Xico\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 93, 'Jilotepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 94, 'Juan Rodríguez Clara\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 95, 'Juchique de Ferrer\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 96, 'Landero y Coss\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 97, 'Lerdo de Tejada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 98, 'Magdalena\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 99, 'Maltrata\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 100, 'Manlio Fabio Altamirano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 101, 'Mariano Escobedo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 102, 'Martínez de la Torre\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 103, 'Mecatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 104, 'Mecayapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 105, 'Medellín de Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 106, 'Miahuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 107, 'Las Minas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 108, 'Minatitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 109, 'Misantla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 110, 'Mixtla de Altamirano\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 111, 'Moloacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 112, 'Naolinco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 113, 'Naranjal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 114, 'Nautla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 115, 'Nogales\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 116, 'Oluta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 117, 'Omealca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 118, 'Orizaba\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 119, 'Otatitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 120, 'Oteapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 121, 'Ozuluama de Mascareñas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 122, 'Pajapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 123, 'Pánuco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 124, 'Papantla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 125, 'Paso del Macho\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 126, 'Paso de Ovejas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 127, 'La Perla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 128, 'Perote\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 129, 'Platón Sánchez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 130, 'Playa Vicente\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 131, 'Poza Rica de Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 132, 'Las Vigas de Ramírez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 133, 'Pueblo Viejo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 134, 'Puente Nacional\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 135, 'Rafael Delgado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 136, 'Rafael Lucio\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 137, 'Los Reyes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 138, 'Río Blanco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 139, 'Saltabarranca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 140, 'San Andrés Tenejapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 141, 'San Andrés Tuxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 142, 'San Juan Evangelista\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 143, 'Santiago Tuxtla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 144, 'Sayula de Alemán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 145, 'Soconusco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 146, 'Sochiapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 147, 'Soledad Atzompa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 148, 'Soledad de Doblado\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 149, 'Soteapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 150, 'Tamalín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 151, 'Tamiahua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 152, 'Tampico Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 153, 'Tancoco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 154, 'Tantima\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 155, 'Tantoyuca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 156, 'Tatatila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 157, 'Castillo de Teayo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 158, 'Tecolutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 159, 'Tehuipango\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 160, 'Álamo Temapache\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 161, 'Tempoal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 162, 'Tenampa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 163, 'Tenochtitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 164, 'Teocelo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 165, 'Tepatlaxco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 166, 'Tepetlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 167, 'Tepetzintla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 168, 'Tequila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 169, 'José Azueta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 170, 'Texcatepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 171, 'Texhuacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 172, 'Texistepec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 173, 'Tezonapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 174, 'Tierra Blanca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 175, 'Tihuatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 176, 'Tlacojalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 177, 'Tlacolulan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 178, 'Tlacotalpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 179, 'Tlacotepec de Mejía\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 180, 'Tlachichilco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 181, 'Tlalixcoyan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 182, 'Tlalnelhuayocan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 183, 'Tlapacoyan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 184, 'Tlaquilpa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 185, 'Tlilapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 186, 'Tomatlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 187, 'Tonayán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 188, 'Totutla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 189, 'Tuxpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 190, 'Tuxtilla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 191, 'Ursulo Galván\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 192, 'Vega de Alatorre\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 193, 'Veracruz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 194, 'Villa Aldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 195, 'Xoxocotla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 196, 'Yanga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 197, 'Yecuatla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 198, 'Zacualpan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 199, 'Zaragoza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 200, 'Zentla\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 201, 'Zongolica\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 202, 'Zontecomatlán de López y Fuentes\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 203, 'Zozocolco de Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 204, 'Agua Dulce\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 205, 'El Higo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 206, 'Nanchital de Lázaro Cárdenas del Río\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 207, 'Tres Valles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 208, 'Carlos A. Carrillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 209, 'Tatahuicapan de Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 210, 'Uxpanapa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 211, 'San Rafael\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(30, 212, 'Santiago Sochiapan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 1, 'Abalá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 2, 'Acanceh\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 3, 'Akil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 4, 'Baca\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 5, 'Bokobá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 6, 'Buctzotz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 7, 'Cacalchén\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 8, 'Calotmul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 9, 'Cansahcab\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 10, 'Cantamayec\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 11, 'Celestún\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 12, 'Cenotillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 13, 'Conkal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 14, 'Cuncunul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 15, 'Cuzamá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 16, 'Chacsinkín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 17, 'Chankom\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 18, 'Chapab\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 19, 'Chemax\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 20, 'Chicxulub Pueblo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 21, 'Chichimilá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 22, 'Chikindzonot\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 23, 'Chocholá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 24, 'Chumayel\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 25, 'Dzan\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 26, 'Dzemul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 27, 'Dzidzantún\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 28, 'Dzilam de Bravo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 29, 'Dzilam González\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 30, 'Dzitás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 31, 'Dzoncauich\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 32, 'Espita\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 33, 'Halachó\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 34, 'Hocabá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 35, 'Hoctún\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 36, 'Homún\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 37, 'Huhí\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 38, 'Hunucmá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 39, 'Ixil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 40, 'Izamal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 41, 'Kanasín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 42, 'Kantunil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 43, 'Kaua\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 44, 'Kinchil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 45, 'Kopomá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 46, 'Mama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 47, 'Maní\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 48, 'Maxcanú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 49, 'Mayapán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 50, 'Mérida\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 51, 'Mocochá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 52, 'Motul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 53, 'Muna\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 54, 'Muxupip\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 55, 'Opichén\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 56, 'Oxkutzcab\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 57, 'Panabá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 58, 'Peto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 59, 'Progreso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 60, 'Quintana Roo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 61, 'Río Lagartos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 62, 'Sacalum\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 63, 'Samahil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 64, 'Sanahcat\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 65, 'San Felipe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 66, 'Santa Elena\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 67, 'Seyé\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 68, 'Sinanché\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 69, 'Sotuta\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 70, 'Sucilá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 71, 'Sudzal\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 72, 'Suma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 73, 'Tahdziú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 74, 'Tahmek\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 75, 'Teabo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 76, 'Tecoh\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 77, 'Tekal de Venegas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 78, 'Tekantó\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 79, 'Tekax\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 80, 'Tekit\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 81, 'Tekom\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 82, 'Telchac Pueblo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 83, 'Telchac Puerto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 84, 'Temax\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 85, 'Temozón\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 86, 'Tepakán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 87, 'Tetiz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 88, 'Teya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 89, 'Ticul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 90, 'Timucuy\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 91, 'Tinum\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 92, 'Tixcacalcupul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 93, 'Tixkokob\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 94, 'Tixmehuac\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 95, 'Tixpéhual\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 96, 'Tizimín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 97, 'Tunkás\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 98, 'Tzucacab\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 99, 'Uayma\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 100, 'Ucú\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 101, 'Umán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 102, 'Valladolid\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 103, 'Xocchel\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 104, 'Yaxcabá\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 105, 'Yaxkukul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(31, 106, 'Yobaín\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 1, 'Apozol\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 2, 'Apulco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 3, 'Atolinga\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 4, 'Benito Juárez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 5, 'Calera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 6, 'Cañitas de Felipe Pescador\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 7, 'Concepción del Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 8, 'Cuauhtémoc\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 9, 'Chalchihuites\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 10, 'Fresnillo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 11, 'Trinidad García de la Cadena\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 12, 'Genaro Codina\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 13, 'General Enrique Estrada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 14, 'General Francisco R. Murguía\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 15, 'El Plateado de Joaquín Amaro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 16, 'General Pánfilo Natera\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 17, 'Guadalupe\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 18, 'Huanusco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 19, 'Jalpa\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 20, 'Jerez\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 21, 'Jiménez del Teul\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 22, 'Juan Aldama\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 23, 'Juchipila\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 24, 'Loreto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 25, 'Luis Moya\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 26, 'Mazapil\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 27, 'Melchor Ocampo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 28, 'Mezquital del Oro\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 29, 'Miguel Auza\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 30, 'Momax\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 31, 'Monte Escobedo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 32, 'Morelos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 33, 'Moyahua de Estrada\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 34, 'Nochistlán de Mejía\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 35, 'Noria de Ángeles\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 36, 'Ojocaliente\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 37, 'Pánuco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 38, 'Pinos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 39, 'Río Grande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 40, 'Sain Alto\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 41, 'El Salvador\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 42, 'Sombrerete\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 43, 'Susticacán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 44, 'Tabasco\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 45, 'Tepechitlán\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 46, 'Tepetongo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 47, 'Teúl de González Ortega\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 48, 'Tlaltenango de Sánchez Román\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 49, 'Valparaíso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 50, 'Vetagrande\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 51, 'Villa de Cos\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 52, 'Villa García\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 53, 'Villa González Ortega\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 54, 'Villa Hidalgo\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 55, 'Villanueva\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 56, 'Zacatecas\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 57, 'Trancoso\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34'),
(32, 58, 'Santa María de la Paz\r', '2023-11-23 16:26:34', '2023-11-23 16:26:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_talleres`
--

CREATE TABLE `oferta_talleres` (
  `idOferta` int(10) UNSIGNED NOT NULL,
  `codigo_taller` int(10) UNSIGNED NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `cupo` tinyint(2) UNSIGNED NOT NULL,
  `estatus` varchar(15) NOT NULL DEFAULT 'No iniciado',
  `idInstructor` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller_espacio`
--

CREATE TABLE `taller_espacio` (
  `idOferta` int(10) UNSIGNED NOT NULL,
  `idEspacio` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller_horarios`
--

CREATE TABLE `taller_horarios` (
  `idOferta` int(10) UNSIGNED NOT NULL,
  `idHorario` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_email`
--

CREATE TABLE `tipos_email` (
  `idTipo` int(10) UNSIGNED NOT NULL,
  `tipoEmail` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_espacios`
--

CREATE TABLE `tipos_espacios` (
  `idTipo` int(10) UNSIGNED NOT NULL,
  `tipoEspacio` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_telefono`
--

CREATE TABLE `tipos_telefono` (
  `idTipo` int(10) UNSIGNED NOT NULL,
  `tipoTelefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `idTrabajador` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidoPaterno` varchar(60) NOT NULL,
  `apellidoMaterno` varchar(60) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `edad` tinyint(2) DEFAULT NULL,
  `CURP` char(18) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores_taller`
--

CREATE TABLE `trabajadores_taller` (
  `idTrabajador` int(10) UNSIGNED NOT NULL,
  `idOferta` int(10) UNSIGNED NOT NULL,
  `fechaInscripcion` date DEFAULT curdate(),
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_email`
--

CREATE TABLE `trabajador_email` (
  `idTrabajador` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_telefono`
--

CREATE TABLE `trabajador_telefono` (
  `idTrabajador` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo_talleres`
--
ALTER TABLE `catalogo_talleres`
  ADD PRIMARY KEY (`codigo_taller`);

--
-- Indices de la tabla `espacios_disponibles`
--
ALTER TABLE `espacios_disponibles`
  ADD PRIMARY KEY (`idEspacio`),
  ADD KEY `tipoEspacio` (`tipoEspacio`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`idEspecialidad`),
  ADD UNIQUE KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `grados_estudio`
--
ALTER TABLE `grados_estudio`
  ADD PRIMARY KEY (`idGrado`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`idHorario`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`idInstructor`),
  ADD UNIQUE KEY `CURP` (`CURP`),
  ADD KEY `idGradoEstudio` (`idGradoEstudio`);

--
-- Indices de la tabla `instructor_email`
--
ALTER TABLE `instructor_email`
  ADD PRIMARY KEY (`idInstructor`,`idTipo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `instructor_especialidad`
--
ALTER TABLE `instructor_especialidad`
  ADD PRIMARY KEY (`idInstructor`,`idEspecialidad`),
  ADD KEY `idEspecialidad` (`idEspecialidad`);

--
-- Indices de la tabla `instructor_telefono`
--
ALTER TABLE `instructor_telefono`
  ADD PRIMARY KEY (`idInstructor`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`idEstado`,`idMunicipio`);

--
-- Indices de la tabla `oferta_talleres`
--
ALTER TABLE `oferta_talleres`
  ADD PRIMARY KEY (`idOferta`),
  ADD KEY `codigo_taller` (`codigo_taller`),
  ADD KEY `idInstructor` (`idInstructor`);

--
-- Indices de la tabla `taller_espacio`
--
ALTER TABLE `taller_espacio`
  ADD PRIMARY KEY (`idOferta`,`idEspacio`),
  ADD KEY `idEspacio` (`idEspacio`);

--
-- Indices de la tabla `taller_horarios`
--
ALTER TABLE `taller_horarios`
  ADD PRIMARY KEY (`idOferta`,`idHorario`),
  ADD KEY `idHorario` (`idHorario`);

--
-- Indices de la tabla `tipos_email`
--
ALTER TABLE `tipos_email`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `tipos_espacios`
--
ALTER TABLE `tipos_espacios`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `tipos_telefono`
--
ALTER TABLE `tipos_telefono`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`idTrabajador`),
  ADD UNIQUE KEY `CURP` (`CURP`);

--
-- Indices de la tabla `trabajadores_taller`
--
ALTER TABLE `trabajadores_taller`
  ADD PRIMARY KEY (`idTrabajador`,`idOferta`),
  ADD KEY `idOferta` (`idOferta`);

--
-- Indices de la tabla `trabajador_email`
--
ALTER TABLE `trabajador_email`
  ADD PRIMARY KEY (`idTrabajador`,`idTipo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `trabajador_telefono`
--
ALTER TABLE `trabajador_telefono`
  ADD PRIMARY KEY (`idTrabajador`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogo_talleres`
--
ALTER TABLE `catalogo_talleres`
  MODIFY `codigo_taller` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `espacios_disponibles`
--
ALTER TABLE `espacios_disponibles`
  MODIFY `idEspacio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `idEspecialidad` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grados_estudio`
--
ALTER TABLE `grados_estudio`
  MODIFY `idGrado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `idHorario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instructores`
--
ALTER TABLE `instructores`
  MODIFY `idInstructor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oferta_talleres`
--
ALTER TABLE `oferta_talleres`
  MODIFY `idOferta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_email`
--
ALTER TABLE `tipos_email`
  MODIFY `idTipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_espacios`
--
ALTER TABLE `tipos_espacios`
  MODIFY `idTipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_telefono`
--
ALTER TABLE `tipos_telefono`
  MODIFY `idTipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `idTrabajador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `ciudades_ibfk_2` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`);

--
-- Filtros para la tabla `espacios_disponibles`
--
ALTER TABLE `espacios_disponibles`
  ADD CONSTRAINT `espacios_disponibles_ibfk_1` FOREIGN KEY (`tipoEspacio`) REFERENCES `tipos_espacios` (`idTipo`);

--
-- Filtros para la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD CONSTRAINT `instructores_ibfk_1` FOREIGN KEY (`idGradoEstudio`) REFERENCES `grados_estudio` (`idGrado`);

--
-- Filtros para la tabla `instructor_email`
--
ALTER TABLE `instructor_email`
  ADD CONSTRAINT `instructor_email_ibfk_1` FOREIGN KEY (`idInstructor`) REFERENCES `instructores` (`idInstructor`),
  ADD CONSTRAINT `instructor_email_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_email` (`idTipo`);

--
-- Filtros para la tabla `instructor_especialidad`
--
ALTER TABLE `instructor_especialidad`
  ADD CONSTRAINT `instructor_especialidad_ibfk_1` FOREIGN KEY (`idInstructor`) REFERENCES `instructores` (`idInstructor`),
  ADD CONSTRAINT `instructor_especialidad_ibfk_2` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidades` (`idEspecialidad`);

--
-- Filtros para la tabla `instructor_telefono`
--
ALTER TABLE `instructor_telefono`
  ADD CONSTRAINT `instructor_telefono_ibfk_1` FOREIGN KEY (`idInstructor`) REFERENCES `instructores` (`idInstructor`),
  ADD CONSTRAINT `instructor_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`);

--
-- Filtros para la tabla `oferta_talleres`
--
ALTER TABLE `oferta_talleres`
  ADD CONSTRAINT `oferta_talleres_ibfk_1` FOREIGN KEY (`codigo_taller`) REFERENCES `catalogo_talleres` (`codigo_taller`),
  ADD CONSTRAINT `oferta_talleres_ibfk_2` FOREIGN KEY (`idInstructor`) REFERENCES `instructores` (`idInstructor`);

--
-- Filtros para la tabla `taller_espacio`
--
ALTER TABLE `taller_espacio`
  ADD CONSTRAINT `taller_espacio_ibfk_1` FOREIGN KEY (`idOferta`) REFERENCES `oferta_talleres` (`idOferta`),
  ADD CONSTRAINT `taller_espacio_ibfk_2` FOREIGN KEY (`idEspacio`) REFERENCES `espacios_disponibles` (`idEspacio`);

--
-- Filtros para la tabla `taller_horarios`
--
ALTER TABLE `taller_horarios`
  ADD CONSTRAINT `taller_horarios_ibfk_1` FOREIGN KEY (`idOferta`) REFERENCES `oferta_talleres` (`idOferta`),
  ADD CONSTRAINT `taller_horarios_ibfk_2` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`);

--
-- Filtros para la tabla `trabajadores_taller`
--
ALTER TABLE `trabajadores_taller`
  ADD CONSTRAINT `trabajadores_taller_ibfk_1` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajadores` (`idTrabajador`),
  ADD CONSTRAINT `trabajadores_taller_ibfk_2` FOREIGN KEY (`idOferta`) REFERENCES `oferta_talleres` (`idOferta`);

--
-- Filtros para la tabla `trabajador_email`
--
ALTER TABLE `trabajador_email`
  ADD CONSTRAINT `trabajador_email_ibfk_1` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajadores` (`idTrabajador`),
  ADD CONSTRAINT `trabajador_email_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_email` (`idTipo`);

--
-- Filtros para la tabla `trabajador_telefono`
--
ALTER TABLE `trabajador_telefono`
  ADD CONSTRAINT `trabajador_telefono_ibfk_1` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajadores` (`idTrabajador`),
  ADD CONSTRAINT `trabajador_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);
--
-- Base de datos: `classicmodels`
--
CREATE DATABASE IF NOT EXISTS `classicmodels` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `classicmodels`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int(11) DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`customerNumber`, `customerName`, `contactLastName`, `contactFirstName`, `phone`, `addressLine1`, `addressLine2`, `city`, `state`, `postalCode`, `country`, `salesRepEmployeeNumber`, `creditLimit`) VALUES
(103, 'Atelier graphique', 'Schmitt', 'Carine ', '40.32.2555', '54, rue Royale', NULL, 'Nantes', NULL, '44000', 'France', 1370, 21000.00),
(112, 'Signal Gift Stores', 'King', 'Jean', '7025551838', '8489 Strong St.', NULL, 'Las Vegas', 'NV', '83030', 'USA', 1166, 71800.00),
(114, 'Australian Collectors, Co.', 'Ferguson', 'Peter', '03 9520 4555', '636 St Kilda Road', 'Level 3', 'Melbourne', 'Victoria', '3004', 'Australia', 1611, 117300.00),
(119, 'La Rochelle Gifts', 'Labrune', 'Janine ', '40.67.8555', '67, rue des Cinquante Otages', NULL, 'Nantes', NULL, '44000', 'France', 1370, 118200.00),
(121, 'Baane Mini Imports', 'Bergulfsen', 'Jonas ', '07-98 9555', 'Erling Skakkes gate 78', NULL, 'Stavern', NULL, '4110', 'Norway', 1504, 81700.00),
(124, 'Mini Gifts Distributors Ltd.', 'Nelson', 'Susan', '4155551450', '5677 Strong St.', NULL, 'San Rafael', 'CA', '97562', 'USA', 1165, 210500.00),
(125, 'Havel & Zbyszek Co', 'Piestrzeniewicz', 'Zbyszek ', '(26) 642-7555', 'ul. Filtrowa 68', NULL, 'Warszawa', NULL, '01-012', 'Poland', NULL, 0.00),
(128, 'Blauer See Auto, Co.', 'Keitel', 'Roland', '+49 69 66 90 2555', 'Lyonerstr. 34', NULL, 'Frankfurt', NULL, '60528', 'Germany', 1504, 59700.00),
(129, 'Mini Wheels Co.', 'Murphy', 'Julie', '6505555787', '5557 North Pendale Street', NULL, 'San Francisco', 'CA', '94217', 'USA', 1165, 64600.00),
(131, 'Land of Toys Inc.', 'Lee', 'Kwai', '2125557818', '897 Long Airport Avenue', NULL, 'NYC', 'NY', '10022', 'USA', 1323, 114900.00),
(141, 'Euro+ Shopping Channel', 'Freyre', 'Diego ', '(91) 555 94 44', 'C/ Moralzarzal, 86', NULL, 'Madrid', NULL, '28034', 'Spain', 1370, 227600.00),
(144, 'Volvo Model Replicas, Co', 'Berglund', 'Christina ', '0921-12 3555', 'Berguvsvägen  8', NULL, 'Luleå', NULL, 'S-958 22', 'Sweden', 1504, 53100.00),
(145, 'Danish Wholesale Imports', 'Petersen', 'Jytte ', '31 12 3555', 'Vinbæltet 34', NULL, 'Kobenhavn', NULL, '1734', 'Denmark', 1401, 83400.00),
(146, 'Saveley & Henriot, Co.', 'Saveley', 'Mary ', '78.32.5555', '2, rue du Commerce', NULL, 'Lyon', NULL, '69004', 'France', 1337, 123900.00),
(148, 'Dragon Souveniers, Ltd.', 'Natividad', 'Eric', '+65 221 7555', 'Bronz Sok.', 'Bronz Apt. 3/6 Tesvikiye', 'Singapore', NULL, '079903', 'Singapore', 1621, 103800.00),
(151, 'Muscle Machine Inc', 'Young', 'Jeff', '2125557413', '4092 Furth Circle', 'Suite 400', 'NYC', 'NY', '10022', 'USA', 1286, 138500.00),
(157, 'Diecast Classics Inc.', 'Leong', 'Kelvin', '2155551555', '7586 Pompton St.', NULL, 'Allentown', 'PA', '70267', 'USA', 1216, 100600.00),
(161, 'Technics Stores Inc.', 'Hashimoto', 'Juri', '6505556809', '9408 Furth Circle', NULL, 'Burlingame', 'CA', '94217', 'USA', 1165, 84600.00),
(166, 'Handji Gifts& Co', 'Victorino', 'Wendy', '+65 224 1555', '106 Linden Road Sandown', '2nd Floor', 'Singapore', NULL, '069045', 'Singapore', 1612, 97900.00),
(167, 'Herkku Gifts', 'Oeztan', 'Veysel', '+47 2267 3215', 'Brehmen St. 121', 'PR 334 Sentrum', 'Bergen', NULL, 'N 5804', 'Norway  ', 1504, 96800.00),
(168, 'American Souvenirs Inc', 'Franco', 'Keith', '2035557845', '149 Spinnaker Dr.', 'Suite 101', 'New Haven', 'CT', '97823', 'USA', 1286, 0.00),
(169, 'Porto Imports Co.', 'de Castro', 'Isabel ', '(1) 356-5555', 'Estrada da saúde n. 58', NULL, 'Lisboa', NULL, '1756', 'Portugal', NULL, 0.00),
(171, 'Daedalus Designs Imports', 'Rancé', 'Martine ', '20.16.1555', '184, chaussée de Tournai', NULL, 'Lille', NULL, '59000', 'France', 1370, 82900.00),
(172, 'La Corne D\'abondance, Co.', 'Bertrand', 'Marie', '(1) 42.34.2555', '265, boulevard Charonne', NULL, 'Paris', NULL, '75012', 'France', 1337, 84300.00),
(173, 'Cambridge Collectables Co.', 'Tseng', 'Jerry', '6175555555', '4658 Baden Av.', NULL, 'Cambridge', 'MA', '51247', 'USA', 1188, 43400.00),
(175, 'Gift Depot Inc.', 'King', 'Julie', '2035552570', '25593 South Bay Ln.', NULL, 'Bridgewater', 'CT', '97562', 'USA', 1323, 84300.00),
(177, 'Osaka Souveniers Co.', 'Kentary', 'Mory', '+81 06 6342 5555', '1-6-20 Dojima', NULL, 'Kita-ku', 'Osaka', ' 530-0003', 'Japan', 1621, 81200.00),
(181, 'Vitachrome Inc.', 'Frick', 'Michael', '2125551500', '2678 Kingston Rd.', 'Suite 101', 'NYC', 'NY', '10022', 'USA', 1286, 76400.00),
(186, 'Toys of Finland, Co.', 'Karttunen', 'Matti', '90-224 8555', 'Keskuskatu 45', NULL, 'Helsinki', NULL, '21240', 'Finland', 1501, 96500.00),
(187, 'AV Stores, Co.', 'Ashworth', 'Rachel', '(171) 555-1555', 'Fauntleroy Circus', NULL, 'Manchester', NULL, 'EC2 5NT', 'UK', 1501, 136800.00),
(189, 'Clover Collections, Co.', 'Cassidy', 'Dean', '+353 1862 1555', '25 Maiden Lane', 'Floor No. 4', 'Dublin', NULL, '2', 'Ireland', 1504, 69400.00),
(198, 'Auto-Moto Classics Inc.', 'Taylor', 'Leslie', '6175558428', '16780 Pompton St.', NULL, 'Brickhaven', 'MA', '58339', 'USA', 1216, 23000.00),
(201, 'UK Collectables, Ltd.', 'Devon', 'Elizabeth', '(171) 555-2282', '12, Berkeley Gardens Blvd', NULL, 'Liverpool', NULL, 'WX1 6LT', 'UK', 1501, 92700.00),
(202, 'Canadian Gift Exchange Network', 'Tamuri', 'Yoshi ', '(604) 555-3392', '1900 Oak St.', NULL, 'Vancouver', 'BC', 'V3F 2K1', 'Canada', 1323, 90300.00),
(204, 'Online Mini Collectables', 'Barajas', 'Miguel', '6175557555', '7635 Spinnaker Dr.', NULL, 'Brickhaven', 'MA', '58339', 'USA', 1188, 68700.00),
(205, 'Toys4GrownUps.com', 'Young', 'Julie', '6265557265', '78934 Hillside Dr.', NULL, 'Pasadena', 'CA', '90003', 'USA', 1166, 90700.00),
(206, 'Asian Shopping Network, Co', 'Walker', 'Brydey', '+612 9411 1555', 'Suntec Tower Three', '8 Temasek', 'Singapore', NULL, '038988', 'Singapore', NULL, 0.00),
(209, 'Mini Caravy', 'Citeaux', 'Frédérique ', '88.60.1555', '24, place Kléber', NULL, 'Strasbourg', NULL, '67000', 'France', 1370, 53800.00),
(211, 'King Kong Collectables, Co.', 'Gao', 'Mike', '+852 2251 1555', 'Bank of China Tower', '1 Garden Road', 'Central Hong Kong', NULL, NULL, 'Hong Kong', 1621, 58600.00),
(216, 'Enaco Distributors', 'Saavedra', 'Eduardo ', '(93) 203 4555', 'Rambla de Cataluña, 23', NULL, 'Barcelona', NULL, '08022', 'Spain', 1702, 60300.00),
(219, 'Boards & Toys Co.', 'Young', 'Mary', '3105552373', '4097 Douglas Av.', NULL, 'Glendale', 'CA', '92561', 'USA', 1166, 11000.00),
(223, 'Natürlich Autos', 'Kloss', 'Horst ', '0372-555188', 'Taucherstraße 10', NULL, 'Cunewalde', NULL, '01307', 'Germany', NULL, 0.00),
(227, 'Heintze Collectables', 'Ibsen', 'Palle', '86 21 3555', 'Smagsloget 45', NULL, 'Århus', NULL, '8200', 'Denmark', 1401, 120800.00),
(233, 'Québec Home Shopping Network', 'Fresnière', 'Jean ', '(514) 555-8054', '43 rue St. Laurent', NULL, 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 1286, 48700.00),
(237, 'ANG Resellers', 'Camino', 'Alejandra ', '(91) 745 6555', 'Gran Vía, 1', NULL, 'Madrid', NULL, '28001', 'Spain', NULL, 0.00),
(239, 'Collectable Mini Designs Co.', 'Thompson', 'Valarie', '7605558146', '361 Furth Circle', NULL, 'San Diego', 'CA', '91217', 'USA', 1166, 105000.00),
(240, 'giftsbymail.co.uk', 'Bennett', 'Helen ', '(198) 555-8888', 'Garden House', 'Crowther Way 23', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 1501, 93900.00),
(242, 'Alpha Cognac', 'Roulet', 'Annette ', '61.77.6555', '1 rue Alsace-Lorraine', NULL, 'Toulouse', NULL, '31000', 'France', 1370, 61100.00),
(247, 'Messner Shopping Network', 'Messner', 'Renate ', '069-0555984', 'Magazinweg 7', NULL, 'Frankfurt', NULL, '60528', 'Germany', NULL, 0.00),
(249, 'Amica Models & Co.', 'Accorti', 'Paolo ', '011-4988555', 'Via Monte Bianco 34', NULL, 'Torino', NULL, '10100', 'Italy', 1401, 113000.00),
(250, 'Lyon Souveniers', 'Da Silva', 'Daniel', '+33 1 46 62 7555', '27 rue du Colonel Pierre Avia', NULL, 'Paris', NULL, '75508', 'France', 1337, 68100.00),
(256, 'Auto Associés & Cie.', 'Tonini', 'Daniel ', '30.59.8555', '67, avenue de l\'Europe', NULL, 'Versailles', NULL, '78000', 'France', 1370, 77900.00),
(259, 'Toms Spezialitäten, Ltd', 'Pfalzheim', 'Henriette ', '0221-5554327', 'Mehrheimerstr. 369', NULL, 'Köln', NULL, '50739', 'Germany', 1504, 120400.00),
(260, 'Royal Canadian Collectables, Ltd.', 'Lincoln', 'Elizabeth ', '(604) 555-4555', '23 Tsawassen Blvd.', NULL, 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 1323, 89600.00),
(273, 'Franken Gifts, Co', 'Franken', 'Peter ', '089-0877555', 'Berliner Platz 43', NULL, 'München', NULL, '80805', 'Germany', NULL, 0.00),
(276, 'Anna\'s Decorations, Ltd', 'O\'Hara', 'Anna', '02 9936 8555', '201 Miller Street', 'Level 15', 'North Sydney', 'NSW', '2060', 'Australia', 1611, 107800.00),
(278, 'Rovelli Gifts', 'Rovelli', 'Giovanni ', '035-640555', 'Via Ludovico il Moro 22', NULL, 'Bergamo', NULL, '24100', 'Italy', 1401, 119600.00),
(282, 'Souveniers And Things Co.', 'Huxley', 'Adrian', '+61 2 9495 8555', 'Monitor Money Building', '815 Pacific Hwy', 'Chatswood', 'NSW', '2067', 'Australia', 1611, 93300.00),
(286, 'Marta\'s Replicas Co.', 'Hernandez', 'Marta', '6175558555', '39323 Spinnaker Dr.', NULL, 'Cambridge', 'MA', '51247', 'USA', 1216, 123700.00),
(293, 'BG&E Collectables', 'Harrison', 'Ed', '+41 26 425 50 01', 'Rte des Arsenaux 41 ', NULL, 'Fribourg', NULL, '1700', 'Switzerland', NULL, 0.00),
(298, 'Vida Sport, Ltd', 'Holz', 'Mihael', '0897-034555', 'Grenzacherweg 237', NULL, 'Genève', NULL, '1203', 'Switzerland', 1702, 141300.00),
(299, 'Norway Gifts By Mail, Co.', 'Klaeboe', 'Jan', '+47 2212 1555', 'Drammensveien 126A', 'PB 211 Sentrum', 'Oslo', NULL, 'N 0106', 'Norway  ', 1504, 95100.00),
(303, 'Schuyler Imports', 'Schuyler', 'Bradley', '+31 20 491 9555', 'Kingsfordweg 151', NULL, 'Amsterdam', NULL, '1043 GR', 'Netherlands', NULL, 0.00),
(307, 'Der Hund Imports', 'Andersen', 'Mel', '030-0074555', 'Obere Str. 57', NULL, 'Berlin', NULL, '12209', 'Germany', NULL, 0.00),
(311, 'Oulu Toy Supplies, Inc.', 'Koskitalo', 'Pirkko', '981-443655', 'Torikatu 38', NULL, 'Oulu', NULL, '90110', 'Finland', 1501, 90500.00),
(314, 'Petit Auto', 'Dewey', 'Catherine ', '(02) 5554 67', 'Rue Joseph-Bens 532', NULL, 'Bruxelles', NULL, 'B-1180', 'Belgium', 1401, 79900.00),
(319, 'Mini Classics', 'Frick', 'Steve', '9145554562', '3758 North Pendale Street', NULL, 'White Plains', 'NY', '24067', 'USA', 1323, 102700.00),
(320, 'Mini Creations Ltd.', 'Huang', 'Wing', '5085559555', '4575 Hillside Dr.', NULL, 'New Bedford', 'MA', '50553', 'USA', 1188, 94500.00),
(321, 'Corporate Gift Ideas Co.', 'Brown', 'Julie', '6505551386', '7734 Strong St.', NULL, 'San Francisco', 'CA', '94217', 'USA', 1165, 105000.00),
(323, 'Down Under Souveniers, Inc', 'Graham', 'Mike', '+64 9 312 5555', '162-164 Grafton Road', 'Level 2', 'Auckland  ', NULL, NULL, 'New Zealand', 1612, 88000.00),
(324, 'Stylish Desk Decors, Co.', 'Brown', 'Ann ', '(171) 555-0297', '35 King George', NULL, 'London', NULL, 'WX3 6FW', 'UK', 1501, 77000.00),
(328, 'Tekni Collectables Inc.', 'Brown', 'William', '2015559350', '7476 Moss Rd.', NULL, 'Newark', 'NJ', '94019', 'USA', 1323, 43000.00),
(333, 'Australian Gift Network, Co', 'Calaghan', 'Ben', '61-7-3844-6555', '31 Duncan St. West End', NULL, 'South Brisbane', 'Queensland', '4101', 'Australia', 1611, 51600.00),
(334, 'Suominen Souveniers', 'Suominen', 'Kalle', '+358 9 8045 555', 'Software Engineering Center', 'SEC Oy', 'Espoo', NULL, 'FIN-02271', 'Finland', 1501, 98800.00),
(335, 'Cramer Spezialitäten, Ltd', 'Cramer', 'Philip ', '0555-09555', 'Maubelstr. 90', NULL, 'Brandenburg', NULL, '14776', 'Germany', NULL, 0.00),
(339, 'Classic Gift Ideas, Inc', 'Cervantes', 'Francisca', '2155554695', '782 First Street', NULL, 'Philadelphia', 'PA', '71270', 'USA', 1188, 81100.00),
(344, 'CAF Imports', 'Fernandez', 'Jesus', '+34 913 728 555', 'Merchants House', '27-30 Merchant\'s Quay', 'Madrid', NULL, '28023', 'Spain', 1702, 59600.00),
(347, 'Men \'R\' US Retailers, Ltd.', 'Chandler', 'Brian', '2155554369', '6047 Douglas Av.', NULL, 'Los Angeles', 'CA', '91003', 'USA', 1166, 57700.00),
(348, 'Asian Treasures, Inc.', 'McKenna', 'Patricia ', '2967 555', '8 Johnstown Road', NULL, 'Cork', 'Co. Cork', NULL, 'Ireland', NULL, 0.00),
(350, 'Marseille Mini Autos', 'Lebihan', 'Laurence ', '91.24.4555', '12, rue des Bouchers', NULL, 'Marseille', NULL, '13008', 'France', 1337, 65000.00),
(353, 'Reims Collectables', 'Henriot', 'Paul ', '26.47.1555', '59 rue de l\'Abbaye', NULL, 'Reims', NULL, '51100', 'France', 1337, 81100.00),
(356, 'SAR Distributors, Co', 'Kuger', 'Armand', '+27 21 550 3555', '1250 Pretorius Street', NULL, 'Hatfield', 'Pretoria', '0028', 'South Africa', NULL, 0.00),
(357, 'GiftsForHim.com', 'MacKinlay', 'Wales', '64-9-3763555', '199 Great North Road', NULL, 'Auckland', NULL, NULL, 'New Zealand', 1612, 77700.00),
(361, 'Kommission Auto', 'Josephs', 'Karin', '0251-555259', 'Luisenstr. 48', NULL, 'Münster', NULL, '44087', 'Germany', NULL, 0.00),
(362, 'Gifts4AllAges.com', 'Yoshido', 'Juri', '6175559555', '8616 Spinnaker Dr.', NULL, 'Boston', 'MA', '51003', 'USA', 1216, 41900.00),
(363, 'Online Diecast Creations Co.', 'Young', 'Dorothy', '6035558647', '2304 Long Airport Avenue', NULL, 'Nashua', 'NH', '62005', 'USA', 1216, 114200.00),
(369, 'Lisboa Souveniers, Inc', 'Rodriguez', 'Lino ', '(1) 354-2555', 'Jardim das rosas n. 32', NULL, 'Lisboa', NULL, '1675', 'Portugal', NULL, 0.00),
(376, 'Precious Collectables', 'Urs', 'Braun', '0452-076555', 'Hauptstr. 29', NULL, 'Bern', NULL, '3012', 'Switzerland', 1702, 0.00),
(379, 'Collectables For Less Inc.', 'Nelson', 'Allen', '6175558555', '7825 Douglas Av.', NULL, 'Brickhaven', 'MA', '58339', 'USA', 1188, 70700.00),
(381, 'Royale Belge', 'Cartrain', 'Pascale ', '(071) 23 67 2555', 'Boulevard Tirou, 255', NULL, 'Charleroi', NULL, 'B-6000', 'Belgium', 1401, 23500.00),
(382, 'Salzburg Collectables', 'Pipps', 'Georg ', '6562-9555', 'Geislweg 14', NULL, 'Salzburg', NULL, '5020', 'Austria', 1401, 71700.00),
(385, 'Cruz & Sons Co.', 'Cruz', 'Arnold', '+63 2 555 3587', '15 McCallum Street', 'NatWest Center #13-03', 'Makati City', NULL, '1227 MM', 'Philippines', 1621, 81500.00),
(386, 'L\'ordine Souveniers', 'Moroni', 'Maurizio ', '0522-556555', 'Strada Provinciale 124', NULL, 'Reggio Emilia', NULL, '42100', 'Italy', 1401, 121400.00),
(398, 'Tokyo Collectables, Ltd', 'Shimamura', 'Akiko', '+81 3 3584 0555', '2-2-8 Roppongi', NULL, 'Minato-ku', 'Tokyo', '106-0032', 'Japan', 1621, 94400.00),
(406, 'Auto Canal+ Petit', 'Perrier', 'Dominique', '(1) 47.55.6555', '25, rue Lauriston', NULL, 'Paris', NULL, '75016', 'France', 1337, 95000.00),
(409, 'Stuttgart Collectable Exchange', 'Müller', 'Rita ', '0711-555361', 'Adenauerallee 900', NULL, 'Stuttgart', NULL, '70563', 'Germany', NULL, 0.00),
(412, 'Extreme Desk Decorations, Ltd', 'McRoy', 'Sarah', '04 499 9555', '101 Lambton Quay', 'Level 11', 'Wellington', NULL, NULL, 'New Zealand', 1612, 86800.00),
(415, 'Bavarian Collectables Imports, Co.', 'Donnermeyer', 'Michael', ' +49 89 61 08 9555', 'Hansastr. 15', NULL, 'Munich', NULL, '80686', 'Germany', 1504, 77000.00),
(424, 'Classic Legends Inc.', 'Hernandez', 'Maria', '2125558493', '5905 Pompton St.', 'Suite 750', 'NYC', 'NY', '10022', 'USA', 1286, 67500.00),
(443, 'Feuer Online Stores, Inc', 'Feuer', 'Alexander ', '0342-555176', 'Heerstr. 22', NULL, 'Leipzig', NULL, '04179', 'Germany', NULL, 0.00),
(447, 'Gift Ideas Corp.', 'Lewis', 'Dan', '2035554407', '2440 Pompton St.', NULL, 'Glendale', 'CT', '97561', 'USA', 1323, 49700.00),
(448, 'Scandinavian Gift Ideas', 'Larsson', 'Martha', '0695-34 6555', 'Åkergatan 24', NULL, 'Bräcke', NULL, 'S-844 67', 'Sweden', 1504, 116400.00),
(450, 'The Sharp Gifts Warehouse', 'Frick', 'Sue', '4085553659', '3086 Ingle Ln.', NULL, 'San Jose', 'CA', '94217', 'USA', 1165, 77600.00),
(452, 'Mini Auto Werke', 'Mendel', 'Roland ', '7675-3555', 'Kirchgasse 6', NULL, 'Graz', NULL, '8010', 'Austria', 1401, 45300.00),
(455, 'Super Scale Inc.', 'Murphy', 'Leslie', '2035559545', '567 North Pendale Street', NULL, 'New Haven', 'CT', '97823', 'USA', 1286, 95400.00),
(456, 'Microscale Inc.', 'Choi', 'Yu', '2125551957', '5290 North Pendale Street', 'Suite 200', 'NYC', 'NY', '10022', 'USA', 1286, 39800.00),
(458, 'Corrida Auto Replicas, Ltd', 'Sommer', 'Martín ', '(91) 555 22 82', 'C/ Araquil, 67', NULL, 'Madrid', NULL, '28023', 'Spain', 1702, 104600.00),
(459, 'Warburg Exchange', 'Ottlieb', 'Sven ', '0241-039123', 'Walserweg 21', NULL, 'Aachen', NULL, '52066', 'Germany', NULL, 0.00),
(462, 'FunGiftIdeas.com', 'Benitez', 'Violeta', '5085552555', '1785 First Street', NULL, 'New Bedford', 'MA', '50553', 'USA', 1216, 85800.00),
(465, 'Anton Designs, Ltd.', 'Anton', 'Carmen', '+34 913 728555', 'c/ Gobelas, 19-1 Urb. La Florida', NULL, 'Madrid', NULL, '28023', 'Spain', NULL, 0.00),
(471, 'Australian Collectables, Ltd', 'Clenahan', 'Sean', '61-9-3844-6555', '7 Allen Street', NULL, 'Glen Waverly', 'Victoria', '3150', 'Australia', 1611, 60300.00),
(473, 'Frau da Collezione', 'Ricotti', 'Franco', '+39 022515555', '20093 Cologno Monzese', 'Alessandro Volta 16', 'Milan', NULL, NULL, 'Italy', 1401, 34800.00),
(475, 'West Coast Collectables Co.', 'Thompson', 'Steve', '3105553722', '3675 Furth Circle', NULL, 'Burbank', 'CA', '94019', 'USA', 1166, 55400.00),
(477, 'Mit Vergnügen & Co.', 'Moos', 'Hanna ', '0621-08555', 'Forsterstr. 57', NULL, 'Mannheim', NULL, '68306', 'Germany', NULL, 0.00),
(480, 'Kremlin Collectables, Co.', 'Semenov', 'Alexander ', '+7 812 293 0521', '2 Pobedy Square', NULL, 'Saint Petersburg', NULL, '196143', 'Russia', NULL, 0.00),
(481, 'Raanan Stores, Inc', 'Altagar,G M', 'Raanan', '+ 972 9 959 8555', '3 Hagalim Blv.', NULL, 'Herzlia', NULL, '47625', 'Israel', NULL, 0.00),
(484, 'Iberia Gift Imports, Corp.', 'Roel', 'José Pedro ', '(95) 555 82 82', 'C/ Romero, 33', NULL, 'Sevilla', NULL, '41101', 'Spain', 1702, 65700.00),
(486, 'Motor Mint Distributors Inc.', 'Salazar', 'Rosa', '2155559857', '11328 Douglas Av.', NULL, 'Philadelphia', 'PA', '71270', 'USA', 1323, 72600.00),
(487, 'Signal Collectibles Ltd.', 'Taylor', 'Sue', '4155554312', '2793 Furth Circle', NULL, 'Brisbane', 'CA', '94217', 'USA', 1165, 60300.00),
(489, 'Double Decker Gift Stores, Ltd', 'Smith', 'Thomas ', '(171) 555-7555', '120 Hanover Sq.', NULL, 'London', NULL, 'WA1 1DP', 'UK', 1501, 43300.00),
(495, 'Diecast Collectables', 'Franco', 'Valarie', '6175552555', '6251 Ingle Ln.', NULL, 'Boston', 'MA', '51003', 'USA', 1188, 85100.00),
(496, 'Kelly\'s Gift Shop', 'Snowden', 'Tony', '+64 9 5555500', 'Arenales 1938 3\'A\'', NULL, 'Auckland  ', NULL, NULL, 'New Zealand', 1612, 110000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`) VALUES
(1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', NULL, 'President'),
(1056, 'Patterson', 'Mary', 'x4611', 'mpatterso@classicmodelcars.com', '1', 1002, 'VP Sales'),
(1076, 'Firrelli', 'Jeff', 'x9273', 'jfirrelli@classicmodelcars.com', '1', 1002, 'VP Marketing'),
(1088, 'Patterson', 'William', 'x4871', 'wpatterson@classicmodelcars.com', '6', 1056, 'Sales Manager (APAC)'),
(1102, 'Bondur', 'Gerard', 'x5408', 'gbondur@classicmodelcars.com', '4', 1056, 'Sale Manager (EMEA)'),
(1143, 'Bow', 'Anthony', 'x5428', 'abow@classicmodelcars.com', '1', 1056, 'Sales Manager (NA)'),
(1165, 'Jennings', 'Leslie', 'x3291', 'ljennings@classicmodelcars.com', '1', 1143, 'Sales Rep'),
(1166, 'Thompson', 'Leslie', 'x4065', 'lthompson@classicmodelcars.com', '1', 1143, 'Sales Rep'),
(1188, 'Firrelli', 'Julie', 'x2173', 'jfirrelli@classicmodelcars.com', '2', 1143, 'Sales Rep'),
(1216, 'Patterson', 'Steve', 'x4334', 'spatterson@classicmodelcars.com', '2', 1143, 'Sales Rep'),
(1286, 'Tseng', 'Foon Yue', 'x2248', 'ftseng@classicmodelcars.com', '3', 1143, 'Sales Rep'),
(1323, 'Vanauf', 'George', 'x4102', 'gvanauf@classicmodelcars.com', '3', 1143, 'Sales Rep'),
(1337, 'Bondur', 'Loui', 'x6493', 'lbondur@classicmodelcars.com', '4', 1102, 'Sales Rep'),
(1370, 'Hernandez', 'Gerard', 'x2028', 'ghernande@classicmodelcars.com', '4', 1102, 'Sales Rep'),
(1401, 'Castillo', 'Pamela', 'x2759', 'pcastillo@classicmodelcars.com', '4', 1102, 'Sales Rep'),
(1501, 'Bott', 'Larry', 'x2311', 'lbott@classicmodelcars.com', '7', 1102, 'Sales Rep'),
(1504, 'Jones', 'Barry', 'x102', 'bjones@classicmodelcars.com', '7', 1102, 'Sales Rep'),
(1611, 'Fixter', 'Andy', 'x101', 'afixter@classicmodelcars.com', '6', 1088, 'Sales Rep'),
(1612, 'Marsh', 'Peter', 'x102', 'pmarsh@classicmodelcars.com', '6', 1088, 'Sales Rep'),
(1619, 'King', 'Tom', 'x103', 'tking@classicmodelcars.com', '6', 1088, 'Sales Rep'),
(1621, 'Nishi', 'Mami', 'x101', 'mnishi@classicmodelcars.com', '5', 1056, 'Sales Rep'),
(1625, 'Kato', 'Yoshimi', 'x102', 'ykato@classicmodelcars.com', '5', 1621, 'Sales Rep'),
(1702, 'Gerard', 'Martin', 'x2312', 'mgerard@classicmodelcars.com', '4', 1102, 'Sales Rep');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offices`
--

CREATE TABLE `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `offices`
--

INSERT INTO `offices` (`officeCode`, `city`, `phone`, `addressLine1`, `addressLine2`, `state`, `country`, `postalCode`, `territory`) VALUES
('1', 'San Francisco', '+1 650 219 4782', '100 Market Street', 'Suite 300', 'CA', 'USA', '94080', 'NA'),
('2', 'Boston', '+1 215 837 0825', '1550 Court Place', 'Suite 102', 'MA', 'USA', '02107', 'NA'),
('3', 'NYC', '+1 212 555 3000', '523 East 53rd Street', 'apt. 5A', 'NY', 'USA', '10022', 'NA'),
('4', 'Paris', '+33 14 723 4404', '43 Rue Jouffroy D\'abbans', NULL, NULL, 'France', '75017', 'EMEA'),
('5', 'Tokyo', '+81 33 224 5000', '4-1 Kioicho', NULL, 'Chiyoda-Ku', 'Japan', '102-8578', 'Japan'),
('6', 'Sydney', '+61 2 9264 2451', '5-11 Wentworth Avenue', 'Floor #2', NULL, 'Australia', 'NSW 2010', 'APAC'),
('7', 'London', '+44 20 7877 2041', '25 Old Broad Street', 'Level 7', NULL, 'UK', 'EC2N 1HN', 'EMEA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderNumber` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` decimal(10,2) NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `orderdetails`
--

INSERT INTO `orderdetails` (`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`) VALUES
(10100, 'S18_1749', 30, 136.00, 3),
(10100, 'S18_2248', 50, 55.09, 2),
(10100, 'S18_4409', 22, 75.46, 4),
(10100, 'S24_3969', 49, 35.29, 1),
(10101, 'S18_2325', 25, 108.06, 4),
(10101, 'S18_2795', 26, 167.06, 1),
(10101, 'S24_1937', 45, 32.53, 3),
(10101, 'S24_2022', 46, 44.35, 2),
(10102, 'S18_1342', 39, 95.55, 2),
(10102, 'S18_1367', 41, 43.13, 1),
(10103, 'S10_1949', 26, 214.30, 11),
(10103, 'S10_4962', 42, 119.67, 4),
(10103, 'S12_1666', 27, 121.64, 8),
(10103, 'S18_1097', 35, 94.50, 10),
(10103, 'S18_2432', 22, 58.34, 2),
(10103, 'S18_2949', 27, 92.19, 12),
(10103, 'S18_2957', 35, 61.84, 14),
(10103, 'S18_3136', 25, 86.92, 13),
(10103, 'S18_3320', 46, 86.31, 16),
(10103, 'S18_4600', 36, 98.07, 5),
(10103, 'S18_4668', 41, 40.75, 9),
(10103, 'S24_2300', 36, 107.34, 1),
(10103, 'S24_4258', 25, 88.62, 15),
(10103, 'S32_1268', 31, 92.46, 3),
(10103, 'S32_3522', 45, 63.35, 7),
(10103, 'S700_2824', 42, 94.07, 6),
(10104, 'S12_3148', 34, 131.44, 1),
(10104, 'S12_4473', 41, 111.39, 9),
(10104, 'S18_2238', 24, 135.90, 8),
(10104, 'S18_2319', 29, 122.73, 12),
(10104, 'S18_3232', 23, 165.95, 13),
(10104, 'S18_4027', 38, 119.20, 3),
(10104, 'S24_1444', 35, 52.02, 6),
(10104, 'S24_2840', 44, 30.41, 10),
(10104, 'S24_4048', 26, 106.45, 5),
(10104, 'S32_2509', 35, 51.95, 11),
(10104, 'S32_3207', 49, 56.55, 4),
(10104, 'S50_1392', 33, 114.59, 7),
(10104, 'S50_1514', 32, 53.31, 2),
(10105, 'S10_4757', 50, 127.84, 2),
(10105, 'S12_1108', 41, 205.72, 15),
(10105, 'S12_3891', 29, 141.88, 14),
(10105, 'S18_3140', 22, 136.59, 11),
(10105, 'S18_3259', 38, 87.73, 13),
(10105, 'S18_4522', 41, 75.48, 10),
(10105, 'S24_2011', 43, 117.97, 9),
(10105, 'S24_3151', 44, 73.46, 4),
(10105, 'S24_3816', 50, 75.47, 1),
(10105, 'S700_1138', 41, 54.00, 5),
(10105, 'S700_1938', 29, 86.61, 12),
(10105, 'S700_2610', 31, 60.72, 3),
(10105, 'S700_3505', 39, 92.16, 6),
(10105, 'S700_3962', 22, 99.31, 7),
(10105, 'S72_3212', 25, 44.77, 8),
(10106, 'S18_1662', 36, 134.04, 12),
(10106, 'S18_2581', 34, 81.10, 2),
(10106, 'S18_3029', 41, 80.86, 18),
(10106, 'S18_3856', 41, 94.22, 17),
(10106, 'S24_1785', 28, 107.23, 4),
(10106, 'S24_2841', 49, 65.77, 13),
(10106, 'S24_3420', 31, 55.89, 14),
(10106, 'S24_3949', 50, 55.96, 11),
(10106, 'S24_4278', 26, 71.00, 3),
(10106, 'S32_4289', 33, 65.35, 5),
(10106, 'S50_1341', 39, 35.78, 6),
(10106, 'S700_1691', 31, 91.34, 7),
(10106, 'S700_2047', 30, 85.09, 16),
(10106, 'S700_2466', 34, 99.72, 9),
(10106, 'S700_2834', 32, 113.90, 1),
(10106, 'S700_3167', 44, 76.00, 8),
(10106, 'S700_4002', 48, 70.33, 10),
(10106, 'S72_1253', 48, 43.70, 15),
(10107, 'S10_1678', 30, 81.35, 2),
(10107, 'S10_2016', 39, 105.86, 5),
(10107, 'S10_4698', 27, 172.36, 4),
(10107, 'S12_2823', 21, 122.00, 1),
(10107, 'S18_2625', 29, 52.70, 6),
(10107, 'S24_1578', 25, 96.92, 3),
(10107, 'S24_2000', 38, 73.12, 7),
(10107, 'S32_1374', 20, 88.90, 8),
(10108, 'S12_1099', 33, 165.38, 6),
(10108, 'S12_3380', 45, 96.30, 4),
(10108, 'S12_3990', 39, 75.81, 7),
(10108, 'S12_4675', 36, 107.10, 3),
(10108, 'S18_1889', 38, 67.76, 2),
(10108, 'S18_3278', 26, 73.17, 9),
(10108, 'S18_3482', 29, 132.29, 8),
(10108, 'S18_3782', 43, 52.84, 12),
(10108, 'S18_4721', 44, 139.87, 11),
(10108, 'S24_2360', 35, 64.41, 15),
(10108, 'S24_3371', 30, 60.01, 5),
(10108, 'S24_3856', 40, 132.00, 1),
(10108, 'S24_4620', 31, 67.10, 10),
(10108, 'S32_2206', 27, 36.21, 13),
(10108, 'S32_4485', 31, 87.76, 16),
(10108, 'S50_4713', 34, 74.85, 14),
(10109, 'S18_1129', 26, 117.48, 4),
(10109, 'S18_1984', 38, 137.98, 3),
(10109, 'S18_2870', 26, 126.72, 1),
(10109, 'S18_3232', 46, 160.87, 5),
(10109, 'S18_3685', 47, 125.74, 2),
(10109, 'S24_2972', 29, 32.10, 6),
(10110, 'S18_1589', 37, 118.22, 16),
(10110, 'S18_1749', 42, 153.00, 7),
(10110, 'S18_2248', 32, 51.46, 6),
(10110, 'S18_2325', 33, 115.69, 4),
(10110, 'S18_2795', 31, 163.69, 1),
(10110, 'S18_4409', 28, 81.91, 8),
(10110, 'S18_4933', 42, 62.00, 9),
(10110, 'S24_1046', 36, 72.02, 13),
(10110, 'S24_1628', 29, 43.27, 15),
(10110, 'S24_1937', 20, 28.88, 3),
(10110, 'S24_2022', 39, 40.77, 2),
(10110, 'S24_2766', 43, 82.69, 11),
(10110, 'S24_2887', 46, 112.74, 10),
(10110, 'S24_3191', 27, 80.47, 12),
(10110, 'S24_3432', 37, 96.37, 14),
(10110, 'S24_3969', 48, 35.29, 5),
(10111, 'S18_1342', 33, 87.33, 6),
(10111, 'S18_1367', 48, 48.52, 5),
(10111, 'S18_2957', 28, 53.09, 2),
(10111, 'S18_3136', 43, 94.25, 1),
(10111, 'S18_3320', 39, 91.27, 4),
(10111, 'S24_4258', 26, 85.70, 3),
(10112, 'S10_1949', 29, 197.16, 1),
(10112, 'S18_2949', 23, 85.10, 2),
(10113, 'S12_1666', 21, 121.64, 2),
(10113, 'S18_1097', 49, 101.50, 4),
(10113, 'S18_4668', 50, 43.27, 3),
(10113, 'S32_3522', 23, 58.82, 1),
(10114, 'S10_4962', 31, 128.53, 8),
(10114, 'S18_2319', 39, 106.78, 3),
(10114, 'S18_2432', 45, 53.48, 6),
(10114, 'S18_3232', 48, 169.34, 4),
(10114, 'S18_4600', 41, 105.34, 9),
(10114, 'S24_2300', 21, 102.23, 5),
(10114, 'S24_2840', 24, 28.64, 1),
(10114, 'S32_1268', 32, 88.61, 7),
(10114, 'S32_2509', 28, 43.83, 2),
(10114, 'S700_2824', 42, 82.94, 10),
(10115, 'S12_4473', 46, 111.39, 5),
(10115, 'S18_2238', 46, 140.81, 4),
(10115, 'S24_1444', 47, 56.64, 2),
(10115, 'S24_4048', 44, 106.45, 1),
(10115, 'S50_1392', 27, 100.70, 3),
(10116, 'S32_3207', 27, 60.28, 1),
(10117, 'S12_1108', 33, 195.33, 9),
(10117, 'S12_3148', 43, 148.06, 10),
(10117, 'S12_3891', 39, 173.02, 8),
(10117, 'S18_3140', 26, 121.57, 5),
(10117, 'S18_3259', 21, 81.68, 7),
(10117, 'S18_4027', 22, 122.08, 12),
(10117, 'S18_4522', 23, 73.73, 4),
(10117, 'S24_2011', 41, 119.20, 3),
(10117, 'S50_1514', 21, 55.65, 11),
(10117, 'S700_1938', 38, 75.35, 6),
(10117, 'S700_3962', 45, 89.38, 1),
(10117, 'S72_3212', 50, 52.42, 2),
(10118, 'S700_3505', 36, 86.15, 1),
(10119, 'S10_4757', 46, 112.88, 11),
(10119, 'S18_1662', 43, 151.38, 3),
(10119, 'S18_3029', 21, 74.84, 9),
(10119, 'S18_3856', 27, 95.28, 8),
(10119, 'S24_2841', 41, 64.40, 4),
(10119, 'S24_3151', 35, 72.58, 13),
(10119, 'S24_3420', 20, 63.12, 5),
(10119, 'S24_3816', 35, 82.18, 10),
(10119, 'S24_3949', 28, 62.10, 2),
(10119, 'S700_1138', 25, 57.34, 14),
(10119, 'S700_2047', 29, 74.23, 7),
(10119, 'S700_2610', 38, 67.22, 12),
(10119, 'S700_4002', 26, 63.67, 1),
(10119, 'S72_1253', 28, 40.22, 6),
(10120, 'S10_2016', 29, 118.94, 3),
(10120, 'S10_4698', 46, 158.80, 2),
(10120, 'S18_2581', 29, 82.79, 8),
(10120, 'S18_2625', 46, 57.54, 4),
(10120, 'S24_1578', 35, 110.45, 1),
(10120, 'S24_1785', 39, 93.01, 10),
(10120, 'S24_2000', 34, 72.36, 5),
(10120, 'S24_4278', 29, 71.73, 9),
(10120, 'S32_1374', 22, 94.90, 6),
(10120, 'S32_4289', 29, 68.79, 11),
(10120, 'S50_1341', 49, 41.46, 12),
(10120, 'S700_1691', 47, 91.34, 13),
(10120, 'S700_2466', 24, 81.77, 15),
(10120, 'S700_2834', 24, 106.79, 7),
(10120, 'S700_3167', 43, 72.00, 14),
(10121, 'S10_1678', 34, 86.13, 5),
(10121, 'S12_2823', 50, 126.52, 4),
(10121, 'S24_2360', 32, 58.18, 2),
(10121, 'S32_4485', 25, 95.93, 3),
(10121, 'S50_4713', 44, 72.41, 1),
(10122, 'S12_1099', 42, 155.66, 10),
(10122, 'S12_3380', 37, 113.92, 8),
(10122, 'S12_3990', 32, 65.44, 11),
(10122, 'S12_4675', 20, 104.80, 7),
(10122, 'S18_1129', 34, 114.65, 2),
(10122, 'S18_1889', 43, 62.37, 6),
(10122, 'S18_1984', 31, 113.80, 1),
(10122, 'S18_3232', 25, 137.17, 3),
(10122, 'S18_3278', 21, 69.15, 13),
(10122, 'S18_3482', 21, 133.76, 12),
(10122, 'S18_3782', 35, 59.06, 16),
(10122, 'S18_4721', 28, 145.82, 15),
(10122, 'S24_2972', 39, 34.74, 4),
(10122, 'S24_3371', 34, 50.82, 9),
(10122, 'S24_3856', 43, 136.22, 5),
(10122, 'S24_4620', 29, 67.10, 14),
(10122, 'S32_2206', 31, 33.79, 17),
(10123, 'S18_1589', 26, 120.71, 2),
(10123, 'S18_2870', 46, 114.84, 3),
(10123, 'S18_3685', 34, 117.26, 4),
(10123, 'S24_1628', 50, 43.27, 1),
(10124, 'S18_1749', 21, 153.00, 6),
(10124, 'S18_2248', 42, 58.12, 5),
(10124, 'S18_2325', 42, 111.87, 3),
(10124, 'S18_4409', 36, 75.46, 7),
(10124, 'S18_4933', 23, 66.28, 8),
(10124, 'S24_1046', 22, 62.47, 12),
(10124, 'S24_1937', 45, 30.53, 2),
(10124, 'S24_2022', 22, 36.29, 1),
(10124, 'S24_2766', 32, 74.51, 10),
(10124, 'S24_2887', 25, 93.95, 9),
(10124, 'S24_3191', 49, 76.19, 11),
(10124, 'S24_3432', 43, 101.73, 13),
(10124, 'S24_3969', 46, 36.11, 4),
(10125, 'S18_1342', 32, 89.38, 1),
(10125, 'S18_2795', 34, 138.38, 2),
(10126, 'S10_1949', 38, 205.73, 11),
(10126, 'S10_4962', 22, 122.62, 4),
(10126, 'S12_1666', 21, 135.30, 8),
(10126, 'S18_1097', 38, 116.67, 10),
(10126, 'S18_1367', 42, 51.21, 17),
(10126, 'S18_2432', 43, 51.05, 2),
(10126, 'S18_2949', 31, 93.21, 12),
(10126, 'S18_2957', 46, 61.84, 14),
(10126, 'S18_3136', 30, 93.20, 13),
(10126, 'S18_3320', 38, 94.25, 16),
(10126, 'S18_4600', 50, 102.92, 5),
(10126, 'S18_4668', 43, 47.29, 9),
(10126, 'S24_2300', 27, 122.68, 1),
(10126, 'S24_4258', 34, 83.76, 15),
(10126, 'S32_1268', 43, 82.83, 3),
(10126, 'S32_3522', 26, 62.05, 7),
(10126, 'S700_2824', 45, 97.10, 6),
(10127, 'S12_1108', 46, 193.25, 2),
(10127, 'S12_3148', 46, 140.50, 3),
(10127, 'S12_3891', 42, 169.56, 1),
(10127, 'S12_4473', 24, 100.73, 11),
(10127, 'S18_2238', 45, 140.81, 10),
(10127, 'S18_2319', 45, 114.14, 14),
(10127, 'S18_3232', 22, 149.02, 15),
(10127, 'S18_4027', 25, 126.39, 5),
(10127, 'S24_1444', 20, 50.86, 8),
(10127, 'S24_2840', 39, 34.30, 12),
(10127, 'S24_4048', 20, 107.63, 7),
(10127, 'S32_2509', 45, 46.53, 13),
(10127, 'S32_3207', 29, 60.90, 6),
(10127, 'S50_1392', 46, 111.12, 9),
(10127, 'S50_1514', 46, 55.65, 4),
(10128, 'S18_3140', 41, 120.20, 2),
(10128, 'S18_3259', 41, 80.67, 4),
(10128, 'S18_4522', 43, 77.24, 1),
(10128, 'S700_1938', 32, 72.75, 3),
(10129, 'S10_4757', 33, 123.76, 2),
(10129, 'S24_2011', 45, 113.06, 9),
(10129, 'S24_3151', 41, 81.43, 4),
(10129, 'S24_3816', 50, 76.31, 1),
(10129, 'S700_1138', 31, 58.67, 5),
(10129, 'S700_2610', 45, 72.28, 3),
(10129, 'S700_3505', 42, 90.15, 6),
(10129, 'S700_3962', 30, 94.34, 7),
(10129, 'S72_3212', 32, 44.23, 8),
(10130, 'S18_3029', 40, 68.82, 2),
(10130, 'S18_3856', 33, 99.52, 1),
(10131, 'S18_1662', 21, 141.92, 4),
(10131, 'S24_2841', 35, 60.97, 5),
(10131, 'S24_3420', 29, 52.60, 6),
(10131, 'S24_3949', 50, 54.59, 3),
(10131, 'S700_2047', 22, 76.94, 8),
(10131, 'S700_2466', 40, 86.76, 1),
(10131, 'S700_4002', 26, 63.67, 2),
(10131, 'S72_1253', 21, 40.22, 7),
(10132, 'S700_3167', 36, 80.00, 1),
(10133, 'S18_2581', 49, 80.26, 3),
(10133, 'S24_1785', 41, 109.42, 5),
(10133, 'S24_4278', 46, 61.58, 4),
(10133, 'S32_1374', 23, 80.91, 1),
(10133, 'S32_4289', 49, 67.41, 6),
(10133, 'S50_1341', 27, 37.09, 7),
(10133, 'S700_1691', 24, 76.73, 8),
(10133, 'S700_2834', 27, 115.09, 2),
(10134, 'S10_1678', 41, 90.92, 2),
(10134, 'S10_2016', 27, 116.56, 5),
(10134, 'S10_4698', 31, 187.85, 4),
(10134, 'S12_2823', 20, 131.04, 1),
(10134, 'S18_2625', 30, 51.48, 6),
(10134, 'S24_1578', 35, 94.67, 3),
(10134, 'S24_2000', 43, 75.41, 7),
(10135, 'S12_1099', 42, 173.17, 7),
(10135, 'S12_3380', 48, 110.39, 5),
(10135, 'S12_3990', 24, 72.62, 8),
(10135, 'S12_4675', 29, 103.64, 4),
(10135, 'S18_1889', 48, 66.99, 3),
(10135, 'S18_3278', 45, 65.94, 10),
(10135, 'S18_3482', 42, 139.64, 9),
(10135, 'S18_3782', 45, 49.74, 13),
(10135, 'S18_4721', 31, 133.92, 12),
(10135, 'S24_2360', 29, 67.18, 16),
(10135, 'S24_2972', 20, 34.36, 1),
(10135, 'S24_3371', 27, 52.05, 6),
(10135, 'S24_3856', 47, 139.03, 2),
(10135, 'S24_4620', 23, 76.80, 11),
(10135, 'S32_2206', 33, 38.62, 14),
(10135, 'S32_4485', 30, 91.85, 17),
(10135, 'S50_4713', 44, 78.92, 15),
(10136, 'S18_1129', 25, 117.48, 2),
(10136, 'S18_1984', 36, 120.91, 1),
(10136, 'S18_3232', 41, 169.34, 3),
(10137, 'S18_1589', 44, 115.73, 2),
(10137, 'S18_2870', 37, 110.88, 3),
(10137, 'S18_3685', 31, 118.68, 4),
(10137, 'S24_1628', 26, 40.25, 1),
(10138, 'S18_1749', 33, 149.60, 6),
(10138, 'S18_2248', 22, 51.46, 5),
(10138, 'S18_2325', 38, 114.42, 3),
(10138, 'S18_4409', 47, 79.15, 7),
(10138, 'S18_4933', 23, 64.86, 8),
(10138, 'S24_1046', 45, 59.53, 12),
(10138, 'S24_1937', 22, 33.19, 2),
(10138, 'S24_2022', 33, 38.53, 1),
(10138, 'S24_2766', 28, 73.60, 10),
(10138, 'S24_2887', 30, 96.30, 9),
(10138, 'S24_3191', 49, 77.05, 11),
(10138, 'S24_3432', 21, 99.58, 13),
(10138, 'S24_3969', 29, 32.82, 4),
(10139, 'S18_1342', 31, 89.38, 7),
(10139, 'S18_1367', 49, 52.83, 6),
(10139, 'S18_2795', 41, 151.88, 8),
(10139, 'S18_2949', 46, 91.18, 1),
(10139, 'S18_2957', 20, 52.47, 3),
(10139, 'S18_3136', 20, 101.58, 2),
(10139, 'S18_3320', 30, 81.35, 5),
(10139, 'S24_4258', 29, 93.49, 4),
(10140, 'S10_1949', 37, 186.44, 11),
(10140, 'S10_4962', 26, 131.49, 4),
(10140, 'S12_1666', 38, 118.90, 8),
(10140, 'S18_1097', 32, 95.67, 10),
(10140, 'S18_2432', 46, 51.05, 2),
(10140, 'S18_4600', 40, 100.50, 5),
(10140, 'S18_4668', 29, 40.25, 9),
(10140, 'S24_2300', 47, 118.84, 1),
(10140, 'S32_1268', 26, 87.64, 3),
(10140, 'S32_3522', 28, 62.05, 7),
(10140, 'S700_2824', 36, 101.15, 6),
(10141, 'S12_4473', 21, 114.95, 5),
(10141, 'S18_2238', 39, 160.46, 4),
(10141, 'S18_2319', 47, 103.09, 8),
(10141, 'S18_3232', 34, 143.94, 9),
(10141, 'S24_1444', 20, 50.86, 2),
(10141, 'S24_2840', 21, 32.18, 6),
(10141, 'S24_4048', 40, 104.09, 1),
(10141, 'S32_2509', 24, 53.03, 7),
(10141, 'S50_1392', 44, 94.92, 3),
(10142, 'S12_1108', 33, 166.24, 12),
(10142, 'S12_3148', 33, 140.50, 13),
(10142, 'S12_3891', 46, 167.83, 11),
(10142, 'S18_3140', 47, 129.76, 8),
(10142, 'S18_3259', 22, 95.80, 10),
(10142, 'S18_4027', 24, 122.08, 15),
(10142, 'S18_4522', 24, 79.87, 7),
(10142, 'S24_2011', 33, 114.29, 6),
(10142, 'S24_3151', 49, 74.35, 1),
(10142, 'S32_3207', 42, 60.90, 16),
(10142, 'S50_1514', 42, 56.24, 14),
(10142, 'S700_1138', 41, 55.34, 2),
(10142, 'S700_1938', 43, 77.08, 9),
(10142, 'S700_3505', 21, 92.16, 3),
(10142, 'S700_3962', 38, 91.37, 4),
(10142, 'S72_3212', 39, 46.96, 5),
(10143, 'S10_4757', 49, 133.28, 15),
(10143, 'S18_1662', 32, 126.15, 7),
(10143, 'S18_3029', 46, 70.54, 13),
(10143, 'S18_3856', 34, 99.52, 12),
(10143, 'S24_2841', 27, 63.71, 8),
(10143, 'S24_3420', 33, 59.83, 9),
(10143, 'S24_3816', 23, 74.64, 14),
(10143, 'S24_3949', 28, 55.96, 6),
(10143, 'S50_1341', 34, 34.91, 1),
(10143, 'S700_1691', 36, 86.77, 2),
(10143, 'S700_2047', 26, 87.80, 11),
(10143, 'S700_2466', 26, 79.78, 4),
(10143, 'S700_2610', 31, 69.39, 16),
(10143, 'S700_3167', 28, 70.40, 3),
(10143, 'S700_4002', 34, 65.15, 5),
(10143, 'S72_1253', 37, 49.66, 10),
(10144, 'S32_4289', 20, 56.41, 1),
(10145, 'S10_1678', 45, 76.56, 6),
(10145, 'S10_2016', 37, 104.67, 9),
(10145, 'S10_4698', 33, 154.93, 8),
(10145, 'S12_2823', 49, 146.10, 5),
(10145, 'S18_2581', 30, 71.81, 14),
(10145, 'S18_2625', 30, 52.70, 10),
(10145, 'S24_1578', 43, 103.68, 7),
(10145, 'S24_1785', 40, 87.54, 16),
(10145, 'S24_2000', 47, 63.98, 11),
(10145, 'S24_2360', 27, 56.10, 3),
(10145, 'S24_4278', 33, 71.73, 15),
(10145, 'S32_1374', 33, 99.89, 12),
(10145, 'S32_2206', 31, 39.43, 1),
(10145, 'S32_4485', 27, 95.93, 4),
(10145, 'S50_4713', 38, 73.22, 2),
(10145, 'S700_2834', 20, 113.90, 13),
(10146, 'S18_3782', 47, 60.30, 2),
(10146, 'S18_4721', 29, 130.94, 1),
(10147, 'S12_1099', 48, 161.49, 7),
(10147, 'S12_3380', 31, 110.39, 5),
(10147, 'S12_3990', 21, 74.21, 8),
(10147, 'S12_4675', 33, 97.89, 4),
(10147, 'S18_1889', 26, 70.84, 3),
(10147, 'S18_3278', 36, 74.78, 10),
(10147, 'S18_3482', 37, 129.35, 9),
(10147, 'S24_2972', 25, 33.23, 1),
(10147, 'S24_3371', 30, 48.98, 6),
(10147, 'S24_3856', 23, 123.58, 2),
(10147, 'S24_4620', 31, 72.76, 11),
(10148, 'S18_1129', 23, 114.65, 13),
(10148, 'S18_1589', 47, 108.26, 9),
(10148, 'S18_1984', 25, 136.56, 12),
(10148, 'S18_2870', 27, 113.52, 10),
(10148, 'S18_3232', 32, 143.94, 14),
(10148, 'S18_3685', 28, 135.63, 11),
(10148, 'S18_4409', 34, 83.75, 1),
(10148, 'S18_4933', 29, 66.28, 2),
(10148, 'S24_1046', 25, 65.41, 6),
(10148, 'S24_1628', 47, 46.29, 8),
(10148, 'S24_2766', 21, 77.24, 4),
(10148, 'S24_2887', 34, 115.09, 3),
(10148, 'S24_3191', 31, 71.91, 5),
(10148, 'S24_3432', 27, 96.37, 7),
(10149, 'S18_1342', 50, 87.33, 4),
(10149, 'S18_1367', 30, 48.52, 3),
(10149, 'S18_1749', 34, 156.40, 11),
(10149, 'S18_2248', 24, 50.85, 10),
(10149, 'S18_2325', 33, 125.86, 8),
(10149, 'S18_2795', 23, 167.06, 5),
(10149, 'S18_3320', 42, 89.29, 2),
(10149, 'S24_1937', 36, 31.20, 7),
(10149, 'S24_2022', 49, 39.87, 6),
(10149, 'S24_3969', 26, 38.57, 9),
(10149, 'S24_4258', 20, 90.57, 1),
(10150, 'S10_1949', 45, 182.16, 8),
(10150, 'S10_4962', 20, 121.15, 1),
(10150, 'S12_1666', 30, 135.30, 5),
(10150, 'S18_1097', 34, 95.67, 7),
(10150, 'S18_2949', 47, 93.21, 9),
(10150, 'S18_2957', 30, 56.21, 11),
(10150, 'S18_3136', 26, 97.39, 10),
(10150, 'S18_4600', 49, 111.39, 2),
(10150, 'S18_4668', 30, 47.29, 6),
(10150, 'S32_3522', 49, 62.05, 4),
(10150, 'S700_2824', 20, 95.08, 3),
(10151, 'S12_4473', 24, 114.95, 3),
(10151, 'S18_2238', 43, 152.27, 2),
(10151, 'S18_2319', 49, 106.78, 6),
(10151, 'S18_2432', 39, 58.34, 9),
(10151, 'S18_3232', 21, 167.65, 7),
(10151, 'S24_2300', 42, 109.90, 8),
(10151, 'S24_2840', 30, 29.35, 4),
(10151, 'S32_1268', 27, 84.75, 10),
(10151, 'S32_2509', 41, 43.29, 5),
(10151, 'S50_1392', 26, 108.81, 1),
(10152, 'S18_4027', 35, 117.77, 1),
(10152, 'S24_1444', 25, 49.13, 4),
(10152, 'S24_4048', 23, 112.37, 3),
(10152, 'S32_3207', 33, 57.17, 2),
(10153, 'S12_1108', 20, 201.57, 11),
(10153, 'S12_3148', 42, 128.42, 12),
(10153, 'S12_3891', 49, 155.72, 10),
(10153, 'S18_3140', 31, 125.66, 7),
(10153, 'S18_3259', 29, 82.69, 9),
(10153, 'S18_4522', 22, 82.50, 6),
(10153, 'S24_2011', 40, 111.83, 5),
(10153, 'S50_1514', 31, 53.31, 13),
(10153, 'S700_1138', 43, 58.00, 1),
(10153, 'S700_1938', 31, 80.55, 8),
(10153, 'S700_3505', 50, 87.15, 2),
(10153, 'S700_3962', 20, 85.41, 3),
(10153, 'S72_3212', 50, 51.87, 4),
(10154, 'S24_3151', 31, 75.23, 2),
(10154, 'S700_2610', 36, 59.27, 1),
(10155, 'S10_4757', 32, 129.20, 13),
(10155, 'S18_1662', 38, 138.77, 5),
(10155, 'S18_3029', 44, 83.44, 11),
(10155, 'S18_3856', 29, 105.87, 10),
(10155, 'S24_2841', 23, 62.34, 6),
(10155, 'S24_3420', 34, 56.55, 7),
(10155, 'S24_3816', 37, 76.31, 12),
(10155, 'S24_3949', 44, 58.69, 4),
(10155, 'S700_2047', 32, 89.61, 9),
(10155, 'S700_2466', 20, 87.75, 2),
(10155, 'S700_3167', 43, 76.80, 1),
(10155, 'S700_4002', 44, 70.33, 3),
(10155, 'S72_1253', 34, 49.16, 8),
(10156, 'S50_1341', 20, 43.64, 1),
(10156, 'S700_1691', 48, 77.64, 2),
(10157, 'S18_2581', 33, 69.27, 3),
(10157, 'S24_1785', 40, 89.72, 5),
(10157, 'S24_4278', 33, 66.65, 4),
(10157, 'S32_1374', 34, 83.91, 1),
(10157, 'S32_4289', 28, 56.41, 6),
(10157, 'S700_2834', 48, 109.16, 2),
(10158, 'S24_2000', 22, 67.79, 1),
(10159, 'S10_1678', 49, 81.35, 14),
(10159, 'S10_2016', 37, 101.10, 17),
(10159, 'S10_4698', 22, 170.42, 16),
(10159, 'S12_1099', 41, 188.73, 2),
(10159, 'S12_2823', 38, 131.04, 13),
(10159, 'S12_3990', 24, 67.03, 3),
(10159, 'S18_2625', 42, 51.48, 18),
(10159, 'S18_3278', 21, 66.74, 5),
(10159, 'S18_3482', 25, 129.35, 4),
(10159, 'S18_3782', 21, 54.71, 8),
(10159, 'S18_4721', 32, 142.85, 7),
(10159, 'S24_1578', 44, 100.30, 15),
(10159, 'S24_2360', 27, 67.18, 11),
(10159, 'S24_3371', 50, 49.60, 1),
(10159, 'S24_4620', 23, 80.84, 6),
(10159, 'S32_2206', 35, 39.43, 9),
(10159, 'S32_4485', 23, 86.74, 12),
(10159, 'S50_4713', 31, 78.11, 10),
(10160, 'S12_3380', 46, 96.30, 6),
(10160, 'S12_4675', 50, 93.28, 5),
(10160, 'S18_1889', 38, 70.84, 4),
(10160, 'S18_3232', 20, 140.55, 1),
(10160, 'S24_2972', 42, 30.59, 2),
(10160, 'S24_3856', 35, 130.60, 3),
(10161, 'S18_1129', 28, 121.72, 12),
(10161, 'S18_1589', 43, 102.04, 8),
(10161, 'S18_1984', 48, 139.41, 11),
(10161, 'S18_2870', 23, 125.40, 9),
(10161, 'S18_3685', 36, 132.80, 10),
(10161, 'S18_4933', 25, 62.72, 1),
(10161, 'S24_1046', 37, 73.49, 5),
(10161, 'S24_1628', 23, 47.29, 7),
(10161, 'S24_2766', 20, 82.69, 3),
(10161, 'S24_2887', 25, 108.04, 2),
(10161, 'S24_3191', 20, 72.77, 4),
(10161, 'S24_3432', 30, 94.23, 6),
(10162, 'S18_1342', 48, 87.33, 2),
(10162, 'S18_1367', 45, 45.28, 1),
(10162, 'S18_1749', 29, 141.10, 9),
(10162, 'S18_2248', 27, 53.28, 8),
(10162, 'S18_2325', 38, 113.15, 6),
(10162, 'S18_2795', 48, 156.94, 3),
(10162, 'S18_4409', 39, 86.51, 10),
(10162, 'S24_1937', 37, 27.55, 5),
(10162, 'S24_2022', 43, 38.98, 4),
(10162, 'S24_3969', 37, 32.82, 7),
(10163, 'S10_1949', 21, 212.16, 1),
(10163, 'S18_2949', 31, 101.31, 2),
(10163, 'S18_2957', 48, 59.96, 4),
(10163, 'S18_3136', 40, 101.58, 3),
(10163, 'S18_3320', 43, 80.36, 6),
(10163, 'S24_4258', 42, 96.42, 5),
(10164, 'S10_4962', 21, 143.31, 2),
(10164, 'S12_1666', 49, 121.64, 6),
(10164, 'S18_1097', 36, 103.84, 8),
(10164, 'S18_4600', 45, 107.76, 3),
(10164, 'S18_4668', 25, 46.29, 7),
(10164, 'S32_1268', 24, 91.49, 1),
(10164, 'S32_3522', 49, 57.53, 5),
(10164, 'S700_2824', 39, 86.99, 4),
(10165, 'S12_1108', 44, 168.32, 3),
(10165, 'S12_3148', 34, 123.89, 4),
(10165, 'S12_3891', 27, 152.26, 2),
(10165, 'S12_4473', 48, 109.02, 12),
(10165, 'S18_2238', 29, 134.26, 11),
(10165, 'S18_2319', 46, 120.28, 15),
(10165, 'S18_2432', 31, 60.77, 18),
(10165, 'S18_3232', 47, 154.10, 16),
(10165, 'S18_3259', 50, 84.71, 1),
(10165, 'S18_4027', 28, 123.51, 6),
(10165, 'S24_1444', 25, 46.82, 9),
(10165, 'S24_2300', 32, 117.57, 17),
(10165, 'S24_2840', 27, 31.12, 13),
(10165, 'S24_4048', 24, 106.45, 8),
(10165, 'S32_2509', 48, 50.86, 14),
(10165, 'S32_3207', 44, 55.30, 7),
(10165, 'S50_1392', 48, 106.49, 10),
(10165, 'S50_1514', 38, 49.21, 5),
(10166, 'S18_3140', 43, 136.59, 2),
(10166, 'S18_4522', 26, 72.85, 1),
(10166, 'S700_1938', 29, 76.22, 3),
(10167, 'S10_4757', 44, 123.76, 9),
(10167, 'S18_1662', 43, 141.92, 1),
(10167, 'S18_3029', 46, 69.68, 7),
(10167, 'S18_3856', 34, 84.70, 6),
(10167, 'S24_2011', 33, 110.60, 16),
(10167, 'S24_2841', 21, 54.81, 2),
(10167, 'S24_3151', 20, 77.00, 11),
(10167, 'S24_3420', 32, 64.44, 3),
(10167, 'S24_3816', 29, 73.80, 8),
(10167, 'S700_1138', 43, 66.00, 12),
(10167, 'S700_2047', 29, 87.80, 5),
(10167, 'S700_2610', 46, 62.16, 10),
(10167, 'S700_3505', 24, 85.14, 13),
(10167, 'S700_3962', 28, 83.42, 14),
(10167, 'S72_1253', 40, 42.71, 4),
(10167, 'S72_3212', 38, 43.68, 15),
(10168, 'S10_1678', 36, 94.74, 1),
(10168, 'S10_2016', 27, 97.53, 4),
(10168, 'S10_4698', 20, 160.74, 3),
(10168, 'S18_2581', 21, 75.19, 9),
(10168, 'S18_2625', 46, 49.06, 5),
(10168, 'S24_1578', 50, 103.68, 2),
(10168, 'S24_1785', 49, 93.01, 11),
(10168, 'S24_2000', 29, 72.36, 6),
(10168, 'S24_3949', 27, 57.32, 18),
(10168, 'S24_4278', 48, 68.10, 10),
(10168, 'S32_1374', 28, 89.90, 7),
(10168, 'S32_4289', 31, 57.78, 12),
(10168, 'S50_1341', 48, 39.71, 13),
(10168, 'S700_1691', 28, 91.34, 14),
(10168, 'S700_2466', 31, 87.75, 16),
(10168, 'S700_2834', 36, 94.92, 8),
(10168, 'S700_3167', 48, 72.00, 15),
(10168, 'S700_4002', 39, 67.37, 17),
(10169, 'S12_1099', 30, 163.44, 2),
(10169, 'S12_2823', 35, 126.52, 13),
(10169, 'S12_3990', 36, 71.82, 3),
(10169, 'S18_3278', 32, 65.13, 5),
(10169, 'S18_3482', 36, 136.70, 4),
(10169, 'S18_3782', 38, 52.84, 8),
(10169, 'S18_4721', 33, 120.53, 7),
(10169, 'S24_2360', 38, 66.49, 11),
(10169, 'S24_3371', 34, 53.27, 1),
(10169, 'S24_4620', 24, 77.61, 6),
(10169, 'S32_2206', 26, 37.01, 9),
(10169, 'S32_4485', 34, 83.68, 12),
(10169, 'S50_4713', 48, 75.66, 10),
(10170, 'S12_3380', 47, 116.27, 4),
(10170, 'S12_4675', 41, 93.28, 3),
(10170, 'S18_1889', 20, 70.07, 2),
(10170, 'S24_3856', 34, 130.60, 1),
(10171, 'S18_1129', 35, 134.46, 2),
(10171, 'S18_1984', 35, 128.03, 1),
(10171, 'S18_3232', 39, 165.95, 3),
(10171, 'S24_2972', 36, 34.74, 4),
(10172, 'S18_1589', 42, 109.51, 6),
(10172, 'S18_2870', 39, 117.48, 7),
(10172, 'S18_3685', 48, 139.87, 8),
(10172, 'S24_1046', 32, 61.00, 3),
(10172, 'S24_1628', 34, 43.27, 5),
(10172, 'S24_2766', 22, 79.97, 1),
(10172, 'S24_3191', 24, 77.91, 2),
(10172, 'S24_3432', 22, 87.81, 4),
(10173, 'S18_1342', 43, 101.71, 6),
(10173, 'S18_1367', 48, 51.75, 5),
(10173, 'S18_1749', 24, 168.30, 13),
(10173, 'S18_2248', 26, 55.09, 12),
(10173, 'S18_2325', 31, 127.13, 10),
(10173, 'S18_2795', 22, 140.06, 7),
(10173, 'S18_2957', 28, 56.84, 2),
(10173, 'S18_3136', 31, 86.92, 1),
(10173, 'S18_3320', 29, 90.28, 4),
(10173, 'S18_4409', 21, 77.31, 14),
(10173, 'S18_4933', 39, 58.44, 15),
(10173, 'S24_1937', 31, 29.87, 9),
(10173, 'S24_2022', 27, 39.42, 8),
(10173, 'S24_2887', 23, 98.65, 16),
(10173, 'S24_3969', 35, 35.70, 11),
(10173, 'S24_4258', 22, 93.49, 3),
(10174, 'S10_1949', 34, 207.87, 4),
(10174, 'S12_1666', 43, 113.44, 1),
(10174, 'S18_1097', 48, 108.50, 3),
(10174, 'S18_2949', 46, 100.30, 5),
(10174, 'S18_4668', 49, 44.27, 2),
(10175, 'S10_4962', 33, 119.67, 9),
(10175, 'S12_4473', 26, 109.02, 1),
(10175, 'S18_2319', 48, 101.87, 4),
(10175, 'S18_2432', 41, 59.55, 7),
(10175, 'S18_3232', 29, 150.71, 5),
(10175, 'S18_4600', 47, 102.92, 10),
(10175, 'S24_2300', 28, 121.40, 6),
(10175, 'S24_2840', 37, 32.18, 2),
(10175, 'S32_1268', 22, 89.57, 8),
(10175, 'S32_2509', 50, 50.86, 3),
(10175, 'S32_3522', 29, 56.24, 12),
(10175, 'S700_2824', 42, 80.92, 11),
(10176, 'S12_1108', 33, 166.24, 2),
(10176, 'S12_3148', 47, 145.04, 3),
(10176, 'S12_3891', 50, 160.91, 1),
(10176, 'S18_2238', 20, 139.17, 10),
(10176, 'S18_4027', 36, 140.75, 5),
(10176, 'S24_1444', 27, 55.49, 8),
(10176, 'S24_4048', 29, 101.72, 7),
(10176, 'S32_3207', 22, 62.14, 6),
(10176, 'S50_1392', 23, 109.96, 9),
(10176, 'S50_1514', 38, 52.14, 4),
(10177, 'S18_3140', 23, 113.37, 9),
(10177, 'S18_3259', 29, 92.77, 11),
(10177, 'S18_4522', 35, 82.50, 8),
(10177, 'S24_2011', 50, 115.52, 7),
(10177, 'S24_3151', 45, 79.66, 2),
(10177, 'S700_1138', 24, 58.67, 3),
(10177, 'S700_1938', 31, 77.95, 10),
(10177, 'S700_2610', 32, 64.33, 1),
(10177, 'S700_3505', 44, 88.15, 4),
(10177, 'S700_3962', 24, 83.42, 5),
(10177, 'S72_3212', 40, 52.96, 6),
(10178, 'S10_4757', 24, 131.92, 12),
(10178, 'S18_1662', 42, 127.73, 4),
(10178, 'S18_3029', 41, 70.54, 10),
(10178, 'S18_3856', 48, 104.81, 9),
(10178, 'S24_2841', 34, 67.82, 5),
(10178, 'S24_3420', 27, 65.75, 6),
(10178, 'S24_3816', 21, 68.77, 11),
(10178, 'S24_3949', 30, 64.15, 3),
(10178, 'S700_2047', 34, 86.90, 8),
(10178, 'S700_2466', 22, 91.74, 1),
(10178, 'S700_4002', 45, 68.11, 2),
(10178, 'S72_1253', 45, 41.71, 7),
(10179, 'S18_2581', 24, 82.79, 3),
(10179, 'S24_1785', 47, 105.04, 5),
(10179, 'S24_4278', 27, 66.65, 4),
(10179, 'S32_1374', 45, 86.90, 1),
(10179, 'S32_4289', 24, 63.97, 6),
(10179, 'S50_1341', 34, 43.20, 7),
(10179, 'S700_1691', 23, 75.81, 8),
(10179, 'S700_2834', 25, 98.48, 2),
(10179, 'S700_3167', 39, 80.00, 9),
(10180, 'S10_1678', 29, 76.56, 9),
(10180, 'S10_2016', 42, 99.91, 12),
(10180, 'S10_4698', 41, 164.61, 11),
(10180, 'S12_2823', 40, 131.04, 8),
(10180, 'S18_2625', 25, 48.46, 13),
(10180, 'S18_3782', 21, 59.06, 3),
(10180, 'S18_4721', 44, 147.31, 2),
(10180, 'S24_1578', 48, 98.05, 10),
(10180, 'S24_2000', 28, 61.70, 14),
(10180, 'S24_2360', 35, 60.95, 6),
(10180, 'S24_4620', 28, 68.71, 1),
(10180, 'S32_2206', 34, 33.39, 4),
(10180, 'S32_4485', 22, 102.05, 7),
(10180, 'S50_4713', 21, 74.85, 5),
(10181, 'S12_1099', 27, 155.66, 14),
(10181, 'S12_3380', 28, 113.92, 12),
(10181, 'S12_3990', 20, 67.03, 15),
(10181, 'S12_4675', 36, 107.10, 11),
(10181, 'S18_1129', 44, 124.56, 6),
(10181, 'S18_1589', 42, 124.44, 2),
(10181, 'S18_1889', 22, 74.69, 10),
(10181, 'S18_1984', 21, 129.45, 5),
(10181, 'S18_2870', 27, 130.68, 3),
(10181, 'S18_3232', 45, 147.33, 7),
(10181, 'S18_3278', 30, 73.17, 17),
(10181, 'S18_3482', 22, 120.53, 16),
(10181, 'S18_3685', 39, 137.04, 4),
(10181, 'S24_1628', 34, 45.28, 1),
(10181, 'S24_2972', 37, 32.85, 8),
(10181, 'S24_3371', 23, 54.49, 13),
(10181, 'S24_3856', 25, 122.17, 9),
(10182, 'S18_1342', 25, 83.22, 3),
(10182, 'S18_1367', 32, 44.21, 2),
(10182, 'S18_1749', 44, 159.80, 10),
(10182, 'S18_2248', 38, 54.49, 9),
(10182, 'S18_2325', 20, 105.52, 7),
(10182, 'S18_2795', 21, 135.00, 4),
(10182, 'S18_3320', 33, 86.31, 1),
(10182, 'S18_4409', 36, 88.35, 11),
(10182, 'S18_4933', 44, 61.29, 12),
(10182, 'S24_1046', 47, 63.20, 16),
(10182, 'S24_1937', 39, 31.86, 6),
(10182, 'S24_2022', 31, 39.87, 5),
(10182, 'S24_2766', 36, 87.24, 14),
(10182, 'S24_2887', 20, 116.27, 13),
(10182, 'S24_3191', 33, 73.62, 15),
(10182, 'S24_3432', 49, 95.30, 17),
(10182, 'S24_3969', 23, 34.88, 8),
(10183, 'S10_1949', 23, 180.01, 8),
(10183, 'S10_4962', 28, 127.06, 1),
(10183, 'S12_1666', 41, 114.80, 5),
(10183, 'S18_1097', 21, 108.50, 7),
(10183, 'S18_2949', 37, 91.18, 9),
(10183, 'S18_2957', 39, 51.22, 11),
(10183, 'S18_3136', 22, 90.06, 10),
(10183, 'S18_4600', 21, 118.66, 2),
(10183, 'S18_4668', 40, 42.26, 6),
(10183, 'S24_4258', 47, 81.81, 12),
(10183, 'S32_3522', 49, 52.36, 4),
(10183, 'S700_2824', 23, 85.98, 3),
(10184, 'S12_4473', 37, 105.47, 6),
(10184, 'S18_2238', 46, 145.72, 5),
(10184, 'S18_2319', 46, 119.05, 9),
(10184, 'S18_2432', 44, 60.77, 12),
(10184, 'S18_3232', 28, 165.95, 10),
(10184, 'S24_1444', 31, 57.22, 3),
(10184, 'S24_2300', 24, 117.57, 11),
(10184, 'S24_2840', 42, 30.06, 7),
(10184, 'S24_4048', 49, 114.73, 2),
(10184, 'S32_1268', 46, 84.75, 13),
(10184, 'S32_2509', 33, 52.49, 8),
(10184, 'S32_3207', 48, 59.03, 1),
(10184, 'S50_1392', 45, 92.60, 4),
(10185, 'S12_1108', 21, 195.33, 13),
(10185, 'S12_3148', 33, 146.55, 14),
(10185, 'S12_3891', 43, 147.07, 12),
(10185, 'S18_3140', 28, 124.30, 9),
(10185, 'S18_3259', 49, 94.79, 11),
(10185, 'S18_4027', 39, 127.82, 16),
(10185, 'S18_4522', 47, 87.77, 8),
(10185, 'S24_2011', 30, 105.69, 7),
(10185, 'S24_3151', 33, 83.20, 2),
(10185, 'S50_1514', 20, 46.86, 15),
(10185, 'S700_1138', 21, 64.67, 3),
(10185, 'S700_1938', 30, 79.68, 10),
(10185, 'S700_2610', 39, 61.44, 1),
(10185, 'S700_3505', 37, 99.17, 4),
(10185, 'S700_3962', 22, 93.35, 5),
(10185, 'S72_3212', 28, 47.50, 6),
(10186, 'S10_4757', 26, 108.80, 9),
(10186, 'S18_1662', 32, 137.19, 1),
(10186, 'S18_3029', 32, 73.12, 7),
(10186, 'S18_3856', 46, 98.46, 6),
(10186, 'S24_2841', 22, 60.29, 2),
(10186, 'S24_3420', 21, 59.83, 3),
(10186, 'S24_3816', 36, 68.77, 8),
(10186, 'S700_2047', 24, 80.56, 5),
(10186, 'S72_1253', 28, 42.71, 4),
(10187, 'S18_2581', 45, 70.12, 1),
(10187, 'S24_1785', 46, 96.29, 3),
(10187, 'S24_3949', 43, 55.96, 10),
(10187, 'S24_4278', 33, 64.48, 2),
(10187, 'S32_4289', 31, 61.22, 4),
(10187, 'S50_1341', 41, 39.71, 5),
(10187, 'S700_1691', 34, 84.95, 6),
(10187, 'S700_2466', 44, 95.73, 8),
(10187, 'S700_3167', 34, 72.00, 7),
(10187, 'S700_4002', 44, 70.33, 9),
(10188, 'S10_1678', 48, 95.70, 1),
(10188, 'S10_2016', 38, 111.80, 4),
(10188, 'S10_4698', 45, 182.04, 3),
(10188, 'S18_2625', 32, 52.09, 5),
(10188, 'S24_1578', 25, 95.80, 2),
(10188, 'S24_2000', 40, 61.70, 6),
(10188, 'S32_1374', 44, 81.91, 7),
(10188, 'S700_2834', 29, 96.11, 8),
(10189, 'S12_2823', 28, 138.57, 1),
(10190, 'S24_2360', 42, 58.87, 3),
(10190, 'S32_2206', 46, 38.62, 1),
(10190, 'S32_4485', 42, 89.80, 4),
(10190, 'S50_4713', 40, 67.53, 2),
(10191, 'S12_1099', 21, 155.66, 3),
(10191, 'S12_3380', 40, 104.52, 1),
(10191, 'S12_3990', 30, 70.22, 4),
(10191, 'S18_3278', 36, 75.59, 6),
(10191, 'S18_3482', 23, 119.06, 5),
(10191, 'S18_3782', 43, 60.93, 9),
(10191, 'S18_4721', 32, 136.90, 8),
(10191, 'S24_3371', 48, 53.27, 2),
(10191, 'S24_4620', 44, 77.61, 7),
(10192, 'S12_4675', 27, 99.04, 16),
(10192, 'S18_1129', 22, 140.12, 11),
(10192, 'S18_1589', 29, 100.80, 7),
(10192, 'S18_1889', 45, 70.84, 15),
(10192, 'S18_1984', 47, 128.03, 10),
(10192, 'S18_2870', 38, 110.88, 8),
(10192, 'S18_3232', 26, 137.17, 12),
(10192, 'S18_3685', 45, 125.74, 9),
(10192, 'S24_1046', 37, 72.02, 4),
(10192, 'S24_1628', 47, 49.30, 6),
(10192, 'S24_2766', 46, 86.33, 2),
(10192, 'S24_2887', 23, 112.74, 1),
(10192, 'S24_2972', 30, 33.23, 13),
(10192, 'S24_3191', 32, 69.34, 3),
(10192, 'S24_3432', 46, 93.16, 5),
(10192, 'S24_3856', 45, 112.34, 14),
(10193, 'S18_1342', 28, 92.47, 7),
(10193, 'S18_1367', 46, 46.36, 6),
(10193, 'S18_1749', 21, 153.00, 14),
(10193, 'S18_2248', 42, 60.54, 13),
(10193, 'S18_2325', 44, 115.69, 11),
(10193, 'S18_2795', 22, 143.44, 8),
(10193, 'S18_2949', 28, 87.13, 1),
(10193, 'S18_2957', 24, 53.09, 3),
(10193, 'S18_3136', 23, 97.39, 2),
(10193, 'S18_3320', 32, 79.37, 5),
(10193, 'S18_4409', 24, 92.03, 15),
(10193, 'S18_4933', 25, 66.28, 16),
(10193, 'S24_1937', 26, 32.19, 10),
(10193, 'S24_2022', 20, 44.80, 9),
(10193, 'S24_3969', 22, 38.16, 12),
(10193, 'S24_4258', 20, 92.52, 4),
(10194, 'S10_1949', 42, 203.59, 11),
(10194, 'S10_4962', 26, 134.44, 4),
(10194, 'S12_1666', 38, 124.37, 8),
(10194, 'S18_1097', 21, 103.84, 10),
(10194, 'S18_2432', 45, 51.05, 2),
(10194, 'S18_4600', 32, 113.82, 5),
(10194, 'S18_4668', 41, 47.79, 9),
(10194, 'S24_2300', 49, 112.46, 1),
(10194, 'S32_1268', 37, 77.05, 3),
(10194, 'S32_3522', 39, 61.41, 7),
(10194, 'S700_2824', 26, 80.92, 6),
(10195, 'S12_4473', 49, 118.50, 6),
(10195, 'S18_2238', 27, 139.17, 5),
(10195, 'S18_2319', 35, 112.91, 9),
(10195, 'S18_3232', 50, 150.71, 10),
(10195, 'S24_1444', 44, 54.33, 3),
(10195, 'S24_2840', 32, 31.82, 7),
(10195, 'S24_4048', 34, 95.81, 2),
(10195, 'S32_2509', 32, 51.95, 8),
(10195, 'S32_3207', 33, 59.03, 1),
(10195, 'S50_1392', 49, 97.23, 4),
(10196, 'S12_1108', 47, 203.64, 5),
(10196, 'S12_3148', 24, 151.08, 6),
(10196, 'S12_3891', 38, 147.07, 4),
(10196, 'S18_3140', 49, 127.03, 1),
(10196, 'S18_3259', 35, 81.68, 3),
(10196, 'S18_4027', 27, 126.39, 8),
(10196, 'S50_1514', 46, 56.82, 7),
(10196, 'S700_1938', 50, 84.88, 2),
(10197, 'S10_4757', 45, 118.32, 6),
(10197, 'S18_3029', 46, 83.44, 4),
(10197, 'S18_3856', 22, 85.75, 3),
(10197, 'S18_4522', 50, 78.99, 14),
(10197, 'S24_2011', 41, 109.37, 13),
(10197, 'S24_3151', 47, 83.20, 8),
(10197, 'S24_3816', 22, 67.93, 5),
(10197, 'S700_1138', 23, 60.00, 9),
(10197, 'S700_2047', 24, 78.75, 2),
(10197, 'S700_2610', 50, 66.50, 7),
(10197, 'S700_3505', 27, 100.17, 10),
(10197, 'S700_3962', 35, 88.39, 11),
(10197, 'S72_1253', 29, 39.73, 1),
(10197, 'S72_3212', 42, 48.59, 12),
(10198, 'S18_1662', 42, 149.81, 4),
(10198, 'S24_2841', 48, 60.97, 5),
(10198, 'S24_3420', 27, 61.81, 6),
(10198, 'S24_3949', 43, 65.51, 3),
(10198, 'S700_2466', 42, 94.73, 1),
(10198, 'S700_4002', 40, 74.03, 2),
(10199, 'S50_1341', 29, 37.97, 1),
(10199, 'S700_1691', 48, 81.29, 2),
(10199, 'S700_3167', 38, 70.40, 3),
(10200, 'S18_2581', 28, 74.34, 3),
(10200, 'S24_1785', 33, 99.57, 5),
(10200, 'S24_4278', 39, 70.28, 4),
(10200, 'S32_1374', 35, 80.91, 1),
(10200, 'S32_4289', 27, 65.35, 6),
(10200, 'S700_2834', 39, 115.09, 2),
(10201, 'S10_1678', 22, 82.30, 2),
(10201, 'S10_2016', 24, 116.56, 5),
(10201, 'S10_4698', 49, 191.72, 4),
(10201, 'S12_2823', 25, 126.52, 1),
(10201, 'S18_2625', 30, 48.46, 6),
(10201, 'S24_1578', 39, 93.54, 3),
(10201, 'S24_2000', 25, 66.27, 7),
(10202, 'S18_3782', 30, 55.33, 3),
(10202, 'S18_4721', 43, 124.99, 2),
(10202, 'S24_2360', 50, 56.10, 6),
(10202, 'S24_4620', 50, 75.18, 1),
(10202, 'S32_2206', 27, 33.39, 4),
(10202, 'S32_4485', 31, 81.64, 7),
(10202, 'S50_4713', 40, 79.73, 5),
(10203, 'S12_1099', 20, 161.49, 8),
(10203, 'S12_3380', 20, 111.57, 6),
(10203, 'S12_3990', 44, 63.84, 9),
(10203, 'S12_4675', 47, 115.16, 5),
(10203, 'S18_1889', 45, 73.15, 4),
(10203, 'S18_3232', 48, 157.49, 1),
(10203, 'S18_3278', 33, 66.74, 11),
(10203, 'S18_3482', 32, 127.88, 10),
(10203, 'S24_2972', 21, 33.23, 2),
(10203, 'S24_3371', 34, 56.94, 7),
(10203, 'S24_3856', 47, 140.43, 3),
(10204, 'S18_1129', 42, 114.65, 17),
(10204, 'S18_1589', 40, 113.24, 13),
(10204, 'S18_1749', 33, 153.00, 4),
(10204, 'S18_1984', 38, 133.72, 16),
(10204, 'S18_2248', 23, 59.33, 3),
(10204, 'S18_2325', 26, 119.50, 1),
(10204, 'S18_2870', 27, 106.92, 14),
(10204, 'S18_3685', 35, 132.80, 15),
(10204, 'S18_4409', 29, 83.75, 5),
(10204, 'S18_4933', 45, 69.84, 6),
(10204, 'S24_1046', 20, 69.82, 10),
(10204, 'S24_1628', 45, 46.79, 12),
(10204, 'S24_2766', 47, 79.06, 8),
(10204, 'S24_2887', 42, 112.74, 7),
(10204, 'S24_3191', 40, 84.75, 9),
(10204, 'S24_3432', 48, 104.94, 11),
(10204, 'S24_3969', 39, 34.88, 2),
(10205, 'S18_1342', 36, 98.63, 2),
(10205, 'S18_1367', 48, 45.82, 1),
(10205, 'S18_2795', 40, 138.38, 3),
(10205, 'S24_1937', 32, 27.88, 5),
(10205, 'S24_2022', 24, 36.74, 4),
(10206, 'S10_1949', 47, 203.59, 6),
(10206, 'S12_1666', 28, 109.34, 3),
(10206, 'S18_1097', 34, 115.50, 5),
(10206, 'S18_2949', 37, 98.27, 7),
(10206, 'S18_2957', 28, 51.84, 9),
(10206, 'S18_3136', 30, 102.63, 8),
(10206, 'S18_3320', 28, 99.21, 11),
(10206, 'S18_4668', 21, 45.78, 4),
(10206, 'S24_4258', 33, 95.44, 10),
(10206, 'S32_3522', 36, 54.94, 2),
(10206, 'S700_2824', 33, 89.01, 1),
(10207, 'S10_4962', 31, 125.58, 15),
(10207, 'S12_4473', 34, 95.99, 7),
(10207, 'S18_2238', 44, 140.81, 6),
(10207, 'S18_2319', 43, 109.23, 10),
(10207, 'S18_2432', 37, 60.77, 13),
(10207, 'S18_3232', 25, 140.55, 11),
(10207, 'S18_4027', 40, 143.62, 1),
(10207, 'S18_4600', 47, 119.87, 16),
(10207, 'S24_1444', 49, 57.80, 4),
(10207, 'S24_2300', 46, 127.79, 12),
(10207, 'S24_2840', 42, 30.76, 8),
(10207, 'S24_4048', 28, 108.82, 3),
(10207, 'S32_1268', 49, 84.75, 14),
(10207, 'S32_2509', 27, 51.95, 9),
(10207, 'S32_3207', 45, 55.30, 2),
(10207, 'S50_1392', 28, 106.49, 5),
(10208, 'S12_1108', 46, 176.63, 13),
(10208, 'S12_3148', 26, 128.42, 14),
(10208, 'S12_3891', 20, 152.26, 12),
(10208, 'S18_3140', 24, 117.47, 9),
(10208, 'S18_3259', 48, 96.81, 11),
(10208, 'S18_4522', 45, 72.85, 8),
(10208, 'S24_2011', 35, 122.89, 7),
(10208, 'S24_3151', 20, 80.54, 2),
(10208, 'S50_1514', 30, 57.99, 15),
(10208, 'S700_1138', 38, 56.67, 3),
(10208, 'S700_1938', 40, 73.62, 10),
(10208, 'S700_2610', 46, 63.61, 1),
(10208, 'S700_3505', 37, 95.16, 4),
(10208, 'S700_3962', 33, 95.34, 5),
(10208, 'S72_3212', 42, 48.05, 6),
(10209, 'S10_4757', 39, 129.20, 8),
(10209, 'S18_3029', 28, 82.58, 6),
(10209, 'S18_3856', 20, 97.40, 5),
(10209, 'S24_2841', 43, 66.45, 1),
(10209, 'S24_3420', 36, 56.55, 2),
(10209, 'S24_3816', 22, 79.67, 7),
(10209, 'S700_2047', 33, 90.52, 4),
(10209, 'S72_1253', 48, 44.20, 3),
(10210, 'S10_2016', 23, 112.99, 2),
(10210, 'S10_4698', 34, 189.79, 1),
(10210, 'S18_1662', 31, 141.92, 17),
(10210, 'S18_2581', 50, 68.43, 7),
(10210, 'S18_2625', 40, 51.48, 3),
(10210, 'S24_1785', 27, 100.67, 9),
(10210, 'S24_2000', 30, 63.22, 4),
(10210, 'S24_3949', 29, 56.64, 16),
(10210, 'S24_4278', 40, 68.10, 8),
(10210, 'S32_1374', 46, 84.91, 5),
(10210, 'S32_4289', 39, 57.10, 10),
(10210, 'S50_1341', 43, 43.20, 11),
(10210, 'S700_1691', 21, 87.69, 12),
(10210, 'S700_2466', 26, 93.74, 14),
(10210, 'S700_2834', 25, 98.48, 6),
(10210, 'S700_3167', 31, 64.00, 13),
(10210, 'S700_4002', 42, 60.70, 15),
(10211, 'S10_1678', 41, 90.92, 14),
(10211, 'S12_1099', 41, 171.22, 2),
(10211, 'S12_2823', 36, 126.52, 13),
(10211, 'S12_3990', 28, 79.80, 3),
(10211, 'S18_3278', 35, 73.17, 5),
(10211, 'S18_3482', 28, 138.17, 4),
(10211, 'S18_3782', 46, 60.30, 8),
(10211, 'S18_4721', 41, 148.80, 7),
(10211, 'S24_1578', 25, 109.32, 15),
(10211, 'S24_2360', 21, 62.33, 11),
(10211, 'S24_3371', 48, 52.66, 1),
(10211, 'S24_4620', 22, 80.84, 6),
(10211, 'S32_2206', 41, 39.83, 9),
(10211, 'S32_4485', 37, 94.91, 12),
(10211, 'S50_4713', 40, 70.78, 10),
(10212, 'S12_3380', 39, 99.82, 16),
(10212, 'S12_4675', 33, 110.55, 15),
(10212, 'S18_1129', 29, 117.48, 10),
(10212, 'S18_1589', 38, 105.77, 6),
(10212, 'S18_1889', 20, 64.68, 14),
(10212, 'S18_1984', 41, 133.72, 9),
(10212, 'S18_2870', 40, 117.48, 7),
(10212, 'S18_3232', 40, 155.79, 11),
(10212, 'S18_3685', 45, 115.85, 8),
(10212, 'S24_1046', 41, 61.73, 3),
(10212, 'S24_1628', 45, 43.27, 5),
(10212, 'S24_2766', 45, 81.78, 1),
(10212, 'S24_2972', 34, 37.38, 12),
(10212, 'S24_3191', 27, 77.91, 2),
(10212, 'S24_3432', 46, 100.66, 4),
(10212, 'S24_3856', 49, 117.96, 13),
(10213, 'S18_4409', 38, 84.67, 1),
(10213, 'S18_4933', 25, 58.44, 2),
(10213, 'S24_2887', 27, 97.48, 3),
(10214, 'S18_1749', 30, 166.60, 7),
(10214, 'S18_2248', 21, 53.28, 6),
(10214, 'S18_2325', 27, 125.86, 4),
(10214, 'S18_2795', 50, 167.06, 1),
(10214, 'S24_1937', 20, 32.19, 3),
(10214, 'S24_2022', 49, 39.87, 2),
(10214, 'S24_3969', 44, 38.57, 5),
(10215, 'S10_1949', 35, 205.73, 3),
(10215, 'S18_1097', 46, 100.34, 2),
(10215, 'S18_1342', 27, 92.47, 10),
(10215, 'S18_1367', 33, 53.91, 9),
(10215, 'S18_2949', 49, 97.26, 4),
(10215, 'S18_2957', 31, 56.21, 6),
(10215, 'S18_3136', 49, 89.01, 5),
(10215, 'S18_3320', 41, 84.33, 8),
(10215, 'S18_4668', 46, 42.76, 1),
(10215, 'S24_4258', 39, 94.47, 7),
(10216, 'S12_1666', 43, 133.94, 1),
(10217, 'S10_4962', 48, 132.97, 4),
(10217, 'S18_2432', 35, 58.34, 2),
(10217, 'S18_4600', 38, 118.66, 5),
(10217, 'S24_2300', 28, 103.51, 1),
(10217, 'S32_1268', 21, 78.97, 3),
(10217, 'S32_3522', 39, 56.24, 7),
(10217, 'S700_2824', 31, 90.02, 6),
(10218, 'S18_2319', 22, 110.46, 1),
(10218, 'S18_3232', 34, 152.41, 2),
(10219, 'S12_4473', 48, 94.80, 2),
(10219, 'S18_2238', 43, 132.62, 1),
(10219, 'S24_2840', 21, 31.12, 3),
(10219, 'S32_2509', 35, 47.62, 4),
(10220, 'S12_1108', 32, 189.10, 2),
(10220, 'S12_3148', 30, 151.08, 3),
(10220, 'S12_3891', 27, 166.10, 1),
(10220, 'S18_4027', 50, 126.39, 5),
(10220, 'S24_1444', 26, 48.55, 8),
(10220, 'S24_4048', 37, 101.72, 7),
(10220, 'S32_3207', 20, 49.71, 6),
(10220, 'S50_1392', 37, 92.60, 9),
(10220, 'S50_1514', 30, 56.82, 4),
(10221, 'S18_3140', 33, 133.86, 3),
(10221, 'S18_3259', 23, 89.75, 5),
(10221, 'S18_4522', 39, 84.26, 2),
(10221, 'S24_2011', 49, 113.06, 1),
(10221, 'S700_1938', 23, 69.29, 4),
(10222, 'S10_4757', 49, 133.28, 12),
(10222, 'S18_1662', 49, 137.19, 4),
(10222, 'S18_3029', 49, 79.14, 10),
(10222, 'S18_3856', 45, 88.93, 9),
(10222, 'S24_2841', 32, 56.86, 5),
(10222, 'S24_3151', 47, 74.35, 14),
(10222, 'S24_3420', 43, 61.15, 6),
(10222, 'S24_3816', 46, 77.99, 11),
(10222, 'S24_3949', 48, 55.27, 3),
(10222, 'S700_1138', 31, 58.67, 15),
(10222, 'S700_2047', 26, 80.56, 8),
(10222, 'S700_2466', 37, 90.75, 1),
(10222, 'S700_2610', 36, 69.39, 13),
(10222, 'S700_3505', 38, 84.14, 16),
(10222, 'S700_3962', 31, 81.43, 17),
(10222, 'S700_4002', 43, 66.63, 2),
(10222, 'S72_1253', 31, 45.19, 7),
(10222, 'S72_3212', 36, 48.59, 18),
(10223, 'S10_1678', 37, 80.39, 1),
(10223, 'S10_2016', 47, 110.61, 4),
(10223, 'S10_4698', 49, 189.79, 3),
(10223, 'S18_2581', 47, 67.58, 9),
(10223, 'S18_2625', 28, 58.75, 5),
(10223, 'S24_1578', 32, 104.81, 2),
(10223, 'S24_1785', 34, 87.54, 11),
(10223, 'S24_2000', 38, 60.94, 6),
(10223, 'S24_4278', 23, 68.10, 10),
(10223, 'S32_1374', 21, 90.90, 7),
(10223, 'S32_4289', 20, 66.73, 12),
(10223, 'S50_1341', 41, 41.02, 13),
(10223, 'S700_1691', 25, 84.03, 14),
(10223, 'S700_2834', 29, 113.90, 8),
(10223, 'S700_3167', 26, 79.20, 15),
(10224, 'S12_2823', 43, 141.58, 6),
(10224, 'S18_3782', 38, 57.20, 1),
(10224, 'S24_2360', 37, 60.26, 4),
(10224, 'S32_2206', 43, 37.01, 2),
(10224, 'S32_4485', 30, 94.91, 5),
(10224, 'S50_4713', 50, 81.36, 3),
(10225, 'S12_1099', 27, 157.60, 9),
(10225, 'S12_3380', 25, 101.00, 7),
(10225, 'S12_3990', 37, 64.64, 10),
(10225, 'S12_4675', 21, 100.19, 6),
(10225, 'S18_1129', 32, 116.06, 1),
(10225, 'S18_1889', 47, 71.61, 5),
(10225, 'S18_3232', 43, 162.57, 2),
(10225, 'S18_3278', 37, 69.96, 12),
(10225, 'S18_3482', 27, 119.06, 11),
(10225, 'S18_4721', 35, 135.41, 14),
(10225, 'S24_2972', 42, 34.74, 3),
(10225, 'S24_3371', 24, 51.43, 8),
(10225, 'S24_3856', 40, 130.60, 4),
(10225, 'S24_4620', 46, 77.61, 13),
(10226, 'S18_1589', 38, 108.26, 4),
(10226, 'S18_1984', 24, 129.45, 7),
(10226, 'S18_2870', 24, 125.40, 5),
(10226, 'S18_3685', 46, 122.91, 6),
(10226, 'S24_1046', 21, 65.41, 1),
(10226, 'S24_1628', 36, 47.79, 3),
(10226, 'S24_3432', 48, 95.30, 2),
(10227, 'S18_1342', 25, 85.27, 3),
(10227, 'S18_1367', 31, 50.14, 2),
(10227, 'S18_1749', 26, 136.00, 10),
(10227, 'S18_2248', 28, 59.93, 9),
(10227, 'S18_2325', 46, 118.23, 7),
(10227, 'S18_2795', 29, 146.81, 4),
(10227, 'S18_3320', 33, 99.21, 1),
(10227, 'S18_4409', 34, 87.43, 11),
(10227, 'S18_4933', 37, 70.56, 12),
(10227, 'S24_1937', 42, 27.22, 6),
(10227, 'S24_2022', 24, 39.42, 5),
(10227, 'S24_2766', 47, 84.51, 14),
(10227, 'S24_2887', 33, 102.17, 13),
(10227, 'S24_3191', 40, 78.76, 15),
(10227, 'S24_3969', 27, 34.88, 8),
(10228, 'S10_1949', 29, 214.30, 2),
(10228, 'S18_1097', 32, 100.34, 1),
(10228, 'S18_2949', 24, 101.31, 3),
(10228, 'S18_2957', 45, 57.46, 5),
(10228, 'S18_3136', 31, 100.53, 4),
(10228, 'S24_4258', 33, 84.73, 6),
(10229, 'S10_4962', 50, 138.88, 9),
(10229, 'S12_1666', 25, 110.70, 13),
(10229, 'S12_4473', 36, 95.99, 1),
(10229, 'S18_2319', 26, 104.32, 4),
(10229, 'S18_2432', 28, 53.48, 7),
(10229, 'S18_3232', 22, 157.49, 5),
(10229, 'S18_4600', 41, 119.87, 10),
(10229, 'S18_4668', 39, 43.77, 14),
(10229, 'S24_2300', 48, 115.01, 6),
(10229, 'S24_2840', 33, 34.65, 2),
(10229, 'S32_1268', 25, 78.97, 8),
(10229, 'S32_2509', 23, 49.78, 3),
(10229, 'S32_3522', 30, 52.36, 12),
(10229, 'S700_2824', 50, 91.04, 11),
(10230, 'S12_3148', 43, 128.42, 1),
(10230, 'S18_2238', 49, 153.91, 8),
(10230, 'S18_4027', 42, 142.18, 3),
(10230, 'S24_1444', 36, 47.40, 6),
(10230, 'S24_4048', 45, 99.36, 5),
(10230, 'S32_3207', 46, 59.03, 4),
(10230, 'S50_1392', 34, 100.70, 7),
(10230, 'S50_1514', 43, 57.41, 2),
(10231, 'S12_1108', 42, 193.25, 2),
(10231, 'S12_3891', 49, 147.07, 1),
(10232, 'S18_3140', 22, 133.86, 6),
(10232, 'S18_3259', 48, 97.81, 8),
(10232, 'S18_4522', 23, 78.12, 5),
(10232, 'S24_2011', 46, 113.06, 4),
(10232, 'S700_1938', 26, 84.88, 7),
(10232, 'S700_3505', 48, 86.15, 1),
(10232, 'S700_3962', 35, 81.43, 2),
(10232, 'S72_3212', 24, 48.59, 3),
(10233, 'S24_3151', 40, 70.81, 2),
(10233, 'S700_1138', 36, 66.00, 3),
(10233, 'S700_2610', 29, 67.94, 1),
(10234, 'S10_4757', 48, 118.32, 9),
(10234, 'S18_1662', 50, 146.65, 1),
(10234, 'S18_3029', 48, 84.30, 7),
(10234, 'S18_3856', 39, 85.75, 6),
(10234, 'S24_2841', 44, 67.14, 2),
(10234, 'S24_3420', 25, 65.09, 3),
(10234, 'S24_3816', 31, 78.83, 8),
(10234, 'S700_2047', 29, 83.28, 5),
(10234, 'S72_1253', 40, 45.69, 4),
(10235, 'S18_2581', 24, 81.95, 3),
(10235, 'S24_1785', 23, 89.72, 5),
(10235, 'S24_3949', 33, 55.27, 12),
(10235, 'S24_4278', 40, 63.03, 4),
(10235, 'S32_1374', 41, 90.90, 1),
(10235, 'S32_4289', 34, 66.73, 6),
(10235, 'S50_1341', 41, 37.09, 7),
(10235, 'S700_1691', 25, 88.60, 8),
(10235, 'S700_2466', 38, 92.74, 10),
(10235, 'S700_2834', 25, 116.28, 2),
(10235, 'S700_3167', 32, 73.60, 9),
(10235, 'S700_4002', 34, 70.33, 11),
(10236, 'S10_2016', 22, 105.86, 1),
(10236, 'S18_2625', 23, 52.70, 2),
(10236, 'S24_2000', 36, 65.51, 3),
(10237, 'S10_1678', 23, 91.87, 7),
(10237, 'S10_4698', 39, 158.80, 9),
(10237, 'S12_2823', 32, 129.53, 6),
(10237, 'S18_3782', 26, 49.74, 1),
(10237, 'S24_1578', 20, 109.32, 8),
(10237, 'S24_2360', 26, 62.33, 4),
(10237, 'S32_2206', 26, 35.00, 2),
(10237, 'S32_4485', 27, 94.91, 5),
(10237, 'S50_4713', 20, 78.92, 3),
(10238, 'S12_1099', 28, 161.49, 3),
(10238, 'S12_3380', 29, 104.52, 1),
(10238, 'S12_3990', 20, 73.42, 4),
(10238, 'S18_3278', 41, 68.35, 6),
(10238, 'S18_3482', 49, 144.05, 5),
(10238, 'S18_4721', 44, 120.53, 8),
(10238, 'S24_3371', 47, 53.88, 2),
(10238, 'S24_4620', 22, 67.91, 7),
(10239, 'S12_4675', 21, 100.19, 5),
(10239, 'S18_1889', 46, 70.07, 4),
(10239, 'S18_3232', 47, 135.47, 1),
(10239, 'S24_2972', 20, 32.47, 2),
(10239, 'S24_3856', 29, 133.41, 3),
(10240, 'S18_1129', 41, 125.97, 3),
(10240, 'S18_1984', 37, 136.56, 2),
(10240, 'S18_3685', 37, 134.22, 1),
(10241, 'S18_1589', 21, 119.46, 11),
(10241, 'S18_1749', 41, 153.00, 2),
(10241, 'S18_2248', 33, 55.70, 1),
(10241, 'S18_2870', 44, 126.72, 12),
(10241, 'S18_4409', 42, 77.31, 3),
(10241, 'S18_4933', 30, 62.72, 4),
(10241, 'S24_1046', 22, 72.02, 8),
(10241, 'S24_1628', 21, 47.29, 10),
(10241, 'S24_2766', 47, 89.05, 6),
(10241, 'S24_2887', 28, 117.44, 5),
(10241, 'S24_3191', 26, 69.34, 7),
(10241, 'S24_3432', 27, 107.08, 9),
(10242, 'S24_3969', 46, 36.52, 1),
(10243, 'S18_2325', 47, 111.87, 2),
(10243, 'S24_1937', 33, 30.87, 1),
(10244, 'S18_1342', 40, 99.66, 7),
(10244, 'S18_1367', 20, 48.52, 6),
(10244, 'S18_2795', 43, 141.75, 8),
(10244, 'S18_2949', 30, 87.13, 1),
(10244, 'S18_2957', 24, 54.96, 3),
(10244, 'S18_3136', 29, 85.87, 2),
(10244, 'S18_3320', 36, 87.30, 5),
(10244, 'S24_2022', 39, 42.11, 9),
(10244, 'S24_4258', 40, 97.39, 4),
(10245, 'S10_1949', 34, 195.01, 9),
(10245, 'S10_4962', 28, 147.74, 2),
(10245, 'S12_1666', 38, 120.27, 6),
(10245, 'S18_1097', 29, 114.34, 8),
(10245, 'S18_4600', 21, 111.39, 3),
(10245, 'S18_4668', 45, 48.80, 7),
(10245, 'S32_1268', 37, 81.86, 1),
(10245, 'S32_3522', 44, 54.94, 5),
(10245, 'S700_2824', 44, 81.93, 4),
(10246, 'S12_4473', 46, 99.54, 5),
(10246, 'S18_2238', 40, 144.08, 4),
(10246, 'S18_2319', 22, 100.64, 8),
(10246, 'S18_2432', 30, 57.73, 11),
(10246, 'S18_3232', 36, 145.63, 9),
(10246, 'S24_1444', 44, 46.24, 2),
(10246, 'S24_2300', 29, 118.84, 10),
(10246, 'S24_2840', 49, 34.65, 6),
(10246, 'S24_4048', 46, 100.54, 1),
(10246, 'S32_2509', 35, 45.45, 7),
(10246, 'S50_1392', 22, 113.44, 3),
(10247, 'S12_1108', 44, 195.33, 2),
(10247, 'S12_3148', 25, 140.50, 3),
(10247, 'S12_3891', 27, 167.83, 1),
(10247, 'S18_4027', 48, 143.62, 5),
(10247, 'S32_3207', 40, 58.41, 6),
(10247, 'S50_1514', 49, 51.55, 4),
(10248, 'S10_4757', 20, 126.48, 3),
(10248, 'S18_3029', 21, 80.86, 1),
(10248, 'S18_3140', 32, 133.86, 12),
(10248, 'S18_3259', 42, 95.80, 14),
(10248, 'S18_4522', 42, 87.77, 11),
(10248, 'S24_2011', 48, 122.89, 10),
(10248, 'S24_3151', 30, 85.85, 5),
(10248, 'S24_3816', 23, 83.02, 2),
(10248, 'S700_1138', 36, 66.00, 6),
(10248, 'S700_1938', 40, 81.41, 13),
(10248, 'S700_2610', 32, 69.39, 4),
(10248, 'S700_3505', 30, 84.14, 7),
(10248, 'S700_3962', 35, 92.36, 8),
(10248, 'S72_3212', 23, 53.51, 9),
(10249, 'S18_3856', 46, 88.93, 5),
(10249, 'S24_2841', 20, 54.81, 1),
(10249, 'S24_3420', 25, 65.75, 2),
(10249, 'S700_2047', 40, 85.99, 4),
(10249, 'S72_1253', 32, 49.16, 3),
(10250, 'S18_1662', 45, 148.23, 14),
(10250, 'S18_2581', 27, 84.48, 4),
(10250, 'S24_1785', 31, 95.20, 6),
(10250, 'S24_2000', 32, 63.22, 1),
(10250, 'S24_3949', 40, 61.42, 13),
(10250, 'S24_4278', 37, 72.45, 5),
(10250, 'S32_1374', 31, 99.89, 2),
(10250, 'S32_4289', 50, 62.60, 7),
(10250, 'S50_1341', 36, 36.66, 8),
(10250, 'S700_1691', 31, 91.34, 9),
(10250, 'S700_2466', 35, 90.75, 11),
(10250, 'S700_2834', 44, 98.48, 3),
(10250, 'S700_3167', 44, 76.00, 10),
(10250, 'S700_4002', 38, 65.89, 12),
(10251, 'S10_1678', 59, 93.79, 2),
(10251, 'S10_2016', 44, 115.37, 5),
(10251, 'S10_4698', 43, 172.36, 4),
(10251, 'S12_2823', 46, 129.53, 1),
(10251, 'S18_2625', 44, 58.15, 6),
(10251, 'S24_1578', 50, 91.29, 3),
(10252, 'S18_3278', 20, 74.78, 2),
(10252, 'S18_3482', 41, 145.52, 1),
(10252, 'S18_3782', 31, 50.36, 5),
(10252, 'S18_4721', 26, 127.97, 4),
(10252, 'S24_2360', 47, 63.03, 8),
(10252, 'S24_4620', 38, 69.52, 3),
(10252, 'S32_2206', 36, 36.21, 6),
(10252, 'S32_4485', 25, 93.89, 9),
(10252, 'S50_4713', 48, 72.41, 7),
(10253, 'S12_1099', 24, 157.60, 13),
(10253, 'S12_3380', 22, 102.17, 11),
(10253, 'S12_3990', 25, 67.03, 14),
(10253, 'S12_4675', 41, 109.40, 10),
(10253, 'S18_1129', 26, 130.22, 5),
(10253, 'S18_1589', 24, 103.29, 1),
(10253, 'S18_1889', 23, 67.76, 9),
(10253, 'S18_1984', 33, 130.87, 4),
(10253, 'S18_2870', 37, 114.84, 2),
(10253, 'S18_3232', 40, 145.63, 6),
(10253, 'S18_3685', 31, 139.87, 3),
(10253, 'S24_2972', 40, 34.74, 7),
(10253, 'S24_3371', 24, 50.82, 12),
(10253, 'S24_3856', 39, 115.15, 8),
(10254, 'S18_1749', 49, 137.70, 5),
(10254, 'S18_2248', 36, 55.09, 4),
(10254, 'S18_2325', 41, 102.98, 2),
(10254, 'S18_4409', 34, 80.99, 6),
(10254, 'S18_4933', 30, 59.87, 7),
(10254, 'S24_1046', 34, 66.88, 11),
(10254, 'S24_1628', 32, 43.27, 13),
(10254, 'S24_1937', 38, 28.88, 1),
(10254, 'S24_2766', 31, 85.42, 9),
(10254, 'S24_2887', 33, 111.57, 8),
(10254, 'S24_3191', 42, 69.34, 10),
(10254, 'S24_3432', 49, 101.73, 12),
(10254, 'S24_3969', 20, 39.80, 3),
(10255, 'S18_2795', 24, 135.00, 1),
(10255, 'S24_2022', 37, 37.63, 2),
(10256, 'S18_1342', 34, 93.49, 2),
(10256, 'S18_1367', 29, 52.83, 1),
(10257, 'S18_2949', 50, 92.19, 1),
(10257, 'S18_2957', 49, 59.34, 3),
(10257, 'S18_3136', 37, 83.78, 2),
(10257, 'S18_3320', 26, 91.27, 5),
(10257, 'S24_4258', 46, 81.81, 4),
(10258, 'S10_1949', 32, 177.87, 6),
(10258, 'S12_1666', 41, 133.94, 3),
(10258, 'S18_1097', 41, 113.17, 5),
(10258, 'S18_4668', 21, 49.81, 4),
(10258, 'S32_3522', 20, 62.70, 2),
(10258, 'S700_2824', 45, 86.99, 1),
(10259, 'S10_4962', 26, 121.15, 12),
(10259, 'S12_4473', 46, 117.32, 4),
(10259, 'S18_2238', 30, 134.26, 3),
(10259, 'S18_2319', 34, 120.28, 7),
(10259, 'S18_2432', 30, 59.55, 10),
(10259, 'S18_3232', 27, 152.41, 8),
(10259, 'S18_4600', 41, 107.76, 13),
(10259, 'S24_1444', 28, 46.82, 1),
(10259, 'S24_2300', 47, 121.40, 9),
(10259, 'S24_2840', 31, 31.47, 5),
(10259, 'S32_1268', 45, 95.35, 11),
(10259, 'S32_2509', 40, 45.99, 6),
(10259, 'S50_1392', 29, 105.33, 2),
(10260, 'S12_1108', 46, 180.79, 5),
(10260, 'S12_3148', 30, 140.50, 6),
(10260, 'S12_3891', 44, 169.56, 4),
(10260, 'S18_3140', 32, 121.57, 1),
(10260, 'S18_3259', 29, 92.77, 3),
(10260, 'S18_4027', 23, 137.88, 8),
(10260, 'S24_4048', 23, 117.10, 10),
(10260, 'S32_3207', 27, 55.30, 9),
(10260, 'S50_1514', 21, 56.24, 7),
(10260, 'S700_1938', 33, 80.55, 2),
(10261, 'S10_4757', 27, 116.96, 1),
(10261, 'S18_4522', 20, 80.75, 9),
(10261, 'S24_2011', 36, 105.69, 8),
(10261, 'S24_3151', 22, 79.66, 3),
(10261, 'S700_1138', 34, 64.00, 4);
INSERT INTO `orderdetails` (`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`) VALUES
(10261, 'S700_2610', 44, 58.55, 2),
(10261, 'S700_3505', 25, 89.15, 5),
(10261, 'S700_3962', 50, 88.39, 6),
(10261, 'S72_3212', 29, 43.68, 7),
(10262, 'S18_1662', 49, 157.69, 9),
(10262, 'S18_3029', 32, 81.72, 15),
(10262, 'S18_3856', 34, 85.75, 14),
(10262, 'S24_1785', 34, 98.48, 1),
(10262, 'S24_2841', 24, 63.71, 10),
(10262, 'S24_3420', 46, 65.75, 11),
(10262, 'S24_3816', 49, 82.18, 16),
(10262, 'S24_3949', 48, 58.69, 8),
(10262, 'S32_4289', 40, 63.97, 2),
(10262, 'S50_1341', 49, 35.78, 3),
(10262, 'S700_1691', 40, 87.69, 4),
(10262, 'S700_2047', 44, 83.28, 13),
(10262, 'S700_2466', 33, 81.77, 6),
(10262, 'S700_3167', 27, 64.80, 5),
(10262, 'S700_4002', 35, 64.41, 7),
(10262, 'S72_1253', 21, 41.71, 12),
(10263, 'S10_1678', 34, 89.00, 2),
(10263, 'S10_2016', 40, 107.05, 5),
(10263, 'S10_4698', 41, 193.66, 4),
(10263, 'S12_2823', 48, 123.51, 1),
(10263, 'S18_2581', 33, 67.58, 10),
(10263, 'S18_2625', 34, 50.27, 6),
(10263, 'S24_1578', 42, 109.32, 3),
(10263, 'S24_2000', 37, 67.03, 7),
(10263, 'S24_4278', 24, 59.41, 11),
(10263, 'S32_1374', 31, 93.90, 8),
(10263, 'S700_2834', 47, 117.46, 9),
(10264, 'S18_3782', 48, 58.44, 3),
(10264, 'S18_4721', 20, 124.99, 2),
(10264, 'S24_2360', 37, 61.64, 6),
(10264, 'S24_4620', 47, 75.18, 1),
(10264, 'S32_2206', 20, 39.02, 4),
(10264, 'S32_4485', 34, 100.01, 7),
(10264, 'S50_4713', 47, 67.53, 5),
(10265, 'S18_3278', 45, 74.78, 2),
(10265, 'S18_3482', 49, 123.47, 1),
(10266, 'S12_1099', 44, 188.73, 14),
(10266, 'S12_3380', 22, 110.39, 12),
(10266, 'S12_3990', 35, 67.83, 15),
(10266, 'S12_4675', 40, 112.86, 11),
(10266, 'S18_1129', 21, 131.63, 6),
(10266, 'S18_1589', 36, 99.55, 2),
(10266, 'S18_1889', 33, 77.00, 10),
(10266, 'S18_1984', 49, 139.41, 5),
(10266, 'S18_2870', 20, 113.52, 3),
(10266, 'S18_3232', 29, 137.17, 7),
(10266, 'S18_3685', 33, 127.15, 4),
(10266, 'S24_1628', 28, 40.25, 1),
(10266, 'S24_2972', 34, 35.12, 8),
(10266, 'S24_3371', 47, 56.33, 13),
(10266, 'S24_3856', 24, 119.37, 9),
(10267, 'S18_4933', 36, 71.27, 1),
(10267, 'S24_1046', 40, 72.02, 5),
(10267, 'S24_2766', 38, 76.33, 3),
(10267, 'S24_2887', 43, 93.95, 2),
(10267, 'S24_3191', 44, 83.90, 4),
(10267, 'S24_3432', 43, 98.51, 6),
(10268, 'S18_1342', 49, 93.49, 3),
(10268, 'S18_1367', 26, 45.82, 2),
(10268, 'S18_1749', 34, 164.90, 10),
(10268, 'S18_2248', 31, 60.54, 9),
(10268, 'S18_2325', 50, 124.59, 7),
(10268, 'S18_2795', 35, 148.50, 4),
(10268, 'S18_3320', 39, 96.23, 1),
(10268, 'S18_4409', 35, 84.67, 11),
(10268, 'S24_1937', 33, 31.86, 6),
(10268, 'S24_2022', 40, 36.29, 5),
(10268, 'S24_3969', 30, 37.75, 8),
(10269, 'S18_2957', 32, 57.46, 1),
(10269, 'S24_4258', 48, 95.44, 2),
(10270, 'S10_1949', 21, 171.44, 9),
(10270, 'S10_4962', 32, 124.10, 2),
(10270, 'S12_1666', 28, 135.30, 6),
(10270, 'S18_1097', 43, 94.50, 8),
(10270, 'S18_2949', 31, 81.05, 10),
(10270, 'S18_3136', 38, 85.87, 11),
(10270, 'S18_4600', 38, 107.76, 3),
(10270, 'S18_4668', 44, 40.25, 7),
(10270, 'S32_1268', 32, 93.42, 1),
(10270, 'S32_3522', 21, 52.36, 5),
(10270, 'S700_2824', 46, 101.15, 4),
(10271, 'S12_4473', 31, 99.54, 5),
(10271, 'S18_2238', 50, 147.36, 4),
(10271, 'S18_2319', 50, 121.50, 8),
(10271, 'S18_2432', 25, 59.55, 11),
(10271, 'S18_3232', 20, 169.34, 9),
(10271, 'S24_1444', 45, 49.71, 2),
(10271, 'S24_2300', 43, 122.68, 10),
(10271, 'S24_2840', 38, 28.64, 6),
(10271, 'S24_4048', 22, 110.00, 1),
(10271, 'S32_2509', 35, 51.95, 7),
(10271, 'S50_1392', 34, 93.76, 3),
(10272, 'S12_1108', 35, 187.02, 2),
(10272, 'S12_3148', 27, 123.89, 3),
(10272, 'S12_3891', 39, 148.80, 1),
(10272, 'S18_4027', 25, 126.39, 5),
(10272, 'S32_3207', 45, 56.55, 6),
(10272, 'S50_1514', 43, 53.89, 4),
(10273, 'S10_4757', 30, 136.00, 4),
(10273, 'S18_3029', 34, 84.30, 2),
(10273, 'S18_3140', 40, 117.47, 13),
(10273, 'S18_3259', 47, 87.73, 15),
(10273, 'S18_3856', 50, 105.87, 1),
(10273, 'S18_4522', 33, 72.85, 12),
(10273, 'S24_2011', 22, 103.23, 11),
(10273, 'S24_3151', 27, 84.08, 6),
(10273, 'S24_3816', 48, 83.86, 3),
(10273, 'S700_1138', 21, 66.00, 7),
(10273, 'S700_1938', 21, 77.95, 14),
(10273, 'S700_2610', 42, 57.82, 5),
(10273, 'S700_3505', 40, 91.15, 8),
(10273, 'S700_3962', 26, 89.38, 9),
(10273, 'S72_3212', 37, 51.32, 10),
(10274, 'S18_1662', 41, 129.31, 1),
(10274, 'S24_2841', 40, 56.86, 2),
(10274, 'S24_3420', 24, 65.09, 3),
(10274, 'S700_2047', 24, 75.13, 5),
(10274, 'S72_1253', 32, 49.66, 4),
(10275, 'S10_1678', 45, 81.35, 1),
(10275, 'S10_2016', 22, 115.37, 4),
(10275, 'S10_4698', 36, 154.93, 3),
(10275, 'S18_2581', 35, 70.12, 9),
(10275, 'S18_2625', 37, 52.09, 5),
(10275, 'S24_1578', 21, 105.94, 2),
(10275, 'S24_1785', 25, 97.38, 11),
(10275, 'S24_2000', 30, 61.70, 6),
(10275, 'S24_3949', 41, 58.00, 18),
(10275, 'S24_4278', 27, 67.38, 10),
(10275, 'S32_1374', 23, 89.90, 7),
(10275, 'S32_4289', 28, 58.47, 12),
(10275, 'S50_1341', 38, 40.15, 13),
(10275, 'S700_1691', 32, 85.86, 14),
(10275, 'S700_2466', 39, 82.77, 16),
(10275, 'S700_2834', 48, 102.04, 8),
(10275, 'S700_3167', 43, 72.00, 15),
(10275, 'S700_4002', 31, 59.96, 17),
(10276, 'S12_1099', 50, 184.84, 3),
(10276, 'S12_2823', 43, 150.62, 14),
(10276, 'S12_3380', 47, 104.52, 1),
(10276, 'S12_3990', 38, 67.83, 4),
(10276, 'S18_3278', 38, 78.00, 6),
(10276, 'S18_3482', 30, 139.64, 5),
(10276, 'S18_3782', 33, 54.71, 9),
(10276, 'S18_4721', 48, 120.53, 8),
(10276, 'S24_2360', 46, 61.64, 12),
(10276, 'S24_3371', 20, 58.17, 2),
(10276, 'S24_4620', 48, 67.10, 7),
(10276, 'S32_2206', 27, 35.40, 10),
(10276, 'S32_4485', 38, 94.91, 13),
(10276, 'S50_4713', 21, 67.53, 11),
(10277, 'S12_4675', 28, 93.28, 1),
(10278, 'S18_1129', 34, 114.65, 6),
(10278, 'S18_1589', 23, 107.02, 2),
(10278, 'S18_1889', 29, 73.15, 10),
(10278, 'S18_1984', 29, 118.07, 5),
(10278, 'S18_2870', 39, 117.48, 3),
(10278, 'S18_3232', 42, 167.65, 7),
(10278, 'S18_3685', 31, 114.44, 4),
(10278, 'S24_1628', 35, 48.80, 1),
(10278, 'S24_2972', 31, 37.38, 8),
(10278, 'S24_3856', 25, 136.22, 9),
(10279, 'S18_4933', 26, 68.42, 1),
(10279, 'S24_1046', 32, 68.35, 5),
(10279, 'S24_2766', 49, 76.33, 3),
(10279, 'S24_2887', 48, 106.87, 2),
(10279, 'S24_3191', 33, 78.76, 4),
(10279, 'S24_3432', 48, 95.30, 6),
(10280, 'S10_1949', 34, 205.73, 2),
(10280, 'S18_1097', 24, 98.00, 1),
(10280, 'S18_1342', 50, 87.33, 9),
(10280, 'S18_1367', 27, 47.44, 8),
(10280, 'S18_1749', 26, 161.50, 16),
(10280, 'S18_2248', 25, 53.28, 15),
(10280, 'S18_2325', 37, 109.33, 13),
(10280, 'S18_2795', 22, 158.63, 10),
(10280, 'S18_2949', 46, 82.06, 3),
(10280, 'S18_2957', 43, 54.34, 5),
(10280, 'S18_3136', 29, 102.63, 4),
(10280, 'S18_3320', 34, 99.21, 7),
(10280, 'S18_4409', 35, 77.31, 17),
(10280, 'S24_1937', 20, 29.87, 12),
(10280, 'S24_2022', 45, 36.29, 11),
(10280, 'S24_3969', 33, 35.29, 14),
(10280, 'S24_4258', 21, 79.86, 6),
(10281, 'S10_4962', 44, 132.97, 9),
(10281, 'S12_1666', 25, 127.10, 13),
(10281, 'S12_4473', 41, 98.36, 1),
(10281, 'S18_2319', 48, 114.14, 4),
(10281, 'S18_2432', 29, 56.52, 7),
(10281, 'S18_3232', 25, 135.47, 5),
(10281, 'S18_4600', 25, 96.86, 10),
(10281, 'S18_4668', 44, 42.76, 14),
(10281, 'S24_2300', 25, 112.46, 6),
(10281, 'S24_2840', 20, 33.95, 2),
(10281, 'S32_1268', 29, 80.90, 8),
(10281, 'S32_2509', 31, 44.91, 3),
(10281, 'S32_3522', 36, 59.47, 12),
(10281, 'S700_2824', 27, 89.01, 11),
(10282, 'S12_1108', 41, 176.63, 5),
(10282, 'S12_3148', 27, 142.02, 6),
(10282, 'S12_3891', 24, 169.56, 4),
(10282, 'S18_2238', 23, 147.36, 13),
(10282, 'S18_3140', 43, 122.93, 1),
(10282, 'S18_3259', 36, 88.74, 3),
(10282, 'S18_4027', 31, 132.13, 8),
(10282, 'S24_1444', 29, 49.71, 11),
(10282, 'S24_4048', 39, 96.99, 10),
(10282, 'S32_3207', 36, 51.58, 9),
(10282, 'S50_1392', 38, 114.59, 12),
(10282, 'S50_1514', 37, 56.24, 7),
(10282, 'S700_1938', 43, 77.95, 2),
(10283, 'S10_4757', 25, 130.56, 6),
(10283, 'S18_3029', 21, 78.28, 4),
(10283, 'S18_3856', 46, 100.58, 3),
(10283, 'S18_4522', 34, 71.97, 14),
(10283, 'S24_2011', 42, 99.54, 13),
(10283, 'S24_3151', 34, 80.54, 8),
(10283, 'S24_3816', 33, 77.15, 5),
(10283, 'S700_1138', 45, 62.00, 9),
(10283, 'S700_2047', 20, 74.23, 2),
(10283, 'S700_2610', 47, 68.67, 7),
(10283, 'S700_3505', 22, 88.15, 10),
(10283, 'S700_3962', 38, 85.41, 11),
(10283, 'S72_1253', 43, 41.22, 1),
(10283, 'S72_3212', 33, 49.14, 12),
(10284, 'S18_1662', 45, 137.19, 11),
(10284, 'S18_2581', 31, 68.43, 1),
(10284, 'S24_1785', 22, 101.76, 3),
(10284, 'S24_2841', 30, 65.08, 12),
(10284, 'S24_3420', 39, 59.83, 13),
(10284, 'S24_3949', 21, 65.51, 10),
(10284, 'S24_4278', 21, 66.65, 2),
(10284, 'S32_4289', 50, 60.54, 4),
(10284, 'S50_1341', 33, 35.78, 5),
(10284, 'S700_1691', 24, 87.69, 6),
(10284, 'S700_2466', 45, 95.73, 8),
(10284, 'S700_3167', 25, 68.00, 7),
(10284, 'S700_4002', 32, 73.29, 9),
(10285, 'S10_1678', 36, 95.70, 6),
(10285, 'S10_2016', 47, 110.61, 9),
(10285, 'S10_4698', 27, 166.55, 8),
(10285, 'S12_2823', 49, 131.04, 5),
(10285, 'S18_2625', 20, 50.88, 10),
(10285, 'S24_1578', 34, 91.29, 7),
(10285, 'S24_2000', 39, 61.70, 11),
(10285, 'S24_2360', 38, 64.41, 3),
(10285, 'S32_1374', 37, 82.91, 12),
(10285, 'S32_2206', 37, 36.61, 1),
(10285, 'S32_4485', 26, 100.01, 4),
(10285, 'S50_4713', 39, 76.48, 2),
(10285, 'S700_2834', 45, 102.04, 13),
(10286, 'S18_3782', 38, 51.60, 1),
(10287, 'S12_1099', 21, 190.68, 12),
(10287, 'S12_3380', 45, 117.44, 10),
(10287, 'S12_3990', 41, 74.21, 13),
(10287, 'S12_4675', 23, 107.10, 9),
(10287, 'S18_1129', 41, 113.23, 4),
(10287, 'S18_1889', 44, 61.60, 8),
(10287, 'S18_1984', 24, 123.76, 3),
(10287, 'S18_2870', 44, 114.84, 1),
(10287, 'S18_3232', 36, 137.17, 5),
(10287, 'S18_3278', 43, 68.35, 15),
(10287, 'S18_3482', 40, 127.88, 14),
(10287, 'S18_3685', 27, 139.87, 2),
(10287, 'S18_4721', 34, 119.04, 17),
(10287, 'S24_2972', 36, 31.34, 6),
(10287, 'S24_3371', 20, 58.17, 11),
(10287, 'S24_3856', 36, 137.62, 7),
(10287, 'S24_4620', 40, 79.22, 16),
(10288, 'S18_1589', 20, 120.71, 14),
(10288, 'S18_1749', 32, 168.30, 5),
(10288, 'S18_2248', 28, 50.25, 4),
(10288, 'S18_2325', 31, 102.98, 2),
(10288, 'S18_4409', 35, 90.19, 6),
(10288, 'S18_4933', 23, 57.02, 7),
(10288, 'S24_1046', 36, 66.88, 11),
(10288, 'S24_1628', 50, 49.30, 13),
(10288, 'S24_1937', 29, 32.19, 1),
(10288, 'S24_2766', 35, 81.78, 9),
(10288, 'S24_2887', 48, 109.22, 8),
(10288, 'S24_3191', 34, 76.19, 10),
(10288, 'S24_3432', 41, 101.73, 12),
(10288, 'S24_3969', 33, 37.75, 3),
(10289, 'S18_1342', 38, 92.47, 2),
(10289, 'S18_1367', 24, 44.75, 1),
(10289, 'S18_2795', 43, 141.75, 3),
(10289, 'S24_2022', 45, 41.22, 4),
(10290, 'S18_3320', 26, 80.36, 2),
(10290, 'S24_4258', 45, 83.76, 1),
(10291, 'S10_1949', 37, 210.01, 11),
(10291, 'S10_4962', 30, 141.83, 4),
(10291, 'S12_1666', 41, 123.00, 8),
(10291, 'S18_1097', 41, 96.84, 10),
(10291, 'S18_2432', 26, 52.26, 2),
(10291, 'S18_2949', 47, 99.28, 12),
(10291, 'S18_2957', 37, 56.21, 14),
(10291, 'S18_3136', 23, 93.20, 13),
(10291, 'S18_4600', 48, 96.86, 5),
(10291, 'S18_4668', 29, 45.28, 9),
(10291, 'S24_2300', 48, 109.90, 1),
(10291, 'S32_1268', 26, 82.83, 3),
(10291, 'S32_3522', 32, 53.00, 7),
(10291, 'S700_2824', 28, 86.99, 6),
(10292, 'S12_4473', 21, 94.80, 8),
(10292, 'S18_2238', 26, 140.81, 7),
(10292, 'S18_2319', 41, 103.09, 11),
(10292, 'S18_3232', 21, 147.33, 12),
(10292, 'S18_4027', 44, 114.90, 2),
(10292, 'S24_1444', 40, 48.55, 5),
(10292, 'S24_2840', 39, 34.30, 9),
(10292, 'S24_4048', 27, 113.55, 4),
(10292, 'S32_2509', 50, 54.11, 10),
(10292, 'S32_3207', 31, 59.65, 3),
(10292, 'S50_1392', 41, 113.44, 6),
(10292, 'S50_1514', 35, 49.79, 1),
(10293, 'S12_1108', 46, 187.02, 8),
(10293, 'S12_3148', 24, 129.93, 9),
(10293, 'S12_3891', 45, 171.29, 7),
(10293, 'S18_3140', 24, 110.64, 4),
(10293, 'S18_3259', 22, 91.76, 6),
(10293, 'S18_4522', 49, 72.85, 3),
(10293, 'S24_2011', 21, 111.83, 2),
(10293, 'S700_1938', 29, 77.95, 5),
(10293, 'S72_3212', 32, 51.32, 1),
(10294, 'S700_3962', 45, 98.32, 1),
(10295, 'S10_4757', 24, 136.00, 1),
(10295, 'S24_3151', 46, 84.08, 3),
(10295, 'S700_1138', 26, 62.00, 4),
(10295, 'S700_2610', 44, 71.56, 2),
(10295, 'S700_3505', 34, 93.16, 5),
(10296, 'S18_1662', 36, 146.65, 7),
(10296, 'S18_3029', 21, 69.68, 13),
(10296, 'S18_3856', 22, 105.87, 12),
(10296, 'S24_2841', 21, 60.97, 8),
(10296, 'S24_3420', 31, 63.78, 9),
(10296, 'S24_3816', 22, 83.02, 14),
(10296, 'S24_3949', 32, 63.46, 6),
(10296, 'S50_1341', 26, 41.02, 1),
(10296, 'S700_1691', 42, 75.81, 2),
(10296, 'S700_2047', 34, 89.61, 11),
(10296, 'S700_2466', 24, 96.73, 4),
(10296, 'S700_3167', 22, 74.40, 3),
(10296, 'S700_4002', 47, 61.44, 5),
(10296, 'S72_1253', 21, 46.68, 10),
(10297, 'S18_2581', 25, 81.95, 4),
(10297, 'S24_1785', 32, 107.23, 6),
(10297, 'S24_2000', 32, 70.08, 1),
(10297, 'S24_4278', 23, 71.73, 5),
(10297, 'S32_1374', 26, 88.90, 2),
(10297, 'S32_4289', 28, 63.29, 7),
(10297, 'S700_2834', 35, 111.53, 3),
(10298, 'S10_2016', 39, 105.86, 1),
(10298, 'S18_2625', 32, 60.57, 2),
(10299, 'S10_1678', 23, 76.56, 9),
(10299, 'S10_4698', 29, 164.61, 11),
(10299, 'S12_2823', 24, 123.51, 8),
(10299, 'S18_3782', 39, 62.17, 3),
(10299, 'S18_4721', 49, 119.04, 2),
(10299, 'S24_1578', 47, 107.07, 10),
(10299, 'S24_2360', 33, 58.87, 6),
(10299, 'S24_4620', 32, 66.29, 1),
(10299, 'S32_2206', 24, 36.21, 4),
(10299, 'S32_4485', 38, 84.70, 7),
(10299, 'S50_4713', 44, 77.29, 5),
(10300, 'S12_1099', 33, 184.84, 5),
(10300, 'S12_3380', 29, 116.27, 3),
(10300, 'S12_3990', 22, 76.61, 6),
(10300, 'S12_4675', 23, 95.58, 2),
(10300, 'S18_1889', 41, 63.14, 1),
(10300, 'S18_3278', 49, 65.94, 8),
(10300, 'S18_3482', 23, 144.05, 7),
(10300, 'S24_3371', 31, 52.05, 4),
(10301, 'S18_1129', 37, 114.65, 8),
(10301, 'S18_1589', 32, 118.22, 4),
(10301, 'S18_1984', 47, 119.49, 7),
(10301, 'S18_2870', 22, 113.52, 5),
(10301, 'S18_3232', 23, 135.47, 9),
(10301, 'S18_3685', 39, 137.04, 6),
(10301, 'S24_1046', 27, 64.67, 1),
(10301, 'S24_1628', 22, 40.75, 3),
(10301, 'S24_2972', 48, 32.10, 10),
(10301, 'S24_3432', 22, 86.73, 2),
(10301, 'S24_3856', 50, 122.17, 11),
(10302, 'S18_1749', 43, 166.60, 1),
(10302, 'S18_4409', 38, 82.83, 2),
(10302, 'S18_4933', 23, 70.56, 3),
(10302, 'S24_2766', 49, 75.42, 5),
(10302, 'S24_2887', 45, 104.52, 4),
(10302, 'S24_3191', 48, 74.48, 6),
(10303, 'S18_2248', 46, 56.91, 2),
(10303, 'S24_3969', 24, 35.70, 1),
(10304, 'S10_1949', 47, 201.44, 6),
(10304, 'S12_1666', 39, 117.54, 3),
(10304, 'S18_1097', 46, 106.17, 5),
(10304, 'S18_1342', 37, 95.55, 13),
(10304, 'S18_1367', 37, 46.90, 12),
(10304, 'S18_2325', 24, 102.98, 17),
(10304, 'S18_2795', 20, 141.75, 14),
(10304, 'S18_2949', 46, 98.27, 7),
(10304, 'S18_2957', 24, 54.34, 9),
(10304, 'S18_3136', 26, 90.06, 8),
(10304, 'S18_3320', 38, 95.24, 11),
(10304, 'S18_4668', 34, 44.27, 4),
(10304, 'S24_1937', 23, 29.21, 16),
(10304, 'S24_2022', 44, 42.11, 15),
(10304, 'S24_4258', 33, 80.83, 10),
(10304, 'S32_3522', 36, 52.36, 2),
(10304, 'S700_2824', 40, 80.92, 1),
(10305, 'S10_4962', 38, 130.01, 13),
(10305, 'S12_4473', 38, 107.84, 5),
(10305, 'S18_2238', 27, 132.62, 4),
(10305, 'S18_2319', 36, 117.82, 8),
(10305, 'S18_2432', 41, 58.95, 11),
(10305, 'S18_3232', 37, 160.87, 9),
(10305, 'S18_4600', 22, 112.60, 14),
(10305, 'S24_1444', 45, 48.55, 2),
(10305, 'S24_2300', 24, 107.34, 10),
(10305, 'S24_2840', 48, 30.76, 6),
(10305, 'S24_4048', 36, 118.28, 1),
(10305, 'S32_1268', 28, 94.38, 12),
(10305, 'S32_2509', 40, 48.70, 7),
(10305, 'S50_1392', 42, 109.96, 3),
(10306, 'S12_1108', 31, 182.86, 13),
(10306, 'S12_3148', 34, 145.04, 14),
(10306, 'S12_3891', 20, 145.34, 12),
(10306, 'S18_3140', 32, 114.74, 9),
(10306, 'S18_3259', 40, 83.70, 11),
(10306, 'S18_4027', 23, 126.39, 16),
(10306, 'S18_4522', 39, 85.14, 8),
(10306, 'S24_2011', 29, 109.37, 7),
(10306, 'S24_3151', 31, 76.12, 2),
(10306, 'S32_3207', 46, 60.28, 17),
(10306, 'S50_1514', 34, 51.55, 15),
(10306, 'S700_1138', 50, 61.34, 3),
(10306, 'S700_1938', 38, 73.62, 10),
(10306, 'S700_2610', 43, 62.16, 1),
(10306, 'S700_3505', 32, 99.17, 4),
(10306, 'S700_3962', 30, 87.39, 5),
(10306, 'S72_3212', 35, 48.05, 6),
(10307, 'S10_4757', 22, 118.32, 9),
(10307, 'S18_1662', 39, 135.61, 1),
(10307, 'S18_3029', 31, 71.40, 7),
(10307, 'S18_3856', 48, 92.11, 6),
(10307, 'S24_2841', 25, 58.23, 2),
(10307, 'S24_3420', 22, 64.44, 3),
(10307, 'S24_3816', 22, 75.47, 8),
(10307, 'S700_2047', 34, 81.47, 5),
(10307, 'S72_1253', 34, 44.20, 4),
(10308, 'S10_2016', 34, 115.37, 2),
(10308, 'S10_4698', 20, 187.85, 1),
(10308, 'S18_2581', 27, 81.95, 7),
(10308, 'S18_2625', 34, 48.46, 3),
(10308, 'S24_1785', 31, 99.57, 9),
(10308, 'S24_2000', 47, 68.55, 4),
(10308, 'S24_3949', 43, 58.00, 16),
(10308, 'S24_4278', 44, 71.73, 8),
(10308, 'S32_1374', 24, 99.89, 5),
(10308, 'S32_4289', 46, 61.22, 10),
(10308, 'S50_1341', 47, 37.09, 11),
(10308, 'S700_1691', 21, 73.07, 12),
(10308, 'S700_2466', 35, 88.75, 14),
(10308, 'S700_2834', 31, 100.85, 6),
(10308, 'S700_3167', 21, 79.20, 13),
(10308, 'S700_4002', 39, 62.93, 15),
(10309, 'S10_1678', 41, 94.74, 5),
(10309, 'S12_2823', 26, 144.60, 4),
(10309, 'S24_1578', 21, 96.92, 6),
(10309, 'S24_2360', 24, 59.56, 2),
(10309, 'S32_4485', 50, 93.89, 3),
(10309, 'S50_4713', 28, 74.04, 1),
(10310, 'S12_1099', 33, 165.38, 10),
(10310, 'S12_3380', 24, 105.70, 8),
(10310, 'S12_3990', 49, 77.41, 11),
(10310, 'S12_4675', 25, 101.34, 7),
(10310, 'S18_1129', 37, 128.80, 2),
(10310, 'S18_1889', 20, 66.99, 6),
(10310, 'S18_1984', 24, 129.45, 1),
(10310, 'S18_3232', 48, 159.18, 3),
(10310, 'S18_3278', 27, 70.76, 13),
(10310, 'S18_3482', 49, 122.00, 12),
(10310, 'S18_3782', 42, 59.06, 16),
(10310, 'S18_4721', 40, 133.92, 15),
(10310, 'S24_2972', 33, 33.23, 4),
(10310, 'S24_3371', 38, 50.21, 9),
(10310, 'S24_3856', 45, 139.03, 5),
(10310, 'S24_4620', 49, 75.18, 14),
(10310, 'S32_2206', 36, 38.62, 17),
(10311, 'S18_1589', 29, 124.44, 9),
(10311, 'S18_2870', 43, 114.84, 10),
(10311, 'S18_3685', 32, 134.22, 11),
(10311, 'S18_4409', 41, 92.03, 1),
(10311, 'S18_4933', 25, 66.99, 2),
(10311, 'S24_1046', 26, 70.55, 6),
(10311, 'S24_1628', 45, 48.80, 8),
(10311, 'S24_2766', 28, 89.05, 4),
(10311, 'S24_2887', 43, 116.27, 3),
(10311, 'S24_3191', 25, 85.61, 5),
(10311, 'S24_3432', 46, 91.02, 7),
(10312, 'S10_1949', 48, 214.30, 3),
(10312, 'S18_1097', 32, 101.50, 2),
(10312, 'S18_1342', 43, 102.74, 10),
(10312, 'S18_1367', 25, 43.67, 9),
(10312, 'S18_1749', 48, 146.20, 17),
(10312, 'S18_2248', 30, 48.43, 16),
(10312, 'S18_2325', 31, 111.87, 14),
(10312, 'S18_2795', 25, 150.19, 11),
(10312, 'S18_2949', 37, 91.18, 4),
(10312, 'S18_2957', 35, 54.34, 6),
(10312, 'S18_3136', 38, 93.20, 5),
(10312, 'S18_3320', 33, 84.33, 8),
(10312, 'S18_4668', 39, 44.27, 1),
(10312, 'S24_1937', 39, 27.88, 13),
(10312, 'S24_2022', 23, 43.46, 12),
(10312, 'S24_3969', 31, 40.21, 15),
(10312, 'S24_4258', 44, 96.42, 7),
(10313, 'S10_4962', 40, 141.83, 7),
(10313, 'S12_1666', 21, 131.20, 11),
(10313, 'S18_2319', 29, 109.23, 2),
(10313, 'S18_2432', 34, 52.87, 5),
(10313, 'S18_3232', 25, 143.94, 3),
(10313, 'S18_4600', 28, 110.18, 8),
(10313, 'S24_2300', 42, 102.23, 4),
(10313, 'S32_1268', 27, 96.31, 6),
(10313, 'S32_2509', 38, 48.70, 1),
(10313, 'S32_3522', 34, 55.59, 10),
(10313, 'S700_2824', 30, 96.09, 9),
(10314, 'S12_1108', 38, 176.63, 5),
(10314, 'S12_3148', 46, 125.40, 6),
(10314, 'S12_3891', 36, 169.56, 4),
(10314, 'S12_4473', 45, 95.99, 14),
(10314, 'S18_2238', 42, 135.90, 13),
(10314, 'S18_3140', 20, 129.76, 1),
(10314, 'S18_3259', 23, 84.71, 3),
(10314, 'S18_4027', 29, 129.26, 8),
(10314, 'S24_1444', 44, 51.44, 11),
(10314, 'S24_2840', 39, 31.82, 15),
(10314, 'S24_4048', 38, 111.18, 10),
(10314, 'S32_3207', 35, 58.41, 9),
(10314, 'S50_1392', 28, 115.75, 12),
(10314, 'S50_1514', 38, 50.38, 7),
(10314, 'S700_1938', 23, 83.15, 2),
(10315, 'S18_4522', 36, 78.12, 7),
(10315, 'S24_2011', 35, 111.83, 6),
(10315, 'S24_3151', 24, 78.77, 1),
(10315, 'S700_1138', 41, 60.67, 2),
(10315, 'S700_3505', 31, 99.17, 3),
(10315, 'S700_3962', 37, 88.39, 4),
(10315, 'S72_3212', 40, 51.32, 5),
(10316, 'S10_4757', 33, 126.48, 17),
(10316, 'S18_1662', 27, 140.34, 9),
(10316, 'S18_3029', 21, 72.26, 15),
(10316, 'S18_3856', 47, 89.99, 14),
(10316, 'S24_1785', 25, 93.01, 1),
(10316, 'S24_2841', 34, 67.14, 10),
(10316, 'S24_3420', 47, 55.23, 11),
(10316, 'S24_3816', 25, 77.15, 16),
(10316, 'S24_3949', 30, 67.56, 8),
(10316, 'S32_4289', 24, 59.16, 2),
(10316, 'S50_1341', 34, 36.66, 3),
(10316, 'S700_1691', 34, 74.90, 4),
(10316, 'S700_2047', 45, 73.32, 13),
(10316, 'S700_2466', 23, 85.76, 6),
(10316, 'S700_2610', 48, 67.22, 18),
(10316, 'S700_3167', 48, 77.60, 5),
(10316, 'S700_4002', 44, 68.11, 7),
(10316, 'S72_1253', 34, 43.70, 12),
(10317, 'S24_4278', 35, 69.55, 1),
(10318, 'S10_1678', 46, 84.22, 1),
(10318, 'S10_2016', 45, 102.29, 4),
(10318, 'S10_4698', 37, 189.79, 3),
(10318, 'S18_2581', 31, 81.95, 9),
(10318, 'S18_2625', 42, 49.67, 5),
(10318, 'S24_1578', 48, 93.54, 2),
(10318, 'S24_2000', 26, 60.94, 6),
(10318, 'S32_1374', 47, 81.91, 7),
(10318, 'S700_2834', 50, 102.04, 8),
(10319, 'S12_2823', 30, 134.05, 9),
(10319, 'S18_3278', 46, 77.19, 1),
(10319, 'S18_3782', 44, 54.71, 4),
(10319, 'S18_4721', 45, 120.53, 3),
(10319, 'S24_2360', 31, 65.80, 7),
(10319, 'S24_4620', 43, 78.41, 2),
(10319, 'S32_2206', 29, 35.00, 5),
(10319, 'S32_4485', 22, 96.95, 8),
(10319, 'S50_4713', 45, 79.73, 6),
(10320, 'S12_1099', 31, 184.84, 3),
(10320, 'S12_3380', 35, 102.17, 1),
(10320, 'S12_3990', 38, 63.84, 4),
(10320, 'S18_3482', 25, 139.64, 5),
(10320, 'S24_3371', 26, 60.62, 2),
(10321, 'S12_4675', 24, 105.95, 15),
(10321, 'S18_1129', 41, 123.14, 10),
(10321, 'S18_1589', 44, 120.71, 6),
(10321, 'S18_1889', 37, 73.92, 14),
(10321, 'S18_1984', 25, 142.25, 9),
(10321, 'S18_2870', 27, 126.72, 7),
(10321, 'S18_3232', 33, 164.26, 11),
(10321, 'S18_3685', 28, 138.45, 8),
(10321, 'S24_1046', 30, 68.35, 3),
(10321, 'S24_1628', 48, 42.76, 5),
(10321, 'S24_2766', 30, 74.51, 1),
(10321, 'S24_2972', 37, 31.72, 12),
(10321, 'S24_3191', 39, 81.33, 2),
(10321, 'S24_3432', 21, 103.87, 4),
(10321, 'S24_3856', 26, 137.62, 13),
(10322, 'S10_1949', 40, 180.01, 1),
(10322, 'S10_4962', 46, 141.83, 8),
(10322, 'S12_1666', 27, 136.67, 9),
(10322, 'S18_1097', 22, 101.50, 10),
(10322, 'S18_1342', 43, 92.47, 14),
(10322, 'S18_1367', 41, 44.21, 5),
(10322, 'S18_2325', 50, 120.77, 6),
(10322, 'S18_2432', 35, 57.12, 11),
(10322, 'S18_2795', 36, 158.63, 2),
(10322, 'S18_2949', 33, 100.30, 12),
(10322, 'S18_2957', 41, 54.34, 13),
(10322, 'S18_3136', 48, 90.06, 7),
(10322, 'S24_1937', 20, 26.55, 3),
(10322, 'S24_2022', 30, 40.77, 4),
(10323, 'S18_3320', 33, 88.30, 2),
(10323, 'S18_4600', 47, 96.86, 1),
(10324, 'S12_3148', 27, 148.06, 1),
(10324, 'S12_4473', 26, 100.73, 7),
(10324, 'S18_2238', 47, 142.45, 8),
(10324, 'S18_2319', 33, 105.55, 10),
(10324, 'S18_3232', 27, 137.17, 12),
(10324, 'S18_4027', 49, 120.64, 13),
(10324, 'S18_4668', 38, 49.81, 6),
(10324, 'S24_1444', 25, 49.71, 14),
(10324, 'S24_2300', 31, 107.34, 2),
(10324, 'S24_2840', 30, 29.35, 9),
(10324, 'S24_4258', 33, 95.44, 3),
(10324, 'S32_1268', 20, 91.49, 11),
(10324, 'S32_3522', 48, 60.76, 4),
(10324, 'S700_2824', 34, 80.92, 5),
(10325, 'S10_4757', 47, 111.52, 6),
(10325, 'S12_1108', 42, 193.25, 8),
(10325, 'S12_3891', 24, 166.10, 1),
(10325, 'S18_3140', 24, 114.74, 9),
(10325, 'S24_4048', 44, 114.73, 5),
(10325, 'S32_2509', 38, 44.37, 3),
(10325, 'S32_3207', 28, 55.30, 2),
(10325, 'S50_1392', 38, 99.55, 4),
(10325, 'S50_1514', 44, 56.24, 7),
(10326, 'S18_3259', 32, 94.79, 6),
(10326, 'S18_4522', 50, 73.73, 5),
(10326, 'S24_2011', 41, 120.43, 4),
(10326, 'S24_3151', 41, 86.74, 3),
(10326, 'S24_3816', 20, 81.34, 2),
(10326, 'S700_1138', 39, 60.67, 1),
(10327, 'S18_1662', 25, 154.54, 6),
(10327, 'S18_2581', 45, 74.34, 8),
(10327, 'S18_3029', 25, 74.84, 5),
(10327, 'S700_1938', 20, 79.68, 7),
(10327, 'S700_2610', 21, 65.05, 1),
(10327, 'S700_3505', 43, 85.14, 2),
(10327, 'S700_3962', 37, 83.42, 3),
(10327, 'S72_3212', 37, 48.05, 4),
(10328, 'S18_3856', 34, 104.81, 6),
(10328, 'S24_1785', 47, 87.54, 14),
(10328, 'S24_2841', 48, 67.82, 1),
(10328, 'S24_3420', 20, 56.55, 2),
(10328, 'S24_3949', 35, 55.96, 3),
(10328, 'S24_4278', 43, 69.55, 4),
(10328, 'S32_4289', 24, 57.10, 5),
(10328, 'S50_1341', 34, 42.33, 7),
(10328, 'S700_1691', 27, 84.03, 8),
(10328, 'S700_2047', 41, 75.13, 9),
(10328, 'S700_2466', 37, 95.73, 10),
(10328, 'S700_2834', 33, 117.46, 11),
(10328, 'S700_3167', 33, 71.20, 13),
(10328, 'S700_4002', 39, 69.59, 12),
(10329, 'S10_1678', 42, 80.39, 1),
(10329, 'S10_2016', 20, 109.42, 2),
(10329, 'S10_4698', 26, 164.61, 3),
(10329, 'S12_1099', 41, 182.90, 5),
(10329, 'S12_2823', 24, 128.03, 6),
(10329, 'S12_3380', 46, 117.44, 13),
(10329, 'S12_3990', 33, 74.21, 14),
(10329, 'S12_4675', 39, 102.49, 15),
(10329, 'S18_1889', 29, 66.22, 9),
(10329, 'S18_2625', 38, 55.72, 12),
(10329, 'S18_3278', 38, 65.13, 10),
(10329, 'S24_1578', 30, 104.81, 7),
(10329, 'S24_2000', 37, 71.60, 4),
(10329, 'S32_1374', 45, 80.91, 11),
(10329, 'S72_1253', 44, 41.22, 8),
(10330, 'S18_3482', 37, 136.70, 3),
(10330, 'S18_3782', 29, 59.06, 2),
(10330, 'S18_4721', 50, 133.92, 4),
(10330, 'S24_2360', 42, 56.10, 1),
(10331, 'S18_1129', 46, 120.31, 6),
(10331, 'S18_1589', 44, 99.55, 14),
(10331, 'S18_1749', 44, 154.70, 7),
(10331, 'S18_1984', 30, 135.14, 8),
(10331, 'S18_2870', 26, 130.68, 10),
(10331, 'S18_3232', 27, 169.34, 11),
(10331, 'S18_3685', 26, 132.80, 12),
(10331, 'S24_2972', 27, 37.00, 13),
(10331, 'S24_3371', 25, 55.11, 9),
(10331, 'S24_3856', 21, 139.03, 1),
(10331, 'S24_4620', 41, 70.33, 2),
(10331, 'S32_2206', 28, 33.39, 3),
(10331, 'S32_4485', 32, 100.01, 4),
(10331, 'S50_4713', 20, 74.04, 5),
(10332, 'S18_1342', 46, 89.38, 15),
(10332, 'S18_1367', 27, 51.21, 16),
(10332, 'S18_2248', 38, 53.88, 9),
(10332, 'S18_2325', 35, 116.96, 8),
(10332, 'S18_2795', 24, 138.38, 1),
(10332, 'S18_2957', 26, 53.09, 17),
(10332, 'S18_3136', 40, 100.53, 18),
(10332, 'S18_4409', 50, 92.03, 2),
(10332, 'S18_4933', 21, 70.56, 3),
(10332, 'S24_1046', 23, 61.73, 4),
(10332, 'S24_1628', 20, 47.29, 5),
(10332, 'S24_1937', 45, 29.87, 6),
(10332, 'S24_2022', 26, 43.01, 10),
(10332, 'S24_2766', 39, 84.51, 7),
(10332, 'S24_2887', 44, 108.04, 11),
(10332, 'S24_3191', 45, 77.91, 12),
(10332, 'S24_3432', 31, 94.23, 13),
(10332, 'S24_3969', 41, 34.47, 14),
(10333, 'S10_1949', 26, 188.58, 3),
(10333, 'S12_1666', 33, 121.64, 6),
(10333, 'S18_1097', 29, 110.84, 7),
(10333, 'S18_2949', 31, 95.23, 5),
(10333, 'S18_3320', 46, 95.24, 2),
(10333, 'S18_4668', 24, 42.26, 8),
(10333, 'S24_4258', 39, 95.44, 1),
(10333, 'S32_3522', 33, 62.05, 4),
(10334, 'S10_4962', 26, 130.01, 2),
(10334, 'S18_2319', 46, 108.00, 6),
(10334, 'S18_2432', 34, 52.87, 1),
(10334, 'S18_3232', 20, 147.33, 3),
(10334, 'S18_4600', 49, 101.71, 4),
(10334, 'S24_2300', 42, 117.57, 5),
(10335, 'S24_2840', 33, 32.88, 2),
(10335, 'S32_1268', 44, 77.05, 1),
(10335, 'S32_2509', 40, 49.78, 3),
(10336, 'S12_1108', 33, 176.63, 10),
(10336, 'S12_3148', 33, 126.91, 11),
(10336, 'S12_3891', 49, 141.88, 1),
(10336, 'S12_4473', 38, 95.99, 3),
(10336, 'S18_2238', 49, 153.91, 6),
(10336, 'S18_3140', 48, 135.22, 12),
(10336, 'S18_3259', 21, 100.84, 7),
(10336, 'S24_1444', 45, 49.71, 4),
(10336, 'S24_4048', 31, 113.55, 5),
(10336, 'S32_3207', 31, 59.03, 9),
(10336, 'S50_1392', 23, 109.96, 8),
(10336, 'S700_2824', 46, 94.07, 2),
(10337, 'S10_4757', 25, 131.92, 8),
(10337, 'S18_4027', 36, 140.75, 3),
(10337, 'S18_4522', 29, 76.36, 2),
(10337, 'S24_2011', 29, 119.20, 4),
(10337, 'S50_1514', 21, 54.48, 6),
(10337, 'S700_1938', 36, 73.62, 9),
(10337, 'S700_3505', 31, 84.14, 1),
(10337, 'S700_3962', 36, 83.42, 7),
(10337, 'S72_3212', 42, 49.14, 5),
(10338, 'S18_1662', 41, 137.19, 1),
(10338, 'S18_3029', 28, 80.86, 3),
(10338, 'S18_3856', 45, 93.17, 2),
(10339, 'S10_2016', 40, 117.75, 4),
(10339, 'S10_4698', 39, 178.17, 3),
(10339, 'S18_2581', 27, 79.41, 2),
(10339, 'S18_2625', 30, 48.46, 1),
(10339, 'S24_1578', 27, 96.92, 10),
(10339, 'S24_1785', 21, 106.14, 7),
(10339, 'S24_2841', 55, 67.82, 12),
(10339, 'S24_3151', 55, 73.46, 13),
(10339, 'S24_3420', 29, 57.86, 14),
(10339, 'S24_3816', 42, 72.96, 16),
(10339, 'S24_3949', 45, 57.32, 11),
(10339, 'S700_1138', 22, 53.34, 5),
(10339, 'S700_2047', 55, 86.90, 15),
(10339, 'S700_2610', 50, 62.16, 9),
(10339, 'S700_4002', 50, 66.63, 8),
(10339, 'S72_1253', 27, 49.66, 6),
(10340, 'S24_2000', 55, 62.46, 8),
(10340, 'S24_4278', 40, 63.76, 1),
(10340, 'S32_1374', 55, 95.89, 2),
(10340, 'S32_4289', 39, 67.41, 3),
(10340, 'S50_1341', 40, 37.09, 4),
(10340, 'S700_1691', 30, 73.99, 5),
(10340, 'S700_2466', 55, 81.77, 7),
(10340, 'S700_2834', 29, 98.48, 6),
(10341, 'S10_1678', 41, 84.22, 9),
(10341, 'S12_1099', 45, 192.62, 2),
(10341, 'S12_2823', 55, 120.50, 8),
(10341, 'S12_3380', 44, 111.57, 1),
(10341, 'S12_3990', 36, 77.41, 10),
(10341, 'S12_4675', 55, 109.40, 7),
(10341, 'S24_2360', 32, 63.03, 6),
(10341, 'S32_4485', 31, 95.93, 4),
(10341, 'S50_4713', 38, 78.11, 3),
(10341, 'S700_3167', 34, 70.40, 5),
(10342, 'S18_1129', 40, 118.89, 2),
(10342, 'S18_1889', 55, 63.14, 1),
(10342, 'S18_1984', 22, 115.22, 3),
(10342, 'S18_3232', 30, 167.65, 4),
(10342, 'S18_3278', 25, 76.39, 5),
(10342, 'S18_3482', 55, 136.70, 7),
(10342, 'S18_3782', 26, 57.82, 8),
(10342, 'S18_4721', 38, 124.99, 11),
(10342, 'S24_2972', 39, 30.59, 9),
(10342, 'S24_3371', 48, 60.01, 10),
(10342, 'S24_3856', 42, 112.34, 6),
(10343, 'S18_1589', 36, 109.51, 4),
(10343, 'S18_2870', 25, 118.80, 3),
(10343, 'S18_3685', 44, 127.15, 2),
(10343, 'S24_1628', 27, 44.78, 6),
(10343, 'S24_4620', 30, 76.80, 1),
(10343, 'S32_2206', 29, 37.41, 5),
(10344, 'S18_1749', 45, 168.30, 1),
(10344, 'S18_2248', 40, 49.04, 2),
(10344, 'S18_2325', 30, 118.23, 3),
(10344, 'S18_4409', 21, 80.99, 4),
(10344, 'S18_4933', 26, 68.42, 5),
(10344, 'S24_1046', 29, 61.00, 7),
(10344, 'S24_1937', 20, 27.88, 6),
(10345, 'S24_2022', 43, 38.98, 1),
(10346, 'S18_1342', 42, 88.36, 3),
(10346, 'S24_2766', 25, 87.24, 1),
(10346, 'S24_2887', 24, 117.44, 5),
(10346, 'S24_3191', 24, 80.47, 2),
(10346, 'S24_3432', 26, 103.87, 6),
(10346, 'S24_3969', 22, 38.57, 4),
(10347, 'S10_1949', 30, 188.58, 1),
(10347, 'S10_4962', 27, 132.97, 2),
(10347, 'S12_1666', 29, 132.57, 3),
(10347, 'S18_1097', 42, 113.17, 5),
(10347, 'S18_1367', 21, 46.36, 7),
(10347, 'S18_2432', 50, 51.05, 8),
(10347, 'S18_2795', 21, 136.69, 6),
(10347, 'S18_2949', 48, 84.09, 9),
(10347, 'S18_2957', 34, 60.59, 10),
(10347, 'S18_3136', 45, 95.30, 11),
(10347, 'S18_3320', 26, 84.33, 12),
(10347, 'S18_4600', 45, 115.03, 4),
(10348, 'S12_1108', 48, 207.80, 8),
(10348, 'S12_3148', 47, 122.37, 4),
(10348, 'S18_4668', 29, 43.77, 6),
(10348, 'S24_2300', 37, 107.34, 1),
(10348, 'S24_4258', 39, 82.78, 2),
(10348, 'S32_1268', 42, 90.53, 3),
(10348, 'S32_3522', 31, 62.70, 5),
(10348, 'S700_2824', 32, 100.14, 7),
(10349, 'S12_3891', 26, 166.10, 10),
(10349, 'S12_4473', 48, 114.95, 9),
(10349, 'S18_2238', 38, 142.45, 8),
(10349, 'S18_2319', 38, 117.82, 7),
(10349, 'S18_3232', 48, 164.26, 6),
(10349, 'S18_4027', 34, 140.75, 5),
(10349, 'S24_1444', 48, 50.29, 4),
(10349, 'S24_2840', 36, 31.47, 3),
(10349, 'S24_4048', 23, 111.18, 2),
(10349, 'S32_2509', 33, 44.37, 1),
(10350, 'S10_4757', 26, 110.16, 5),
(10350, 'S18_3029', 43, 84.30, 6),
(10350, 'S18_3140', 44, 135.22, 1),
(10350, 'S18_3259', 41, 94.79, 2),
(10350, 'S18_4522', 30, 70.22, 3),
(10350, 'S24_2011', 34, 98.31, 7),
(10350, 'S24_3151', 30, 86.74, 9),
(10350, 'S24_3816', 25, 77.15, 10),
(10350, 'S32_3207', 27, 61.52, 14),
(10350, 'S50_1392', 31, 104.18, 8),
(10350, 'S50_1514', 44, 56.82, 17),
(10350, 'S700_1138', 46, 56.00, 11),
(10350, 'S700_1938', 28, 76.22, 4),
(10350, 'S700_2610', 29, 68.67, 12),
(10350, 'S700_3505', 31, 87.15, 13),
(10350, 'S700_3962', 25, 97.32, 16),
(10350, 'S72_3212', 20, 48.05, 15),
(10351, 'S18_1662', 39, 143.50, 1),
(10351, 'S18_3856', 20, 104.81, 2),
(10351, 'S24_2841', 25, 64.40, 5),
(10351, 'S24_3420', 38, 53.92, 4),
(10351, 'S24_3949', 34, 68.24, 3),
(10352, 'S700_2047', 23, 75.13, 3),
(10352, 'S700_2466', 49, 87.75, 2),
(10352, 'S700_4002', 22, 62.19, 1),
(10352, 'S72_1253', 49, 46.18, 4),
(10353, 'S18_2581', 27, 71.81, 1),
(10353, 'S24_1785', 28, 107.23, 2),
(10353, 'S24_4278', 35, 69.55, 3),
(10353, 'S32_1374', 46, 86.90, 5),
(10353, 'S32_4289', 40, 68.10, 7),
(10353, 'S50_1341', 40, 35.78, 8),
(10353, 'S700_1691', 39, 73.07, 9),
(10353, 'S700_2834', 48, 98.48, 4),
(10353, 'S700_3167', 43, 74.40, 6),
(10354, 'S10_1678', 42, 84.22, 6),
(10354, 'S10_2016', 20, 95.15, 2),
(10354, 'S10_4698', 42, 178.17, 3),
(10354, 'S12_1099', 31, 157.60, 9),
(10354, 'S12_2823', 35, 141.58, 4),
(10354, 'S12_3380', 29, 98.65, 11),
(10354, 'S12_3990', 23, 76.61, 12),
(10354, 'S12_4675', 28, 100.19, 13),
(10354, 'S18_1889', 21, 76.23, 8),
(10354, 'S18_2625', 28, 49.06, 10),
(10354, 'S18_3278', 36, 69.15, 7),
(10354, 'S24_1578', 21, 96.92, 5),
(10354, 'S24_2000', 28, 62.46, 1),
(10355, 'S18_3482', 23, 117.59, 7),
(10355, 'S18_3782', 31, 60.30, 1),
(10355, 'S18_4721', 25, 124.99, 2),
(10355, 'S24_2360', 41, 56.10, 3),
(10355, 'S24_2972', 36, 37.38, 4),
(10355, 'S24_3371', 44, 60.62, 6),
(10355, 'S24_3856', 32, 137.62, 8),
(10355, 'S24_4620', 28, 75.18, 9),
(10355, 'S32_2206', 38, 32.99, 10),
(10355, 'S32_4485', 40, 93.89, 5),
(10356, 'S18_1129', 43, 120.31, 8),
(10356, 'S18_1342', 50, 82.19, 9),
(10356, 'S18_1367', 22, 44.75, 6),
(10356, 'S18_1984', 27, 130.87, 2),
(10356, 'S18_2325', 29, 106.79, 3),
(10356, 'S18_2795', 30, 158.63, 1),
(10356, 'S24_1937', 48, 31.86, 5),
(10356, 'S24_2022', 26, 42.11, 7),
(10356, 'S50_4713', 26, 78.11, 4),
(10357, 'S10_1949', 32, 199.30, 10),
(10357, 'S10_4962', 43, 135.92, 9),
(10357, 'S12_1666', 49, 109.34, 8),
(10357, 'S18_1097', 39, 112.00, 1),
(10357, 'S18_2432', 41, 58.95, 7),
(10357, 'S18_2949', 41, 91.18, 6),
(10357, 'S18_2957', 49, 59.34, 5),
(10357, 'S18_3136', 44, 104.72, 4),
(10357, 'S18_3320', 25, 84.33, 3),
(10357, 'S18_4600', 28, 105.34, 2),
(10358, 'S12_3148', 49, 129.93, 5),
(10358, 'S12_4473', 42, 98.36, 9),
(10358, 'S18_2238', 20, 142.45, 10),
(10358, 'S18_2319', 20, 99.41, 11),
(10358, 'S18_3232', 32, 137.17, 12),
(10358, 'S18_4027', 25, 117.77, 13),
(10358, 'S18_4668', 30, 46.29, 8),
(10358, 'S24_1444', 44, 56.07, 14),
(10358, 'S24_2300', 41, 127.79, 7),
(10358, 'S24_2840', 36, 33.59, 4),
(10358, 'S24_4258', 41, 88.62, 6),
(10358, 'S32_1268', 41, 82.83, 1),
(10358, 'S32_3522', 36, 51.71, 2),
(10358, 'S700_2824', 27, 85.98, 3),
(10359, 'S10_4757', 48, 122.40, 6),
(10359, 'S12_1108', 42, 180.79, 8),
(10359, 'S12_3891', 49, 162.64, 5),
(10359, 'S24_4048', 22, 108.82, 7),
(10359, 'S32_2509', 36, 45.45, 3),
(10359, 'S32_3207', 22, 62.14, 1),
(10359, 'S50_1392', 46, 99.55, 2),
(10359, 'S50_1514', 25, 47.45, 4),
(10360, 'S18_1662', 50, 126.15, 12),
(10360, 'S18_2581', 41, 68.43, 13),
(10360, 'S18_3029', 46, 71.40, 14),
(10360, 'S18_3140', 29, 122.93, 8),
(10360, 'S18_3259', 29, 94.79, 18),
(10360, 'S18_3856', 40, 101.64, 15),
(10360, 'S18_4522', 40, 76.36, 1),
(10360, 'S24_1785', 22, 106.14, 17),
(10360, 'S24_2011', 31, 100.77, 2),
(10360, 'S24_2841', 49, 55.49, 16),
(10360, 'S24_3151', 36, 70.81, 3),
(10360, 'S24_3816', 22, 78.83, 4),
(10360, 'S700_1138', 32, 64.67, 5),
(10360, 'S700_1938', 26, 86.61, 6),
(10360, 'S700_2610', 30, 70.11, 7),
(10360, 'S700_3505', 35, 83.14, 9),
(10360, 'S700_3962', 31, 92.36, 10),
(10360, 'S72_3212', 31, 54.05, 11),
(10361, 'S10_1678', 20, 92.83, 13),
(10361, 'S10_2016', 26, 114.18, 8),
(10361, 'S24_3420', 34, 62.46, 6),
(10361, 'S24_3949', 26, 61.42, 7),
(10361, 'S24_4278', 25, 68.83, 1),
(10361, 'S32_4289', 49, 56.41, 2),
(10361, 'S50_1341', 33, 35.78, 3),
(10361, 'S700_1691', 20, 88.60, 4),
(10361, 'S700_2047', 24, 85.99, 14),
(10361, 'S700_2466', 26, 91.74, 9),
(10361, 'S700_2834', 44, 107.97, 5),
(10361, 'S700_3167', 44, 76.80, 10),
(10361, 'S700_4002', 35, 62.19, 11),
(10361, 'S72_1253', 23, 47.67, 12),
(10362, 'S10_4698', 22, 182.04, 4),
(10362, 'S12_2823', 22, 131.04, 1),
(10362, 'S18_2625', 23, 53.91, 3),
(10362, 'S24_1578', 50, 91.29, 2),
(10363, 'S12_1099', 33, 180.95, 3),
(10363, 'S12_3380', 34, 106.87, 4),
(10363, 'S12_3990', 34, 68.63, 5),
(10363, 'S12_4675', 46, 103.64, 6),
(10363, 'S18_1889', 22, 61.60, 7),
(10363, 'S18_3278', 46, 69.15, 10),
(10363, 'S18_3482', 24, 124.94, 11),
(10363, 'S18_3782', 32, 52.22, 12),
(10363, 'S18_4721', 28, 123.50, 13),
(10363, 'S24_2000', 21, 70.08, 8),
(10363, 'S24_2360', 43, 56.10, 14),
(10363, 'S24_3371', 21, 52.05, 15),
(10363, 'S24_3856', 31, 113.75, 1),
(10363, 'S24_4620', 43, 75.99, 9),
(10363, 'S32_1374', 50, 92.90, 2),
(10364, 'S32_2206', 48, 38.22, 1),
(10365, 'S18_1129', 30, 116.06, 1),
(10365, 'S32_4485', 22, 82.66, 3),
(10365, 'S50_4713', 44, 68.34, 2),
(10366, 'S18_1984', 34, 116.65, 3),
(10366, 'S18_2870', 49, 105.60, 2),
(10366, 'S18_3232', 34, 154.10, 1),
(10367, 'S18_1589', 49, 105.77, 1),
(10367, 'S18_1749', 37, 144.50, 3),
(10367, 'S18_2248', 45, 50.25, 4),
(10367, 'S18_2325', 27, 124.59, 5),
(10367, 'S18_2795', 32, 140.06, 7),
(10367, 'S18_3685', 46, 131.39, 6),
(10367, 'S18_4409', 43, 77.31, 8),
(10367, 'S18_4933', 44, 66.99, 9),
(10367, 'S24_1046', 21, 72.76, 10),
(10367, 'S24_1628', 38, 50.31, 11),
(10367, 'S24_1937', 23, 29.54, 13),
(10367, 'S24_2022', 28, 43.01, 12),
(10367, 'S24_2972', 36, 36.25, 2),
(10368, 'S24_2766', 40, 73.60, 2),
(10368, 'S24_2887', 31, 115.09, 5),
(10368, 'S24_3191', 46, 83.04, 1),
(10368, 'S24_3432', 20, 93.16, 4),
(10368, 'S24_3969', 46, 36.52, 3),
(10369, 'S10_1949', 41, 195.01, 2),
(10369, 'S18_1342', 44, 89.38, 8),
(10369, 'S18_1367', 32, 46.36, 7),
(10369, 'S18_2949', 42, 100.30, 1),
(10369, 'S18_2957', 28, 51.84, 6),
(10369, 'S18_3136', 21, 90.06, 5),
(10369, 'S18_3320', 45, 80.36, 4),
(10369, 'S24_4258', 40, 93.49, 3),
(10370, 'S10_4962', 35, 128.53, 4),
(10370, 'S12_1666', 49, 128.47, 8),
(10370, 'S18_1097', 27, 100.34, 1),
(10370, 'S18_2319', 22, 101.87, 5),
(10370, 'S18_2432', 22, 60.16, 7),
(10370, 'S18_3232', 27, 167.65, 9),
(10370, 'S18_4600', 29, 105.34, 6),
(10370, 'S18_4668', 20, 41.76, 2),
(10370, 'S32_3522', 25, 63.99, 3),
(10371, 'S12_1108', 32, 178.71, 6),
(10371, 'S12_4473', 49, 104.28, 4),
(10371, 'S18_2238', 25, 160.46, 7),
(10371, 'S24_1444', 25, 53.75, 12),
(10371, 'S24_2300', 20, 126.51, 5),
(10371, 'S24_2840', 45, 35.01, 8),
(10371, 'S24_4048', 28, 95.81, 9),
(10371, 'S32_1268', 26, 82.83, 1),
(10371, 'S32_2509', 20, 44.37, 2),
(10371, 'S32_3207', 30, 53.44, 11),
(10371, 'S50_1392', 48, 97.23, 10),
(10371, 'S700_2824', 34, 83.95, 3),
(10372, 'S12_3148', 40, 146.55, 4),
(10372, 'S12_3891', 34, 140.15, 1),
(10372, 'S18_3140', 28, 131.13, 3),
(10372, 'S18_3259', 25, 91.76, 5),
(10372, 'S18_4027', 48, 119.20, 6),
(10372, 'S18_4522', 41, 78.99, 7),
(10372, 'S24_2011', 37, 102.00, 8),
(10372, 'S50_1514', 24, 56.82, 9),
(10372, 'S700_1938', 44, 74.48, 2),
(10373, 'S10_4757', 39, 118.32, 3),
(10373, 'S18_1662', 28, 143.50, 4),
(10373, 'S18_3029', 22, 75.70, 5),
(10373, 'S18_3856', 50, 99.52, 6),
(10373, 'S24_2841', 38, 58.92, 7),
(10373, 'S24_3151', 33, 82.31, 12),
(10373, 'S24_3420', 46, 53.92, 11),
(10373, 'S24_3816', 23, 83.86, 10),
(10373, 'S24_3949', 39, 62.10, 13),
(10373, 'S700_1138', 44, 58.00, 14),
(10373, 'S700_2047', 32, 76.94, 15),
(10373, 'S700_2610', 41, 69.39, 16),
(10373, 'S700_3505', 34, 94.16, 2),
(10373, 'S700_3962', 37, 83.42, 8),
(10373, 'S700_4002', 45, 68.11, 17),
(10373, 'S72_1253', 25, 44.20, 9),
(10373, 'S72_3212', 29, 48.05, 1),
(10374, 'S10_2016', 39, 115.37, 5),
(10374, 'S10_4698', 22, 158.80, 1),
(10374, 'S18_2581', 42, 75.19, 2),
(10374, 'S18_2625', 22, 48.46, 4),
(10374, 'S24_1578', 38, 112.70, 6),
(10374, 'S24_1785', 46, 107.23, 3),
(10375, 'S10_1678', 21, 76.56, 12),
(10375, 'S12_1099', 45, 184.84, 7),
(10375, 'S12_2823', 49, 150.62, 13),
(10375, 'S24_2000', 23, 67.03, 9),
(10375, 'S24_2360', 20, 60.26, 14),
(10375, 'S24_4278', 43, 60.13, 2),
(10375, 'S32_1374', 37, 87.90, 3),
(10375, 'S32_4289', 44, 59.85, 4),
(10375, 'S32_4485', 41, 96.95, 15),
(10375, 'S50_1341', 49, 36.22, 5),
(10375, 'S50_4713', 49, 69.16, 8),
(10375, 'S700_1691', 37, 86.77, 6),
(10375, 'S700_2466', 33, 94.73, 1),
(10375, 'S700_2834', 25, 98.48, 10),
(10375, 'S700_3167', 44, 69.60, 11),
(10376, 'S12_3380', 35, 98.65, 1),
(10377, 'S12_3990', 24, 65.44, 5),
(10377, 'S12_4675', 50, 112.86, 1),
(10377, 'S18_1129', 35, 124.56, 2),
(10377, 'S18_1889', 31, 61.60, 4),
(10377, 'S18_1984', 36, 125.18, 6),
(10377, 'S18_3232', 39, 143.94, 3),
(10378, 'S18_1589', 34, 121.95, 5),
(10378, 'S18_3278', 22, 66.74, 4),
(10378, 'S18_3482', 43, 146.99, 10),
(10378, 'S18_3782', 28, 60.30, 9),
(10378, 'S18_4721', 49, 122.02, 8),
(10378, 'S24_2972', 41, 30.59, 7),
(10378, 'S24_3371', 46, 52.66, 6),
(10378, 'S24_3856', 33, 129.20, 3),
(10378, 'S24_4620', 41, 80.84, 2),
(10378, 'S32_2206', 40, 35.80, 1),
(10379, 'S18_1749', 39, 156.40, 2),
(10379, 'S18_2248', 27, 50.85, 1),
(10379, 'S18_2870', 29, 113.52, 5),
(10379, 'S18_3685', 32, 134.22, 4),
(10379, 'S24_1628', 32, 48.80, 3),
(10380, 'S18_1342', 27, 88.36, 13),
(10380, 'S18_2325', 40, 119.50, 10),
(10380, 'S18_2795', 21, 156.94, 8),
(10380, 'S18_4409', 32, 78.23, 1),
(10380, 'S18_4933', 24, 66.99, 2),
(10380, 'S24_1046', 34, 66.88, 3),
(10380, 'S24_1937', 32, 29.87, 4),
(10380, 'S24_2022', 27, 37.63, 5),
(10380, 'S24_2766', 36, 77.24, 6),
(10380, 'S24_2887', 44, 111.57, 7),
(10380, 'S24_3191', 44, 77.05, 9),
(10380, 'S24_3432', 34, 91.02, 11),
(10380, 'S24_3969', 43, 32.82, 12),
(10381, 'S10_1949', 36, 182.16, 3),
(10381, 'S10_4962', 37, 138.88, 6),
(10381, 'S12_1666', 20, 132.57, 1),
(10381, 'S18_1097', 48, 114.34, 2),
(10381, 'S18_1367', 25, 49.60, 9),
(10381, 'S18_2432', 35, 60.77, 7),
(10381, 'S18_2949', 41, 100.30, 8),
(10381, 'S18_2957', 40, 51.22, 4),
(10381, 'S18_3136', 35, 93.20, 5),
(10382, 'S12_1108', 34, 166.24, 10),
(10382, 'S12_3148', 37, 145.04, 11),
(10382, 'S12_3891', 34, 143.61, 12),
(10382, 'S12_4473', 32, 103.10, 13),
(10382, 'S18_2238', 25, 160.46, 5),
(10382, 'S18_3320', 50, 84.33, 7),
(10382, 'S18_4600', 39, 115.03, 1),
(10382, 'S18_4668', 39, 46.29, 2),
(10382, 'S24_2300', 20, 120.12, 3),
(10382, 'S24_4258', 33, 97.39, 4),
(10382, 'S32_1268', 26, 85.72, 6),
(10382, 'S32_3522', 48, 57.53, 8),
(10382, 'S700_2824', 34, 101.15, 9),
(10383, 'S18_2319', 27, 119.05, 11),
(10383, 'S18_3140', 24, 125.66, 9),
(10383, 'S18_3232', 47, 155.79, 6),
(10383, 'S18_3259', 26, 83.70, 12),
(10383, 'S18_4027', 38, 137.88, 1),
(10383, 'S18_4522', 28, 77.24, 7),
(10383, 'S24_1444', 22, 52.60, 2),
(10383, 'S24_2840', 40, 33.24, 3),
(10383, 'S24_4048', 21, 117.10, 4),
(10383, 'S32_2509', 32, 53.57, 5),
(10383, 'S32_3207', 44, 55.93, 8),
(10383, 'S50_1392', 29, 94.92, 13),
(10383, 'S50_1514', 38, 48.62, 10),
(10384, 'S10_4757', 34, 129.20, 4),
(10384, 'S24_2011', 28, 114.29, 3),
(10384, 'S24_3151', 43, 71.69, 2),
(10384, 'S700_1938', 49, 71.02, 1),
(10385, 'S24_3816', 37, 78.83, 2),
(10385, 'S700_1138', 25, 62.00, 1),
(10386, 'S18_1662', 25, 130.88, 7),
(10386, 'S18_2581', 21, 72.65, 18),
(10386, 'S18_3029', 37, 73.12, 5),
(10386, 'S18_3856', 22, 100.58, 6),
(10386, 'S24_1785', 33, 101.76, 11),
(10386, 'S24_2841', 39, 56.86, 1),
(10386, 'S24_3420', 35, 54.57, 9),
(10386, 'S24_3949', 41, 55.96, 12),
(10386, 'S24_4278', 50, 71.73, 8),
(10386, 'S700_2047', 29, 85.09, 13),
(10386, 'S700_2466', 37, 90.75, 14),
(10386, 'S700_2610', 37, 67.22, 10),
(10386, 'S700_3167', 32, 68.00, 17),
(10386, 'S700_3505', 45, 83.14, 2),
(10386, 'S700_3962', 30, 80.44, 3),
(10386, 'S700_4002', 44, 59.22, 15),
(10386, 'S72_1253', 50, 47.67, 16),
(10386, 'S72_3212', 43, 52.42, 4),
(10387, 'S32_1374', 44, 79.91, 1),
(10388, 'S10_1678', 42, 80.39, 4),
(10388, 'S10_2016', 50, 118.94, 5),
(10388, 'S10_4698', 21, 156.86, 7),
(10388, 'S12_2823', 44, 125.01, 6),
(10388, 'S32_4289', 35, 58.47, 8),
(10388, 'S50_1341', 27, 41.02, 1),
(10388, 'S700_1691', 46, 74.90, 2),
(10388, 'S700_2834', 50, 111.53, 3),
(10389, 'S12_1099', 26, 182.90, 4),
(10389, 'S12_3380', 25, 95.13, 6),
(10389, 'S12_3990', 36, 76.61, 7),
(10389, 'S12_4675', 47, 102.49, 8),
(10389, 'S18_1889', 49, 63.91, 3),
(10389, 'S18_2625', 39, 52.09, 5),
(10389, 'S24_1578', 45, 112.70, 1),
(10389, 'S24_2000', 49, 61.70, 2),
(10390, 'S18_1129', 36, 117.48, 14),
(10390, 'S18_1984', 34, 132.29, 15),
(10390, 'S18_2325', 31, 102.98, 16),
(10390, 'S18_2795', 26, 162.00, 7),
(10390, 'S18_3278', 40, 75.59, 9),
(10390, 'S18_3482', 50, 135.23, 1),
(10390, 'S18_3782', 36, 54.09, 2),
(10390, 'S18_4721', 49, 122.02, 3),
(10390, 'S24_2360', 35, 67.87, 4),
(10390, 'S24_2972', 37, 35.87, 5),
(10390, 'S24_3371', 46, 51.43, 6),
(10390, 'S24_3856', 45, 134.81, 8),
(10390, 'S24_4620', 30, 66.29, 10),
(10390, 'S32_2206', 41, 39.02, 11),
(10390, 'S32_4485', 45, 101.03, 12),
(10390, 'S50_4713', 22, 81.36, 13),
(10391, 'S10_1949', 24, 195.01, 4),
(10391, 'S10_4962', 37, 121.15, 7),
(10391, 'S12_1666', 39, 110.70, 9),
(10391, 'S18_1097', 29, 114.34, 10),
(10391, 'S18_1342', 35, 102.74, 2),
(10391, 'S18_1367', 42, 47.44, 3),
(10391, 'S18_2432', 44, 57.73, 5),
(10391, 'S18_2949', 32, 99.28, 6),
(10391, 'S24_1937', 33, 26.55, 8),
(10391, 'S24_2022', 24, 36.29, 1),
(10392, 'S18_2957', 37, 61.21, 3),
(10392, 'S18_3136', 29, 103.67, 2),
(10392, 'S18_3320', 36, 98.22, 1),
(10393, 'S12_3148', 35, 145.04, 8),
(10393, 'S12_4473', 32, 99.54, 10),
(10393, 'S18_2238', 20, 137.53, 11),
(10393, 'S18_2319', 38, 104.32, 7),
(10393, 'S18_4600', 30, 106.55, 9),
(10393, 'S18_4668', 44, 41.76, 1),
(10393, 'S24_2300', 33, 112.46, 2),
(10393, 'S24_4258', 33, 88.62, 3),
(10393, 'S32_1268', 38, 84.75, 4),
(10393, 'S32_3522', 31, 63.35, 5),
(10393, 'S700_2824', 21, 83.95, 6),
(10394, 'S18_3232', 22, 135.47, 5),
(10394, 'S18_4027', 37, 124.95, 1),
(10394, 'S24_1444', 31, 53.18, 2),
(10394, 'S24_2840', 46, 35.36, 6),
(10394, 'S24_4048', 37, 104.09, 7),
(10394, 'S32_2509', 36, 47.08, 3),
(10394, 'S32_3207', 30, 55.93, 4),
(10395, 'S10_4757', 32, 125.12, 2),
(10395, 'S12_1108', 33, 205.72, 1),
(10395, 'S50_1392', 46, 98.39, 4),
(10395, 'S50_1514', 45, 57.99, 3),
(10396, 'S12_3891', 33, 155.72, 3),
(10396, 'S18_3140', 33, 129.76, 2),
(10396, 'S18_3259', 24, 91.76, 4),
(10396, 'S18_4522', 45, 83.38, 5),
(10396, 'S24_2011', 49, 100.77, 6),
(10396, 'S24_3151', 27, 77.00, 7),
(10396, 'S24_3816', 37, 77.99, 8),
(10396, 'S700_1138', 39, 62.00, 1),
(10397, 'S700_1938', 32, 69.29, 5),
(10397, 'S700_2610', 22, 62.88, 4),
(10397, 'S700_3505', 48, 86.15, 3),
(10397, 'S700_3962', 36, 80.44, 2),
(10397, 'S72_3212', 34, 52.96, 1),
(10398, 'S18_1662', 33, 130.88, 11),
(10398, 'S18_2581', 34, 82.79, 15),
(10398, 'S18_3029', 28, 70.54, 18),
(10398, 'S18_3856', 45, 92.11, 17),
(10398, 'S24_1785', 43, 100.67, 16),
(10398, 'S24_2841', 28, 60.29, 3),
(10398, 'S24_3420', 34, 61.15, 13),
(10398, 'S24_3949', 41, 56.64, 2),
(10398, 'S24_4278', 45, 65.93, 14),
(10398, 'S32_4289', 22, 60.54, 4),
(10398, 'S50_1341', 49, 38.84, 5),
(10398, 'S700_1691', 47, 78.55, 6),
(10398, 'S700_2047', 36, 75.13, 7),
(10398, 'S700_2466', 22, 98.72, 8),
(10398, 'S700_2834', 23, 102.04, 9),
(10398, 'S700_3167', 29, 76.80, 10),
(10398, 'S700_4002', 36, 62.19, 12),
(10398, 'S72_1253', 34, 41.22, 1),
(10399, 'S10_1678', 40, 77.52, 8),
(10399, 'S10_2016', 51, 99.91, 7),
(10399, 'S10_4698', 22, 156.86, 6),
(10399, 'S12_2823', 29, 123.51, 5),
(10399, 'S18_2625', 30, 51.48, 4),
(10399, 'S24_1578', 57, 104.81, 3),
(10399, 'S24_2000', 58, 75.41, 2),
(10399, 'S32_1374', 32, 97.89, 1),
(10400, 'S10_4757', 64, 134.64, 9),
(10400, 'S18_1662', 34, 129.31, 1),
(10400, 'S18_3029', 30, 74.84, 7),
(10400, 'S18_3856', 58, 88.93, 6),
(10400, 'S24_2841', 24, 55.49, 2),
(10400, 'S24_3420', 38, 59.18, 3),
(10400, 'S24_3816', 42, 74.64, 8),
(10400, 'S700_2047', 46, 82.37, 5),
(10400, 'S72_1253', 20, 41.71, 4),
(10401, 'S18_2581', 42, 75.19, 3),
(10401, 'S24_1785', 38, 87.54, 5),
(10401, 'S24_3949', 64, 59.37, 12),
(10401, 'S24_4278', 52, 65.93, 4),
(10401, 'S32_1374', 49, 81.91, 1),
(10401, 'S32_4289', 62, 62.60, 6),
(10401, 'S50_1341', 56, 41.46, 7),
(10401, 'S700_1691', 11, 77.64, 8),
(10401, 'S700_2466', 85, 98.72, 10),
(10401, 'S700_2834', 21, 96.11, 2),
(10401, 'S700_3167', 77, 73.60, 9),
(10401, 'S700_4002', 40, 66.63, 11),
(10402, 'S10_2016', 45, 118.94, 1),
(10402, 'S18_2625', 55, 58.15, 2),
(10402, 'S24_2000', 59, 61.70, 3),
(10403, 'S10_1678', 24, 85.17, 7),
(10403, 'S10_4698', 66, 174.29, 9),
(10403, 'S12_2823', 66, 122.00, 6),
(10403, 'S18_3782', 36, 55.33, 1),
(10403, 'S24_1578', 46, 109.32, 8),
(10403, 'S24_2360', 27, 57.49, 4),
(10403, 'S32_2206', 30, 35.80, 2),
(10403, 'S32_4485', 45, 88.78, 5),
(10403, 'S50_4713', 31, 65.09, 3),
(10404, 'S12_1099', 64, 163.44, 3),
(10404, 'S12_3380', 43, 102.17, 1),
(10404, 'S12_3990', 77, 67.03, 4),
(10404, 'S18_3278', 90, 67.54, 6),
(10404, 'S18_3482', 28, 127.88, 5),
(10404, 'S18_4721', 48, 124.99, 8),
(10404, 'S24_3371', 49, 53.27, 2),
(10404, 'S24_4620', 48, 65.48, 7),
(10405, 'S12_4675', 97, 115.16, 5),
(10405, 'S18_1889', 61, 72.38, 4),
(10405, 'S18_3232', 55, 147.33, 1),
(10405, 'S24_2972', 47, 37.38, 2),
(10405, 'S24_3856', 76, 127.79, 3),
(10406, 'S18_1129', 61, 124.56, 3),
(10406, 'S18_1984', 48, 133.72, 2),
(10406, 'S18_3685', 65, 117.26, 1),
(10407, 'S18_1589', 59, 114.48, 11),
(10407, 'S18_1749', 76, 141.10, 2),
(10407, 'S18_2248', 42, 58.12, 1),
(10407, 'S18_2870', 41, 132.00, 12),
(10407, 'S18_4409', 6, 91.11, 3),
(10407, 'S18_4933', 66, 64.14, 4),
(10407, 'S24_1046', 26, 68.35, 8),
(10407, 'S24_1628', 64, 45.78, 10),
(10407, 'S24_2766', 76, 81.78, 6),
(10407, 'S24_2887', 59, 98.65, 5),
(10407, 'S24_3191', 13, 77.05, 7),
(10407, 'S24_3432', 43, 101.73, 9),
(10408, 'S24_3969', 15, 41.03, 1),
(10409, 'S18_2325', 6, 104.25, 2),
(10409, 'S24_1937', 61, 27.88, 1),
(10410, 'S18_1342', 65, 99.66, 7),
(10410, 'S18_1367', 44, 51.21, 6),
(10410, 'S18_2795', 56, 145.13, 8),
(10410, 'S18_2949', 47, 93.21, 1),
(10410, 'S18_2957', 53, 49.97, 3),
(10410, 'S18_3136', 34, 84.82, 2),
(10410, 'S18_3320', 44, 81.35, 5),
(10410, 'S24_2022', 31, 42.56, 9),
(10410, 'S24_4258', 50, 95.44, 4),
(10411, 'S10_1949', 23, 205.73, 9),
(10411, 'S10_4962', 27, 144.79, 2),
(10411, 'S12_1666', 40, 110.70, 6),
(10411, 'S18_1097', 27, 109.67, 8),
(10411, 'S18_4600', 46, 106.55, 3),
(10411, 'S18_4668', 35, 41.25, 7),
(10411, 'S32_1268', 26, 78.01, 1),
(10411, 'S32_3522', 27, 60.76, 5),
(10411, 'S700_2824', 34, 89.01, 4),
(10412, 'S12_4473', 54, 100.73, 5),
(10412, 'S18_2238', 41, 150.63, 4),
(10412, 'S18_2319', 56, 120.28, 8),
(10412, 'S18_2432', 47, 49.83, 11),
(10412, 'S18_3232', 60, 157.49, 9),
(10412, 'S24_1444', 21, 47.40, 2),
(10412, 'S24_2300', 70, 109.90, 10),
(10412, 'S24_2840', 30, 32.88, 6),
(10412, 'S24_4048', 31, 108.82, 1),
(10412, 'S32_2509', 19, 50.86, 7),
(10412, 'S50_1392', 26, 105.33, 3),
(10413, 'S12_1108', 36, 201.57, 2),
(10413, 'S12_3148', 47, 145.04, 3),
(10413, 'S12_3891', 22, 173.02, 1),
(10413, 'S18_4027', 49, 133.57, 5),
(10413, 'S32_3207', 24, 56.55, 6),
(10413, 'S50_1514', 51, 53.31, 4),
(10414, 'S10_4757', 49, 114.24, 3),
(10414, 'S18_3029', 44, 77.42, 1),
(10414, 'S18_3140', 41, 128.39, 12),
(10414, 'S18_3259', 48, 85.71, 14),
(10414, 'S18_4522', 56, 83.38, 11),
(10414, 'S24_2011', 43, 108.14, 10),
(10414, 'S24_3151', 60, 72.58, 5),
(10414, 'S24_3816', 51, 72.96, 2),
(10414, 'S700_1138', 37, 62.00, 6),
(10414, 'S700_1938', 34, 74.48, 13),
(10414, 'S700_2610', 31, 61.44, 4),
(10414, 'S700_3505', 28, 84.14, 7),
(10414, 'S700_3962', 40, 84.41, 8),
(10414, 'S72_3212', 47, 54.60, 9),
(10415, 'S18_3856', 51, 86.81, 5),
(10415, 'S24_2841', 21, 60.97, 1),
(10415, 'S24_3420', 18, 59.83, 2),
(10415, 'S700_2047', 32, 73.32, 4),
(10415, 'S72_1253', 42, 43.20, 3),
(10416, 'S18_1662', 24, 129.31, 14),
(10416, 'S18_2581', 15, 70.96, 4),
(10416, 'S24_1785', 47, 90.82, 6),
(10416, 'S24_2000', 32, 62.46, 1),
(10416, 'S24_3949', 18, 64.83, 13),
(10416, 'S24_4278', 48, 70.28, 5),
(10416, 'S32_1374', 45, 86.90, 2),
(10416, 'S32_4289', 26, 68.10, 7),
(10416, 'S50_1341', 37, 39.71, 8),
(10416, 'S700_1691', 23, 88.60, 9),
(10416, 'S700_2466', 22, 84.76, 11),
(10416, 'S700_2834', 41, 98.48, 3),
(10416, 'S700_3167', 39, 65.60, 10),
(10416, 'S700_4002', 43, 63.67, 12),
(10417, 'S10_1678', 66, 79.43, 2),
(10417, 'S10_2016', 45, 116.56, 5),
(10417, 'S10_4698', 56, 162.67, 4),
(10417, 'S12_2823', 21, 144.60, 1),
(10417, 'S18_2625', 36, 58.75, 6),
(10417, 'S24_1578', 35, 109.32, 3),
(10418, 'S18_3278', 16, 70.76, 2),
(10418, 'S18_3482', 27, 139.64, 1),
(10418, 'S18_3782', 33, 56.57, 5),
(10418, 'S18_4721', 28, 120.53, 4),
(10418, 'S24_2360', 52, 64.41, 8),
(10418, 'S24_4620', 10, 66.29, 3),
(10418, 'S32_2206', 43, 36.61, 6),
(10418, 'S32_4485', 50, 100.01, 9),
(10418, 'S50_4713', 40, 72.41, 7),
(10419, 'S12_1099', 12, 182.90, 13),
(10419, 'S12_3380', 10, 111.57, 11),
(10419, 'S12_3990', 34, 64.64, 14),
(10419, 'S12_4675', 32, 99.04, 10),
(10419, 'S18_1129', 38, 117.48, 5),
(10419, 'S18_1589', 37, 100.80, 1),
(10419, 'S18_1889', 39, 67.76, 9),
(10419, 'S18_1984', 34, 133.72, 4),
(10419, 'S18_2870', 55, 116.16, 2),
(10419, 'S18_3232', 35, 165.95, 6),
(10419, 'S18_3685', 43, 114.44, 3),
(10419, 'S24_2972', 15, 32.10, 7),
(10419, 'S24_3371', 55, 52.66, 12),
(10419, 'S24_3856', 70, 112.34, 8),
(10420, 'S18_1749', 37, 153.00, 5),
(10420, 'S18_2248', 36, 52.06, 4),
(10420, 'S18_2325', 45, 116.96, 2);
INSERT INTO `orderdetails` (`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`) VALUES
(10420, 'S18_4409', 66, 73.62, 6),
(10420, 'S18_4933', 36, 68.42, 7),
(10420, 'S24_1046', 60, 60.26, 11),
(10420, 'S24_1628', 37, 48.80, 13),
(10420, 'S24_1937', 45, 32.19, 1),
(10420, 'S24_2766', 39, 76.33, 9),
(10420, 'S24_2887', 55, 115.09, 8),
(10420, 'S24_3191', 35, 77.05, 10),
(10420, 'S24_3432', 26, 104.94, 12),
(10420, 'S24_3969', 15, 35.29, 3),
(10421, 'S18_2795', 35, 167.06, 1),
(10421, 'S24_2022', 40, 44.80, 2),
(10422, 'S18_1342', 51, 91.44, 2),
(10422, 'S18_1367', 25, 47.44, 1),
(10423, 'S18_2949', 10, 89.15, 1),
(10423, 'S18_2957', 31, 56.21, 3),
(10423, 'S18_3136', 21, 98.44, 2),
(10423, 'S18_3320', 21, 80.36, 5),
(10423, 'S24_4258', 28, 78.89, 4),
(10424, 'S10_1949', 50, 201.44, 6),
(10424, 'S12_1666', 49, 121.64, 3),
(10424, 'S18_1097', 54, 108.50, 5),
(10424, 'S18_4668', 26, 40.25, 4),
(10424, 'S32_3522', 44, 54.94, 2),
(10424, 'S700_2824', 46, 85.98, 1),
(10425, 'S10_4962', 38, 131.49, 12),
(10425, 'S12_4473', 33, 95.99, 4),
(10425, 'S18_2238', 28, 147.36, 3),
(10425, 'S18_2319', 38, 117.82, 7),
(10425, 'S18_2432', 19, 48.62, 10),
(10425, 'S18_3232', 28, 140.55, 8),
(10425, 'S18_4600', 38, 107.76, 13),
(10425, 'S24_1444', 55, 53.75, 1),
(10425, 'S24_2300', 49, 127.79, 9),
(10425, 'S24_2840', 31, 31.82, 5),
(10425, 'S32_1268', 41, 83.79, 11),
(10425, 'S32_2509', 11, 50.32, 6),
(10425, 'S50_1392', 18, 94.92, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text DEFAULT NULL,
  `customerNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`orderNumber`, `orderDate`, `requiredDate`, `shippedDate`, `status`, `comments`, `customerNumber`) VALUES
(10100, '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, 363),
(10101, '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', 128),
(10102, '2003-01-10', '2003-01-18', '2003-01-14', 'Shipped', NULL, 181),
(10103, '2003-01-29', '2003-02-07', '2003-02-02', 'Shipped', NULL, 121),
(10104, '2003-01-31', '2003-02-09', '2003-02-01', 'Shipped', NULL, 141),
(10105, '2003-02-11', '2003-02-21', '2003-02-12', 'Shipped', NULL, 145),
(10106, '2003-02-17', '2003-02-24', '2003-02-21', 'Shipped', NULL, 278),
(10107, '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', 131),
(10108, '2003-03-03', '2003-03-12', '2003-03-08', 'Shipped', NULL, 385),
(10109, '2003-03-10', '2003-03-19', '2003-03-11', 'Shipped', 'Customer requested that FedEx Ground is used for this shipping', 486),
(10110, '2003-03-18', '2003-03-24', '2003-03-20', 'Shipped', NULL, 187),
(10111, '2003-03-25', '2003-03-31', '2003-03-30', 'Shipped', NULL, 129),
(10112, '2003-03-24', '2003-04-03', '2003-03-29', 'Shipped', 'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 144),
(10113, '2003-03-26', '2003-04-02', '2003-03-27', 'Shipped', NULL, 124),
(10114, '2003-04-01', '2003-04-07', '2003-04-02', 'Shipped', NULL, 172),
(10115, '2003-04-04', '2003-04-12', '2003-04-07', 'Shipped', NULL, 424),
(10116, '2003-04-11', '2003-04-19', '2003-04-13', 'Shipped', NULL, 381),
(10117, '2003-04-16', '2003-04-24', '2003-04-17', 'Shipped', NULL, 148),
(10118, '2003-04-21', '2003-04-29', '2003-04-26', 'Shipped', 'Customer has worked with some of our vendors in the past and is aware of their MSRP', 216),
(10119, '2003-04-28', '2003-05-05', '2003-05-02', 'Shipped', NULL, 382),
(10120, '2003-04-29', '2003-05-08', '2003-05-01', 'Shipped', NULL, 114),
(10121, '2003-05-07', '2003-05-13', '2003-05-13', 'Shipped', NULL, 353),
(10122, '2003-05-08', '2003-05-16', '2003-05-13', 'Shipped', NULL, 350),
(10123, '2003-05-20', '2003-05-29', '2003-05-22', 'Shipped', NULL, 103),
(10124, '2003-05-21', '2003-05-29', '2003-05-25', 'Shipped', 'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 112),
(10125, '2003-05-21', '2003-05-27', '2003-05-24', 'Shipped', NULL, 114),
(10126, '2003-05-28', '2003-06-07', '2003-06-02', 'Shipped', NULL, 458),
(10127, '2003-06-03', '2003-06-09', '2003-06-06', 'Shipped', 'Customer requested special shippment. The instructions were passed along to the warehouse', 151),
(10128, '2003-06-06', '2003-06-12', '2003-06-11', 'Shipped', NULL, 141),
(10129, '2003-06-12', '2003-06-18', '2003-06-14', 'Shipped', NULL, 324),
(10130, '2003-06-16', '2003-06-24', '2003-06-21', 'Shipped', NULL, 198),
(10131, '2003-06-16', '2003-06-25', '2003-06-21', 'Shipped', NULL, 447),
(10132, '2003-06-25', '2003-07-01', '2003-06-28', 'Shipped', NULL, 323),
(10133, '2003-06-27', '2003-07-04', '2003-07-03', 'Shipped', NULL, 141),
(10134, '2003-07-01', '2003-07-10', '2003-07-05', 'Shipped', NULL, 250),
(10135, '2003-07-02', '2003-07-12', '2003-07-03', 'Shipped', NULL, 124),
(10136, '2003-07-04', '2003-07-14', '2003-07-06', 'Shipped', 'Customer is interested in buying more Ferrari models', 242),
(10137, '2003-07-10', '2003-07-20', '2003-07-14', 'Shipped', NULL, 353),
(10138, '2003-07-07', '2003-07-16', '2003-07-13', 'Shipped', NULL, 496),
(10139, '2003-07-16', '2003-07-23', '2003-07-21', 'Shipped', NULL, 282),
(10140, '2003-07-24', '2003-08-02', '2003-07-30', 'Shipped', NULL, 161),
(10141, '2003-08-01', '2003-08-09', '2003-08-04', 'Shipped', NULL, 334),
(10142, '2003-08-08', '2003-08-16', '2003-08-13', 'Shipped', NULL, 124),
(10143, '2003-08-10', '2003-08-18', '2003-08-12', 'Shipped', 'Can we deliver the new Ford Mustang models by end-of-quarter?', 320),
(10144, '2003-08-13', '2003-08-21', '2003-08-14', 'Shipped', NULL, 381),
(10145, '2003-08-25', '2003-09-02', '2003-08-31', 'Shipped', NULL, 205),
(10146, '2003-09-03', '2003-09-13', '2003-09-06', 'Shipped', NULL, 447),
(10147, '2003-09-05', '2003-09-12', '2003-09-09', 'Shipped', NULL, 379),
(10148, '2003-09-11', '2003-09-21', '2003-09-15', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 276),
(10149, '2003-09-12', '2003-09-18', '2003-09-17', 'Shipped', NULL, 487),
(10150, '2003-09-19', '2003-09-27', '2003-09-21', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 148),
(10151, '2003-09-21', '2003-09-30', '2003-09-24', 'Shipped', NULL, 311),
(10152, '2003-09-25', '2003-10-03', '2003-10-01', 'Shipped', NULL, 333),
(10153, '2003-09-28', '2003-10-05', '2003-10-03', 'Shipped', NULL, 141),
(10154, '2003-10-02', '2003-10-12', '2003-10-08', 'Shipped', NULL, 219),
(10155, '2003-10-06', '2003-10-13', '2003-10-07', 'Shipped', NULL, 186),
(10156, '2003-10-08', '2003-10-17', '2003-10-11', 'Shipped', NULL, 141),
(10157, '2003-10-09', '2003-10-15', '2003-10-14', 'Shipped', NULL, 473),
(10158, '2003-10-10', '2003-10-18', '2003-10-15', 'Shipped', NULL, 121),
(10159, '2003-10-10', '2003-10-19', '2003-10-16', 'Shipped', NULL, 321),
(10160, '2003-10-11', '2003-10-17', '2003-10-17', 'Shipped', NULL, 347),
(10161, '2003-10-17', '2003-10-25', '2003-10-20', 'Shipped', NULL, 227),
(10162, '2003-10-18', '2003-10-26', '2003-10-19', 'Shipped', NULL, 321),
(10163, '2003-10-20', '2003-10-27', '2003-10-24', 'Shipped', NULL, 424),
(10164, '2003-10-21', '2003-10-30', '2003-10-23', 'Resolved', 'This order was disputed, but resolved on 11/1/2003; Customer doesn\'t like the colors and precision of the models.', 452),
(10165, '2003-10-22', '2003-10-31', '2003-12-26', 'Shipped', 'This order was on hold because customers\'s credit limit had been exceeded. Order will ship when payment is received', 148),
(10166, '2003-10-21', '2003-10-30', '2003-10-27', 'Shipped', NULL, 462),
(10167, '2003-10-23', '2003-10-30', NULL, 'Cancelled', 'Customer called to cancel. The warehouse was notified in time and the order didn\'t ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.', 448),
(10168, '2003-10-28', '2003-11-03', '2003-11-01', 'Shipped', NULL, 161),
(10169, '2003-11-04', '2003-11-14', '2003-11-09', 'Shipped', NULL, 276),
(10170, '2003-11-04', '2003-11-12', '2003-11-07', 'Shipped', NULL, 452),
(10171, '2003-11-05', '2003-11-13', '2003-11-07', 'Shipped', NULL, 233),
(10172, '2003-11-05', '2003-11-14', '2003-11-11', 'Shipped', NULL, 175),
(10173, '2003-11-05', '2003-11-15', '2003-11-09', 'Shipped', 'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 278),
(10174, '2003-11-06', '2003-11-15', '2003-11-10', 'Shipped', NULL, 333),
(10175, '2003-11-06', '2003-11-14', '2003-11-09', 'Shipped', NULL, 324),
(10176, '2003-11-06', '2003-11-15', '2003-11-12', 'Shipped', NULL, 386),
(10177, '2003-11-07', '2003-11-17', '2003-11-12', 'Shipped', NULL, 344),
(10178, '2003-11-08', '2003-11-16', '2003-11-10', 'Shipped', 'Custom shipping instructions sent to warehouse', 242),
(10179, '2003-11-11', '2003-11-17', '2003-11-13', 'Cancelled', 'Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.', 496),
(10180, '2003-11-11', '2003-11-19', '2003-11-14', 'Shipped', NULL, 171),
(10181, '2003-11-12', '2003-11-19', '2003-11-15', 'Shipped', NULL, 167),
(10182, '2003-11-12', '2003-11-21', '2003-11-18', 'Shipped', NULL, 124),
(10183, '2003-11-13', '2003-11-22', '2003-11-15', 'Shipped', 'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 339),
(10184, '2003-11-14', '2003-11-22', '2003-11-20', 'Shipped', NULL, 484),
(10185, '2003-11-14', '2003-11-21', '2003-11-20', 'Shipped', NULL, 320),
(10186, '2003-11-14', '2003-11-20', '2003-11-18', 'Shipped', 'They want to reevaluate their terms agreement with the VP of Sales', 489),
(10187, '2003-11-15', '2003-11-24', '2003-11-16', 'Shipped', NULL, 211),
(10188, '2003-11-18', '2003-11-26', '2003-11-24', 'Shipped', NULL, 167),
(10189, '2003-11-18', '2003-11-25', '2003-11-24', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 205),
(10190, '2003-11-19', '2003-11-29', '2003-11-20', 'Shipped', NULL, 141),
(10191, '2003-11-20', '2003-11-30', '2003-11-24', 'Shipped', 'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 259),
(10192, '2003-11-20', '2003-11-29', '2003-11-25', 'Shipped', NULL, 363),
(10193, '2003-11-21', '2003-11-28', '2003-11-27', 'Shipped', NULL, 471),
(10194, '2003-11-25', '2003-12-02', '2003-11-26', 'Shipped', NULL, 146),
(10195, '2003-11-25', '2003-12-01', '2003-11-28', 'Shipped', NULL, 319),
(10196, '2003-11-26', '2003-12-03', '2003-12-01', 'Shipped', NULL, 455),
(10197, '2003-11-26', '2003-12-02', '2003-12-01', 'Shipped', 'Customer inquired about remote controlled models and gold models.', 216),
(10198, '2003-11-27', '2003-12-06', '2003-12-03', 'Shipped', NULL, 385),
(10199, '2003-12-01', '2003-12-10', '2003-12-06', 'Shipped', NULL, 475),
(10200, '2003-12-01', '2003-12-09', '2003-12-06', 'Shipped', NULL, 211),
(10201, '2003-12-01', '2003-12-11', '2003-12-02', 'Shipped', NULL, 129),
(10202, '2003-12-02', '2003-12-09', '2003-12-06', 'Shipped', NULL, 357),
(10203, '2003-12-02', '2003-12-11', '2003-12-07', 'Shipped', NULL, 141),
(10204, '2003-12-02', '2003-12-10', '2003-12-04', 'Shipped', NULL, 151),
(10205, '2003-12-03', '2003-12-09', '2003-12-07', 'Shipped', ' I need all the information I can get on our competitors.', 141),
(10206, '2003-12-05', '2003-12-13', '2003-12-08', 'Shipped', 'Can we renegotiate this one?', 202),
(10207, '2003-12-09', '2003-12-17', '2003-12-11', 'Shipped', 'Check on availability.', 495),
(10208, '2004-01-02', '2004-01-11', '2004-01-04', 'Shipped', NULL, 146),
(10209, '2004-01-09', '2004-01-15', '2004-01-12', 'Shipped', NULL, 347),
(10210, '2004-01-12', '2004-01-22', '2004-01-20', 'Shipped', NULL, 177),
(10211, '2004-01-15', '2004-01-25', '2004-01-18', 'Shipped', NULL, 406),
(10212, '2004-01-16', '2004-01-24', '2004-01-18', 'Shipped', NULL, 141),
(10213, '2004-01-22', '2004-01-28', '2004-01-27', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', 489),
(10214, '2004-01-26', '2004-02-04', '2004-01-29', 'Shipped', NULL, 458),
(10215, '2004-01-29', '2004-02-08', '2004-02-01', 'Shipped', 'Customer requested that FedEx Ground is used for this shipping', 475),
(10216, '2004-02-02', '2004-02-10', '2004-02-04', 'Shipped', NULL, 256),
(10217, '2004-02-04', '2004-02-14', '2004-02-06', 'Shipped', NULL, 166),
(10218, '2004-02-09', '2004-02-16', '2004-02-11', 'Shipped', 'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 473),
(10219, '2004-02-10', '2004-02-17', '2004-02-12', 'Shipped', NULL, 487),
(10220, '2004-02-12', '2004-02-19', '2004-02-16', 'Shipped', NULL, 189),
(10221, '2004-02-18', '2004-02-26', '2004-02-19', 'Shipped', NULL, 314),
(10222, '2004-02-19', '2004-02-27', '2004-02-20', 'Shipped', NULL, 239),
(10223, '2004-02-20', '2004-02-29', '2004-02-24', 'Shipped', NULL, 114),
(10224, '2004-02-21', '2004-03-02', '2004-02-26', 'Shipped', 'Customer has worked with some of our vendors in the past and is aware of their MSRP', 171),
(10225, '2004-02-22', '2004-03-01', '2004-02-24', 'Shipped', NULL, 298),
(10226, '2004-02-26', '2004-03-06', '2004-03-02', 'Shipped', NULL, 239),
(10227, '2004-03-02', '2004-03-12', '2004-03-08', 'Shipped', NULL, 146),
(10228, '2004-03-10', '2004-03-18', '2004-03-13', 'Shipped', NULL, 173),
(10229, '2004-03-11', '2004-03-20', '2004-03-12', 'Shipped', NULL, 124),
(10230, '2004-03-15', '2004-03-24', '2004-03-20', 'Shipped', 'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 128),
(10231, '2004-03-19', '2004-03-26', '2004-03-25', 'Shipped', NULL, 344),
(10232, '2004-03-20', '2004-03-30', '2004-03-25', 'Shipped', NULL, 240),
(10233, '2004-03-29', '2004-04-04', '2004-04-02', 'Shipped', 'Customer requested special shippment. The instructions were passed along to the warehouse', 328),
(10234, '2004-03-30', '2004-04-05', '2004-04-02', 'Shipped', NULL, 412),
(10235, '2004-04-02', '2004-04-12', '2004-04-06', 'Shipped', NULL, 260),
(10236, '2004-04-03', '2004-04-11', '2004-04-08', 'Shipped', NULL, 486),
(10237, '2004-04-05', '2004-04-12', '2004-04-10', 'Shipped', NULL, 181),
(10238, '2004-04-09', '2004-04-16', '2004-04-10', 'Shipped', NULL, 145),
(10239, '2004-04-12', '2004-04-21', '2004-04-17', 'Shipped', NULL, 311),
(10240, '2004-04-13', '2004-04-20', '2004-04-20', 'Shipped', NULL, 177),
(10241, '2004-04-13', '2004-04-20', '2004-04-19', 'Shipped', NULL, 209),
(10242, '2004-04-20', '2004-04-28', '2004-04-25', 'Shipped', 'Customer is interested in buying more Ferrari models', 456),
(10243, '2004-04-26', '2004-05-03', '2004-04-28', 'Shipped', NULL, 495),
(10244, '2004-04-29', '2004-05-09', '2004-05-04', 'Shipped', NULL, 141),
(10245, '2004-05-04', '2004-05-12', '2004-05-09', 'Shipped', NULL, 455),
(10246, '2004-05-05', '2004-05-13', '2004-05-06', 'Shipped', NULL, 141),
(10247, '2004-05-05', '2004-05-11', '2004-05-08', 'Shipped', NULL, 334),
(10248, '2004-05-07', '2004-05-14', NULL, 'Cancelled', 'Order was mistakenly placed. The warehouse noticed the lack of documentation.', 131),
(10249, '2004-05-08', '2004-05-17', '2004-05-11', 'Shipped', 'Can we deliver the new Ford Mustang models by end-of-quarter?', 173),
(10250, '2004-05-11', '2004-05-19', '2004-05-15', 'Shipped', NULL, 450),
(10251, '2004-05-18', '2004-05-24', '2004-05-24', 'Shipped', NULL, 328),
(10252, '2004-05-26', '2004-06-04', '2004-05-29', 'Shipped', NULL, 406),
(10253, '2004-06-01', '2004-06-09', '2004-06-02', 'Cancelled', 'Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.', 201),
(10254, '2004-06-03', '2004-06-13', '2004-06-04', 'Shipped', 'Customer requested that DHL is used for this shipping', 323),
(10255, '2004-06-04', '2004-06-12', '2004-06-09', 'Shipped', NULL, 209),
(10256, '2004-06-08', '2004-06-16', '2004-06-10', 'Shipped', NULL, 145),
(10257, '2004-06-14', '2004-06-24', '2004-06-15', 'Shipped', NULL, 450),
(10258, '2004-06-15', '2004-06-25', '2004-06-23', 'Shipped', NULL, 398),
(10259, '2004-06-15', '2004-06-22', '2004-06-17', 'Shipped', NULL, 166),
(10260, '2004-06-16', '2004-06-22', NULL, 'Cancelled', 'Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.', 357),
(10261, '2004-06-17', '2004-06-25', '2004-06-22', 'Shipped', NULL, 233),
(10262, '2004-06-24', '2004-07-01', NULL, 'Cancelled', 'This customer found a better offer from one of our competitors. Will call back to renegotiate.', 141),
(10263, '2004-06-28', '2004-07-04', '2004-07-02', 'Shipped', NULL, 175),
(10264, '2004-06-30', '2004-07-06', '2004-07-01', 'Shipped', 'Customer will send a truck to our local warehouse on 7/1/2004', 362),
(10265, '2004-07-02', '2004-07-09', '2004-07-07', 'Shipped', NULL, 471),
(10266, '2004-07-06', '2004-07-14', '2004-07-10', 'Shipped', NULL, 386),
(10267, '2004-07-07', '2004-07-17', '2004-07-09', 'Shipped', NULL, 151),
(10268, '2004-07-12', '2004-07-18', '2004-07-14', 'Shipped', NULL, 412),
(10269, '2004-07-16', '2004-07-22', '2004-07-18', 'Shipped', NULL, 382),
(10270, '2004-07-19', '2004-07-27', '2004-07-24', 'Shipped', 'Can we renegotiate this one?', 282),
(10271, '2004-07-20', '2004-07-29', '2004-07-23', 'Shipped', NULL, 124),
(10272, '2004-07-20', '2004-07-26', '2004-07-22', 'Shipped', NULL, 157),
(10273, '2004-07-21', '2004-07-28', '2004-07-22', 'Shipped', NULL, 314),
(10274, '2004-07-21', '2004-07-29', '2004-07-22', 'Shipped', NULL, 379),
(10275, '2004-07-23', '2004-08-02', '2004-07-29', 'Shipped', NULL, 119),
(10276, '2004-08-02', '2004-08-11', '2004-08-08', 'Shipped', NULL, 204),
(10277, '2004-08-04', '2004-08-12', '2004-08-05', 'Shipped', NULL, 148),
(10278, '2004-08-06', '2004-08-16', '2004-08-09', 'Shipped', NULL, 112),
(10279, '2004-08-09', '2004-08-19', '2004-08-15', 'Shipped', 'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 141),
(10280, '2004-08-17', '2004-08-27', '2004-08-19', 'Shipped', NULL, 249),
(10281, '2004-08-19', '2004-08-28', '2004-08-23', 'Shipped', NULL, 157),
(10282, '2004-08-20', '2004-08-26', '2004-08-22', 'Shipped', NULL, 124),
(10283, '2004-08-20', '2004-08-30', '2004-08-23', 'Shipped', NULL, 260),
(10284, '2004-08-21', '2004-08-29', '2004-08-26', 'Shipped', 'Custom shipping instructions sent to warehouse', 299),
(10285, '2004-08-27', '2004-09-04', '2004-08-31', 'Shipped', NULL, 286),
(10286, '2004-08-28', '2004-09-06', '2004-09-01', 'Shipped', NULL, 172),
(10287, '2004-08-30', '2004-09-06', '2004-09-01', 'Shipped', NULL, 298),
(10288, '2004-09-01', '2004-09-11', '2004-09-05', 'Shipped', NULL, 166),
(10289, '2004-09-03', '2004-09-13', '2004-09-04', 'Shipped', 'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 167),
(10290, '2004-09-07', '2004-09-15', '2004-09-13', 'Shipped', NULL, 198),
(10291, '2004-09-08', '2004-09-17', '2004-09-14', 'Shipped', NULL, 448),
(10292, '2004-09-08', '2004-09-18', '2004-09-11', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 131),
(10293, '2004-09-09', '2004-09-18', '2004-09-14', 'Shipped', NULL, 249),
(10294, '2004-09-10', '2004-09-17', '2004-09-14', 'Shipped', NULL, 204),
(10295, '2004-09-10', '2004-09-17', '2004-09-14', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 362),
(10296, '2004-09-15', '2004-09-22', '2004-09-16', 'Shipped', NULL, 415),
(10297, '2004-09-16', '2004-09-22', '2004-09-21', 'Shipped', 'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 189),
(10298, '2004-09-27', '2004-10-05', '2004-10-01', 'Shipped', NULL, 103),
(10299, '2004-09-30', '2004-10-10', '2004-10-01', 'Shipped', NULL, 186),
(10300, '2003-10-04', '2003-10-13', '2003-10-09', 'Shipped', NULL, 128),
(10301, '2003-10-05', '2003-10-15', '2003-10-08', 'Shipped', NULL, 299),
(10302, '2003-10-06', '2003-10-16', '2003-10-07', 'Shipped', NULL, 201),
(10303, '2004-10-06', '2004-10-14', '2004-10-09', 'Shipped', 'Customer inquired about remote controlled models and gold models.', 484),
(10304, '2004-10-11', '2004-10-20', '2004-10-17', 'Shipped', NULL, 256),
(10305, '2004-10-13', '2004-10-22', '2004-10-15', 'Shipped', 'Check on availability.', 286),
(10306, '2004-10-14', '2004-10-21', '2004-10-17', 'Shipped', NULL, 187),
(10307, '2004-10-14', '2004-10-23', '2004-10-20', 'Shipped', NULL, 339),
(10308, '2004-10-15', '2004-10-24', '2004-10-20', 'Shipped', 'Customer requested that FedEx Ground is used for this shipping', 319),
(10309, '2004-10-15', '2004-10-24', '2004-10-18', 'Shipped', NULL, 121),
(10310, '2004-10-16', '2004-10-24', '2004-10-18', 'Shipped', NULL, 259),
(10311, '2004-10-16', '2004-10-23', '2004-10-20', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', 141),
(10312, '2004-10-21', '2004-10-27', '2004-10-23', 'Shipped', NULL, 124),
(10313, '2004-10-22', '2004-10-28', '2004-10-25', 'Shipped', 'Customer requested that FedEx Ground is used for this shipping', 202),
(10314, '2004-10-22', '2004-11-01', '2004-10-23', 'Shipped', NULL, 227),
(10315, '2004-10-29', '2004-11-08', '2004-10-30', 'Shipped', NULL, 119),
(10316, '2004-11-01', '2004-11-09', '2004-11-07', 'Shipped', 'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 240),
(10317, '2004-11-02', '2004-11-12', '2004-11-08', 'Shipped', NULL, 161),
(10318, '2004-11-02', '2004-11-09', '2004-11-07', 'Shipped', NULL, 157),
(10319, '2004-11-03', '2004-11-11', '2004-11-06', 'Shipped', 'Customer requested that DHL is used for this shipping', 456),
(10320, '2004-11-03', '2004-11-13', '2004-11-07', 'Shipped', NULL, 144),
(10321, '2004-11-04', '2004-11-12', '2004-11-07', 'Shipped', NULL, 462),
(10322, '2004-11-04', '2004-11-12', '2004-11-10', 'Shipped', 'Customer has worked with some of our vendors in the past and is aware of their MSRP', 363),
(10323, '2004-11-05', '2004-11-12', '2004-11-09', 'Shipped', NULL, 128),
(10324, '2004-11-05', '2004-11-11', '2004-11-08', 'Shipped', NULL, 181),
(10325, '2004-11-05', '2004-11-13', '2004-11-08', 'Shipped', NULL, 121),
(10326, '2004-11-09', '2004-11-16', '2004-11-10', 'Shipped', NULL, 144),
(10327, '2004-11-10', '2004-11-19', '2004-11-13', 'Resolved', 'Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don\'t match what was discussed.', 145),
(10328, '2004-11-12', '2004-11-21', '2004-11-18', 'Shipped', 'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 278),
(10329, '2004-11-15', '2004-11-24', '2004-11-16', 'Shipped', NULL, 131),
(10330, '2004-11-16', '2004-11-25', '2004-11-21', 'Shipped', NULL, 385),
(10331, '2004-11-17', '2004-11-23', '2004-11-23', 'Shipped', 'Customer requested special shippment. The instructions were passed along to the warehouse', 486),
(10332, '2004-11-17', '2004-11-25', '2004-11-18', 'Shipped', NULL, 187),
(10333, '2004-11-18', '2004-11-27', '2004-11-20', 'Shipped', NULL, 129),
(10334, '2004-11-19', '2004-11-28', NULL, 'On Hold', 'The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.', 144),
(10335, '2004-11-19', '2004-11-29', '2004-11-23', 'Shipped', NULL, 124),
(10336, '2004-11-20', '2004-11-26', '2004-11-24', 'Shipped', 'Customer requested that DHL is used for this shipping', 172),
(10337, '2004-11-21', '2004-11-30', '2004-11-26', 'Shipped', NULL, 424),
(10338, '2004-11-22', '2004-12-02', '2004-11-27', 'Shipped', NULL, 381),
(10339, '2004-11-23', '2004-11-30', '2004-11-30', 'Shipped', NULL, 398),
(10340, '2004-11-24', '2004-12-01', '2004-11-25', 'Shipped', 'Customer is interested in buying more Ferrari models', 216),
(10341, '2004-11-24', '2004-12-01', '2004-11-29', 'Shipped', NULL, 382),
(10342, '2004-11-24', '2004-12-01', '2004-11-29', 'Shipped', NULL, 114),
(10343, '2004-11-24', '2004-12-01', '2004-11-26', 'Shipped', NULL, 353),
(10344, '2004-11-25', '2004-12-02', '2004-11-29', 'Shipped', NULL, 350),
(10345, '2004-11-25', '2004-12-01', '2004-11-26', 'Shipped', NULL, 103),
(10346, '2004-11-29', '2004-12-05', '2004-11-30', 'Shipped', NULL, 112),
(10347, '2004-11-29', '2004-12-07', '2004-11-30', 'Shipped', 'Can we deliver the new Ford Mustang models by end-of-quarter?', 114),
(10348, '2004-11-01', '2004-11-08', '2004-11-05', 'Shipped', NULL, 458),
(10349, '2004-12-01', '2004-12-07', '2004-12-03', 'Shipped', NULL, 151),
(10350, '2004-12-02', '2004-12-08', '2004-12-05', 'Shipped', NULL, 141),
(10351, '2004-12-03', '2004-12-11', '2004-12-07', 'Shipped', NULL, 324),
(10352, '2004-12-03', '2004-12-12', '2004-12-09', 'Shipped', NULL, 198),
(10353, '2004-12-04', '2004-12-11', '2004-12-05', 'Shipped', NULL, 447),
(10354, '2004-12-04', '2004-12-10', '2004-12-05', 'Shipped', NULL, 323),
(10355, '2004-12-07', '2004-12-14', '2004-12-13', 'Shipped', NULL, 141),
(10356, '2004-12-09', '2004-12-15', '2004-12-12', 'Shipped', NULL, 250),
(10357, '2004-12-10', '2004-12-16', '2004-12-14', 'Shipped', NULL, 124),
(10358, '2004-12-10', '2004-12-16', '2004-12-16', 'Shipped', 'Customer requested that DHL is used for this shipping', 141),
(10359, '2004-12-15', '2004-12-23', '2004-12-18', 'Shipped', NULL, 353),
(10360, '2004-12-16', '2004-12-22', '2004-12-18', 'Shipped', NULL, 496),
(10361, '2004-12-17', '2004-12-24', '2004-12-20', 'Shipped', NULL, 282),
(10362, '2005-01-05', '2005-01-16', '2005-01-10', 'Shipped', NULL, 161),
(10363, '2005-01-06', '2005-01-12', '2005-01-10', 'Shipped', NULL, 334),
(10364, '2005-01-06', '2005-01-17', '2005-01-09', 'Shipped', NULL, 350),
(10365, '2005-01-07', '2005-01-18', '2005-01-11', 'Shipped', NULL, 320),
(10366, '2005-01-10', '2005-01-19', '2005-01-12', 'Shipped', NULL, 381),
(10367, '2005-01-12', '2005-01-21', '2005-01-16', 'Resolved', 'This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx\'s investigation proved this wrong.', 205),
(10368, '2005-01-19', '2005-01-27', '2005-01-24', 'Shipped', 'Can we renegotiate this one?', 124),
(10369, '2005-01-20', '2005-01-28', '2005-01-24', 'Shipped', NULL, 379),
(10370, '2005-01-20', '2005-02-01', '2005-01-25', 'Shipped', NULL, 276),
(10371, '2005-01-23', '2005-02-03', '2005-01-25', 'Shipped', NULL, 124),
(10372, '2005-01-26', '2005-02-05', '2005-01-28', 'Shipped', NULL, 398),
(10373, '2005-01-31', '2005-02-08', '2005-02-06', 'Shipped', NULL, 311),
(10374, '2005-02-02', '2005-02-09', '2005-02-03', 'Shipped', NULL, 333),
(10375, '2005-02-03', '2005-02-10', '2005-02-06', 'Shipped', NULL, 119),
(10376, '2005-02-08', '2005-02-18', '2005-02-13', 'Shipped', NULL, 219),
(10377, '2005-02-09', '2005-02-21', '2005-02-12', 'Shipped', 'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 186),
(10378, '2005-02-10', '2005-02-18', '2005-02-11', 'Shipped', NULL, 141),
(10379, '2005-02-10', '2005-02-18', '2005-02-11', 'Shipped', NULL, 141),
(10380, '2005-02-16', '2005-02-24', '2005-02-18', 'Shipped', NULL, 141),
(10381, '2005-02-17', '2005-02-25', '2005-02-18', 'Shipped', NULL, 321),
(10382, '2005-02-17', '2005-02-23', '2005-02-18', 'Shipped', 'Custom shipping instructions sent to warehouse', 124),
(10383, '2005-02-22', '2005-03-02', '2005-02-25', 'Shipped', NULL, 141),
(10384, '2005-02-23', '2005-03-06', '2005-02-27', 'Shipped', NULL, 321),
(10385, '2005-02-28', '2005-03-09', '2005-03-01', 'Shipped', NULL, 124),
(10386, '2005-03-01', '2005-03-09', '2005-03-06', 'Resolved', 'Disputed then Resolved on 3/15/2005. Customer doesn\'t like the craftsmaship of the models.', 141),
(10387, '2005-03-02', '2005-03-09', '2005-03-06', 'Shipped', 'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 148),
(10388, '2005-03-03', '2005-03-11', '2005-03-09', 'Shipped', NULL, 462),
(10389, '2005-03-03', '2005-03-09', '2005-03-08', 'Shipped', NULL, 448),
(10390, '2005-03-04', '2005-03-11', '2005-03-07', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 124),
(10391, '2005-03-09', '2005-03-20', '2005-03-15', 'Shipped', NULL, 276),
(10392, '2005-03-10', '2005-03-18', '2005-03-12', 'Shipped', NULL, 452),
(10393, '2005-03-11', '2005-03-22', '2005-03-14', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 323),
(10394, '2005-03-15', '2005-03-25', '2005-03-19', 'Shipped', NULL, 141),
(10395, '2005-03-17', '2005-03-24', '2005-03-23', 'Shipped', 'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 250),
(10396, '2005-03-23', '2005-04-02', '2005-03-28', 'Shipped', NULL, 124),
(10397, '2005-03-28', '2005-04-09', '2005-04-01', 'Shipped', NULL, 242),
(10398, '2005-03-30', '2005-04-09', '2005-03-31', 'Shipped', NULL, 353),
(10399, '2005-04-01', '2005-04-12', '2005-04-03', 'Shipped', NULL, 496),
(10400, '2005-04-01', '2005-04-11', '2005-04-04', 'Shipped', 'Customer requested that DHL is used for this shipping', 450),
(10401, '2005-04-03', '2005-04-14', NULL, 'On Hold', 'Customer credit limit exceeded. Will ship when a payment is received.', 328),
(10402, '2005-04-07', '2005-04-14', '2005-04-12', 'Shipped', NULL, 406),
(10403, '2005-04-08', '2005-04-18', '2005-04-11', 'Shipped', NULL, 201),
(10404, '2005-04-08', '2005-04-14', '2005-04-11', 'Shipped', NULL, 323),
(10405, '2005-04-14', '2005-04-24', '2005-04-20', 'Shipped', NULL, 209),
(10406, '2005-04-15', '2005-04-25', '2005-04-21', 'Disputed', 'Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.', 145),
(10407, '2005-04-22', '2005-05-04', NULL, 'On Hold', 'Customer credit limit exceeded. Will ship when a payment is received.', 450),
(10408, '2005-04-22', '2005-04-29', '2005-04-27', 'Shipped', NULL, 398),
(10409, '2005-04-23', '2005-05-05', '2005-04-24', 'Shipped', NULL, 166),
(10410, '2005-04-29', '2005-05-10', '2005-04-30', 'Shipped', NULL, 357),
(10411, '2005-05-01', '2005-05-08', '2005-05-06', 'Shipped', NULL, 233),
(10412, '2005-05-03', '2005-05-13', '2005-05-05', 'Shipped', NULL, 141),
(10413, '2005-05-05', '2005-05-14', '2005-05-09', 'Shipped', 'Customer requested that DHL is used for this shipping', 175),
(10414, '2005-05-06', '2005-05-13', NULL, 'On Hold', 'Customer credit limit exceeded. Will ship when a payment is received.', 362),
(10415, '2005-05-09', '2005-05-20', '2005-05-12', 'Disputed', 'Customer claims the scales of the models don\'t match what was discussed. I keep all the paperwork though to prove otherwise', 471),
(10416, '2005-05-10', '2005-05-16', '2005-05-14', 'Shipped', NULL, 386),
(10417, '2005-05-13', '2005-05-19', '2005-05-19', 'Disputed', 'Customer doesn\'t like the colors and precision of the models.', 141),
(10418, '2005-05-16', '2005-05-24', '2005-05-20', 'Shipped', NULL, 412),
(10419, '2005-05-17', '2005-05-28', '2005-05-19', 'Shipped', NULL, 382),
(10420, '2005-05-29', '2005-06-07', NULL, 'In Process', NULL, 282),
(10421, '2005-05-29', '2005-06-06', NULL, 'In Process', 'Custom shipping instructions were sent to warehouse', 124),
(10422, '2005-05-30', '2005-06-11', NULL, 'In Process', NULL, 157),
(10423, '2005-05-30', '2005-06-05', NULL, 'In Process', NULL, 314),
(10424, '2005-05-31', '2005-06-08', NULL, 'In Process', NULL, 141),
(10425, '2005-05-31', '2005-06-07', NULL, 'In Process', NULL, 119);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `customerNumber` int(11) NOT NULL,
  `checkNumber` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`customerNumber`, `checkNumber`, `paymentDate`, `amount`) VALUES
(103, 'HQ336336', '2004-10-19', 6066.78),
(103, 'JM555205', '2003-06-05', 14571.44),
(103, 'OM314933', '2004-12-18', 1676.14),
(112, 'BO864823', '2004-12-17', 14191.12),
(112, 'HQ55022', '2003-06-06', 32641.98),
(112, 'ND748579', '2004-08-20', 33347.88),
(114, 'GG31455', '2003-05-20', 45864.03),
(114, 'MA765515', '2004-12-15', 82261.22),
(114, 'NP603840', '2003-05-31', 7565.08),
(114, 'NR27552', '2004-03-10', 44894.74),
(119, 'DB933704', '2004-11-14', 19501.82),
(119, 'LN373447', '2004-08-08', 47924.19),
(119, 'NG94694', '2005-02-22', 49523.67),
(121, 'DB889831', '2003-02-16', 50218.95),
(121, 'FD317790', '2003-10-28', 1491.38),
(121, 'KI831359', '2004-11-04', 17876.32),
(121, 'MA302151', '2004-11-28', 34638.14),
(124, 'AE215433', '2005-03-05', 101244.59),
(124, 'BG255406', '2004-08-28', 85410.87),
(124, 'CQ287967', '2003-04-11', 11044.30),
(124, 'ET64396', '2005-04-16', 83598.04),
(124, 'HI366474', '2004-12-27', 47142.70),
(124, 'HR86578', '2004-11-02', 55639.66),
(124, 'KI131716', '2003-08-15', 111654.40),
(124, 'LF217299', '2004-03-26', 43369.30),
(124, 'NT141748', '2003-11-25', 45084.38),
(128, 'DI925118', '2003-01-28', 10549.01),
(128, 'FA465482', '2003-10-18', 24101.81),
(128, 'FH668230', '2004-03-24', 33820.62),
(128, 'IP383901', '2004-11-18', 7466.32),
(129, 'DM826140', '2004-12-08', 26248.78),
(129, 'ID449593', '2003-12-11', 23923.93),
(129, 'PI42991', '2003-04-09', 16537.85),
(131, 'CL442705', '2003-03-12', 22292.62),
(131, 'MA724562', '2004-12-02', 50025.35),
(131, 'NB445135', '2004-09-11', 35321.97),
(141, 'AU364101', '2003-07-19', 36251.03),
(141, 'DB583216', '2004-11-01', 36140.38),
(141, 'DL460618', '2005-05-19', 46895.48),
(141, 'HJ32686', '2004-01-30', 59830.55),
(141, 'ID10962', '2004-12-31', 116208.40),
(141, 'IN446258', '2005-03-25', 65071.26),
(141, 'JE105477', '2005-03-18', 120166.58),
(141, 'JN355280', '2003-10-26', 49539.37),
(141, 'JN722010', '2003-02-25', 40206.20),
(141, 'KT52578', '2003-12-09', 63843.55),
(141, 'MC46946', '2004-07-09', 35420.74),
(141, 'MF629602', '2004-08-16', 20009.53),
(141, 'NU627706', '2004-05-17', 26155.91),
(144, 'IR846303', '2004-12-12', 36005.71),
(144, 'LA685678', '2003-04-09', 7674.94),
(145, 'CN328545', '2004-07-03', 4710.73),
(145, 'ED39322', '2004-04-26', 28211.70),
(145, 'HR182688', '2004-12-01', 20564.86),
(145, 'JJ246391', '2003-02-20', 53959.21),
(146, 'FP549817', '2004-03-18', 40978.53),
(146, 'FU793410', '2004-01-16', 49614.72),
(146, 'LJ160635', '2003-12-10', 39712.10),
(148, 'BI507030', '2003-04-22', 44380.15),
(148, 'DD635282', '2004-08-11', 2611.84),
(148, 'KM172879', '2003-12-26', 105743.00),
(148, 'ME497970', '2005-03-27', 3516.04),
(151, 'BF686658', '2003-12-22', 58793.53),
(151, 'GB852215', '2004-07-26', 20314.44),
(151, 'IP568906', '2003-06-18', 58841.35),
(151, 'KI884577', '2004-12-14', 39964.63),
(157, 'HI618861', '2004-11-19', 35152.12),
(157, 'NN711988', '2004-09-07', 63357.13),
(161, 'BR352384', '2004-11-14', 2434.25),
(161, 'BR478494', '2003-11-18', 50743.65),
(161, 'KG644125', '2005-02-02', 12692.19),
(161, 'NI908214', '2003-08-05', 38675.13),
(166, 'BQ327613', '2004-09-16', 38785.48),
(166, 'DC979307', '2004-07-07', 44160.92),
(166, 'LA318629', '2004-02-28', 22474.17),
(167, 'ED743615', '2004-09-19', 12538.01),
(167, 'GN228846', '2003-12-03', 85024.46),
(171, 'GB878038', '2004-03-15', 18997.89),
(171, 'IL104425', '2003-11-22', 42783.81),
(172, 'AD832091', '2004-09-09', 1960.80),
(172, 'CE51751', '2004-12-04', 51209.58),
(172, 'EH208589', '2003-04-20', 33383.14),
(173, 'GP545698', '2004-05-13', 11843.45),
(173, 'IG462397', '2004-03-29', 20355.24),
(175, 'CITI3434344', '2005-05-19', 28500.78),
(175, 'IO448913', '2003-11-19', 24879.08),
(175, 'PI15215', '2004-07-10', 42044.77),
(177, 'AU750837', '2004-04-17', 15183.63),
(177, 'CI381435', '2004-01-19', 47177.59),
(181, 'CM564612', '2004-04-25', 22602.36),
(181, 'GQ132144', '2003-01-30', 5494.78),
(181, 'OH367219', '2004-11-16', 44400.50),
(186, 'AE192287', '2005-03-10', 23602.90),
(186, 'AK412714', '2003-10-27', 37602.48),
(186, 'KA602407', '2004-10-21', 34341.08),
(187, 'AM968797', '2004-11-03', 52825.29),
(187, 'BQ39062', '2004-12-08', 47159.11),
(187, 'KL124726', '2003-03-27', 48425.69),
(189, 'BO711618', '2004-10-03', 17359.53),
(189, 'NM916675', '2004-03-01', 32538.74),
(198, 'FI192930', '2004-12-06', 9658.74),
(198, 'HQ920205', '2003-07-06', 6036.96),
(198, 'IS946883', '2004-09-21', 5858.56),
(201, 'DP677013', '2003-10-20', 23908.24),
(201, 'OO846801', '2004-06-15', 37258.94),
(202, 'HI358554', '2003-12-18', 36527.61),
(202, 'IQ627690', '2004-11-08', 33594.58),
(204, 'GC697638', '2004-08-13', 51152.86),
(204, 'IS150005', '2004-09-24', 4424.40),
(205, 'GL756480', '2003-12-04', 3879.96),
(205, 'LL562733', '2003-09-05', 50342.74),
(205, 'NM739638', '2005-02-06', 39580.60),
(209, 'BOAF82044', '2005-05-03', 35157.75),
(209, 'ED520529', '2004-06-21', 4632.31),
(209, 'PH785937', '2004-05-04', 36069.26),
(211, 'BJ535230', '2003-12-09', 45480.79),
(216, 'BG407567', '2003-05-09', 3101.40),
(216, 'ML780814', '2004-12-06', 24945.21),
(216, 'MM342086', '2003-12-14', 40473.86),
(219, 'BN17870', '2005-03-02', 3452.75),
(219, 'BR941480', '2003-10-18', 4465.85),
(227, 'MQ413968', '2003-10-31', 36164.46),
(227, 'NU21326', '2004-11-02', 53745.34),
(233, 'BOFA23232', '2005-05-20', 29070.38),
(233, 'II180006', '2004-07-01', 22997.45),
(233, 'JG981190', '2003-11-18', 16909.84),
(239, 'NQ865547', '2004-03-15', 80375.24),
(240, 'IF245157', '2004-11-16', 46788.14),
(240, 'JO719695', '2004-03-28', 24995.61),
(242, 'AF40894', '2003-11-22', 33818.34),
(242, 'HR224331', '2005-06-03', 12432.32),
(242, 'KI744716', '2003-07-21', 14232.70),
(249, 'IJ399820', '2004-09-19', 33924.24),
(249, 'NE404084', '2004-09-04', 48298.99),
(250, 'EQ12267', '2005-05-17', 17928.09),
(250, 'HD284647', '2004-12-30', 26311.63),
(250, 'HN114306', '2003-07-18', 23419.47),
(256, 'EP227123', '2004-02-10', 5759.42),
(256, 'HE84936', '2004-10-22', 53116.99),
(259, 'EU280955', '2004-11-06', 61234.67),
(259, 'GB361972', '2003-12-07', 27988.47),
(260, 'IO164641', '2004-08-30', 37527.58),
(260, 'NH776924', '2004-04-24', 29284.42),
(276, 'EM979878', '2005-02-09', 27083.78),
(276, 'KM841847', '2003-11-13', 38547.19),
(276, 'LE432182', '2003-09-28', 41554.73),
(276, 'OJ819725', '2005-04-30', 29848.52),
(278, 'BJ483870', '2004-12-05', 37654.09),
(278, 'GP636783', '2003-03-02', 52151.81),
(278, 'NI983021', '2003-11-24', 37723.79),
(282, 'IA793562', '2003-08-03', 24013.52),
(282, 'JT819493', '2004-08-02', 35806.73),
(282, 'OD327378', '2005-01-03', 31835.36),
(286, 'DR578578', '2004-10-28', 47411.33),
(286, 'KH910279', '2004-09-05', 43134.04),
(298, 'AJ574927', '2004-03-13', 47375.92),
(298, 'LF501133', '2004-09-18', 61402.00),
(299, 'AD304085', '2003-10-24', 36798.88),
(299, 'NR157385', '2004-09-05', 32260.16),
(311, 'DG336041', '2005-02-15', 46770.52),
(311, 'FA728475', '2003-10-06', 32723.04),
(311, 'NQ966143', '2004-04-25', 16212.59),
(314, 'LQ244073', '2004-08-09', 45352.47),
(314, 'MD809704', '2004-03-03', 16901.38),
(319, 'HL685576', '2004-11-06', 42339.76),
(319, 'OM548174', '2003-12-07', 36092.40),
(320, 'GJ597719', '2005-01-18', 8307.28),
(320, 'HO576374', '2003-08-20', 41016.75),
(320, 'MU817160', '2003-11-24', 52548.49),
(321, 'DJ15149', '2003-11-03', 85559.12),
(321, 'LA556321', '2005-03-15', 46781.66),
(323, 'AL493079', '2005-05-23', 75020.13),
(323, 'ES347491', '2004-06-24', 37281.36),
(323, 'HG738664', '2003-07-05', 2880.00),
(323, 'PQ803830', '2004-12-24', 39440.59),
(324, 'DQ409197', '2004-12-13', 13671.82),
(324, 'FP443161', '2003-07-07', 29429.14),
(324, 'HB150714', '2003-11-23', 37455.77),
(328, 'EN930356', '2004-04-16', 7178.66),
(328, 'NR631421', '2004-05-30', 31102.85),
(333, 'HL209210', '2003-11-15', 23936.53),
(333, 'JK479662', '2003-10-17', 9821.32),
(333, 'NF959653', '2005-03-01', 21432.31),
(334, 'CS435306', '2005-01-27', 45785.34),
(334, 'HH517378', '2003-08-16', 29716.86),
(334, 'LF737277', '2004-05-22', 28394.54),
(339, 'AP286625', '2004-10-24', 23333.06),
(339, 'DA98827', '2003-11-28', 34606.28),
(344, 'AF246722', '2003-11-24', 31428.21),
(344, 'NJ906924', '2004-04-02', 15322.93),
(347, 'DG700707', '2004-01-18', 21053.69),
(347, 'LG808674', '2003-10-24', 20452.50),
(350, 'BQ602907', '2004-12-11', 18888.31),
(350, 'CI471510', '2003-05-25', 50824.66),
(350, 'OB648482', '2005-01-29', 1834.56),
(353, 'CO351193', '2005-01-10', 49705.52),
(353, 'ED878227', '2003-07-21', 13920.26),
(353, 'GT878649', '2003-05-21', 16700.47),
(353, 'HJ618252', '2005-06-09', 46656.94),
(357, 'AG240323', '2003-12-16', 20220.04),
(357, 'NB291497', '2004-05-15', 36442.34),
(362, 'FP170292', '2004-07-11', 18473.71),
(362, 'OG208861', '2004-09-21', 15059.76),
(363, 'HL575273', '2004-11-17', 50799.69),
(363, 'IS232033', '2003-01-16', 10223.83),
(363, 'PN238558', '2003-12-05', 55425.77),
(379, 'CA762595', '2005-02-12', 28322.83),
(379, 'FR499138', '2003-09-16', 32680.31),
(379, 'GB890854', '2004-08-02', 12530.51),
(381, 'BC726082', '2004-12-03', 12081.52),
(381, 'CC475233', '2003-04-19', 1627.56),
(381, 'GB117430', '2005-02-03', 14379.90),
(381, 'MS154481', '2003-08-22', 1128.20),
(382, 'CC871084', '2003-05-12', 35826.33),
(382, 'CT821147', '2004-08-01', 6419.84),
(382, 'PH29054', '2004-11-27', 42813.83),
(385, 'BN347084', '2003-12-02', 20644.24),
(385, 'CP804873', '2004-11-19', 15822.84),
(385, 'EK785462', '2003-03-09', 51001.22),
(386, 'DO106109', '2003-11-18', 38524.29),
(386, 'HG438769', '2004-07-18', 51619.02),
(398, 'AJ478695', '2005-02-14', 33967.73),
(398, 'DO787644', '2004-06-21', 22037.91),
(398, 'JPMR4544', '2005-05-18', 615.45),
(398, 'KB54275', '2004-11-29', 48927.64),
(406, 'BJMPR4545', '2005-04-23', 12190.85),
(406, 'HJ217687', '2004-01-28', 49165.16),
(406, 'NA197101', '2004-06-17', 25080.96),
(412, 'GH197075', '2004-07-25', 35034.57),
(412, 'PJ434867', '2004-04-14', 31670.37),
(415, 'ER54537', '2004-09-28', 31310.09),
(424, 'KF480160', '2004-12-07', 25505.98),
(424, 'LM271923', '2003-04-16', 21665.98),
(424, 'OA595449', '2003-10-31', 22042.37),
(447, 'AO757239', '2003-09-15', 6631.36),
(447, 'ER615123', '2003-06-25', 17032.29),
(447, 'OU516561', '2004-12-17', 26304.13),
(448, 'FS299615', '2005-04-18', 27966.54),
(448, 'KR822727', '2004-09-30', 48809.90),
(450, 'EF485824', '2004-06-21', 59551.38),
(452, 'ED473873', '2003-11-15', 27121.90),
(452, 'FN640986', '2003-11-20', 15130.97),
(452, 'HG635467', '2005-05-03', 8807.12),
(455, 'HA777606', '2003-12-05', 38139.18),
(455, 'IR662429', '2004-05-12', 32239.47),
(456, 'GJ715659', '2004-11-13', 27550.51),
(456, 'MO743231', '2004-04-30', 1679.92),
(458, 'DD995006', '2004-11-15', 33145.56),
(458, 'NA377824', '2004-02-06', 22162.61),
(458, 'OO606861', '2003-06-13', 57131.92),
(462, 'ED203908', '2005-04-15', 30293.77),
(462, 'GC60330', '2003-11-08', 9977.85),
(462, 'PE176846', '2004-11-27', 48355.87),
(471, 'AB661578', '2004-07-28', 9415.13),
(471, 'CO645196', '2003-12-10', 35505.63),
(473, 'LL427009', '2004-02-17', 7612.06),
(473, 'PC688499', '2003-10-27', 17746.26),
(475, 'JP113227', '2003-12-09', 7678.25),
(475, 'PB951268', '2004-02-13', 36070.47),
(484, 'GK294076', '2004-10-26', 3474.66),
(484, 'JH546765', '2003-11-29', 47513.19),
(486, 'BL66528', '2004-04-14', 5899.38),
(486, 'HS86661', '2004-11-23', 45994.07),
(486, 'JB117768', '2003-03-20', 25833.14),
(487, 'AH612904', '2003-09-28', 29997.09),
(487, 'PT550181', '2004-02-29', 12573.28),
(489, 'OC773849', '2003-12-04', 22275.73),
(489, 'PO860906', '2004-01-31', 7310.42),
(495, 'BH167026', '2003-12-26', 59265.14),
(495, 'FN155234', '2004-05-14', 6276.60),
(496, 'EU531600', '2005-05-25', 30253.75),
(496, 'MB342426', '2003-07-16', 32077.44),
(496, 'MN89921', '2004-12-31', 52166.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productlines`
--

CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext DEFAULT NULL,
  `image` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productlines`
--

INSERT INTO `productlines` (`productLine`, `textDescription`, `htmlDescription`, `image`) VALUES
('Classic Cars', 'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', NULL, NULL),
('Motorcycles', 'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.', NULL, NULL),
('Planes', 'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.', NULL, NULL),
('Ships', 'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.', NULL, NULL),
('Trains', 'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you\'re looking for collectible wooden trains, electric streetcars or locomotives, you\'ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.', NULL, NULL),
('Trucks and Buses', 'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.', NULL, NULL),
('Vintage Cars', 'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`productCode`, `productName`, `productLine`, `productScale`, `productVendor`, `productDescription`, `quantityInStock`, `buyPrice`, `MSRP`) VALUES
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 7933, 48.81, 95.70),
('S10_1949', '1952 Alpine Renault 1300', 'Classic Cars', '1:10', 'Classic Metal Creations', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 7305, 98.58, 214.30),
('S10_2016', '1996 Moto Guzzi 1100i', 'Motorcycles', '1:10', 'Highway 66 Mini Classics', 'Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 6625, 68.99, 118.94),
('S10_4698', '2003 Harley-Davidson Eagle Drag Bike', 'Motorcycles', '1:10', 'Red Start Diecast', 'Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', 5582, 91.02, 193.66),
('S10_4757', '1972 Alfa Romeo GTA', 'Classic Cars', '1:10', 'Motor City Art Classics', 'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3252, 85.68, 136.00),
('S10_4962', '1962 LanciaA Delta 16V', 'Classic Cars', '1:10', 'Second Gear Diecast', 'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6791, 103.42, 147.74),
('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12', 'Autoart Studio Design', 'Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, 95.34, 194.57),
('S12_1108', '2001 Ferrari Enzo', 'Classic Cars', '1:12', 'Second Gear Diecast', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3619, 95.59, 207.80),
('S12_1666', '1958 Setra Bus', 'Trucks and Buses', '1:12', 'Welly Diecast Productions', 'Model features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579, 77.90, 136.67),
('S12_2823', '2002 Suzuki XREO', 'Motorcycles', '1:12', 'Unimax Art Galleries', 'Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 9997, 66.27, 150.62),
('S12_3148', '1969 Corvair Monza', 'Classic Cars', '1:18', 'Welly Diecast Productions', '1:18 scale die-cast about 10\" long doors open, hood opens, trunk opens and wheels roll', 6906, 89.14, 151.08),
('S12_3380', '1968 Dodge Charger', 'Classic Cars', '1:12', 'Welly Diecast Productions', '1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, 75.16, 117.44),
('S12_3891', '1969 Ford Falcon', 'Classic Cars', '1:12', 'Second Gear Diecast', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 1049, 83.05, 173.02),
('S12_3990', '1970 Plymouth Hemi Cuda', 'Classic Cars', '1:12', 'Studio M Art Models', 'Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', 5663, 31.92, 79.80),
('S12_4473', '1957 Chevy Pickup', 'Trucks and Buses', '1:12', 'Exoto Designs', '1:12 scale die-cast about 20\" long Hood opens, Rubber wheels', 6125, 55.70, 118.50),
('S12_4675', '1969 Dodge Charger', 'Classic Cars', '1:12', 'Welly Diecast Productions', 'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', 7323, 58.73, 115.16),
('S18_1097', '1940 Ford Pickup Truck', 'Trucks and Buses', '1:18', 'Studio M Art Models', 'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 2613, 58.33, 116.67),
('S18_1129', '1993 Mazda RX-7', 'Classic Cars', '1:18', 'Highway 66 Mini Classics', 'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, 83.51, 141.54),
('S18_1342', '1937 Lincoln Berline', 'Vintage Cars', '1:18', 'Motor City Art Classics', 'Features opening engine cover, doors, trunk, and fuel filler cap. Color black', 8693, 60.62, 102.74),
('S18_1367', '1936 Mercedes-Benz 500K Special Roadster', 'Vintage Cars', '1:18', 'Studio M Art Models', 'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', 8635, 24.26, 53.91),
('S18_1589', '1965 Aston Martin DB5', 'Classic Cars', '1:18', 'Classic Metal Creations', 'Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, 65.96, 124.44),
('S18_1662', '1980s Black Hawk Helicopter', 'Planes', '1:18', 'Red Start Diecast', '1:18 scale replica of actual Army\'s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', 5330, 77.27, 157.69),
('S18_1749', '1917 Grand Touring Sedan', 'Vintage Cars', '1:18', 'Welly Diecast Productions', 'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', 2724, 86.70, 170.00),
('S18_1889', '1948 Porsche 356-A Roadster', 'Classic Cars', '1:18', 'Gearbox Collectibles', 'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8826, 53.90, 77.00),
('S18_1984', '1995 Honda Civic', 'Classic Cars', '1:18', 'Min Lin Diecast', 'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', 9772, 93.89, 142.25),
('S18_2238', '1998 Chrysler Plymouth Prowler', 'Classic Cars', '1:18', 'Gearbox Collectibles', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 4724, 101.51, 163.73),
('S18_2248', '1911 Ford Town Car', 'Vintage Cars', '1:18', 'Motor City Art Classics', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.', 540, 33.30, 60.54),
('S18_2319', '1964 Mercedes Tour Bus', 'Trucks and Buses', '1:18', 'Unimax Art Galleries', 'Exact replica. 100+ parts. working steering system, original logos', 8258, 74.86, 122.73),
('S18_2325', '1932 Model A Ford J-Coupe', 'Vintage Cars', '1:18', 'Autoart Studio Design', 'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', 9354, 58.48, 127.13),
('S18_2432', '1926 Ford Fire Engine', 'Trucks and Buses', '1:18', 'Carousel DieCast Legends', 'Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', 2018, 24.92, 60.77),
('S18_2581', 'P-51-D Mustang', 'Planes', '1:72', 'Gearbox Collectibles', 'Has retractable wheels and comes with a stand', 992, 49.00, 84.48),
('S18_2625', '1936 Harley Davidson El Knucklehead', 'Motorcycles', '1:18', 'Welly Diecast Productions', 'Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', 4357, 24.23, 60.57),
('S18_2795', '1928 Mercedes-Benz SSK', 'Vintage Cars', '1:18', 'Gearbox Collectibles', 'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', 548, 72.56, 168.75),
('S18_2870', '1999 Indy 500 Monte Carlo SS', 'Classic Cars', '1:18', 'Red Start Diecast', 'Features include opening and closing doors. Color: Red', 8164, 56.76, 132.00),
('S18_2949', '1913 Ford Model T Speedster', 'Vintage Cars', '1:18', 'Carousel DieCast Legends', 'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', 4189, 60.78, 101.31),
('S18_2957', '1934 Ford V8 Coupe', 'Vintage Cars', '1:18', 'Min Lin Diecast', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 5649, 34.35, 62.46),
('S18_3029', '1999 Yamaha Speed Boat', 'Ships', '1:18', 'Min Lin Diecast', 'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 4259, 51.61, 86.02),
('S18_3136', '18th Century Vintage Horse Carriage', 'Vintage Cars', '1:18', 'Red Start Diecast', 'Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.\r\n\r\nThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', 5992, 60.74, 104.72),
('S18_3140', '1903 Ford Model A', 'Vintage Cars', '1:18', 'Unimax Art Galleries', 'Features opening trunk,  working steering system', 3913, 68.30, 136.59),
('S18_3232', '1992 Ferrari 360 Spider red', 'Classic Cars', '1:18', 'Unimax Art Galleries', 'his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8347, 77.90, 169.34),
('S18_3233', '1985 Toyota Supra', 'Classic Cars', '1:18', 'Highway 66 Mini Classics', 'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 7733, 57.01, 107.57),
('S18_3259', 'Collectable Wooden Train', 'Trains', '1:18', 'Carousel DieCast Legends', 'Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', 6450, 67.56, 100.84),
('S18_3278', '1969 Dodge Super Bee', 'Classic Cars', '1:18', 'Min Lin Diecast', 'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 1917, 49.05, 80.41),
('S18_3320', '1917 Maxwell Touring Car', 'Vintage Cars', '1:18', 'Exoto Designs', 'Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 7913, 57.54, 99.21),
('S18_3482', '1976 Ford Gran Torino', 'Classic Cars', '1:18', 'Gearbox Collectibles', 'Highly detailed 1976 Ford Gran Torino \"Starsky and Hutch\" diecast model. Very well constructed and painted in red and white patterns.', 9127, 73.49, 146.99),
('S18_3685', '1948 Porsche Type 356 Roadster', 'Classic Cars', '1:18', 'Gearbox Collectibles', 'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.', 8990, 62.16, 141.28),
('S18_3782', '1957 Vespa GS150', 'Motorcycles', '1:18', 'Studio M Art Models', 'Features rotating wheels , working kick stand. Comes with stand.', 7689, 32.95, 62.17),
('S18_3856', '1941 Chevrolet Special Deluxe Cabriolet', 'Vintage Cars', '1:18', 'Exoto Designs', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', 2378, 64.58, 105.87),
('S18_4027', '1970 Triumph Spitfire', 'Classic Cars', '1:18', 'Min Lin Diecast', 'Features include opening and closing doors. Color: White.', 5545, 91.92, 143.62),
('S18_4409', '1932 Alfa Romeo 8C2300 Spider Sport', 'Vintage Cars', '1:18', 'Exoto Designs', 'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', 6553, 43.26, 92.03),
('S18_4522', '1904 Buick Runabout', 'Vintage Cars', '1:18', 'Exoto Designs', 'Features opening trunk,  working steering system', 8290, 52.66, 87.77),
('S18_4600', '1940s Ford truck', 'Trucks and Buses', '1:18', 'Motor City Art Classics', 'This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940\'s Pick-Up truck is painted in classic dark green color, and features rotating wheels.', 3128, 84.76, 121.08),
('S18_4668', '1939 Cadillac Limousine', 'Vintage Cars', '1:18', 'Studio M Art Models', 'Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles', 6645, 23.14, 50.31),
('S18_4721', '1957 Corvette Convertible', 'Classic Cars', '1:18', 'Classic Metal Creations', '1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.', 1249, 69.93, 148.80),
('S18_4933', '1957 Ford Thunderbird', 'Classic Cars', '1:18', 'Studio M Art Models', 'This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.', 3209, 34.21, 71.27),
('S24_1046', '1970 Chevy Chevelle SS 454', 'Classic Cars', '1:24', 'Unimax Art Galleries', 'This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.', 1005, 49.24, 73.49),
('S24_1444', '1970 Dodge Coronet', 'Classic Cars', '1:24', 'Highway 66 Mini Classics', '1:24 scale die-cast about 18\" long doors open, hood opens and rubber wheels', 4074, 32.37, 57.80),
('S24_1578', '1997 BMW R 1100 S', 'Motorcycles', '1:24', 'Autoart Studio Design', 'Detailed scale replica with working suspension and constructed from over 70 parts', 7003, 60.86, 112.70),
('S24_1628', '1966 Shelby Cobra 427 S/C', 'Classic Cars', '1:24', 'Carousel DieCast Legends', 'This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it\'s own display case.', 8197, 29.18, 50.31),
('S24_1785', '1928 British Royal Navy Airplane', 'Planes', '1:24', 'Classic Metal Creations', 'Official logos and insignias', 3627, 66.74, 109.42),
('S24_1937', '1939 Chevrolet Deluxe Coupe', 'Vintage Cars', '1:24', 'Motor City Art Classics', 'This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.', 7332, 22.57, 33.19),
('S24_2000', '1960 BSA Gold Star DBD34', 'Motorcycles', '1:24', 'Highway 66 Mini Classics', 'Detailed scale replica with working suspension and constructed from over 70 parts', 15, 37.32, 76.17),
('S24_2011', '18th century schooner', 'Ships', '1:24', 'Carousel DieCast Legends', 'All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.', 1898, 82.34, 122.89),
('S24_2022', '1938 Cadillac V-16 Presidential Limousine', 'Vintage Cars', '1:24', 'Classic Metal Creations', 'This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.', 2847, 20.61, 44.80),
('S24_2300', '1962 Volkswagen Microbus', 'Trucks and Buses', '1:24', 'Autoart Studio Design', 'This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.', 2327, 61.34, 127.79),
('S24_2360', '1982 Ducati 900 Monster', 'Motorcycles', '1:24', 'Highway 66 Mini Classics', 'Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 6840, 47.10, 69.26),
('S24_2766', '1949 Jaguar XK 120', 'Classic Cars', '1:24', 'Classic Metal Creations', 'Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 2350, 47.25, 90.87),
('S24_2840', '1958 Chevy Corvette Limited Edition', 'Classic Cars', '1:24', 'Carousel DieCast Legends', 'The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.', 2542, 15.91, 35.36),
('S24_2841', '1900s Vintage Bi-Plane', 'Planes', '1:24', 'Autoart Studio Design', 'Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.', 5942, 34.25, 68.51),
('S24_2887', '1952 Citroen-15CV', 'Classic Cars', '1:24', 'Exoto Designs', 'Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.', 1452, 72.82, 117.44),
('S24_2972', '1982 Lamborghini Diablo', 'Classic Cars', '1:24', 'Second Gear Diecast', 'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7723, 16.24, 37.76),
('S24_3151', '1912 Ford Model T Delivery Wagon', 'Vintage Cars', '1:24', 'Min Lin Diecast', 'This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.', 9173, 46.91, 88.51),
('S24_3191', '1969 Chevrolet Camaro Z28', 'Classic Cars', '1:24', 'Exoto Designs', '1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.', 4695, 50.51, 85.61),
('S24_3371', '1971 Alpine Renault 1600s', 'Classic Cars', '1:24', 'Welly Diecast Productions', 'This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7995, 38.58, 61.23),
('S24_3420', '1937 Horch 930V Limousine', 'Vintage Cars', '1:24', 'Autoart Studio Design', 'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', 2902, 26.30, 65.75),
('S24_3432', '2002 Chevy Corvette', 'Classic Cars', '1:24', 'Gearbox Collectibles', 'The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.', 9446, 62.11, 107.08),
('S24_3816', '1940 Ford Delivery Sedan', 'Vintage Cars', '1:24', 'Carousel DieCast Legends', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.', 6621, 48.64, 83.86),
('S24_3856', '1956 Porsche 356A Coupe', 'Classic Cars', '1:18', 'Classic Metal Creations', 'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6600, 98.30, 140.43),
('S24_3949', 'Corsair F4U ( Bird Cage)', 'Planes', '1:24', 'Second Gear Diecast', 'Has retractable wheels and comes with a stand. Official logos and insignias.', 6812, 29.34, 68.24),
('S24_3969', '1936 Mercedes Benz 500k Roadster', 'Vintage Cars', '1:24', 'Red Start Diecast', 'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.', 2081, 21.75, 41.03),
('S24_4048', '1992 Porsche Cayenne Turbo Silver', 'Classic Cars', '1:24', 'Exoto Designs', 'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 6582, 69.78, 118.28),
('S24_4258', '1936 Chrysler Airflow', 'Vintage Cars', '1:24', 'Second Gear Diecast', 'Features opening trunk,  working steering system. Color dark green.', 4710, 57.46, 97.39),
('S24_4278', '1900s Vintage Tri-Plane', 'Planes', '1:24', 'Unimax Art Galleries', 'Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.', 2756, 36.23, 72.45),
('S24_4620', '1961 Chevrolet Impala', 'Classic Cars', '1:18', 'Classic Metal Creations', 'This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.', 7869, 32.33, 80.84),
('S32_1268', '1980’s GM Manhattan Express', 'Trucks and Buses', '1:32', 'Motor City Art Classics', 'This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.', 5099, 53.93, 96.31),
('S32_1374', '1997 BMW F650 ST', 'Motorcycles', '1:32', 'Exoto Designs', 'Features official die-struck logos and baked enamel finish. Comes with stand.', 178, 66.92, 99.89),
('S32_2206', '1982 Ducati 996 R', 'Motorcycles', '1:32', 'Gearbox Collectibles', 'Features rotating wheels , working kick stand. Comes with stand.', 9241, 24.14, 40.23),
('S32_2509', '1954 Greyhound Scenicruiser', 'Trucks and Buses', '1:32', 'Classic Metal Creations', 'Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos', 2874, 25.98, 54.11),
('S32_3207', '1950\'s Chicago Surface Lines Streetcar', 'Trains', '1:32', 'Gearbox Collectibles', 'This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 8601, 26.72, 62.14),
('S32_3522', '1996 Peterbilt 379 Stake Bed with Outrigger', 'Trucks and Buses', '1:32', 'Red Start Diecast', 'This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab', 814, 33.61, 64.64),
('S32_4289', '1928 Ford Phaeton Deluxe', 'Vintage Cars', '1:32', 'Highway 66 Mini Classics', 'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system', 136, 33.02, 68.79),
('S32_4485', '1974 Ducati 350 Mk3 Desmo', 'Motorcycles', '1:32', 'Second Gear Diecast', 'This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 3341, 56.13, 102.05),
('S50_1341', '1930 Buick Marquette Phaeton', 'Vintage Cars', '1:50', 'Studio M Art Models', 'Features opening trunk,  working steering system', 7062, 27.06, 43.64),
('S50_1392', 'Diamond T620 Semi-Skirted Tanker', 'Trucks and Buses', '1:50', 'Highway 66 Mini Classics', 'This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.', 1016, 68.29, 115.75),
('S50_1514', '1962 City of Detroit Streetcar', 'Trains', '1:50', 'Classic Metal Creations', 'This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 1645, 37.49, 58.58),
('S50_4713', '2002 Yamaha YZR M1', 'Motorcycles', '1:50', 'Autoart Studio Design', 'Features rotating wheels , working kick stand. Comes with stand.', 600, 34.17, 81.36),
('S700_1138', 'The Schooner Bluenose', 'Ships', '1:700', 'Autoart Studio Design', 'All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.', 1897, 34.00, 66.67),
('S700_1691', 'American Airlines: B767-300', 'Planes', '1:700', 'Min Lin Diecast', 'Exact replia with official logos and insignias and retractable wheels', 5841, 51.15, 91.34),
('S700_1938', 'The Mayflower', 'Ships', '1:700', 'Studio M Art Models', 'Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.', 737, 43.30, 86.61),
('S700_2047', 'HMS Bounty', 'Ships', '1:700', 'Unimax Art Galleries', 'Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 3501, 39.83, 90.52),
('S700_2466', 'America West Airlines B757-200', 'Planes', '1:700', 'Motor City Art Classics', 'Official logos and insignias. Working steering system. Rotating jet engines', 9653, 68.80, 99.72),
('S700_2610', 'The USS Constitution Ship', 'Ships', '1:700', 'Red Start Diecast', 'All wood with canvas sails. Measures 31 1/2\" Length x 22 3/8\" High x 8 1/4\" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.', 7083, 33.97, 72.28),
('S700_2824', '1982 Camaro Z28', 'Classic Cars', '1:18', 'Carousel DieCast Legends', 'Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2\" Long.', 6934, 46.53, 101.15),
('S700_2834', 'ATA: B757-300', 'Planes', '1:700', 'Highway 66 Mini Classics', 'Exact replia with official logos and insignias and retractable wheels', 7106, 59.33, 118.65),
('S700_3167', 'F/A 18 Hornet 1/72', 'Planes', '1:72', 'Motor City Art Classics', '10\" Wingspan with retractable landing gears.Comes with pilot', 551, 54.40, 80.00),
('S700_3505', 'The Titanic', 'Ships', '1:700', 'Carousel DieCast Legends', 'Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', 1956, 51.09, 100.17),
('S700_3962', 'The Queen Mary', 'Ships', '1:700', 'Welly Diecast Productions', 'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 5088, 53.63, 99.31),
('S700_4002', 'American Airlines: MD-11S', 'Planes', '1:700', 'Second Gear Diecast', 'Polished finish. Exact replia with official logos and insignias and retractable wheels', 8820, 36.27, 74.03),
('S72_1253', 'Boeing X-32A JSF', 'Planes', '1:72', 'Motor City Art Classics', '10\" Wingspan with retractable landing gears.Comes with pilot', 4857, 32.77, 49.66),
('S72_3212', 'Pont Yacht', 'Ships', '1:72', 'Unimax Art Galleries', 'Measures 38 inches Long x 33 3/4 inches High. Includes a stand.\r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', 414, 33.30, 54.60);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerNumber`),
  ADD KEY `salesRepEmployeeNumber` (`salesRepEmployeeNumber`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeNumber`),
  ADD KEY `reportsTo` (`reportsTo`),
  ADD KEY `officeCode` (`officeCode`);

--
-- Indices de la tabla `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`officeCode`);

--
-- Indices de la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderNumber`,`productCode`),
  ADD KEY `productCode` (`productCode`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `customerNumber` (`customerNumber`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`customerNumber`,`checkNumber`);

--
-- Indices de la tabla `productlines`
--
ALTER TABLE `productlines`
  ADD PRIMARY KEY (`productLine`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productCode`),
  ADD KEY `productLine` (`productLine`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`);

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`);

--
-- Filtros para la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`);

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`);
--
-- Base de datos: `empresa_eventos`
--
CREATE DATABASE IF NOT EXISTS `empresa_eventos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `empresa_eventos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animadores`
--

CREATE TABLE `animadores` (
  `codigoA` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidoPaterno` varchar(60) NOT NULL,
  `apellidoMaterno` varchar(60) DEFAULT NULL,
  `CURP` varchar(18) NOT NULL,
  `codigoD` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animador_telefono`
--

CREATE TABLE `animador_telefono` (
  `codigoA` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `idMunicipio` int(10) UNSIGNED NOT NULL,
  `idCiudad` int(10) UNSIGNED NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `No_cliente` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidoPaterno` varchar(60) NOT NULL,
  `apellidoMaterno` varchar(60) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_telefono`
--

CREATE TABLE `cliente_telefono` (
  `No_cliente` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonias`
--

CREATE TABLE `colonias` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `idMunicipio` int(10) UNSIGNED NOT NULL,
  `idCiudad` int(10) UNSIGNED NOT NULL,
  `idColonia` int(10) UNSIGNED NOT NULL,
  `colonia` varchar(250) NOT NULL,
  `CP` varchar(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disfraces`
--

CREATE TABLE `disfraces` (
  `codigoD` int(10) UNSIGNED NOT NULL,
  `personaje` varchar(150) NOT NULL,
  `precioAlquiler` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio_cliente`
--

CREATE TABLE `domicilio_cliente` (
  `idDireccion` int(10) UNSIGNED NOT NULL,
  `No_cliente` int(10) UNSIGNED NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `cruzamientos` varchar(250) DEFAULT NULL,
  `idEstado` int(10) UNSIGNED NOT NULL,
  `idMunicipio` int(10) UNSIGNED NOT NULL,
  `idCiudad` int(10) UNSIGNED NOT NULL,
  `idColonia` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `estado` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `codigoE` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(2500) NOT NULL,
  `precio_base` decimal(5,2) NOT NULL,
  `idTipo_evento` int(10) UNSIGNED NOT NULL,
  `numPresentadores` int(2) DEFAULT NULL,
  `numAnimadores` int(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos_contratados`
--

CREATE TABLE `eventos_contratados` (
  `codigoEC` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idDireccion` int(10) UNSIGNED NOT NULL,
  `codigoE` int(10) UNSIGNED NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `precio_real` decimal(5,2) NOT NULL,
  `estatus` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `idEstado` int(10) UNSIGNED NOT NULL,
  `idMunicipio` int(10) UNSIGNED NOT NULL,
  `municipio` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentadores`
--

CREATE TABLE `presentadores` (
  `codigoP` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidoPaterno` varchar(60) NOT NULL,
  `apellidoMaterno` varchar(60) DEFAULT NULL,
  `CURP` varchar(18) NOT NULL,
  `año_inicio` date NOT NULL,
  `idTipo_evento` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentador_telefono`
--

CREATE TABLE `presentador_telefono` (
  `codigoP` int(10) UNSIGNED NOT NULL,
  `idTipo` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_telefono`
--

CREATE TABLE `tipos_telefono` (
  `idTipo` int(10) UNSIGNED NOT NULL,
  `tipoTelefono` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_evento`
--

CREATE TABLE `tipo_evento` (
  `idTipo_evento` int(10) UNSIGNED NOT NULL,
  `tipoEvento` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animadores`
--
ALTER TABLE `animadores`
  ADD PRIMARY KEY (`codigoA`,`codigoD`),
  ADD UNIQUE KEY `CURP` (`CURP`),
  ADD KEY `codigoD` (`codigoD`);

--
-- Indices de la tabla `animador_telefono`
--
ALTER TABLE `animador_telefono`
  ADD PRIMARY KEY (`codigoA`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idEstado`,`idMunicipio`,`idCiudad`),
  ADD UNIQUE KEY `idEstado` (`idEstado`,`idMunicipio`,`idCiudad`),
  ADD KEY `idMunicipio` (`idMunicipio`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`No_cliente`);

--
-- Indices de la tabla `cliente_telefono`
--
ALTER TABLE `cliente_telefono`
  ADD PRIMARY KEY (`No_cliente`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD PRIMARY KEY (`idEstado`,`idMunicipio`,`idCiudad`,`idColonia`),
  ADD KEY `idMunicipio` (`idMunicipio`),
  ADD KEY `idCiudad` (`idCiudad`);

--
-- Indices de la tabla `disfraces`
--
ALTER TABLE `disfraces`
  ADD PRIMARY KEY (`codigoD`);

--
-- Indices de la tabla `domicilio_cliente`
--
ALTER TABLE `domicilio_cliente`
  ADD PRIMARY KEY (`idDireccion`,`No_cliente`),
  ADD KEY `No_cliente` (`No_cliente`),
  ADD KEY `idEstado` (`idEstado`),
  ADD KEY `idMunicipio` (`idMunicipio`),
  ADD KEY `idCiudad` (`idCiudad`),
  ADD KEY `idColonia` (`idColonia`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`codigoE`,`idTipo_evento`),
  ADD KEY `idTipo_evento` (`idTipo_evento`);

--
-- Indices de la tabla `eventos_contratados`
--
ALTER TABLE `eventos_contratados`
  ADD PRIMARY KEY (`codigoEC`,`idDireccion`,`codigoE`),
  ADD KEY `idDireccion` (`idDireccion`),
  ADD KEY `codigoE` (`codigoE`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`idEstado`,`idMunicipio`),
  ADD UNIQUE KEY `idMunicipio` (`idMunicipio`);

--
-- Indices de la tabla `presentadores`
--
ALTER TABLE `presentadores`
  ADD PRIMARY KEY (`codigoP`,`idTipo_evento`),
  ADD UNIQUE KEY `CURP` (`CURP`),
  ADD KEY `idTipo_evento` (`idTipo_evento`);

--
-- Indices de la tabla `presentador_telefono`
--
ALTER TABLE `presentador_telefono`
  ADD PRIMARY KEY (`codigoP`,`idTipo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `tipos_telefono`
--
ALTER TABLE `tipos_telefono`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `tipo_evento`
--
ALTER TABLE `tipo_evento`
  ADD PRIMARY KEY (`idTipo_evento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `animadores`
--
ALTER TABLE `animadores`
  MODIFY `codigoA` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `No_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `disfraces`
--
ALTER TABLE `disfraces`
  MODIFY `codigoD` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio_cliente`
--
ALTER TABLE `domicilio_cliente`
  MODIFY `idDireccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `codigoE` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `eventos_contratados`
--
ALTER TABLE `eventos_contratados`
  MODIFY `codigoEC` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presentadores`
--
ALTER TABLE `presentadores`
  MODIFY `codigoP` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_telefono`
--
ALTER TABLE `tipos_telefono`
  MODIFY `idTipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_evento`
--
ALTER TABLE `tipo_evento`
  MODIFY `idTipo_evento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animadores`
--
ALTER TABLE `animadores`
  ADD CONSTRAINT `animadores_ibfk_1` FOREIGN KEY (`codigoD`) REFERENCES `disfraces` (`codigoD`);

--
-- Filtros para la tabla `animador_telefono`
--
ALTER TABLE `animador_telefono`
  ADD CONSTRAINT `animador_telefono_ibfk_1` FOREIGN KEY (`codigoA`) REFERENCES `animadores` (`codigoA`),
  ADD CONSTRAINT `animador_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `ciudades_ibfk_2` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`);

--
-- Filtros para la tabla `cliente_telefono`
--
ALTER TABLE `cliente_telefono`
  ADD CONSTRAINT `cliente_telefono_ibfk_1` FOREIGN KEY (`No_cliente`) REFERENCES `cliente` (`No_cliente`),
  ADD CONSTRAINT `cliente_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);

--
-- Filtros para la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD CONSTRAINT `colonias_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `colonias_ibfk_2` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`);

--
-- Filtros para la tabla `domicilio_cliente`
--
ALTER TABLE `domicilio_cliente`
  ADD CONSTRAINT `domicilio_cliente_ibfk_1` FOREIGN KEY (`No_cliente`) REFERENCES `cliente` (`No_cliente`),
  ADD CONSTRAINT `domicilio_cliente_ibfk_2` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `domicilio_cliente_ibfk_3` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`);

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`idTipo_evento`) REFERENCES `tipo_evento` (`idTipo_evento`);

--
-- Filtros para la tabla `eventos_contratados`
--
ALTER TABLE `eventos_contratados`
  ADD CONSTRAINT `eventos_contratados_ibfk_1` FOREIGN KEY (`idDireccion`) REFERENCES `domicilio_cliente` (`idDireccion`),
  ADD CONSTRAINT `eventos_contratados_ibfk_2` FOREIGN KEY (`codigoE`) REFERENCES `eventos` (`codigoE`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`);

--
-- Filtros para la tabla `presentadores`
--
ALTER TABLE `presentadores`
  ADD CONSTRAINT `presentadores_ibfk_1` FOREIGN KEY (`idTipo_evento`) REFERENCES `tipo_evento` (`idTipo_evento`);

--
-- Filtros para la tabla `presentador_telefono`
--
ALTER TABLE `presentador_telefono`
  ADD CONSTRAINT `presentador_telefono_ibfk_1` FOREIGN KEY (`codigoP`) REFERENCES `presentadores` (`codigoP`),
  ADD CONSTRAINT `presentador_telefono_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipos_telefono` (`idTipo`);
--
-- Base de datos: `gastroroo`
--
CREATE DATABASE IF NOT EXISTS `gastroroo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gastroroo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `Id_ciudad` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_publicacion` int(10) UNSIGNED NOT NULL,
  `comentario` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(1500) NOT NULL,
  `ubicacion` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_evento`
--

CREATE TABLE `imagen_evento` (
  `Id_imagen` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `Id_evento` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_lugar`
--

CREATE TABLE `imagen_lugar` (
  `Id_imagen` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `Id_lugar` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_ruta`
--

CREATE TABLE `imagen_ruta` (
  `Id_imagen` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `Id_ruta` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugaresgastronomicos`
--

CREATE TABLE `lugaresgastronomicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `descripcion` varchar(1500) NOT NULL,
  `longitud` decimal(8,5) NOT NULL,
  `latitud` decimal(8,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares_en_ruta`
--

CREATE TABLE `lugares_en_ruta` (
  `id_ruta` int(10) UNSIGNED DEFAULT NULL,
  `id_lugar` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `Id_municipio` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `descripcion` varchar(1500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutasgastronomicas`
--

CREATE TABLE `rutasgastronomicas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacionl`
--

CREATE TABLE `ubicacionl` (
  `Id_ubicacion` int(10) UNSIGNED NOT NULL,
  `Id_lugar` int(10) UNSIGNED DEFAULT NULL,
  `Id_municipio` int(10) UNSIGNED DEFAULT NULL,
  `Id_ciudad` int(10) UNSIGNED DEFAULT NULL,
  `Colonia` varchar(250) NOT NULL,
  `Calle` varchar(250) NOT NULL,
  `Numero` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacionu`
--

CREATE TABLE `ubicacionu` (
  `Id_ubicacion` int(10) UNSIGNED NOT NULL,
  `Id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `Id_municipio` int(10) UNSIGNED DEFAULT NULL,
  `Id_ciudad` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidoP` varchar(60) NOT NULL,
  `apellidoM` varchar(60) DEFAULT NULL,
  `correo` varchar(300) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `admin` int(1) DEFAULT 0,
  `experto` int(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_lugar`
--

CREATE TABLE `video_lugar` (
  `Id_video` int(10) UNSIGNED NOT NULL,
  `video` varchar(200) NOT NULL,
  `Id_lugar` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_ruta`
--

CREATE TABLE `video_ruta` (
  `Id_video` int(10) UNSIGNED NOT NULL,
  `video` varchar(200) NOT NULL,
  `Id_ruta` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`Id_ciudad`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_publicacion` (`id_publicacion`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagen_evento`
--
ALTER TABLE `imagen_evento`
  ADD PRIMARY KEY (`Id_imagen`),
  ADD KEY `Id_evento` (`Id_evento`);

--
-- Indices de la tabla `imagen_lugar`
--
ALTER TABLE `imagen_lugar`
  ADD PRIMARY KEY (`Id_imagen`),
  ADD KEY `Id_lugar` (`Id_lugar`);

--
-- Indices de la tabla `imagen_ruta`
--
ALTER TABLE `imagen_ruta`
  ADD PRIMARY KEY (`Id_imagen`),
  ADD KEY `Id_ruta` (`Id_ruta`);

--
-- Indices de la tabla `lugaresgastronomicos`
--
ALTER TABLE `lugaresgastronomicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lugares_en_ruta`
--
ALTER TABLE `lugares_en_ruta`
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `id_lugar` (`id_lugar`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`Id_municipio`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `rutasgastronomicas`
--
ALTER TABLE `rutasgastronomicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacionl`
--
ALTER TABLE `ubicacionl`
  ADD PRIMARY KEY (`Id_ubicacion`),
  ADD KEY `Id_lugar` (`Id_lugar`),
  ADD KEY `Id_municipio` (`Id_municipio`),
  ADD KEY `Id_ciudad` (`Id_ciudad`);

--
-- Indices de la tabla `ubicacionu`
--
ALTER TABLE `ubicacionu`
  ADD PRIMARY KEY (`Id_ubicacion`),
  ADD KEY `Id_usuario` (`Id_usuario`),
  ADD KEY `Id_municipio` (`Id_municipio`),
  ADD KEY `Id_ciudad` (`Id_ciudad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video_lugar`
--
ALTER TABLE `video_lugar`
  ADD PRIMARY KEY (`Id_video`),
  ADD KEY `Id_lugar` (`Id_lugar`);

--
-- Indices de la tabla `video_ruta`
--
ALTER TABLE `video_ruta`
  ADD PRIMARY KEY (`Id_video`),
  ADD KEY `Id_ruta` (`Id_ruta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `Id_ciudad` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagen_evento`
--
ALTER TABLE `imagen_evento`
  MODIFY `Id_imagen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagen_lugar`
--
ALTER TABLE `imagen_lugar`
  MODIFY `Id_imagen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagen_ruta`
--
ALTER TABLE `imagen_ruta`
  MODIFY `Id_imagen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugaresgastronomicos`
--
ALTER TABLE `lugaresgastronomicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `Id_municipio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutasgastronomicas`
--
ALTER TABLE `rutasgastronomicas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacionl`
--
ALTER TABLE `ubicacionl`
  MODIFY `Id_ubicacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacionu`
--
ALTER TABLE `ubicacionu`
  MODIFY `Id_ubicacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `video_lugar`
--
ALTER TABLE `video_lugar`
  MODIFY `Id_video` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `video_ruta`
--
ALTER TABLE `video_ruta`
  MODIFY `Id_video` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_publicacion`) REFERENCES `rutasgastronomicas` (`id`);

--
-- Filtros para la tabla `imagen_evento`
--
ALTER TABLE `imagen_evento`
  ADD CONSTRAINT `imagen_evento_ibfk_1` FOREIGN KEY (`Id_evento`) REFERENCES `eventos` (`id`);

--
-- Filtros para la tabla `imagen_lugar`
--
ALTER TABLE `imagen_lugar`
  ADD CONSTRAINT `imagen_lugar_ibfk_1` FOREIGN KEY (`Id_lugar`) REFERENCES `lugaresgastronomicos` (`id`);

--
-- Filtros para la tabla `imagen_ruta`
--
ALTER TABLE `imagen_ruta`
  ADD CONSTRAINT `imagen_ruta_ibfk_1` FOREIGN KEY (`Id_ruta`) REFERENCES `rutasgastronomicas` (`id`);

--
-- Filtros para la tabla `lugares_en_ruta`
--
ALTER TABLE `lugares_en_ruta`
  ADD CONSTRAINT `lugares_en_ruta_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutasgastronomicas` (`id`),
  ADD CONSTRAINT `lugares_en_ruta_ibfk_2` FOREIGN KEY (`id_lugar`) REFERENCES `lugaresgastronomicos` (`id`);

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `ubicacionl`
--
ALTER TABLE `ubicacionl`
  ADD CONSTRAINT `ubicacionl_ibfk_1` FOREIGN KEY (`Id_lugar`) REFERENCES `lugaresgastronomicos` (`id`),
  ADD CONSTRAINT `ubicacionl_ibfk_2` FOREIGN KEY (`Id_municipio`) REFERENCES `municipio` (`Id_municipio`),
  ADD CONSTRAINT `ubicacionl_ibfk_3` FOREIGN KEY (`Id_ciudad`) REFERENCES `ciudad` (`Id_ciudad`);

--
-- Filtros para la tabla `ubicacionu`
--
ALTER TABLE `ubicacionu`
  ADD CONSTRAINT `ubicacionu_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ubicacionu_ibfk_2` FOREIGN KEY (`Id_municipio`) REFERENCES `municipio` (`Id_municipio`),
  ADD CONSTRAINT `ubicacionu_ibfk_3` FOREIGN KEY (`Id_ciudad`) REFERENCES `ciudad` (`Id_ciudad`);

--
-- Filtros para la tabla `video_lugar`
--
ALTER TABLE `video_lugar`
  ADD CONSTRAINT `video_lugar_ibfk_1` FOREIGN KEY (`Id_lugar`) REFERENCES `lugaresgastronomicos` (`id`);

--
-- Filtros para la tabla `video_ruta`
--
ALTER TABLE `video_ruta`
  ADD CONSTRAINT `video_ruta_ibfk_1` FOREIGN KEY (`Id_ruta`) REFERENCES `rutasgastronomicas` (`id`);
--
-- Base de datos: `glosario`
--
CREATE DATABASE IF NOT EXISTS `glosario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glosario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `descripcion`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Programación', 'Una de las principales cosas que hacemos en la carrera de ingeniería en software es programar, pero si no tienes conocimiento previo de este tema no hay de que preocuparse pues podrás aprender tanto sus bases como conocimientos avanzados de esta a lo largo de la carrera.', 'programacion.jpg', NULL, NULL),
(2, 'Sistemas Digitales', 'Puedes aprender de los sistemas digitales mediante prácticas en arduino para comprender de manera didáctica sobre estos temas', 'hardware.jpg', NULL, NULL),
(3, 'Desarrollo de Proyectos', 'En la carrera algo que aprenden nuestros alumnos es el como desarrollar y liderar un proyecto.', 'desarrollo.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2024_02_04_044451_create_terminos_table', 1),
(11, '2024_02_08_235647_create_carreras_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terminos`
--

CREATE TABLE `terminos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `terminos`
--

INSERT INTO `terminos` (`id`, `nombre`, `descripcion`, `imagen`, `created_at`, `updated_at`) VALUES
(2, 'Servidor', 'Un servidor es un sistema informático o software que proporciona servicios, recursos o datos a otros dispositivos o programas llamados clientes. Los servidores pueden ofrecer una variedad de servicios, como almacenamiento de archivos, páginas web, correo electrónico, etc.', 'servidor.jpg', NULL, NULL),
(3, 'Sistemas de computadoras centrales', 'Se refiere a sistemas informáticos donde el procesamiento y el almacenamiento de datos se realizan principalmente en una ubicación centralizada. Estos sistemas suelen ser utilizados en entornos empresariales donde múltiples usuarios acceden a recursos compartidos.', 'SistemaCompuC.jpg', NULL, NULL),
(4, 'Computadoras dedicadas', 'Son sistemas informáticos diseñados para realizar tareas específicas o para servir a un propósito particular. Estas computadoras están optimizadas para ejecutar una única aplicación o conjunto de aplicaciones.', 'computadoraDedicada.jpg', NULL, NULL),
(5, 'Recursos compartidos', 'Son recursos informáticos, como archivos, impresoras, espacio de almacenamiento, etc., que están disponibles para varios usuarios o dispositivos dentro de una red.', 'recursosCompartidos.jpg', NULL, NULL),
(6, 'Protocolos asimétricos', 'Se refiere a protocolos de comunicación donde la velocidad o la capacidad de procesamiento de los dispositivos involucrados en la comunicación no son iguales. Esto puede resultar en desigualdades en el rendimiento de la comunicación.', 'protocoloAsimetrico.jpg', NULL, NULL),
(7, 'Encapsulación de servicios', 'Es un principio de diseño de software donde los detalles internos de un servicio están ocultos y solo se exponen las interfaces necesarias para su uso. Esto promueve la modularidad y la interoperabilidad de los sistemas.', 'Encapsulacion.png', NULL, NULL),
(8, 'Escalabilidad', 'Es la capacidad de un sistema para adaptarse y crecer para manejar un aumento en la demanda, ya sea en términos de usuarios, tráfico, datos, etc., sin perder rendimiento o funcionalidad.', 'escalabilidad.png', NULL, NULL),
(9, 'Integridad', 'En el contexto de la seguridad de la información, la integridad se refiere a la garantía de que los datos no han sido alterados o corrompidos de manera no autorizada durante su almacenamiento, procesamiento o transmisión.', 'integridad.jpg', NULL, NULL),
(10, 'IAAS', 'Es un modelo de servicio en la nube donde se proporciona infraestructura de TI, como servidores virtuales, almacenamiento, redes, etc., a través de internet.', 'IAAS.png', NULL, NULL),
(11, 'PAAS', 'Es un modelo de servicio en la nube donde se proporciona una plataforma de desarrollo y despliegue de aplicaciones, incluidas herramientas y servicios, a través de internet.', 'PAAS.png', NULL, NULL),
(12, 'SAAS', 'Es un modelo de servicio en la nube donde se proporciona acceso a aplicaciones de software a través de internet, generalmente a través de un navegador web, en lugar de instalar y mantener el software localmente.', 'SAAS.png', NULL, NULL),
(13, 'Cómputo en la nube', 'Es la entrega de servicios informáticos, como servidores, almacenamiento, bases de datos, redes, software, etc., a través de internet, lo que permite un acceso rápido y bajo demanda a recursos compartidos y escalables.', 'ComputoNube.png', NULL, NULL),
(14, 'Acerca de', 'en esta sección se presentan las herramientas utilizadas para la realización de la práctica y la información del desarrollador.', 'materiales.png', NULL, NULL),
(20, 'logo', 'logo description', 'jezer`s software logo 2.jpg', '2024-02-11 02:36:44', '2024-02-11 02:36:44'),
(25, 'Programacion', '*descripcion de programacion*', 'programacion.jpg', '2024-02-11 10:10:30', '2024-02-19 10:34:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `terminos`
--
ALTER TABLE `terminos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `terminos`
--
ALTER TABLE `terminos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `laravel_crud`
--
CREATE DATABASE IF NOT EXISTS `laravel_crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel_crud`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricula` varchar(12) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `telefono` varchar(22) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `carrera_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Ing. Software', NULL, NULL),
(2, 'Ingenieria en animación y efectos visuales', NULL, NULL),
(3, 'Lic. en Nutrición', NULL, NULL),
(4, 'Lic. en Terapia Fisica', NULL, NULL),
(5, 'Lic en administración de empresas turisticas', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_29_131546_create_carreras_table', 1),
(6, '2024_01_29_132830_create_alumnos_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"centro_capacitacion\",\"table\":\"tasks\"},{\"db\":\"centro_capacitacion\",\"table\":\"checklists\"},{\"db\":\"centro_capacitacion\",\"table\":\"catalogo_talleres\"},{\"db\":\"bd_productos\",\"table\":\"producto\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-11-07 02:45:26', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
