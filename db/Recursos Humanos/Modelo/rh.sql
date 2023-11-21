DROP TABLE IF EXISTS `contacto`;

CREATE TABLE `contacto` (
  `idContacto` int NOT NULL AUTO_INCREMENT,
  `telefono` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `coreo` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `idDepartamento` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `disponible` tinyint NOT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `segundoApellido` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `idRol` int NOT NULL,
  `idPais` int NOT NULL,
  `idContacto` int NOT NULL,
  `idHoraPagoXEmpleado` int NOT NULL,
  `disponible` tinyint NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `fk_Empleado_Rol_idx` (`idRol`),
  KEY `fk_Empelado_Pais_idx` (`idPais`),
  KEY `fk_Empleado_Contacto_idx` (`idContacto`),
  KEY `fk_Empleado_HoraPagoXEmpleado_idx` (`idHoraPagoXEmpleado`),
  CONSTRAINT `fk_Empelado_Pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`),
  CONSTRAINT `fk_Empleado_Contacto` FOREIGN KEY (`idContacto`) REFERENCES `contacto` (`idContacto`),
  CONSTRAINT `fk_Empleado_HoraPagoXEmpleado` FOREIGN KEY (`idHoraPagoXEmpleado`) REFERENCES `horapagoxempleado` (`idHoraPagoXEmpleado`),
  CONSTRAINT `fk_Empleado_Rol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrenamiento`
--

DROP TABLE IF EXISTS `entrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenamiento` (
  `idEntrenamiento` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `entrenador` int NOT NULL,
  `entrenado` int NOT NULL,
  `resultados` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idEntrenamiento`),
  KEY `fk_Entrenamiento_Empleado1_idx` (`entrenador`),
  KEY `fk_Entrenamiento_Empleado2_idx` (`entrenado`),
  CONSTRAINT `fk_Entrenamiento_Empleado1` FOREIGN KEY (`entrenador`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `fk_Entrenamiento_Empleado2` FOREIGN KEY (`entrenado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `horapagoxempleado`
--

DROP TABLE IF EXISTS `horapagoxempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horapagoxempleado` (
  `idHoraPagoXEmpleado` int NOT NULL,
  `cantidad` decimal(6,2) NOT NULL,
  PRIMARY KEY (`idHoraPagoXEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metrica`
--

DROP TABLE IF EXISTS `metrica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrica` (
  `idMetrica` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descrpcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idMetrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina` (
  `idNomina` int NOT NULL AUTO_INCREMENT,
  `horas` tinyint NOT NULL,
  `fecha` date NOT NULL,
  `idEmpleado` int NOT NULL,
  PRIMARY KEY (`idNomina`),
  KEY `fk_Nomina_Empleado_idx` (`idEmpleado`),
  CONSTRAINT `fk_Nomina_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagoxempleado`
--

DROP TABLE IF EXISTS `pagoxempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagoxempleado` (
  `idPagoXEmpleado` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `salarioBruto` decimal(12,2) NOT NULL,
  `salarioNeto` decimal(12,2) NOT NULL,
  `idEmpleado` int NOT NULL,
  PRIMARY KEY (`idPagoXEmpleado`),
  KEY `fk_PagoXEmpleado_Empleado_idx` (`idEmpleado`),
  CONSTRAINT `fk_PagoXEmpleado_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idPais` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reduccion`
--

DROP TABLE IF EXISTS `reduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reduccion` (
  `idReduccion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idReduccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reduccionxpais`
--

DROP TABLE IF EXISTS `reduccionxpais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reduccionxpais` (
  `idReduccionXPais` int NOT NULL,
  `porcentaje` decimal(3,2) NOT NULL,
  `idReduccion` int NOT NULL,
  `idPais` int NOT NULL,
  PRIMARY KEY (`idReduccionXPais`),
  KEY `fk_ReduccionXPais_Reduccion_idx` (`idReduccion`),
  KEY `fk_ReduccionXPais_Pais_idx` (`idPais`),
  CONSTRAINT `fk_ReduccionXPais_Pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`),
  CONSTRAINT `fk_ReduccionXPais_Reduccion` FOREIGN KEY (`idReduccion`) REFERENCES `reduccion` (`idReduccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rendimientoxempleado`
--

DROP TABLE IF EXISTS `rendimientoxempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rendimientoxempleado` (
  `idRendimientoXEmpleado` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `calificacion` decimal(3,2) NOT NULL,
  `idEmpleado` int NOT NULL,
  `idMetrica` int NOT NULL,
  PRIMARY KEY (`idRendimientoXEmpleado`),
  KEY `fk_RendimientoXEmpleado_Empleado_idx` (`idEmpleado`),
  KEY `fk_RendimientoXEmpleado_Metrica_idx` (`idMetrica`),
  CONSTRAINT `fk_RendimientoXEmpleado_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `fk_RendimientoXEmpleado_Metrica` FOREIGN KEY (`idMetrica`) REFERENCES `metrica` (`idMetrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `idDepartamento` int NOT NULL,
  `disponible` tinyint NOT NULL,
  PRIMARY KEY (`idRol`),
  KEY `fk_Rol_Departmento_idx` (`idDepartamento`),
  CONSTRAINT `fk_Rol_Departmento_idx` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'rh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-12 23:54:51
