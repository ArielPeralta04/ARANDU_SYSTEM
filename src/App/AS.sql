-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.14-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para as
DROP DATABASE IF EXISTS `as`;
CREATE DATABASE IF NOT EXISTS `as` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `as`;

-- Volcando estructura para tabla as.caja
DROP TABLE IF EXISTS `caja`;
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

-- Volcando estructura para tabla as.impuesto
DROP TABLE IF EXISTS `impuesto`;
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
DROP TABLE IF EXISTS `linea`;
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
DROP TABLE IF EXISTS `lista_precio`;
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
DROP TABLE IF EXISTS `marca`;
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
DROP TABLE IF EXISTS `moneda`;
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
DROP TABLE IF EXISTS `motivo_ajuste`;
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

-- Volcando estructura para tabla as.pais
DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  PRIMARY KEY (`idpais`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.pais: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
REPLACE INTO `pais` (`idpais`, `descripcion`, `nacionalidad`) VALUES
	(1, 'PARAGUAY', 'PARAGUAYO/A'),
	(2, 'BRASIL', 'BRASILERO/A'),
	(3, 'URUGUAY', 'URUGUAYO/A'),
	(4, 'ARGENTINA', 'ARGENTINO/A'),
	(5, 'COLOMBIA', 'COLOMBIANO/A');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;

-- Volcando estructura para tabla as.seccion
DROP TABLE IF EXISTS `seccion`;
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

-- Volcando estructura para tabla as.tipo_articulo
DROP TABLE IF EXISTS `tipo_articulo`;
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
DROP TABLE IF EXISTS `tipo_cliente`;
CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.tipo_cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
REPLACE INTO `tipo_cliente` (`idtipo`, `descripcion`) VALUES
	(1, 'OCASIONAL'),
	(2, 'NO GRATA'),
	(3, 'MOROSO'),
	(4, 'FIEL');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla as.unidad_medida
DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `idunidad` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `simbolo` varchar(5) NOT NULL,
  PRIMARY KEY (`idunidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.unidad_medida: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
REPLACE INTO `unidad_medida` (`idunidad`, `descripcion`, `simbolo`) VALUES
	(1, 'UNIDADES', 'UN'),
	(2, 'KILOGRAMOS', 'KG'),
	(3, 'METROS', 'MT'),
	(4, 'LITROS', 'LT'),
	(5, 'CENTIMETROS', 'CM');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
