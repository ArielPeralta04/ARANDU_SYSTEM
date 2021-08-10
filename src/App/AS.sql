-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.20-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para as
CREATE DATABASE IF NOT EXISTS `as` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `as`;

-- Volcando estructura para tabla as.articulo
CREATE TABLE IF NOT EXISTS `articulo` (
  `idarticulo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `codigoalfanumerico` varchar(50) DEFAULT NULL,
  `codigobarra` varchar(50) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idmarca` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL,
  `idseccion` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `idimpuesto` int(11) NOT NULL,
  PRIMARY KEY (`idarticulo`),
  KEY `FK_ARTICULO_MARCA` (`idmarca`),
  KEY `FK_ARTICULO_LINEA` (`idlinea`),
  KEY `FK_ARTICULO_SECCION` (`idseccion`),
  KEY `FK_ARTICULO_TIPO_ARTICULO` (`idtipo`),
  KEY `FK_ARTICULO_UNIDAD_MEDIDA` (`idunidad`),
  KEY `FK_ARTICULO_IMPUESTO` (`idimpuesto`),
  CONSTRAINT `FK_ARTICULO_IMPUESTO` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`idimpuesto`),
  CONSTRAINT `FK_ARTICULO_LINEA` FOREIGN KEY (`idlinea`) REFERENCES `linea` (`idlinea`),
  CONSTRAINT `FK_ARTICULO_MARCA` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`),
  CONSTRAINT `FK_ARTICULO_SECCION` FOREIGN KEY (`idseccion`) REFERENCES `seccion` (`idseccion`),
  CONSTRAINT `FK_ARTICULO_TIPO_ARTICULO` FOREIGN KEY (`idtipo`) REFERENCES `tipo_articulo` (`idtipo`),
  CONSTRAINT `FK_ARTICULO_UNIDAD_MEDIDA` FOREIGN KEY (`idunidad`) REFERENCES `unidad_medida` (`idunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.articulo: ~521 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
REPLACE INTO `articulo` (`idarticulo`, `descripcion`, `referencia`, `codigoalfanumerico`, `codigobarra`, `estado`, `observacion`, `idmarca`, `idlinea`, `idseccion`, `idtipo`, `idunidad`, `idimpuesto`) VALUES
	(1, 'CABLE USB SAMSUNG V8 30 cm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(2, 'CABLE USB SAMSUNG V8 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(3, 'CABLE USB SAMSUNG V8 1,30m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(4, 'CABLE USB SAMSUNG V8 2m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(5, 'CABLE USB 3.0 P.MEMORIA EXTERNA 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(6, 'CABLE MICRO USB SAMSUNG 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(7, 'CABLE USB SAMSUNG TC 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(8, 'CABLE USB SAMSUNG REPLICA TC 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(9, 'CABLE USB ECOPOWER V8 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(10, 'CABLE USB ECOPOWER TC 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(11, 'CABLE USB ECOPOWER TRIPLE ENTRADA 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(12, 'CABLE USB RECRSI IPHONE 1m ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(13, 'CABLE USB IPHONE ORIGINAL 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(14, 'CABLE USB IPHONE ORIGINAL 2m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(15, 'CABLE USB IPHONE ORIGINAL TC 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(16, 'CABLE USB IPHONE ORIGINAL DOBLE C 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(17, 'CABLE USB INOVA V8 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(18, 'CABLE USB INOVA IPHONE 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(19, 'CABLE USB INOVA IPHONE 2m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(20, 'CABLE USB LUO IPHONE TC', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(21, 'CABLE USB LUO DOBLE C', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(22, 'CABLE USB COMUN V8 10cm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(23, 'CABLE USB V3 2m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(24, 'CABLR USB 2.0 3m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(25, 'CABLE USB COMUN V8 3m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(26, 'CABLE USB 2.0 COMUN 1.2m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(27, 'CABLE DE PS2 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(28, 'CABLE VGA 3m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(29, 'CABLE AUXILIAR 2m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(30, 'CABLE AUXILIAR LUO 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(31, 'CABLE DE IMPRESORA 1m ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(32, 'CABLE HDMI 1.5m ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(33, 'CABLE HDMI 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(34, 'CABLE HDMI CUANTA 15m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(35, 'CABLE HDMI CUANTA 10m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(36, 'CABLE HDMI CUANTA 3', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(37, 'CABLE AUDIO-VIDEO 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(38, 'CABLE AUDIO-VIDEO CON PLUS 1.5m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(39, 'CABLE AUDIO-VIDEO CON PLUS 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(40, 'CABLE USB UNIVER. PARA IMPRESORA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(41, 'CABLE USB IMEXX PARA IMPRESORA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(42, 'CABLE PARA MICRIFONO NAPOLI 5m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(43, 'CABLE PARA MICRIFINO 12m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(44, 'CABLE PARA MICROFONO 5m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(45, 'CABLE PARA MICROFONO HIGH QUALITY 5m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(46, 'CABLE PARA GUITARRA HIGH QUALITY 12m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(47, 'CABLE VCOMUN PARA GUITARRA 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(48, 'CABLE DE RED 5m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(49, 'CABLE DE RED 6m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(50, 'CABLE DE RED 10m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(51, 'CABLE DE RED 20m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(52, 'CABLE DE CORRIENTE UNIVERSAL 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(53, 'CABLE DE CORRIENTE UNIVERSAL 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(54, 'CABLE DE CORRIENTE UNIVERSAL 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(55, 'CARGADOR ECOPOWER V8 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(56, 'CARGADOR ECOPOWER TC', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(57, 'CARGADOR ECOPOWER IPHONE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(58, 'CARGADOR COMUN V3', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(59, 'CARGADOR CHARGER V8 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(60, 'CARGADOR BLU V8', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(61, 'FUENTE BLU CARGA NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(62, 'FUENTE SAMSUNG CARGA NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(63, 'FUENTE SAMSUNG CARGA RAPIDA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(64, 'FUENTE SAMSUNG CARGA SUPER RAPIDA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(65, 'FUENTE PARA AUTO SAMSUNG', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(66, 'FUENTE PARA AUTO ECOPOWER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(67, 'FUENTE PARA AUTO LUO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(68, 'FUENTE IPHONE CARGA RAPIDA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(69, 'FUENTE IPHONE CARGA NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(70, 'FUENTE IPHONE CARGA NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(71, 'FUENTE IPHONE CARGA NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(72, 'FUENTE XIAOMI CARGA NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(73, 'CARGADOR SAMSUNG CARGA NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(74, 'CARGADOR SAMSUNG CARGA RAPIDA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(75, 'CARGADOR LUO PARA AUTO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(76, 'CARGADOR LUO PARA AUTO USB X2', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(77, 'CARGADOR LUO CARGA NORMAL USB X3', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(78, 'CARGADOR ONLY CARGA RAPIDA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(79, 'CARGADOR UNIVERSAL LUO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(80, 'CARGADOR PORTATIL ECOPOWER DE 12000', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(81, 'CARGADOR PORTATIL ECOPOWER DE 20000', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(82, 'CARGADOR PORTATIL ECOPOWER DE 22000', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(83, 'CARGADOR MOBILE CARGA NORMAL V8', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(84, 'CARGADOR USB DESKTOP 4 PORTS 1.5m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(85, 'CARGADOR UNIVERSAL ECOPOWER P NOTE.', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(86, 'CARGADOR UNIVERSAL BAK P. NOTEB.', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(87, 'CARGADOR FINEBLUE 6 USB 7A,.', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(88, 'CARGADOR ACER P.NOTEBOOK', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(89, 'CARGADOR HP. P. NOTEBOOK ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(90, 'CARGADOR ASUS P. NOTEBOOK', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(91, 'FUENTE DE IMPRESORA HP.', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(92, 'FUENTE SATE PARA PC', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(93, 'ESTUCHE P. MEMORIA EXTERNA SATE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(94, 'MEMORIA EXTERNA SEAGATE 1TB.', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(95, 'MEMORIA EXTERNA KINTON KVR13N9S8-4', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(96, 'MEMORIA EXTERNA KINTON KVR24N17S6-4', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(97, 'DVD-R VIRGEN', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(98, 'CD-R VIRGEN', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(99, 'ESTUCHE PARA DVD', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(100, 'MEMORY SANDISK ULTRA 8 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(101, 'MEMORY SANDISK ULTRA 16 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(102, 'MEMORY SANDISK ULTRA 32 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(103, 'MEMORY SANDISK ULTRA 64 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(104, 'MEMORY SANDISK ULTRA 128 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(105, 'MEMORY KINTON 8 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(106, 'MEMORY KINTON 16 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(107, 'MEMORY KINTON 32 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(108, 'ADAPTADOR DE MEMORY ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(109, 'PENDRIVE SANDISK 8 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(110, 'PENDRIVE SANDISK 16 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(111, 'NANO PENDRIVE SANDISK 16 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(112, 'PENDRIVE SANDISK 32 GB ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(113, 'PENDRIVE SANDISK 64 GB ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(114, 'CELULAR NOKIA 106 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(115, 'CELULAR BLU Z5', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(116, 'CELULAR SAMSUNG J2 CORE 16 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(117, 'CELULAR SAMSUNG A01 CORE 16 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(118, 'CELULAR SAMSUNG A01 16 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(119, 'CELULAR SAMSUNG A10S 32 GB ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(120, 'CARGADOR ECOPOWER 9V.', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(121, 'CARGADOR COMUN 12V', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(122, 'CARGADOR TP-LINK 9V', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(123, 'CARGADOR COMUN 5V', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(124, 'CARGADOR COMUN 5V PUNTA FINA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(125, 'FUENTE MOTOROLA CARGA NORNAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(126, 'AURICULAR COMUN ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(127, 'AURICULAR SAMSUNG ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(128, 'AURICULAR SAMSUNG CON GOMA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(129, 'AURICULAR SAMSUNG REPLICA AKG', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(130, 'AURICULAR ECOPOWER EP-H126', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(131, 'AURICULAR ECOPOWER TC EP-H120', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(132, 'AURICULAR JBL TUNE 110 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(133, 'AURICULAR IPHONE NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(134, 'AURICULAR IPHONE NORMAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(135, 'AURICULAR INALAM. JBL ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(136, 'AURICULAR INALAM. XIAOMI EARBUDS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(137, 'AURICULAR INALAM. LUO LU-Y33', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(138, 'AURICULAR INALAM. LUO LU-YD79', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(139, 'AURICULAR INALAM. LUO LU-YD82', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(140, 'AURICULAR INALAM. ECOPOWER EP-117', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(141, 'AURICULAR INALAM. ECOPOWER EP-118', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(142, 'AURICULAR KOLKE GHOST', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(143, 'AUDIFONO SONY CON CABLE MDR-ZX110', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(144, 'AUDIFONO SATE CON CABLE USB. 361', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(145, 'AUDIFONO SATE CAMUFLADO PLUS 367', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(146, 'AUDIFONO SATE CON CABLE USB. PLUS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(147, 'AUDIFONO SATE GAMING PLUS 261', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(148, 'AUDIFONO KOLKE CRONO CON LUZ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(149, 'AUDIFONO SATE CON MICROFONO AE-337', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(150, 'AUDIFONO CON CABLE LUO LU-460', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(151, 'AUDIFONO INALAM. LUO NEW QC35', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(152, 'AUDIFONO INALAM. LUO LU-951', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(153, 'AUDIFONO INALAM. LUO NEW QC39', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(154, 'AUDIFONO INALAM. LUO LU-958', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(155, 'AUDIFONO INALAM. INOVA BLG-FON0002', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(156, 'AUDICONO INALAM. JBL 40 HRS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(157, 'AUDIFONO INALAM. ECOPOWER ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(158, 'AUDIFONO INALAM. JBL ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(159, 'AUDIFONO CON CABLE AKG GAMER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(160, 'RELOJ AMAZFIT ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(161, 'RELOJ XIAOMI MI BAND 4 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(162, 'RELOJ XIAOMI MI BAND 5', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(163, 'RELOJ HAYLOU ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(164, 'RELOJ SMART WATCH LUO S2', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(165, 'RELOJ SMART WATCH LUO X11', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(166, 'RELOJ SMART WATCH LUO X5', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(167, 'RELOJ SMART WATCH LUO INFANTIL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(168, 'RELOJ SMART WATCH ECOPOWER EP', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(169, 'RELOJ SMART WATCH LUO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(170, 'RELOJ MIBAND 5 REPLICA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(171, 'MALLA PARA MI BAND 5 DE GOMA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(172, 'MALLA PARA MI BAND 4 DE GOMA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(173, 'MALLA PARA MI BAND 4 DE METAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(174, 'MALLA SMART WATCH 44-42 mm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(175, 'MALLA SMART WATCH 38-40 mm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(176, 'MALLA SMART WATCH 38 mm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(177, 'MALLA SMART WATCH 44 mm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(178, 'CARGADOR MIBAND 4', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(179, 'CARGADOR MIBAND 3', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(180, 'RELOJ Q&Q Q412J202Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(181, 'RELOJ Q&Q VR52J009Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(182, 'RELOJ Q&Q QC31J105Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(183, 'RELOJ Q&Q QZ51J121Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(184, 'RELOJ Q&Q QA20J307Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(185, 'RELOJ Q&Q QA20J508Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(186, 'RELOJ Q&Q QB40J304Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(187, 'RELOJ Q&Q QZ00J335Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(188, 'RELOJ Q&Q C192J305Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(189, 'RELOJ Q&Q QA09J111Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(190, 'RELOJ Q&Q Q893J512Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(191, 'RELOJ Q&Q QA98J302Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(192, 'RELOJ Q&Q Q892J300Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(193, 'RELOJ Q&Q C215J800Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(194, 'RELOJ Q&Q Q892J312Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(195, 'RELOJ Q&Q Q892J111Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(196, 'RELOJ Q&Q Q892J522Y', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(197, 'ESTUCHE P. RELOJ DE PLASTICO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(198, 'ESTUCHE P. RELOJ TIPO CAJITA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(199, 'RELOJ INFANTIL ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(200, 'TABLET GENESIS 4G 16 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(201, 'AUDIFONO ECOPOWER CAT EARS H133', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(202, 'CALCULADORA TRULY 821B-12', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(203, 'CALCULADORA TRULY 2008A-12', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(204, 'CALCULADORA CASIO MS-20UC-GN', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(205, 'CALCULADORA CIENTIFICA CASIO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(206, 'TECLADO CON CABLE SATE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(207, 'TECLADO SATE GAMER CON LUZ ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(208, 'TECLADO INALAM. SATE CON MOUSE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(209, 'TECLADO INALAM. LOGITEC ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(210, 'MOUSE CON CABLE LOGITEC ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(211, 'MOUSE CON CABLE SATE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(212, 'MOUSE CON CABLE SATE GAMER ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(213, 'MOUSE INALAM. SATE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(214, 'MOUSE Y MOUSEPAT XTRIKE ME ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(215, 'MOUSE PAD SATE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(216, 'MINI KEYBOARD LUO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(217, 'AIR MOUSE SATE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(218, 'APUNTADOR LASER SATE  ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(219, 'GRABADORA IC ESTEREO SONY ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(220, 'CONTROL PS2 PG', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(221, 'CONTROL PS3 PG', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(222, 'CONTROL PS4 SONY ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(223, 'CONTROL INALAM.LUO PARA CELULAR ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(224, 'CONTROL INALAM. ZM-X6', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(225, 'GATILLO PARA TELEFONO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(226, 'GAMEPAD MOVIL CON MANGO K21', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(227, 'TECLADO NUMERICO SATE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(228, 'TECLADO NUMERICO MOX', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(229, 'CONTROL UNIVER. PARA AIRE ECOPOWER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(230, 'CONTROL UNIVER. PARA AIRE PROSPER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(231, 'CONTROL UNIVER. PARA TELE ECOPOWER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(232, 'CONTROL UNIVER. PARA TV SMART ECOP. ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(233, 'CONTROL P. DVD PIONEER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(234, 'CONTROL UNIVER. PARA TV R ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(235, 'CARGADOR P. PSP 5V', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(236, 'CARGADOR P. PS VENUS 5V', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(237, 'FUENTE ADAPTADOR 3 EN 1 USB HI-SPEED', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(238, 'INTERRUPTOR INTELIGENTE ECOPOWER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(239, 'TIMBRE ECOPOWER ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(240, 'MINI MASAJEADOR ELECTRICO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(241, 'MASAJEADOR ELECTRICO ONIDA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(242, 'SMART TV KIT GOOGLE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(243, 'CHROMECAST GOOGLE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(244, 'CHROMECAST TVEXPRESS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(245, 'FIRE TV STICK AMAZON', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(246, 'MI TV STICK XIAOMI ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(247, 'CONVERSOR DIGITAL SATBOX', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(248, 'WEB CAM KOLKE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(249, 'FOCO CAMARA ECOPOWER C005', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(250, 'SMART WIFI CAMARA ECOPOWER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(251, 'CAMARA DIGINAL INFANTIL LUO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(252, 'CAMARA PARA AUTO SATE A-DVR 042', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(253, 'CAMARA PARA UTO SATE A-DVR 021', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(254, 'CONTROL PARA TV BOX', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(255, 'CONTROL LARGA DISTANCIA K600 JFA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(256, 'JUEGO PS4 FIFA 21 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(257, 'JUEGO PS4 FIFA 20', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(258, 'JUEGO PS4 FIFA 19', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(259, 'PSP TUCANO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(260, 'SUPER MARIO LUO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(261, 'DVD SONY', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(262, 'DVD ECOPOWER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(263, 'DVD SATE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(264, 'AUTORADIO ECOPOWER EP-620', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(265, 'AUTORADIO ECOPOWER CON PANTALLA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(266, 'AUTORADIO PIONEER CON PANTALLA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(267, 'PARLANTE OVALADO PIONEER 69765', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(268, 'PARLANTE OVALADO B.BUSTER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(269, 'PARLANTE REDONDO PIONEER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(270, 'SPEAKER PARA PC SATE AS-677U', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(271, 'SPEAKER PARA PC SATE AS-683U', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(272, 'SPEAKER PARA PC KISONLI', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(273, 'MINI SPEAKER XIAOMI ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(274, 'SPEAKER JBL JR POP', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(275, 'SPEAKER JBL GO2 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(276, 'SPEAKER JBL GO3', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(277, 'SPEAKER JBL FLIP4', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(278, 'SPEAKER QUANTA QTSPB51', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(279, 'SPEAKER QUANTA QTSPB55', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(280, 'SPEAKER QUANTA QTSPB54', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(281, 'SPEAKER AIWA AW S21', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(282, 'SPEAKER AIWA AW X2BTR', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(283, 'SPEAKER AIWA AW AX5BT', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(284, 'SPEAKER INOVA BLG-RADOO12', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(285, 'SPEAKER INOVA BLG-RADOO13', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(286, 'SPEAKER INOVA BLG-RADOO14', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(287, 'SPEAKER ECOPOWER EP-2336', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(288, 'SPEAKER ECOPOWER EP-2377', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(289, 'SPEAKER ECOPOWER EP-2358', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(290, 'SPEAKER ECOPOWER EP-2320', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(291, 'SPEAKER ECOPOWER EP-2310', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(292, 'SPEAKER ECOPOWER EP-3831', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(293, 'SPEAKER ECOPOWER EP-2115', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(294, 'SPEAKER ECOPOWER EP-2318', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(295, 'SPEAKER ECOPOWER EP-2328', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(296, 'SPEAKER ECOPOWER EP-3854', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(297, 'SPEAKER ECOPOWER EP-2268', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(298, 'SPEAKER ECOPOWER EP-2229', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(299, 'SPEAKER ECOPOWER EP-3856', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(300, 'SPEAKER ECOPOWER EP-2261', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(301, 'RADIO ECOPOWER EP-F82', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(302, 'RADIO ECOPOWER EP-F83', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(303, 'RADIO ECOPOWER EP-F117B', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(304, 'RADIO ECOPOWER EP-F206', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(305, 'SPEAKER ECOPOWER EP-S203', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(306, 'SPEAKER LIGE-AR15QKS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(307, 'SPEAKER LIGE-AJ12DKS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(308, 'STEREO ECOPOWER EP-6802', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(309, 'SOPORTE PARA SPEAKER EP-0003', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(310, 'SOPORTE PARA TV C312 10"-55"', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(311, 'SOPORTE PARA TV LUO LU-502 10"-65"', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(312, 'SOPORTE PARA TV FIJO SATE 30"-50"', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(313, 'SOPORTE PARA TV FIJO KYD698S 23"-60"', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(314, 'SOPORTE PARA LETE SATE 14"37"', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(315, 'SOPORTE PARA PARTITURA TORNADO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(316, 'PALO DE SELFIE LUO K07', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(317, 'SOPORTE DE CELULAR P. BICI LUO LU-425', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(318, 'SOPORTE DE CELULAR P. MOTO LUO LU-413', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(319, 'SOPORTE DE CELULAR P. BICI LUO LU-414', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(320, 'SOPORTE DE CELULAR P. AUTO LUO LU-308', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(321, 'SOPORTE,CARGADOR P. AUTO LUO LU-S5', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(322, 'SOPORTE DE CELULAR P. AUTO HOLDER ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(323, 'SOPORTE PARA CELULAR LUO LU-405', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(324, 'STUCHE DEPORTIVO P. CELULAR LUO LU-YO1', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(325, 'TRIPODE LUO LU-3110 1020mm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(326, 'TRIPODE 330A 1345mm', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(327, 'AMPLIADOR DE PANTALLA INOVA SP-405', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(328, 'CINTA LED ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(329, 'ARO LED AH9976', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(330, 'ARO LED LUO LU-260 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(331, 'ARO LED LUO LIVE BEAUTY LIGNHT', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(332, 'ARO LED PARA CELULAR LUO RK-14', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(333, 'ARO LED CON DOBLE SOPORTE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(334, 'LUZ DE EMERGENCIA ECOPOWER EP-779', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(335, 'LUZ DE EMERGENCIA ECOPOWER EP-777', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(336, 'LUZ DE EMERGENCIA ECOPOWER EP-726', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(337, 'LUZ DE EMERGENCIA ECOPOWER EP-725', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(338, 'CONTROL BOOKLET PG', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(339, 'LUZ PICAPICA LED', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(340, 'VENTILADOR MEGA STAR', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(341, 'VENTILADOR DE CUELLO LUO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(342, 'ADAPTADOR PARA IPHONE LUO LU-05', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(343, 'ADAPTADOR PARA MICROFONO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(344, 'ADAPTADOR HDMI VIDEO CAPTURE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(345, 'ADAPTADOR OTG V3', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(346, 'ADAPTADOR OTG SAMSUNG V8', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(347, 'ADAPTADOR OTG SAMSUNG TC', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(348, 'ADAPTADOR MACPRO HDMI', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(349, 'ADAPTADOR HDMI A VGA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(350, 'PUERTO USB ECOPOWER EP-R004', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(351, 'PUERTO USB SATE A-HUB07', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(352, 'ADAPTADOR USB LUO TC LU-X03', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(353, 'ADAPTADOR AUXILIAR UNIPHA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(354, 'AURICULAR INALAM. ECOPOWER P. LLAMAD.', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(355, 'ADAPTADOR BLUETOOTH INOVA BTH 33', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(356, 'ADAPTADOR BLUETOOTH WIRELESS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(357, 'ADAPTADOR BLUETOOTH LUO LU-201A', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(358, 'PUERTO USB SATE A-HUB08', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(359, 'TRANSMISOR FM QUANTA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(360, 'TRANSMISOR FM LUO A31', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(361, 'TRANSMISOR FM LUO A25', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(362, 'TRANSMISOR FM LUO G18', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(363, 'CUERDA PARA GUITARRA ALYMPIA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(364, 'LINTERNA ECOPOWER EP-8277', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(365, 'LINTERNA ECOPOWER EP-8209', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(366, 'RAQUETA ELECTRICA ECOPOWER EP-8202', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(367, 'PUA PARA GUITARRA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(368, 'MICROFONO CON CABLE PHILIPS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(369, 'MICROFONO CON CABLE QUANTA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(370, 'FUENTE PARA PC SATE PRO-460', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(371, 'MICRIFONO ECOPOWER ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(372, 'MICROFONO PARA CELULAR ECOPOWER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(373, 'MICROFONO PARA CELULAR LUO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(374, 'MICROFONO PARA ESTUDIO KOLKE  ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(375, 'MICROFONO PARA ESTUDIO SATE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(376, 'EQUIPO DE TRANSMISION EN VIVO SATE  MK05', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(377, 'MEDIDOR DE PRESION ECOPOWER EP-2720', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(378, 'MEDIDOR DE PRESION MORE FITNESS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(379, 'NEBULIZADOT ECOPOWER EP-2707', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(380, 'NEBULIZADOT ECOPOWER EP-2706', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(381, 'OXIMETRO ECOPOWER EP.2714', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(382, 'HUMIDIFICADOR ECOPOWER EP-2098', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(383, 'HUMIDIFICADOR ECOPOWER EP-2099', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(384, 'HUMIDIFICADOR SATE 2,6L ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(385, 'HUMIDIFICADOR SATE 2,2L', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(386, 'HUMIDIFICADOR INOVA HM-140', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(387, 'HUMIDIFICADOR INOVA HM-141', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(388, 'BALANZA PARA COCINA ELECTRONIC', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(389, 'BALANZA PARA COCINA BAMBOO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(390, 'BALANZA DIGITAL MAXON', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(391, 'BALANZA DIGITAL LUXEP', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(392, 'ESTUFA MAXON ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(393, 'ESTUFA MEGA STAR', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(394, 'ESTUFA BRISA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(395, 'JARRA ELECTRICA NOBEL HOME 1,8 L', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(396, 'JARRA ELECTRICA NOBEL HOME 1,8 L INOX', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(397, 'JARRA ELECTRICA SPEED 1,5L ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(398, 'JARRA ELECTRICA SPEED 1,7L', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(399, 'TOSTADORA ELECTROLUX', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(400, 'PLANCHA ELECTROLUX', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(401, 'TERMO FRIO CALIENTE NOBEL HOME ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(402, 'COCINA INFRA ROJO NOBEL HOME', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(403, 'LED MAGIC ECOPOWER EP-1015 SPEAKER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(404, 'MINI LICUADORA PORTATIL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(405, 'DISPENSADOR DE AGUA AUTOMATICO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(406, 'IMPRESORA HP', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(407, 'TELEFONO INALAMBRICO PHILIPS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(408, 'TELEFONO INALAMBRICO MOTOROLA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(409, 'ETIQUETADORA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(410, 'MULTIMETRO DIGITAL(TESTE)', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(411, 'ANTENA HD DIMI', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(412, 'ANTENA INTERNA DE TV SATE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(413, 'TERMOMETRO INFRA ROJO HYUNDAI', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(414, 'PUERTO EXPANSOR HDMI SATE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(415, 'PUERTO EXPANSOR DE RED TP-LINK', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(416, 'ADAPTADOR INALM. NANO USB TP-LINK', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(417, 'REPETIDOR DE SEÑAL WIFI TP-LINK', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(418, 'REPETIDOR DE SEÑAL WIFI C.ANTENA TP-LINK', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(419, 'RUTEADOR TP-LINK 2 ANTENAS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(420, 'RUTEADOR TP-LINK 3 ANTENAS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(421, 'RUTEADOR TP-LINK 4 ANTENAS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(422, 'SECADOR D. PELO GAMA airTECHion', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(423, 'SECADOR D. PELO GAMA DIAMOND CERAMIC', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(424, 'SECADOR D. PELO DIFFUSION GAMA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(425, 'SECADOR D. PELO ONIDA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(426, 'SECADOR D. PELO PROSPER ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(427, 'SECADOR D. PELO PHILIPS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(428, 'CORTADOR DE PELO GAMA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(429, 'CORTADOR DE PELO ECOPOWER 2810', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(430, 'CORTADOR DE PELO PHILIPS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(431, 'AFEITADORA INALAM. PHILIPS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(432, 'PLANCHITA GAMA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(433, 'PLANCHITA PROSPER', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(434, 'ENRULADOR PHILIPS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(435, 'ENRULADOR GAMA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(436, 'LENTES DE SOL ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(437, 'LENTES DE SOL HIGHLIGHT', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(438, 'ESTUCHE SATE NOTEBOOK', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(439, 'ESTUCHE NOTEB HAVIT', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(440, 'CARTUCHO HP NEGRO 122', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(441, 'CARTUCHO HP COLOR  122', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(442, 'CARTUCHO HP COLOR  662', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(443, 'CARTUCHO HP NEGRO 662', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(444, 'CARTUCHO HP NEGRO 664  ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(445, 'CARTUCHO HP COLOR 664', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(446, 'CARTUCHO HP NEGRO 667', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(447, 'KIT RECARGA HP', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(448, 'TINTA ECO EPSON NEGRO 664', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(449, 'TINTA ECO EPSON AZUL 664', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(450, 'TINTA ECO EPSON AMARILLO 664', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(451, 'TINTA ECO EPSON AZUL 664', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(452, 'TINTA ECO HP N/R/A', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(453, 'TINTA ECO EPSON C/R/A', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(454, 'BATERIA J7/6 ORIGINAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(455, 'BATERIA J7/6 PARALELO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(456, 'BATERIA J700 PARALELO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(457, 'BATERIA J2 PRIME PARALELO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(458, 'BATERIA J2 PRIME ORIGINAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(459, 'BATERIA J1 ACE PARALELO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(460, 'BATERIA J200 PARALELO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(461, 'BATERIA J100 PARALELO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(462, 'BATERIA S5 MINI PARALELO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(463, 'BATERIA NOTE 2 ORIGINAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(464, 'BATERIA NOKIA ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(465, 'PILA PANASONIC AA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(466, 'PILA PANASONIC AAA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(467, 'PILA PANASONIC 12VOLT', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(468, 'PILA PANASONIC D', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(469, 'BATERIA PANASONIC 12 VOLT', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(470, 'BATERIA PHILIPS 12 VOLT', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(471, 'PILA MAXEL AA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(472, 'PILA RECARGABLE MOX AAA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(473, 'PILA MOX X2 AA C/ CARGADOR', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(474, 'PILA MOX X4 AA C/ CARGADOR', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(475, 'PILA PANAS  CR1632', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(476, 'PILA MAXEL  CR2016', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(477, 'PILA PANAS  CR2025', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(478, 'PILA TIANQIU CR1620', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(479, 'PILA TMMQ CR2016', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(480, 'PILA MAXEL CR2032', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(481, 'PILA CR1220 TIANQIU', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(482, 'PILA VARIOS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(483, 'BATERIA VAPE/LINTERNA 18650', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(484, 'BATERIA 27A 12 VOLT GPIN', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(485, 'BATERIA 23A 12 VOLT GP', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(486, 'CAPAS IPHONE ORIGINAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(487, 'CAPAS SAMSUNG ORIGINAL', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(488, 'CAPAS CARTELA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(489, 'CAPAS VARIOS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(490, 'BATERIA J5,6 ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(491, 'TABLERO LED ABIERTO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(492, 'POP', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(493, 'CELULAR SAMSUNG A21S 64 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(494, 'CELULAR SAMSUNG A21S 128 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(495, 'INSTAX MINI', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(496, 'CABLE USB ECOPOWER IPHONE 1m', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(497, 'CABLE USB IPHONE ROJO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(498, 'CELULAR SAMSUNG A02S 32 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(499, 'CELULAR SAMSUNG A02S 64 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(500, 'CELULAR REDMI 9A 32 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(501, 'MEDIDOR DE PRESION ECOPOWER 2701', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(502, 'MEDIDOR DE PRESION ECOPOWER 2700', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(503, 'LECTOR DE CODIGO ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(504, 'EXIBIDOR DE LENTE ', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(505, 'EXIBIDOR DE LENTE CHICO', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(506, 'LAMPARA ECOPOVER EP-6632', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(507, 'LAMPARA ECOPOVER EP-6330', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(508, 'ROLLO PARA ETIQUETADORA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(509, 'OXIMETRO PULSE LK87', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(510, 'OXIMETRO DR. HOUSE XY01', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(511, 'CARGADOR RECRSI TC CH-14', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(512, 'CARGADOR RECRSI V8 CH-14', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(513, 'CARGADOR RECRSI V8 TURBO  CH-24', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(514, 'CARGADOR RECRSI V8 TURBO  CH-29', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(515, 'MICROFONO ECOPOWER EP-M205', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(516, 'CARGADOR ECOPOWER DOBLE PUNTA 7068', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(517, 'CARGADOR PARA AUTO RECRSI CAR-02', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(518, 'CARGADOR PARA AUTO ECOPOWER 7036', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(519, 'MEMORY PARA PC KEEPDATA KD667N5/2G', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(520, 'ALARGUE SATE', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(521, 'PENDRIVE S3+ 32 GB', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla as.articulo_deposito
CREATE TABLE IF NOT EXISTS `articulo_deposito` (
  `idarticulo` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  PRIMARY KEY (`idarticulo`,`iddeposito`),
  KEY `FK_ARTICULO_DEPOSITO_DEPOSITO` (`iddeposito`),
  KEY `FK_ARTICULO_DEPOSITO_ARTICULO` (`idarticulo`),
  CONSTRAINT `FK_ARTICULO_DEPOSITO_ARTICULO` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ARTICULO_DEPOSITO_DEPOSITO` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.articulo_deposito: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo_deposito` DISABLE KEYS */;
REPLACE INTO `articulo_deposito` (`idarticulo`, `iddeposito`, `cantidad`) VALUES
	(1, 1, 5),
	(200, 1, 5),
	(353, 1, 0);
/*!40000 ALTER TABLE `articulo_deposito` ENABLE KEYS */;

-- Volcando estructura para tabla as.articulo_periodo
CREATE TABLE IF NOT EXISTS `articulo_periodo` (
  `idarticulo` int(11) NOT NULL,
  `idperiodo` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `costo` double NOT NULL,
  PRIMARY KEY (`idarticulo`,`idperiodo`,`idmoneda`) USING BTREE,
  KEY `FK_ARTICULO_PERIODO_PERIODO` (`idperiodo`),
  KEY `FK_ARTICULO_PERIODO_ARTICULO` (`idarticulo`),
  KEY `FK_ARTICULO_PERIODO_MONEDA` (`idmoneda`),
  CONSTRAINT `FK_ARTICULO_PERIODO_ARTICULO` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ARTICULO_PERIODO_MONEDA` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ARTICULO_PERIODO_PERIODO` FOREIGN KEY (`idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.articulo_periodo: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo_periodo` DISABLE KEYS */;
REPLACE INTO `articulo_periodo` (`idarticulo`, `idperiodo`, `idmoneda`, `costo`) VALUES
	(1, 1, 1, 5000),
	(200, 1, 1, 879500),
	(353, 1, 1, 15000);
/*!40000 ALTER TABLE `articulo_periodo` ENABLE KEYS */;

-- Volcando estructura para tabla as.banco
CREATE TABLE IF NOT EXISTS `banco` (
  `idbanco` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idpais` int(11) NOT NULL,
  PRIMARY KEY (`idbanco`) USING BTREE,
  KEY `FK_BANCO_PAIS` (`idpais`) USING BTREE,
  CONSTRAINT `FK_BANCO_PAIS` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.banco: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
REPLACE INTO `banco` (`idbanco`, `descripcion`, `idpais`) VALUES
	(1, 'FINANCIERA EL COMERCIO', 1),
	(2, 'BANCO CONTINENTAL', 1),
	(3, 'BANCO ITAU', 1);
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;

-- Volcando estructura para tabla as.caja
CREATE TABLE IF NOT EXISTS `caja` (
  `idcaja` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idcaja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.caja: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
REPLACE INTO `caja` (`idcaja`, `descripcion`) VALUES
	(1, 'CAJA GUARANIES'),
	(2, 'CAJA DOLARES');
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;

-- Volcando estructura para tabla as.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `ruc` varchar(25) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `FK_CLIENTE_TIPO_CLIENTE` (`idtipo`),
  CONSTRAINT `FK_CLIENTE_TIPO_CLIENTE` FOREIGN KEY (`idtipo`) REFERENCES `tipo_cliente` (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
REPLACE INTO `cliente` (`idcliente`, `nombre`, `apellido`, `ruc`, `telefono`, `direccion`, `estado`, `idtipo`) VALUES
	(1, 'CLIENTE', 'OCASIONAL', 'XXX', 'XXX', 'XXX', 'A', 1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla as.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `idcompra` int(11) NOT NULL,
  `numerodocumento` varchar(25) NOT NULL,
  `numerotimbrado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idtipomovimiento` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `totalneto` double NOT NULL,
  `totaliva` double NOT NULL,
  `idcuenta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `FK_COMPRA_MONEDA` (`idmoneda`),
  KEY `FK_COMPRA_DEPOSITO` (`iddeposito`),
  KEY `FK_COMPRA_TIPO_MOVIMIENTO` (`idtipomovimiento`),
  KEY `FK_COMPRA_PROVEEDOR` (`idproveedor`),
  KEY `FK_COMPRA_USUARIO` (`idusuario`),
  CONSTRAINT `FK_COMPRA_DEPOSITO` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_MONEDA` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_PROVEEDOR` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_TIPO_MOVIMIENTO` FOREIGN KEY (`idtipomovimiento`) REFERENCES `tipo_movimiento` (`idtipomovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_USUARIO` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
REPLACE INTO `compra` (`idcompra`, `numerodocumento`, `numerotimbrado`, `fecha`, `observacion`, `idmoneda`, `iddeposito`, `idtipomovimiento`, `idproveedor`, `idusuario`, `totalneto`, `totaliva`, `idcuenta`) VALUES
	(2, '001-001-0000002', 11111111, '2021-08-10', '', 1, 1, 2, 1, 1, 4020454, 402046, 0);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Volcando estructura para tabla as.compra_cuota
CREATE TABLE IF NOT EXISTS `compra_cuota` (
  `idcompra` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fechavencimiento` date NOT NULL,
  PRIMARY KEY (`idcompra`,`numero`),
  KEY `FK_COMPRA_CUOTA_COMPRA` (`idcompra`),
  CONSTRAINT `FK_COMPRA_CUOTA_COMPRA` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.compra_cuota: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_cuota` DISABLE KEYS */;
REPLACE INTO `compra_cuota` (`idcompra`, `numero`, `monto`, `fechavencimiento`) VALUES
	(2, 1, 2000000, '2021-09-10'),
	(2, 2, 2000000, '2021-10-10'),
	(2, 3, 422500, '2021-11-10');
/*!40000 ALTER TABLE `compra_cuota` ENABLE KEYS */;

-- Volcando estructura para tabla as.compra_detalle
CREATE TABLE IF NOT EXISTS `compra_detalle` (
  `idcompra` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `costo` double NOT NULL,
  `cantidad` double NOT NULL,
  `numeroitem` int(11) NOT NULL,
  `iva` double NOT NULL,
  `porcentajeiva` double NOT NULL,
  PRIMARY KEY (`idcompra`,`idarticulo`),
  KEY `FK_COMPRA_DETALLE_ARTICULO` (`idarticulo`),
  KEY `FK_COMPRA_DETALLE_COMPRA` (`idcompra`),
  CONSTRAINT `FK_COMPRA_DETALLE_ARTICULO` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_DETALLE_COMPRA` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.compra_detalle: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_detalle` DISABLE KEYS */;
REPLACE INTO `compra_detalle` (`idcompra`, `idarticulo`, `costo`, `cantidad`, `numeroitem`, `iva`, `porcentajeiva`) VALUES
	(2, 1, 4545, 5, 1, 455, 10),
	(2, 200, 799545, 5, 2, 79955, 10);
/*!40000 ALTER TABLE `compra_detalle` ENABLE KEYS */;

-- Volcando estructura para tabla as.compra_pago_cuota
CREATE TABLE IF NOT EXISTS `compra_pago_cuota` (
  `idpago` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `fechapago` date NOT NULL,
  `monto` double NOT NULL,
  `idcuenta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `numerocomprobante` varchar(25) NOT NULL,
  PRIMARY KEY (`idpago`,`idcompra`,`numero`),
  KEY `FK_COMPRA_PAGO_CUOTA_COMPRA_CUOTA` (`idcompra`,`numero`),
  KEY `FK_COMPRA_PAGO_CUOTA_USUARIO` (`idusuario`),
  KEY `FK_COMPRA_PAGO_CUOTA_CUENTA` (`idcuenta`),
  CONSTRAINT `FK_COMPRA_PAGO_CUOTA_COMPRA_CUOTA` FOREIGN KEY (`idcompra`, `numero`) REFERENCES `compra_cuota` (`idcompra`, `numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_PAGO_CUOTA_CUENTA` FOREIGN KEY (`idcuenta`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_PAGO_CUOTA_USUARIO` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.compra_pago_cuota: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_pago_cuota` DISABLE KEYS */;
REPLACE INTO `compra_pago_cuota` (`idpago`, `idcompra`, `numero`, `fechapago`, `monto`, `idcuenta`, `idusuario`, `numerocomprobante`) VALUES
	(1, 2, 1, '2021-08-10', 2000000, 1, 1, '001-001-0000450'),
	(2, 2, 2, '2021-08-10', 1000000, 1, 1, '001-001-0000500'),
	(3, 2, 2, '2021-08-10', 1000000, 1, 1, '001-001-0000501'),
	(4, 2, 3, '2021-08-10', 422500, 1, 1, '001-001-0000503');
/*!40000 ALTER TABLE `compra_pago_cuota` ENABLE KEYS */;

-- Volcando estructura para tabla as.compra_pago_cuota_anulado
CREATE TABLE IF NOT EXISTS `compra_pago_cuota_anulado` (
  `idpagoanulado` int(11) NOT NULL,
  `fechahoraanulado` datetime NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `idmotivo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `fechapago` date NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`idpagoanulado`),
  KEY `FK_COMPRA_PAGO_CUOTA_ANULADO_MOTIVO_ANULACION` (`idmotivo`),
  KEY `FK_COMPRA_PAGO_CUOTA_ANULADO_USUARIO` (`idusuario`),
  CONSTRAINT `FK_COMPRA_PAGO_CUOTA_ANULADO_MOTIVO_ANULACION` FOREIGN KEY (`idmotivo`) REFERENCES `motivo_anulacion` (`idmotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COMPRA_PAGO_CUOTA_ANULADO_USUARIO` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.compra_pago_cuota_anulado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_pago_cuota_anulado` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_pago_cuota_anulado` ENABLE KEYS */;

-- Volcando estructura para tabla as.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `idconfiguracion` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `fac_con_rec` int(11) NOT NULL,
  `fac_cre_rec` int(11) NOT NULL,
  PRIMARY KEY (`idconfiguracion`,`idsucursal`) USING BTREE,
  KEY `FK_CONFIGURACION_SUCURSAL` (`idsucursal`),
  KEY `FK_CONFIGURACION_TIPO_MOV_FCONR` (`fac_con_rec`),
  KEY `FK_CONFIGURACION_TIPO_MOV_FCRER` (`fac_cre_rec`),
  CONSTRAINT `FK_CONFIGURACION_SUCURSAL` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CONFIGURACION_TIPO_MOV_FCONR` FOREIGN KEY (`fac_con_rec`) REFERENCES `tipo_movimiento` (`idtipomovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CONFIGURACION_TIPO_MOV_FCRER` FOREIGN KEY (`fac_cre_rec`) REFERENCES `tipo_movimiento` (`idtipomovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.configuracion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
REPLACE INTO `configuracion` (`idconfiguracion`, `idsucursal`, `fac_con_rec`, `fac_cre_rec`) VALUES
	(1, 1, 1, 2);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla as.cotizacion
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `idmoneda` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tasacompra` double NOT NULL,
  `tasaventa` double NOT NULL,
  PRIMARY KEY (`fecha`,`idmoneda`) USING BTREE,
  KEY `FK_COTIZACION_MONEDA` (`idmoneda`) USING BTREE,
  CONSTRAINT `FK_COTIZACION_MONEDA` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.cotizacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
REPLACE INTO `cotizacion` (`idmoneda`, `fecha`, `tasacompra`, `tasaventa`) VALUES
	(2, '2021-07-15', 6990, 7000);
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;

-- Volcando estructura para tabla as.cuenta
CREATE TABLE IF NOT EXISTS `cuenta` (
  `idcuenta` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idbanco` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  PRIMARY KEY (`idcuenta`),
  KEY `FK_CUENTA_BANCO` (`idbanco`),
  KEY `FK_CUENTA_MONEDA` (`idmoneda`),
  CONSTRAINT `FK_CUENTA_BANCO` FOREIGN KEY (`idbanco`) REFERENCES `banco` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CUENTA_MONEDA` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.cuenta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
REPLACE INTO `cuenta` (`idcuenta`, `descripcion`, `idbanco`, `idmoneda`) VALUES
	(1, 'CAJA GUARANIES', 3, 1),
	(2, 'CAJA DOLARES', 3, 2);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;

-- Volcando estructura para tabla as.cuenta_saldo
CREATE TABLE IF NOT EXISTS `cuenta_saldo` (
  `idcuenta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `entrada` double NOT NULL,
  `salida` double NOT NULL,
  PRIMARY KEY (`idcuenta`,`fecha`),
  KEY `FK_CUENTA_SALDO_CUENTA` (`idcuenta`),
  CONSTRAINT `FK_CUENTA_SALDO_CUENTA` FOREIGN KEY (`idcuenta`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.cuenta_saldo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta_saldo` DISABLE KEYS */;
REPLACE INTO `cuenta_saldo` (`idcuenta`, `fecha`, `entrada`, `salida`) VALUES
	(1, '2021-08-10', 0, 4422500);
/*!40000 ALTER TABLE `cuenta_saldo` ENABLE KEYS */;

-- Volcando estructura para tabla as.deposito
CREATE TABLE IF NOT EXISTS `deposito` (
  `iddeposito` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`iddeposito`),
  KEY `FK_DEPOSITO_SUCURSAL` (`idsucursal`),
  CONSTRAINT `FK_DEPOSITO_SUCURSAL` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.deposito: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
REPLACE INTO `deposito` (`iddeposito`, `descripcion`, `idsucursal`) VALUES
	(1, 'SALON', 1);
/*!40000 ALTER TABLE `deposito` ENABLE KEYS */;

-- Volcando estructura para tabla as.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int(11) NOT NULL,
  `razonsocial` varchar(100) NOT NULL DEFAULT '',
  `ruc` varchar(25) NOT NULL,
  `telefono` varchar(25) DEFAULT '',
  `direccion` varchar(250) DEFAULT '',
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
REPLACE INTO `empresa` (`idempresa`, `razonsocial`, `ruc`, `telefono`, `direccion`) VALUES
	(1, 'ARANDU SYSTEMS DE ARMANDO ARIEL PERALTA MARTINEZ', '5955455-0', '(+595) 975 489 075', 'SAN ANTONIO GUAZU CASI RUTA 7 - DR. JUAN MANUEL FRUTOS');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Volcando estructura para tabla as.excepciones
CREATE TABLE IF NOT EXISTS `excepciones` (
  `idexcepcion` int(11) NOT NULL AUTO_INCREMENT,
  `datos` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idexcepcion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.excepciones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `excepciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `excepciones` ENABLE KEYS */;

-- Volcando estructura para tabla as.impuesto
CREATE TABLE IF NOT EXISTS `impuesto` (
  `idimpuesto` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `porcentaje` double NOT NULL,
  PRIMARY KEY (`idimpuesto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.impuesto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `impuesto` DISABLE KEYS */;
REPLACE INTO `impuesto` (`idimpuesto`, `descripcion`, `porcentaje`) VALUES
	(1, 'EXENTO', 0),
	(2, 'IVA 5%', 5),
	(3, 'IVA 10%', 10);
/*!40000 ALTER TABLE `impuesto` ENABLE KEYS */;

-- Volcando estructura para tabla as.linea
CREATE TABLE IF NOT EXISTS `linea` (
  `idlinea` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idlinea`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.linea: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `linea` DISABLE KEYS */;
REPLACE INTO `linea` (`idlinea`, `descripcion`) VALUES
	(1, 'LÍNEA GENERAL');
/*!40000 ALTER TABLE `linea` ENABLE KEYS */;

-- Volcando estructura para tabla as.lista_precio
CREATE TABLE IF NOT EXISTS `lista_precio` (
  `idlista` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idlista`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.lista_precio: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `lista_precio` DISABLE KEYS */;
REPLACE INTO `lista_precio` (`idlista`, `descripcion`) VALUES
	(1, 'MINORISTA'),
	(2, 'MAYORISTA'),
	(3, 'OTROS');
/*!40000 ALTER TABLE `lista_precio` ENABLE KEYS */;

-- Volcando estructura para tabla as.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `idmarca` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idmarca`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.marca: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
REPLACE INTO `marca` (`idmarca`, `descripcion`) VALUES
	(1, 'GENERICA');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para tabla as.moneda
CREATE TABLE IF NOT EXISTS `moneda` (
  `idmoneda` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `simbolo` varchar(5) NOT NULL,
  PRIMARY KEY (`idmoneda`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.moneda: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
REPLACE INTO `moneda` (`idmoneda`, `descripcion`, `simbolo`) VALUES
	(1, 'GUARANIES', 'GS'),
	(2, 'DOLARES', 'US'),
	(3, 'REAL', 'RL'),
	(4, 'PESO ARGENTINO', 'PA'),
	(5, 'EURO', 'ER'),
	(6, 'PESO URUGUAYO', 'PU');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;

-- Volcando estructura para tabla as.motivo_ajuste
CREATE TABLE IF NOT EXISTS `motivo_ajuste` (
  `idmotivo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idmotivo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.motivo_ajuste: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `motivo_ajuste` DISABLE KEYS */;
REPLACE INTO `motivo_ajuste` (`idmotivo`, `descripcion`) VALUES
	(1, 'REGISTROS DE PRUEBA'),
	(2, 'ERROR DE CARGA'),
	(3, 'ERROR DEL SISTEMA'),
	(4, 'OTROS MOTIVOS');
/*!40000 ALTER TABLE `motivo_ajuste` ENABLE KEYS */;

-- Volcando estructura para tabla as.motivo_anulacion
CREATE TABLE IF NOT EXISTS `motivo_anulacion` (
  `idmotivo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idmotivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.motivo_anulacion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `motivo_anulacion` DISABLE KEYS */;
REPLACE INTO `motivo_anulacion` (`idmotivo`, `descripcion`) VALUES
	(1, 'PRUEBAS DE USUARIO'),
	(2, 'ERROR DEL SISTEMA');
/*!40000 ALTER TABLE `motivo_anulacion` ENABLE KEYS */;

-- Volcando estructura para tabla as.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  PRIMARY KEY (`idpais`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.pais: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
REPLACE INTO `pais` (`idpais`, `descripcion`, `nacionalidad`) VALUES
	(1, 'PARAGUAY', 'PARAGUAYO/A'),
	(2, 'BRASIL', 'BRASILERO/A'),
	(3, 'URUGUAY', 'URUGUAYO/A'),
	(4, 'ARGENTINA', 'ARGENTINO/A'),
	(5, 'COLOMBIA', 'COLOMBIANO/A');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;

-- Volcando estructura para tabla as.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `idperiodo` int(11) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  PRIMARY KEY (`idperiodo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.periodo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
REPLACE INTO `periodo` (`idperiodo`, `fecha_desde`, `fecha_hasta`) VALUES
	(1, '2021-08-01', '2021-08-31');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;

-- Volcando estructura para tabla as.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `idprograma` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idprograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.programa: ~35 rows (aproximadamente)
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
REPLACE INTO `programa` (`idprograma`, `descripcion`) VALUES
	(1, 'JFrmPrograma'),
	(2, 'JFrmTipoComprobante'),
	(3, 'JFrmEmpresa'),
	(4, 'JFrmSucursal'),
	(5, 'JFrmTipoMovimiento'),
	(6, 'JFrmMoneda'),
	(7, 'JFrmTipoTarjeta'),
	(8, 'JFrmPeriodo'),
	(9, 'JFrmTipoCliente'),
	(10, 'JFrmTipoProveedor'),
	(11, 'JFrmCaja'),
	(12, 'JFrmCotizacion'),
	(13, 'JFrmBanco'),
	(14, 'JFrmCliente'),
	(15, 'JFrmProveedor'),
	(16, 'JFrmListaPrecio'),
	(17, 'JFrmMarca'),
	(18, 'JFrmLinea'),
	(19, 'JFrmSeccion'),
	(20, 'JFrmTipoArticulo'),
	(21, 'JFrmImpuesto'),
	(22, 'JFrmPais'),
	(23, 'JFrmUnidadMedida'),
	(24, 'JFrmMotivoAjuste'),
	(25, 'JFrmArticulo'),
	(26, 'JFrmUsuario'),
	(27, 'JFrmUsuarioPrograma'),
	(28, 'JFrmDeposito'),
	(29, 'JFrmTimbrado'),
	(30, 'JFrmConfiguracion'),
	(31, 'JFrmCompra'),
	(32, 'JFrmCuenta'),
	(33, 'JFrmMotivoAnulacion'),
	(34, 'JFrmPagoCuota'),
	(35, 'JFrmPagoCuotaAnulacion');
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;

-- Volcando estructura para tabla as.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `razonsocial` varchar(100) NOT NULL,
  `propietario` varchar(100) DEFAULT NULL,
  `ruc` varchar(25) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idproveedor`) USING BTREE,
  KEY `FK_PROVEEDOR_TIPO_PROVEEDOR` (`idtipo`) USING BTREE,
  CONSTRAINT `FK_PROVEEDOR_TIPO_PROVEEDOR` FOREIGN KEY (`idtipo`) REFERENCES `tipo_proveedor` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla as.proveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
REPLACE INTO `proveedor` (`idproveedor`, `razonsocial`, `propietario`, `ruc`, `telefono`, `direccion`, `estado`, `idtipo`) VALUES
	(1, 'PROVEEDOR', 'OCASIONAL', 'XXX', 'XXX', 'XXX', 'A', 3);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla as.seccion
CREATE TABLE IF NOT EXISTS `seccion` (
  `idseccion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idseccion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.seccion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
REPLACE INTO `seccion` (`idseccion`, `descripcion`) VALUES
	(1, 'SECCION GENERAL');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;

-- Volcando estructura para tabla as.sucursal
CREATE TABLE IF NOT EXISTS `sucursal` (
  `idsucursal` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL DEFAULT '',
  `telefono` varchar(25) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `idempresa` int(11) NOT NULL,
  PRIMARY KEY (`idsucursal`),
  KEY `FK_SUCURSAL_EMPRESA` (`idempresa`),
  CONSTRAINT `FK_SUCURSAL_EMPRESA` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.sucursal: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
REPLACE INTO `sucursal` (`idsucursal`, `descripcion`, `telefono`, `direccion`, `idempresa`) VALUES
	(1, 'CASA CENTRAL', '(+595) 975 489 075', 'BARRIO SAN BLAS - EX CAMPO 9', 1);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;

-- Volcando estructura para tabla as.timbrado
CREATE TABLE IF NOT EXISTS `timbrado` (
  `idtimbrado` int(11) NOT NULL,
  `establecimiento` int(11) NOT NULL,
  `puntoemision` int(11) NOT NULL,
  `timbrado` int(11) NOT NULL,
  `numeroinicial` int(11) NOT NULL,
  `numerofinal` int(11) NOT NULL,
  `fechainicial` date NOT NULL,
  `fechafinal` date NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idtipocomprobante` int(11) NOT NULL,
  PRIMARY KEY (`idtimbrado`),
  KEY `FK_TIMBRADO_CAJA` (`idcaja`),
  KEY `FK_TIMBRADO_TIPO_COMPROBANTE` (`idtipocomprobante`) USING BTREE,
  CONSTRAINT `FK_TIMBRADO_CAJA` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`idcaja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TIMBRADO_TIPO_COMPROBANTE` FOREIGN KEY (`idtipocomprobante`) REFERENCES `tipo_comprobante` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.timbrado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `timbrado` DISABLE KEYS */;
REPLACE INTO `timbrado` (`idtimbrado`, `establecimiento`, `puntoemision`, `timbrado`, `numeroinicial`, `numerofinal`, `fechainicial`, `fechafinal`, `idcaja`, `idtipocomprobante`) VALUES
	(1, 1, 1, 11223344, 1, 5000, '2021-01-01', '2021-12-31', 1, 1);
/*!40000 ALTER TABLE `timbrado` ENABLE KEYS */;

-- Volcando estructura para tabla as.tipo_articulo
CREATE TABLE IF NOT EXISTS `tipo_articulo` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.tipo_articulo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_articulo` DISABLE KEYS */;
REPLACE INTO `tipo_articulo` (`idtipo`, `descripcion`) VALUES
	(1, 'ADQUIRIDO'),
	(2, 'PRODUCIDO'),
	(3, 'OTROS');
/*!40000 ALTER TABLE `tipo_articulo` ENABLE KEYS */;

-- Volcando estructura para tabla as.tipo_cliente
CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.tipo_cliente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
REPLACE INTO `tipo_cliente` (`idtipo`, `descripcion`) VALUES
	(1, 'OCASIONAL'),
	(2, 'NO GRATA'),
	(3, 'MOROSO'),
	(4, 'FIEL');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla as.tipo_comprobante
CREATE TABLE IF NOT EXISTS `tipo_comprobante` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.tipo_comprobante: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_comprobante` DISABLE KEYS */;
REPLACE INTO `tipo_comprobante` (`idtipo`, `descripcion`) VALUES
	(1, 'FACTURA'),
	(2, 'RECIBO'),
	(3, 'NOTA DE CRÉDITO'),
	(4, 'NOTA DE DÉBITO'),
	(5, 'REMISION');
/*!40000 ALTER TABLE `tipo_comprobante` ENABLE KEYS */;

-- Volcando estructura para tabla as.tipo_movimiento
CREATE TABLE IF NOT EXISTS `tipo_movimiento` (
  `idtipomovimiento` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `abreviacion` varchar(5) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idtipomovimiento`) USING BTREE,
  KEY `FK_TIPO_MOVIMIENTO_TIPO_COMPROBANTE` (`idtipo`) USING BTREE,
  CONSTRAINT `FK_TIPO_MOVIMIENTO_TIPO_COMPROBANTE` FOREIGN KEY (`idtipo`) REFERENCES `tipo_comprobante` (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.tipo_movimiento: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_movimiento` DISABLE KEYS */;
REPLACE INTO `tipo_movimiento` (`idtipomovimiento`, `descripcion`, `abreviacion`, `idtipo`) VALUES
	(1, 'FACTURA CONTADO RECIBIDA', 'FCONR', 1),
	(2, 'FACTURA CREDITO RECIBIDA', 'FCRER', 1),
	(3, 'FACTURA CONTADO EMITIDA', 'FCONE', 1),
	(4, 'FACTURA CREDITO EMITIDA', 'FCREE', 1),
	(5, 'NOTA DE CREDITO RECIBIDA', 'NCRER', 3),
	(6, 'NOTA DE CREDITO EMITIDA', 'NCREE', 3),
	(7, 'NOTA DE DEBITO RECIBIDA', 'NDEBR', 4),
	(8, 'NOTA DE DEBITO EMITIDA', 'NDEBE', 4),
	(9, 'NOTA DE REMISION RECIBIDA', 'NREMR', 5),
	(10, 'NOTA DE REMISION EMITIDA', 'NREME', 5),
	(11, 'RECIBO DE PAGO EMITIDA', 'RPAGE', 2),
	(12, 'RECIBO DE PAGO RECIBIDA', 'RPAGR', 2);
/*!40000 ALTER TABLE `tipo_movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla as.tipo_proveedor
CREATE TABLE IF NOT EXISTS `tipo_proveedor` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.tipo_proveedor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_proveedor` DISABLE KEYS */;
REPLACE INTO `tipo_proveedor` (`idtipo`, `descripcion`) VALUES
	(1, 'LOCAL'),
	(2, 'EXTRANJERO'),
	(3, 'OTROS');
/*!40000 ALTER TABLE `tipo_proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla as.tipo_tarjeta
CREATE TABLE IF NOT EXISTS `tipo_tarjeta` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.tipo_tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_tarjeta` DISABLE KEYS */;
REPLACE INTO `tipo_tarjeta` (`idtipo`, `descripcion`) VALUES
	(1, 'TARJETA DE DÉBITO'),
	(2, 'TARJETA DE CRÉDITO');
/*!40000 ALTER TABLE `tipo_tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla as.unidad_medida
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `idunidad` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `simbolo` varchar(5) NOT NULL,
  PRIMARY KEY (`idunidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.unidad_medida: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
REPLACE INTO `unidad_medida` (`idunidad`, `descripcion`, `simbolo`) VALUES
	(1, 'UNIDADES', 'UN'),
	(2, 'KILOGRAMOS', 'KG'),
	(3, 'METROS', 'MT'),
	(4, 'LITROS', 'LT'),
	(5, 'CENTIMETROS', 'CM');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;

-- Volcando estructura para tabla as.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedula` varchar(25) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `alias` varchar(25) NOT NULL,
  `clave` varchar(256) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `FK_USUARIO_EMPRESA` (`idempresa`),
  KEY `FK_USUARIO_SUCURSAL` (`idsucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`idusuario`, `nombre`, `apellido`, `cedula`, `telefono`, `direccion`, `alias`, `clave`, `idempresa`, `idsucursal`) VALUES
	(1, 'ARMANDO ARIEL', 'PERALTA MARTINEZ', '5955455', '0975489075', 'BARRIO SAN JORGE - EX CAMPO 9', 'APERALTA', 'e3e7c47572ad938642bbc9cdcdce7e3f', 1, 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla as.usuario_programa
CREATE TABLE IF NOT EXISTS `usuario_programa` (
  `idusuario` int(11) NOT NULL,
  `idprograma` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idprograma`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.usuario_programa: 35 rows
/*!40000 ALTER TABLE `usuario_programa` DISABLE KEYS */;
REPLACE INTO `usuario_programa` (`idusuario`, `idprograma`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 35);
/*!40000 ALTER TABLE `usuario_programa` ENABLE KEYS */;

-- Volcando estructura para vista as.v_cuotas_compras
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_cuotas_compras` (
	`idproveedor` INT(11) NOT NULL,
	`idmoneda` INT(11) NOT NULL,
	`numerodocumento` VARCHAR(25) NOT NULL COLLATE 'utf8mb4_general_ci',
	`numerotimbrado` INT(11) NOT NULL,
	`total_documento` DOUBLE NOT NULL,
	`numero` INT(11) NOT NULL,
	`monto_cuota` DOUBLE NOT NULL,
	`idpago` INT(11) NULL,
	`monto_pago` DOUBLE NULL,
	`saldo` DOUBLE NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento as.P_ACT_CUENTA_SALDO
DELIMITER //
CREATE PROCEDURE `P_ACT_CUENTA_SALDO`(
	IN `xOPERACION` VARCHAR(50),
	IN `xMONTO` DOUBLE,
	IN `xIDCOMPRA_VENTA` INT,
	IN `xTABLA` VARCHAR(50)
)
BEGIN
	DECLARE V_MONTO_ENTRADA DOUBLE;
	DECLARE V_MONTO_SALIDA DOUBLE;
		
		IF xOPERACION = 'E' THEN
			SET V_MONTO_ENTRADA 	= xMONTO;
			SET V_MONTO_SALIDA	= 0;
		END IF;
		IF xOPERACION = 'S' THEN
			SET V_MONTO_ENTRADA 	= 0;
			SET V_MONTO_SALIDA	= xMONTO;
		END IF;
		CALL P_ACT_CUENTA_SALDO_INS_UPD(V_MONTO_ENTRADA, V_MONTO_SALIDA, xIDCOMPRA_VENTA, xTABLA);
END//
DELIMITER ;

-- Volcando estructura para procedimiento as.P_ACT_CUENTA_SALDO_INS_UPD
DELIMITER //
CREATE PROCEDURE `P_ACT_CUENTA_SALDO_INS_UPD`(
	IN `xMONTO_ENTRADA` DOUBLE,
	IN `xMONTO_SALIDA` DOUBLE,
	IN `xIDCOMPRA_VENTA` INT,
	IN `xTABLA` VARCHAR(50)
)
BEGIN
		DECLARE V_REGISTROS INT;
		DECLARE V_MONEDA INT;
		DECLARE V_CUENTA INT;
		DECLARE V_FECHA DATE;
		DECLARE V_MONTO_ENTRADA DOUBLE;
		DECLARE V_MONTO_SALIDA DOUBLE;
		
		IF xTABLA = 'compra' THEN
			SELECT CO.idmoneda, CO.idcuenta AS idcuenta, CO.fecha INTO V_MONEDA, V_CUENTA, V_FECHA FROM compra AS CO WHERE CO.idcompra = xIDCOMPRA_VENTA;
		END IF;
		IF xTABLA = 'compra_pago_cuota' THEN
			SELECT (SELECT CU.idmoneda FROM cuenta AS CU WHERE CU.idcuenta = CPC.idcuenta) AS idmoneda, CPC.idcuenta AS idcuenta, CPC.fechapago INTO V_MONEDA, V_CUENTA, V_FECHA 
			FROM compra_pago_cuota AS CPC WHERE CPC.idpago = xIDCOMPRA_VENTA;
		END IF;
		
		-- INSERT INTO excepciones (datos) VALUES (CONCAT(V_MONEDA,'-',V_CUENTA,'-',V_FECHA)); 
		IF V_MONEDA != 1 THEN
			SET V_MONTO_ENTRADA = ROUND(xMONTO_ENTRADA, 3);
			SET V_MONTO_SALIDA = ROUND(xMONTO_SALIDA, 3);
		ELSE
			SET V_MONTO_ENTRADA = xMONTO_ENTRADA;
			SET V_MONTO_SALIDA = xMONTO_SALIDA;
		END IF;

		-- INSERT INTO excepciones (datos) VALUES (CONCAT("V_CUENTA: ",V_CUENTA)); 
		IF V_CUENTA > 0 THEN
			
			-- SE REALIZA LA CONSULTA PARA VER SI YA EXISTE UN REGISTRO CON LA PK DE LA TABLA CUENTA_SALDO
			SELECT COUNT(*) CONTADOR INTO V_REGISTROS
			FROM cuenta_saldo AS CS
			WHERE CS.idcuenta = V_CUENTA
			AND 	CS.fecha = V_FECHA;
			
			IF V_REGISTROS = 0 THEN
				-- INSERT INTO excepciones (datos) VALUES (CONCAT("PASO 1: ")); 
				INSERT INTO cuenta_saldo
				(idcuenta, fecha, entrada, salida)
				VALUES (V_CUENTA, V_FECHA, V_MONTO_ENTRADA, V_MONTO_SALIDA);
			ELSE
				-- INSERT INTO excepciones (datos) VALUES (CONCAT("PASO 2: ")); 
				UPDATE cuenta_saldo
				SET
					entrada= entrada + V_MONTO_ENTRADA,
					salida= salida + V_MONTO_SALIDA
				WHERE idcuenta=V_CUENTA AND fecha=V_FECHA;
			END IF;
		END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento as.P_ACT_ITEM_COSTO
DELIMITER //
CREATE PROCEDURE `P_ACT_ITEM_COSTO`(
	IN `xIDARTICULO` INT,
	IN `xCOSTO` DOUBLE,
	IN `xIDCOMPRA` INT
)
BEGIN
	DECLARE V_CONTADOR INT;
	DECLARE V_PERIODO INT;
	DECLARE V_FECHA DATE;
	DECLARE V_MONEDA INT;
	DECLARE V_COSTO DOUBLE;
	
	SELECT C.fecha, C.idmoneda INTO V_FECHA, V_MONEDA FROM compra AS C WHERE C.idcompra = xIDCOMPRA;
	
	SET V_PERIODO = FP_ACT_PERIODO_INS_UPD(V_FECHA);
	
	SELECT COUNT(*) INTO V_CONTADOR FROM articulo_periodo AS P
	WHERE P.idarticulo = xIDARTICULO
	AND P.idperiodo = V_PERIODO
	AND P.idmoneda = V_MONEDA;
	
	IF V_MONEDA = 1 THEN
		SET V_COSTO = xCOSTO;
	ELSE
		SET V_COSTO = ROUND(xCOSTO, 3);
	END IF;
	
	IF V_CONTADOR = 0 THEN
		INSERT INTO articulo_periodo
		(idarticulo, idperiodo, idmoneda, costo)
		VALUES (xIDARTICULO, V_PERIODO, V_MONEDA, V_COSTO);
	ELSE
		UPDATE articulo_periodo
		SET
			costo=V_COSTO
		WHERE idarticulo=xIDARTICULO AND idperiodo=V_PERIODO AND idmoneda = V_MONEDA;
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento as.P_ACT_ITEM_DEP
DELIMITER //
CREATE PROCEDURE `P_ACT_ITEM_DEP`(
	IN `xIDARTICULO` INT,
	IN `xIDVENTA_COMPRA` INT,
	IN `xCANTIDAD` DOUBLE,
	IN `xOPERACION` VARCHAR(1),
	IN `xTABLA` VARCHAR(100)
)
BEGIN
	DECLARE V_DEPOSITO INT;
	DECLARE V_CANTIDAD_ENTRADA DOUBLE;
	DECLARE V_CANTIDAD_SALIDA DOUBLE;
	
		/*IF xTABLA = 'venta' THEN
			SELECT iddeposito INTO V_DEPOSITO FROM venta WHERE idventa = xIDVENTA_COMPRA;
		END IF;*/
		IF xTABLA = 'compra' THEN
			SELECT iddeposito INTO V_DEPOSITO FROM compra WHERE idcompra = xIDVENTA_COMPRA;
		END IF;
		
		IF xOPERACION = 'E' THEN
			SET V_CANTIDAD_ENTRADA 	= xCANTIDAD;
			SET V_CANTIDAD_SALIDA	= 0;
		END IF;
		IF xOPERACION = 'S' THEN
			SET V_CANTIDAD_ENTRADA 	= 0;
			SET V_CANTIDAD_SALIDA	= xCANTIDAD;
		END IF;
		CALL P_ACT_ITEM_DEP_INS_UPD(V_DEPOSITO, xIDARTICULO, V_CANTIDAD_ENTRADA, V_CANTIDAD_SALIDA);	
END//
DELIMITER ;

-- Volcando estructura para procedimiento as.P_ACT_ITEM_DEP_INS_UPD
DELIMITER //
CREATE PROCEDURE `P_ACT_ITEM_DEP_INS_UPD`(
	IN `xIDDEPOSITO` INT,
	IN `xIDARTICULO` INT,
	IN `xCANTIDAD_ENTRADA` DOUBLE,
	IN `xCANTIDAD_SALIDA` DOUBLE
)
BEGIN
	DECLARE V_REGISTROS INT;	
	SELECT COUNT(*) INTO V_REGISTROS FROM articulo_deposito
	WHERE idarticulo	= xIDARTICULO
	AND 	iddeposito	= xIDDEPOSITO;	
	IF V_REGISTROS = 0 THEN
		INSERT INTO articulo_deposito (idarticulo, iddeposito, cantidad)
		VALUES(xIDARTICULO, xIDDEPOSITO, xCANTIDAD_ENTRADA - xCANTIDAD_SALIDA);
	ELSE
		UPDATE articulo_deposito 
		SET cantidad = cantidad + xCANTIDAD_ENTRADA - xCANTIDAD_SALIDA
		WHERE idarticulo	= xIDARTICULO
		AND	iddeposito	= xIDDEPOSITO;
	END IF;	
END//
DELIMITER ;

-- Volcando estructura para función as.FP_ACT_PERIODO_INS_UPD
DELIMITER //
CREATE FUNCTION `FP_ACT_PERIODO_INS_UPD`(`xFECHA` DATE
) RETURNS int(11)
BEGIN
DECLARE V_CONTADOR INT;
DECLARE V_PERIODO INT;
DECLARE V_FECHA_DESDE DATE;
DECLARE V_FECHA_HASTA DATE;
DECLARE V_FECHA_INICIAL DATE;
DECLARE V_FECHA_FINAL DATE;
DECLARE V_CODIGO_NUEVO INT;
DECLARE V_CODIGO_PERIODO INT;

	SELECT COUNT(*), P.idperiodo, P.fecha_desde, P.fecha_hasta 
	INTO V_CONTADOR, V_PERIODO, V_FECHA_DESDE, V_FECHA_HASTA
	FROM periodo AS P WHERE xFECHA BETWEEN P.fecha_desde AND P.fecha_hasta;
	
	IF V_CONTADOR = 0 THEN
	
		/*OBTENER EL PRIMER Y ULTIMO DIA DEL MES EN BASE A LA FECHA DEL DOCUMENTO*/
		
		SELECT 
		CAST(DATE_FORMAT(xFECHA,'%Y-%m-01') AS DATE) PRIMER_DIA,
		LAST_DAY(xFECHA) ULTIMO_DIA
		INTO 
		V_FECHA_INICIAL,
		V_FECHA_FINAL;
		
		/*OBTENER EL NUEVO CODIGO PARA EL PERIODO*/
		select idperiodo + 1 as proximo_cod_libre
		INTO V_CODIGO_NUEVO
		from (select 0 as idperiodo
		       union all
		      select idperiodo
		        from periodo) t1
		                where not exists (select null
		                   from periodo t2
		                  where t2.idperiodo = t1.idperiodo + 1)
		                order by idperiodo
		                LIMIT 1;
		
		/*INSERTAR UN NUEVO PERIODO*/
		INSERT INTO periodo
		(idperiodo, fecha_desde, fecha_hasta)
		VALUES (V_CODIGO_NUEVO, V_FECHA_INICIAL, V_FECHA_FINAL);
		
		SET V_CODIGO_PERIODO = V_CODIGO_NUEVO;
		
	ELSE
		SET V_CODIGO_PERIODO = V_PERIODO;
	END IF;
	
	RETURN V_CODIGO_PERIODO;
END//
DELIMITER ;

-- Volcando estructura para disparador as.TR_COMPRA_DETALLE_PERIODO_COSTO
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_COMPRA_DETALLE_PERIODO_COSTO` AFTER INSERT ON `compra_detalle` FOR EACH ROW BEGIN
	CALL P_ACT_ITEM_COSTO(NEW.idarticulo, (NEW.costo + NEW.iva), NEW.idcompra);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador as.TR_COMPRA_DETALLE_STOCK_DEL
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_COMPRA_DETALLE_STOCK_DEL` BEFORE DELETE ON `compra_detalle` FOR EACH ROW BEGIN
	CALL P_ACT_ITEM_DEP(OLD.idarticulo, OLD.idcompra, OLD.cantidad, 'S', 'compra');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador as.TR_COMPRA_DETALLE_STOCK_INS
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_COMPRA_DETALLE_STOCK_INS` AFTER INSERT ON `compra_detalle` FOR EACH ROW BEGIN
	CALL P_ACT_ITEM_DEP(NEW.idarticulo, NEW.idcompra, NEW.cantidad, 'E', 'compra');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador as.TR_CUENTA_SALDO_COMPRA_DEL
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_CUENTA_SALDO_COMPRA_DEL` BEFORE DELETE ON `compra` FOR EACH ROW BEGIN
		CALL P_ACT_CUENTA_SALDO('E', (OLD.totalneto + OLD.totaliva), OLD.idcompra, 'compra');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador as.TR_CUENTA_SALDO_COMPRA_INS
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_CUENTA_SALDO_COMPRA_INS` AFTER INSERT ON `compra` FOR EACH ROW BEGIN
		CALL P_ACT_CUENTA_SALDO('S', (NEW.totalneto + NEW.totaliva), NEW.idcompra, 'compra');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador as.TR_CUENTA_SALDO_COMPRA_PAGO_CUOTA_DEL
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_CUENTA_SALDO_COMPRA_PAGO_CUOTA_DEL` BEFORE DELETE ON `compra_pago_cuota` FOR EACH ROW BEGIN
		CALL P_ACT_CUENTA_SALDO('E', OLD.monto, OLD.idcuenta, 'compra_pago_cuota');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador as.TR_CUENTA_SALDO_COMPRA_PAGO_CUOTA_INS
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_CUENTA_SALDO_COMPRA_PAGO_CUOTA_INS` AFTER INSERT ON `compra_pago_cuota` FOR EACH ROW BEGIN
		CALL P_ACT_CUENTA_SALDO('S', NEW.monto, NEW.idpago, 'compra_pago_cuota');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para vista as.v_cuotas_compras
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_cuotas_compras`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_cuotas_compras` AS SELECT
C.idproveedor, 
C.idmoneda, 
C.numerodocumento, C.numerotimbrado, (C.totalneto + C.totaliva) AS total_documento,
CC.numero, CC.monto AS monto_cuota,
CPC.idpago, CPC.monto AS monto_pago, 
CC.monto - IFNULL((SELECT sum(p.monto) FROM compra_pago_cuota AS p WHERE p.idcompra = CC.idcompra AND p.numero = CC.numero), 0) AS saldo
FROM compra_cuota AS CC
INNER JOIN compra AS C ON C.idcompra = CC.idcompra
LEFT JOIN compra_pago_cuota AS CPC ON CPC.idcompra = CC.idcompra AND CPC.numero = CC.numero
INNER JOIN proveedor AS P ON P.idproveedor = C.idproveedor
INNER JOIN moneda AS M ON M.idmoneda = C.idmoneda
WHERE CC.monto - IFNULL((SELECT sum(p.monto) FROM compra_pago_cuota AS p WHERE p.idcompra = CC.idcompra AND p.numero = CC.numero), 0) > 0 ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
