-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2026 a las 02:13:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_construccion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL,
  `nombre_area` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_area`, `nombre_area`, `descripcion`) VALUES
(1, 'Almacén Central', 'Recepción, almacenamiento, compras y entrega de materiales'),
(2, 'Oficina Técnica', 'Supervisión, aprobación de solicitudes y administración'),
(3, 'Obra', 'Frentes de obra: solicitud y recepción de materiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `cantidad_recibida` decimal(10,2) NOT NULL DEFAULT 0.00
) ;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id_detalle_compra`, `id_orden`, `id_material`, `cantidad`, `cantidad_recibida`) VALUES
(1, 1, 1, 10.00, 10.00),
(2, 1, 5, 100.00, 100.00),
(3, 2, 13, 8.00, 8.00),
(4, 3, 9, 50.00, 0.00),
(5, 3, 16, 10.00, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_requisito`
--

CREATE TABLE `detalle_requisito` (
  `id_detalle_requisito` int(11) NOT NULL,
  `id_requisito` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ;

--
-- Volcado de datos para la tabla `detalle_requisito`
--

INSERT INTO `detalle_requisito` (`id_detalle_requisito`, `id_requisito`, `id_material`, `cantidad`) VALUES
(1, 1, 1, 10.00),
(2, 1, 5, 100.00),
(3, 2, 8, 10.00),
(4, 2, 14, 10.00),
(5, 3, 13, 8.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida`
--

CREATE TABLE `detalle_salida` (
  `id_detalle_salida` int(11) NOT NULL,
  `id_salida` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ;

--
-- Volcado de datos para la tabla `detalle_salida`
--

INSERT INTO `detalle_salida` (`id_detalle_salida`, `id_salida`, `id_material`, `cantidad`) VALUES
(1, 1, 1, 50.00),
(2, 1, 2, 30.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id_material` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `stock_actual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock_minimo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`id_material`, `nombre`, `unidad_medida`, `stock_actual`, `stock_minimo`, `precio_unitario`, `estado`) VALUES
(1, 'Cemento Portland IP-30', 'bolsa', 210.00, 50.00, 58.00, 1),
(2, 'Arena fina', 'm³', 10.00, 10.00, 120.00, 1),
(3, 'Grava / ripio', 'm³', 35.00, 10.00, 135.00, 1),
(4, 'Ladrillo 6 huecos', 'unidad', 5000.00, 1000.00, 1.20, 1),
(5, 'Fierro corrugado 8 mm', 'barra', 280.00, 40.00, 42.00, 1),
(6, 'Fierro corrugado 12 mm', 'barra', 120.00, 30.00, 95.00, 1),
(7, 'Alambre de amarre', 'kg', 60.00, 15.00, 14.00, 1),
(8, 'Clavos 3 pulgadas', 'kg', 25.00, 10.00, 16.00, 1),
(9, 'Tubo PVC 4 pulgadas', 'unidad', 45.00, 15.00, 68.00, 1),
(10, 'Pintura látex blanca (balde)', 'balde', 12.00, 12.00, 210.00, 1),
(11, 'Calamina ondulada N°28', 'plancha', 80.00, 20.00, 75.00, 1),
(12, 'Madera tabla 2x8', 'unidad', 70.00, 20.00, 48.00, 1),
(13, 'Yeso', 'bolsa', 16.00, 10.00, 25.00, 1),
(14, 'Cable eléctrico N°12', 'rollo', 18.00, 5.00, 180.00, 1),
(15, 'Cal hidratada', 'bolsa', 30.00, 10.00, 32.00, 1),
(16, 'metal', 'rollo', 50.00, 5.00, 50.00, 1),
(17, 'arena', 'm³', 60.00, 50.00, 50.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `id_movimiento` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `stock_resultante` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `id_salida` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos_inventario`
--

INSERT INTO `movimientos_inventario` (`id_movimiento`, `id_material`, `tipo`, `cantidad`, `stock_resultante`, `fecha`, `id_orden`, `id_salida`, `id_usuario`) VALUES
(1, 16, 'entrada', 50.00, 50.00, '2026-11-03 20:25:17', NULL, NULL, 1),
(2, 1, 'entrada', 10.00, 260.00, '2026-11-03 21:51:53', 1, NULL, 4),
(3, 5, 'entrada', 100.00, 280.00, '2026-11-03 21:51:53', 1, NULL, 4),
(4, 17, 'entrada', 60.00, 60.00, '2026-11-14 22:32:47', NULL, NULL, 1),
(5, 13, 'entrada', 8.00, 16.00, '2026-11-15 11:39:18', 2, NULL, 4),
(6, 1, 'salida', 50.00, 210.00, '2026-11-15 11:44:30', NULL, 1, 5),
(7, 2, 'salida', 30.00, 10.00, '2026-11-15 11:44:30', NULL, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_compra`
--

CREATE TABLE `ordenes_compra` (
  `id_orden` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_requisito` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `estado` enum('emitida','recibida','anulada') NOT NULL DEFAULT 'emitida',
  `fecha_recepcion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ordenes_compra`
--

INSERT INTO `ordenes_compra` (`id_orden`, `id_proveedor`, `id_requisito`, `id_usuario`, `fecha_emision`, `estado`, `fecha_recepcion`) VALUES
(1, 2, 1, 4, '2026-11-03', 'recibida', '2026-11-03 21:51:53'),
(2, 2, 3, 4, '2026-11-15', 'recibida', '2026-11-15 11:39:18'),
(3, 1, NULL, 4, '2026-11-17', 'emitida', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `razon_social`, `nit`, `telefono`, `correo`, `estado`) VALUES
(1, 'Ferretería El Constructor S.R.L.', '1023456011', '22411234', 'ventas@elconstructor.bo', 1),
(2, 'Cementos y Agregados Andinos S.A.', '1034567022', '22765432', 'pedidos@andinos.bo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisitos`
--

CREATE TABLE `requisitos` (
  `id_requisito` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL DEFAULT 'pendiente',
  `id_aprobador` int(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `requisitos`
--

INSERT INTO `requisitos` (`id_requisito`, `id_area`, `id_usuario`, `fecha`, `estado`, `id_aprobador`, `observaciones`) VALUES
(1, 3, 3, '2026-11-03 21:18:53', 'aprobada', 2, 'para el dia martes'),
(2, 3, 3, '2026-11-03 21:19:49', 'rechazada', 2, 'no aceptar error | Supervisor: material insuficinete por el momento'),
(3, 3, 3, '2026-11-15 11:36:57', 'aprobada', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `rol` enum('administrador','supervisor','operario','enc_compras','enc_almacen','jefe_obra') NOT NULL,
  `id_area` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_completo`, `nombre_usuario`, `contrasena_hash`, `rol`, `id_area`, `estado`) VALUES
(1, 'Administrador del Sistema', 'admin', 'sha3-256$10000$138764755bb8760a2b2e84b8b173eb52$042aee0c9b465502fe30c641a49841a8831b800c7fe95cfc52eedcf5edd628ea', 'administrador', 2, 1),
(2, 'Sofía Mamani (Supervisor)', 'supervisor', 'sha3-256$10000$902c80be25a99ad4412fd85e50ea2489$61d8aabc0a27861a8d453581f20e4217852833aac8c8237a008e0f3a0f557af6', 'supervisor', 2, 1),
(3, 'Juan Condori (Operario)', 'operario', 'sha3-256$10000$63bad1a6072de3c543f3ed5b7fdf9e39$9247fcdcfb5b57ca8de905a9f3fe3915b79abbca7eb63871dbcf734fbc939810', 'operario', 3, 1),
(4, 'Marta Quispe (Compras)', 'compras', 'sha3-256$10000$f70695695c9cfe5604473cdd8bacdcb0$bbd1cf965ef7fdfe2a39fd88843845519491615336ea1abeb998edd8e37ff819', 'enc_compras', 1, 1),
(5, 'Pedro Choque (Almacén)', 'almacen', 'sha3-256$10000$ceb5496382d139c0485d36d6b6423f5e$68640ca920e42b95218c9d4d53ba7084d793735cd10f88ca24f61a823c66db5c', 'enc_almacen', 1, 1),
(6, 'Luis Flores (Jefe de obra)', 'jefeobra', 'sha3-256$10000$8997d2bbc088c35938aa5fb10ba2dc0c$9c4b6c1ec07667d2c7071899b983a3727bb8f2004ee992a35e3a34b137653580', 'jefe_obra', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_salidas`
--

CREATE TABLE `ventas_salidas` (
  `id_salida` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `frente_obra` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('registrada','entregada','confirmada') NOT NULL DEFAULT 'registrada',
  `fecha_entrega` datetime DEFAULT NULL,
  `id_usuario_entrega` int(11) DEFAULT NULL,
  `fecha_confirmacion` datetime DEFAULT NULL,
  `id_usuario_confirma` int(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas_salidas`
--

INSERT INTO `ventas_salidas` (`id_salida`, `id_area`, `frente_obra`, `id_usuario`, `fecha`, `estado`, `fecha_entrega`, `id_usuario_entrega`, `fecha_confirmacion`, `id_usuario_confirma`, `observaciones`) VALUES
(1, 1, 'edificoo norte Lapaz torres moll', 5, '2026-11-15 11:44:30', 'registrada', NULL, NULL, NULL, NULL, 'mandamo con envio especial');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_area`),
  ADD UNIQUE KEY `nombre_area` (`nombre_area`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `fk_detc_orden` (`id_orden`),
  ADD KEY `fk_detc_mat` (`id_material`);

--
-- Indices de la tabla `detalle_requisito`
--
ALTER TABLE `detalle_requisito`
  ADD PRIMARY KEY (`id_detalle_requisito`),
  ADD KEY `fk_detreq_req` (`id_requisito`),
  ADD KEY `fk_detreq_mat` (`id_material`);

--
-- Indices de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD PRIMARY KEY (`id_detalle_salida`),
  ADD KEY `fk_dets_salida` (`id_salida`),
  ADD KEY `fk_dets_mat` (`id_material`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id_material`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `fk_mov_mat` (`id_material`),
  ADD KEY `fk_mov_orden` (`id_orden`),
  ADD KEY `fk_mov_salida` (`id_salida`),
  ADD KEY `fk_mov_usuario` (`id_usuario`);

--
-- Indices de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `fk_oc_prov` (`id_proveedor`),
  ADD KEY `fk_oc_req` (`id_requisito`),
  ADD KEY `fk_oc_usu` (`id_usuario`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `nit` (`nit`);

--
-- Indices de la tabla `requisitos`
--
ALTER TABLE `requisitos`
  ADD PRIMARY KEY (`id_requisito`),
  ADD KEY `fk_req_area` (`id_area`),
  ADD KEY `fk_req_usuario` (`id_usuario`),
  ADD KEY `fk_req_aprobador` (`id_aprobador`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD KEY `fk_usuarios_area` (`id_area`);

--
-- Indices de la tabla `ventas_salidas`
--
ALTER TABLE `ventas_salidas`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `fk_vs_area` (`id_area`),
  ADD KEY `fk_vs_usuario` (`id_usuario`),
  ADD KEY `fk_vs_entrega` (`id_usuario_entrega`),
  ADD KEY `fk_vs_confirma` (`id_usuario_confirma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_requisito`
--
ALTER TABLE `detalle_requisito`
  MODIFY `id_detalle_requisito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  MODIFY `id_detalle_salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `requisitos`
--
ALTER TABLE `requisitos`
  MODIFY `id_requisito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas_salidas`
--
ALTER TABLE `ventas_salidas`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `fk_detc_mat` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`),
  ADD CONSTRAINT `fk_detc_orden` FOREIGN KEY (`id_orden`) REFERENCES `ordenes_compra` (`id_orden`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_requisito`
--
ALTER TABLE `detalle_requisito`
  ADD CONSTRAINT `fk_detreq_mat` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`),
  ADD CONSTRAINT `fk_detreq_req` FOREIGN KEY (`id_requisito`) REFERENCES `requisitos` (`id_requisito`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD CONSTRAINT `fk_dets_mat` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`),
  ADD CONSTRAINT `fk_dets_salida` FOREIGN KEY (`id_salida`) REFERENCES `ventas_salidas` (`id_salida`) ON DELETE CASCADE;

--
-- Filtros para la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD CONSTRAINT `fk_mov_mat` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`),
  ADD CONSTRAINT `fk_mov_orden` FOREIGN KEY (`id_orden`) REFERENCES `ordenes_compra` (`id_orden`),
  ADD CONSTRAINT `fk_mov_salida` FOREIGN KEY (`id_salida`) REFERENCES `ventas_salidas` (`id_salida`),
  ADD CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  ADD CONSTRAINT `fk_oc_prov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `fk_oc_req` FOREIGN KEY (`id_requisito`) REFERENCES `requisitos` (`id_requisito`),
  ADD CONSTRAINT `fk_oc_usu` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `requisitos`
--
ALTER TABLE `requisitos`
  ADD CONSTRAINT `fk_req_aprobador` FOREIGN KEY (`id_aprobador`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_req_area` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  ADD CONSTRAINT `fk_req_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_area` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`);

--
-- Filtros para la tabla `ventas_salidas`
--
ALTER TABLE `ventas_salidas`
  ADD CONSTRAINT `fk_vs_area` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  ADD CONSTRAINT `fk_vs_confirma` FOREIGN KEY (`id_usuario_confirma`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_vs_entrega` FOREIGN KEY (`id_usuario_entrega`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_vs_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
