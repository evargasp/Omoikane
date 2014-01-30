-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-09-2013 a las 19:21:40
-- Versión del servidor: 5.1.66
-- Versión de PHP: 5.3.3-7+squeeze15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `omoikane`
--
CREATE DATABASE `omoikane` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `omoikane`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cancelacion`
--

CREATE TABLE IF NOT EXISTS `Cancelacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaHora` datetime DEFAULT NULL,
  `articulo_id_articulo` int(11) DEFAULT NULL,
  `autorizador_id_usuario` bigint(20) DEFAULT NULL,
  `cajero_id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5D0F64CBC58D3F9` (`autorizador_id_usuario`),
  KEY `FK5D0F64C2A677CBD` (`cajero_id_usuario`),
  KEY `FK5D0F64CB3E87FB` (`articulo_id_articulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=61 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CancelacionTransaccion`
--

CREATE TABLE IF NOT EXISTS `CancelacionTransaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `importe` decimal(19,2) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK18D922A31F43DE4C` (`paciente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ConteoInventario`
--

CREATE TABLE IF NOT EXISTS `ConteoInventario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `completado` bit(1) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK997A080D61D916F4` (`id_usuario`),
  KEY `completadoIndex` (`completado`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ConteoInventario_items`
--

CREATE TABLE IF NOT EXISTS `ConteoInventario_items` (
  `ConteoInventario_id` bigint(20) NOT NULL,
  `codigo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `conteo` decimal(19,2) DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `items_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`ConteoInventario_id`,`items_ORDER`),
  KEY `FK9F9F550ECBC7D7AF` (`ConteoInventario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Paciente`
--

CREATE TABLE IF NOT EXISTS `Paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `edad` int(11) DEFAULT NULL,
  `habitacion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `liquidado` bit(1) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `responsable` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `anotacion` text COLLATE utf8_spanish_ci,
  `entrada` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Paquete`
--

CREATE TABLE IF NOT EXISTS `Paquete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(19,2) NOT NULL,
  `productoContenedor_id_articulo` int(11) NOT NULL,
  `productoContenido_id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33E7B1813F08A1D` (`productoContenedor_id_articulo`),
  KEY `FK33E7B1813C323E39` (`productoContenido_id_articulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Preferencia`
--

CREATE TABLE IF NOT EXISTS `Preferencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` longtext COLLATE utf8_spanish_ci NOT NULL,
  `valor` longtext COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE IF NOT EXISTS `Proveedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `notas` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Stock`
--

CREATE TABLE IF NOT EXISTS `Stock` (
  `idArticulo` int(11) NOT NULL,
  `clasificacion` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `enBodega` decimal(19,2) NOT NULL,
  `enTienda` decimal(19,2) NOT NULL,
  `maximo` decimal(19,2) NOT NULL,
  `minimo` decimal(19,2) NOT NULL,
  `modificado` datetime NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idArticulo`),
  KEY `FK4C806F64640B4D6` (`idArticulo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Transaccion`
--

CREATE TABLE IF NOT EXISTS `Transaccion` (
  `DTYPE` varchar(31) COLLATE utf8_spanish_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abono` decimal(19,2) DEFAULT NULL,
  `cargo` decimal(19,2) DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` decimal(19,2) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `producto_id_articulo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE302C06FCD51C500` (`producto_id_articulo`),
  KEY `FKE302C06F1F43DE4C` (`paciente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE IF NOT EXISTS `almacenes` (
  `id_almacen` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_almacen`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anotaciones`
--

CREATE TABLE IF NOT EXISTS `anotaciones` (
  `id_almacen` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`id_almacen`,`id_articulo`),
  KEY `fk_articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_linea` int(11) DEFAULT '0',
  `descripcion` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `impuestos` double DEFAULT NULL,
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0',
  `id_grupo` int(10) unsigned NOT NULL DEFAULT '0',
  `esPaquete` bit(1) DEFAULT NULL,
  `stock_idArticulo` int(11) DEFAULT NULL,
  `baseParaPrecio_id_articulo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_articulo`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 11264 kB' AUTO_INCREMENT=24198 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `base_para_precios`
--
CREATE TABLE IF NOT EXISTS `base_para_precios` (
`id_articulo` int(11)
,`descripcion` varchar(64)
,`costo` double
,`porcentajeImpuestos` double
,`porcentajeDescuentoLinea` double
,`porcentajeDescuentoGrupo` double
,`porcentajeDescuentoProducto` double
,`porcentajeUtilidad` double
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE IF NOT EXISTS `cajas` (
  `id_caja` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_almacen` int(10) unsigned NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uModificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `horaAbierta` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `horaCerrada` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `abierta` tinyint(1) DEFAULT '0',
  `uFolio` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `RFC` text COLLATE utf8_spanish_ci,
  `razonSocial` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cp` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descuento` double DEFAULT '0',
  `saldo` double DEFAULT '0',
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0',
  `razon_social` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=164 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_producto`
--

CREATE TABLE IF NOT EXISTS `codigo_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `producto_id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_4` (`codigo`),
  KEY `FK9F7CDC46CD51C500` (`producto_id_articulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=22753 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conteoinventario`
--

CREATE TABLE IF NOT EXISTS `conteoinventario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `completado` bit(1) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK997A080D61D916F4` (`id_usuario`),
  KEY `completadoIndex` (`completado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes`
--

CREATE TABLE IF NOT EXISTS `cortes` (
  `id_corte` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subtotal` double NOT NULL,
  `impuestos` double NOT NULL,
  `descuentos` double NOT NULL,
  `total` double NOT NULL,
  `n_ventas` int(11) NOT NULL,
  `desde` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `hasta` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `depositos` double NOT NULL DEFAULT '0',
  `retiros` double NOT NULL DEFAULT '0',
  `folio_inicial` bigint(20) unsigned NOT NULL DEFAULT '0',
  `folio_final` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_corte`,`id_caja`,`id_almacen`) USING BTREE,
  KEY `Index_2` (`fecha_hora`,`id_caja`,`id_almacen`),
  KEY `Index_3` (`fecha_hora`,`id_caja`),
  KEY `Index_4` (`fecha_hora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=6997 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes_dual`
--

CREATE TABLE IF NOT EXISTS `cortes_dual` (
  `id_corte` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subtotal` double NOT NULL,
  `impuestos` double NOT NULL,
  `descuentos` double NOT NULL,
  `total` double NOT NULL,
  `n_ventas` int(11) NOT NULL,
  `desde` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `hasta` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `depositos` double NOT NULL DEFAULT '0',
  `retiros` double NOT NULL DEFAULT '0',
  `folio_inicial` bigint(20) unsigned NOT NULL DEFAULT '0',
  `folio_final` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_corte`,`id_caja`,`id_almacen`) USING BTREE,
  KEY `Index_2` (`id_caja`),
  KEY `Index_3` (`id_caja`,`id_almacen`,`fecha_hora`),
  KEY `Index_4` (`id_caja`,`fecha_hora`),
  KEY `Index_5` (`fecha_hora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=6753 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes_sucursal`
--

CREATE TABLE IF NOT EXISTS `cortes_sucursal` (
  `id_corte` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_almacen` int(10) unsigned NOT NULL DEFAULT '0',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `desde` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hasta` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `depositos` double NOT NULL DEFAULT '0',
  `retiros` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_corte`),
  KEY `Index_2` (`desde`,`hasta`),
  KEY `Index_3` (`id_almacen`,`desde`,`hasta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1515 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencias`
--

CREATE TABLE IF NOT EXISTS `existencias` (
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `id_articulo` int(11) NOT NULL DEFAULT '0',
  `cantidad` double DEFAULT NULL,
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id_almacen`,`id_articulo`),
  KEY `Index_2` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE IF NOT EXISTS `facturas` (
  `id_factura` int(10) unsigned NOT NULL DEFAULT '0',
  `id_cliente` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario_expidio` varchar(255) NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `cancelada` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `usuario_cancelo` varchar(255) NOT NULL DEFAULT '0',
  `impuestos` double NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descuento` double NOT NULL DEFAULT '0',
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0',
  `u_modificacion` datetime DEFAULT '2000-01-01 00:00:00',
  KEY `Index_1` (`id_grupo`) USING HASH
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=369 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE IF NOT EXISTS `lineas` (
  `id_linea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descuento` double NOT NULL DEFAULT '0',
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id_linea`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=157 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_dual`
--

CREATE TABLE IF NOT EXISTS `lineas_dual` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_linea` int(10) unsigned NOT NULL,
  `version` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_almacen`
--

CREATE TABLE IF NOT EXISTS `movimientos_almacen` (
  `id_almacen` int(10) unsigned NOT NULL DEFAULT '0',
  `id_movimiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `tipo` text COLLATE latin1_spanish_ci NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `folio` text COLLATE latin1_spanish_ci NOT NULL,
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=FIXED AUTO_INCREMENT=2988 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_almacen_detalles`
--

CREATE TABLE IF NOT EXISTS `movimientos_almacen_detalles` (
  `id_movimiento` int(10) unsigned NOT NULL,
  `id_articulo` text NOT NULL,
  `cantidad` double NOT NULL DEFAULT '1',
  `costo` double unsigned NOT NULL,
  `id_detalle` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_almacen` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=66157 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_cortes`
--

CREATE TABLE IF NOT EXISTS `movimientos_cortes` (
  `tipo` enum('deposito','retiro','devolucion') NOT NULL DEFAULT 'deposito',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_almacen` int(10) unsigned NOT NULL,
  `id_caja` int(10) unsigned NOT NULL,
  `id_cajero` int(11) NOT NULL,
  `momento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `importe` double NOT NULL DEFAULT '0',
  `id_usuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tipo`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ID_USUARIO se refiere a quién lo autorizó' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoscortes`
--

CREATE TABLE IF NOT EXISTS `movimientoscortes` (
  `tipo` enum('ingreso','retiro','devolucion') NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_almacen` int(10) unsigned NOT NULL,
  `id_caja` int(10) unsigned NOT NULL,
  `id_cajero` int(11) NOT NULL,
  `momento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cantidad` double NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tipo`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ID_USUARIO se refiere a quién lo autorizó' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios`
--

CREATE TABLE IF NOT EXISTS `precios` (
  `id_precio` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_articulo` int(11) NOT NULL DEFAULT '0',
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `costo` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `utilidad` double NOT NULL DEFAULT '0',
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id_precio`),
  KEY `FKED0041EDBA11A89C` (`id_articulo`,`id_almacen`) USING BTREE,
  KEY `Index_3` (`id_articulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=24133 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencia`
--

CREATE TABLE IF NOT EXISTS `preferencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` longtext NOT NULL,
  `valor` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sincronizacion`
--

CREATE TABLE IF NOT EXISTS `sincronizacion` (
  `tabla` varchar(32) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `uModificacion` varchar(14) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`tabla`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE IF NOT EXISTS `sucursales` (
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hAbierta` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `hCerrada` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `uModificacion` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `abierta` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_almacen`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr_sucursal`
--

CREATE TABLE IF NOT EXISTS `usr_sucursal` (
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `perfil` float DEFAULT '0',
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`,`id_almacen`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime NOT NULL,
  `huella1` blob,
  `huella2` blob,
  `huella3` blob,
  `nip` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `uModificacion` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `facturada` int(11) DEFAULT '0',
  `completada` int(11) DEFAULT '0',
  `subtotal` double DEFAULT '0',
  `descuento` double DEFAULT '0',
  `impuestos` double DEFAULT '0',
  `total` double DEFAULT '0',
  `id_usuario` int(10) unsigned NOT NULL,
  `efectivo` double NOT NULL DEFAULT '0',
  `cambio` double NOT NULL DEFAULT '0',
  `centecimosredondeados` double NOT NULL DEFAULT '0',
  `folio` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_venta`,`id_caja`,`id_almacen`) USING BTREE,
  KEY `Index_2` (`fecha_hora`),
  KEY `Index_3` (`id_venta`,`id_caja`,`id_almacen`,`fecha_hora`),
  KEY `ParaVentasPersistentes` (`completada`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=FIXED AUTO_INCREMENT=2455666 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalles`
--

CREATE TABLE IF NOT EXISTS `ventas_detalles` (
  `id_renglon` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL DEFAULT '0',
  `id_caja` int(11) NOT NULL DEFAULT '0',
  `id_almacen` int(11) NOT NULL DEFAULT '0',
  `id_articulo` int(11) DEFAULT NULL,
  `precio` double NOT NULL DEFAULT '0',
  `cantidad` double DEFAULT '0',
  `tipo_salida` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `impuestos` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `id_linea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_renglon`,`id_venta`,`id_caja`,`id_almacen`) USING BTREE,
  KEY `Index_2` (`id_venta`) USING BTREE,
  KEY `Index_3` (`id_articulo`) USING BTREE,
  KEY `FKEBC0AF7470B65FE7` (`id_venta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3150788 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_facturadas`
--

CREATE TABLE IF NOT EXISTS `ventas_facturadas` (
  `id_factura` int(10) unsigned NOT NULL,
  `id_venta` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasprecioespecial`
--

CREATE TABLE IF NOT EXISTS `ventasprecioespecial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_venta` int(10) unsigned NOT NULL,
  `id_autorizador` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2320 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `base_para_precios`
--
DROP TABLE IF EXISTS `base_para_precios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `base_para_precios` AS select `a`.`id_articulo` AS `id_articulo`,`a`.`descripcion` AS `descripcion`,`p`.`costo` AS `costo`,`a`.`impuestos` AS `porcentajeImpuestos`,`l`.`descuento` AS `porcentajeDescuentoLinea`,`g`.`descuento` AS `porcentajeDescuentoGrupo`,`p`.`descuento` AS `porcentajeDescuentoProducto`,`p`.`utilidad` AS `porcentajeUtilidad` from (((`articulos` `a` join `precios` `p`) join `lineas` `l`) join `grupos` `g`) where ((`a`.`id_articulo` = `p`.`id_articulo`) and (`a`.`id_linea` = `l`.`id_linea`) and (`a`.`id_grupo` = `g`.`id_grupo`));

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `Cancelacion`
--
ALTER TABLE `Cancelacion`
  ADD CONSTRAINT `FK5D0F64C2A677CBD` FOREIGN KEY (`cajero_id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `FK5D0F64CB3E87FB` FOREIGN KEY (`articulo_id_articulo`) REFERENCES `articulos` (`id_articulo`),
  ADD CONSTRAINT `FK5D0F64CBC58D3F9` FOREIGN KEY (`autorizador_id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `ConteoInventario_items`
--
ALTER TABLE `ConteoInventario_items`
  ADD CONSTRAINT `FK9F9F550ECBC7D7AF` FOREIGN KEY (`ConteoInventario_id`) REFERENCES `conteoinventario` (`id`);

--
-- Filtros para la tabla `Paquete`
--
ALTER TABLE `Paquete`
  ADD CONSTRAINT `FK33E7B1813C323E39` FOREIGN KEY (`productoContenido_id_articulo`) REFERENCES `articulos` (`id_articulo`),
  ADD CONSTRAINT `FK33E7B1813F08A1D` FOREIGN KEY (`productoContenedor_id_articulo`) REFERENCES `articulos` (`id_articulo`);

--
-- Filtros para la tabla `anotaciones`
--
ALTER TABLE `anotaciones`
  ADD CONSTRAINT `fk_almacen` FOREIGN KEY (`id_almacen`) REFERENCES `almacenes` (`id_almacen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `codigo_producto`
--
ALTER TABLE `codigo_producto`
  ADD CONSTRAINT `FK9F7CDC46CD51C500` FOREIGN KEY (`producto_id_articulo`) REFERENCES `articulos` (`id_articulo`);

--
-- Filtros para la tabla `conteoinventario`
--
ALTER TABLE `conteoinventario`
  ADD CONSTRAINT `FK997A080D61D916F4` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `ventas_detalles`
--
ALTER TABLE `ventas_detalles`
  ADD CONSTRAINT `FKEBC0AF7470B65FE7` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);