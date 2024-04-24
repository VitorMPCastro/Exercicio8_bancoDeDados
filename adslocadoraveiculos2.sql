-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema adslocadoraveiculos2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema adslocadoraveiculos2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `adslocadoraveiculos2` DEFAULT CHARACTER SET utf8 ;
USE `adslocadoraveiculos2` ;

-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`endereco` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`endereco` (
  `CEP` VARCHAR(8) NOT NULL,
  `Numero` INT(6) NOT NULL,
  PRIMARY KEY (`CEP`, `Numero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`filial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`filial` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`filial` (
  `CNPJ_Filial` VARCHAR(14) NOT NULL,
  `endereco_CEP` VARCHAR(8) NOT NULL,
  `endereco_Numero` INT(6) NOT NULL,
  PRIMARY KEY (`CNPJ_Filial`),
  UNIQUE INDEX `CNPJ_Filial_UNIQUE` (`CNPJ_Filial` ASC) VISIBLE,
  INDEX `fk_filial_endereco1_idx` (`endereco_CEP` ASC, `endereco_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_filial_endereco1`
    FOREIGN KEY (`endereco_CEP` , `endereco_Numero`)
    REFERENCES `adslocadoraveiculos2`.`endereco` (`CEP` , `Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`cliente` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `NomeCliente` VARCHAR(45) NOT NULL,
  `endereco_CEP` VARCHAR(8) NOT NULL,
  `endereco_Numero` INT(6) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE,
  INDEX `fk_cliente_endereco1_idx` (`endereco_CEP` ASC, `endereco_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_endereco1`
    FOREIGN KEY (`endereco_CEP` , `endereco_Numero`)
    REFERENCES `adslocadoraveiculos`.`endereco` (`CEP` , `Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos`.`pessoa_fisica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`pessoa_fisica` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`pessoa_fisica` (
  `Cliente_idCliente` INT(11) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Data_N` DATE NOT NULL,
  `Gênero` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Cliente_idCliente`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  INDEX `fk_idCliente` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa Fisica_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `adslocadoraveiculos2`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos`.`motorista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`motorista` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`motorista` (
  `Motorista_CPF` VARCHAR(11) NOT NULL,
  `Numero_CNH` VARCHAR(12) NOT NULL,
  `Validade_CNH` DATE NOT NULL,
  PRIMARY KEY (`Motorista_CPF`, `Numero_CNH`),
  UNIQUE INDEX `Número CNH_UNIQUE` (`Numero_CNH` ASC) VISIBLE,
  INDEX `fk_Motorista_CPF` (`Motorista_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Motorista_Pessoa_Fisica1`
    FOREIGN KEY (`Motorista_CPF`)
    REFERENCES `adslocadoraveiculos2`.`pessoa_fisica` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`cliente_indica_motorista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`cliente_indica_motorista` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`cliente_indica_motorista` (
  `idCliente` INT(11) NOT NULL,
  `Motorista_CPF` VARCHAR(11) NOT NULL,
  `Numero_CNH` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idCliente`, `Motorista_CPF`, `Numero_CNH`),
  INDEX `fk_dadosMotorista` (`Motorista_CPF` ASC, `Numero_CNH` ASC) VISIBLE,
  CONSTRAINT `fk_dadosMotorista`
    FOREIGN KEY (`Motorista_CPF` , `Numero_CNH`)
    REFERENCES `adslocadoraveiculos2`.`motorista` (`Motorista_CPF` , `Numero_CNH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `adslocadoraveiculos2`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos`.`seguradora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`seguradora` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`seguradora` (
  `idSeguradora` INT(11) NOT NULL,
  PRIMARY KEY (`idSeguradora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos`.`veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`veiculo` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`veiculo` (
  `Placa` VARCHAR(7) NOT NULL,
  `Número Chassis` VARCHAR(17) NOT NULL,
  `Número Motor` VARCHAR(9) NOT NULL,
  `Tipo Veiculo` VARCHAR(2) NOT NULL,
  `Cor Veiculo` VARCHAR(45) NOT NULL,
  `Grupo Veiculo` VARCHAR(45) NOT NULL,
  `KM Total` FLOAT NOT NULL,
  `KM_Medio_Dia` FLOAT NOT NULL,
  `CNPJ_Filial` VARCHAR(14) NOT NULL,
  `idSeguradora` INT(11) NOT NULL,
  PRIMARY KEY (`Placa`),
  UNIQUE INDEX `Placa_UNIQUE` (`Placa` ASC) VISIBLE,
  UNIQUE INDEX `Número Chassis_UNIQUE` (`Número Chassis` ASC) VISIBLE,
  UNIQUE INDEX `Número Motor_UNIQUE` (`Número Motor` ASC) VISIBLE,
  INDEX `fk_CNPJ_Filial` (`CNPJ_Filial` ASC) VISIBLE,
  INDEX `fk_idSeguradora` (`idSeguradora` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Filial`
    FOREIGN KEY (`CNPJ_Filial`)
    REFERENCES `adslocadoraveiculos2`.`filial` (`CNPJ_Filial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veiculo_Seguradora`
    FOREIGN KEY (`idSeguradora`)
    REFERENCES `adslocadoraveiculos2`.`seguradora` (`idSeguradora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos`.`aluguel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`aluguel` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`aluguel` (
  `idAluguel` INT(11) NOT NULL,
  `idCliente` INT(11) NOT NULL,
  `Veiculo_Placa` VARCHAR(7) NOT NULL,
  `DateTime_Inicio` DATETIME NOT NULL,
  `DateTime_Fim` DATETIME NOT NULL,
  `Entrega_CNPJ` VARCHAR(14) NOT NULL,
  `Motorista_CPF` VARCHAR(11) NOT NULL,
  `Numero_CNH` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idAluguel`),
  UNIQUE INDEX `fk_info_Indicado` (`Motorista_CPF` ASC, `Numero_CNH` ASC, `idCliente` ASC) VISIBLE,
  UNIQUE INDEX `Veiculo_Placa_UNIQUE` (`Veiculo_Placa` ASC) VISIBLE,
  UNIQUE INDEX `idAluguel_UNIQUE` (`idAluguel` ASC) VISIBLE,
  INDEX `fk_Filial_Destino` (`Entrega_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Filial_Destino`
    FOREIGN KEY (`Entrega_CNPJ`)
    REFERENCES `adslocadoraveiculos2`.`filial` (`CNPJ_Filial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Info_Indicado`
    FOREIGN KEY (`Motorista_CPF` , `Numero_CNH` , `idCliente`)
    REFERENCES `adslocadoraveiculos2`.`cliente_indica_motorista` (`Motorista_CPF` , `Numero_CNH` , `idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Info_Veiculo`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `adslocadoraveiculos2`.`veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos`.`passageiro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`passageiro` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`passageiro` (
  `Veiculo_Placa` VARCHAR(7) NOT NULL,
  `Tamanho` VARCHAR(45) NOT NULL,
  `N.Passageiros` INT(2) NOT NULL,
  `N.Portas` INT(2) NOT NULL,
  `Direcao Hidraulica` TINYINT(4) NOT NULL,
  `Cambio` VARCHAR(45) NOT NULL,
  `Acessorios` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`Veiculo_Placa`),
  CONSTRAINT `fk_Passageiro_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `adslocadoraveiculos2`.`veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`automóvel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`automóvel` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`automóvel` (
  `Veiculo_Placa` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`Veiculo_Placa`),
  CONSTRAINT `fk_Automóvel_Passageiro1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `adslocadoraveiculos2`.`passageiro` (`Veiculo_Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`camioneta_carga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`camioneta_carga` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`camioneta_carga` (
  `Veiculo_Placa` VARCHAR(7) NOT NULL,
  `Capacidade_Carga` FLOAT NOT NULL COMMENT 'EM TONELADAS (t), ACEITA APENAS NUMEROS (COM E SEM DECIMAL).',
  PRIMARY KEY (`Veiculo_Placa`),
  CONSTRAINT `fk_Camioneta_Carga_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `adslocadoraveiculos2`.`veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`camioneta_pass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`camioneta_pass` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`camioneta_pass` (
  `Veiculo_Placa` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`Veiculo_Placa`),
  CONSTRAINT `fk_Camioneta_Pass_Passageiro1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `adslocadoraveiculos2`.`passageiro` (`Veiculo_Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`pessoa_juridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`pessoa_juridica` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`pessoa_juridica` (
  `Cliente_idCliente` INT(11) NOT NULL,
  `CNPJ` VARCHAR(14) NOT NULL,
  `Inscricao_Estadual` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Cliente_idCliente`, `CNPJ`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,
  UNIQUE INDEX `Inscricao_Estadual_UNIQUE` (`Inscricao_Estadual` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa Juridica_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `adslocadoraveiculos2`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `adslocadoraveiculos2`.`revisão`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adslocadoraveiculos2`.`revisão` ;

CREATE TABLE IF NOT EXISTS `adslocadoraveiculos2`.`revisão` (
  `Veiculo_Placa` VARCHAR(7) NOT NULL,
  `Data_e_hora` DATETIME NOT NULL,
  `Descricao_Revisao` VARCHAR(512) NOT NULL,
  `KM_Total_record` FLOAT NOT NULL,
  `KM_Medio_record` FLOAT NOT NULL,
  PRIMARY KEY (`Veiculo_Placa`, `Data_e_hora`),
  UNIQUE INDEX `Data_e_hora_UNIQUE` (`Data_e_hora` ASC) VISIBLE,
  INDEX `fk_Revisão_Veiculo1_idx` (`Veiculo_Placa` ASC) VISIBLE,
  CONSTRAINT `fk_Revisão_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `adslocadoraveiculos2`.`veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
