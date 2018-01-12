-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "boleta" -----------------------------------
CREATE TABLE `boleta` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`cuenta_id` Int( 255 ) NOT NULL,
	`folio` VarChar( 255 ) NOT NULL,
	`monto` Int( 255 ) NOT NULL,
	`adjunto` VarChar( 255 ) NULL,
	`fecha` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`estado` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "boleta_pago" ------------------------------
CREATE TABLE `boleta_pago` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`fecha` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`cuota` Int( 255 ) NOT NULL,
	`monto` Int( 255 ) NOT NULL,
	`gastocomun_id` Int( 255 ) NULL,
	`boleta_id` Int( 255 ) NOT NULL,
	`adjunto` VarChar( 255 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "cuenta" -----------------------------------
CREATE TABLE `cuenta` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 255 ) NOT NULL,
	`tipo` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 9;
-- ---------------------------------------------------------


-- CREATE TABLE "departamento" -----------------------------
CREATE TABLE `departamento` ( 
	`id` Int( 255 ) NOT NULL,
	`nombre` VarChar( 255 ) NOT NULL,
	`alicuota` Double( 22, 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "departamento_pago" ------------------------
CREATE TABLE `departamento_pago` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`fecha` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`monto` Int( 255 ) NOT NULL,
	`departamento_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "gastocomun" -------------------------------
CREATE TABLE `gastocomun` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`fecha` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`fecha_vencimiento` Timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "liquidacion" ------------------------------
CREATE TABLE `liquidacion` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`personal_id` Int( 255 ) NOT NULL,
	`fecha` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`gastocomun_id` Int( 255 ) NULL,
	`adjunto` VarChar( 255 ) NOT NULL,
	`monto_haberes` Int( 255 ) NOT NULL,
	`monto_descuentos` Int( 255 ) NOT NULL,
	`monto_liquido` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "liquidacion_item" -------------------------
CREATE TABLE `liquidacion_item` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`liquidacion_id` Int( 255 ) NOT NULL,
	`monto` Int( 255 ) NOT NULL,
	`personal_item_id` Int( 255 ) NULL,
	`nombre` VarChar( 255 ) NOT NULL,
	`tipo` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "mapa_gastocomun_departamento" -------------
CREATE TABLE `mapa_gastocomun_departamento` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`gastocomun_id` Int( 255 ) NOT NULL,
	`departamento_id` Int( 255 ) NOT NULL,
	`monto_comun` Int( 255 ) NOT NULL,
	`monto_agua` Int( 255 ) NOT NULL,
	`monto_reserva` Int( 255 ) NOT NULL,
	`monto_interes` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "personal" ---------------------------------
CREATE TABLE `personal` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`nombres` VarChar( 255 ) NOT NULL,
	`apellidos` VarChar( 255 ) NOT NULL,
	`direccion` VarChar( 255 ) NOT NULL,
	`estado` Int( 255 ) NOT NULL,
	`rut` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "personal_item" ----------------------------
CREATE TABLE `personal_item` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 255 ) NOT NULL,
	`monto` Double( 22, 0 ) NOT NULL,
	`tipo` Int( 255 ) NOT NULL,
	`personal_id` Int( 11 ) NOT NULL,
	`es_porcentaje` Int( 255 ) NOT NULL DEFAULT '0',
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- ---------------------------------------------------------


-- CREATE TABLE "personal_pago" ----------------------------
CREATE TABLE `personal_pago` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`fecha` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`tipo` Int( 255 ) NOT NULL,
	`monto` Int( 255 ) NOT NULL,
	`descripcion` Text NOT NULL,
	`personal_id` Int( 255 ) NOT NULL,
	`liquidacion_id` Int( 255 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- Dump data of "boleta" -----------------------------------
INSERT INTO `boleta`(`id`,`cuenta_id`,`folio`,`monto`,`adjunto`,`fecha`,`estado`) VALUES ( '1', '7', '112233', '10990', 'http://1.bp.blogspot.com/-WgOHfsG5vKw/UfNNoqa9E-I/AAAAAAAAAsg/zVPOWPohlIo/s1600/Boleta+de+venta.png', '2018-01-10 16:47:10', '1' );
INSERT INTO `boleta`(`id`,`cuenta_id`,`folio`,`monto`,`adjunto`,`fecha`,`estado`) VALUES ( '3', '7', '114455', '20990', '', '2018-01-14 00:00:00', '0' );
-- ---------------------------------------------------------


-- Dump data of "boleta_pago" ------------------------------
INSERT INTO `boleta_pago`(`id`,`fecha`,`cuota`,`monto`,`gastocomun_id`,`boleta_id`,`adjunto`) VALUES ( '1', '2018-01-11 00:00:00', '0', '11000', NULL, '3', 'https://blog.zerial.org/wp-content/uploads/2011/08/srvpag_comprob1.png' );
INSERT INTO `boleta_pago`(`id`,`fecha`,`cuota`,`monto`,`gastocomun_id`,`boleta_id`,`adjunto`) VALUES ( '2', '2018-01-09 00:00:00', '0', '50000', NULL, '1', '' );
-- ---------------------------------------------------------


-- Dump data of "cuenta" -----------------------------------
INSERT INTO `cuenta`(`id`,`nombre`,`tipo`) VALUES ( '1', 'Jardinero', '0' );
INSERT INTO `cuenta`(`id`,`nombre`,`tipo`) VALUES ( '2', 'Enel', '0' );
INSERT INTO `cuenta`(`id`,`nombre`,`tipo`) VALUES ( '3', 'Acensores', '1' );
INSERT INTO `cuenta`(`id`,`nombre`,`tipo`) VALUES ( '7', 'Cuenta con pagos', '0' );
-- ---------------------------------------------------------


-- Dump data of "departamento" -----------------------------
-- ---------------------------------------------------------


-- Dump data of "departamento_pago" ------------------------
-- ---------------------------------------------------------


-- Dump data of "gastocomun" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "liquidacion" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "liquidacion_item" -------------------------
-- ---------------------------------------------------------


-- Dump data of "mapa_gastocomun_departamento" -------------
-- ---------------------------------------------------------


-- Dump data of "personal" ---------------------------------
INSERT INTO `personal`(`id`,`nombres`,`apellidos`,`direccion`,`estado`,`rut`) VALUES ( '1', 'aa', 'aa', 'aa', '0', '1-1' );
INSERT INTO `personal`(`id`,`nombres`,`apellidos`,`direccion`,`estado`,`rut`) VALUES ( '2', 'bb', 'bb', 'bb', '0', '22' );
INSERT INTO `personal`(`id`,`nombres`,`apellidos`,`direccion`,`estado`,`rut`) VALUES ( '3', 'Jorge', 'Talloni', 'Armando Moock 3727', '0', '11111111-1' );
-- ---------------------------------------------------------


-- Dump data of "personal_item" ----------------------------
INSERT INTO `personal_item`(`id`,`nombre`,`monto`,`tipo`,`personal_id`,`es_porcentaje`) VALUES ( '1', 'AFP Habitat Comision', '10.25', '2', '3', '1' );
INSERT INTO `personal_item`(`id`,`nombre`,`monto`,`tipo`,`personal_id`,`es_porcentaje`) VALUES ( '2', 'AFP Habitat Fondo', '12.2', '2', '3', '1' );
INSERT INTO `personal_item`(`id`,`nombre`,`monto`,`tipo`,`personal_id`,`es_porcentaje`) VALUES ( '3', 'Impuesto unico', '40000', '2', '3', '0' );
INSERT INTO `personal_item`(`id`,`nombre`,`monto`,`tipo`,`personal_id`,`es_porcentaje`) VALUES ( '4', 'Isapre Banmedia', '128000', '2', '3', '0' );
INSERT INTO `personal_item`(`id`,`nombre`,`monto`,`tipo`,`personal_id`,`es_porcentaje`) VALUES ( '5', 'Sueldo Bruto', '900000', '1', '3', '0' );
INSERT INTO `personal_item`(`id`,`nombre`,`monto`,`tipo`,`personal_id`,`es_porcentaje`) VALUES ( '6', 'Movilizacion', '30000', '1', '3', '0' );
-- ---------------------------------------------------------


-- Dump data of "personal_pago" ----------------------------
INSERT INTO `personal_pago`(`id`,`fecha`,`tipo`,`monto`,`descripcion`,`personal_id`,`liquidacion_id`) VALUES ( '1', '2018-01-12 18:12:53', '1', '150000', '', '3', NULL );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_boleta_cuenta" ------------------------
CREATE INDEX `lnk_boleta_cuenta` USING BTREE ON `boleta`( `cuenta_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_boleta_pago_boleta" -------------------
CREATE INDEX `lnk_boleta_pago_boleta` USING BTREE ON `boleta_pago`( `boleta_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_null_boleta_pago_gastocomun" ----------
CREATE INDEX `lnk_null_boleta_pago_gastocomun` USING BTREE ON `boleta_pago`( `gastocomun_id` );
-- ---------------------------------------------------------


-- CREATE TRIGGER "trigger_insert_boleta_pago" -------------

delimiter $$$ 
CREATE DEFINER=`root`@`localhost` TRIGGER trigger_insert_boleta_pago AFTER INSERT ON boleta_pago
       FOR EACH ROW
       BEGIN
           DECLARE _total_pagado INT;
           DECLARE _total_adeudado INT;
           SET _total_pagado = (SELECT SUM(monto) FROM boleta_pago WHERE boleta_id = NEW.boleta_id);
           SET _total_adeudado = (SELECT monto FROM boleta WHERE id = NEW.boleta_id);
           IF _total_pagado < _total_adeudado THEN
               UPDATE boleta SET estado=0 WHERE id = NEW.boleta_id;
           ELSE
               UPDATE boleta SET estado=1 WHERE id = NEW.boleta_id;
           END IF;
       END;

$$$ delimiter ;
-- ---------------------------------------------------------


-- CREATE TRIGGER "trigger_delete_boleta_pago" -------------

delimiter $$$ 
CREATE DEFINER=`root`@`localhost` TRIGGER trigger_delete_boleta_pago AFTER DELETE ON boleta_pago
       FOR EACH ROW
       BEGIN
           DECLARE _total_pagado INT;
           DECLARE _total_adeudado INT;
           SET _total_pagado = (SELECT SUM(monto) FROM boleta_pago WHERE boleta_id = OLD.boleta_id);
           SET _total_adeudado = (SELECT monto FROM boleta WHERE id = OLD.boleta_id);
           IF _total_pagado < _total_adeudado THEN
               UPDATE boleta SET estado=0 WHERE id = OLD.boleta_id;
           ELSE
               UPDATE boleta SET estado=1 WHERE id = OLD.boleta_id;
           END IF;
       END;

$$$ delimiter ;
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_departamento_pago_departamento" -------
CREATE INDEX `lnk_departamento_pago_departamento` USING BTREE ON `departamento_pago`( `departamento_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_liquidacion_personal" -----------------
CREATE INDEX `lnk_liquidacion_personal` USING BTREE ON `liquidacion`( `personal_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_null_liquidacion_gastocomun" ----------
CREATE INDEX `lnk_null_liquidacion_gastocomun` USING BTREE ON `liquidacion`( `gastocomun_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_liquidacion_item_liquidacion" ---------
CREATE INDEX `lnk_liquidacion_item_liquidacion` USING BTREE ON `liquidacion_item`( `liquidacion_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_null_liquidacion_item_personal_item" --
CREATE INDEX `lnk_null_liquidacion_item_personal_item` USING BTREE ON `liquidacion_item`( `personal_item_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_mapa_gastocomun_departamento_departamento" 
CREATE INDEX `lnk_mapa_gastocomun_departamento_departamento` USING BTREE ON `mapa_gastocomun_departamento`( `departamento_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_mapa_gastocomun_departamento_gastocomun" 
CREATE INDEX `lnk_mapa_gastocomun_departamento_gastocomun` USING BTREE ON `mapa_gastocomun_departamento`( `gastocomun_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_personal_item_personal" ---------------
CREATE INDEX `lnk_personal_item_personal` USING BTREE ON `personal_item`( `personal_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_null_personal_pago_liquidacion" -------
CREATE INDEX `lnk_null_personal_pago_liquidacion` USING BTREE ON `personal_pago`( `liquidacion_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_personal_pago_personal" ---------------
CREATE INDEX `lnk_personal_pago_personal` USING BTREE ON `personal_pago`( `personal_id` );
-- ---------------------------------------------------------


-- CREATE LINK "lnk_boleta_cuenta" -------------------------
ALTER TABLE `boleta`
	ADD CONSTRAINT `lnk_boleta_cuenta` FOREIGN KEY ( `cuenta_id` )
	REFERENCES `cuenta`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_boleta_pago_boleta" --------------------
ALTER TABLE `boleta_pago`
	ADD CONSTRAINT `lnk_boleta_pago_boleta` FOREIGN KEY ( `boleta_id` )
	REFERENCES `boleta`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_null_boleta_pago_gastocomun" -----------
ALTER TABLE `boleta_pago`
	ADD CONSTRAINT `lnk_null_boleta_pago_gastocomun` FOREIGN KEY ( `gastocomun_id` )
	REFERENCES `gastocomun`( `id` )
	ON DELETE Set NULL
	ON UPDATE Set NULL;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_departamento_pago_departamento" --------
ALTER TABLE `departamento_pago`
	ADD CONSTRAINT `lnk_departamento_pago_departamento` FOREIGN KEY ( `departamento_id` )
	REFERENCES `departamento`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_liquidacion_personal" ------------------
ALTER TABLE `liquidacion`
	ADD CONSTRAINT `lnk_liquidacion_personal` FOREIGN KEY ( `personal_id` )
	REFERENCES `personal`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_null_liquidacion_gastocomun" -----------
ALTER TABLE `liquidacion`
	ADD CONSTRAINT `lnk_null_liquidacion_gastocomun` FOREIGN KEY ( `gastocomun_id` )
	REFERENCES `gastocomun`( `id` )
	ON DELETE Set NULL
	ON UPDATE Set NULL;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_liquidacion_item_liquidacion" ----------
ALTER TABLE `liquidacion_item`
	ADD CONSTRAINT `lnk_liquidacion_item_liquidacion` FOREIGN KEY ( `liquidacion_id` )
	REFERENCES `liquidacion`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_null_liquidacion_item_personal_item" ---
ALTER TABLE `liquidacion_item`
	ADD CONSTRAINT `lnk_null_liquidacion_item_personal_item` FOREIGN KEY ( `personal_item_id` )
	REFERENCES `personal_item`( `id` )
	ON DELETE Set NULL
	ON UPDATE Set NULL;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_mapa_gastocomun_departamento_departamento" 
ALTER TABLE `mapa_gastocomun_departamento`
	ADD CONSTRAINT `lnk_mapa_gastocomun_departamento_departamento` FOREIGN KEY ( `departamento_id` )
	REFERENCES `departamento`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_mapa_gastocomun_departamento_gastocomun" 
ALTER TABLE `mapa_gastocomun_departamento`
	ADD CONSTRAINT `lnk_mapa_gastocomun_departamento_gastocomun` FOREIGN KEY ( `gastocomun_id` )
	REFERENCES `gastocomun`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_personal_item_personal" ----------------
ALTER TABLE `personal_item`
	ADD CONSTRAINT `lnk_personal_item_personal` FOREIGN KEY ( `personal_id` )
	REFERENCES `personal`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_null_personal_pago_liquidacion" --------
ALTER TABLE `personal_pago`
	ADD CONSTRAINT `lnk_null_personal_pago_liquidacion` FOREIGN KEY ( `liquidacion_id` )
	REFERENCES `liquidacion`( `id` )
	ON DELETE Set NULL
	ON UPDATE Set NULL;
-- ---------------------------------------------------------


-- CREATE LINK "lnk_personal_pago_personal" ----------------
ALTER TABLE `personal_pago`
	ADD CONSTRAINT `lnk_personal_pago_personal` FOREIGN KEY ( `personal_id` )
	REFERENCES `personal`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


