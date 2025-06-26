-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: biobank_db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allergy_basic_tests`
--

DROP TABLE IF EXISTS `allergy_basic_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy_basic_tests` (
  `alle_bas_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `skin_prick_test_result` text,
  `serum_specific_IgE` text,
  `serum_total_IgE_level` float DEFAULT NULL,
  `eosinophil_count` int DEFAULT NULL,
  PRIMARY KEY (`alle_bas_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `allergy_basic_tests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asthma_special_tests`
--

DROP TABLE IF EXISTS `asthma_special_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asthma_special_tests` (
  `ast_spe_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `chest_xray_result` text,
  `lung_function_result` text,
  `feNO_level` float DEFAULT NULL,
  `bronchodilation_test` text,
  `peak_flow_variability` float DEFAULT NULL,
  `exercise_challenge_result` text,
  `bronchial_challenge_result` text,
  PRIMARY KEY (`ast_spe_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `asthma_special_tests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asthma_symptoms`
--

DROP TABLE IF EXISTS `asthma_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asthma_symptoms` (
  `asthma_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) DEFAULT NULL,
  `wheezing` tinyint(1) DEFAULT NULL,
  `cough` tinyint(1) DEFAULT NULL,
  `dyspnea` tinyint(1) DEFAULT NULL,
  `activity_limitation` tinyint(1) DEFAULT NULL,
  `nocturnal_awakening` tinyint(1) DEFAULT NULL,
  `chest_tightness` tinyint(1) DEFAULT NULL,
  `morning_or_night_exacerbation` tinyint(1) DEFAULT NULL,
  `virus_trigger` tinyint(1) DEFAULT NULL,
  `exercise_trigger` tinyint(1) DEFAULT NULL,
  `allergen_trigger` tinyint(1) DEFAULT NULL,
  `climate_change_trigger` tinyint(1) DEFAULT NULL,
  `laughter_trigger` tinyint(1) DEFAULT NULL,
  `irritant_trigger` tinyint(1) DEFAULT NULL,
  `auscultation_wheezing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`asthma_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `asthma_symptoms_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asthma_treatments`
--

DROP TABLE IF EXISTS `asthma_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asthma_treatments` (
  `ast_tre_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `inhaled_corticosteroids` tinyint(1) DEFAULT NULL,
  `laba` tinyint(1) DEFAULT NULL,
  `ltra` tinyint(1) DEFAULT NULL,
  `theophylline` tinyint(1) DEFAULT NULL,
  `saba` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ast_tre_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `asthma_treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eczema_symptoms`
--

DROP TABLE IF EXISTS `eczema_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eczema_symptoms` (
  `eczema_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `chronic_itchy_rash` tinyint(1) DEFAULT NULL,
  `flexural_or_facial_dermatitis_history` tinyint(1) DEFAULT NULL,
  `dry_skin` tinyint(1) DEFAULT NULL,
  `xerosis` tinyint(1) DEFAULT NULL,
  `ear_fissures` tinyint(1) DEFAULT NULL,
  `ichthyosis` tinyint(1) DEFAULT NULL,
  `palmar_hyperlinearity` tinyint(1) DEFAULT NULL,
  `keratosis_pilaris` tinyint(1) DEFAULT NULL,
  `skin_infection_prone` tinyint(1) DEFAULT NULL,
  `staph_infection_prone` tinyint(1) DEFAULT NULL,
  `herpes_infection_prone` tinyint(1) DEFAULT NULL,
  `dennie_morgan_folds` tinyint(1) DEFAULT NULL,
  `periorbital_darkening` tinyint(1) DEFAULT NULL,
  `pale_face` tinyint(1) DEFAULT NULL,
  `pityriasis_alba` tinyint(1) DEFAULT NULL,
  `anterior_neck_folds` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`eczema_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `eczema_symptoms_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eczema_treatments`
--

DROP TABLE IF EXISTS `eczema_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eczema_treatments` (
  `ecz_tre_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `corticosteroids` tinyint(1) DEFAULT NULL,
  `calcineurin_inhibitors` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ecz_tre_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `eczema_treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `food_allergy_treatments`
--

DROP TABLE IF EXISTS `food_allergy_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_allergy_treatments` (
  `food_alle_tre_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `corticosteroids` tinyint(1) DEFAULT NULL,
  `antihistamines` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`food_alle_tre_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `food_allergy_treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `other_treatments`
--

DROP TABLE IF EXISTS `biobank_other_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biobank_other_treatments` (
  `other_tre_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `allergen_immunotherapy` tinyint(1) DEFAULT NULL,
  `anti_IgE_therapy` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`other_tre_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `biobank_other_treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rhinitis_special_tests`
--

DROP TABLE IF EXISTS `rhinitis_special_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rhinitis_special_tests` (
  `rhi_spe_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `nasal_challenge_result` text,
  `t_reg_cell_count` int DEFAULT NULL,
  `igG4_level` float DEFAULT NULL,
  `th1_cell_count` int DEFAULT NULL,
  `th2_cell_count` int DEFAULT NULL,
  `ecp_level` float DEFAULT NULL,
  PRIMARY KEY (`rhi_spe_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `rhinitis_special_tests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rhinitis_symptoms`
--

DROP TABLE IF EXISTS `rhinitis_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rhinitis_symptoms` (
  `rhinitis_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `clear_discharge` tinyint(1) DEFAULT NULL,
  `nasal_itching` tinyint(1) DEFAULT NULL,
  `nasal_congestion` tinyint(1) DEFAULT NULL,
  `paroxysmal_sneeze` tinyint(1) DEFAULT NULL,
  `olfactory_loss` tinyint(1) DEFAULT NULL,
  `throat_clearing` tinyint(1) DEFAULT NULL,
  `nose_sniffing` tinyint(1) DEFAULT NULL,
  `dry_cough` tinyint(1) DEFAULT NULL,
  `foreign_body_throat` tinyint(1) DEFAULT NULL,
  `itchy_eyes` tinyint(1) DEFAULT NULL,
  `frequent_blinking` tinyint(1) DEFAULT NULL,
  `nasal_mucosa_swelling` tinyint(1) DEFAULT NULL,
  `nasal_mucosa_color_change` tinyint(1) DEFAULT NULL,
  `nasal_discharge_present` tinyint(1) DEFAULT NULL,
  `turbinate_hypertrophy` tinyint(1) DEFAULT NULL,
  `dark_circles` tinyint(1) DEFAULT NULL,
  `allergic_salute` tinyint(1) DEFAULT NULL,
  `nasal_fold` tinyint(1) DEFAULT NULL,
  `sleep_disorder` tinyint(1) DEFAULT NULL,
  `activity_limitation` tinyint(1) DEFAULT NULL,
  `attention_decline` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`rhinitis_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `rhinitis_symptoms_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rhinitis_treatments`
--

DROP TABLE IF EXISTS `rhinitis_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rhinitis_treatments` (
  `rhi_tre_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `antihistamines` tinyint(1) DEFAULT NULL,
  `corticosteroids` tinyint(1) DEFAULT NULL,
  `ltra` tinyint(1) DEFAULT NULL,
  `mast_cell_stabilizers` tinyint(1) DEFAULT NULL,
  `anticholinergics` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`rhi_tre_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `rhinitis_treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-05 17:42:01
