-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: studentjudge
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ProfilePicture` varchar(100) DEFAULT NULL,
  `Institute` varchar(100) NOT NULL,
  `Class` varchar(10) DEFAULT NULL,
  `Address` longtext,
  `ContactNumber` varchar(11) DEFAULT NULL,
  `user_id` int NOT NULL,
  `isTeacher` tinyint(1) NOT NULL,
  `quota` longtext,
  `specialist` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (2,'user/IMG_8807.JPG','','-----','khandokar mension , masdair ,narayanganj','01521435735',3,1,'“Mathematics expresses values that reflect the cosmos, including orderliness, balance, harmony, logic, and abstract beauty.”','Math');
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add about',7,'add_about'),(26,'Can change about',7,'change_about'),(27,'Can delete about',7,'delete_about'),(28,'Can view about',7,'view_about'),(29,'Can add blog',8,'add_blog'),(30,'Can change blog',8,'change_blog'),(31,'Can delete blog',8,'delete_blog'),(32,'Can view blog',8,'view_blog'),(33,'Can add slide',9,'add_slide'),(34,'Can change slide',9,'change_slide'),(35,'Can delete slide',9,'delete_slide'),(36,'Can view slide',9,'view_slide'),(37,'Can add video',10,'add_video'),(38,'Can change video',10,'change_video'),(39,'Can delete video',10,'delete_video'),(40,'Can view video',10,'view_video'),(41,'Can add profile',11,'add_profile'),(42,'Can change profile',11,'change_profile'),(43,'Can delete profile',11,'delete_profile'),(44,'Can view profile',11,'view_profile'),(45,'Can add question',12,'add_question'),(46,'Can change question',12,'change_question'),(47,'Can delete question',12,'delete_question'),(48,'Can view question',12,'view_question');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$H8EHRA4YeJhO$zjy62AAZHpZlpLtpaRFrB6hfsXqvRosce03+Gh6jvjI=','2020-12-31 14:07:26.683998',1,'admin','','','studentjudge411@gmail.com',1,1,'2020-12-31 14:06:53.316467'),(3,'pbkdf2_sha256$216000$yQLrE25HQQNp$H4fZLV3ktboQYJFVDVoCR7zf9P2QuXdUI4C+PHzrDsk=','2021-01-03 14:43:47.703603',0,'leeon','kamruzzaman','leeon','leeon.ewubd@gmail.com',0,1,'2020-12-31 14:52:44.433991');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-12-31 14:24:07.361126','1','Student Judge Gem',1,'[{\"added\": {}}]',7,1),(2,'2020-12-31 14:24:13.506388','1','Student Judge Gem',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',7,1),(3,'2020-12-31 14:25:40.003548','1','Student Judge Gem',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(4,'2020-12-31 14:32:00.899419','1','Student Judge',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(5,'2020-12-31 14:32:12.690678','1','Student Judge',2,'[]',7,1),(6,'2020-12-31 14:33:36.624927','1','Welcome to Student judge',1,'[{\"added\": {}}]',9,1),(7,'2020-12-31 14:33:51.539989','1','Welcome to Student judge',2,'[{\"changed\": {\"fields\": [\"Description\", \"Active\"]}}]',9,1),(8,'2020-12-31 14:35:45.063924','1','Welcome to Student judge',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(9,'2020-12-31 14:40:40.927019','2','Learning Today, Leading Tomorrow',1,'[{\"added\": {}}]',9,1),(10,'2020-12-31 14:43:30.750211','1','Welcome to Student judge',3,'',9,1),(11,'2020-12-31 14:43:36.721780','2','Learning Today, Leading Tomorrow',3,'',9,1),(12,'2020-12-31 14:44:05.590124','3','Welcome to Student judge',1,'[{\"added\": {}}]',9,1),(13,'2020-12-31 14:44:40.936921','4','Learning Today, Leading Tomorrow',1,'[{\"added\": {}}]',9,1),(14,'2020-12-31 14:45:12.160090','5','Famous Quota',1,'[{\"added\": {}}]',9,1),(15,'2020-12-31 14:45:45.248816','6','Life is Easy. Why Do We Make It So Hard?',1,'[{\"added\": {}}]',9,1),(16,'2020-12-31 14:45:50.718689','6','Life is Easy. Why Do We Make It So Hard?',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',9,1),(17,'2020-12-31 14:52:16.239325','2','leeon',3,'',4,1),(18,'2021-01-03 15:20:40.106913','1','trail',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'accounts','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'examination','question'),(7,'main','about'),(8,'main','blog'),(9,'main','slide'),(10,'main','video'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-12-31 14:01:55.224685'),(2,'auth','0001_initial','2020-12-31 14:01:58.597234'),(3,'accounts','0001_initial','2020-12-31 14:02:40.256232'),(4,'accounts','0002_auto_20201231_2001','2020-12-31 14:03:17.456829'),(5,'admin','0001_initial','2020-12-31 14:03:18.869156'),(6,'admin','0002_logentry_remove_auto_add','2020-12-31 14:03:23.858423'),(7,'admin','0003_logentry_add_action_flag_choices','2020-12-31 14:03:23.920921'),(8,'contenttypes','0002_remove_content_type_name','2020-12-31 14:03:30.863621'),(9,'auth','0002_alter_permission_name_max_length','2020-12-31 14:03:37.440914'),(10,'auth','0003_alter_user_email_max_length','2020-12-31 14:03:37.987759'),(11,'auth','0004_alter_user_username_opts','2020-12-31 14:03:38.065872'),(12,'auth','0005_alter_user_last_login_null','2020-12-31 14:03:41.142702'),(13,'auth','0006_require_contenttypes_0002','2020-12-31 14:03:41.443545'),(14,'auth','0007_alter_validators_add_error_messages','2020-12-31 14:03:41.718390'),(15,'auth','0008_alter_user_username_max_length','2020-12-31 14:03:44.550398'),(16,'auth','0009_alter_user_last_name_max_length','2020-12-31 14:03:47.144010'),(17,'auth','0010_alter_group_name_max_length','2020-12-31 14:03:47.940825'),(18,'auth','0011_update_proxy_permissions','2020-12-31 14:03:48.050182'),(19,'auth','0012_alter_user_first_name_max_length','2020-12-31 14:03:54.996962'),(20,'main','0001_initial','2020-12-31 14:04:00.353600'),(21,'main','0002_auto_20201231_2001','2020-12-31 14:04:21.255803'),(22,'sessions','0001_initial','2020-12-31 14:04:22.427586'),(23,'main','0003_slide_active','2020-12-31 14:26:56.135267'),(24,'examination','0001_initial','2021-01-03 14:21:51.146188'),(25,'examination','0002_auto_20210103_2046','2021-01-03 14:46:16.083601'),(26,'examination','0003_auto_20210103_2047','2021-01-03 14:47:33.779596'),(27,'examination','0004_auto_20210103_2123','2021-01-03 15:24:03.376131'),(28,'examination','0002_auto_20210103_2207','2021-01-03 16:15:44.873137');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('637c8akq2okrqqnsq4rq4w5ouiuor7ph','.eJxVjDsOwyAQRO9CHSGw-W3K9D4DWmAJTiKQjF1FuXtsyUXSjea9mTfzuK3Fb50WPyd2ZSO7_HYB45PqAdID673x2Oq6zIEfCj9p51NL9Lqd7t9BwV72dbTZjE5IHUKOOgvMEKIkaQEkBrQDkTQChlFq5ZSyCYSzZo9gLCoF7PMF5WI2-w:1kuzKf:lisDrwyEK6Oy_YqCfSo3D4-EZ8Ett0Y159PBXJUH-fE','2021-01-14 14:53:41.516835'),('i29ckji7ple514ou1v0ect8o7y5hf1nm','.eJxVjDsOwyAQRO9CHSGw-W3K9D4DWmAJTiKQjF1FuXtsyUXSjea9mTfzuK3Fb50WPyd2ZSO7_HYB45PqAdID673x2Oq6zIEfCj9p51NL9Lqd7t9BwV72dbTZjE5IHUKOOgvMEKIkaQEkBrQDkTQChlFq5ZSyCYSzZo9gLCoF7PMF5WI2-w:1kw4bj:386SE5tw7k8BKdXYhqA49YDPDFFSK-2NrSvC7yDkECQ','2021-01-17 14:43:47.787556'),('k1uj0y8edm8nffedmwenvsor9hnce63y','.eJxVjEEOwiAQRe_C2pAiQwsu3fcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uLMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmx5nleT3cv4OCrXxrG9zgUZhsFuctMJ3FdMmAoy6wGN8nAgGgZAL6HohgyAhOAlnIgdX7A_EDOG8:1kuybu:paJiLohDb-y5aIq7vcgVlvMCd0UBXmuSRzTN7FaANaE','2021-01-14 14:07:26.926875');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination_question`
--

DROP TABLE IF EXISTS `examination_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examination_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `instruction` longtext,
  `question` varchar(100) NOT NULL,
  `Class` varchar(10) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `chapter` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examination_question_created_2cf026d6` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination_question`
--

LOCK TABLES `examination_question` WRITE;
/*!40000 ALTER TABLE `examination_question` DISABLE KEYS */;
INSERT INTO `examination_question` VALUES (4,'পদার্থের গঠন | The structure of matter','Best of luck','question/sample.pdf','S.S.C','Science','2','2021-01-03 17:13:38.900722','kamruzzaman leeon');
/*!40000 ALTER TABLE `examination_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_about`
--

DROP TABLE IF EXISTS `main_about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_about` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_about`
--

LOCK TABLES `main_about` WRITE;
/*!40000 ALTER TABLE `main_about` DISABLE KEYS */;
INSERT INTO `main_about` VALUES (1,'Student Judge','Student-judge provides a nurturing and stimulating learning environment whereby, through focused individual assistance from experienced tutors, students can achieve their maximum potential and achieve the academic grades necessary to pursue the future they aspire to. We are dedicated to providing a consistent quality of education that cultivates and nurtures students’ intellect at every stage of their academic lives, from the early years of school through to adulthood. Education and learning are broad and continual processes which are not vested purely within traditional forms and as such we happily tailor learning to the individual’s needs whether academic or vocational.','about/70534462_1599078446893209_7771145106182111232_n.jpg',1);
/*!40000 ALTER TABLE `main_about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_blog`
--

DROP TABLE IF EXISTS `main_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `blog` longtext NOT NULL,
  `Class` varchar(10) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `chapter` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_blog_created_4e5e3554` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_blog`
--

LOCK TABLES `main_blog` WRITE;
/*!40000 ALTER TABLE `main_blog` DISABLE KEYS */;
INSERT INTO `main_blog` VALUES (1,'হাইজেনবার্গের গল্প: ২০০ বছর পর পিতা-পুত্রের পরিচয়','থমাস জেফারসন (১৭৪৩-১৮২৬)। আমেরিকা যুক্তরাষ্ট্রের Founding Fathers-দের মধ‍্যে অন‍্যতম। মার্কিনীদের বিখ‍্যাত Declaration of Independence এর প্রধান রচয়িতাও ছিলেন জেফারসন। ১৮০১ থেকে ১৮০৯ সাল পর্যন্ত আমেরিকার তৃতীয় প্রেসিডেন্ট হিসেবেও তিনি দায়িত্ব পালন করেন। কিন্তু, তার সম্পর্কে একটা চাপা গুঞ্জন চলে আসছে প্রায় দু’শ বছর ধরে। থমাস জেফারসনের বাসায় স‍্যালি হেমিংস নামক এক কৃষ্ণাঙ্গ মহিলা দাসী হিসেবে কাজ করতেন। এক পত্রিকার সূত্রমতে, স‍্যালি হেমিংসের সাথে থমাস জেফারসনের ছিলো গভীর প্রেমের সম্পর্ক। শুধু তাই নয়, স‍্যালি হেমিংসের তৃতীয় সন্তান এস্টনের গায়ের রং ছিলো সাদাটে। অনেকেই ধারণা করতেন, এস্টন হচ্ছে জেফারসন আর হেমিংসের ভালোবাসার সন্তান। কিন্তু, প্রেসিডেন্ট জেফারসন ও একজন কৃষ্ণাঙ্গ মহিলার বিবাহ-বহির্ভূত প্রণয় তৎকালীন আমেরিকান সমাজে খুবই সংবেদনশীল বিষয় হয়ে দাঁড়াতো। তাই, নানাভাবে এই প্রণয়ের কথা ধামাচাপা দেয়া হয়েছে বলে ধারণা করা হয়। ১৮২৬ সালে থমাস জেফারসন এই বিশাল ধোয়াঁশা অমিমাংসিত রেখেই মৃত‍্যুবরণ করেন। প্রায় দু’শ বছর পরের কথা। ততদিনে জেফারসন, স‍্যালি হেমিংস, এস্টন— সবাই মৃত‍্যুবরণ করেছেন। কিন্তু, বিজ্ঞান ততদিনে চলে গেছে কোষের ভেতরের ডিএনএ পর্যন্ত। সম্পর্ক সনাক্তকরণে ডিএনএ টেস্ট এখন আমাদের সমাজে নিত‍্যদিনের ব‍্যাপার। ১৯৯৬ সালে ভার্জিনিয়া বিশ্ববিদ‍্যালয়ের প্রফেসর ড. ইউজিন ফস্টার সিদ্ধান্ত নিলেন তিনি জেফারসন ও এস্টনের মাঝে কোন সম্পর্ক যদি থাকে তা প্রমাণ করেই ছাড়বেন। কিন্তু শত বছর আগে মারা যাওয়া তিনজন মানুষের সম্পর্ক আপনি কীভাবে প্রমাণ করবেন? তাদের সবার লাশের অবশিষ্টাংশ কিংবা অস্তিত্ব আজ খুঁজে পাওয়া দুষ্কর। উত্তরটা লুকিয়ে আছে Y ক্রোমোসোমে। আমাদের লিঙ্গ নির্ধারিত হয় X ও Y নামক দুটি ক্রোমোসোম দ্বারা। XX হলে সন্তান মেয়ে হয়; XY হলে সন্তান হবে ছেলে। Y-ক্রোমোসোমটা বাবার কাছ থেকে তার সব ছেলে সন্তানদের মাঝে অপরিবর্তিত অবস্থায় চলে যায়। যেহেতু মেয়ে হতে কোন Y-ক্রোমোসোম দরকার হয় না, সেহেতু বাবার Y-ক্রোমোসোমটা কখনই মেয়ের শরীরে যায় না। সহজ ভাষায় বলতে গেলে, Y-ক্রোমোসোমটা একই পরিবারের সব পুরুষ সদস‍্যদের মাঝে সম্পূর্ণ মিলে যাবে। আপনার দাদা, আপনার বাবা, আপনার চাচা, অাপনার সব চাচাতো ভাই এবং তাদের ছেলে সন্তানদের Y-ক্রোমোসোম সম্পূর্ণ অবিকল। তাই, Y-ক্রোমোসোম ব‍্যবহার করে বাবার দিকের পারিবারিক সম্পর্ক খুব সহজেই বের করে ফেলা যায়।','J.S.C','Science','10','2020-12-31 15:41:03.069891','kamruzzaman leeon'),(2,'জৈব রসায়ন: রাসায়নিক বিক্রিয়া আর ভুলে যাবে না! (শর্টকাটসহ)','এইচএসসিতে রসায়ন পড়ার সময় জৈব রসায়ন অধ্যায়ের নাম শুনে ভয় পায়নি, এমন মানুষ খুঁজে পাওয়াটা একটু কষ্টকর। বিশাল বিশাল রাসায়নিক বিক্রিয়া ও সমীকরণ, তাদের হাজারো ব্যাখ্যা, শত শত যৌগের সমাহার আর বইয়ের পৃষ্ঠার পর পৃষ্ঠা- জৈব রসায়নের কথা শুনলে আমাদের মাথায় এগুলোই আসতো সর্বপ্রথম। আমি নিজেও রসায়ন বইতে জৈব যৌগ অধ্যায়ের দীর্ঘ ব্যাপ্তি দেখে অনেক হতাশ হয়ে পড়েছিলাম। কিন্তু ধীরে ধীরে বুঝতে পারলাম, এতটাও কঠিন না এই জৈব রসায়ন, বরং একটু মনোযোগ দিয়ে বুঝে বুঝে পড়তে পারলে জৈব রসায়নই হতে পারে তোমার সবচেয়ে বড় অস্ত্র। অনেক সময় দেখা যায়, অনেক ছোট ও সহজ টপিকগুলো বইয়ের পাতায় অনেক বড় করে বর্ণনা করে থাকে। এটি একদিকে যেমন সময়সাপেক্ষ, অন্যদিকে এসব টপিক বুঝতেও কিছুটা বেগ পেতে হয়। ব্যক্তিগতভাবে আমি এরকম অবস্থায় সবসময় ইউটিউবে টেন মিনিট স্কুলে শামির মোন্তাজিদ ভাইয়ার ভিডিওগুলো দেখতাম। ৪-৫ মিনিটের এই ভিডিওগুলো খুব বেশি সহায়তা করবে জৈব যৌগে পারদর্শী হতে হলে। (Source: Pinterest) জৈব রসায়নের ভয় আমাদেরকে উপরের ছবির মতই বিব্রতকর অবস্থায় ফেলতে পারে। জৈব রসায়নের প্রতি এই ভয় কাটিয়ে উঠতে চাইলে যে ৫টি বিষয় না জানলেই নয়, সেগুলো আয়ত্তে আনার জন্য রয়েছে নিচের কয়েকটি সহজ নিয়ম ও কিছু শর্টকাট: ১. ইলেক্ট্রোফাইল-নিউক্লিওফাইল নির্ণয়ন: “কোনটা ইলেক্ট্রোফাইল, কোনটা নিউক্লিওফাইল, কিছুই তো বুঝতে পারছি না।” সত্যি বলতে, ইলেক্ট্রোফাইল ও নিউক্লিওফাইল চিহ্নিত করা অনেক সহজ একটা ব্যাপার, যতটা না কঠিন করে আমরা চিন্তা করে থাকি। পজিটিভ-নেগেটিভের মারপ্যাচটা একবার ধরতে পারলেই ইলেক্ট্রো-নিওক্লিওফাইল ঘায়েলের ক্রিপ্টোনাইটটা আমাদের হাতের মুঠোয় চলে আসা সময়ের ব্যাপার। কিভাবে? দেখে আসা যাক- ফাইল শব্দের অর্থ ভালবাসা। এতটুকু জানা থাকলেই আমরা নিজেরাই বুঝতে পারি, ইলেক্ট্রোফাইল কি আর নিওক্লিওফাইল কি। নাম শুনেই বুঝতে পারছি যে, ইলেক্ট্রোফাইল হলো ইলেকট্রনপ্রেমী ও নিওক্লিওফাইল হলো নিউক্লিয়াসপ্রেমী। আমরা ইতিমধ্যে পড়েছি যে, ইলেক্ট্রনের চার্জ ঋণাত্মক ও নিউক্লিয়াসের (প্রোটন-নিউট্রন) চার্জ ধনাত্মক। এখন মনে করো, তুমি মার্সিডিজ বেঞ্জ কোম্পানির বিরাট ভক্ত। তোমার অনেকদিন ধরে ধূসর রঙের একটা মার্সিডিজ এএমজি গাড়ি কেনার ইচ্ছা রয়েছে। মার্সিডিজ গাড়ির প্রতি তোমার এই চাহিদার মানে হলো, তোমার গ্যারেজে ঐ নির্দিষ্ট মডেলের গাড়িটা অনুপস্থিত বা ঘাটতি বিদ্যমান। ঠিক এইরকমই হলো ইলেক্ট্রোফাইল ও নিউক্লিওফাইল। ইলেক্ট্রোফাইল ইলেকট্রনপ্রেমী হওয়ায় তার নিজের কাছে ইলেকট্রনের ঘাটতি রয়েছে। ইলেকট্রনের প্রতি ইলেক্ট্রোফাইলের এই চাহিদা তাকে ধনাত্মক করে তুলে। জেনে রাখা ভাল যে, ধনাত্মক কোনো পদার্থ সর্বদা ঋণাত্মক পদার্থকে লাভ করতে চায়। অন্যদিকে, নিওক্লিওফাইল যেহেতু প্রোটন-নিউট্রনের ধনাত্মক ধর্মের ভক্ত, সুতরাং তারা নিজেরা ঋণাত্মক। শর্টকাট: ইলেক্ট্রোফাইলের ক্ষেত্রে, তুমি = ইলেক্ট্রোফাইল মার্সিডিজ গাড়ি = ইলেকট্রন মার্সিডিজ গাড়ির প্রতি তোমার আকাঙ্ক্ষা = ইলেকট্রনের প্রতি ইলেক্ট্রোফাইলের আকাঙ্ক্ষা এবার একইভাবে নিউক্লিওফাইলের শর্টকাটও নিজেরাই বের করে নিতে পারবো আমরা। ২. অ্যালকিন ও অ্যালকাইনের বিক্রিয়ার সাদৃশ্যতা: জেনে রাখা ভাল যে, অ্যালকিন ও অ্যালকাইন- এই ধর্মের যৌগগুলো অধিকাংশ বিক্রিয়ায় একই রকমের আচরণ করে থাকে। মূলত এরা অন্য কোনো যৌগের সাথে সংযোজন ও বিয়োজন বিক্রিয়ায় অংশ নিয়ে সাদৃশ্যপূর্ণ আচরণ করে। যেমন: (ইথিন) কে HBr (হাইড্রোজেন ব্রোমাইড) এর সাথে যুক্ত করলে ইথিনের একটি বন্ড ভেঙ্গে যাবে, সাথে সাথে যুক্ত হবে একটি কার্বনের সাথে ও যুক্ত হবে অন্য কার্বনটির সাথে। অ্যালকাইনের ক্ষেত্রেও একই ধরনের বিক্রিয়া দেখা যায়। একই বিক্রিয়াতে ইথাইন () এর সাথে হাইড্রোজেন ব্রোমাইড বিক্রিয়া করলে কার্বনের একটি পাই বন্ধন ভেঙ্গে একটি কার্বনের সাথে হাইড্রোজেনের ধনাত্মক অংশটি এবং অন্য কার্বনের সাথে ব্রোমাইডের ঋণাত্মক অংশটি যুক্ত হবে। শর্টকাট: অ্যালকিন ও অ্যালকাইনের একটি বন্ধন ভেঙ্গে যাবে এবং অপর বিক্রিয়কের ধনাত্মক ও ঋণাত্মক অংশগুলো কার্বনের সাথে নতুন বন্ধন গঠন করবে। ঘুরে এস জৈব রসায়নের জগৎ থেকে! ৩. কার্যকরী মূলকের ডিগ্রী: জৈব রসায়নের শুরুর দিকে অনেক সময় দেখতে পাবে জৈবের নামের পূর্বে ডিগ্রী লেখা থাকে এবং তারপর যৌগের কার্যকরী মূলকের নাম থাকে, যেমন ১, ২,৩ অ্যালকোহল। পরীক্ষার প্রশ্নে একটা যৌগের রাসায়নিক সংকেত দিয়ে যৌগটির কার্যকরী মূলক কত ডিগ্রী তা জানতে চাওয়া হতে পারে। অনেক সময় দেখা যায় এই ছোট প্রশ্নটির উত্তর দিতে দিতে আমাদের অনেকটা সময় চলে যায়। কিন্তু কার্যকরী মূলকের ডিগ্রী বের করার একটা সহজ পদ্ধতি রয়েছে। উপরের যৌগটি একটি অ্যালকোহল, কেননা এই যৌগে কার্যকরী মূলক হিসেবে OH বা হাইড্রক্সিল মূলক রয়েছে। এখন এই যৌগটির কার্যকরী মূলকের ডিগ্রী বের করার জন্য প্রথমেই আমরা দেখবো যে OH মূলক টা কোন কার্বনের (C) সাথে যুক্ত এবং সেই কার্বনের সাথে আর কতটি কার্বন সরাসরি সংযুক্ত। দেখা যাচ্ছে, OH মূলক যেই কার্বনের সাথে সংযুক্ত, সেই কার্বনের সাথে আরো ৩টি কার্বন যুক্ত রয়েছে। তাই এই যৌগের ক্ষেত্রে কার্যকরী মূলকটির ডিগ্রী ৩ এবং এটি একটি ৩° অ্যালকোহল। এখন বলে রাখা ভালো যে, একদম মাঝ বরাবর যেই কার্বনটি রয়েছে, তার সাথে ঠিক বাম পাশে CH3CH2 রয়েছে। কিন্তু মাঝের কার্বনটি সরাসরি শুধুমাত্র বামপাশের CH2 এর সাথে যুক্ত। যৌগের সাথে চার্জ কিংবা ফ্রি রেডিক্যাল (মুক্ত অণু-পরমাণু-আয়ন) দেয়া থাকলেও নিয়মটা একই। দেখতে হবে যে, সেই চার্জ যেই কার্বনের সাথে যুক্ত, সেই কার্বন অন্য কতটি কার্বনের সাথে সরাসরি যুক্ত। (Source: 10 Minute School) দেখা যাচ্ছে, CH এ একটি ধনাত্মক চার্জ বিদ্যমান। সুতরাং চার্জ সম্বলিত কার্বনটি CH2 ও CH3 এর সাথে সরাসরি যুক্ত। তাই এটি হবে ২°-কার্বো ক্যাটায়ন। শূন্য ডিগ্রী বলতে কিছু নেই, শূন্য ডিগ্রীর বদলে বলা হয় মিথাইল। অর্থাৎ কোনো যৌগের ডিগ্রী শূন্য হলে তা মূলত একটি মিথাইল। শর্টকাট: কার্যকরী মূলকটি যে কার্বনে যুক্ত, সেই কার্বনটি আর কতটি কার্বনের সাথে ‘সরাসরি ‘ সংযুক্ত। ৪. যৌগের রূপান্তর : (Source: byjus.com) রাসায়নিক বিক্রিয়ার মাধ্যমে এক যৌগ থেকে অন্য যৌগ তৈরি করাই মূলত জৈব যৌগের রূপান্তর বা Conversion of Organic Elements নামে পরিচিত। অনেক সময় দেখা যায়, প্রদত্ত উৎপাদ সরাসরি বিক্রিয়ক থেকে উৎপন্ন করা যায় না। তখন ধাপে ধাপে আরো অনেক যৌগ উৎপন্নের মাধ্যমে কাঙ্ক্ষিত উৎপাদ পাওয়া যায়। তবে হাজারো যৌগের মাঝে কোনটা ছেড়ে কোনটা তৈরি হবে, বিষয়টা আসলেই একটু জটিলই বটে। তবে হতাশ হয়ে পড়ার কোনো কারণ নেই কারণ সবচেয়ে জটিল জিনিসের সমাধান সবচেয়ে সহজ হয়। আর যৌগের রূপান্তর নামক ভয়ংকর এই চোরাবালি থেকে বেড়িয়ে আসার উপায় হলো- যৌগ রূপান্তরের ফ্লো চার্ট (Flow chart of Conversion Reactions) । এই চার্টের মাধ্যমে খুব সহজেই এক যৌগ থেকে অন্য যৌগ তৈরির ধাপগুলো জানা যায়। (Source: Self illustrated) উপরের ফ্লো-চার্টটি থেকে খুব সহজেই বুঝা যায় যে কোন যৌগ থেকে কোন যৌগ উৎপন্ন সম্ভব এবং তাদের অন্তর্বর্তীকালীন উৎপন্ন হওয়া যৌগগুলো। যদিও এই ছকের বাহিরেও প্রত্যেকটি যৌগ তৈরি করার অনেক নিয়ম আছে। তবে এই ফ্লো-চার্টের মাধ্যমে আমরা ভাল একটি ধারণা পাবো জৈব রসায়নের অনেক ছোটবড় যৌগ তৈরির পদ্ধতি সম্পর্কে। শর্টকাট: এক যৌগ থেকে অন্য যৌগ তৈরির উল্লেখিত ফ্লোচার্টটি তখনই পরিপূর্ণতা লাভ করবে যখন আমরা বিক্রিয়ার সম্পূর্ণ পদ্ধতি জানতে পারবো। চার্ট থেকে আমরা বিক্রিয়ায় অংশ নেয়া একটি বিক্রিয়কের তথ্য পেতে পারি। রাসায়নিক বিক্রিয়ায় অংশ নেয়া অপর বিক্রিয়কগুলো সম্বন্ধে জানতে পারবো নিম্নোক্ত তথ্যের মাধ্যমে, অ্যালকেন থেকে অ্যালকাইল হ্যালাইড ক্লোরিন যুক্ত করতে হবে (ক্লোরিনেশন)। অ্যালকিন থেকে অ্যালকাইল হ্যালাইড হ্যালোজেন যুক্ত করতে হবে। অ্যালকাইন থেকে বেনজিন (অ্যারোমেটিক যৌগ) পলিমারাইজেশন করতে হবে। অ্যালকাইল হ্যালাইড থেকে অ্যালকোহল পানি সংযোজন করতে হবে। অ্যালকাইল হ্যালাইড থেকে অ্যালকাইল সায়নাইড নাইট্রোজেন যুক্ত করতে হবে। অ্যালকাইল হ্যালাইড থেকে ইথার সিলভার অক্সাইড ( যুক্ত করতে হবে। অ্যালকাইল সায়নাইড থেকে অ্যামিন অ্যালকাইল সায়নাইড লঘু করতে হবে। অ্যালকোহল থেকে কার্বক্সিলিক এসিড অক্সিডেশন করতে হবে। প্রাইমারী অ্যালকোহল থেকে অ্যালডিহাইড কন্ট্রোল অক্সিডেশন করতে হবে। সেকেন্ডারি অ্যালকোহল থেকে কিটোন অক্সিডেশন করতে হবে। কার্বক্সিলিক এসিড থেকে এস্টার অ্যালকোহল যুক্ত করতে হবে। কার্বক্সিলিক এসিড থেকে অ্যামাইড অ্যামোনিয়া যুক্ত করতে হবে। কার্বক্সিলিক এসিড থেকে আসাইল হ্যালাইড ফসফরাস পেন্টাক্লোরাইড ( / ফরফরাস ট্রাইক্লোরাইড / থায়োনাইল ক্লোরাইড (যুক্ত করতে হবে। কার্বক্সিলিক এসিড থেকে অ্যানহাইড্রাইড দহন করতে হবে। ৫. উর্টজ বিক্রিয়া: জৈব রসায়ন পড়ার সময় কোনো না কোনো পর্যায়ে এসে উর্টজ বিক্রিয়া্র নাম আমরা শুনেই থাকবো। উর্টজ বিক্রিয়ায় দেখা যায়, অ্যালকাইল হ্যালাইড বা হ্যালোঅ্যালকেন ধাতব সোডিয়ামের সাথে বিক্রিয়া করে উচ্চতর অ্যালকেন গঠন করে। এই বিক্রিয়া লেখার সময় আমাদের অনেকেরই ভুল হয়। তাই এটি মনে রাখার একটি শর্টকাট হলো, (Source: Self illustrated) এখানে একটি মজার ব্যাপার হলো, উৎপাদে কতগুলো অ্যালকেন তৈরি হবে তা নির্ভর করে মূল অ্যালকাইল হ্যালাইডে অ্যালকেনের সংখ্যার উপর। উৎপাদে সর্বদা মূল অ্যালকাইল হ্যালাইডের অ্যালকেনের দ্বিগুণ অ্যালকেন উৎপন্ন হবে। এখানে অনুঘটক হিসেবে উপস্থিত থাকবে শুষ্ক ইথার। এই নিয়মে বিক্রিয়কের কেবল প্রথম অ্যালকাইল হ্যালাইড ছাড়া অন্য কোনো অ্যালকাইল হ্যালাইডের সংখ্যা গণ্য করা হয় না। উক্ত সাংকেতিক বিক্রিয়ায় মূল অ্যালকাইল হ্যালাইডে একটি মাত্র অ্যালকেন রয়েছে। সুতরাং উৎপাদে তার দ্বিগুণ অর্থাৎ ২টি অ্যালকেন উৎপন্ন হবে। উপরের ছবির বিক্রিয়ার ন্যায় উৎপাদে সর্বদা সোডিয়াম ধাতুর সাথে অ্যালকাইল হ্যালাইডের হ্যালোজেন যুক্ত হবে এবং বিক্রিয়কের দুই পার্শ্ববর্তী R উৎপাদে একত্রিত হবে। আধুনিক রসায়নে জৈব রসায়ন এমন একটি গুরুত্বপূর্ণ অধ্যায়, যা বিস্তৃতি লাভ করেই চলছে। একদিনেই জৈব রসায়নে পারদর্শিতা সম্ভব, এরকম ভাবা বোকামিই হবে। তবে নিয়মিত চর্চা আর উপরের নিয়মগুলোর মত সহজ করে পড়তে পারলে জৈব যৌগের কনসেপ্ট ছোট্ট শিশুদের ধারাপাত বইয়ের মতই মজাদার আর সহজ হয়ে যাবে। আর তখন রসায়নকে সত্যিকার অর্থেই রসে পরিপূর্ণ বলে মনে হবে।','H.S.C 1st','Chemistry','5','2020-12-31 15:41:42.335139','kamruzzaman leeon');
/*!40000 ALTER TABLE `main_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_slide`
--

DROP TABLE IF EXISTS `main_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_slide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_slide`
--

LOCK TABLES `main_slide` WRITE;
/*!40000 ALTER TABLE `main_slide` DISABLE KEYS */;
INSERT INTO `main_slide` VALUES (3,'Welcome to Student judge','Love of learning, love of learners, and the love of bringing the first two loves together.','slide/IMG_0365.JPG',1),(4,'Learning Today, Leading Tomorrow','One good teacher in a lifetime may sometimes change a delinquent into a solid citizen.','slide/70015507_1599078473559873_8476189856408535040_o.jpg',1),(5,'Famous Quota','We learned about honesty and integrity - that the truth matters... that you don\'t take shortcuts or play by your own set of rules... and success doesn\'t count unless you earn it fair and square','slide/hero-bg.jpg',1),(6,'Life is Easy. Why Do We Make It So Hard?','probably the best idea – is to do the hard things in life instead. This means making decisions to do the things that other people aren’t willing to do, or the things that you’ve always avoided doing.','slide/hero-bg1.jpg',1);
/*!40000 ALTER TABLE `main_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_video`
--

DROP TABLE IF EXISTS `main_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `video` varchar(200) NOT NULL,
  `Class` varchar(10) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `chapter` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_video_created_f0c54e9e` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_video`
--

LOCK TABLES `main_video` WRITE;
/*!40000 ALTER TABLE `main_video` DISABLE KEYS */;
INSERT INTO `main_video` VALUES (1,'পদার্থের গঠন | The structure of matter','https://youtu.be/wwc4X8RRiWM','7','Science','6','2020-12-31 15:02:34.576191','kamruzzaman leeon'),(2,'অণুজীব (Microbial World)','https://youtu.be/sN6a9gnnaOo','7','Science','1','2020-12-31 15:03:04.981166','kamruzzaman leeon'),(3,'সাধারণ সংখ্যা ও ভগ্নাংশ: বিভাজ্যতা','https://youtu.be/xn-C9-sIWFg','6','Math','1','2020-12-31 15:03:38.477047','kamruzzaman leeon'),(4,'চোখ || সংবেদি অঙ্গ','https://youtu.be/Ij9erS9giQQ','6','Science','6','2020-12-31 15:04:07.039058','kamruzzaman leeon'),(5,'বর্তনী ও চলবিদ্যুৎ | Circuit and Current Electricity','https://youtu.be/3E3cGR_RwU4','J.S.C','Science','9','2020-12-31 15:05:27.333914','kamruzzaman leeon'),(6,'Alo l আলো','https://youtu.be/YMKiydG6jPc','J.S.C','Science','11','2020-12-31 15:05:55.367127','kamruzzaman leeon'),(7,'Islam O Noytik Shikkha । ইসলাম ও নৈতিক শিক্ষা','https://youtu.be/wrl2cJD7AaM','2','Islam','2','2020-12-31 15:07:31.901878','kamruzzaman leeon'),(8,'ভৌত রাশি ও তার পরিমাপ','https://youtu.be/mh8FzPDV9cQ','S.S.C','Physics','1','2020-12-31 15:08:05.132999','kamruzzaman leeon'),(9,'Motion | গতি','https://youtu.be/wK2i4VkOegU','S.S.C','Physics','2','2020-12-31 15:08:59.285914','kamruzzaman leeon'),(10,'Bioenergetics [ জীবনীশক্তি ]','https://youtu.be/bslfAW4GJUI','S.S.C','Biology','4','2020-12-31 15:09:21.485649','kamruzzaman leeon'),(11,'Chemical Bond |  রাসায়নিক বন্ধন','https://youtu.be/BfV2kWcZgHY','S.S.C','Chemistry','5','2020-12-31 15:09:44.546207','kamruzzaman leeon');
/*!40000 ALTER TABLE `main_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-03 23:15:44
