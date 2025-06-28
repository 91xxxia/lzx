-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: biobank_db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `biospecimens`
--

DROP TABLE IF EXISTS `biospecimens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biospecimens` (
  `specimen_id` varchar(20) NOT NULL,
  `patient_id` varchar(20) NOT NULL COMMENT '关联临床数据库患者ID',
  `specimen_type` enum('血液','血清','血浆','唾液','尿液','粪便','组织','其他') NOT NULL,
  `collection_date` datetime NOT NULL,
  `collection_site` varchar(100) DEFAULT NULL,
  `collection_method` varchar(100) DEFAULT NULL,
  `collection_volume` decimal(6,2) DEFAULT NULL COMMENT '单位: mL或g',
  `collection_tube_type` varchar(50) DEFAULT NULL,
  `processing_method` text,
  `initial_processing_time` time DEFAULT NULL,
  `aliquot_count` int DEFAULT NULL,
  `clinical_context` text COMMENT '采集时的临床背景',
  PRIMARY KEY (`specimen_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `biospecimens_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='生物样本主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biospecimens`
--

LOCK TABLES `biospecimens` WRITE;
/*!40000 ALTER TABLE `biospecimens` DISABLE KEYS */;
/*!40000 ALTER TABLE `biospecimens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_events`
--

DROP TABLE IF EXISTS `collection_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `clinical_visit_id` varchar(50) DEFAULT NULL COMMENT '关联临床就诊记录',
  `event_name` varchar(100) DEFAULT NULL,
  `event_date` date NOT NULL,
  `protocol_version` varchar(20) DEFAULT NULL,
  `collector_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `patient_id` (`patient_id`),
  KEY `clinical_visit_id` (`clinical_visit_id`),
  CONSTRAINT `collection_events_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `clinical_db`.`patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='样本采集事件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_events`
--

LOCK TABLES `collection_events` WRITE;
/*!40000 ALTER TABLE `collection_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crf_sample_collection`
--

DROP TABLE IF EXISTS `crf_sample_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crf_sample_collection` (
  `crf_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `form_completed_by` varchar(50) DEFAULT NULL,
  `form_completion_date` date DEFAULT NULL,
  `patient_fasting` tinyint(1) DEFAULT NULL COMMENT '是否空腹',
  `last_meal_time` time DEFAULT NULL COMMENT '最后进食时间',
  `medication_hold` text COMMENT '停药情况',
  `collection_time` time DEFAULT NULL COMMENT '采集时间',
  `collection_complications` text COMMENT '采集并发症',
  `processing_delay_minutes` int DEFAULT NULL COMMENT '处理延迟时间(分钟)',
  `aliquot_volume` decimal(6,2) DEFAULT NULL COMMENT '分装体积',
  `additive_type` varchar(50) DEFAULT NULL COMMENT '添加剂类型',
  `collector_signature` varchar(50) DEFAULT NULL COMMENT '采集者签名',
  `supervisor_signature` varchar(50) DEFAULT NULL COMMENT '监督者签名',
  PRIMARY KEY (`crf_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `crf_sample_collection_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='样本采集CRF表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crf_sample_collection`
--

LOCK TABLES `crf_sample_collection` WRITE;
/*!40000 ALTER TABLE `crf_sample_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `crf_sample_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_change_log`
--

DROP TABLE IF EXISTS `data_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_change_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `record_id` varchar(20) NOT NULL,
  `change_type` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `changed_by` varchar(50) NOT NULL,
  `change_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `previous_data` json DEFAULT NULL COMMENT '变更前数据',
  `change_reason` text,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据变更日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_change_log`
--

LOCK TABLES `data_change_log` WRITE;
/*!40000 ALTER TABLE `data_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genomic_data`
--

DROP TABLE IF EXISTS `genomic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genomic_data` (
  `genomic_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `analysis_date` date NOT NULL,
  `analysis_platform` varchar(100) DEFAULT NULL,
  `il4_genotype` varchar(50) DEFAULT NULL COMMENT 'IL-4基因型',
  `il13_genotype` varchar(50) DEFAULT NULL COMMENT 'IL-13基因型',
  `filaggrin_mutation` tinyint(1) DEFAULT NULL COMMENT '丝聚蛋白突变',
  `tslp_variant` varchar(50) DEFAULT NULL COMMENT 'TSLP基因变异',
  `other_snp_data` json DEFAULT NULL COMMENT '存储其他SNP位点数据',
  `sequencing_coverage` decimal(6,2) DEFAULT NULL,
  `data_file_path` varchar(255) DEFAULT NULL,
  `analysis_protocol` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`genomic_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `genomic_data_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='基因组数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genomic_data`
--

LOCK TABLES `genomic_data` WRITE;
/*!40000 ALTER TABLE `genomic_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `genomic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `integrated_research_view`
--

DROP TABLE IF EXISTS `integrated_research_view`;
/*!50001 DROP VIEW IF EXISTS `integrated_research_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `integrated_research_view` AS SELECT 
 1 AS `patient_id`,
 1 AS `name`,
 1 AS `gender`,
 1 AS `birth_date`,
 1 AS `disease_name`,
 1 AS `disease_severity`,
 1 AS `symptom_description`,
 1 AS `symptom_severity`,
 1 AS `specimen_id`,
 1 AS `specimen_type`,
 1 AS `collection_date`,
 1 AS `dna_concentration`,
 1 AS `rna_integrity_number`,
 1 AS `il4_genotype`,
 1 AS `il13_genotype`,
 1 AS `il4_level`,
 1 AS `il13_level`,
 1 AS `ige_level`,
 1 AS `predominant_genus`,
 1 AS `firmicutes_bacteroidetes_ratio`,
 1 AS `link_type`,
 1 AS `clinical_notes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `metabolomic_data`
--

DROP TABLE IF EXISTS `metabolomic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metabolomic_data` (
  `metabolomic_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `analysis_date` date NOT NULL,
  `analysis_platform` varchar(100) DEFAULT NULL,
  `histamine_level` decimal(10,2) DEFAULT NULL COMMENT '组胺水平',
  `leukotrienes_level` decimal(10,2) DEFAULT NULL COMMENT '白三烯水平',
  `prostaglandins_level` decimal(10,2) DEFAULT NULL COMMENT '前列腺素水平',
  `other_metabolites` json DEFAULT NULL COMMENT '其他代谢物数据',
  `data_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`metabolomic_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `metabolomic_data_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代谢组数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metabolomic_data`
--

LOCK TABLES `metabolomic_data` WRITE;
/*!40000 ALTER TABLE `metabolomic_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `metabolomic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microbiome_data`
--

DROP TABLE IF EXISTS `microbiome_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microbiome_data` (
  `microbiome_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `analysis_date` date NOT NULL,
  `sequencing_method` varchar(100) DEFAULT NULL,
  `alpha_diversity` decimal(6,3) DEFAULT NULL COMMENT 'α多样性指数',
  `beta_diversity_metrics` json DEFAULT NULL COMMENT 'β多样性指标',
  `predominant_phylum` varchar(100) DEFAULT NULL COMMENT '优势菌门',
  `predominant_genus` varchar(100) DEFAULT NULL COMMENT '优势菌属',
  `firmicutes_bacteroidetes_ratio` decimal(6,2) DEFAULT NULL COMMENT '厚壁菌/拟杆菌比',
  `pathogen_detected` tinyint(1) DEFAULT NULL COMMENT '病原体检出',
  `full_taxonomy_report` json DEFAULT NULL COMMENT '完整分类学报告',
  `data_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`microbiome_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `microbiome_data_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='微生物组数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microbiome_data`
--

LOCK TABLES `microbiome_data` WRITE;
/*!40000 ALTER TABLE `microbiome_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `microbiome_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proteomic_data`
--

DROP TABLE IF EXISTS `proteomic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proteomic_data` (
  `proteomic_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `analysis_date` date NOT NULL,
  `analysis_method` varchar(100) DEFAULT NULL,
  `il4_level` decimal(8,2) DEFAULT NULL COMMENT 'IL-4水平',
  `il5_level` decimal(8,2) DEFAULT NULL COMMENT 'IL-5水平',
  `il13_level` decimal(8,2) DEFAULT NULL COMMENT 'IL-13水平',
  `ige_level` decimal(8,2) DEFAULT NULL COMMENT 'IgE水平',
  `cytokine_profile` json DEFAULT NULL COMMENT '细胞因子谱数据',
  `data_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`proteomic_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `proteomic_data_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='蛋白质组数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proteomic_data`
--

LOCK TABLES `proteomic_data` WRITE;
/*!40000 ALTER TABLE `proteomic_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `proteomic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_clinical_link`
--

DROP TABLE IF EXISTS `specimen_clinical_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specimen_clinical_link` (
  `link_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `clinical_diagnosis_id` int DEFAULT NULL COMMENT '关联临床诊断ID',
  `clinical_symptom_id` int DEFAULT NULL COMMENT '关联临床症状ID',
  `clinical_medication_id` int DEFAULT NULL COMMENT '关联临床用药ID',
  `clinical_test_id` int DEFAULT NULL COMMENT '关联临床检查ID',
  `link_type` enum('诊断时','治疗前','治疗后','随访期','急性发作期','缓解期') DEFAULT NULL,
  `clinical_notes` text,
  PRIMARY KEY (`link_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `specimen_clinical_link_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='样本-临床关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_clinical_link`
--

LOCK TABLES `specimen_clinical_link` WRITE;
/*!40000 ALTER TABLE `specimen_clinical_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `specimen_clinical_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_qc`
--

DROP TABLE IF EXISTS `specimen_qc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specimen_qc` (
  `qc_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `qc_date` date NOT NULL,
  `dna_concentration` decimal(8,2) DEFAULT NULL COMMENT '单位: ng/μL',
  `dna_quality_ratio` decimal(5,2) DEFAULT NULL COMMENT 'A260/A280',
  `rna_integrity_number` decimal(4,2) DEFAULT NULL COMMENT 'RIN值',
  `protein_concentration` decimal(8,2) DEFAULT NULL COMMENT '单位: mg/mL',
  `hemolysis_level` enum('无','轻度','中度','重度') DEFAULT NULL,
  `contamination_status` tinyint(1) DEFAULT NULL,
  `qc_operator` varchar(50) DEFAULT NULL,
  `qc_method` varchar(100) DEFAULT NULL,
  `qc_notes` text,
  PRIMARY KEY (`qc_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `specimen_qc_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='样本质量控表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_qc`
--

LOCK TABLES `specimen_qc` WRITE;
/*!40000 ALTER TABLE `specimen_qc` DISABLE KEYS */;
/*!40000 ALTER TABLE `specimen_qc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_storage`
--

DROP TABLE IF EXISTS `specimen_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specimen_storage` (
  `storage_id` int NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(20) NOT NULL,
  `storage_location` varchar(50) NOT NULL COMMENT '冰箱编号/液氮罐编号',
  `storage_position` varchar(50) DEFAULT NULL COMMENT '具体位置',
  `storage_temperature` decimal(5,2) NOT NULL COMMENT '单位: °C',
  `freeze_date` datetime NOT NULL,
  `freeze_method` varchar(100) DEFAULT NULL,
  `freeze_thaw_cycles` int DEFAULT '0',
  `storage_status` enum('可用','已用完','销毁','转移') DEFAULT '可用',
  `last_check_date` date DEFAULT NULL,
  PRIMARY KEY (`storage_id`),
  KEY `specimen_id` (`specimen_id`),
  CONSTRAINT `specimen_storage_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `biospecimens` (`specimen_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='样本存储条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_storage`
--

LOCK TABLES `specimen_storage` WRITE;
/*!40000 ALTER TABLE `specimen_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `specimen_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `integrated_research_view`
--

/*!50001 DROP VIEW IF EXISTS `integrated_research_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `integrated_research_view` AS select `p`.`patient_id` AS `patient_id`,`p`.`name` AS `name`,`p`.`gender` AS `gender`,`p`.`birth_date` AS `birth_date`,`d`.`disease_name` AS `disease_name`,`d`.`severity` AS `disease_severity`,`s`.`symptom_description` AS `symptom_description`,`s`.`severity_level` AS `symptom_severity`,`b`.`specimen_id` AS `specimen_id`,`b`.`specimen_type` AS `specimen_type`,`b`.`collection_date` AS `collection_date`,`q`.`dna_concentration` AS `dna_concentration`,`q`.`rna_integrity_number` AS `rna_integrity_number`,`g`.`il4_genotype` AS `il4_genotype`,`g`.`il13_genotype` AS `il13_genotype`,`pr`.`il4_level` AS `il4_level`,`pr`.`il13_level` AS `il13_level`,`pr`.`ige_level` AS `ige_level`,`m`.`predominant_genus` AS `predominant_genus`,`m`.`firmicutes_bacteroidetes_ratio` AS `firmicutes_bacteroidetes_ratio`,`cl`.`link_type` AS `link_type`,`cl`.`clinical_notes` AS `clinical_notes` from ((((((((`clinical_db`.`patients` `p` join `biospecimens` `b` on((`p`.`patient_id` = `b`.`patient_id`))) left join `specimen_clinical_link` `cl` on((`b`.`specimen_id` = `cl`.`specimen_id`))) left join `clinical_db`.`diagnoses` `d` on((`cl`.`clinical_diagnosis_id` = `d`.`diagnosis_id`))) left join `clinical_db`.`symptoms` `s` on((`cl`.`clinical_symptom_id` = `s`.`symptom_id`))) left join `specimen_qc` `q` on((`b`.`specimen_id` = `q`.`specimen_id`))) left join `genomic_data` `g` on((`b`.`specimen_id` = `g`.`specimen_id`))) left join `proteomic_data` `pr` on((`b`.`specimen_id` = `pr`.`specimen_id`))) left join `microbiome_data` `m` on((`b`.`specimen_id` = `m`.`specimen_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-26 19:19:06
