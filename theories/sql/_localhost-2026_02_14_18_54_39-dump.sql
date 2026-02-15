-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: multilingual_dev
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
-- Table structure for table `constraints`
--

DROP TABLE IF EXISTS `constraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constraints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `master_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '0=root; >0=parent constraint id',
  `script` varchar(128) NOT NULL DEFAULT '' COMMENT '具体约束条件脚本/规则文本',
  `description` varchar(4096) NOT NULL DEFAULT '',
  `system_type_id` bigint NOT NULL DEFAULT '0' COMMENT '文字系统类型：引用 type_dict.id（name=system_type）',
  `channel_type_id` bigint NOT NULL DEFAULT '0' COMMENT '约束条件的类别，书写系统/音律等等',
  `language_type_id` bigint NOT NULL DEFAULT '0' COMMENT '语言的类型，英语/德语，等等',
  `status_id` bigint NOT NULL DEFAULT '0' COMMENT '状态：引用type_dict表，例如 0=unreview,1=active,2=inactive,-1=deprecated',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_constraint_master` (`master_id`),
  KEY `idx_constraint_status` (`status_id`),
  KEY `idx_constraint_lang` (`language_type_id`),
  KEY `idx_constraint_sys` (`system_type_id`),
  KEY `idx_constraint_channel` (`channel_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraints`
--

LOCK TABLES `constraints` WRITE;
/*!40000 ALTER TABLE `constraints` DISABLE KEYS */;
INSERT INTO `constraints` VALUES (2,0,'先锁歧义成本最高的轴，再挂载补充','表达先给出一个不易跑偏的解析核（主变量/问题函数/坐标系）。后续信息可以作为补充挂载，也可以通过稳定的关系词显式链接来重构/改写该解析核；关键是让挂载与重构的路径可见、可分段、可追踪，避免隐式漂移。',5,6,3,1,'2026-02-12 19:51:58','2026-02-12 19:51:58'),(3,2,'补充尽量并入同一句，减少语用漂移','两句也能说清，但“一句挂载”更不容易被理解成两个独立焦点。',5,6,3,1,'2026-02-12 19:53:19','2026-02-12 19:53:19'),(4,2,'补充要用稳定的关系词标注关系类型','这里 from 就是“来源/背景关系”的标签（你说的介词标签化）',5,6,3,1,'2026-02-12 19:53:19','2026-02-12 19:53:19');
/*!40000 ALTER TABLE `constraints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `master_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '0=root; >0=parent model id',
  `name` varchar(128) NOT NULL DEFAULT '',
  `script` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(2048) NOT NULL DEFAULT '',
  `id_set_json` json NOT NULL DEFAULT (json_object()) COMMENT 'e.g. {"strategy_axis_ids":[1,2],"constraint_ids":[10,11]}',
  `model_kind_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'type_dict: base/projection/application...',
  `status_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_model_master` (`master_id`),
  KEY `idx_model_kind` (`model_kind_id`),
  KEY `idx_model_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,0,'基元模型','基元集+约束蓝图','基元集（大脑智能表达/大脑被智能表达）+约束集（父子树或者其他）','{}',10,1,'2026-02-12 20:53:13','2026-02-12 20:56:03'),(2,1,'信息交流投影','信息交流模型+信息交流约束集','沟通模型：基元模型在“交流/表达/理解”这个任务域里的投影/实例化（核、核排列、单核+挂载、显式关系边、误解成本优先）。\n\n这两个名字的好处是：层级关系一眼明白——沟通模型不是另起炉灶，而是基元模型的一条落地线。\n\n我唯一的建议是加一个很短的约束，防止未来概念漂移：\n沟通模型只管“结构控制与误解成本”，不管“价值判断/审美/内容真伪”。\n这样它就不会越长越像“万能认知模型”。\n沟通模型更像是：一套“表达与解析的结构控制器”——它回答“怎么说才不漂/怎么把多核压成可解析接口”','{}',11,1,'2026-02-12 21:06:14','2026-02-12 21:38:11'),(3,1,'OS投影','商君书OS、圣经OS等','OS 模型（商君书OS、圣经OS 等）更像是：一套“价值/权力/规范/奖惩/世界观”的运行规则与解释框架——它回答“该怎么活/怎么组织/怎么合法化”。','{}',12,1,'2026-02-12 21:38:11','2026-02-12 21:38:11'),(4,2,'多语言领域','重点是“边类型如何在不同语言里实现”（介词/格/语序/省略）','沟通模型跨领域很自然\n“多语言领域 / 文娱领域”确实属于沟通模型的不同“表层实现域”：','{}',11,1,'2026-02-12 22:02:25','2026-02-12 22:02:25'),(5,2,'文娱领域','重点是“允许隐式作为策略”但仍能审计结构（伏笔/延迟揭示/多线并行）','沟通模型跨领域很自然\n“多语言领域 / 文娱领域”确实属于沟通模型的不同“表层实现域”：\n\n多语言：重点是“边类型如何在不同语言里实现”（介词/格/语序/省略）\n\n文娱：重点是“允许隐式作为策略”但仍能审计结构（伏笔/延迟揭示/多线并行）\n多语言系统上能用：\n你把东西拆成“核 + 关系边 + 收敛规则”。不同语言差的是“边怎么实现”（介词/格/后置词/语序/省略），但“边的类型”和“核的编排”是稳定的。所以它天然适合作为中间层（IR），再映射到各语言表层。\n\n文娱领域能用：\n文娱文本也是核网络：场景核串联、核间关系（铺垫/转折/因果/对照/延迟揭示）在跑。你模型能做的是把结构拆出来、把解释权和信息揭示的路径标出来，从而在创作/改写/对齐风格时更可控。','{}',11,1,'2026-02-12 22:03:42','2026-02-12 22:26:26');
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_axes`
--

DROP TABLE IF EXISTS `strategy_axes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_axes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `script` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(2048) NOT NULL DEFAULT '',
  `status_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_axis_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_axes`
--

LOCK TABLES `strategy_axes` WRITE;
/*!40000 ALTER TABLE `strategy_axes` DISABLE KEYS */;
INSERT INTO `strategy_axes` VALUES (1,'误解成本','误解成本','',1,'2026-02-12 19:47:30','2026-02-12 19:47:59'),(2,'信息价值','信息价值','',1,'2026-02-12 19:47:05','2026-02-12 19:47:05'),(5,'效率','效率','效率这个概念在任何方面都是一个通用概念',1,'2026-02-12 19:49:16','2026-02-12 19:49:16'),(6,'输出接口单核','输出接口单核','多核别追求“统一成单核”，追求“输出接口单核”\n内部可以多核网络，外部每句只允许一个 head，这是你系统的核心纪律。\n你要守的是“接口规范”，不是“世界观简化”。',1,'2026-02-12 21:08:05','2026-02-12 21:19:06'),(7,'多核','多核输出','多核输出追求',1,'2026-02-12 21:11:42','2026-02-12 21:11:42'),(8,'统一成单核','统一成单核','统一成单核输出',1,'2026-02-12 21:12:26','2026-02-12 21:12:26'),(9,'隐式是噪声','隐式是噪声','对照解释：隐式不是噪声',1,'2026-02-12 21:21:47','2026-02-12 21:21:47'),(10,'隐式不是噪声','隐式是一种可标注对象','把“隐式”正式收编成一种可标注对象\n文娱也好、真实交流也好，隐式不是噪声。你可以给它一个元标签：\n“delayed-bind / intentional-implicit / ambiguity-as-strategy”。\n这能避免你把文学/策略性表达误判成失败，同时也能审计。',1,'2026-02-12 21:21:47','2026-02-12 21:21:47'),(11,'验证靠感觉','验证靠感觉','验证别靠感觉：用“误解成本”当唯一KPI',1,'2026-02-12 21:26:12','2026-02-12 21:26:12'),(12,'误解成本当唯一KPI','是否减少分叉、减少回滚、减少补救解释次数、减少误读率。','验证别靠感觉：用“误解成本”当唯一KPI\n你不需要评价“表达好不好”，只需要看：\n是否减少分叉、减少回滚、减少补救解释次数、减少误读率。\n这是你体系的生命线。',1,'2026-02-12 21:27:13','2026-02-12 21:27:13');
/*!40000 ALTER TABLE `strategy_axes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_dicts`
--

DROP TABLE IF EXISTS `type_dicts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_dicts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主约束的名字',
  `script` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '这个约束下的子约束',
  `explain` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '子约束对应的中文解释',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '这条数据的状态',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_group_enabled` (`name`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_dicts`
--

LOCK TABLES `type_dicts` WRITE;
/*!40000 ALTER TABLE `type_dicts` DISABLE KEYS */;
INSERT INTO `type_dicts` VALUES (1,'status','new_unreviewed','刚生成/未审计','状态：未审计，版本更新后旧版本，放弃，删除。。。',1,'2026-02-08 17:05:39','2026-02-12 23:27:54'),(2,'language_type','En','英语','该约束条件适用英语语言约束',1,'2026-02-10 21:50:33','2026-02-10 21:52:23'),(3,'language_type','Common','通用约束','该约束条件适用通用语言约束',1,'2026-02-10 21:52:23','2026-02-10 21:52:23'),(4,'system_type','Latin_Alphabet','拉丁字母','该约束条件适用拉丁字母型约束，象形文字/字母型/韩语这样的其他集/等等',1,'2026-02-10 21:57:35','2026-02-10 21:58:53'),(5,'system_type','Common','通用约束','该约束条件适用通用语言约束',1,'2026-02-10 21:58:53','2026-02-10 21:58:53'),(6,'channel_type','Common','通用约束','该约束条件适用通用语言约束',1,'2026-02-10 22:02:38','2026-02-10 22:02:38'),(7,'channel_type','Musical','音律约束','该约束条件适用语言的音律规则系统',1,'2026-02-10 22:05:18','2026-02-10 22:05:18'),(10,'model_kind','Base','基础模型，也就是基元模型','该约束条件适用基础模型',1,'2026-02-13 01:55:51','2026-02-13 01:55:51'),(11,'model_kind','Exchange','信息交流模型','这是基元模型在信息交流领域的建模',1,'2026-02-13 02:06:05','2026-02-13 02:06:05'),(12,'model_kind','Order','秩序模型','基元模型在秩序领域的投影，神定秩序/商君书秩序/毁灭秩序等等',1,'2026-02-13 02:37:51','2026-02-13 02:37:51');
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

-- Dump completed on 2026-02-14 18:54:39
