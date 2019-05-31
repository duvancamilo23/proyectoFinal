SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `tiendadb` DEFAULT CHARACTER SET utf8 ;
USE `tiendadb` ;

-- -----------------------------------------------------
-- Table `tiendadb`.`cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`cliente` (
  `idcliente` INT(11) NOT NULL ,
  `nombre` VARCHAR(30) NOT NULL ,
  `direccion` VARCHAR(30) NOT NULL ,
  `telefono` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idcliente`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`inventario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`inventario` (
  `idinventario` INT(11) NOT NULL ,
  `producto` VARCHAR(45) NOT NULL ,
  `marca` VARCHAR(45) NOT NULL ,
  `color` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idinventario`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`empleado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`empleado` (
  `idempleado` INT(11) NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `cargo` VARCHAR(45) NOT NULL ,
  `telefono` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idempleado`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`cliente_has_empleado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`cliente_has_empleado` (
  `cliente_idcliente` INT(11) NOT NULL ,
  `empleado_idempleado` INT(11) NOT NULL ,
  PRIMARY KEY (`cliente_idcliente`, `empleado_idempleado`) ,
  INDEX `fk_cliente_has_empleado_empleado1_idx` (`empleado_idempleado` ASC) ,
  INDEX `fk_cliente_has_empleado_cliente_idx` (`cliente_idcliente` ASC) ,
  CONSTRAINT `fk_cliente_has_empleado_cliente`
    FOREIGN KEY (`cliente_idcliente` )
    REFERENCES `tiendadb`.`cliente` (`idcliente` ),
  CONSTRAINT `fk_cliente_has_empleado_empleado1`
    FOREIGN KEY (`empleado_idempleado` )
    REFERENCES `tiendadb`.`empleado` (`idempleado` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`proveedor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`proveedor` (
  `idproveedor` INT(11) NOT NULL ,
  `ordendecompra` VARCHAR(45) NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `telefono` INT(11) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idproveedor`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`empleado_has_proveedor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`empleado_has_proveedor` (
  `empleado_idempleado` INT(11) NOT NULL ,
  `proveedor_idproveedor` INT(11) NOT NULL ,
  PRIMARY KEY (`empleado_idempleado`, `proveedor_idproveedor`) ,
  INDEX `fk_empleado_has_proveedor_proveedor1_idx` (`proveedor_idproveedor` ASC) ,
  INDEX `fk_empleado_has_proveedor_empleado1_idx` (`empleado_idempleado` ASC) ,
  CONSTRAINT `fk_empleado_has_proveedor_empleado1`
    FOREIGN KEY (`empleado_idempleado` )
    REFERENCES `tiendadb`.`empleado` (`idempleado` ),
  CONSTRAINT `fk_empleado_has_proveedor_proveedor1`
    FOREIGN KEY (`proveedor_idproveedor` )
    REFERENCES `tiendadb`.`proveedor` (`idproveedor` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`factura`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`factura` (
  `idfactura` INT(11) NOT NULL ,
  `producto` VARCHAR(45) NOT NULL ,
  `precio` INT NOT NULL ,
  `marca` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  `fecha` VARCHAR(20) NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idfactura`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`cliente_has_factura`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`cliente_has_factura` (
  `cliente_idcliente` INT(11) NOT NULL ,
  `factura_idfactura` INT(11) NOT NULL ,
  PRIMARY KEY (`cliente_idcliente`, `factura_idfactura`) ,
  INDEX `fk_cliente_has_factura_factura1_idx` (`factura_idfactura` ASC) ,
  INDEX `fk_cliente_has_factura_cliente1_idx` (`cliente_idcliente` ASC) ,
  CONSTRAINT `fk_cliente_has_factura_cliente1`
    FOREIGN KEY (`cliente_idcliente` )
    REFERENCES `tiendadb`.`cliente` (`idcliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_factura_factura1`
    FOREIGN KEY (`factura_idfactura` )
    REFERENCES `tiendadb`.`factura` (`idfactura` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tiendadb`.`factura_has_inventario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tiendadb`.`factura_has_inventario` (
  `factura_idfactura` INT(11) NOT NULL ,
  `inventario_idinventario` INT(11) NOT NULL ,
  PRIMARY KEY (`factura_idfactura`, `inventario_idinventario`) ,
  INDEX `fk_factura_has_inventario_inventario1_idx` (`inventario_idinventario` ASC) ,
  INDEX `fk_factura_has_inventario_factura1_idx` (`factura_idfactura` ASC) ,
  CONSTRAINT `fk_factura_has_inventario_factura1`
    FOREIGN KEY (`factura_idfactura` )
    REFERENCES `tiendadb`.`factura` (`idfactura` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_has_inventario_inventario1`
    FOREIGN KEY (`inventario_idinventario` )
    REFERENCES `tiendadb`.`inventario` (`idinventario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `tiendadb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
