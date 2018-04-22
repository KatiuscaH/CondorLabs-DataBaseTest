-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2018 a las 11:16:03
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_address`
--

CREATE TABLE `user_address` (
  `id_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_address`
--

INSERT INTO `user_address` (`id_address`, `id_user`) VALUES
(34, 0),
(12, 1),
(56, 3),
(456789, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_profile`
--

CREATE TABLE `user_profile` (
  `id_user` int(11) NOT NULL,
  `nm_first` varchar(45) DEFAULT NULL,
  `nm_middle` varchar(45) DEFAULT NULL,
  `nm_last` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_profile`
--

INSERT INTO `user_profile` (`id_user`, `nm_first`, `nm_middle`, `nm_last`) VALUES
(0, 'v', 'vv', 'bbb'),
(1, 'a', NULL, NULL),
(3, 'Juan', 'Valdez', 'Sanchez'),
(4, 'Laura', NULL, 'Vazques'),
(6, 'Pablo', 'Escobar', 'Lopez'),
(7, 'Juana', NULL, 'Hoz'),
(8, 'Lala', 'Perez', 'Gaitan'),
(9, 'Lolo', '', 'aaa'),
(10, 'Pola', NULL, 'Polo'),
(11, 'Pee', NULL, 'eee'),
(12, 'eeeee', NULL, 'ggggg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `cd_role_type` varchar(45) NOT NULL,
  `id_entity` int(11) NOT NULL,
  `in_status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`cd_role_type`, `id_entity`, `in_status`, `id_user`) VALUES
('licensee', 1, 2, 0),
('licensee', 3, 1, 6),
('licensee', 65, 1, 9),
('licensee', 67, 1, 10),
('limited', 2, 3, 1),
('limited', 6, 1, 7),
('limited', 333, 1, 12),
('provider', 3, 4, 3),
('provider', 6, 454, 8),
('provider', 44, 1, 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `fk_user_address_user_profile1_idx` (`id_user`);

--
-- Indices de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`cd_role_type`,`id_entity`,`id_user`),
  ADD KEY `fk_user_role_user_profile_idx` (`id_user`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `fk_user_address_user_profile1` FOREIGN KEY (`id_user`) REFERENCES `user_profile` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_user_role_user_profile` FOREIGN KEY (`id_user`) REFERENCES `user_profile` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
