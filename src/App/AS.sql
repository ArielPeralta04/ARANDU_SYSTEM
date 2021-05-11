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

-- Volcando datos para la tabla as.articulo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
REPLACE INTO `articulo` (`idarticulo`, `descripcion`, `referencia`, `codigoalfanumerico`, `codigobarra`, `estado`, `observacion`, `idmarca`, `idlinea`, `idseccion`, `idtipo`, `idunidad`, `idimpuesto`) VALUES
	(1, 'CARAMELO CRISTAL', 'MENTA ARCOR', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(2, 'REMEDIO PARA MATE MANZANILLA 15GR', 'MATRICARIA - CHAMOMILLA - FLOR', '', '7840595001616', 'A', '', 1, 1, 1, 1, 1, 3);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla as.banco
CREATE TABLE IF NOT EXISTS `banco` (
  `idbanco` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idpais` int(11) NOT NULL,
  PRIMARY KEY (`idbanco`) USING BTREE,
  KEY `FK_BANCO_PAIS` (`idpais`) USING BTREE,
  CONSTRAINT `FK_BANCO_PAIS` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.banco: ~4 rows (aproximadamente)
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

-- Volcando datos para la tabla as.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
REPLACE INTO `cliente` (`idcliente`, `nombre`, `apellido`, `ruc`, `telefono`, `direccion`, `estado`, `idtipo`) VALUES
	(1, 'CLIENTE', 'OCASIONAL', 'XXX', 'XXX', 'XXX', 'A', 1),
	(2, 'ARIEL', 'PERALTA', '5955455-0', '', '', 'A', 1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla as.cotizacion
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `idmoneda` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tasa` double NOT NULL,
  PRIMARY KEY (`fecha`,`idmoneda`) USING BTREE,
  KEY `FK_COTIZACION_MONEDA` (`idmoneda`) USING BTREE,
  CONSTRAINT `FK_COTIZACION_MONEDA` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.cotizacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;

-- Volcando estructura para tabla as.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int(11) NOT NULL,
  `razonsocial` varchar(100) NOT NULL DEFAULT '',
  `ruc` varchar(25) NOT NULL,
  `telefono` varchar(25) DEFAULT '',
  `direccion` varchar(250) DEFAULT '',
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.empresa: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
REPLACE INTO `empresa` (`idempresa`, `razonsocial`, `ruc`, `telefono`, `direccion`) VALUES
	(1, 'ARANDU SYSTEMS', '5955455-0', '(+595) 975 489 075', 'SAN BLAS - DR. J. EULOGIO ESTIGARRIBIA');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

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

-- Volcando datos para la tabla as.linea: ~1 rows (aproximadamente)
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

-- Volcando datos para la tabla as.lista_precio: ~2 rows (aproximadamente)
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

-- Volcando datos para la tabla as.marca: ~1 rows (aproximadamente)
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

-- Volcando datos para la tabla as.periodo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
REPLACE INTO `periodo` (`idperiodo`, `fecha_desde`, `fecha_hasta`) VALUES
	(1, '2021-05-01', '2021-05-31');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;

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

-- Volcando datos para la tabla as.proveedor: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
REPLACE INTO `proveedor` (`idproveedor`, `razonsocial`, `propietario`, `ruc`, `telefono`, `direccion`, `estado`, `idtipo`) VALUES
	(1, 'PROVEEDOR', 'OCASIONAL', 'XXX', 'XXX', 'XXX', 'A', 3),
	(2, 'CENTURY SYSTEMS S.R.L.', 'KURT FALK', '', '', '', 'A', 1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla as.seccion
CREATE TABLE IF NOT EXISTS `seccion` (
  `idseccion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idseccion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.seccion: ~1 rows (aproximadamente)
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
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;

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

-- Volcando datos para la tabla as.tipo_tarjeta: ~2 rows (aproximadamente)
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
