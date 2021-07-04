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

-- Volcando datos para la tabla as.articulo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
REPLACE INTO `articulo` (`idarticulo`, `descripcion`, `referencia`, `codigoalfanumerico`, `codigobarra`, `estado`, `observacion`, `idmarca`, `idlinea`, `idseccion`, `idtipo`, `idunidad`, `idimpuesto`) VALUES
	(1, 'CARAMELO CRISTAL', 'MENTA ARCOR', '', '', 'A', '', 1, 1, 1, 1, 1, 2),
	(2, 'REMEDIO PARA MATE MANZANILLA 15GR', 'MATRICARIA - CHAMOMILLA - FLOR', '', '7840595001616', 'A', '', 1, 1, 1, 1, 1, 3),
	(3, 'ARTICULO DE PRUEBA', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3),
	(4, 'ARTICULO DE PRUEBA DOS', '', '', '', 'A', '', 1, 1, 1, 1, 1, 3);
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

-- Volcando datos para la tabla as.articulo_deposito: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo_deposito` DISABLE KEYS */;
REPLACE INTO `articulo_deposito` (`idarticulo`, `iddeposito`, `cantidad`) VALUES
	(1, 1, 15);
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

-- Volcando datos para la tabla as.articulo_periodo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo_periodo` DISABLE KEYS */;
REPLACE INTO `articulo_periodo` (`idarticulo`, `idperiodo`, `idmoneda`, `costo`) VALUES
	(1, 1, 1, 5000),
	(1, 1, 2, 2);
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

-- Volcando estructura para tabla as.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `idcompra` int(11) NOT NULL,
  `numerodocumento` varchar(25) NOT NULL DEFAULT '',
  `numerotimbrado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `idmoneda` int(11) NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idtipomovimiento` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `totalneto` double NOT NULL DEFAULT 0,
  `totaliva` double NOT NULL DEFAULT 0,
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

-- Volcando datos para la tabla as.compra: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
REPLACE INTO `compra` (`idcompra`, `numerodocumento`, `numerotimbrado`, `fecha`, `observacion`, `idmoneda`, `iddeposito`, `idtipomovimiento`, `idproveedor`, `idusuario`, `totalneto`, `totaliva`) VALUES
	(1, '001-001-0000001', 11111111, '2021-07-04', '', 1, 1, 1, 1, 1, 4762, 238),
	(2, '001-001-0000002', 11111111, '2021-07-04', '', 1, 1, 1, 1, 1, 4762, 238),
	(3, '001-001-0000003', 11111111, '2021-07-04', '', 1, 1, 1, 1, 1, 4762, 238),
	(4, '001-001-0000004', 11111111, '2021-07-04', '', 1, 1, 1, 1, 1, 4762, 238),
	(5, '001-001-0000005', 11111111, '2021-07-04', '', 2, 1, 1, 1, 1, 1.905, 0.095);
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

-- Volcando datos para la tabla as.compra_cuota: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_cuota` DISABLE KEYS */;
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
	(4, 1, 4762, 5, 1, 238, 5),
	(5, 1, 1.905, 10, 1, 0.095, 5);
/*!40000 ALTER TABLE `compra_detalle` ENABLE KEYS */;

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

-- Volcando datos para la tabla as.configuracion: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
REPLACE INTO `configuracion` (`idconfiguracion`, `idsucursal`, `fac_con_rec`, `fac_cre_rec`) VALUES
	(1, 1, 1, 2);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla as.cotizacion
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `idmoneda` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tasa` double NOT NULL,
  PRIMARY KEY (`fecha`,`idmoneda`) USING BTREE,
  KEY `FK_COTIZACION_MONEDA` (`idmoneda`) USING BTREE,
  CONSTRAINT `FK_COTIZACION_MONEDA` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla as.cotizacion: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
REPLACE INTO `cotizacion` (`idmoneda`, `fecha`, `tasa`) VALUES
	(2, '2021-07-04', 7000);
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;

-- Volcando estructura para tabla as.deposito
CREATE TABLE IF NOT EXISTS `deposito` (
  `iddeposito` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`iddeposito`),
  KEY `FK_DEPOSITO_SUCURSAL` (`idsucursal`),
  CONSTRAINT `FK_DEPOSITO_SUCURSAL` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.deposito: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
REPLACE INTO `deposito` (`iddeposito`, `descripcion`, `idsucursal`) VALUES
	(1, 'SALON', 1),
	(2, 'AUXILIAR', 1);
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

-- Volcando datos para la tabla as.empresa: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
REPLACE INTO `empresa` (`idempresa`, `razonsocial`, `ruc`, `telefono`, `direccion`) VALUES
	(1, 'ARANDU SYSTEMS DE ARMANDO ARIEL PERALTA MARTINEZ', '5955455-0', '(+595) 975 489 075', 'SAN ANTONIO GUAZU CASI RUTA 7 - DR. JUAN MANUEL FRUTOS');
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

-- Volcando datos para la tabla as.periodo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
REPLACE INTO `periodo` (`idperiodo`, `fecha_desde`, `fecha_hasta`) VALUES
	(1, '2021-07-01', '2021-07-31');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;

-- Volcando estructura para tabla as.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `idprograma` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idprograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.programa: ~25 rows (aproximadamente)
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
	(31, 'JFrmCompra');
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

-- Volcando datos para la tabla as.sucursal: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
REPLACE INTO `sucursal` (`idsucursal`, `descripcion`, `telefono`, `direccion`, `idempresa`) VALUES
	(1, 'CASA CENTRAL', '(+595) 975 489 075', 'BARRIO SAN BLAS - EX CAMPO 9', 1),
	(2, 'CASILLA 2', '', '', 1);
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
	(1, 1, 1, 11112222, 1, 100, '2021-01-01', '2021-12-31', 1, 1);
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

-- Volcando datos para la tabla as.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`idusuario`, `nombre`, `apellido`, `cedula`, `telefono`, `direccion`, `alias`, `clave`, `idempresa`, `idsucursal`) VALUES
	(1, 'ARMANDO ARIEL', 'PERALTA MARTINEZ', '5955455', '0975489075', 'BARRIO SAN JORGE - EX CAMPO 9', 'APERALTA', 'e3e7c47572ad938642bbc9cdcdce7e3f', 1, 1),
	(2, 'LIZ', 'RAMIREZ', '5556325', '0991222555', 'BARRIO SAN BLAS - EX CAMPO 9', 'LRAMIREZ', '86b63c18e635ec42e603d4790f2bf90b', 1, 2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla as.usuario_programa
CREATE TABLE IF NOT EXISTS `usuario_programa` (
  `idusuario` int(11) NOT NULL,
  `idprograma` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idprograma`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla as.usuario_programa: 31 rows
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
	(1, 31);
/*!40000 ALTER TABLE `usuario_programa` ENABLE KEYS */;

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
	
	SELECT C.fecha, C.idmoneda INTO V_FECHA, V_MONEDA FROM compra AS C WHERE C.idcompra = xIDCOMPRA;
	
	SET V_PERIODO = FP_ACT_PERIODO_INS_UPD(V_FECHA);
	
	SELECT COUNT(*) INTO V_CONTADOR FROM articulo_periodo AS P
	WHERE P.idarticulo = xIDARTICULO
	AND P.idperiodo = V_PERIODO
	AND P.idmoneda = V_MONEDA;
	
	IF V_CONTADOR = 0 THEN
		INSERT INTO articulo_periodo
		(idarticulo, idperiodo, idmoneda, costo)
		VALUES (xIDARTICULO, V_PERIODO, V_MONEDA, xCOSTO);
	ELSE
		UPDATE articulo_periodo
		SET
			costo=xCOSTO
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
CREATE TRIGGER `TR_COMPRA_DETALLE_PERIODO_COSTO` BEFORE INSERT ON `compra_detalle` FOR EACH ROW BEGIN
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
CREATE TRIGGER `TR_COMPRA_DETALLE_STOCK_INS` BEFORE INSERT ON `compra_detalle` FOR EACH ROW BEGIN
	CALL P_ACT_ITEM_DEP(NEW.idarticulo, NEW.idcompra, NEW.cantidad, 'E', 'compra');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
