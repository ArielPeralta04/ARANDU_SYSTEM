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


-- Volcando estructura de base de datos para tesis
CREATE DATABASE IF NOT EXISTS `tesis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tesis`;

-- Volcando estructura para tabla tesis.ajuste
CREATE TABLE IF NOT EXISTS `ajuste` (
  `idajuste` int(11) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idmotivo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  PRIMARY KEY (`idajuste`),
  KEY `fk_ajuste_deposito1` (`iddeposito`),
  KEY `fk_ajuste_motivo_ajuste1` (`idmotivo`),
  KEY `fk_ajuste_usuario1` (`idusuario`),
  CONSTRAINT `fk_ajuste_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ajuste_motivo_ajuste1` FOREIGN KEY (`idmotivo`) REFERENCES `motivo_ajuste` (`idmotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ajuste_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.ajuste: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ajuste` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajuste` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.apertura
CREATE TABLE IF NOT EXISTS `apertura` (
  `idapertura` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  PRIMARY KEY (`idapertura`),
  KEY `fk_apertura_caja1` (`idcaja`),
  KEY `fk_apertura_usuario1` (`idusuario`),
  CONSTRAINT `fk_apertura_caja1` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`idcaja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_apertura_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.apertura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `apertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `apertura` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.banco
CREATE TABLE IF NOT EXISTS `banco` (
  `idbanco` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idpais` int(11) NOT NULL,
  PRIMARY KEY (`idbanco`),
  KEY `fk_banco_pais1` (`idpais`),
  CONSTRAINT `fk_banco_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.banco: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
REPLACE INTO `banco` (`idbanco`, `descripcion`, `idpais`) VALUES
	(1, 'BANCO DE FOMENTO', 1),
	(2, 'BANCO CONTINENTAL', 1),
	(3, 'BANCO ITAU', 1);
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.caja
CREATE TABLE IF NOT EXISTS `caja` (
  `idcaja` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idcaja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.caja: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
REPLACE INTO `caja` (`idcaja`, `descripcion`) VALUES
	(1, 'CAJA GUARANIES');
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cheque
CREATE TABLE IF NOT EXISTS `cheque` (
  `numerocheque` varchar(15) NOT NULL,
  `monto` double NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`numerocheque`,`idbanco`),
  KEY `fk_cheque_banco1` (`idbanco`),
  CONSTRAINT `fk_cheque_banco1` FOREIGN KEY (`idbanco`) REFERENCES `banco` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cheque: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheque` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cierre
CREATE TABLE IF NOT EXISTS `cierre` (
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idapertura` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idapertura`),
  KEY `fk_cierre_usuario` (`idusuario`),
  CONSTRAINT `fk_cierre_apertura1` FOREIGN KEY (`idapertura`) REFERENCES `apertura` (`idapertura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cierre_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cierre: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cierre` DISABLE KEYS */;
/*!40000 ALTER TABLE `cierre` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedula` varchar(15) DEFAULT NULL,
  `ruc` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `fechaingreso` date NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fk_cliente_tipo_cliente1` (`idtipo`),
  CONSTRAINT `fk_cliente_tipo_cliente1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_cliente` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cliente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
REPLACE INTO `cliente` (`idcliente`, `nombre`, `apellido`, `cedula`, `ruc`, `celular`, `direccion`, `fechanacimiento`, `estado`, `fechaingreso`, `idtipo`) VALUES
	(1, 'CLIENTE', 'OCASIONAL', 'XXX', 'XXX', 'XXX', 'XXX', '1998-01-01', 'A', '2020-12-17', 1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cobro_cuota_venta
CREATE TABLE IF NOT EXISTS `cobro_cuota_venta` (
  `idcobro` int(11) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `monto` double NOT NULL,
  `numerocuota` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  PRIMARY KEY (`idcobro`,`numerocuota`,`idventa`),
  KEY `fk_cobro_cuota_venta_cuota_venta1` (`numerocuota`,`idventa`),
  CONSTRAINT `fk_cobro_cuota_venta_cuota_venta1` FOREIGN KEY (`numerocuota`, `idventa`) REFERENCES `cuota_venta` (`numerocuota`, `idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cobro_cuota_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cobro_cuota_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobro_cuota_venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cobro_venta_cheque
CREATE TABLE IF NOT EXISTS `cobro_venta_cheque` (
  `numerocuota` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `numerocheque` varchar(15) NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`numerocuota`,`idventa`,`numerocheque`,`idbanco`),
  KEY `fk_cobro_venta_cheque_cheque1` (`numerocheque`,`idbanco`),
  CONSTRAINT `fk_cobro_venta_cheque_cheque1` FOREIGN KEY (`numerocheque`, `idbanco`) REFERENCES `cheque` (`numerocheque`, `idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobro_venta_cheque_cuota_venta1` FOREIGN KEY (`numerocuota`, `idventa`) REFERENCES `cuota_venta` (`numerocuota`, `idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cobro_venta_cheque: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cobro_venta_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobro_venta_cheque` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cobro_venta_tarjeta
CREATE TABLE IF NOT EXISTS `cobro_venta_tarjeta` (
  `numerocuota` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `numerocomprobante` varchar(15) NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`numerocuota`,`idventa`,`numerocomprobante`,`idbanco`),
  KEY `fk_cobro_venta_tarjeta_tarjeta1` (`numerocomprobante`,`idbanco`),
  CONSTRAINT `fk_cobro_venta_tarjeta_cuota_venta1` FOREIGN KEY (`numerocuota`, `idventa`) REFERENCES `cuota_venta` (`numerocuota`, `idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobro_venta_tarjeta_tarjeta1` FOREIGN KEY (`numerocomprobante`, `idbanco`) REFERENCES `tarjeta` (`numerocomprobante`, `idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cobro_venta_tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cobro_venta_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobro_venta_tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `idcompra` int(11) NOT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idproveedor` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `numerotimbrado` varchar(10) NOT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `fk_compra_deposito1` (`iddeposito`),
  KEY `fk_compra_moneda1` (`idmoneda`),
  KEY `fk_compra_proveedor1` (`idproveedor`),
  KEY `fk_compra_usuario1` (`idusuario`),
  KEY `fk_compra_tipo` (`idtipo`) USING BTREE,
  CONSTRAINT `fk_compra_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_moneda1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_tipo` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.compra_auditoria
CREATE TABLE IF NOT EXISTS `compra_auditoria` (
  `idcompra` int(11) NOT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `proveedor` varchar(100) NOT NULL DEFAULT '',
  `ruc` varchar(12) NOT NULL DEFAULT '',
  `moneda` varchar(50) NOT NULL DEFAULT '',
  `deposito` varchar(50) NOT NULL DEFAULT '',
  `usuario` varchar(100) NOT NULL DEFAULT '',
  `tipo_movimiento` varchar(100) NOT NULL,
  `numerotimbrado` varchar(10) NOT NULL,
  PRIMARY KEY (`idcompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla tesis.compra_auditoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_auditoria` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `idempresa` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `fac_con_emit` int(11) DEFAULT NULL,
  `fac_cre_emit` int(11) DEFAULT NULL,
  `fac_con_reci` int(11) DEFAULT NULL,
  `fac_cre_reci` int(11) DEFAULT NULL,
  `not_cre_emit` int(11) DEFAULT NULL,
  `not_cre_reci` int(11) DEFAULT NULL,
  `not_deb_emit` int(11) DEFAULT NULL,
  `not_deb_reci` int(11) DEFAULT NULL,
  `not_rem_emit` int(11) DEFAULT NULL,
  `not_rem_reci` int(11) DEFAULT NULL,
  `cliente_ocasional` int(11) DEFAULT NULL,
  `dep_venta_supermercado` int(11) DEFAULT NULL,
  `rec_cob_emit` int(11) DEFAULT NULL,
  `rec_cob_reci` int(11) DEFAULT NULL,
  PRIMARY KEY (`idempresa`,`idsucursal`),
  KEY `FK_configuracion_cliente` (`cliente_ocasional`),
  KEY `FK_configuracion_deposito` (`dep_venta_supermercado`),
  KEY `FK_configuracion_sucursal` (`idsucursal`),
  KEY `FK_configuracion_tipo_movimiento_1` (`fac_con_emit`),
  KEY `FK_configuracion_tipo_movimiento_10` (`not_rem_reci`),
  KEY `FK_configuracion_tipo_movimiento_2` (`fac_cre_emit`),
  KEY `FK_configuracion_tipo_movimiento_3` (`fac_con_reci`),
  KEY `FK_configuracion_tipo_movimiento_4` (`fac_cre_reci`),
  KEY `FK_configuracion_tipo_movimiento_5` (`not_cre_emit`),
  KEY `FK_configuracion_tipo_movimiento_6` (`not_cre_reci`),
  KEY `FK_configuracion_tipo_movimiento_7` (`not_deb_emit`),
  KEY `FK_configuracion_tipo_movimiento_8` (`not_deb_reci`),
  KEY `FK_configuracion_tipo_movimiento_9` (`not_rem_emit`),
  KEY `FK_configuracion_tipo_movimiento_11` (`rec_cob_emit`),
  KEY `FK_configuracion_tipo_movimiento_12` (`rec_cob_reci`) USING BTREE,
  CONSTRAINT `FK_configuracion_cliente` FOREIGN KEY (`cliente_ocasional`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_deposito` FOREIGN KEY (`dep_venta_supermercado`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_empresa` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_sucursal` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_1` FOREIGN KEY (`fac_con_emit`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_10` FOREIGN KEY (`not_rem_reci`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_11` FOREIGN KEY (`rec_cob_emit`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_12` FOREIGN KEY (`rec_cob_reci`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_2` FOREIGN KEY (`fac_cre_emit`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_3` FOREIGN KEY (`fac_con_reci`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_4` FOREIGN KEY (`fac_cre_reci`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_5` FOREIGN KEY (`not_cre_emit`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_6` FOREIGN KEY (`not_cre_reci`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_7` FOREIGN KEY (`not_deb_emit`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_8` FOREIGN KEY (`not_deb_reci`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_configuracion_tipo_movimiento_9` FOREIGN KEY (`not_rem_emit`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.configuracion: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cotizacion
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `fecha` date NOT NULL,
  `tasa` double NOT NULL,
  `idmoneda` int(11) NOT NULL,
  PRIMARY KEY (`fecha`,`idmoneda`),
  KEY `fk_cotizacion_moneda1` (`idmoneda`),
  CONSTRAINT `fk_cotizacion_moneda1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cotizacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
REPLACE INTO `cotizacion` (`fecha`, `tasa`, `idmoneda`) VALUES
	('2021-04-14', 7000, 2);
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cuenta_bancaria
CREATE TABLE IF NOT EXISTS `cuenta_bancaria` (
  `numerocuenta` varchar(15) NOT NULL,
  `oficialcredito` varchar(100) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `saldo` double NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`numerocuenta`,`idbanco`),
  KEY `fk_cuenta_bancaria_banco1` (`idbanco`),
  CONSTRAINT `fk_cuenta_bancaria_banco1` FOREIGN KEY (`idbanco`) REFERENCES `banco` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cuenta_bancaria: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta_bancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta_bancaria` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cuota_compra
CREATE TABLE IF NOT EXISTS `cuota_compra` (
  `numerocuota` int(11) NOT NULL,
  `monto` double NOT NULL,
  `vencimiento` date NOT NULL,
  `idcompra` int(11) NOT NULL,
  PRIMARY KEY (`numerocuota`,`idcompra`),
  KEY `fk_cuota_compra_compra1` (`idcompra`),
  CONSTRAINT `fk_cuota_compra_compra1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cuota_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuota_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuota_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.cuota_venta
CREATE TABLE IF NOT EXISTS `cuota_venta` (
  `numerocuota` int(11) NOT NULL,
  `monto` double NOT NULL,
  `vencimiento` date NOT NULL,
  `idventa` int(11) NOT NULL,
  PRIMARY KEY (`numerocuota`,`idventa`),
  KEY `fk_cuota_venta_venta1` (`idventa`),
  CONSTRAINT `fk_cuota_venta_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.cuota_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuota_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuota_venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.deposito
CREATE TABLE IF NOT EXISTS `deposito` (
  `iddeposito` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`iddeposito`),
  KEY `fk_deposito_sucursal1` (`idsucursal`),
  CONSTRAINT `fk_deposito_sucursal1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.deposito: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
REPLACE INTO `deposito` (`iddeposito`, `descripcion`, `idsucursal`) VALUES
	(1, 'CENTRAL', 1);
/*!40000 ALTER TABLE `deposito` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.deposito_bancario
CREATE TABLE IF NOT EXISTS `deposito_bancario` (
  `numerocomprobante` varchar(15) NOT NULL,
  `encargado` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `monto` double NOT NULL,
  `numerocuenta` varchar(15) NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`numerocomprobante`,`numerocuenta`,`idbanco`),
  KEY `fk_deposito_bancario_cuenta_bancaria1` (`numerocuenta`,`idbanco`),
  CONSTRAINT `fk_deposito_bancario_cuenta_bancaria1` FOREIGN KEY (`numerocuenta`, `idbanco`) REFERENCES `cuenta_bancaria` (`numerocuenta`, `idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.deposito_bancario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `deposito_bancario` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposito_bancario` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_ajuste
CREATE TABLE IF NOT EXISTS `detalle_ajuste` (
  `cantidad` double NOT NULL,
  `cantidadAnterior` double NOT NULL,
  `idajuste` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idajuste`,`iditem`),
  KEY `fk_detalle_ajuste_item1` (`iditem`),
  CONSTRAINT `fk_detalle_ajuste_ajuste1` FOREIGN KEY (`idajuste`) REFERENCES `ajuste` (`idajuste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ajuste_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_ajuste: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_ajuste` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ajuste` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_compra
CREATE TABLE IF NOT EXISTS `detalle_compra` (
  `cantidad` double NOT NULL,
  `costo` double NOT NULL,
  `idcompra` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`,`iditem`),
  KEY `fk_detalle_compra_item1` (`iditem`),
  CONSTRAINT `fk_detalle_compra_compra1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_compra_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_compra_auditoria
CREATE TABLE IF NOT EXISTS `detalle_compra_auditoria` (
  `cantidad` double NOT NULL,
  `costo` double NOT NULL,
  `idcompra` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  `item_descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`iditem`,`idcompra`) USING BTREE,
  KEY `fk_detalle_compra_auditoria_item` (`iditem`) USING BTREE,
  CONSTRAINT `detalle_compra_auditoria_item` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla tesis.detalle_compra_auditoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_compra_auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra_auditoria` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_nota_credito_compra
CREATE TABLE IF NOT EXISTS `detalle_nota_credito_compra` (
  `cantidad` double NOT NULL,
  `costo` double NOT NULL,
  `idnota` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`iditem`,`idnota`),
  KEY `fk_detalle_nota_credito_compra_nota_credito_compra1` (`idnota`),
  CONSTRAINT `fk_detalle_nota_credito_compra_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_nota_credito_compra_nota_credito_compra1` FOREIGN KEY (`idnota`) REFERENCES `nota_credito_compra` (`idnota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_nota_credito_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_nota_credito_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_nota_credito_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_nota_credito_venta
CREATE TABLE IF NOT EXISTS `detalle_nota_credito_venta` (
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `idnota` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idnota`,`iditem`),
  KEY `fk_detalle_nota_credito_venta_item1` (`iditem`),
  CONSTRAINT `fk_detalle_nota_credito_venta_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_nota_credito_venta_nota_credito_venta1` FOREIGN KEY (`idnota`) REFERENCES `nota_credito_venta` (`idnota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_nota_credito_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_nota_credito_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_nota_credito_venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_nota_debito_compra
CREATE TABLE IF NOT EXISTS `detalle_nota_debito_compra` (
  `cantidad` double NOT NULL,
  `costo` double NOT NULL,
  `idnota` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`iditem`,`idnota`) USING BTREE,
  KEY `fk_detalle_nota_debito_compra_nota_debito_compra1` (`idnota`) USING BTREE,
  CONSTRAINT `FK_detalle_nota_debito_compra_nota_debito_compra` FOREIGN KEY (`idnota`) REFERENCES `nota_debito_compra` (`idnota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalle_nota_debito_compra_ibfk_1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla tesis.detalle_nota_debito_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_nota_debito_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_nota_debito_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_nota_remision_compra
CREATE TABLE IF NOT EXISTS `detalle_nota_remision_compra` (
  `cantidad` double NOT NULL,
  `idnota` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idnota`,`iditem`),
  KEY `fk_detalle_nota_remision_compra_item1` (`iditem`),
  CONSTRAINT `fk_detalle_nota_remision_compra_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_nota_remision_compra_nota_remision_compra1` FOREIGN KEY (`idnota`) REFERENCES `nota_remision_compra` (`idnota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_nota_remision_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_nota_remision_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_nota_remision_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_orden_compra
CREATE TABLE IF NOT EXISTS `detalle_orden_compra` (
  `cantidad` double NOT NULL,
  `costo` double NOT NULL,
  `idorden` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idorden`,`iditem`),
  KEY `fk_detalle_orden_compra_item1` (`iditem`),
  CONSTRAINT `fk_detalle_orden_compra_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_orden_compra_orden_compra1` FOREIGN KEY (`idorden`) REFERENCES `orden_compra` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_orden_compra: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_orden_compra` DISABLE KEYS */;
REPLACE INTO `detalle_orden_compra` (`cantidad`, `costo`, `idorden`, `iditem`) VALUES
	(5, 30000, 1, 6),
	(5, 31000, 1, 8),
	(5, 35000, 1, 9);
/*!40000 ALTER TABLE `detalle_orden_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_pedido_compra
CREATE TABLE IF NOT EXISTS `detalle_pedido_compra` (
  `cantidad` double NOT NULL,
  `costo` double NOT NULL,
  `idpedido` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`,`iditem`),
  KEY `fk_detalle_pedido_compra_item1` (`iditem`),
  CONSTRAINT `fk_detalle_pedido_compra_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_compra_pedido_compra1` FOREIGN KEY (`idpedido`) REFERENCES `pedido_compra` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_pedido_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_pedido_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_pedido_venta
CREATE TABLE IF NOT EXISTS `detalle_pedido_venta` (
  `precio` double NOT NULL,
  `cantidad` double NOT NULL,
  `idpedido` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`,`iditem`),
  KEY `fk_detalle_pedido_venta_item1` (`iditem`),
  CONSTRAINT `fk_detalle_pedido_venta_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_venta_pedido_venta1` FOREIGN KEY (`idpedido`) REFERENCES `pedido_venta` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_pedido_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_pedido_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido_venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `idventa` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  PRIMARY KEY (`idventa`,`iditem`),
  KEY `fk_detalle_venta_item1` (`iditem`),
  CONSTRAINT `fk_detalle_venta_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.detalle_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int(11) NOT NULL,
  `razonsocial` varchar(100) NOT NULL,
  `ruc` varchar(12) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `propietario` varchar(100) NOT NULL,
  `cedulapropietario` varchar(10) NOT NULL,
  `telefonopropietario` varchar(15) NOT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.empresa: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
REPLACE INTO `empresa` (`idempresa`, `razonsocial`, `ruc`, `telefono`, `direccion`, `propietario`, `cedulapropietario`, `telefonopropietario`) VALUES
	(1, 'ARANDU SYSTEMS', '5955455-0', '0975489075', 'SAN BLAS', 'ARMANDO ARIEL PERALTA MARTINEZ', '5955455', '0975489075');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.extraccion_apertura
CREATE TABLE IF NOT EXISTS `extraccion_apertura` (
  `idextraccion` int(11) NOT NULL,
  `encargado` varchar(100) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `motivo` varchar(250) NOT NULL,
  `idapertura` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idextraccion`),
  KEY `FK_extracion_apertura_apertura` (`idapertura`),
  KEY `FK_extracion_apertura_usuario` (`idusuario`),
  CONSTRAINT `FK_extracion_apertura_apertura` FOREIGN KEY (`idapertura`) REFERENCES `apertura` (`idapertura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_extracion_apertura_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.extraccion_apertura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `extraccion_apertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `extraccion_apertura` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.extraccion_bancaria
CREATE TABLE IF NOT EXISTS `extraccion_bancaria` (
  `numerocomprobante` varchar(15) NOT NULL,
  `encargado` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `monto` double NOT NULL,
  `numerocuenta` varchar(15) NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`numerocomprobante`,`numerocuenta`,`idbanco`),
  KEY `FK_extraccion_bancaria_cuenta_bancaria` (`numerocuenta`,`idbanco`),
  CONSTRAINT `FK_extraccion_bancaria_cuenta_bancaria` FOREIGN KEY (`numerocuenta`, `idbanco`) REFERENCES `cuenta_bancaria` (`numerocuenta`, `idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla tesis.extraccion_bancaria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `extraccion_bancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `extraccion_bancaria` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.impuesto
CREATE TABLE IF NOT EXISTS `impuesto` (
  `idimpuesto` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `valor_calculo` double NOT NULL,
  PRIMARY KEY (`idimpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.impuesto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `impuesto` DISABLE KEYS */;
REPLACE INTO `impuesto` (`idimpuesto`, `descripcion`, `valor_calculo`) VALUES
	(1, 'EXENTO', 0),
	(2, 'IVA 5%', 21),
	(3, 'IVA 10%', 11);
/*!40000 ALTER TABLE `impuesto` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.item
CREATE TABLE IF NOT EXISTS `item` (
  `iditem` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `codigobarra` varchar(20) DEFAULT NULL,
  `codigoalfanumerico` varchar(20) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `idimpuesto` int(11) NOT NULL,
  `idpais` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL,
  `idseccion` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  PRIMARY KEY (`iditem`),
  KEY `fk_item_impuesto1` (`idimpuesto`),
  KEY `fk_item_linea1` (`idlinea`),
  KEY `fk_item_marca1` (`idmarca`),
  KEY `fk_item_pais1` (`idpais`),
  KEY `fk_item_seccion1` (`idseccion`),
  KEY `fk_item_tipo_item1` (`idtipo`),
  KEY `fk_item_unidad_medida1` (`idunidad`),
  CONSTRAINT `fk_item_impuesto1` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`idimpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_linea1` FOREIGN KEY (`idlinea`) REFERENCES `linea` (`idlinea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_marca1` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_seccion1` FOREIGN KEY (`idseccion`) REFERENCES `seccion` (`idseccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_tipo_item1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_item` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_unidad_medida1` FOREIGN KEY (`idunidad`) REFERENCES `unidad_medida` (`idunidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.item: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
REPLACE INTO `item` (`iditem`, `descripcion`, `codigobarra`, `codigoalfanumerico`, `observacion`, `estado`, `idtipo`, `idmarca`, `idimpuesto`, `idpais`, `idlinea`, `idseccion`, `idunidad`) VALUES
	(1, 'HARINA FIDERA TIPO 00 50 KG', '7840058000675', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(2, 'HARINA DE TRIGO 1 KG 000', '', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(3, 'HARINA DE TRIGO 1 KG 0000', '', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(4, 'HARINA DE TRIGO 5 KG 000', '44445555', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(5, 'HARINA DE TRIGO 5 KG 0000', '', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(6, 'HARINA DE TRIGO 50 KG 000 PANADERA', '', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(7, 'HARINA DE TRIGO 50 KG 0000', '', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(8, 'HARINA DE TRIGO 50 KG 000 FIDERA', '', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(9, 'HARINA DE 50 KG 0000 HILAGRO', '', '', '', 'A', 1, 1, 3, 1, 4, 3, 1),
	(10, 'HELADERA TOKYO HETOK45 311L 2P', '', '', '', 'A', 1, 10, 3, 1, 6, 4, 1),
	(11, 'HELADERA TOKYO 341L 2 PUERTAS FRIO SECO INOX C/DISPENSER', '', '', '', 'A', 1, 10, 3, 1, 6, 4, 1),
	(12, 'CONGELADOR HORIZONTAL TOKYO TCON230CVIC 200L 1 TAPA', '', '', '', 'A', 1, 10, 3, 1, 6, 5, 1),
	(13, 'TELEFONO CELULAR XIAOMI REDMI 9 32Gb GRIS', '', '', '', 'A', 1, 8, 3, 1, 1, 1, 1),
	(14, 'TELEFONO CELULAR XIAOMI REDMI 9C 32Gb AZUL', '', '', '', 'A', 1, 8, 3, 1, 1, 1, 1),
	(15, 'TELEFONO CELULAR XIAOMI REDMI 9C 32Gb GRIS', '', '', '', 'A', 1, 8, 3, 1, 1, 1, 1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.item_deposito
CREATE TABLE IF NOT EXISTS `item_deposito` (
  `cantidad` double NOT NULL,
  `iditem` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  PRIMARY KEY (`iditem`,`iddeposito`),
  KEY `fk_item_deposito_deposito1` (`iddeposito`),
  CONSTRAINT `fk_item_deposito_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_deposito_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.item_deposito: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `item_deposito` DISABLE KEYS */;
REPLACE INTO `item_deposito` (`cantidad`, `iditem`, `iddeposito`) VALUES
	(0, 1, 1),
	(0, 3, 1),
	(0, 4, 1),
	(0, 5, 1),
	(0, 6, 1),
	(0, 7, 1),
	(0, 9, 1);
/*!40000 ALTER TABLE `item_deposito` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.item_lista
CREATE TABLE IF NOT EXISTS `item_lista` (
  `porcentajedescuento` double NOT NULL,
  `precio` double NOT NULL,
  `iditem` int(11) NOT NULL,
  `idlista` int(11) NOT NULL,
  PRIMARY KEY (`iditem`,`idlista`),
  KEY `fk_item_lista_lista_precio1` (`idlista`),
  CONSTRAINT `fk_item_lista_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_lista_lista_precio1` FOREIGN KEY (`idlista`) REFERENCES `lista_precio` (`idlista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.item_lista: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `item_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_lista` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.item_periodo
CREATE TABLE IF NOT EXISTS `item_periodo` (
  `costo` double NOT NULL,
  `iditem` int(11) NOT NULL,
  `idperiodo` int(11) NOT NULL,
  PRIMARY KEY (`iditem`,`idperiodo`),
  KEY `fk_item_periodo_periodo1` (`idperiodo`),
  CONSTRAINT `fk_item_periodo_item1` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_periodo_periodo1` FOREIGN KEY (`idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.item_periodo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `item_periodo` DISABLE KEYS */;
REPLACE INTO `item_periodo` (`costo`, `iditem`, `idperiodo`) VALUES
	(25550, 1, 1);
/*!40000 ALTER TABLE `item_periodo` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.libro_compra
CREATE TABLE IF NOT EXISTS `libro_compra` (
  `idlibro` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `ruc` varchar(12) DEFAULT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `importetotal` double NOT NULL,
  `importetotalexento` double NOT NULL,
  `importetotaliva5` double NOT NULL,
  `importetotaliva10` double NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idlibro`),
  KEY `fk_libro_compra_tipo_movimiento1` (`idtipo`),
  CONSTRAINT `fk_libro_compra_tipo_movimiento1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.libro_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `libro_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.linea
CREATE TABLE IF NOT EXISTS `linea` (
  `idlinea` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idlinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.linea: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `linea` DISABLE KEYS */;
REPLACE INTO `linea` (`idlinea`, `descripcion`) VALUES
	(1, 'LÍNEA GENERAL'),
	(2, 'LÍNEA BEBIDAS'),
	(3, 'LÍNEA PRENDAS'),
	(4, 'LÍNEA HARINAS'),
	(5, 'LÍNEA PASTAS'),
	(6, 'LÍNEA ELECTRODOMESTICOS');
/*!40000 ALTER TABLE `linea` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.lista_precio
CREATE TABLE IF NOT EXISTS `lista_precio` (
  `idlista` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idlista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.lista_precio: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `lista_precio` DISABLE KEYS */;
REPLACE INTO `lista_precio` (`idlista`, `descripcion`) VALUES
	(1, 'MINORISTAS'),
	(2, 'MAYORISTAS');
/*!40000 ALTER TABLE `lista_precio` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `idmarca` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.marca: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
REPLACE INTO `marca` (`idmarca`, `descripcion`) VALUES
	(1, 'GENERICO'),
	(2, 'COCA COLA'),
	(3, 'PINO LECHE'),
	(4, 'ACER'),
	(5, 'ARCOR'),
	(6, 'SAMSUNG'),
	(7, 'APPLE'),
	(8, 'XIAOMI'),
	(9, 'BCA'),
	(10, 'TOKYO');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.moneda
CREATE TABLE IF NOT EXISTS `moneda` (
  `idmoneda` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `simbolo` varchar(5) NOT NULL,
  PRIMARY KEY (`idmoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.moneda: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
REPLACE INTO `moneda` (`idmoneda`, `descripcion`, `simbolo`) VALUES
	(1, 'GUARANIES', 'GS'),
	(2, 'DOLARES AMERICANOS', 'US'),
	(3, 'REAL', 'RL'),
	(4, 'LIBRA ESTERLINA', 'LB');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.motivo_ajuste
CREATE TABLE IF NOT EXISTS `motivo_ajuste` (
  `idmotivo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idmotivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.motivo_ajuste: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `motivo_ajuste` DISABLE KEYS */;
REPLACE INTO `motivo_ajuste` (`idmotivo`, `descripcion`) VALUES
	(1, 'AJUSTE DE ENTRADA'),
	(2, 'AJUSTE DE SALIDA');
/*!40000 ALTER TABLE `motivo_ajuste` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.nota_credito_compra
CREATE TABLE IF NOT EXISTS `nota_credito_compra` (
  `idnota` int(11) NOT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `numerotimbrado` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `fecharecepcion` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idnota`),
  KEY `fk_nota_credito_compra_proveedor` (`idproveedor`),
  KEY `fk_nota_credito_compra_usuario1` (`idusuario`),
  CONSTRAINT `fk_nota_credito_compra_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_credito_compra_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.nota_credito_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `nota_credito_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_credito_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.nota_credito_venta
CREATE TABLE IF NOT EXISTS `nota_credito_venta` (
  `idnota` int(11) NOT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idcliente` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idtimbrado` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idnota`),
  KEY `fk_nota_credito_venta_cliente1` (`idcliente`),
  KEY `fk_nota_credito_venta_moneda1` (`idmoneda`),
  KEY `fk_nota_credito_venta_deposito1` (`iddeposito`),
  KEY `fk_nota_credito_venta_tipo_movimiento1` (`idtipo`),
  KEY `fk_nota_credito_venta_timbrado1` (`idtimbrado`),
  KEY `fk_nota_credito_venta_usuario1` (`idusuario`),
  CONSTRAINT `fk_nota_credito_venta_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_credito_venta_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_credito_venta_moneda1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_credito_venta_timbrado1` FOREIGN KEY (`idtimbrado`) REFERENCES `timbrado` (`idtimbrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_credito_venta_tipo_movimiento1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_credito_venta_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.nota_credito_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `nota_credito_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_credito_venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.nota_debito_compra
CREATE TABLE IF NOT EXISTS `nota_debito_compra` (
  `idnota` int(11) NOT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `numerotimbrado` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `fecharecepcion` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idnota`) USING BTREE,
  KEY `fk_nota_debito_compra_proveedor` (`idproveedor`) USING BTREE,
  KEY `fk_nota_debito_compra_usuario1` (`idusuario`) USING BTREE,
  CONSTRAINT `nota_debito_compra_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_debito_compra_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla tesis.nota_debito_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `nota_debito_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_debito_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.nota_remision_compra
CREATE TABLE IF NOT EXISTS `nota_remision_compra` (
  `idnota` int(11) NOT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `fecharecepcion` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idnota`),
  KEY `fk_nota_remision_compra_proveedor1` (`idproveedor`),
  KEY `fk_nota_remision_compra_usuario1` (`idusuario`),
  CONSTRAINT `fk_nota_remision_compra_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_remision_compra_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.nota_remision_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `nota_remision_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_remision_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.orden_compra
CREATE TABLE IF NOT EXISTS `orden_compra` (
  `idorden` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idorden`),
  KEY `fk_orden_compra_proveedor1` (`idproveedor`),
  KEY `fk_orden_compra_moneda1` (`idmoneda`),
  KEY `fk_orden_compra_deposito1` (`iddeposito`),
  KEY `fk_orden_compra_tipo_movimiento1` (`idtipo`),
  KEY `fk_orden_compra_usuario1` (`idusuario`),
  CONSTRAINT `fk_orden_compra_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_compra_moneda1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_compra_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_compra_tipo_movimiento1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_compra_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.orden_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
REPLACE INTO `orden_compra` (`idorden`, `fecha`, `observacion`, `estado`, `idproveedor`, `idmoneda`, `iddeposito`, `idtipo`, `idusuario`) VALUES
	(1, '2021-04-14', '', 'P', 2, 1, 1, 1, 1);
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.orden_compra_compra
CREATE TABLE IF NOT EXISTS `orden_compra_compra` (
  `idcompra` int(11) NOT NULL,
  `idorden` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`,`idorden`),
  KEY `fk_orden_compra_compra_orden_compra1` (`idorden`),
  CONSTRAINT `fk_orden_compra_compra_compra1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_compra_compra_orden_compra1` FOREIGN KEY (`idorden`) REFERENCES `orden_compra` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.orden_compra_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `orden_compra_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.orden_compra_pedido_compra
CREATE TABLE IF NOT EXISTS `orden_compra_pedido_compra` (
  `idorden` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  PRIMARY KEY (`idorden`,`idpedido`) USING BTREE,
  KEY `FK_orden_compra_pedido_compra_pedido` (`idpedido`),
  KEY `FK_orden_compra_pedido_compra_orden` (`idorden`),
  CONSTRAINT `FK_orden_compra_pedido_compra_orden` FOREIGN KEY (`idorden`) REFERENCES `orden_compra` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orden_compra_pedido_compra_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido_compra` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.orden_compra_pedido_compra: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `orden_compra_pedido_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_pedido_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.pago_cuota_compra
CREATE TABLE IF NOT EXISTS `pago_cuota_compra` (
  `idpago` int(11) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `monto` double NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `numerocuota` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `numerocuenta` varchar(15) NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`idpago`,`numerocuota`,`idcompra`),
  KEY `fk_pago_cuota_compra_cuota_compra1` (`numerocuota`,`idcompra`),
  KEY `fk_pago_cuota_compra_usuario1` (`idusuario`),
  KEY `fk_pago_cuota_compra_cuenta_bancaria1` (`numerocuenta`,`idbanco`),
  CONSTRAINT `fk_pago_cuota_compra_cuenta_bancaria1` FOREIGN KEY (`numerocuenta`, `idbanco`) REFERENCES `cuenta_bancaria` (`numerocuenta`, `idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pago_cuota_compra_cuota_compra1` FOREIGN KEY (`numerocuota`, `idcompra`) REFERENCES `cuota_compra` (`numerocuota`, `idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pago_cuota_compra_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.pago_cuota_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago_cuota_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_cuota_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.pais: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
REPLACE INTO `pais` (`idpais`, `descripcion`, `nacionalidad`) VALUES
	(1, 'PARAGUAY', 'PARAGUAYO/A'),
	(2, 'BRASIL', 'BRASILERO/A'),
	(3, 'URUGUAY', 'URUGUAYO/A'),
	(4, 'ARGENTINA', 'ARGENTINO/A');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.pedido_compra
CREATE TABLE IF NOT EXISTS `pedido_compra` (
  `idpedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `fk_pedido_compra_proveedor1` (`idproveedor`),
  KEY `fk_pedido_compra_moneda1` (`idmoneda`),
  KEY `fk_pedido_compra_deposito1` (`iddeposito`),
  KEY `fk_pedido_compra_tipo_movimiento1` (`idtipo`),
  KEY `fk_pedido_compra_usuario1` (`idusuario`),
  CONSTRAINT `fk_pedido_compra_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_compra_moneda1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_compra_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_compra_tipo_movimiento1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_compra_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.pedido_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_compra` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.pedido_venta
CREATE TABLE IF NOT EXISTS `pedido_venta` (
  `idpedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `fk_pedido_venta_cliente1` (`idcliente`),
  KEY `fk_pedido_venta_deposito1` (`iddeposito`),
  KEY `fk_pedido_venta_moneda1` (`idmoneda`),
  KEY `fk_pedido_venta_tipo_movimiento1` (`idtipo`),
  KEY `fk_pedido_venta_usuario1` (`idusuario`),
  CONSTRAINT `fk_pedido_venta_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_venta_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_venta_moneda1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_venta_tipo_movimiento1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_venta_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.pedido_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `idperiodo` int(11) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  PRIMARY KEY (`idperiodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.periodo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
REPLACE INTO `periodo` (`idperiodo`, `fecha_desde`, `fecha_hasta`) VALUES
	(1, '2021-04-01', '2021-04-30');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `acciones` varchar(100) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idvista` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idvista`),
  KEY `fk_permiso_vista1` (`idvista`),
  CONSTRAINT `fk_permiso_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permiso_vista1` FOREIGN KEY (`idvista`) REFERENCES `vista` (`idvista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.permiso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `razonsocial` varchar(100) NOT NULL,
  `ruc` varchar(12) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `propietario` varchar(100) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `idpais` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedor_pais1` (`idpais`),
  KEY `fk_proveedor_tipo_proveedor1` (`idtipo`),
  CONSTRAINT `fk_proveedor_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedor_tipo_proveedor1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_proveedor` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.proveedor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
REPLACE INTO `proveedor` (`idproveedor`, `razonsocial`, `ruc`, `direccion`, `telefono`, `email`, `fax`, `propietario`, `observacion`, `estado`, `idpais`, `idtipo`) VALUES
	(1, 'PROVEEDOR GENERICO', 'XXX', NULL, 'XXX', 'XXX', 'XXX', 'XXX', 'XXX', 'A', 1, 1),
	(2, 'ARANDÚ SYSTEMS', '5955455-0', NULL, '0975489075', 'arielpmpy@gmail.com', 'N/A', 'ARMANDO ARIEL PERALTA MARTINEZ', '', 'A', 1, 1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.prueba
CREATE TABLE IF NOT EXISTS `prueba` (
  `codigo` varchar(50) NOT NULL DEFAULT '',
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla tesis.prueba: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
REPLACE INTO `prueba` (`codigo`, `descripcion`) VALUES
	('1', 'a'),
	('1', 'b'),
	('1', 'c'),
	('1', 'd');
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.recaudacion
CREATE TABLE IF NOT EXISTS `recaudacion` (
  `idrecaudacion` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `personadepositante` varchar(100) NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idapertura` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idrecaudacion`),
  KEY `fk_recaudacion_apertura1` (`idapertura`),
  KEY `fk_recaudacion_usuario1` (`idusuario`),
  CONSTRAINT `fk_recaudacion_apertura1` FOREIGN KEY (`idapertura`) REFERENCES `apertura` (`idapertura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recaudacion_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.recaudacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recaudacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `recaudacion` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.seccion
CREATE TABLE IF NOT EXISTS `seccion` (
  `idseccion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idseccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.seccion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
REPLACE INTO `seccion` (`idseccion`, `descripcion`) VALUES
	(1, 'SECCION GENERAL'),
	(2, 'SECCION COCINA'),
	(3, 'SECCIÓN INSUMOS'),
	(4, 'SECCIÓN HELADERAS'),
	(5, 'SECCIÓN CONGELADORES');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.sucursal
CREATE TABLE IF NOT EXISTS `sucursal` (
  `idsucursal` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `idempresa` int(11) NOT NULL,
  PRIMARY KEY (`idsucursal`),
  KEY `fk_sucursal_empresa` (`idempresa`),
  CONSTRAINT `fk_sucursal_empresa` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.sucursal: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
REPLACE INTO `sucursal` (`idsucursal`, `descripcion`, `telefono`, `direccion`, `idempresa`) VALUES
	(1, 'CENTRAL', NULL, NULL, 1);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `numerocomprobante` varchar(15) NOT NULL,
  `monto` double NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`numerocomprobante`,`idbanco`),
  KEY `fk_tarjeta_banco1` (`idbanco`),
  CONSTRAINT `fk_tarjeta_banco1` FOREIGN KEY (`idbanco`) REFERENCES `banco` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.timbrado
CREATE TABLE IF NOT EXISTS `timbrado` (
  `idtimbrado` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `numerotimbrado` int(11) NOT NULL,
  `numerodesde` int(11) NOT NULL,
  `numerohasta` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idtimbrado`),
  KEY `fk_timbrado_caja1` (`idcaja`),
  KEY `fk_timbrado_sucursal1` (`idsucursal`),
  KEY `fk_timbrado_tipo_movimiento1` (`idtipo`),
  CONSTRAINT `fk_timbrado_caja1` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`idcaja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_timbrado_sucursal1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_timbrado_tipo_movimiento1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.timbrado: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `timbrado` DISABLE KEYS */;
REPLACE INTO `timbrado` (`idtimbrado`, `fecha_inicio`, `fecha_fin`, `numerotimbrado`, `numerodesde`, `numerohasta`, `idsucursal`, `idcaja`, `idtipo`) VALUES
	(1, '2021-04-18', '2021-04-18', 11112222, 1, 500, 1, 1, 1);
/*!40000 ALTER TABLE `timbrado` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.tipo_cliente
CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.tipo_cliente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
REPLACE INTO `tipo_cliente` (`idtipo`, `descripcion`) VALUES
	(1, 'OCASIONAL'),
	(2, 'NO GRATA'),
	(3, 'FIEL');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.tipo_comprobante
CREATE TABLE IF NOT EXISTS `tipo_comprobante` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.tipo_comprobante: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_comprobante` DISABLE KEYS */;
REPLACE INTO `tipo_comprobante` (`idtipo`, `descripcion`) VALUES
	(1, 'FACTURA'),
	(2, 'RECIBO'),
	(3, 'REMISION'),
	(4, 'NOTA DE DÉBITO'),
	(5, 'NOTA DE CRÉDITO');
/*!40000 ALTER TABLE `tipo_comprobante` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.tipo_item
CREATE TABLE IF NOT EXISTS `tipo_item` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.tipo_item: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_item` DISABLE KEYS */;
REPLACE INTO `tipo_item` (`idtipo`, `descripcion`) VALUES
	(1, 'ADQUIRIDO'),
	(2, 'PRODUCIDO'),
	(3, 'OTROS');
/*!40000 ALTER TABLE `tipo_item` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.tipo_movimiento
CREATE TABLE IF NOT EXISTS `tipo_movimiento` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `abreviacion` varchar(5) NOT NULL,
  `idtipoComprobante` int(11) NOT NULL,
  PRIMARY KEY (`idtipo`),
  KEY `fk_tipo_movimiento_tipo_comprobante1` (`idtipoComprobante`),
  CONSTRAINT `fk_tipo_movimiento_tipo_comprobante1` FOREIGN KEY (`idtipoComprobante`) REFERENCES `tipo_comprobante` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.tipo_movimiento: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_movimiento` DISABLE KEYS */;
REPLACE INTO `tipo_movimiento` (`idtipo`, `descripcion`, `abreviacion`, `idtipoComprobante`) VALUES
	(1, 'FACTURA CONTADO RECIBIDA', 'FCONR', 1),
	(2, 'FACTURA CRÉDITO RECIBIDA', 'FCRER', 1),
	(3, 'NOTA DE CRÉDITO RECIBIDA', 'NCRER', 5),
	(4, 'NOTA DE DÉBITO RECIBIDA', 'NDEBR', 4),
	(5, 'NOTA DE REMISIÓN RECIBIDA', 'NREMR', 3),
	(6, 'FACTURA CONTADO EMITIDA', 'FCONE', 1),
	(7, 'FACTURA CRÉDITO EMITIDA', 'FCREE', 1),
	(8, 'NOTA DE CRÉDITO EMITIDA', 'NCREE', 5),
	(9, 'NOTA DE DÉBITO EMITIDA', 'NDEBE', 4),
	(10, 'NOTA DE REMISIÓN EMITIDA', 'NREME', 3),
	(11, 'RECIBO DE PAGO EMITIDA', 'RPAGE', 2),
	(12, 'RECIBO DE PAGO RECIBIDA', 'RPAGR', 2);
/*!40000 ALTER TABLE `tipo_movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.tipo_proveedor
CREATE TABLE IF NOT EXISTS `tipo_proveedor` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.tipo_proveedor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_proveedor` DISABLE KEYS */;
REPLACE INTO `tipo_proveedor` (`idtipo`, `descripcion`) VALUES
	(1, 'LOCAL'),
	(2, 'EXTRANJERO');
/*!40000 ALTER TABLE `tipo_proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.tipo_tarjeta
CREATE TABLE IF NOT EXISTS `tipo_tarjeta` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.tipo_tarjeta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_tarjeta` DISABLE KEYS */;
REPLACE INTO `tipo_tarjeta` (`idtipo`, `descripcion`) VALUES
	(1, 'CREDITO'),
	(2, 'DEBITO');
/*!40000 ALTER TABLE `tipo_tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.unidad_medida
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `idunidad` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `simbolo` varchar(5) NOT NULL,
  PRIMARY KEY (`idunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.unidad_medida: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
REPLACE INTO `unidad_medida` (`idunidad`, `descripcion`, `simbolo`) VALUES
	(1, 'UNIDADES', 'UN'),
	(2, 'KILOGRAMOS', 'KG'),
	(3, 'GRAMOS', 'GR'),
	(4, 'METROS', 'MT'),
	(5, 'CENTIMETROS', 'CM'),
	(6, 'ERROR DE CARGA', 'PR');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `login` varchar(15) NOT NULL,
  `clave` varchar(256) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_sucursal1` (`idsucursal`),
  CONSTRAINT `fk_usuario_sucursal1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`idusuario`, `nombre`, `apellido`, `cedula`, `telefono`, `celular`, `direccion`, `login`, `clave`, `idsucursal`) VALUES
	(1, 'ARMANDO ARIEL', 'PERALTA MARTINEZ', '5955455', '+595975489075', '0975489075', 'BARRIO SAN BLAS - DR. J. EULOGIO ESTIGARRIBIA', 'APERALTA', '2dd49d18e5eeec5e5f6d18e6c6af1e0b', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int(11) NOT NULL,
  `numerodocumento` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `idcliente` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idtimbrado` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_cliente1` (`idcliente`),
  KEY `fk_venta_deposito1` (`iddeposito`),
  KEY `fk_venta_moneda1` (`idmoneda`),
  KEY `fk_venta_timbrado1` (`idtimbrado`),
  KEY `fk_venta_tipo_movimiento1` (`idtipo`),
  KEY `fk_venta_usuario1` (`idusuario`),
  CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_deposito1` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`iddeposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_moneda1` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_timbrado1` FOREIGN KEY (`idtimbrado`) REFERENCES `timbrado` (`idtimbrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_tipo_movimiento1` FOREIGN KEY (`idtipo`) REFERENCES `tipo_movimiento` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.venta: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.venta_apertura
CREATE TABLE IF NOT EXISTS `venta_apertura` (
  `idventa` int(11) NOT NULL,
  `idapertura` int(11) NOT NULL,
  PRIMARY KEY (`idventa`,`idapertura`),
  KEY `fk_venta_apertura_apertura1` (`idapertura`),
  CONSTRAINT `fk_venta_apertura_apertura1` FOREIGN KEY (`idapertura`) REFERENCES `apertura` (`idapertura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_apertura_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.venta_apertura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta_apertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_apertura` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.venta_cheque
CREATE TABLE IF NOT EXISTS `venta_cheque` (
  `idventa` int(11) NOT NULL,
  `numerocheque` varchar(15) NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`idventa`,`numerocheque`,`idbanco`),
  KEY `fk_venta_cheque_cheque1` (`numerocheque`,`idbanco`),
  CONSTRAINT `fk_venta_cheque_cheque1` FOREIGN KEY (`numerocheque`, `idbanco`) REFERENCES `cheque` (`numerocheque`, `idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_cheque_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.venta_cheque: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_cheque` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.venta_tarjeta
CREATE TABLE IF NOT EXISTS `venta_tarjeta` (
  `idventa` int(11) NOT NULL,
  `numerocomprobante` varchar(15) NOT NULL,
  `idbanco` int(11) NOT NULL,
  PRIMARY KEY (`idventa`,`numerocomprobante`,`idbanco`),
  KEY `fk_venta_tarjeta_tarjeta1` (`numerocomprobante`,`idbanco`),
  CONSTRAINT `fk_venta_tarjeta_tarjeta1` FOREIGN KEY (`numerocomprobante`, `idbanco`) REFERENCES `tarjeta` (`numerocomprobante`, `idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_tarjeta_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.venta_tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla tesis.vista
CREATE TABLE IF NOT EXISTS `vista` (
  `idvista` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idvista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tesis.vista: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `vista` DISABLE KEYS */;
REPLACE INTO `vista` (`idvista`, `descripcion`) VALUES
	(1, 'FRMCAJA');
/*!40000 ALTER TABLE `vista` ENABLE KEYS */;

-- Volcando estructura para procedimiento tesis.P_ACT_ITEM_DEP
DELIMITER //
CREATE PROCEDURE `P_ACT_ITEM_DEP`(
IN xIDITEM 				INT,
IN xIDVENTA_COMPRA	INT,
IN xCANTIDAD			DOUBLE,
IN xOPERACION			VARCHAR(1),
IN xTABLA				VARCHAR(100)
)
BEGIN
	DECLARE V_DEPOSITO INT;
	DECLARE V_CANTIDAD_ENTRADA DOUBLE;
	DECLARE V_CANTIDAD_SALIDA DOUBLE;
		
		IF xTABLA = 'venta' THEN
			SELECT iddeposito INTO V_DEPOSITO FROM venta WHERE idventa = xIDVENTA_COMPRA;
		END IF;
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
		CALL P_ACT_ITEM_DEP_INS_UPD(V_DEPOSITO, xIDITEM, V_CANTIDAD_ENTRADA, V_CANTIDAD_SALIDA);	
END//
DELIMITER ;

-- Volcando estructura para procedimiento tesis.P_ACT_ITEM_DEP_INS_UPD
DELIMITER //
CREATE PROCEDURE `P_ACT_ITEM_DEP_INS_UPD`(
	IN `xIDDEPOSITO` INT,
	IN `xIDITEM` INT,
	IN `xCANTIDAD_ENTRADA` DOUBLE,
	IN `xCANTIDAD_SALIDA` DOUBLE
)
BEGIN
	DECLARE V_REGISTROS INT;	
	SELECT COUNT(*) INTO V_REGISTROS FROM item_deposito
	WHERE iditem 		= xIDITEM
	AND 	iddeposito	= xIDDEPOSITO;	
	IF V_REGISTROS = 0 THEN
		INSERT INTO item_deposito (iditem, iddeposito, cantidad)
		VALUES(xIDITEM, xIDDEPOSITO, xCANTIDAD_ENTRADA - xCANTIDAD_SALIDA);
	ELSE
		UPDATE item_deposito 
		SET cantidad = cantidad + xCANTIDAD_ENTRADA - xCANTIDAD_SALIDA
		WHERE iditem 		= xIDITEM
		AND	iddeposito	= xIDDEPOSITO;
	END IF;	
END//
DELIMITER ;

-- Volcando estructura para procedimiento tesis.P_ACT_SALDO_CUENTA_BANCARIA
DELIMITER //
CREATE PROCEDURE `P_ACT_SALDO_CUENTA_BANCARIA`(
	IN `xOPERACION` VARCHAR(50),
	IN `xMONTO` DOUBLE,
	IN `xNUMEROCUENTA` VARCHAR(15),
	IN `xIDBANCO` INT
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
		CALL P_ACT_SALDO_CUENTA_BANCARIA_UPD(V_MONTO_ENTRADA, V_MONTO_SALIDA, xNUMEROCUENTA, xIDBANCO);
END//
DELIMITER ;

-- Volcando estructura para procedimiento tesis.P_ACT_SALDO_CUENTA_BANCARIA_UPD
DELIMITER //
CREATE PROCEDURE `P_ACT_SALDO_CUENTA_BANCARIA_UPD`(
	IN `xMONTO_ENTRADA` DOUBLE,
	IN `xMONTO_SALIDA` DOUBLE,
	IN `xNUMEROCUENTA` VARCHAR(15),
	IN `xIDBANCO` INT
)
BEGIN
		UPDATE cuenta_bancaria
		SET saldo = saldo + xMONTO_ENTRADA - xMONTO_SALIDA
		WHERE numerocuenta 	LIKE xNUMEROCUENTA
		AND	idbanco 			= xIDBANCO;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tesis.P_AUDITORIA_COMPRA
DELIMITER //
CREATE PROCEDURE `P_AUDITORIA_COMPRA`(
	IN `xIDCOMPRA` INT
)
BEGIN

	DECLARE V_NRO VARCHAR(15);	
	DECLARE V_FECHA DATE;
	DECLARE V_OBSERVACION VARCHAR(250);
	DECLARE V_PROVEEDOR VARCHAR(100);
	DECLARE V_RUC VARCHAR(12);
	DECLARE V_MONEDA VARCHAR(50);
	DECLARE V_DEPOSITO VARCHAR(50);
	DECLARE V_USUARIO VARCHAR(100);
	DECLARE V_TIPO_MOVIMIENTO VARCHAR(100);
	DECLARE V_TIMBRADO VARCHAR(10);
	
	SELECT 
		C.numerodocumento AS DOCUMENTO, 
		C.fecha AS FECHA, 
		C.observacion AS OBS, 
		P.razonsocial AS PROVEEDOR,
		P.ruc AS RUC,
		M.descripcion AS MONEDA, 
		D.descripcion AS DEPOSITO, 
		CONCAT(U.nombre,' ',U.apellido) AS usuario,
		TM.descripcion AS tipo_movimiento,
		C.numerotimbrado AS TIMBRADO
	INTO
		V_NRO,
		V_FECHA,
		V_OBSERVACION,
		V_PROVEEDOR,
		V_RUC,
		V_MONEDA,
		V_DEPOSITO,
		V_USUARIO,
		V_TIPO_MOVIMIENTO,
		V_TIMBRADO
	FROM compra AS C
	INNER JOIN proveedor AS P ON P.idproveedor = C.idproveedor
	INNER JOIN moneda AS M ON M.idmoneda = C.idmoneda
	INNER JOIN deposito AS D ON D.iddeposito = C.iddeposito
	INNER JOIN usuario AS U ON U.idusuario = C.idusuario
	INNER JOIN tipo_movimiento AS TM ON TM.idtipo = C.idtipo
	WHERE C.idcompra = xIDCOMPRA;
	
	
	INSERT INTO compra_auditoria
	(idcompra, numerodocumento, fecha, observacion, proveedor, ruc, moneda, deposito, usuario, tipo_movimiento, numerotimbrado)
	VALUES (xIDCOMPRA, V_NRO, V_FECHA, V_OBSERVACION, V_PROVEEDOR, V_RUC, V_MONEDA, V_DEPOSITO, V_USUARIO, V_TIPO_MOVIMIENTO, V_TIMBRADO);
			
END//
DELIMITER ;

-- Volcando estructura para procedimiento tesis.P_AUDITORIA_DETALLE_COMPRA
DELIMITER //
CREATE PROCEDURE `P_AUDITORIA_DETALLE_COMPRA`(
IN xIDCOMPRA INT,
IN xIDITEM INT
)
BEGIN

	DECLARE V_COSTO DOUBLE;	
	DECLARE V_CANTIDAD DOUBLE;
	DECLARE V_IDAUDITORIA INT;
	DECLARE V_IDITEM INT;
	DECLARE V_ITEM_DESCRIPCION VARCHAR(100);
	
	SELECT 
		DC.cantidad, 
		DC.costo,
		DC.iditem,
		I.descripcion
	INTO
		V_CANTIDAD,
		V_COSTO,
		V_IDITEM,
		V_ITEM_DESCRIPCION
	FROM detalle_compra AS DC
	INNER JOIN item AS I ON I.iditem = DC.iditem
	WHERE DC.idcompra = xIDCOMPRA
	AND DC.iditem = xIDITEM;
	
	
	INSERT INTO detalle_compra_auditoria
	(cantidad, costo, idcompra, iditem, item_descripcion)
	VALUES (V_CANTIDAD, V_COSTO, xIDCOMPRA, V_IDITEM, V_ITEM_DESCRIPCION);			
	
END//
DELIMITER ;

-- Volcando estructura para función tesis.saldoApertura
DELIMITER //
CREATE FUNCTION `saldoApertura`(xIDAPERTURA INTEGER) RETURNS double
BEGIN
	DECLARE SALDO DOUBLE;
	SET SALDO = (
		SELECT 
			(
			AP.monto + 	(
				SELECT IFNULL(SUM(cantidad*precio),0) VENTAS
				FROM detalle_venta AS DV
				INNER JOIN venta AS V ON V.idventa = DV.idventa
				INNER JOIN venta_apertura AS VA ON VA.idventa = V.idventa
				WHERE VA.idapertura = xIDAPERTURA
							) - 
			IFNULL(SUM(EA.monto),0)
			) AS SALDO
		FROM extraccion_apertura AS EA
		INNER JOIN apertura AS AP ON AP.idapertura = EA.idapertura
		WHERE EA.idapertura = xIDAPERTURA
		);
	RETURN SALDO;
END//
DELIMITER ;

-- Volcando estructura para disparador tesis.TR_AUDITORIA_COMPRA
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TR_AUDITORIA_COMPRA
BEFORE DELETE ON COMPRA
FOR EACH ROW
BEGIN
	CALL P_AUDITORIA_COMPRA(OLD.idcompra);	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_AUDITORIA_DETALLE_COMPRA
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TR_AUDITORIA_DETALLE_COMPRA
BEFORE DELETE ON DETALLE_COMPRA
FOR EACH ROW
BEGIN
	CALL P_AUDITORIA_DETALLE_COMPRA(OLD.idcompra, OLD.iditem);	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_BORRAR_DETALLE_COMPRA
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TR_BORRAR_DETALLE_COMPRA
BEFORE DELETE ON compra
FOR EACH ROW
BEGIN	
	DELETE FROM detalle_compra WHERE idcompra=OLD.idcompra;	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_BORRAR_DETALLE_VENTA
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_BORRAR_DETALLE_VENTA` BEFORE DELETE ON `venta` FOR EACH ROW BEGIN	
	DELETE FROM detalle_venta WHERE idventa=OLD.idventa;	
	DELETE FROM venta_apertura WHERE idventa=OLD.idventa;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_DEPOSITO_BANCARIO_DEL
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_DEPOSITO_BANCARIO_DEL` BEFORE DELETE ON `deposito_bancario` FOR EACH ROW BEGIN
	CALL P_ACT_SALDO_CUENTA_BANCARIA('S', OLD.monto, OLD.numerocuenta, OLD.idbanco);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_DEPOSITO_BANCARIO_INS
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_DEPOSITO_BANCARIO_INS` BEFORE INSERT ON `deposito_bancario` FOR EACH ROW BEGIN
	CALL P_ACT_SALDO_CUENTA_BANCARIA('E', NEW.monto, NEW.numerocuenta, NEW.idbanco);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_DETALLE_COMPRA_STOCK_DEL
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_DETALLE_COMPRA_STOCK_DEL` BEFORE DELETE ON `detalle_compra` FOR EACH ROW BEGIN
	CALL P_ACT_ITEM_DEP(OLD.iditem, OLD.idcompra, OLD.cantidad, 'S', 'compra');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_DETALLE_COMPRA_STOCK_INS
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_DETALLE_COMPRA_STOCK_INS` BEFORE INSERT ON `detalle_compra` FOR EACH ROW BEGIN
	CALL P_ACT_ITEM_DEP(NEW.iditem, NEW.idcompra, NEW.cantidad, 'E', 'compra');	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_DETALLE_VENTA_STOCK_DEL
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TR_DETALLE_VENTA_STOCK_DEL
BEFORE DELETE ON detalle_venta
FOR EACH ROW
BEGIN
	CALL P_ACT_ITEM_DEP(OLD.iditem, OLD.idventa, OLD.cantidad, 'E', 'venta');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_DETALLE_VENTA_STOCK_INS
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TR_DETALLE_VENTA_STOCK_INS
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
	CALL P_ACT_ITEM_DEP(NEW.iditem, NEW.idventa, NEW.cantidad, 'S', 'venta');	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_EXTRACCION_BANCARIA_DEL
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_EXTRACCION_BANCARIA_DEL` BEFORE DELETE ON `extraccion_bancaria` FOR EACH ROW BEGIN
	CALL P_ACT_SALDO_CUENTA_BANCARIA('E', OLD.monto, OLD.numerocuenta, OLD.idbanco);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador tesis.TR_EXTRACCION_BANCARIA_INS
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_EXTRACCION_BANCARIA_INS` BEFORE INSERT ON `extraccion_bancaria` FOR EACH ROW BEGIN
	CALL P_ACT_SALDO_CUENTA_BANCARIA('S', NEW.monto, NEW.numerocuenta, NEW.idbanco);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
