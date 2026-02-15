-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: a_a_os_dev
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
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '这张卡片的创建者/出牌者/猎杀者/黑暗森林就是一个出牌者',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展，一个想法/目的，用来记录ids，链接其他的策略，应对这个案例的策略集合,当然，案例第一次出现，特征相似案例两种情况，原始ids，相似ids',
  `card_json` json NOT NULL DEFAULT (json_object()) COMMENT '引入出牌者/猎杀者这个概念，就没有棋局/场景/背景的概念，锚点就全部变成玩家，只有对弈的概念，卡片动态扩展，不同的卡片有不同的考量/策略组',
  `remark` varchar(4096) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：动态扩展',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_model_master` (`player_id`),
  KEY `idx_model_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,1,'{\"key\": [\"从axes里总结的检索key01\", \"从axes里总结的检索key02\"], \"remark\": \"测试\"}','{\"point\": \"基元集合+约束集合的蓝图\", \"reason\": [\"智能，神奇的特征\", \"weightAxes是如果该策略有参考其他策略才启用\"], \"remark\": \"point是策略集的总结提炼,pointAxes是point的策略集,reason是策略者的其他思考，当然，这些都可以由策略者动态补充.\", \"pointAxes\": [{\"ids\": [{\"id\": 12, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0}, {\"id\": 13, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0}], \"reason\": [\"参考cpu的01，核心就是电阻，通过就是1，不通过就是0，而承载电阻的这个材料，我认为其结构是无数（抽象）基元的集合，01表达是这个材料下特定基元或基元组的表达的结果\"], \"remark\": \"ids是从资产库里选择出来的，这条策略的分析路径的一部分，因为axes是一个集合\"}, {\"ids\": [14, 13], \"reason\": [\"基元集合的表达是可以被约束条件（单数或复数）影响或主动去适配约束条件（单数或复数），当然，我也认为有默认的元约束条件（单数或复数）\"], \"remark\": \"ids是从资产库里选择出来的，这条策略的分析路径的一部分，因为axes是一个集合\"}], \"weightAxes\": []}','','{}',1,'2026-02-14 16:36:14','2026-02-14 18:45:07'),(2,0,'{\"key\": [\"从axes里总结的检索key01\", \"从axes里总结的检索key02\"], \"remark\": \"测试\"}','{}','','{}',1,'2026-02-14 17:51:50','2026-02-14 18:07:50'),(3,1,'{\"key\": [\"从axes里总结的检索key01\", \"从axes里总结的检索key02\"], \"remark\": \"测试\"}','{}','','{}',1,'2026-02-14 17:46:10','2026-02-14 18:07:50'),(8,1,'{\"key\": [\"从axes里总结的检索key01\", \"从axes里总结的检索key02\"], \"remark\": \"测试\"}','{\"point\": \"多语言领域\", \"reason\": [\"智能，神奇的特征\"], \"remark\": \"point是策略集的总结提炼,pointAxes是point的策略集,reason是策略者的其他思考，当然，这些都可以由策略者动态补充\", \"pointAxes\": [{\"ids\": [{\"id\": 12, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0}, {\"id\": 13, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0}], \"reason\": [], \"remark\": \"ids是从资产库里选择出来的，这条策略的分析路径的一部分，因为axes是一个集合\"}, {\"ids\": [14, 13], \"reason\": [], \"remark\": \"ids是从资产库里选择出来的，这条策略的分析路径的一部分，因为axes是一个集合\"}], \"weightAxes\": [{\"ids\": [{\"id\": 2, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0.23}, {\"id\": 3, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0.62}], \"reason\": [\"策略者动态补充思考\"], \"remark\": \"weightAxes是这个策略，被参考策略影响的权重和理由\"}]}','','{}',1,'2026-02-14 17:49:49','2026-02-14 18:46:57'),(9,1,'{\"key\": [\"从axes里总结的检索key01\", \"从axes里总结的检索key02\"], \"remark\": \"测试\"}','{\"point\": \"短文案领域\", \"reason\": [\"智能，神奇的特征\", \"pointAxes是策略已经定型，然后再去资产数据库选择数据进行匹配，生成想要的总结，并且附带总结理由，这个策略是怎么产生的，weightAxes是参考策略，然后策略总结\", \"weightAxes，是参考的策略，排列顺序就是参考策略的先后，权重是另一个考量，这些策略的共同作用，产生了pointAxes，然后产生point\"], \"remark\": \"point是策略集的总结提炼,pointAxes是point的策略集,reason是策略者的其他思考，当然，这些都可以由策略者动态补充\", \"pointAxes\": [{\"ids\": [{\"id\": 12, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0}, {\"id\": 13, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0}], \"reason\": [], \"remark\": \"ids是从资产库里选择出来的，这条策略的分析路径的一部分，因为axes是一个集合\"}, {\"ids\": [14, 13], \"reason\": [], \"remark\": \"ids是从资产库里选择出来的，这条策略的分析路径的一部分，因为axes是一个集合\"}], \"weightAxes\": [{\"ids\": [{\"id\": 2, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0.23}, {\"id\": 3, \"reason\": [\"参考的策略对该策略的权重影响\"], \"weight\": 0.62}], \"reason\": [\"策略者动态补充思考\"], \"remark\": \"weightAxes是这个策略，被参考策略影响的权重和理由\"}]}','','{}',1,'2026-02-14 17:49:49','2026-02-14 22:18:42');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codebook`
--

DROP TABLE IF EXISTS `codebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codebook` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字典的英文名',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '具体的字典',
  `explain` varchar(64) NOT NULL DEFAULT '' COMMENT '对应的中文解释',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注,动态扩展',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '这条code的状态 删除/更新/等等,1,未审计，2审计并上线',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_group_enabled` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codebook`
--

LOCK TABLES `codebook` WRITE;
/*!40000 ALTER TABLE `codebook` DISABLE KEYS */;
INSERT INTO `codebook` VALUES (1,'{}','status','new_unreviewed','刚生成/未审计','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:03'),(2,'{}','status','delete','删除','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:31');
/*!40000 ALTER TABLE `codebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creator_id` bigint unsigned NOT NULL COMMENT '这条sql是谁执行',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `sql_text` mediumtext NOT NULL,
  `sql_hash` char(64) NOT NULL DEFAULT '0',
  `success` tinyint NOT NULL DEFAULT '1',
  `error_message` text,
  `meta_json` json NOT NULL DEFAULT (json_object()),
  `remark` varchar(4096) NOT NULL DEFAULT '' COMMENT '备注',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：动态扩展',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_runlog_created` (`created_at`),
  KEY `idx_runlog_hash` (`sql_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,1,'{}','测试','0',1,NULL,'{}','','{}','2026-02-13 16:13:15');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `pid` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的真实id',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的具体地址,国家-州-地区，等等',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `remark` varchar(4096) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注,动态扩展',
  `status_id` int NOT NULL DEFAULT '1' COMMENT '默认刚生成/未审计',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'O2','EK8258144','中国-福建','{}','','{}',1,'2026-02-13 15:47:55','2026-02-13 15:53:33'),(2,'系统治理玩家01','EK8258144','14011 Ash Ave Apt 1L 11355-2705','{}','','{}',1,'2026-02-15 01:26:24','2026-02-15 01:26:24'),(3,'系统治理玩家02','16046165','测试','{}','测试','{}',1,'2026-02-15 01:26:54','2026-02-15 01:28:54'),(4,'黑暗森林玩家','','','{}','测试','{}',1,'2026-02-15 01:27:20','2026-02-15 01:31:29'),(5,'意外因素玩家','','','{}','测试','{}',1,'2026-02-15 01:28:06','2026-02-15 01:31:29'),(6,'AI玩家','','','{}','测试','{}',1,'2026-02-15 01:28:54','2026-02-15 01:31:29'),(7,'环境玩家','','','{}','测试','{}',1,'2026-02-15 01:31:03','2026-02-15 01:31:03'),(8,'裁决型玩家(法律)','','','{}','测试','{}',1,'2026-02-15 01:32:22','2026-02-15 01:32:22');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-15  1:38:14
