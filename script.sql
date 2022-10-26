-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-10-2022 a las 11:47:19
-- Versión del servidor: 5.7.40-log
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfoliowalter`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

DROP TABLE IF EXISTS `educacion`;
CREATE TABLE IF NOT EXISTS `educacion` (
  `id` int(11) NOT NULL,
  `nombre_establecimiento` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_educacion_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`id`, `nombre_establecimiento`, `fecha_inicio`, `fecha_fin`, `descripcion`, `persona_id`) VALUES
(1, 'Esc. Secundaria Justo Jose de Urquiza', '2004-03-01', '2010-12-04', 'Secundaria completo titulo Perito Mercantil', 1),
(2, 'Universidad Tecnologica Nacional Concordia', '2012-05-01', '2012-12-20', 'Planos en Autocad 3D y 2D', 1),
(3, 'Municipalidad de Chajari', '2014-03-01', '2014-08-10', 'Programa GYS georeferenciacion con GPS', 1),
(4, 'Google Activate', '2022-01-30', '2022-03-30', 'Fundamentos en Marketing Digital', 1),
(5, 'Google Activate', '2022-04-10', '2022-05-25', 'Introduccion al desarrollo web', 1),
(6, 'Argentina Programa', '2022-06-10', '2023-01-20', 'Desarrolador Full Stack Junior ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
CREATE TABLE IF NOT EXISTS `experiencia_laboral` (
  `id` int(11) NOT NULL,
  `nombreEmpresa` varchar(45) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFIn` date DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_experiencia_laboral_persona_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `experiencia_laboral`
--

INSERT INTO `experiencia_laboral` (`id`, `nombreEmpresa`, `fechaInicio`, `fechaFIn`, `descripcion`, `persona_id`) VALUES
(1, 'Municipalidad de Chajari', '2012-02-12', '2022-10-20', 'En este trabajo he realizado trabajos administrativos, antencion al publico, trabajos de analisis de datos, proyectos de arquitectura e ingenieria, Licencias Nacional de Conducir entre otros', 1),
(2, 'Rotiseria Santa Gula', '2016-07-15', '2022-10-20', 'Dueño, control de stock, administracion, chef', 1),
(3, 'Ingenieria SA', '2015-07-20', '2018-04-15', 'Proyectos de ingenieria y arquitectura, planos de obra en autocad, computos y presupuestos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `id` int(11) NOT NULL,
  `urlFotoPortada` varchar(45) DEFAULT NULL,
  `urlPerfil` varchar(45) DEFAULT NULL,
  `url-exp_laboral` varchar(45) DEFAULT NULL,
  `url-educacion` varchar(45) DEFAULT NULL,
  `proyecto` varchar(45) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_imagenes_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `sobreMi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `domicilio`, `FechaNac`, `telefono`, `correo`, `sobreMi`) VALUES
(1, 'Walter', 'Halm', 'Chajari, Entre Rios', '1993-04-22', '3454144723', 'walter_halm@hotmail.com', 'Tengo 29 años, actualmente estoy realizando la segunda etapa del curso Argentina Programa con titulo Full Stack Developer Junior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_proyecto_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `nombre`, `descripcion`, `persona_id`) VALUES
(1, 'Argentina Programa', 'proyecto mi primer portfolio web ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_skill_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `skill`
--

INSERT INTO `skill` (`id`, `nombre`, `porcentaje`, `persona_id`) VALUES
(1, 'HTML', 85, 1),
(2, 'CSS', 80, 1),
(3, 'JavaScipt', 75, 1),
(4, 'angular', 90, 1),
(5, 'ingles', 70, 1),
(6, 'git, github', 90, 1),
(7, 'base de datos', 80, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_usuario_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`, `persona_id`) VALUES
(1, 'walter', 'walterhalm', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD CONSTRAINT `fk_educacion_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD CONSTRAINT `fk_experiencia_laboral_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `fk_imagenes_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_proyecto_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `fk_skill_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
