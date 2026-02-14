-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: a_os_dev
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `concept_tokens`
--

DROP TABLE IF EXISTS `concept_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concept_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL,
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '策略考量的检索key，这样就不用头痛不同策略者对策略的分类，由策略者自己写检索json',
  `remark` varchar(4096) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：这个token生成背景',
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_tokens`
--

LOCK TABLES `concept_tokens` WRITE;
/*!40000 ALTER TABLE `concept_tokens` DISABLE KEYS */;
INSERT INTO `concept_tokens` VALUES (1,'误解成本','{}','','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(2,'信息价值','{}','','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(3,'效率','{}','效率这个概念在任何方面都是一个通用概念','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(4,'输出接口单核','{}','多核别追求“统一成单核”，追求“输出接口单核”\r\n内部可以多核网络，外部每句只允许一个 head，这是你系统的核心纪律。\r\n你要守的是“接口规范”，不是“世界观简化”。','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(5,'多核输出','{}','多核输出追求','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(6,'统一成单核','{}','统一成单核输出','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(7,'隐式是噪声','{}','对照解释：隐式不是噪声','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(8,'隐式是一种可标注对象','{}','把“隐式”正式收编成一种可标注对象\r\n文娱也好、真实交流也好，隐式不是噪声。你可以给它一个元标签：\r\n“delayed-bind / intentional-implicit / ambiguity-as-strategy”。\r\n这能避免你把文学/策略性表达误判成失败，同时也能审计。','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(9,'验证靠感觉','{}','验证别靠感觉：用“误解成本”当唯一KPI','{}',1,'2026-02-13 15:26:34','2026-02-13 15:26:34'),(10,'误解成本','{}','验证别靠感觉：用“误解成本”当唯一KPI\r\n你不需要评价“表达好不好”，只需要看：\r\n是否减少分叉、减少回滚、减少补救解释次数、减少误读率。\r\n这是你体系的生命线。','{}',1,'2026-02-13 15:26:34','2026-02-13 15:30:33'),(11,'唯一KPI','{}','是否减少分叉、减少回滚、减少补救解释次数、减少误读率。','{}',1,'2026-02-13 15:30:33','2026-02-13 15:30:33');
/*!40000 ALTER TABLE `concept_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creators`
--

DROP TABLE IF EXISTS `creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creators` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `pid` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的真实id',
  `nation` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的出生国,尽可能的具体地址',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '策略考量的检索key，这样就不用头痛不同策略者对策略的分类，由策略者自己写检索json',
  `remark` varchar(4096) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：这个token生成背景',
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creators`
--

LOCK TABLES `creators` WRITE;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` VALUES (1,'O2','EK8258144','中国-福建','{}','','{}',1,'2026-02-13 15:47:55','2026-02-13 15:53:33');
/*!40000 ALTER TABLE `creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poker`
--

DROP TABLE IF EXISTS `poker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poker` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '这条策略的创建者',
  `point` varchar(128) NOT NULL DEFAULT '' COMMENT '策略考量',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '策略考量的检索key，这样就不用头痛不同策略者对策略的分类，由策略者自己写检索json',
  `reason_json` json NOT NULL DEFAULT (json_object()) COMMENT '这么做决策的考量，    id_set_json json            default (json_object())   not null comment ''e.g. {"strategy_axis_ids":[1,2],"constraint_ids":[10,11]}         根据不同的考量，进行不同的逻辑树 '',',
  `remark` varchar(4096) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：这个token生成背景',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_model_master` (`creator_id`),
  KEY `idx_model_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poker`
--

LOCK TABLES `poker` WRITE;
/*!40000 ALTER TABLE `poker` DISABLE KEYS */;
/*!40000 ALTER TABLE `poker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_sql_logs`
--

DROP TABLE IF EXISTS `run_sql_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `run_sql_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creator_id` bigint unsigned NOT NULL COMMENT '这条sql是谁执行',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '策略考量的检索key，这样就不用头痛不同策略者对策略的分类，由策略者自己写检索json',
  `sql_text` mediumtext NOT NULL,
  `sql_hash` char(64) NOT NULL DEFAULT '0',
  `success` tinyint NOT NULL DEFAULT '1',
  `error_message` text,
  `meta_json` json NOT NULL DEFAULT (json_object()),
  `remark` varchar(4096) NOT NULL DEFAULT '' COMMENT '备注',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：这个token生成背景',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_runlog_created` (`created_at`),
  KEY `idx_runlog_hash` (`sql_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_sql_logs`
--

LOCK TABLES `run_sql_logs` WRITE;
/*!40000 ALTER TABLE `run_sql_logs` DISABLE KEYS */;
INSERT INTO `run_sql_logs` VALUES (1,1,'{}','测试','0',1,NULL,'{}','','{}','2026-02-13 16:13:15');
/*!40000 ALTER TABLE `run_sql_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_dicts`
--

DROP TABLE IF EXISTS `type_dicts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_dicts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '策略考量的检索key，这样就不用头痛不同策略者对策略的分类，由策略者自己写检索json',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '约束的英文名',
  `rule` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '这个约束下有哪些具体的约束',
  `explain` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '约束对应的中文解释',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：这个token生成背景',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '这条数据的状态 删除/更新/等等,0,未审计，1审计并上线',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_group_enabled` (`name`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_dicts`
--

LOCK TABLES `type_dicts` WRITE;
/*!40000 ALTER TABLE `type_dicts` DISABLE KEYS */;
INSERT INTO `type_dicts` VALUES (1,'{}','status','new_unreviewed','刚生成/未审计','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:03'),(2,'{}','status','delete','删除','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:31');
/*!40000 ALTER TABLE `type_dicts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-13 21:18:57
