-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: epidem_db
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
-- Table structure for table `family_history_primary`
--

DROP TABLE IF EXISTS `family_history_primary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_history_primary` (
  `prim_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `relation` varchar(20) DEFAULT NULL,
  `diseases` text,
  PRIMARY KEY (`prim_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `family_history_primary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_history_secondary`
--

DROP TABLE IF EXISTS `family_history_secondary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_history_secondary` (
  `sec_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `relation` varchar(20) DEFAULT NULL,
  `diseases` text,
  PRIMARY KEY (`sec_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `family_history_secondary_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_area_environment`
--

DROP TABLE IF EXISTS `survey_area_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_area_environment` (
  `env_area_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `urban_pm25_avg` float DEFAULT NULL,
  `urban_pm25_seasonal` text,
  `urban_pollen_types` text,
  `urban_pollen_distribution` text,
  `urban_pollen_peak` float DEFAULT NULL,
  `urban_pollutants` text,
  `urban_monitor_location` enum('交通区','工业区','居民区') DEFAULT NULL,
  `rural_pm25_burning` float DEFAULT NULL,
  `rural_pm25_avg` float DEFAULT NULL,
  `rural_pollen_types` text,
  `rural_biomass_pollution` tinyint(1) DEFAULT NULL,
  `rural_water_source` enum('自来水','纯净水','井水','其他') DEFAULT NULL,
  PRIMARY KEY (`env_area_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_area_environment_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_basic_info`
--

DROP TABLE IF EXISTS `survey_basic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_basic_info` (
  `survey_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `survey_date` date DEFAULT NULL,
  `child_name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `residence_type` enum('城市','农村') DEFAULT NULL,
  `residence_years` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `allergy_history` tinyint(1) DEFAULT NULL,
  `has_rhinitis` tinyint(1) DEFAULT NULL,
  `has_asthma` tinyint(1) DEFAULT NULL,
  `has_dermatitis` tinyint(1) DEFAULT NULL,
  `has_conjunctivitis` tinyint(1) DEFAULT NULL,
  `has_urticaria` tinyint(1) DEFAULT NULL,
  `diagnosed_rhinitis` tinyint(1) DEFAULT NULL,
  `diagnosed_asthma` tinyint(1) DEFAULT NULL,
  `diagnosed_dermatitis` tinyint(1) DEFAULT NULL,
  `diagnosed_conjunctivitis` tinyint(1) DEFAULT NULL,
  `diagnosed_urticaria` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`survey_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `survey_basic_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_confounding_factors`
--

DROP TABLE IF EXISTS `survey_confounding_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_confounding_factors` (
  `confound_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `diet_type` enum('高加工食品','传统饮食') DEFAULT NULL,
  `vitamin_d_400u` tinyint(1) DEFAULT NULL,
  `vitamin_d_years` float DEFAULT NULL,
  `omega3_intake` text,
  `stress_level_pss10` int DEFAULT NULL,
  `mental_state_phq9_gad7` text,
  `vaccine_on_schedule` tinyint(1) DEFAULT NULL,
  `antibiotic_freq` enum('每月','每季度','每年') DEFAULT NULL,
  `breastfeeding` tinyint(1) DEFAULT NULL,
  `breastfeeding_months` int DEFAULT NULL,
  `delivery_type` enum('自然分娩','剖宫产') DEFAULT NULL,
  `pet_exposure_stage` enum('婴儿期','幼儿期','学龄前期','学龄期') DEFAULT NULL,
  `farm_exposure` tinyint(1) DEFAULT NULL,
  `farm_exposure_months` int DEFAULT NULL,
  `absent_days_allergy` int DEFAULT NULL,
  `annual_medical_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`confound_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_confounding_factors_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_environment_exposure`
--

DROP TABLE IF EXISTS `survey_environment_exposure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_environment_exposure` (
  `env_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `house_type` enum('平房','楼房','别墅','其他') DEFAULT NULL,
  `building_material` enum('木质','混凝土','其他') DEFAULT NULL,
  `ventilation_freq` enum('每日','每周','偶尔') DEFAULT NULL,
  `ac_usage_season` enum('几乎不用','夏季每日','全年高频') DEFAULT NULL,
  `ac_usage_freq` enum('每日','每周3-5天','偶尔') DEFAULT NULL,
  `ac_temp_setting` enum('＜24℃','24-26℃','＞26℃') DEFAULT NULL,
  `ac_modes` text,
  `ac_filter_cleaning_freq` enum('每月','每季度','每年','从未清洁') DEFAULT NULL,
  `heating_type` text,
  `heating_temp_range` enum('＜18℃','18-22℃','＞22℃') DEFAULT NULL,
  `has_carpet` tinyint(1) DEFAULT NULL,
  `has_soft_toys` tinyint(1) DEFAULT NULL,
  `pm25_avg` float DEFAULT NULL,
  `pollen_info` text,
  `formaldehyde_level` float DEFAULT NULL,
  `formaldehyde_test_time` date DEFAULT NULL,
  `dust_mite_level` text,
  `other_allergens` text,
  `exercise_frequency` int DEFAULT NULL,
  `exercise_duration` int DEFAULT NULL,
  `exercise_intensity` enum('轻','中','重') DEFAULT NULL,
  `swimming` tinyint(1) DEFAULT NULL,
  `sleep_hours` float DEFAULT NULL,
  `insomnia` tinyint(1) DEFAULT NULL,
  `circadian_disruption` tinyint(1) DEFAULT NULL,
  `smoke_exposure_type` enum('主动','被动暴露','无') DEFAULT NULL,
  `cleaning_freq` enum('每日','每周','每月') DEFAULT NULL,
  `has_pets` tinyint(1) DEFAULT NULL,
  `pet_types` text,
  `pet_count` int DEFAULT NULL,
  `lives_with_smoker` tinyint(1) DEFAULT NULL,
  `cooking_fuel` enum('天然气','煤气','生物质燃料') DEFAULT NULL,
  `uses_air_purifier` tinyint(1) DEFAULT NULL,
  `uses_vacuum_cleaner` tinyint(1) DEFAULT NULL,
  `avoidance_quality` enum('优','良','差') DEFAULT NULL,
  PRIMARY KEY (`env_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_environment_exposure_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_family_env`
--

DROP TABLE IF EXISTS `survey_family_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_family_env` (
  `family_env_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `shared_smoking_exposure` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`family_env_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_family_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_learning_work_env`
--

DROP TABLE IF EXISTS `survey_learning_work_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_learning_work_env` (
  `learn_env_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `location_type` enum('城市中心','郊区','农村') DEFAULT NULL,
  `ventilation_quality` enum('良好','一般','差') DEFAULT NULL,
  `pm25_annual` float DEFAULT NULL,
  `pollen_peak_concentration` float DEFAULT NULL,
  `pollen_types` text,
  `formaldehyde_level_workplace` float DEFAULT NULL,
  `has_carpet` tinyint(1) DEFAULT NULL,
  `has_fabric_furniture` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`learn_env_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_learning_work_env_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_monitoring_methods`
--

DROP TABLE IF EXISTS `survey_monitoring_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_monitoring_methods` (
  `method_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `pm25_detector_model` varchar(100) DEFAULT NULL,
  `pollen_gravity_settle` tinyint(1) DEFAULT NULL,
  `pollen_volume_sampling` tinyint(1) DEFAULT NULL,
  `pollen_molecular_detection` tinyint(1) DEFAULT NULL,
  `mite_protein_detection` tinyint(1) DEFAULT NULL,
  `mite_microscope_count` tinyint(1) DEFAULT NULL,
  `mite_pcr` tinyint(1) DEFAULT NULL,
  `mite_metabolite` tinyint(1) DEFAULT NULL,
  `mite_air_sampling` tinyint(1) DEFAULT NULL,
  `mite_sensor_tech` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`method_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_monitoring_methods_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_providers`
--

DROP TABLE IF EXISTS `survey_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_providers` (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` enum('住院医师','主治医师','副主任医师','主任医师') DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_providers_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_basic_info` (`survey_id`)
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

-- Dump completed on 2025-06-05 17:43:07
