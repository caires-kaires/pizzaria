-- MySQL Script generated by MySQL Workbench
-- 07/06/15 19:35:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pizzaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzaria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `pizzaria` ;

-- -----------------------------------------------------
-- Table `pizzaria`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`clientes` (
  `id_cliente` INT NOT NULL COMMENT '',
  `nome` VARCHAR(150) NOT NULL COMMENT '',
  `cpf` VARCHAR(14) NOT NULL COMMENT '',
  `endereco` VARCHAR(45) NOT NULL COMMENT '',
  `numero` VARCHAR(45) NOT NULL COMMENT '',
  `telefone` VARCHAR(45) NOT NULL COMMENT '',
  `bairro` VARCHAR(45) NOT NULL COMMENT '',
  `cidade` VARCHAR(45) NOT NULL COMMENT '',
  `pais` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id_cliente`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`pedido_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`pedido_status` (
  `id_pedido_status` INT NOT NULL COMMENT '',
  `status` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id_pedido_status`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`pedidos` (
  `id_pedido` INT NOT NULL COMMENT '',
  `valor` DECIMAL(10,0) NOT NULL COMMENT '',
  `clientes_id_cliente` INT NOT NULL COMMENT '',
  `pedido_status_id_pedido_status` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id_pedido`)  COMMENT '',
  INDEX `fk_pedidos_clientes_idx` (`clientes_id_cliente` ASC)  COMMENT '',
  INDEX `fk_pedidos_pedido_status1_idx` (`pedido_status_id_pedido_status` ASC)  COMMENT '',
  CONSTRAINT `fk_pedidos_clientes`
    FOREIGN KEY (`clientes_id_cliente`)
    REFERENCES `pizzaria`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_pedido_status1`
    FOREIGN KEY (`pedido_status_id_pedido_status`)
    REFERENCES `pizzaria`.`pedido_status` (`id_pedido_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`pedido_itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`pedido_itens` (
  `id_pedido_itens` INT NOT NULL COMMENT '',
  `item` INT NOT NULL COMMENT '',
  `valor` DECIMAL(10,0) NOT NULL COMMENT '',
  `pedidos_id_pedido` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id_pedido_itens`)  COMMENT '',
  INDEX `fk_pedido_itens_pedidos1_idx` (`pedidos_id_pedido` ASC)  COMMENT '',
  CONSTRAINT `fk_pedido_itens_pedidos1`
    FOREIGN KEY (`pedidos_id_pedido`)
    REFERENCES `pizzaria`.`pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`pizzas` (
  `id_pizza` INT NOT NULL COMMENT '',
  `pizza` VARCHAR(45) NOT NULL COMMENT '',
  `pedido_itens_id_pedido_itens` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id_pizza`)  COMMENT '',
  INDEX `fk_pizzas_pedido_itens1_idx` (`pedido_itens_id_pedido_itens` ASC)  COMMENT '',
  CONSTRAINT `fk_pizzas_pedido_itens1`
    FOREIGN KEY (`pedido_itens_id_pedido_itens`)
    REFERENCES `pizzaria`.`pedido_itens` (`id_pedido_itens`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`embalagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`embalagens` (
  `id_embalagen` INT NOT NULL COMMENT '',
  `embalagem` VARCHAR(45) NOT NULL COMMENT '',
  `unidade` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id_embalagen`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`bebidas` (
  `id_bebida` INT NOT NULL COMMENT '',
  `bebida` VARCHAR(45) NOT NULL COMMENT '',
  `embalagem` VARCHAR(45) NOT NULL COMMENT '',
  `pedido_itens_id_pedido_itens` INT NOT NULL COMMENT '',
  `embalagens_id_embalagen` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id_bebida`)  COMMENT '',
  INDEX `fk_bebidas_pedido_itens1_idx` (`pedido_itens_id_pedido_itens` ASC)  COMMENT '',
  INDEX `fk_bebidas_embalagens1_idx` (`embalagens_id_embalagen` ASC)  COMMENT '',
  CONSTRAINT `fk_bebidas_pedido_itens1`
    FOREIGN KEY (`pedido_itens_id_pedido_itens`)
    REFERENCES `pizzaria`.`pedido_itens` (`id_pedido_itens`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bebidas_embalagens1`
    FOREIGN KEY (`embalagens_id_embalagen`)
    REFERENCES `pizzaria`.`embalagens` (`id_embalagen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`ingredientes` (
  `id_ingredientes` INT NOT NULL COMMENT '',
  `ingredientes` VARCHAR(45) NOT NULL COMMENT '',
  `embalagens_id_embalagen` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id_ingredientes`)  COMMENT '',
  INDEX `fk_ingredientes_embalagens1_idx` (`embalagens_id_embalagen` ASC)  COMMENT '',
  CONSTRAINT `fk_ingredientes_embalagens1`
    FOREIGN KEY (`embalagens_id_embalagen`)
    REFERENCES `pizzaria`.`embalagens` (`id_embalagen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`estoque` (
  `id_estoque` INT NOT NULL COMMENT '',
  `bebidas_id_bebida` INT NOT NULL COMMENT '',
  `ingredientes_id_ingredientes` INT NOT NULL COMMENT '',
  `quantidade` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id_estoque`)  COMMENT '',
  INDEX `fk_estoque_bebidas1_idx` (`bebidas_id_bebida` ASC)  COMMENT '',
  INDEX `fk_estoque_ingredientes1_idx` (`ingredientes_id_ingredientes` ASC)  COMMENT '',
  CONSTRAINT `fk_estoque_bebidas1`
    FOREIGN KEY (`bebidas_id_bebida`)
    REFERENCES `pizzaria`.`bebidas` (`id_bebida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estoque_ingredientes1`
    FOREIGN KEY (`ingredientes_id_ingredientes`)
    REFERENCES `pizzaria`.`ingredientes` (`id_ingredientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`ingredientes_has_pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`ingredientes_has_pizzas` (
  `ingredientes_id_ingredientes` INT NOT NULL COMMENT '',
  `pizzas_id_pizza` INT NOT NULL COMMENT '',
  PRIMARY KEY (`ingredientes_id_ingredientes`, `pizzas_id_pizza`)  COMMENT '',
  INDEX `fk_ingredientes_has_pizzas_pizzas1_idx` (`pizzas_id_pizza` ASC)  COMMENT '',
  INDEX `fk_ingredientes_has_pizzas_ingredientes1_idx` (`ingredientes_id_ingredientes` ASC)  COMMENT '',
  CONSTRAINT `fk_ingredientes_has_pizzas_ingredientes1`
    FOREIGN KEY (`ingredientes_id_ingredientes`)
    REFERENCES `pizzaria`.`ingredientes` (`id_ingredientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredientes_has_pizzas_pizzas1`
    FOREIGN KEY (`pizzas_id_pizza`)
    REFERENCES `pizzaria`.`pizzas` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
