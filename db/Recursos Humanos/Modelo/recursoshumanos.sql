-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `RH` DEFAULT CHARACTER SET utf8 ;
USE `RH` ;

DROP TABLE IF EXISTS `RH`.`Departamento` ;

CREATE TABLE IF NOT EXISTS `RH`.`Departments` (
  `idDepartamento` INT NOT NULL,
  `nombre` NVARCHAR(45) NOT NULL,
  `descripcion` NVARCHAR(100) NOT NULL,
  `disponible` TINYINT NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`Rol` ;

CREATE TABLE IF NOT EXISTS `RH`.`Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombre` NVARCHAR(45) NOT NULL,
  `descripcion` NVARCHAR(100) NOT NULL,
  `idDepartamento` INT NOT NULL,
  `disponible` TINYINT NOT NULL,
  PRIMARY KEY (`idRol`),
  INDEX `fk_Rol_Departmento_idx` (`idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Rol_Departmento_idx`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `RH`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`Pais` ;

CREATE TABLE IF NOT EXISTS `RH`.`Pais` (
  `idPais` INT NOT NULL,
  `nombre` NVARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`contacto` ;

CREATE TABLE IF NOT EXISTS `RH`.`contacto` (
  `idContacto` INT NOT NULL AUTO_INCREMENT,
  `telefono` NVARCHAR(45) NOT NULL,
  `coreo` NVARCHAR(80) NOT NULL,
  PRIMARY KEY (`idContacto`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`HoraPagoXEmpleado` ;

CREATE TABLE IF NOT EXISTS `RH`.`HoraPagoXEmpleado` (
  `idHoraPagoXEmpleado` INT NOT NULL,
  `cantidad` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idHoraPagoXEmpleado`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`Empleado` ;

CREATE TABLE IF NOT EXISTS `RH`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` NVARCHAR(45) NOT NULL,
  `apellido` NVARCHAR(45) NOT NULL,
  `segundoApellido` NVARCHAR(45) NOT NULL,
  `idRol` INT NOT NULL,
  `idPais` INT NOT NULL,
  `idContacto` INT NOT NULL,
  `idHoraPagoXEmpleado` INT NOT NULL,
  `disponible` TINYINT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_Empleado_Rol_idx` (`idRol` ASC) VISIBLE,
  INDEX `fk_Empelado_Pais_idx` (`idPais` ASC) VISIBLE,
  INDEX `fk_Empleado_Contacto_idx` (`idContacto` ASC) VISIBLE,
  INDEX `fk_Empleado_HoraPagoXEmpleado_idx` (`idHoraPagoXEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Rol`
    FOREIGN KEY (`idRol`)
    REFERENCES `RH`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empelado_Pais`
    FOREIGN KEY (`idPais`)
    REFERENCES `RH`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Contacto`
    FOREIGN KEY (`idContacto`)
    REFERENCES `RH`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_HoraPagoXEmpleado`
    FOREIGN KEY (`idHoraPagoXEmpleado`)
    REFERENCES `RH`.`HoraPagoXEmpleado` (`idHoraPagoXEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`Nomina` ;

CREATE TABLE IF NOT EXISTS `RH`.`Nomina` (
  `idNomina` INT NOT NULL AUTO_INCREMENT,
  `horas` TINYINT NOT NULL,
  `fecha` DATE NOT NULL,
  `idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idNomina`),
  INDEX `fk_Nomina_Empleado_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_Nomina_Empleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `RH`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `RH`.`Reduccion` ;

CREATE TABLE IF NOT EXISTS `RH`.`Reduccion` (
  `idReduccion` INT NOT NULL AUTO_INCREMENT,
  `nombre` NVARCHAR(45) NOT NULL,
  `descripcion` NVARCHAR(100) NOT NULL,
  PRIMARY KEY (`idReduccion`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`ReduccionXPais` ;

CREATE TABLE IF NOT EXISTS `RH`.`ReduccionXPais` (
  `idReduccionXPais` INT NOT NULL,
  `porcentaje` DECIMAL(3,2) NOT NULL,
  `idReduccion` INT NOT NULL,
  `idPais` INT NOT NULL,
  PRIMARY KEY (`idReduccionXPais`),
  INDEX `fk_ReduccionXPais_Reduccion_idx` (`idReduccion` ASC) VISIBLE,
  INDEX `fk_ReduccionXPais_Pais_idx` (`idPais` ASC) VISIBLE,
  CONSTRAINT `fk_ReduccionXPais_Reduccion`
    FOREIGN KEY (`idReduccion`)
    REFERENCES `RH`.`Reduccion` (`idReduccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReduccionXPais_Pais`
    FOREIGN KEY (`idPais`)
    REFERENCES `RH`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `RH`.`PagoXEmpleado` ;

CREATE TABLE IF NOT EXISTS `RH`.`PagoXEmpleado` (
  `idPagoXEmpleado` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  `salarioBruto` DECIMAL(12,2) NOT NULL,
  `salarioNeto` DECIMAL(12,2) NOT NULL,
  `idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idPagoXEmpleado`),
  INDEX `fk_PagoXEmpleado_Empleado_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_PagoXEmpleado_Empleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `RH`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `RH`.`Metrica` ;

CREATE TABLE IF NOT EXISTS `RH`.`Metrica` (
  `idMetrica` INT NOT NULL,
  `nombre` NVARCHAR(45) NOT NULL,
  `descrpcion` NVARCHAR(100) NOT NULL,
  PRIMARY KEY (`idMetrica`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `RH`.`RendimientoXEmpleado` ;

CREATE TABLE IF NOT EXISTS `RH`.`RendimientoXEmpleado` (
  `idRendimientoXEmpleado` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  `calificacion` DECIMAL(3,2) NOT NULL,
  `idEmpleado` INT NOT NULL,
  `idMetrica` INT NOT NULL,
  PRIMARY KEY (`idRendimientoXEmpleado`),
  INDEX `fk_RendimientoXEmpleado_Empleado_idx` (`idEmpleado` ASC) VISIBLE,
  INDEX `fk_RendimientoXEmpleado_Metrica_idx` (`idMetrica` ASC) VISIBLE,
  CONSTRAINT `fk_RendimientoXEmpleado_Empleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `RH`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RendimientoXEmpleado_Metrica`
    FOREIGN KEY (`idMetrica`)
    REFERENCES `RH`.`Metrica` (`idMetrica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `RH`.`Entrenamiento` ;

CREATE TABLE IF NOT EXISTS `RH`.`Entrenamiento` (
  `idEntrenamiento` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  `entrenador` INT NOT NULL,
  `entrenado` INT NOT NULL,
  `resultados` NVARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEntrenamiento`),
  INDEX `fk_Entrenamiento_Empleado1_idx` (`entrenador` ASC) VISIBLE,
  INDEX `fk_Entrenamiento_Empleado2_idx` (`entrenado` ASC) VISIBLE,
  CONSTRAINT `fk_Entrenamiento_Empleado1`
    FOREIGN KEY (`entrenador`)
    REFERENCES `RH`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrenamiento_Empleado2`
    FOREIGN KEY (`entrenado`)
    REFERENCES `RH`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
