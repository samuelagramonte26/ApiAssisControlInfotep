-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2022 a las 09:22:28
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_cursos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidad` int(11) NOT NULL,
  `tallerID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`id`, `nombre`, `ubicacion`, `capacidad`, `tallerID`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 'Tecnico Superior', 'pasillo 2 puerta 4', 20, 1, 1, '2022-05-13', NULL, NULL),
(2, 'Redes', 'pasillo 2 puerta 2', 25, 1, 1, NULL, NULL, NULL),
(3, 'Maderera', '1er nivel puerta principal', 30, 2, 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aulaID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `aulaID`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 'Tecnico en diseño y desarrollo de aplicaciones', 1, 1, '2022-05-13', NULL, NULL),
(2, 'Tecnico en redes', 2, 1, '2022-05-13', NULL, NULL),
(3, 'Auxiliar en ebanisteria', 3, 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `horaDesde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horaHasta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanda` enum('mañana','tarde','noche') COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `horaDesde`, `horaHasta`, `tanda`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, '8:00 AM', '2:00 PM', 'mañana', 1, '2022-05-13', NULL, NULL),
(2, '8:00 AM', '12:30 PM', 'mañana', 1, '2022-05-13', NULL, NULL),
(3, '2:00 PM', '6:00 PM', 'tarde', 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_materias`
--

CREATE TABLE `horario_materias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `materiaID` int(11) NOT NULL,
  `horarioID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horario_materias`
--

INSERT INTO `horario_materias` (`id`, `materiaID`, `horarioID`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 1, 1, 1, '2022-05-13', NULL, NULL),
(2, 2, 1, 1, '2022-05-13', NULL, NULL),
(3, 3, 2, 1, '2022-05-13', NULL, NULL),
(4, 4, 1, 1, '2022-05-13', NULL, NULL),
(5, 5, 4, 1, '2022-05-13', NULL, NULL),
(6, 6, 2, 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE `maestros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `maestros`
--

INSERT INTO `maestros` (`id`, `nombre`, `apellido`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 'Eudy', 'Arias', 1, '2022-05-13', NULL, NULL),
(2, 'Michell', 'Grullon', 1, '2022-05-13', NULL, NULL),
(3, 'Nelson', 'Pepen', 1, '2022-05-13', NULL, NULL),
(4, 'Esterlina', 'Montero', 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro_materias`
--

CREATE TABLE `maestro_materias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `maestroID` int(11) NOT NULL,
  `materiaID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `maestro_materias`
--

INSERT INTO `maestro_materias` (`id`, `maestroID`, `materiaID`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 1, 4, 1, '2022-05-13', NULL, NULL),
(2, 3, 5, 1, '2022-05-13', NULL, NULL),
(3, 2, 2, 1, '2022-05-13', NULL, NULL),
(4, 4, 1, 1, '2022-05-13', NULL, NULL),
(5, 4, 3, 1, '2022-05-13', NULL, NULL),
(6, 3, 6, 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidadHrs` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nombre`, `codigo`, `cantidadHrs`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 'Formacion Humana', '12309', 30, 1, '2022-05-13', NULL, NULL),
(2, 'Ingles Tecnico', '43587', 100, 1, '2022-05-13', NULL, NULL),
(3, 'Formacion Humana 2', '12310', 40, 1, '2022-05-13', NULL, NULL),
(4, 'Programacion 1', '33244', 60, 1, '2022-05-13', NULL, NULL),
(5, 'Cableado Estructurado', '997468', 70, 1, '2022-05-13', NULL, NULL),
(6, 'Introduccio a la ebanisteria', '3252', 80, 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_cursos`
--

CREATE TABLE `materia_cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cursoID` int(11) NOT NULL,
  `materiaID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materia_cursos`
--

INSERT INTO `materia_cursos` (`id`, `cursoID`, `materiaID`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 1, 1, 1, '2022-05-13', NULL, NULL),
(2, 2, 1, 1, '2022-05-13', NULL, NULL),
(3, 3, 1, 1, '2022-05-13', NULL, NULL),
(4, 1, 2, 1, '2022-05-13', NULL, NULL),
(5, 2, 2, 1, '2022-05-13', NULL, NULL),
(6, 1, 4, 1, '2022-05-13', NULL, NULL),
(7, 3, 6, 1, '2022-05-06', NULL, NULL),
(8, 1, 5, 1, '2022-05-13', NULL, NULL),
(9, 2, 5, 1, '2022-05-13', NULL, NULL),
(10, 1, 3, 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_12_131702_create_tallers_table', 1),
(6, '2022_05_12_140914_create_aulas_table', 1),
(7, '2022_05_12_152421_create_cursos_table', 1),
(8, '2022_05_12_153922_create_participantes_table', 1),
(9, '2022_05_12_161339_create_materias_table', 1),
(10, '2022_05_12_171617_create_materia_cursos_table', 1),
(11, '2022_05_12_213307_create_maestros_table', 1),
(12, '2022_05_12_221350_create_maestro_materias_table', 1),
(13, '2022_05_13_011214_create_horarios_table', 1),
(14, '2022_05_13_112349_create_horario_materias_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cursoID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id`, `nombre`, `apellido`, `cedula`, `cursoID`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 'Samuel', 'Agramonte', '402-2683293-9', 1, 1, '2022-05-13', NULL, NULL),
(2, 'Julio Isaias', 'Peguero', '001-239483-2', 1, 1, '2022-05-13', NULL, NULL),
(3, 'Franklin ', 'Martinez', '402-334492-2', 1, 1, '2022-05-13', NULL, NULL),
(4, 'Yosmailis', 'Rondon', '402-33948202-2', 1, 1, '2022-05-13', NULL, NULL),
(5, 'Mario ', 'Mata ', '001-28378473-3', 1, 1, '2022-05-13', NULL, NULL),
(6, 'Jean Carlos', 'Cruz', '001-209382-2', 1, 1, '0000-00-00', NULL, NULL),
(7, 'Adrian Ismael', 'Peguero', '402-294738-2', 1, 1, '2022-05-13', NULL, NULL),
(8, 'Enerby', 'Nolasco', '332-3984783-2', 1, 1, '2022-05-13', NULL, NULL),
(9, 'Yonsi', 'Perez', '402-398472802-2', 1, 1, '2022-05-13', NULL, NULL),
(10, 'Jose Javier', 'Pinales', '001-38764820-2', 1, 1, '0000-00-00', NULL, NULL),
(11, 'Juan', 'Cruz', '402-76352-9', 2, 1, '2022-05-13', NULL, NULL),
(12, 'Pedro ', 'Mota', '001-332213-2', 2, 1, '2022-05-13', NULL, NULL),
(13, 'Francisco ', 'Morillo', '402-32425235-2', 2, 1, '2022-05-13', NULL, NULL),
(14, 'Alfonzo', 'Mora', '402-24243-2', 2, 1, '2022-05-13', NULL, NULL),
(15, 'Cristian ', 'jul ', '001-756753-3', 2, 1, '2022-05-13', NULL, NULL),
(16, 'Carlos', 'Cruz', '001-6452657-2', 2, 1, '2022-05-13', NULL, NULL),
(17, 'Ismael', 'Peguero', '402-2345453-2', 2, 1, '2022-05-13', NULL, NULL),
(18, 'Manuel', 'Nolasco', '332-66856-2', 2, 1, '2022-05-13', NULL, NULL),
(19, 'Jose', 'danilo', '402-76875-2', 2, 1, '2022-05-13', NULL, NULL),
(20, 'Javier', 'potrer', '001-658658-2', 2, 1, '0000-00-00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallers`
--

CREATE TABLE `tallers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fechaCreado` date DEFAULT NULL,
  `fechaEditado` date DEFAULT NULL,
  `fechaEliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tallers`
--

INSERT INTO `tallers` (`id`, `nombre`, `ubicacion`, `active`, `fechaCreado`, `fechaEditado`, `fechaEliminado`) VALUES
(1, 'Informatica', 'Talleres 2do nivel pasillo 2', 1, '2022-05-13', NULL, NULL),
(2, 'Ebanisteria', 'Talleres 1er nivel detras de las escaleras', 1, '2022-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horario_materias`
--
ALTER TABLE `horario_materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maestro_materias`
--
ALTER TABLE `maestro_materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materia_cursos`
--
ALTER TABLE `materia_cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `tallers`
--
ALTER TABLE `tallers`
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
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `horario_materias`
--
ALTER TABLE `horario_materias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `maestros`
--
ALTER TABLE `maestros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `maestro_materias`
--
ALTER TABLE `maestro_materias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `materia_cursos`
--
ALTER TABLE `materia_cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tallers`
--
ALTER TABLE `tallers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
