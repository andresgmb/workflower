-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: workflower
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `account_profile`
--

DROP TABLE IF EXISTS `account_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `middlename` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) NOT NULL,
  `second_lastname` varchar(200) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `rut` varchar(20) DEFAULT NULL,
  `serie` varchar(120) DEFAULT NULL,
  `rut_verified` tinyint(1) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `cellphone` varchar(50) DEFAULT NULL,
  `sms_code` varchar(10) DEFAULT NULL,
  `cellphone_verified` tinyint(1) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `rut` (`rut`),
  CONSTRAINT `account_profile_user_id_bdd52018_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_profile`
--

LOCK TABLES `account_profile` WRITE;
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
INSERT INTO `account_profile` VALUES (1,'Aaron','Andres','Dominguez','Arismendi','m','1988-08-11','','',0,'','950850103','',0,'','2017-02-12 19:23:25.992392','2017-02-12 19:23:25.992561',1),(2,'pablo','','perez','','m',NULL,'123123123','',0,'','','',0,'','2017-02-12 20:53:53.907484','2017-02-12 20:53:53.907512',2);
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Type',7,'add_workflowtypes'),(20,'Can change Type',7,'change_workflowtypes'),(21,'Can delete Type',7,'delete_workflowtypes'),(22,'Can add Pregunta',8,'add_workflowquestion'),(23,'Can change Pregunta',8,'change_workflowquestion'),(24,'Can delete Pregunta',8,'delete_workflowquestion'),(25,'Can add Workflow',9,'add_workflow'),(26,'Can change Workflow',9,'change_workflow'),(27,'Can delete Workflow',9,'delete_workflow'),(28,'Can add feedback',10,'add_feedback'),(29,'Can change feedback',10,'change_feedback'),(30,'Can delete feedback',10,'delete_feedback'),(31,'Can add feedback',11,'add_feedbackdetails'),(32,'Can change feedback',11,'change_feedbackdetails'),(33,'Can delete feedback',11,'delete_feedbackdetails'),(34,'Can add Profile',12,'add_profile'),(35,'Can change Profile',12,'change_profile'),(36,'Can delete Profile',12,'delete_profile');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$3GleOUWjdND9$8epFHnuycn241W4cvfvBkgfkO0mP3WjZMeyzBzVz4kI=','2017-02-12 23:32:56.471550',1,'test','','','test@test.com',1,1,'2017-02-10 18:10:14.806859'),(2,'pbkdf2_sha256$24000$lIjyrDExaR2P$Uhj27NXVXGnDKf3XCQSH02Kq2zimOxtKFtU/dBQzR3Y=','2017-02-12 19:42:33.000000',1,'aaron@workflow.cl','Pablo','','aaron@workflow.cl',1,1,'2017-02-12 19:42:21.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-02-10 18:22:29.123522','1','Llamar a alguien',1,'Added.',8,1),(2,'2017-02-10 18:22:50.365464','1','Llamadas a chopper',1,'Added.',7,1),(3,'2017-02-10 18:23:27.496949','1','Llamadas',2,'Changed name.',7,1),(4,'2017-02-10 18:23:46.576176','1','Gestion de llamadas',1,'Added.',9,1),(5,'2017-02-10 18:36:21.073953','2','Gestion de llamadas',1,'Added.',10,1),(6,'2017-02-10 18:38:23.434704','3','Gestion de llamadas',1,'Added.',11,1),(7,'2017-02-12 18:23:44.561266','2','Gestion de llamadas',2,'Added detail \"Gestion de llamadas\".',10,1),(8,'2017-02-12 19:23:25.993812','1','Aaron Dominguez (950850103)',1,'Added.',12,1),(9,'2017-02-12 19:43:28.038013','2','aaron@workflow.cl',1,'Added.',4,1),(10,'2017-02-12 20:04:05.317021','3','Gestion de llamadas',2,'Changed user_from.',11,1),(11,'2017-02-12 20:06:10.945670','2','aaron@workflow.cl',2,'Changed first_name.',4,1),(12,'2017-02-12 20:27:22.827474','2','aaron@workflow.cl',2,'No fields changed.',4,1),(13,'2017-02-12 20:27:27.442954','2','aaron@workflow.cl',2,'Changed password.',4,1),(14,'2017-02-12 20:53:53.908984','2','aaron@workflow.cl',2,'Added Profile \"pablo perez\".',4,1),(15,'2017-02-12 21:11:38.053989','3','Gestion de llamadas',2,'Changed status.',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'account','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'feedback','feedback'),(11,'feedback','feedbackdetails'),(6,'sessions','session'),(9,'workflow','workflow'),(8,'workflow','workflowquestion'),(7,'workflow','workflowtypes');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-02-10 11:38:35.258721'),(2,'auth','0001_initial','2017-02-10 11:38:36.068742'),(3,'admin','0001_initial','2017-02-10 11:38:36.224832'),(4,'admin','0002_logentry_remove_auto_add','2017-02-10 11:38:36.246397'),(5,'contenttypes','0002_remove_content_type_name','2017-02-10 11:38:36.332874'),(6,'auth','0002_alter_permission_name_max_length','2017-02-10 11:38:36.356461'),(7,'auth','0003_alter_user_email_max_length','2017-02-10 11:38:36.384008'),(8,'auth','0004_alter_user_username_opts','2017-02-10 11:38:36.394990'),(9,'auth','0005_alter_user_last_login_null','2017-02-10 11:38:36.506933'),(10,'auth','0006_require_contenttypes_0002','2017-02-10 11:38:36.510310'),(11,'auth','0007_alter_validators_add_error_messages','2017-02-10 11:38:36.524994'),(12,'sessions','0001_initial','2017-02-10 11:38:36.577681'),(13,'workflow','0001_initial','2017-02-10 12:43:03.420632'),(14,'feedback','0001_initial','2017-02-10 15:34:38.180077'),(15,'feedback','0002_auto_20170210_1835','2017-02-10 18:35:59.453909'),(16,'workflow','0002_auto_20170210_1835','2017-02-10 18:35:59.504008'),(17,'account','0001_initial','2017-02-12 19:13:47.312542'),(18,'feedback','0003_auto_20170212_1915','2017-02-12 19:15:21.107075'),(19,'account','0002_auto_20170212_2128','2017-02-12 21:28:57.242954'),(20,'feedback','0004_auto_20170212_2128','2017-02-12 21:28:57.860321');
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
INSERT INTO `django_session` VALUES ('04fvk92rvckzehj43qcxiap6vzdengip','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 19:16:35.011227'),('1bdz68sqbtp7r7gr6jumof8opx068g87','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 19:39:17.292782'),('8yfm39c5fmn15avq44559oapsbl0f6ne','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 20:19:53.514281'),('93okvhtzmfk6c7egs8eyamib4tecbdt1','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 21:09:09.090100'),('9xo5ltra8utsihsry5wdraz2lqgcqukv','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 20:44:25.092780'),('cge1a2ukjg2yq7nimmj4b406cm0x4fh7','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 21:41:49.539757'),('et3puy0o8uva0q2leevxlwzmrmne3fbh','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 18:17:36.793081'),('fcifuvz7m4lz3eujk4er761esh0lcgwg','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 19:57:47.845786'),('iwole3hc8ylo0n7uskhzfkhmomguassg','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-24 18:11:14.194469'),('zl1nt62v64buiz6a65fvyde1np9bji6g','YmRiZThmMmMwZWQzYmI1ZmI3YzU3Zjc2YjNiYzc5NDdlNDExYjg0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzOTA3MmZiYjIzZWI4MjYxNmFhY2UxOWQwZmJjZDUyYTExNzNjZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-26 23:32:56.479727');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_feedback`
--

DROP TABLE IF EXISTS `feedback_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_feedback_workflow_id_e23aff70_fk_workflow_workflow_id` (`workflow_id`),
  CONSTRAINT `feedback_feedback_workflow_id_e23aff70_fk_workflow_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_workflow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_feedback`
--

LOCK TABLES `feedback_feedback` WRITE;
/*!40000 ALTER TABLE `feedback_feedback` DISABLE KEYS */;
INSERT INTO `feedback_feedback` VALUES (2,1,'2017-02-10 18:36:21.073161','2017-02-12 18:23:44.553032',1);
/*!40000 ALTER TABLE `feedback_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_feedbackdetails`
--

DROP TABLE IF EXISTS `feedback_feedbackdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_feedbackdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `user_from_id` int(11) NOT NULL,
  `user_to_id` int(11) NOT NULL,
  `comment_from` longtext,
  `comment_to` longtext,
  PRIMARY KEY (`id`),
  KEY `feedback_feedbackde_feedback_id_89b6a9a5_fk_feedback_feedback_id` (`feedback_id`),
  KEY `feedback_feedbackdetails_user_from_id_8b86b247_fk_auth_user_id` (`user_from_id`),
  KEY `feedback_feedbackdetails_user_to_id_181022ab_fk_auth_user_id` (`user_to_id`),
  CONSTRAINT `feedback_feedbackde_feedback_id_89b6a9a5_fk_feedback_feedback_id` FOREIGN KEY (`feedback_id`) REFERENCES `feedback_feedback` (`id`),
  CONSTRAINT `feedback_feedbackdetails_user_to_id_181022ab_fk_auth_user_id` FOREIGN KEY (`user_to_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_feedbackdetails`
--

LOCK TABLES `feedback_feedbackdetails` WRITE;
/*!40000 ALTER TABLE `feedback_feedbackdetails` DISABLE KEYS */;
INSERT INTO `feedback_feedbackdetails` VALUES (3,4,'2017-02-10 18:38:23.433354','2017-02-12 21:11:38.052215',2,2,1,NULL,NULL),(4,3,'2017-02-12 18:23:44.555491','2017-02-12 18:23:44.555520',2,1,1,NULL,NULL);
/*!40000 ALTER TABLE `feedback_feedbackdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflow`
--

DROP TABLE IF EXISTS `workflow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `detail` longtext,
  `active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `question_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_workflow_7aa0f6ee` (`question_id`),
  KEY `workflow_workflow_94757cae` (`type_id`),
  CONSTRAINT `workflow_wo_question_id_04b5f3dd_fk_workflow_workflowquestion_id` FOREIGN KEY (`question_id`) REFERENCES `workflow_workflowquestion` (`id`),
  CONSTRAINT `workflow_workflow_type_id_4ee6ee76_fk_workflow_workflowtypes_id` FOREIGN KEY (`type_id`) REFERENCES `workflow_workflowtypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflow`
--

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
INSERT INTO `workflow_workflow` VALUES (1,'Gestion de llamadas','llamamos para ver si todo esta en orden',1,'2017-02-10 18:23:46.575705','2017-02-10 18:23:46.575735',1,1);
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflowquestion`
--

DROP TABLE IF EXISTS `workflow_workflowquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workflowquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflowquestion`
--

LOCK TABLES `workflow_workflowquestion` WRITE;
/*!40000 ALTER TABLE `workflow_workflowquestion` DISABLE KEYS */;
INSERT INTO `workflow_workflowquestion` VALUES (1,'Llamar a alguien',1,'2017-02-10 18:22:29.123091','2017-02-10 18:22:29.123129');
/*!40000 ALTER TABLE `workflow_workflowquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflowtypes`
--

DROP TABLE IF EXISTS `workflow_workflowtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workflowtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `detail` longtext,
  `active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflowtypes`
--

LOCK TABLES `workflow_workflowtypes` WRITE;
/*!40000 ALTER TABLE `workflow_workflowtypes` DISABLE KEYS */;
INSERT INTO `workflow_workflowtypes` VALUES (1,'Llamadas','llamo para ver si esta bien',1,'2017-02-10 18:22:50.364939','2017-02-10 18:23:27.496202');
/*!40000 ALTER TABLE `workflow_workflowtypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-13  8:26:43
