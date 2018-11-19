-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Npng
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Npng
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Npng` DEFAULT CHARACTER SET utf8 ;
USE `Npng` ;

-- -----------------------------------------------------
-- Table `Npng`.`Plano_de_Treino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Plano_de_Treino` (
  `Idade` INT NOT NULL,
  `Peso` INT NOT NULL,
  `Altura` INT NOT NULL,
  `Metabolismo` VARCHAR(45) NOT NULL,
  `Objetivos` VARCHAR(200) NULL,
  `idPlano_de_Treino` INT NOT NULL,
  PRIMARY KEY (`idPlano_de_Treino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Nif` VARCHAR(9) NOT NULL,
  `idPlano_de_Treino` INT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Plano_de_Treino1_idx` (`idPlano_de_Treino` ASC),
  CONSTRAINT `fk_Cliente_Plano_de_Treino1`
    FOREIGN KEY (`idPlano_de_Treino`)
    REFERENCES `Npng`.`Plano_de_Treino` (`idPlano_de_Treino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Funcionário` (
  `idFuncionário` INT NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Número` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncionário`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Personal_Trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Personal_Trainer` (
  `idFuncionário` INT NOT NULL,
  `Classificação` INT NOT NULL,
  PRIMARY KEY (`idFuncionário`),
  CONSTRAINT `fk_Personal_Trainer_Funcionário1`
    FOREIGN KEY (`idFuncionário`)
    REFERENCES `Npng`.`Funcionário` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Aula` (
  `idAula` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Descrição` VARCHAR(200) NOT NULL,
  `Lotação` INT NOT NULL,
  `idPersonal_Trainer` INT NOT NULL,
  PRIMARY KEY (`idAula`),
  INDEX `fk_Aula_Personal_Trainer1_idx` (`idPersonal_Trainer` ASC),
  CONSTRAINT `fk_Aula_Personal_Trainer1`
    FOREIGN KEY (`idPersonal_Trainer`)
    REFERENCES `Npng`.`Personal_Trainer` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Máquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Máquina` (
  `idMáquina` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Descrição` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idMáquina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Horário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Horário` (
  `Inicio` DATETIME NOT NULL,
  `Fim` DATETIME NOT NULL,
  PRIMARY KEY (`Inicio`, `Fim`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Morada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Morada` (
  `Rua` VARCHAR(30) NOT NULL,
  `Nº_porta` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `Localidade` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Rua`, `idCliente`, `Localidade`, `Nº_porta`),
  INDEX `fk_Morada_Cliente1_idx` (`idCliente` ASC),
  CONSTRAINT `fk_Morada_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Npng`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Contactos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Contactos` (
  `Telemóvel` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Telemóvel`, `idCliente`, `Email`),
  INDEX `fk_Contactos_Cliente1_idx` (`idCliente` ASC),
  CONSTRAINT `fk_Contactos_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Npng`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Pacote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Pacote` (
  `idPacote` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `id_Personal_Trainer` INT NULL,
  `id_Nutricionista` INT NULL,
  `Preço` DECIMAL NOT NULL,
  PRIMARY KEY (`idPacote`),
  INDEX `fk_Pacote_Personal_Trainer1_idx` (`id_Personal_Trainer` ASC),
  INDEX `fk_Pacote_Funcionário1_idx` (`id_Nutricionista` ASC),
  CONSTRAINT `fk_Pacote_Personal_Trainer1`
    FOREIGN KEY (`id_Personal_Trainer`)
    REFERENCES `Npng`.`Personal_Trainer` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacote_Funcionário1`
    FOREIGN KEY (`id_Nutricionista`)
    REFERENCES `Npng`.`Funcionário` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Pacote_tem_Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Pacote_tem_Aula` (
  `idPacote` INT NOT NULL,
  `idAula` INT NOT NULL,
  PRIMARY KEY (`idPacote`, `idAula`),
  INDEX `fk_Pacote_has_Aula_Aula1_idx` (`idAula` ASC),
  INDEX `fk_Pacote_has_Aula_Pacote1_idx` (`idPacote` ASC),
  CONSTRAINT `fk_Pacote_has_Aula_Pacote1`
    FOREIGN KEY (`idPacote`)
    REFERENCES `Npng`.`Pacote` (`idPacote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacote_has_Aula_Aula1`
    FOREIGN KEY (`idAula`)
    REFERENCES `Npng`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Cliente_teve_Personal_Trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Cliente_teve_Personal_Trainer` (
  `idCliente` INT NOT NULL,
  `idPersonal_Trainer` INT NOT NULL,
  `Reclamação` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idCliente`, `idPersonal_Trainer`),
  INDEX `fk_Cliente_has_Personal_Trainer_Personal_Trainer1_idx` (`idPersonal_Trainer` ASC),
  INDEX `fk_Cliente_has_Personal_Trainer_Cliente1_idx` (`idCliente` ASC),
  CONSTRAINT `fk_Cliente_has_Personal_Trainer_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Npng`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Personal_Trainer_Personal_Trainer1`
    FOREIGN KEY (`idPersonal_Trainer`)
    REFERENCES `Npng`.`Personal_Trainer` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Funcionário_tem_Horário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Funcionário_tem_Horário` (
  `Funcionário_idFuncionário` INT NOT NULL,
  `Horário_Inicio` DATETIME NOT NULL,
  `Horário_Fim` DATETIME NOT NULL,
  PRIMARY KEY (`Funcionário_idFuncionário`, `Horário_Inicio`, `Horário_Fim`),
  INDEX `fk_Funcionário_has_Horário_Horário1_idx` (`Horário_Inicio` ASC, `Horário_Fim` ASC),
  INDEX `fk_Funcionário_has_Horário_Funcionário1_idx` (`Funcionário_idFuncionário` ASC),
  CONSTRAINT `fk_Funcionário_has_Horário_Funcionário1`
    FOREIGN KEY (`Funcionário_idFuncionário`)
    REFERENCES `Npng`.`Funcionário` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionário_has_Horário_Horário1`
    FOREIGN KEY (`Horário_Inicio` , `Horário_Fim`)
    REFERENCES `Npng`.`Horário` (`Inicio` , `Fim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Aula_tem_Horário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Aula_tem_Horário` (
  `idAula` INT NOT NULL,
  `Horário_Inicio` DATETIME NOT NULL,
  `Horário_Fim` DATETIME NOT NULL,
  PRIMARY KEY (`idAula`, `Horário_Fim`, `Horário_Inicio`),
  INDEX `fk_Aula_has_Horário_Horário1_idx` (`Horário_Inicio` ASC, `Horário_Fim` ASC),
  INDEX `fk_Aula_has_Horário_Aula1_idx` (`idAula` ASC),
  CONSTRAINT `fk_Aula_has_Horário_Aula1`
    FOREIGN KEY (`idAula`)
    REFERENCES `Npng`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aula_has_Horário_Horário1`
    FOREIGN KEY (`Horário_Inicio` , `Horário_Fim`)
    REFERENCES `Npng`.`Horário` (`Inicio` , `Fim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Pacote_tem_Horário_Para_Musculação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Pacote_tem_Horário_Para_Musculação` (
  `idPacote` INT NOT NULL,
  `Horário_Inicio` DATETIME NOT NULL,
  `Horário_Fim` DATETIME NOT NULL,
  PRIMARY KEY (`idPacote`),
  INDEX `fk_Pacote_has_Horário_Horário3_idx` (`Horário_Inicio` ASC, `Horário_Fim` ASC),
  INDEX `fk_Pacote_has_Horário_Pacote3_idx` (`idPacote` ASC),
  CONSTRAINT `fk_Pacote_has_Horário_Pacote3`
    FOREIGN KEY (`idPacote`)
    REFERENCES `Npng`.`Pacote` (`idPacote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacote_has_Horário_Horário3`
    FOREIGN KEY (`Horário_Inicio` , `Horário_Fim`)
    REFERENCES `Npng`.`Horário` (`Inicio` , `Fim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`MáquinasRecomendadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`MáquinasRecomendadas` (
  `idPlano_de_Treino` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idMáquina` INT NOT NULL,
  `Justificação` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idPlano_de_Treino`, `idCliente`, `idMáquina`),
  INDEX `fk_Plano_de_Treino_has_Máquina_Máquina1_idx` (`idMáquina` ASC),
  CONSTRAINT `fk_Plano_de_Treino_has_Máquina_Máquina1`
    FOREIGN KEY (`idMáquina`)
    REFERENCES `Npng`.`Máquina` (`idMáquina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`AulasRecomendadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`AulasRecomendadas` (
  `idPlano_de_Treino` INT NOT NULL,
  `idAula` INT NOT NULL,
  `Justificação` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idPlano_de_Treino`, `idAula`),
  INDEX `fk_Plano_de_Treino_has_Aula1_Aula1_idx` (`idAula` ASC),
  INDEX `fk_Plano_de_Treino_has_Aula1_Plano_de_Treino1_idx` (`idPlano_de_Treino` ASC),
  CONSTRAINT `fk_Plano_de_Treino_has_Aula1_Plano_de_Treino1`
    FOREIGN KEY (`idPlano_de_Treino`)
    REFERENCES `Npng`.`Plano_de_Treino` (`idPlano_de_Treino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plano_de_Treino_has_Aula1_Aula1`
    FOREIGN KEY (`idAula`)
    REFERENCES `Npng`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Cliente_tem_Pacote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Cliente_tem_Pacote` (
  `idCliente` INT NOT NULL,
  `idPacote` INT NOT NULL,
  `Data_inicial` DATETIME NOT NULL,
  `Data_final` DATETIME NOT NULL,
  PRIMARY KEY (`idCliente`, `idPacote`),
  INDEX `fk_Cliente_has_Pacote_Pacote1_idx` (`idPacote` ASC),
  INDEX `fk_Cliente_has_Pacote_Cliente1_idx` (`idCliente` ASC),
  INDEX `fk_Cliente_tem_Pacote_Horário1_idx` (`Data_inicial` ASC, `Data_final` ASC),
  CONSTRAINT `fk_Cliente_has_Pacote_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Npng`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Pacote_Pacote1`
    FOREIGN KEY (`idPacote`)
    REFERENCES `Npng`.`Pacote` (`idPacote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_tem_Pacote_Horário1`
    FOREIGN KEY (`Data_inicial` , `Data_final`)
    REFERENCES `Npng`.`Horário` (`Inicio` , `Fim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Plano_de_Treino_has_Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Plano_de_Treino_has_Aula` (
  `Plano_de_Treino_idPlano_de_Treino` INT NOT NULL,
  `Plano_de_Treino_idCliente` INT NOT NULL,
  `Plano_de_Treino_Cliente_idCliente` INT NOT NULL,
  `Aula_idAula` INT NOT NULL,
  PRIMARY KEY (`Plano_de_Treino_idPlano_de_Treino`, `Plano_de_Treino_idCliente`, `Plano_de_Treino_Cliente_idCliente`, `Aula_idAula`),
  INDEX `fk_Plano_de_Treino_has_Aula_Aula2_idx` (`Aula_idAula` ASC),
  CONSTRAINT `fk_Plano_de_Treino_has_Aula_Aula2`
    FOREIGN KEY (`Aula_idAula`)
    REFERENCES `Npng`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Aula_has_Plano_de_Treino_has_Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Aula_has_Plano_de_Treino_has_Aula` (
  `Aula_idAula` INT NOT NULL,
  `Plano_de_Treino_has_Aula_Plano_de_Treino_idPlano_de_Treino` INT NOT NULL,
  `Plano_de_Treino_has_Aula_Plano_de_Treino_idCliente` INT NOT NULL,
  `Plano_de_Treino_has_Aula_Plano_de_Treino_Cliente_idCliente` INT NOT NULL,
  `Plano_de_Treino_has_Aula_Aula_idAula` INT NOT NULL,
  PRIMARY KEY (`Aula_idAula`, `Plano_de_Treino_has_Aula_Plano_de_Treino_idPlano_de_Treino`, `Plano_de_Treino_has_Aula_Plano_de_Treino_idCliente`, `Plano_de_Treino_has_Aula_Plano_de_Treino_Cliente_idCliente`, `Plano_de_Treino_has_Aula_Aula_idAula`),
  INDEX `fk_Aula_has_Plano_de_Treino_has_Aula_Plano_de_Treino_has_Au_idx` (`Plano_de_Treino_has_Aula_Plano_de_Treino_idPlano_de_Treino` ASC, `Plano_de_Treino_has_Aula_Plano_de_Treino_idCliente` ASC, `Plano_de_Treino_has_Aula_Plano_de_Treino_Cliente_idCliente` ASC, `Plano_de_Treino_has_Aula_Aula_idAula` ASC),
  INDEX `fk_Aula_has_Plano_de_Treino_has_Aula_Aula1_idx` (`Aula_idAula` ASC),
  CONSTRAINT `fk_Aula_has_Plano_de_Treino_has_Aula_Aula1`
    FOREIGN KEY (`Aula_idAula`)
    REFERENCES `Npng`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aula_has_Plano_de_Treino_has_Aula_Plano_de_Treino_has_Aula1`
    FOREIGN KEY (`Plano_de_Treino_has_Aula_Plano_de_Treino_idPlano_de_Treino` , `Plano_de_Treino_has_Aula_Plano_de_Treino_idCliente` , `Plano_de_Treino_has_Aula_Plano_de_Treino_Cliente_idCliente` , `Plano_de_Treino_has_Aula_Aula_idAula`)
    REFERENCES `Npng`.`Plano_de_Treino_has_Aula` (`Plano_de_Treino_idPlano_de_Treino` , `Plano_de_Treino_idCliente` , `Plano_de_Treino_Cliente_idCliente` , `Aula_idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`Plano_de_Treino_Recomenda_Máquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`Plano_de_Treino_Recomenda_Máquina` (
  `idPlano_de_Treino` INT NOT NULL,
  `idMáquina` INT NOT NULL,
  `Justificação` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idPlano_de_Treino`, `idMáquina`),
  INDEX `fk_Plano_de_Treino_has_Máquina_Máquina2_idx` (`idMáquina` ASC),
  INDEX `fk_Plano_de_Treino_has_Máquina_Plano_de_Treino1_idx` (`idPlano_de_Treino` ASC),
  CONSTRAINT `fk_Plano_de_Treino_has_Máquina_Plano_de_Treino1`
    FOREIGN KEY (`idPlano_de_Treino`)
    REFERENCES `Npng`.`Plano_de_Treino` (`idPlano_de_Treino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plano_de_Treino_has_Máquina_Máquina2`
    FOREIGN KEY (`idMáquina`)
    REFERENCES `Npng`.`Máquina` (`idMáquina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Npng`.`AulasRecomendadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Npng`.`AulasRecomendadas` (
  `idPlano_de_Treino` INT NOT NULL,
  `idAula` INT NOT NULL,
  `Justificação` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idPlano_de_Treino`, `idAula`),
  INDEX `fk_Plano_de_Treino_has_Aula1_Aula1_idx` (`idAula` ASC),
  INDEX `fk_Plano_de_Treino_has_Aula1_Plano_de_Treino1_idx` (`idPlano_de_Treino` ASC),
  CONSTRAINT `fk_Plano_de_Treino_has_Aula1_Plano_de_Treino1`
    FOREIGN KEY (`idPlano_de_Treino`)
    REFERENCES `Npng`.`Plano_de_Treino` (`idPlano_de_Treino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plano_de_Treino_has_Aula1_Aula1`
    FOREIGN KEY (`idAula`)
    REFERENCES `Npng`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
