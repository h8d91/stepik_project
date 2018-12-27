-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: box_django
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add answer',7,'add_answer'),(20,'Can change answer',7,'change_answer'),(21,'Can delete answer',7,'delete_answer'),(22,'Can add question',8,'add_question'),(23,'Can change question',8,'change_question'),(24,'Can delete question',8,'delete_question');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$PqMwNavvCkzP$s/T+Gsv6XEqAFr2yt6z1WQB5QJ9SIEeFuQWZf5FkF70=','2018-12-27 12:04:20.413162',1,'box','','','ovsiannikov_alex@mail.ru',1,1,'2018-12-12 18:59:59.634978'),(2,'pbkdf2_sha256$30000$ynnZ2eWP6F2l$DLm8m4kZhl5dVjpWERfV4+6P0ShTu5hX/d+tZAVkKLI=',NULL,0,'TestUser1','','','',0,1,'2018-12-18 16:50:56.227515'),(3,'pbkdf2_sha256$30000$194ZDsZXfu82$lum17sVWHij/Kxe/bec4/lEyYEKmIFnzJSOTlFdHijY=',NULL,0,'TestUser2','','','',0,1,'2018-12-18 16:51:32.102547'),(4,'pbkdf2_sha256$30000$4thLK1JSaz7h$wkZWJX46e6roSClO4syZwlLJWrDcDXaQpNStTK9aJyI=',NULL,0,'TestUser3','','','',0,1,'2018-12-18 16:51:56.022283'),(5,'pbkdf2_sha256$30000$b1CvDXyMOV9z$WxIHMmQepSahNycUWi9BtFXhCHfypAja9MU3Dkg6gCo=',NULL,0,'TestUser4','','','',0,1,'2018-12-18 16:52:23.109810');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-18 16:50:56.256461','2','TestUser1',1,'[{\"added\": {}}]',3,1),(2,'2018-12-18 16:51:32.130662','3','TestUser2',1,'[{\"added\": {}}]',3,1),(3,'2018-12-18 16:51:56.049613','4','TestUser3',1,'[{\"added\": {}}]',3,1),(4,'2018-12-18 16:52:23.139753','5','TestUser4',1,'[{\"added\": {}}]',3,1),(5,'2018-12-18 17:17:24.663027','1','Title 1',3,'',8,1),(6,'2018-12-18 17:18:36.716895','2','Title 0',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(7,'2018-12-18 17:18:47.039216','3','Title 1',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(8,'2018-12-18 17:19:04.160378','4','Title 2',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(9,'2018-12-18 17:19:28.805206','5','Title 3',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(10,'2018-12-18 17:19:46.754126','6','Title 4',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(11,'2018-12-18 17:19:57.148079','7','Title 5',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(12,'2018-12-18 17:20:14.288529','51','Title 49',3,'',8,1),(13,'2018-12-18 17:20:14.290614','50','Title 48',3,'',8,1),(14,'2018-12-18 17:20:14.292001','49','Title 47',3,'',8,1),(15,'2018-12-18 17:20:14.294799','48','Title 46',3,'',8,1),(16,'2018-12-18 17:20:14.296575','47','Title 45',3,'',8,1),(17,'2018-12-18 17:20:14.297809','46','Title 44',3,'',8,1),(18,'2018-12-18 17:20:14.299623','45','Title 43',3,'',8,1),(19,'2018-12-18 17:20:14.301353','44','Title 42',3,'',8,1),(20,'2018-12-18 17:20:31.369645','43','Title 41',3,'',8,1),(21,'2018-12-18 17:20:31.372507','42','Title 40',3,'',8,1),(22,'2018-12-18 17:20:31.373835','41','Title 39',3,'',8,1),(23,'2018-12-18 17:20:31.374999','40','Title 38',3,'',8,1),(24,'2018-12-18 17:20:31.376873','39','Title 37',3,'',8,1),(25,'2018-12-18 17:20:31.378227','38','Title 36',3,'',8,1),(26,'2018-12-18 17:20:31.379459','37','Title 35',3,'',8,1),(27,'2018-12-18 17:20:31.381150','36','Title 34',3,'',8,1),(28,'2018-12-18 17:20:31.382279','35','Title 33',3,'',8,1),(29,'2018-12-18 17:20:31.383423','34','Title 32',3,'',8,1),(30,'2018-12-18 17:20:50.905486','8','Title 6',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(31,'2018-12-18 17:21:05.884855','9','Title 7',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(32,'2018-12-18 17:21:15.964920','10','Title 8',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(33,'2018-12-18 17:21:30.528405','11','Title 9',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(34,'2018-12-18 17:21:39.575278','12','Title 10',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(35,'2018-12-18 17:21:50.492335','13','Title 11',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(36,'2018-12-18 17:22:00.906315','14','Title 12',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(37,'2018-12-18 17:22:13.423834','15','Title 13',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(38,'2018-12-18 17:22:21.790700','16','Title 14',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(39,'2018-12-18 17:22:35.586468','17','Title 15',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(40,'2018-12-18 17:22:45.037037','18','Title 16',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(41,'2018-12-18 17:22:54.990196','19','Title 17',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(42,'2018-12-18 17:23:05.788958','19','Title 17',2,'[{\"changed\": {\"fields\": [\"rating\"]}}]',8,1),(43,'2018-12-18 17:23:17.377742','20','Title 18',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(44,'2018-12-18 17:23:32.322164','21','Title 19',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(45,'2018-12-18 17:23:39.233564','22','Title 20',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(46,'2018-12-18 17:23:45.203751','23','Title 21',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(47,'2018-12-18 17:23:50.899216','24','Title 22',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(48,'2018-12-18 17:24:00.134743','25','Title 23',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(49,'2018-12-18 17:24:09.686497','26','Title 24',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(50,'2018-12-18 17:24:17.893275','27','Title 25',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(51,'2018-12-18 17:24:23.459395','29','Title 27',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(52,'2018-12-18 17:24:29.279947','30','Title 28',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(53,'2018-12-18 17:24:38.161498','31','Title 29',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(54,'2018-12-18 17:24:46.765539','32','Title 30',2,'[{\"changed\": {\"fields\": [\"rating\", \"author\"]}}]',8,1),(55,'2018-12-18 17:24:53.214506','33','Title 31',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(56,'2018-12-18 17:37:03.892579','28','Title 26',2,'[{\"changed\": {\"fields\": [\"author\"]}}]',8,1),(57,'2018-12-18 17:43:38.242794','1','Answer 100',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(58,'2018-12-18 17:43:47.525777','2','Answer 101',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(59,'2018-12-18 17:43:54.511505','3','Answer 102',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(60,'2018-12-18 17:44:02.012761','4','Answer 103',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(61,'2018-12-18 17:44:09.387828','5','Answer 104',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(62,'2018-12-18 17:44:16.202540','6','Answer 105',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(63,'2018-12-18 17:44:24.795130','7','Answer 106',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(64,'2018-12-18 17:44:30.571057','8','Answer 107',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(65,'2018-12-18 17:44:36.150975','9','Answer 108',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(66,'2018-12-18 17:44:50.383297','10','Answer 109',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(67,'2018-12-18 17:44:57.992642','11','Answer 110',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(68,'2018-12-18 17:45:03.616684','13','Answer 112',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(69,'2018-12-18 17:45:09.771950','14','Answer 113',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(70,'2018-12-18 17:45:15.446551','12','Answer 111',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(71,'2018-12-18 17:45:25.242945','15','Answer 114',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(72,'2018-12-18 17:45:36.452701','16','Answer 115',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(73,'2018-12-18 17:45:41.725306','17','Answer 116',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(74,'2018-12-18 17:45:47.149434','18','Answer 117',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(75,'2018-12-18 17:45:56.507690','19','Answer 118',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(76,'2018-12-18 17:46:05.160709','20','Answer 119',2,'[{\"changed\": {\"fields\": [\"question\", \"author\"]}}]',7,1),(77,'2018-12-27 13:36:08.227859','34','Test 666',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'qa','answer'),(8,'qa','question'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-12 18:17:54.600457'),(2,'auth','0001_initial','2018-12-12 18:17:54.777556'),(3,'admin','0001_initial','2018-12-12 18:17:54.829911'),(4,'admin','0002_logentry_remove_auto_add','2018-12-12 18:17:54.851056'),(5,'contenttypes','0002_remove_content_type_name','2018-12-12 18:17:54.908781'),(6,'auth','0002_alter_permission_name_max_length','2018-12-12 18:17:54.938023'),(7,'auth','0003_alter_user_email_max_length','2018-12-12 18:17:54.951673'),(8,'auth','0004_alter_user_username_opts','2018-12-12 18:17:54.961085'),(9,'auth','0005_alter_user_last_login_null','2018-12-12 18:17:54.987899'),(10,'auth','0006_require_contenttypes_0002','2018-12-12 18:17:54.991149'),(11,'auth','0007_alter_validators_add_error_messages','2018-12-12 18:17:55.004550'),(12,'auth','0008_alter_user_username_max_length','2018-12-12 18:17:55.018458'),(13,'qa','0001_initial','2018-12-12 18:17:55.136619'),(14,'sessions','0001_initial','2018-12-12 18:17:55.255481');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2im6gh34cu32bwghe5zuhqhu5t8pqajs','OWJhOGExZGE4ZGYwY2Q3OTVjYjMxMzA0NzlkZmUxNTU3N2RmM2ZkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNTQyOTQ5MTBmMGQxNDExZjFjNTVlNDA1NDFjMWZlNjU3N2QwYmZkIn0=','2019-01-10 12:04:20.475902'),('mxf8fp49qb18du0a2j24sfgq7boywz87','OWJhOGExZGE4ZGYwY2Q3OTVjYjMxMzA0NzlkZmUxNTU3N2RmM2ZkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNTQyOTQ5MTBmMGQxNDExZjFjNTVlNDA1NDFjMWZlNjU3N2QwYmZkIn0=','2018-12-26 19:00:20.325357');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_answer`
--

DROP TABLE IF EXISTS `qa_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `question_id` int(11),
  PRIMARY KEY (`id`),
  KEY `qa_answer_author_id_fdca825d_fk_auth_user_id` (`author_id`),
  KEY `qa_answer_question_id_afdc507a_fk_qa_question_id` (`question_id`),
  CONSTRAINT `qa_answer_author_id_fdca825d_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `qa_answer_question_id_afdc507a_fk_qa_question_id` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_answer`
--

LOCK TABLES `qa_answer` WRITE;
/*!40000 ALTER TABLE `qa_answer` DISABLE KEYS */;
INSERT INTO `qa_answer` VALUES (1,'Answer 100','2018-12-18 17:42:57.661553',1,2),(2,'Answer 101','2018-12-18 17:42:57.665274',2,2),(3,'Answer 102','2018-12-18 17:42:57.670255',4,2),(4,'Answer 103','2018-12-18 17:42:57.671728',1,3),(5,'Answer 104','2018-12-18 17:42:57.673474',1,4),(6,'Answer 105','2018-12-18 17:42:57.674776',1,5),(7,'Answer 106','2018-12-18 17:42:57.675793',5,5),(8,'Answer 107','2018-12-18 17:42:57.677203',1,8),(9,'Answer 108','2018-12-18 17:42:57.684218',3,7),(10,'Answer 109','2018-12-18 17:42:57.686739',3,7),(11,'Answer 110','2018-12-18 17:42:57.687962',5,4),(12,'Answer 111','2018-12-18 17:42:57.689472',1,9),(13,'Answer 112','2018-12-18 17:42:57.690574',3,6),(14,'Answer 113','2018-12-18 17:42:57.693221',1,11),(15,'Answer 114','2018-12-18 17:42:57.694517',1,14),(16,'Answer 115','2018-12-18 17:42:57.695727',2,8),(17,'Answer 116','2018-12-18 17:42:57.697267',3,5),(18,'Answer 117','2018-12-18 17:42:57.698368',3,6),(19,'Answer 118','2018-12-18 17:42:57.699393',2,8),(20,'Answer 119','2018-12-18 17:42:57.701022',4,7);
/*!40000 ALTER TABLE `qa_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_question`
--

DROP TABLE IF EXISTS `qa_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `rating` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qa_question_author_id_3665c779_fk_auth_user_id` (`author_id`),
  CONSTRAINT `qa_question_author_id_3665c779_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_question`
--

LOCK TABLES `qa_question` WRITE;
/*!40000 ALTER TABLE `qa_question` DISABLE KEYS */;
INSERT INTO `qa_question` VALUES (2,'Title 0','Text 0','2018-12-18 17:16:16.817463',0,2),(3,'Title 1','Text 1','2018-12-18 17:16:16.825038',0,2),(4,'Title 2','Text 2','2018-12-18 17:16:16.832676',0,2),(5,'Title 3','Text 3','2018-12-18 17:16:16.835168',0,2),(6,'Title 4','Text 4','2018-12-18 17:16:16.836954',0,3),(7,'Title 5','Text 5','2018-12-18 17:16:16.839463',0,3),(8,'Title 6','Text 6','2018-12-18 17:16:16.841936',2,1),(9,'Title 7','Text 7','2018-12-18 17:16:16.843275',0,5),(10,'Title 8','Text 8','2018-12-18 17:16:16.845117',0,4),(11,'Title 9','Text 9','2018-12-18 17:16:16.846418',1,5),(12,'Title 10','Text 10','2018-12-18 17:16:16.847556',3,4),(13,'Title 11','Text 11','2018-12-18 17:16:16.849159',0,3),(14,'Title 12','Text 12','2018-12-18 17:16:16.850898',0,3),(15,'Title 13','Text 13','2018-12-18 17:16:16.852858',2,5),(16,'Title 14','Text 14','2018-12-18 17:16:16.853886',0,4),(17,'Title 15','Text 15','2018-12-18 17:16:16.854803',0,3),(18,'Title 16','Text 16','2018-12-18 17:16:16.855829',0,4),(19,'Title 17','Text 17','2018-12-18 17:16:16.857239',2,3),(20,'Title 18','Text 18','2018-12-18 17:16:16.858163',3,1),(21,'Title 19','Text 19','2018-12-18 17:16:16.859070',3,1),(22,'Title 20','Text 20','2018-12-18 17:16:16.860071',0,1),(23,'Title 21','Text 21','2018-12-18 17:16:16.861352',0,5),(24,'Title 22','Text 22','2018-12-18 17:16:16.862388',0,2),(25,'Title 23','Text 23','2018-12-18 17:16:16.863287',0,3),(26,'Title 24','Text 24','2018-12-18 17:16:16.864517',0,2),(27,'Title 25','Text 25','2018-12-18 17:16:16.865449',2,2),(28,'Title 26','Text 26','2018-12-18 17:16:16.866394',0,2),(29,'Title 27','Text 27','2018-12-18 17:16:16.867287',0,2),(30,'Title 28','Text 28','2018-12-18 17:16:16.868554',0,4),(31,'Title 29','Text 29','2018-12-18 17:16:16.869649',1,3),(32,'Title 30','Text 30','2018-12-18 17:16:16.870606',3,1),(33,'Title 31','Text 31','2018-12-18 17:16:16.871571',0,2),(34,'Test 666','Test text 666','2018-12-27 13:36:08.151744',666,1);
/*!40000 ALTER TABLE `qa_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_question_likes`
--

DROP TABLE IF EXISTS `qa_question_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_question_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qa_question_likes_question_id_dfaf931d_uniq` (`question_id`,`user_id`),
  KEY `qa_question_likes_user_id_69852d68_fk_auth_user_id` (`user_id`),
  CONSTRAINT `qa_question_likes_question_id_f4460cdb_fk_qa_question_id` FOREIGN KEY (`question_id`) REFERENCES `qa_question` (`id`),
  CONSTRAINT `qa_question_likes_user_id_69852d68_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_question_likes`
--

LOCK TABLES `qa_question_likes` WRITE;
/*!40000 ALTER TABLE `qa_question_likes` DISABLE KEYS */;
INSERT INTO `qa_question_likes` VALUES (1,2,3),(2,3,3),(3,4,2),(4,5,5),(5,6,1),(6,7,1),(7,8,5),(8,9,1),(9,10,1),(10,11,1),(11,12,1),(12,13,1),(13,14,1),(14,15,1),(15,16,1),(16,17,1),(17,17,2),(18,17,3),(19,18,1),(20,18,2),(21,19,1),(22,19,5),(23,20,3),(24,20,4),(25,20,5),(26,21,1),(27,21,2),(28,21,3),(29,22,4),(30,23,4),(31,24,4),(32,25,2),(33,26,5),(34,27,1),(35,27,2),(42,28,1),(36,29,3),(37,30,4),(38,31,5),(39,32,4),(40,32,5),(41,33,4),(43,34,1),(44,34,2),(45,34,3),(46,34,4),(47,34,5);
/*!40000 ALTER TABLE `qa_question_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-27 20:29:26
