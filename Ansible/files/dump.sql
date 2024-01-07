-- MariaDB dump 10.19  Distrib 10.5.16-MariaDB, for Linux (x86_64)
--
-- Host: ansible1.example.com    Database: wikidb
-- ------------------------------------------------------
-- Server version	10.5.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `actor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_user` int(10) unsigned DEFAULT NULL,
  `actor_name` varbinary(255) NOT NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE KEY `actor_name` (`actor_name`),
  UNIQUE KEY `actor_user` (`actor_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,1,'Admin'),(2,2,'MediaWiki default');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT 0,
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_comment_id` bigint(20) unsigned NOT NULL,
  `ar_actor` bigint(20) unsigned NOT NULL,
  `ar_timestamp` binary(14) NOT NULL,
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT 0,
  `ar_rev_id` int(10) unsigned NOT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ar_id`),
  UNIQUE KEY `ar_revid_uniq` (`ar_rev_id`),
  KEY `ar_name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `ar_actor_timestamp` (`ar_actor`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_passwords`
--

DROP TABLE IF EXISTS `bot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_passwords` (
  `bp_user` int(10) unsigned NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_passwords`
--

LOCK TABLES `bot_passwords` WRITE;
/*!40000 ALTER TABLE `bot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT 0,
  `cat_subcats` int(11) NOT NULL DEFAULT 0,
  `cat_files` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT 0,
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  PRIMARY KEY (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ct_rc_id` int(10) unsigned DEFAULT NULL,
  `ct_log_id` int(10) unsigned DEFAULT NULL,
  `ct_rev_id` int(10) unsigned DEFAULT NULL,
  `ct_params` blob DEFAULT NULL,
  `ct_tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ct_id`),
  UNIQUE KEY `ct_rc_tag_id` (`ct_rc_id`,`ct_tag_id`),
  UNIQUE KEY `ct_log_tag_id` (`ct_log_id`,`ct_tag_id`),
  UNIQUE KEY `ct_rev_tag_id` (`ct_rev_id`,`ct_tag_id`),
  KEY `ct_tag_id_id` (`ct_tag_id`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag_def`
--

DROP TABLE IF EXISTS `change_tag_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag_def` (
  `ctd_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctd_name` varbinary(255) NOT NULL,
  `ctd_user_defined` tinyint(1) NOT NULL,
  `ctd_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ctd_id`),
  UNIQUE KEY `ctd_name` (`ctd_name`),
  KEY `ctd_count` (`ctd_count`),
  KEY `ctd_user_defined` (`ctd_user_defined`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag_def`
--

LOCK TABLES `change_tag_def` WRITE;
/*!40000 ALTER TABLE `change_tag_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_hash` int(11) NOT NULL,
  `comment_text` blob NOT NULL,
  `comment_data` blob DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_hash` (`comment_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,0,'',NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `content_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_size` int(10) unsigned NOT NULL,
  `content_sha1` varbinary(32) NOT NULL,
  `content_model` smallint(5) unsigned NOT NULL,
  `content_address` varbinary(255) NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,755,'22vz5zlxa2zctewimaum2bf1due8hkl',1,'tt:1');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_models`
--

DROP TABLE IF EXISTS `content_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_name` (`model_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_models`
--

LOCK TABLES `content_models` WRITE;
/*!40000 ALTER TABLE `content_models` DISABLE KEYS */;
INSERT INTO `content_models` VALUES (1,'wikitext');
/*!40000 ALTER TABLE `content_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT 0,
  `el_to_domain_index` varbinary(255) NOT NULL DEFAULT '',
  `el_to_path` blob DEFAULT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`),
  KEY `el_to_domain_index_to_path` (`el_to_domain_index`,`el_to_path`(60))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT NULL,
  `fa_deleted_reason_id` bigint(20) unsigned NOT NULL,
  `fa_size` bigint(20) unsigned DEFAULT 0,
  `fa_width` int(11) DEFAULT 0,
  `fa_height` int(11) DEFAULT 0,
  `fa_metadata` mediumblob DEFAULT NULL,
  `fa_bits` int(11) DEFAULT 0,
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description_id` bigint(20) unsigned NOT NULL,
  `fa_actor` bigint(20) unsigned NOT NULL,
  `fa_timestamp` binary(14) DEFAULT NULL,
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_actor_timestamp` (`fa_actor`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `img_width` int(11) NOT NULL DEFAULT 0,
  `img_height` int(11) NOT NULL DEFAULT 0,
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT 0,
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description_id` bigint(20) unsigned NOT NULL,
  `img_actor` bigint(20) unsigned NOT NULL,
  `img_timestamp` binary(14) NOT NULL,
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_actor_timestamp` (`img_actor`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT 0,
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  `il_from_namespace` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES ('acronym','https://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),('advogato','http://www.advogato.org/$1','','',0,0),('arxiv','https://www.arxiv.org/abs/$1','','',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),('cache','https://www.google.com/search?q=cache:$1','','',0,0),('commons','https://commons.wikimedia.org/wiki/$1','https://commons.wikimedia.org/w/api.php','',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),('doi','https://dx.doi.org/$1','','',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/$1','http://drumcorpswiki.com/api.php','',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),('elibre','http://enciclopedia.us.es/index.php/$1','http://enciclopedia.us.es/api.php','',0,0),('emacswiki','https://www.emacswiki.org/emacs/$1','','',0,0),('foldoc','https://foldoc.org/?$1','','',0,0),('foxwiki','https://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),('freebsdman','https://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1','','',0,0),('google','https://www.google.com/search?q=$1','','',0,0),('googlegroups','https://groups.google.com/groups?q=$1','','',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1','','',0,0),('hrwiki','http://www.hrwiki.org/wiki/$1','http://www.hrwiki.org/w/api.php','',0,0),('imdb','http://www.imdb.com/find?q=$1&tt=on','','',0,0),('kmwiki','https://kmwiki.wikispaces.com/$1','','',0,0),('linuxwiki','http://linuxwiki.de/$1','','',0,0),('lojban','https://mw.lojban.org/papri/$1','','',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1','','',0,0),('meatball','http://meatballwiki.org/wiki/$1','','',0,0),('mediawikiwiki','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('memoryalpha','http://en.memory-alpha.org/wiki/$1','http://en.memory-alpha.org/api.php','',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1','','',0,0),('metawikimedia','https://meta.wikimedia.org/wiki/$1','https://meta.wikimedia.org/w/api.php','',0,0),('mozillawiki','https://wiki.mozilla.org/$1','https://wiki.mozilla.org/api.php','',0,0),('mw','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('oeis','https://oeis.org/$1','','',0,0),('openwiki','http://openwiki.com/ow.asp?$1','','',0,0),('pmid','https://www.ncbi.nlm.nih.gov/pubmed/$1?dopt=Abstract','','',0,0),('pythoninfo','https://wiki.python.org/moin/$1','','',0,0),('rfc','https://tools.ietf.org/html/rfc$1','','',0,0),('s23wiki','http://s23.org/wiki/$1','http://s23.org/w/api.php','',0,0),('seattlewireless','http://seattlewireless.net/$1','','',0,0),('senseislibrary','https://senseis.xmp.net/?$1','','',0,0),('shoutwiki','http://www.shoutwiki.com/wiki/$1','http://www.shoutwiki.com/w/api.php','',0,0),('squeak','http://wiki.squeak.org/squeak/$1','','',0,0),('theopedia','https://www.theopedia.com/$1','','',0,0),('tmbw','http://www.tmbw.net/wiki/$1','http://tmbw.net/wiki/api.php','',0,0),('tmnet','http://www.technomanifestos.net/?$1','','',0,0),('twiki','http://twiki.org/cgi-bin/view/$1','','',0,0),('uncyclopedia','https://en.uncyclopedia.co/wiki/$1','https://en.uncyclopedia.co/w/api.php','',0,0),('unreal','https://wiki.beyondunreal.com/$1','https://wiki.beyondunreal.com/w/api.php','',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),('wiki','http://c2.com/cgi/wiki?$1','','',0,0),('wikia','http://www.wikia.com/wiki/$1','','',0,0),('wikibooks','https://en.wikibooks.org/wiki/$1','https://en.wikibooks.org/w/api.php','',0,0),('wikidata','https://www.wikidata.org/wiki/$1','https://www.wikidata.org/w/api.php','',0,0),('wikif1','http://www.wikif1.org/$1','','',0,0),('wikihow','https://www.wikihow.com/$1','https://www.wikihow.com/api.php','',0,0),('wikimedia','https://foundation.wikimedia.org/wiki/$1','https://foundation.wikimedia.org/w/api.php','',0,0),('wikinews','https://en.wikinews.org/wiki/$1','https://en.wikinews.org/w/api.php','',0,0),('wikinfo','http://wikinfo.co/English/index.php/$1','','',0,0),('wikipedia','https://en.wikipedia.org/wiki/$1','https://en.wikipedia.org/w/api.php','',0,0),('wikiquote','https://en.wikiquote.org/wiki/$1','https://en.wikiquote.org/w/api.php','',0,0),('wikisource','https://wikisource.org/wiki/$1','https://wikisource.org/w/api.php','',0,0),('wikispecies','https://species.wikimedia.org/wiki/$1','https://species.wikimedia.org/w/api.php','',0,0),('wikiversity','https://en.wikiversity.org/wiki/$1','https://en.wikiversity.org/w/api.php','',0,0),('wikivoyage','https://en.wikivoyage.org/wiki/$1','https://en.wikivoyage.org/w/api.php','',0,0),('wikt','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0),('wiktionary','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_changes`
--

DROP TABLE IF EXISTS `ip_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_changes` (
  `ipc_rev_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ipc_rev_timestamp` binary(14) NOT NULL,
  `ipc_hex` varbinary(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`ipc_rev_id`),
  KEY `ipc_rev_timestamp` (`ipc_rev_timestamp`),
  KEY `ipc_hex_time` (`ipc_hex`,`ipc_rev_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_changes`
--

LOCK TABLES `ip_changes` WRITE;
/*!40000 ALTER TABLE `ip_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT 0,
  `ipb_by_actor` bigint(20) unsigned NOT NULL,
  `ipb_reason_id` bigint(20) unsigned NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL,
  `ipb_auto` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT 1,
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT 1,
  `ipb_expiry` varbinary(14) NOT NULL,
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_parent_block_id` int(10) unsigned DEFAULT NULL,
  `ipb_sitewide` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address_unique` (`ipb_address`(255),`ipb_user`,`ipb_auto`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks_restrictions`
--

DROP TABLE IF EXISTS `ipblocks_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks_restrictions` (
  `ir_ipb_id` int(10) unsigned NOT NULL,
  `ir_type` tinyint(4) NOT NULL,
  `ir_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ir_ipb_id`,`ir_type`,`ir_value`),
  KEY `ir_type_value` (`ir_type`,`ir_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks_restrictions`
--

LOCK TABLES `ipblocks_restrictions` WRITE;
/*!40000 ALTER TABLE `ipblocks_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT 0,
  `iwl_prefix` varbinary(32) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` binary(14) DEFAULT NULL,
  `job_params` mediumblob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT 0,
  `job_attempts` int(10) unsigned NOT NULL DEFAULT 0,
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` binary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(35) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  PRIMARY KEY (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
INSERT INTO `l10n_cache` VALUES ('en','messages:unblocklog-showsuppresslog','s:80:\"en:The suppress log for this {{GENDER:$1|user}} is provided below for reference:\";'),('en','messages:unblocklogentry','s:15:\"en:unblocked $1\";'),('en','messages:uncategorized-categories-exceptionlist','s:231:\"en: # Contains a list of categories, which shouldn\'t be mentioned on Special:UncategorizedCategories. One per line, starting with \"*\". Lines starting with another character (including whitespaces) are ignored. Use \"#\" for comments.\";'),('en','messages:uncategorizedcategories','s:27:\"en:Uncategorized categories\";'),('en','messages:uncategorizedcategories-summary','s:3:\"en:\";'),('en','messages:uncategorizedimages','s:22:\"en:Uncategorized files\";'),('en','messages:uncategorizedimages-summary','s:3:\"en:\";'),('en','messages:uncategorizedpages','s:22:\"en:Uncategorized pages\";'),('en','messages:uncategorizedpages-summary','s:3:\"en:\";'),('en','messages:uncategorizedtemplates','s:26:\"en:Uncategorized templates\";'),('en','messages:uncategorizedtemplates-summary','s:3:\"en:\";'),('en','messages:undelete','s:21:\"en:View deleted pages\";'),('en','messages:undelete-back-to-list','s:29:\"en:View all deleted revisions\";'),('en','messages:undelete-bad-store-key','s:85:\"en:Cannot undelete file revision with timestamp $1: File was missing before deletion.\";'),('en','messages:undelete-cantcreate','s:121:\"en:You cannot undelete this page as there is no existing page with this name and you are not allowed to create this page.\";'),('en','messages:undelete-cantedit','s:74:\"en:You cannot undelete this page as you are not allowed to edit this page.\";'),('en','messages:undelete-cleanup-error','s:43:\"en:Error deleting unused archive file \"$1\".\";'),('en','messages:undelete-error','s:24:\"en:Error undeleting page\";'),('en','messages:undelete-error-associated-alreadytalk','s:55:\"en:Cannot undelete associated talk page of a talk page.\";'),('en','messages:undelete-error-associated-notdeleted','s:67:\"en:The associated talk page has no revisions that can be undeleted.\";'),('en','messages:undelete-fieldset-title','s:21:\"en:Undelete revisions\";'),('en','messages:undelete-filename-mismatch','s:70:\"en:Cannot undelete file revision with timestamp $1: Filename mismatch.\";'),('en','messages:undelete-header','s:74:\"en:See [[Special:Log/delete|the deletion log]] for recently deleted pages.\";'),('en','messages:undelete-load-more-revisions','s:22:\"en:Load more revisions\";'),('en','messages:undelete-missing-filearchive','s:111:\"en:Unable to undelete file archive ID $1 because it is not in the database.\nIt may have already been undeleted.\";'),('en','messages:undelete-no-results','s:51:\"en:No matching pages found in the deletion archive.\";'),('en','messages:undelete-nodiff','s:30:\"en:No previous revision found.\";'),('en','messages:undelete-revision','s:50:\"en:Deleted revision of $1 (as of $4, at $5) by $3:\";'),('en','messages:undelete-revision-row2','s:32:\"en:$1 ($2) $3 . . $4 $5 $6 $7 $8\";'),('en','messages:undelete-search-box','s:23:\"en:Search deleted pages\";'),('en','messages:undelete-search-full','s:31:\"en:Show page titles containing:\";'),('en','messages:undelete-search-prefix','s:28:\"en:Show pages starting with:\";'),('en','messages:undelete-search-submit','s:9:\"en:Search\";'),('en','messages:undelete-search-title','s:23:\"en:Search deleted pages\";'),('en','messages:undelete-show-file-confirm','s:102:\"en:Are you sure you want to view the deleted revision of the file \"<nowiki>$1</nowiki>\" from $2 at $3?\";'),('en','messages:undelete-show-file-submit','s:6:\"en:Yes\";'),('en','messages:undelete-summary','s:3:\"en:\";'),('en','messages:undelete-talk-summary-prefix','s:62:\"en:Undeleted together with the associated page with reason: $1\";'),('en','messages:undelete-undeletetalk','s:53:\"en:Undelete all revisions of the associated talk page\";'),('en','messages:undelete_short','s:43:\"en:Undelete {{PLURAL:$1|one edit|$1 edits}}\";'),('en','messages:undeletebtn','s:11:\"en:Undelete\";'),('en','messages:undeletecomment','s:10:\"en:Reason:\";'),('en','messages:undeletedarticle','s:21:\"en:undeleted \"[[$1]]\"\";'),('en','messages:undeletedpage','s:141:\"en:<strong>$1 has been undeleted</strong>\n\nConsult the [[Special:Log/delete|deletion log]] for a record of recent deletions and restorations.\";'),('en','messages:undeleteextrahelp','s:286:\"en:To undelete the page\'s entire history, leave all checkboxes deselected and click <strong><em>{{int:undeletebtn}}</em></strong>.\nTo perform a selective undeletion, check the boxes corresponding to the revisions to be undeleted, and click <strong><em>{{int:undeletebtn}}</em></strong>.\";'),('en','messages:undeletehistory','s:204:\"en:If you undelete the page, all revisions will be undeleted to the history.\nIf a new page with the same name has been created since the deletion, the undeleted revisions will appear in the prior history.\";'),('en','messages:undeletehistorynoadmin','s:232:\"en:This page has been deleted.\nThe reason for deletion is shown in the summary below, along with details of the users who had edited this page before deletion.\nThe text of these deleted revisions is only available to administrators.\";'),('en','messages:undeleteinvert','s:19:\"en:Invert selection\";'),('en','messages:undeletelink','s:16:\"en:view/undelete\";'),('en','messages:undeletepage','s:34:\"en:View and undelete deleted pages\";'),('en','messages:undeletepagetext','s:182:\"en:The following {{PLURAL:$1|page has been deleted but is|$1 pages have been deleted but are}} still in the archive and can be undeleted.\nThe archive may be periodically cleaned out.\";'),('en','messages:undeletepagetitle','s:78:\"en:<strong>The following consists of deleted revisions of [[:$1|$1]]</strong>.\";'),('en','messages:undeleterevdel','s:182:\"en:Undeletion will not be performed if it will result in the top page or file revision being partially deleted.\nIn such cases, you must uncheck or unhide the newest deleted revision.\";'),('en','messages:undeleterevision-missing','s:125:\"en:Invalid or missing revision.\nYou may have a bad link, or the revision may have been undeleted or removed from the archive.\";'),('en','messages:undeleterevisions','s:46:\"en:$1 {{PLURAL:$1|revision|revisions}} deleted\";'),('en','messages:undeleteviewlink','s:7:\"en:view\";'),('en','messages:underline-always','s:9:\"en:Always\";'),('en','messages:underline-default','s:26:\"en:Skin or browser default\";'),('en','messages:underline-never','s:8:\"en:Never\";'),('en','messages:undo-failure','s:70:\"en:The edit could not be undone due to conflicting intermediate edits.\";'),('en','messages:undo-main-slot-only','s:82:\"en:The edit could not be undone because it involves content outside the main slot.\";'),('en','messages:undo-nochange','s:48:\"en:The edit appears to have already been undone.\";'),('en','messages:undo-norev','s:73:\"en:The edit could not be undone because it does not exist or was deleted.\";'),('en','messages:undo-success','s:167:\"en:The edit can be undone.\nPlease check the comparison below to verify that this is what you want to do, and then publish the changes below to finish undoing the edit.\";'),('en','messages:undo-summary','s:98:\"en:Undo revision [[Special:Diff/$1|$1]] by [[Special:Contributions/$2|$2]] ([[User talk:$2|talk]])\";'),('en','messages:undo-summary-anon','s:74:\"en:Undo revision [[Special:Diff/$1|$1]] by [[Special:Contributions/$2|$2]]\";'),('en','messages:undo-summary-import','s:67:\"en:Undo imported revision [[Special:Diff/$1|$1]] by user [[:$2|$3]]\";'),('en','messages:undo-summary-import2','s:59:\"en:Undo imported revision [[Special:Diff/$1|$1]] by user $2\";'),('en','messages:undo-summary-username-hidden','s:56:\"en:Undo revision [[Special:Diff/$1|$1]] by a hidden user\";'),('en','messages:unexpected','s:31:\"en:Unexpected value: \"$1\"=\"$2\".\";'),('en','messages:unicode-support-fail','s:119:\"en:It appears that your browser does not support Unicode. It is required to edit pages, so your edit was not published.\";'),('en','messages:unit-pixel','s:5:\"en:px\";'),('en','messages:unknown-error','s:29:\"en:An unknown error occurred.\";'),('en','messages:unlinkaccounts','s:18:\"en:Unlink accounts\";'),('en','messages:unlinkaccounts-success','s:28:\"en:The account was unlinked.\";'),('en','messages:unlockbtn','s:18:\"en:Unlock database\";'),('en','messages:unlockconfirm','s:45:\"en:Yes, I really want to unlock the database.\";'),('en','messages:unlockdb','s:18:\"en:Unlock database\";'),('en','messages:unlockdbsuccesssub','s:24:\"en:Database lock removed\";'),('en','messages:unlockdbsuccesstext','s:34:\"en:The database has been unlocked.\";'),('en','messages:unlockdbtext','s:230:\"en:Unlocking the database will restore the ability of all users to edit pages, change their preferences, edit their watchlists, and other things requiring changes in the database.\nPlease confirm that this is what you intend to do.\";'),('en','messages:unpatrolledletter','s:4:\"en:!\";'),('en','messages:unprotect','s:20:\"en:Change protection\";'),('en','messages:unprotected-js','s:154:\"en:For security reasons JavaScript cannot be loaded from unprotected pages. Please only create javascript in the MediaWiki: namespace or as a User subpage\";'),('en','messages:unprotectedarticle','s:35:\"en:removed protection from \"[[$1]]\"\";'),('en','messages:unprotectedarticle-comment','s:49:\"en:{{GENDER:$2|Removed protection}} from \"[[$1]]\"\";'),('en','messages:unregistered-user-config','s:103:\"en:For security reasons JavaScript, CSS and JSON user subpages cannot be loaded for unregistered users.\";'),('en','messages:unstrip-depth-category','s:50:\"en:Pages where the unstrip depth limit is exceeded\";'),('en','messages:unstrip-depth-category-desc','s:44:\"en:The page exceeds the unstrip depth limit.\";'),('en','messages:unstrip-depth-warning','s:36:\"en:Unstrip depth limit exceeded ($1)\";'),('en','messages:unstrip-size-category','s:49:\"en:Pages where the unstrip size limit is exceeded\";'),('en','messages:unstrip-size-category-desc','s:43:\"en:The page exceeds the unstrip size limit.\";'),('en','messages:unstrip-size-warning','s:35:\"en:Unstrip size limit exceeded ($1)\";'),('en','messages:unsupported-content-diff','s:48:\"en:Diffs are not supported for content model $1.\";'),('en','messages:unsupported-content-diff2','s:77:\"en:Diffs between the content models $1 and $2 are not supported on this wiki.\";'),('en','messages:unsupported-content-model','s:76:\"en:<strong>Warning:</strong> Content model $1 is not supported on this wiki.\";'),('en','messages:unusedcategories','s:20:\"en:Unused categories\";'),('en','messages:unusedcategories-summary','s:3:\"en:\";'),('en','messages:unusedcategoriestext','s:92:\"en:The following category pages exist, although no other page or category makes use of them.\";'),('en','messages:unusedimages','s:15:\"en:Unused files\";'),('en','messages:unusedimages-summary','s:3:\"en:\";'),('en','messages:unusedimagestext','s:193:\"en:The following files exist but are not embedded in any page.\nPlease note that other websites may link to a file with a direct URL, and so may still be listed here despite being in active use.\";'),('en','messages:unusedimagestext-categorizedimgisused','s:283:\"en:The following files exist but are not embedded in any page. Categorized images are considered as used despite that they are not embedded in any page.\nPlease note that other websites may link to a file with a direct URL, and so may still be listed here despite being in active use.\";'),('en','messages:unusedtemplates','s:19:\"en:Unused templates\";'),('en','messages:unusedtemplates-summary','s:3:\"en:\";'),('en','messages:unusedtemplatestext','s:173:\"en:This page lists all pages in the {{ns:template}} namespace that are not included in another page.\nRemember to check for other links to the templates before deleting them.\";'),('en','messages:unusedtemplateswlh','s:14:\"en:other links\";'),('en','messages:unwatch','s:10:\"en:Unwatch\";'),('en','messages:unwatchedpages','s:18:\"en:Unwatched pages\";'),('en','messages:unwatchedpages-summary','s:3:\"en:\";'),('en','messages:unwatching','s:16:\"en:Unwatching...\";'),('en','messages:unwatchthispage','s:16:\"en:Stop watching\";'),('en','messages:updated','s:12:\"en:(Updated)\";'),('en','messages:updatedmarker','s:32:\"en:updated since your last visit\";'),('en','messages:updatewatchlist','s:19:\"en:Update watchlist\";'),('en','messages:upload','s:14:\"en:Upload file\";'),('en','messages:upload-copy-upload-invalid-domain','s:51:\"en:Copy uploads are not available from this domain.\";'),('en','messages:upload-curl-error28','s:17:\"en:Upload timeout\";'),('en','messages:upload-curl-error28-text','s:141:\"en:The site took too long to respond.\nPlease check the site is up, wait a short while and try again.\nYou may want to try at a less busy time.\";'),('en','messages:upload-curl-error6','s:22:\"en:Could not reach URL\";'),('en','messages:upload-curl-error6-text','s:105:\"en:The URL provided could not be reached.\nPlease double-check that the URL is correct and the site is up.\";'),('en','messages:upload-default-description','s:4:\"en:-\";'),('en','messages:upload-description','s:19:\"en:File description\";'),('en','messages:upload-dialog-button-back','s:7:\"en:Back\";'),('en','messages:upload-dialog-button-cancel','s:9:\"en:Cancel\";'),('en','messages:upload-dialog-button-done','s:7:\"en:Done\";'),('en','messages:upload-dialog-button-save','s:7:\"en:Save\";'),('en','messages:upload-dialog-button-upload','s:9:\"en:Upload\";'),('en','messages:upload-dialog-disabled','s:60:\"en:File uploads using this dialog are disabled on this wiki.\";'),('en','messages:upload-dialog-title','s:14:\"en:Upload file\";'),('en','messages:upload-disallowed-here','s:34:\"en:You cannot overwrite this file.\";'),('en','messages:upload-file-error','s:17:\"en:Internal error\";'),('en','messages:upload-file-error-text','s:148:\"en:An internal error occurred when attempting to create a temporary file on the server.\nPlease contact an [[Special:ListUsers/sysop|administrator]].\";'),('en','messages:upload-foreign-cant-load-config','s:84:\"en:Failed to load the configuration for file uploads to the foreign file repository.\";'),('en','messages:upload-foreign-cant-upload','s:88:\"en:This wiki is not configured to upload files to the requested foreign file repository.\";'),('en','messages:upload-form-label-infoform-categories','s:13:\"en:Categories\";'),('en','messages:upload-form-label-infoform-date','s:7:\"en:Date\";'),('en','messages:upload-form-label-infoform-description','s:14:\"en:Description\";'),('en','messages:upload-form-label-infoform-description-tooltip','s:138:\"en:Briefly describe everything notable about the work.\nFor a photo, mention the main things that are depicted, the occasion, or the place.\";'),('en','messages:upload-form-label-infoform-name','s:7:\"en:Name\";'),('en','messages:upload-form-label-infoform-name-tooltip','s:150:\"en:A unique descriptive title for the file, which will serve as a filename. You may use plain language with spaces. Do not include the file extension.\";'),('en','messages:upload-form-label-infoform-title','s:10:\"en:Details\";'),('en','messages:upload-form-label-not-own-work-local-generic-foreign','s:142:\"en:You may also want to try using [[Special:Upload|the upload page on {{SITENAME}}]], if this file can be uploaded there under their policies.\";'),('en','messages:upload-form-label-not-own-work-local-generic-local','s:71:\"en:You may also want to try [[Special:Upload|the default upload page]].\";'),('en','messages:upload-form-label-not-own-work-message-generic-foreign','s:136:\"en:If you are not able to upload this file under the policies of the shared repository, please close this dialog and try another method.\";'),('en','messages:upload-form-label-not-own-work-message-generic-local','s:127:\"en:If you are not able to upload this file under the policies of {{SITENAME}}, please close this dialog and try another method.\";'),('en','messages:upload-form-label-own-work','s:22:\"en:This is my own work\";'),('en','messages:upload-form-label-own-work-message-generic-foreign','s:159:\"en:I understand that I am uploading this file to a shared repository. I confirm that I am doing so following the terms of service and licensing policies there.\";'),('en','messages:upload-form-label-own-work-message-generic-local','s:113:\"en:I confirm that I am uploading this file following the terms of service and licensing policies on {{SITENAME}}.\";'),('en','messages:upload-form-label-usage-filename','s:12:\"en:File name\";'),('en','messages:upload-form-label-usage-title','s:8:\"en:Usage\";'),('en','messages:upload-http-error','s:29:\"en:An HTTP error occurred: $1\";'),('en','messages:upload-maxfilesize','s:24:\"en:Maximum file size: $1\";'),('en','messages:upload-misc-error','s:23:\"en:Unknown upload error\";'),('en','messages:upload-misc-error-text','s:192:\"en:An unknown error occurred during the upload.\nPlease verify that the URL is valid and accessible and try again.\nIf the problem persists, contact an [[Special:ListUsers/sysop|administrator]].\";'),('en','messages:upload-options','s:17:\"en:Upload options\";'),('en','messages:upload-permitted','s:47:\"en:Permitted file {{PLURAL:$2|type|types}}: $1.\";'),('en','messages:upload-preferred','s:47:\"en:Preferred file {{PLURAL:$2|type|types}}: $1.\";'),('en','messages:upload-prohibited','s:48:\"en:Prohibited file {{PLURAL:$2|type|types}}: $1.\";'),('en','messages:upload-proto-error','s:21:\"en:Incorrect protocol\";'),('en','messages:upload-proto-error-text','s:90:\"en:Remote upload requires URLs beginning with <code>http://</code> or <code>ftp://</code>.\";'),('en','messages:upload-recreate-warning','s:151:\"en:<strong>Warning: A file by that name has been deleted or moved.</strong>\n\nThe deletion and move log for this page are provided here for convenience:\";'),('en','messages:upload-scripted-dtd','s:71:\"en:Cannot upload SVG files that contain a non-standard DTD declaration.\";'),('en','messages:upload-scripted-pi-callback','s:76:\"en:Cannot upload a file that contains XML-stylesheet processing instruction.\";'),('en','messages:upload-source','s:14:\"en:Source file\";'),('en','messages:upload-summary','s:3:\"en:\";'),('en','messages:upload-too-many-redirects','s:39:\"en:The URL contained too many redirects\";'),('en','messages:upload-tryagain','s:35:\"en:Submit modified file description\";'),('en','messages:upload-tryagain-nostash','s:51:\"en:Submit re-uploaded file and modified description\";'),('en','messages:upload_directory_missing','s:82:\"en:The upload directory ($1) is missing and could not be created by the webserver.\";'),('en','messages:upload_directory_read_only','s:62:\"en:The upload directory ($1) is not writable by the webserver.\";'),('en','messages:upload_source_file','s:38:\"en:(your chosen file from your device)\";'),('en','messages:upload_source_url','s:59:\"en:(your chosen file from a valid, publicly accessible URL)\";'),('en','messages:uploadbtn','s:14:\"en:Upload file\";'),('en','messages:uploaddisabled','s:20:\"en:Uploads disabled.\";'),('en','messages:uploaddisabledtext','s:29:\"en:File uploads are disabled.\";'),('en','messages:uploaded-animate-svg','s:136:\"en:Found \"animate\" tag that might be changing href, using the \"from\" attribute <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),('en','messages:uploaded-event-handler-on-svg','s:85:\"en:Setting event-handler attributes <code>$1=\"$2\"</code> is not allowed in SVG files.\";'),('en','messages:uploaded-hostile-svg','s:62:\"en:Found unsafe CSS in the style element of uploaded SVG file.\";'),('en','messages:uploaded-href-attribute-svg','s:282:\"en:<a> elements can only link (href) to data: (embedded file), http:// or https://, or fragment (#, same-document) targets. For other elements, such as <image>, only data: and fragment are allowed. Try embedding images when exporting your SVG. Found <code>&lt;$1 $2=\"$3\"&gt;</code>.\";'),('en','messages:uploaded-href-unsafe-target-svg','s:98:\"en:Found href to unsafe data: URI target <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),('en','messages:uploaded-image-filter-svg','s:89:\"en:Found image filter with URL: <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),('en','messages:uploaded-remote-url-svg','s:117:\"en:SVG that sets any style attribute with remote URL is blocked. Found <code>$1=\"$2\"</code> in the uploaded SVG file.\";'),('en','messages:uploaded-script-svg','s:58:\"en:Found scriptable element \"$1\" in the uploaded SVG file.\";'),('en','messages:uploaded-setting-event-handler-svg','s:111:\"en:Setting event-handler attributes is blocked, found <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),('en','messages:uploaded-setting-handler-svg','s:129:\"en:SVG that sets the \"handler\" attribute with remote/data/script is blocked. Found <code>$1=\"$2\"</code> in the uploaded SVG file.\";'),('en','messages:uploaded-setting-href-svg','s:76:\"en:Using the \"set\" tag to add \"href\" attribute to parent element is blocked.\";'),('en','messages:uploaded-wrong-setting-svg','s:151:\"en:Using the \"set\" tag to add a remote/data/script target to any attribute is blocked. Found <code>&lt;set to=\"$1\"&gt;</code> in the uploaded SVG file.\";'),('en','messages:uploadedimage','s:20:\"en:uploaded \"[[$1]]\"\";'),('en','messages:uploaderror','s:15:\"en:Upload error\";'),('en','messages:uploadfooter','s:4:\"en:-\";'),('en','messages:uploadinvalidxml','s:52:\"en:The XML in the uploaded file could not be parsed.\";'),('en','messages:uploadlogpage','s:13:\"en:Upload log\";'),('en','messages:uploadlogpagetext','s:129:\"en:Below is a list of the most recent file uploads.\nSee the [[Special:NewFiles|gallery of new files]] for a more visual overview.\";'),('en','messages:uploadnewversion-linktext','s:36:\"en:Upload a new version of this file\";'),('en','messages:uploadnologin','s:16:\"en:Not logged in\";'),('en','messages:uploadnologintext','s:29:\"en:Please $1 to upload files.\";'),('en','messages:uploadscripted','s:95:\"en:This file contains HTML or script code that may be erroneously interpreted by a web browser.\";'),('en','messages:uploadscriptednamespace','s:69:\"en:This SVG file contains an illegal namespace \"<nowiki>$1</nowiki>\".\";'),('en','messages:uploadstash','s:15:\"en:Upload stash\";'),('en','messages:uploadstash-bad-path','s:22:\"en:Path doesn\'t exist.\";'),('en','messages:uploadstash-bad-path-bad-format','s:38:\"en:Key \"$1\" is not in a proper format.\";'),('en','messages:uploadstash-bad-path-invalid','s:21:\"en:Path is not valid.\";'),('en','messages:uploadstash-bad-path-no-handler','s:43:\"en:No handler found for mime $1 of file $2.\";'),('en','messages:uploadstash-bad-path-unknown-type','s:21:\"en:Unknown type \"$1\".\";'),('en','messages:uploadstash-bad-path-unrecognized-thumb-name','s:27:\"en:Unrecognized thumb name.\";'),('en','messages:uploadstash-badtoken','s:101:\"en:Performing that action failed, perhaps because your editing credentials expired. Please try again.\";'),('en','messages:uploadstash-clear','s:22:\"en:Clear stashed files\";'),('en','messages:uploadstash-errclear','s:29:\"en:Clearing the files failed.\";'),('en','messages:uploadstash-exception','s:50:\"en:Could not store upload in the stash ($1): \"$2\".\";'),('en','messages:uploadstash-file-not-found','s:31:\"en:Key \"$1\" not found in stash.\";'),('en','messages:uploadstash-file-not-found-missing-content-type','s:31:\"en:Missing content-type header.\";'),('en','messages:uploadstash-file-not-found-no-local-path','s:33:\"en:No local path for scaled item.\";'),('en','messages:uploadstash-file-not-found-no-remote-thumb','s:41:\"en:Fetching thumbnail failed: $1\nURL = $2\";'),('en','messages:uploadstash-file-not-found-no-thumb','s:30:\"en:Could not obtain thumbnail.\";'),('en','messages:uploadstash-file-not-found-not-exists','s:41:\"en:Cannot find path, or not a plain file.\";'),('en','messages:uploadstash-file-too-large','s:44:\"en:Cannot serve a file larger than $1 bytes.\";'),('en','messages:uploadstash-no-such-key','s:35:\"en:No such key ($1), cannot remove.\";'),('en','messages:uploadstash-nofiles','s:29:\"en:You have no stashed files.\";'),('en','messages:uploadstash-not-logged-in','s:52:\"en:No user is logged in, files must belong to users.\";'),('en','messages:uploadstash-refresh','s:28:\"en:Refresh the list of files\";'),('en','messages:uploadstash-summary','s:196:\"en:This page provides access to files that are uploaded or in the process of uploading, but are not yet published to the wiki. These files are not visible to anyone but the user who uploaded them.\";'),('en','messages:uploadstash-thumbnail','s:17:\"en:view thumbnail\";'),('en','messages:uploadstash-wrong-owner','s:53:\"en:This file ($1) doesn\'t belong to the current user.\";'),('en','messages:uploadstash-zero-length','s:23:\"en:File is zero length.\";'),('en','messages:uploadtext','s:842:\"en:Use the form below to upload files.\nTo view or search previously uploaded files go to the [[Special:FileList|list of uploaded files]]. Uploads and reuploads are also logged in the [[Special:Log/upload|upload log]]. Deletions are logged in the [[Special:Log/delete|deletion log]].\n\nTo include a file in a page, use a link in one of the following forms:\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:File.jpg]]</nowiki></code></strong> to use the full version of the file\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:File.png|200px|thumb|left|Caption]]</nowiki></code></strong> to use a 200-pixel-wide rendition in a box in the left margin with the text \"Caption\" below\n* <strong><code><nowiki>[[</nowiki>{{ns:media}}<nowiki>:File.ogg]]</nowiki></code></strong> for directly linking to the file without displaying the file\";'),('en','messages:uploadvirus','s:41:\"en:The file contains a virus!\nDetails: $1\";'),('en','messages:uploadwarning','s:17:\"en:Upload warning\";'),('en','messages:uploadwarning-text','s:58:\"en:Please modify the file description below and try again.\";'),('en','messages:uploadwarning-text-nostash','s:73:\"en:Please re-upload the file, modify the description below and try again.\";'),('en','messages:user-mail-no-addy','s:48:\"en:Tried to send email without an email address.\";'),('en','messages:user-mail-no-body','s:64:\"en:Tried to send email with an empty or unreasonably short body.\";'),('en','messages:usercreated','s:36:\"en:{{GENDER:$3|Created}} on $1 at $2\";'),('en','messages:usercssispublic','s:102:\"en:Please note: CSS subpages should not contain confidential data as they are viewable by other users.\";'),('en','messages:usercsspreview','s:103:\"en:<strong>Remember that you are only previewing your user CSS.\nIt has not yet been published!</strong>\";'),('en','messages:usercssyoucanpreview','s:101:\"en:<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new CSS before publishing.\";'),('en','messages:usereditcount','s:30:\"en:$1 {{PLURAL:$1|edit|edits}}\";'),('en','messages:userexists','s:67:\"en:Username entered already in use.\nPlease choose a different name.\";'),('en','messages:userinvalidconfigtitle','s:174:\"en:<strong>Warning:</strong> There is no skin \"$1\".\nCustom .css and .js pages use a lowercase title, e.g. {{ns:user}}:Foo/vector.css as opposed to {{ns:user}}:Foo/Vector.css.\";'),('en','messages:userjsdangerous','s:215:\"en:Please note: Scripts included on this page will be run any time you load a page. Malicious code added here could result in account compromise. The code will be executed when you preview your changes to this page.\";'),('en','messages:userjsispublic','s:109:\"en:Please note: JavaScript subpages should not contain confidential data as they are viewable by other users.\";'),('en','messages:userjsonispublic','s:103:\"en:Please note: JSON subpages should not contain confidential data as they are viewable by other users.\";'),('en','messages:userjsonpreview','s:119:\"en:<strong>Remember that you are only testing/previewing your user JSON config.\nIt has not yet been published!</strong>\";'),('en','messages:userjsonyoucanpreview','s:102:\"en:<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new JSON before publishing.\";'),('en','messages:userjspreview','s:118:\"en:<strong>Remember that you are only testing/previewing your user JavaScript.\nIt has not yet been published!</strong>\";'),('en','messages:userjsyoucanpreview','s:108:\"en:<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new JavaScript before publishing.\";'),('en','messages:userlogin-createanother','s:25:\"en:Create another account\";'),('en','messages:userlogin-helplink2','s:23:\"en:Help with logging in\";'),('en','messages:userlogin-joinproject','s:20:\"en:Join {{SITENAME}}\";'),('en','messages:userlogin-loggedin','s:95:\"en:You are already logged in as {{GENDER:$1|$1}}.\nUse the form below to log in as another user.\";'),('en','messages:userlogin-noaccount','s:25:\"en:Don\'t have an account?\";'),('en','messages:userlogin-reauth','s:65:\"en:You must log in again to verify that you are {{GENDER:$1|$1}}.\";'),('en','messages:userlogin-remembermypassword','s:20:\"en:Keep me logged in\";'),('en','messages:userlogin-resetpassword-link','s:24:\"en:Forgot your password?\";'),('en','messages:userlogin-signwithsecure','s:24:\"en:Use secure connection\";'),('en','messages:userlogin-yourname','s:11:\"en:Username\";'),('en','messages:userlogin-yourname-ph','s:22:\"en:Enter your username\";'),('en','messages:userlogin-yourpassword','s:11:\"en:Password\";'),('en','messages:userlogin-yourpassword-ph','s:22:\"en:Enter your password\";'),('en','messages:userlogout','s:10:\"en:Log out\";'),('en','messages:userlogout-continue','s:26:\"en:Do you want to log out?\";'),('en','messages:userlogout-summary','s:3:\"en:\";'),('en','messages:userlogout-temp','s:99:\"en:Are you sure you want to log out? There will be no way to log back in to your temporary account.\";'),('en','messages:usermaildisabled','s:22:\"en:User email disabled\";'),('en','messages:usermaildisabledtext','s:52:\"en:You cannot send email to other users on this wiki\";'),('en','messages:usermessage-editor','s:19:\"en:System messenger\";'),('en','messages:usermessage-summary','s:26:\"en:Leaving system message.\";'),('en','messages:usermessage-template','s:24:\"en:MediaWiki:UserMessage\";'),('en','messages:username','s:26:\"en:{{GENDER:$1|Username}}:\";'),('en','messages:usernameinprogress','s:77:\"en:An account creation for this username is already in progress.\nPlease wait.\";'),('en','messages:userpage-userdoesnotexist','s:103:\"en:User account \"$1\" is not registered on this wiki.\nPlease check if you want to create/edit this page.\";'),('en','messages:userpage-userdoesnotexist-view','s:52:\"en:User account \"$1\" is not registered on this wiki.\";'),('en','messages:userrights','s:14:\"en:User rights\";'),('en','messages:userrights-cannot-shorten-expiry','s:155:\"en:You cannot bring forward the expiry of membership in group \"$1\". Only users with permission to add and remove this group can bring forward expiry times.\";'),('en','messages:userrights-changeable-col','s:24:\"en:Groups you can change\";'),('en','messages:userrights-conflict','s:75:\"en:Conflict of user rights changes! Please review and confirm your changes.\";'),('en','messages:userrights-editusergroup','s:33:\"en:Edit {{GENDER:$1|user}} groups\";'),('en','messages:userrights-expiry','s:11:\"en:Expires:\";'),('en','messages:userrights-expiry-current','s:13:\"en:Expires $1\";'),('en','messages:userrights-expiry-existing','s:35:\"en:Existing expiration time: $3, $2\";'),('en','messages:userrights-expiry-in-past','s:49:\"en:The expiry time for group \"$1\" is in the past.\";'),('en','messages:userrights-expiry-none','s:18:\"en:Does not expire\";'),('en','messages:userrights-expiry-options','s:94:\"en:1 day:1 day,1 week:1 week,1 month:1 month,3 months:3 months,6 months:6 months,1 year:1 year\";'),('en','messages:userrights-expiry-othertime','s:14:\"en:Other time:\";'),('en','messages:userrights-groups-help','s:369:\"en:You may alter the groups {{GENDER:$1|this user}} is in:\n* A checked box means the user is in that group.\n* An unchecked box means the user is not in that group.\n* A * indicates that you cannot remove the group once you have added it, or vice versa.\n* A # indicates that you can only put back the expiration time of this group membership; you cannot bring it forward.\";'),('en','messages:userrights-groupsmember','s:13:\"en:Member of:\";'),('en','messages:userrights-groupsmember-auto','s:22:\"en:Implicit member of:\";'),('en','messages:userrights-groupsmember-type','s:5:\"en:$1\";'),('en','messages:userrights-invalid-expiry','s:45:\"en:The expiry time for group \"$1\" is invalid.\";'),('en','messages:userrights-irreversible-marker','s:6:\"en:$1*\";'),('en','messages:userrights-lookup-user','s:16:\"en:Select a user\";'),('en','messages:userrights-no-group','s:38:\"en:Temporary users do not have groups.\";'),('en','messages:userrights-no-interwiki','s:65:\"en:You do not have permission to edit user rights on other wikis.\";'),('en','messages:userrights-no-shorten-expiry-marker','s:6:\"en:$1#\";'),('en','messages:userrights-no-tempuser','s:47:\"en:Temporary users cannot be added into groups.\";'),('en','messages:userrights-nodatabase','s:46:\"en:Database $1 does not exist or is not local.\";'),('en','messages:userrights-reason','s:10:\"en:Reason:\";'),('en','messages:userrights-summary','s:3:\"en:\";'),('en','messages:userrights-systemuser','s:43:\"en:{{GENDER:$1|This user}} is a system user\";'),('en','messages:userrights-unchangeable-col','s:27:\"en:Groups you cannot change\";'),('en','messages:userrights-user-editname','s:20:\"en:Enter a username:\";'),('en','messages:userrights-viewusergroup','s:33:\"en:View {{GENDER:$1|user}} groups\";'),('en','messages:userrights-watchuser','s:40:\"en:Watch this user\'s user and talk pages\";'),('en','messages:variantname-crh','s:6:\"en:crh\";'),('en','messages:variantname-crh-cyrl','s:11:\"en:crh-Cyrl\";'),('en','messages:variantname-crh-latn','s:11:\"en:crh-Latn\";'),('en','messages:variantname-gan','s:6:\"en:gan\";'),('en','messages:variantname-gan-hans','s:7:\"en:Hans\";'),('en','messages:variantname-gan-hant','s:7:\"en:Hant\";'),('en','messages:variantname-ike-cans','s:11:\"en:ike-Cans\";'),('en','messages:variantname-ike-latn','s:11:\"en:ike-Latn\";'),('en','messages:variantname-iu','s:5:\"en:iu\";'),('en','messages:variantname-kk','s:5:\"en:kk\";'),('en','messages:variantname-kk-arab','s:10:\"en:kk-Arab\";'),('en','messages:variantname-kk-cn','s:8:\"en:kk-CN\";'),('en','messages:variantname-kk-cyrl','s:10:\"en:kk-Cyrl\";'),('en','messages:variantname-kk-kz','s:8:\"en:kk-KZ\";'),('en','messages:variantname-kk-latn','s:10:\"en:kk-Latn\";'),('en','messages:variantname-kk-tr','s:8:\"en:kk-TR\";'),('en','messages:variantname-ku','s:5:\"en:ku\";'),('en','messages:variantname-ku-arab','s:10:\"en:ku-Arab\";'),('en','messages:variantname-ku-latn','s:10:\"en:ku-Latn\";'),('en','messages:variantname-sh','s:5:\"en:sh\";'),('en','messages:variantname-sh-cyrl','s:10:\"en:sh-Cyrl\";'),('en','messages:variantname-sh-latn','s:10:\"en:sh-Latn\";'),('en','messages:variantname-shi','s:6:\"en:shi\";'),('en','messages:variantname-shi-latn','s:11:\"en:shi-Latn\";'),('en','messages:variantname-shi-tfng','s:11:\"en:shi-Tfng\";'),('en','messages:variantname-sr','s:5:\"en:sr\";'),('en','messages:variantname-sr-cyrl','s:10:\"en:sr-Cyrl\";'),('en','messages:variantname-sr-ec','s:10:\"en:sr-Cyrl\";'),('en','messages:variantname-sr-el','s:10:\"en:sr-Latn\";'),('en','messages:variantname-sr-latn','s:10:\"en:sr-Latn\";'),('en','messages:variantname-tg','s:5:\"en:tg\";'),('en','messages:variantname-tg-cyrl','s:10:\"en:tg-Cyrl\";'),('en','messages:variantname-tg-latn','s:10:\"en:tg-Latn\";'),('en','messages:variantname-tly','s:6:\"en:tly\";'),('en','messages:variantname-tly-cyrl','s:11:\"en:tly-Cyrl\";'),('en','messages:variantname-uz','s:5:\"en:uz\";'),('en','messages:variantname-uz-cyrl','s:10:\"en:uz-Cyrl\";'),('en','messages:variantname-uz-latn','s:10:\"en:uz-Latn\";'),('en','messages:variantname-wuu','s:6:\"en:wuu\";'),('en','messages:variantname-wuu-hans','s:7:\"en:Hans\";'),('en','messages:variantname-wuu-hant','s:7:\"en:Hant\";'),('en','messages:variantname-yue-hans','s:7:\"en:Hans\";'),('en','messages:variantname-yue-hant','s:7:\"en:Hant\";'),('en','messages:variantname-zh','s:5:\"en:zh\";'),('en','messages:variantname-zh-cn','s:5:\"en:CN\";'),('en','messages:variantname-zh-hans','s:7:\"en:Hans\";'),('en','messages:variantname-zh-hant','s:7:\"en:Hant\";'),('en','messages:variantname-zh-hk','s:5:\"en:HK\";'),('en','messages:variantname-zh-mo','s:5:\"en:MO\";'),('en','messages:variantname-zh-my','s:5:\"en:MY\";'),('en','messages:variantname-zh-sg','s:5:\"en:SG\";'),('en','messages:variantname-zh-tw','s:5:\"en:TW\";'),('en','messages:variants','s:11:\"en:Variants\";'),('en','messages:vector-2022-prefs-talkpage','s:58:\"en:[[mw:Talk:Reading/Web/Desktop_Improvements|Discussion]]\";'),('en','messages:vector-action-addsection','s:12:\"en:Add topic\";'),('en','messages:vector-action-delete','s:9:\"en:Delete\";'),('en','messages:vector-action-move','s:7:\"en:Move\";'),('en','messages:vector-action-protect','s:10:\"en:Protect\";'),('en','messages:vector-action-toggle-sidebar','s:17:\"en:Toggle sidebar\";'),('en','messages:vector-action-undelete','s:11:\"en:Undelete\";'),('en','messages:vector-action-unprotect','s:20:\"en:Change protection\";'),('en','messages:vector-anon-user-menu-pages','s:31:\"en:Pages for logged out editors\";'),('en','messages:vector-anon-user-menu-pages-label','s:27:\"en:Learn more about editing\";'),('en','messages:vector-anon-user-menu-pages-learn','s:13:\"en:learn more\";'),('en','messages:vector-client-preferences','s:19:\"en:Reading settings\";'),('en','messages:vector-feature-custom-font-size-disabled-label','s:8:\"en:Small\";'),('en','messages:vector-feature-custom-font-size-enabled-label','s:11:\"en:Standard\";'),('en','messages:vector-feature-custom-font-size-name','s:12:\"en:Type size\";'),('en','messages:vector-feature-limited-width-0-label','s:13:\"en:Full width\";'),('en','messages:vector-feature-limited-width-1-label','s:16:\"en:Limited width\";'),('en','messages:vector-feature-limited-width-name','s:15:\"en:Column width\";'),('en','messages:vector-intro-page','s:20:\"en:Help:Introduction\";'),('en','messages:vector-jumptocontent','s:18:\"en:Jump to content\";'),('en','messages:vector-jumptonavigation','s:21:\"en:Jump to navigation\";'),('en','messages:vector-jumptosearch','s:17:\"en:Jump to search\";'),('en','messages:vector-language-button-aria-label','s:92:\"en:Go to an article in another language. Available in {{PLURAL:$1|$1 language|$1 languages}}\";'),('en','messages:vector-language-button-label','s:41:\"en:{{PLURAL:$1|$1 language|$1 languages}}\";'),('en','messages:vector-language-redirect-to-top','s:67:\"en:Language links are at the top of the page across from the title.\";'),('en','messages:vector-language-variant-switcher-label','s:26:\"en:Change language variant\";'),('en','messages:vector-languages','s:12:\"en:Languages\";'),('en','messages:vector-limited-width-toggle','s:31:\"en:Toggle limited content width\";'),('en','messages:vector-limited-width-toggle-off-popup','s:81:\"en:You can toggle between a limited width and full width by clicking this button.\";'),('en','messages:vector-limited-width-toggle-on-popup','s:95:\"en:You have switched your layout to full width. To go back to limited width, press this button.\";'),('en','messages:vector-main-menu-label','s:12:\"en:Main menu\";'),('en','messages:vector-main-menu-tooltip','s:12:\"en:Main menu\";'),('en','messages:vector-main-menu-unpinned-popup','s:37:\"en:The main menu has been moved here.\";'),('en','messages:vector-more-actions','s:7:\"en:More\";'),('en','messages:vector-no-language-button-aria-label','s:80:\"en:This article exist only in this language. Add the article for other languages\";'),('en','messages:vector-no-language-button-label','s:16:\"en:Add languages\";'),('en','messages:vector-opt-out','s:21:\"en:Switch to old look\";'),('en','messages:vector-opt-out-tooltip','s:78:\"en:Change your settings to go back to the old look of the skin (legacy Vector)\";'),('en','messages:vector-page-tools-actions-label','s:10:\"en:Actions\";'),('en','messages:vector-page-tools-general-label','s:10:\"en:General\";'),('en','messages:vector-page-tools-label','s:8:\"en:Tools\";'),('en','messages:vector-page-tools-nav-label','s:13:\"en:Page tools\";'),('en','messages:vector-page-tools-unpinned-popup','s:38:\"en:The tools menu has been moved here.\";'),('en','messages:vector-pin-element-label','s:18:\"en:move to sidebar\";'),('en','messages:vector-prefs-limited-width','s:28:\"en:Enable limited width mode\";'),('en','messages:vector-prefs-limited-width-help','s:61:\"en:Enable limited width mode for improved reading experience.\";'),('en','messages:vector-readability-survey-description','s:220:\"en:How does the text on Wikipedia look best for you? Use the sliders below to adjust the appearance. Learn more about the [[mw:Special:MyLanguage/Reading/Web/Accessibility for reading|Accessibility for reading project]].\";'),('en','messages:vector-readability-survey-fontSize','s:12:\"en:Font size\";'),('en','messages:vector-readability-survey-lineHeight','s:14:\"en:Line height\";'),('en','messages:vector-readability-survey-optout','s:127:\"en:Press continue to send us your design and publish your feedback on the next page. [[#close-vector-survey|Remove this tool]].\";'),('en','messages:vector-readability-survey-paragraphSpacing','s:20:\"en:Paragraph spacing\";'),('en','messages:vector-readability-survey-randomize','s:12:\"en:randomize\";'),('en','messages:vector-readability-survey-reset','s:8:\"en:reset\";'),('en','messages:vector-readability-survey-share','s:11:\"en:continue\";'),('en','messages:vector-readability-survey-title','s:25:\"en:Wikimedia reading tool\";'),('en','messages:vector-search-loader','s:29:\"en:Loading search suggestions\";'),('en','messages:vector-searchsuggest-containing','s:101:\"en:Search for pages containing <strong class=\"cdx-typeahead-search__search-footer__query\">$1</strong>\";'),('en','messages:vector-site-nav-label','s:7:\"en:Site\";'),('en','messages:vector-skin-desc','s:198:\"en:Provides 2 Vector skins:\n* 2011 - The Modern version of MonoBook with fresh look and many usability improvements.\n* 2022 - The Vector built as part of the WMF [[mw:Desktop Improvements]] project.\";'),('en','messages:vector-specialversion-name','s:9:\"en:Vector\";'),('en','messages:vector-toc-beginning','s:12:\"en:Beginning\";'),('en','messages:vector-toc-collapsible-button-label','s:31:\"en:Toggle the table of contents\";'),('en','messages:vector-toc-label','s:11:\"en:Contents\";'),('en','messages:vector-toc-menu-tooltip','s:20:\"en:Table of Contents\";'),('en','messages:vector-toc-toggle-button-label','s:23:\"en:Toggle $1 subsection\";'),('en','messages:vector-toc-unpinned-popup','s:45:\"en:The table of contents has been moved here.\";'),('en','messages:vector-unpin-element-label','s:7:\"en:hide\";'),('en','messages:vector-view-create','s:9:\"en:Create\";'),('en','messages:vector-view-edit','s:7:\"en:Edit\";'),('en','messages:vector-view-history','s:15:\"en:View history\";'),('en','messages:vector-view-view','s:7:\"en:Read\";'),('en','messages:vector-view-viewsource','s:14:\"en:View source\";'),('en','messages:vector.css','s:65:\"en:/* All CSS here will be loaded for users of the Vector skin */\";'),('en','messages:vector.js','s:72:\"en:/* All JavaScript here will be loaded for users of the Vector skin */\";'),('en','messages:verification-error','s:44:\"en:This file did not pass file verification.\";'),('en','messages:version','s:10:\"en:Version\";'),('en','messages:version-antispam','s:18:\"en:Spam prevention\";'),('en','messages:version-api','s:6:\"en:API\";'),('en','messages:version-credits-not-found','s:64:\"en:No detailed credits information was found for this extension.\";'),('en','messages:version-credits-summary','s:108:\"en:We would like to recognize the following persons for their contribution to [[Special:Version|MediaWiki]].\";'),('en','messages:version-credits-title','s:17:\"en:Credits for $1\";'),('en','messages:version-db-mariadb-url','s:23:\"en:https://mariadb.org/\";'),('en','messages:version-db-mysql-url','s:25:\"en:https://www.mysql.com/\";'),('en','messages:version-db-percona-url','s:49:\"en:http://www.percona.com/software/percona-server\";'),('en','messages:version-db-postgres-url','s:29:\"en:http://www.postgresql.org/\";'),('en','messages:version-db-sqlite-url','s:26:\"en:https://www.sqlite.org/\";'),('en','messages:version-editors','s:10:\"en:Editors\";'),('en','messages:version-entrypoints','s:19:\"en:Entry point URLs\";'),('en','messages:version-entrypoints-api-php','s:77:\"en:[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:api.php api.php]\";'),('en','messages:version-entrypoints-articlepath','s:89:\"en:[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgArticlePath Article path]\";'),('en','messages:version-entrypoints-header-entrypoint','s:14:\"en:Entry point\";'),('en','messages:version-entrypoints-header-url','s:6:\"en:URL\";'),('en','messages:version-entrypoints-index-php','s:81:\"en:[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:index.php index.php]\";'),('en','messages:version-entrypoints-rest-php','s:79:\"en:[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:rest.php rest.php]\";'),('en','messages:version-entrypoints-scriptpath','s:87:\"en:[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgScriptPath Script path]\";'),('en','messages:version-ext-colheader-credits','s:10:\"en:Authors\";'),('en','messages:version-ext-colheader-description','s:14:\"en:Description\";'),('en','messages:version-ext-colheader-license','s:10:\"en:License\";'),('en','messages:version-ext-colheader-name','s:12:\"en:Extension\";'),('en','messages:version-ext-colheader-version','s:10:\"en:Version\";'),('en','messages:version-ext-license','s:10:\"en:License\";'),('en','messages:version-extensions','s:23:\"en:Installed extensions\";'),('en','messages:version-extensions-no-ext','s:37:\"en:No extensions currently installed.\";'),('en','messages:version-hook-name','s:12:\"en:Hook name\";'),('en','messages:version-hook-subscribedby','s:16:\"en:Subscribed by\";'),('en','messages:version-hooks','s:8:\"en:Hooks\";'),('en','messages:version-libraries','s:22:\"en:Installed libraries\";'),('en','messages:version-libraries-authors','s:10:\"en:Authors\";'),('en','messages:version-libraries-client','s:34:\"en:Installed client-side libraries\";'),('en','messages:version-libraries-description','s:14:\"en:Description\";'),('en','messages:version-libraries-library','s:10:\"en:Library\";'),('en','messages:version-libraries-license','s:10:\"en:License\";'),('en','messages:version-libraries-source','s:9:\"en:Source\";'),('en','messages:version-libraries-version','s:10:\"en:Version\";'),('en','messages:version-license','s:20:\"en:MediaWiki License\";'),('en','messages:version-license-info','s:823:\"en:MediaWiki is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.\n\nMediaWiki is distributed in the hope that it will be useful, but <em>WITHOUT ANY WARRANTY</em>; without even the implied warranty of <strong>MERCHANTABILITY</strong> or <strong>FITNESS FOR A PARTICULAR PURPOSE</strong>. See the GNU General Public License for more details.\n\nYou should have received [{{SERVER}}{{SCRIPTPATH}}/COPYING a copy of the GNU General Public License] along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA or [//www.gnu.org/licenses/old-licenses/gpl-2.0.html read it online].\";'),('en','messages:version-license-not-found','s:64:\"en:No detailed license information was found for this extension.\";'),('en','messages:version-license-title','s:17:\"en:License for $1\";'),('en','messages:version-mediahandlers','s:17:\"en:Media handlers\";'),('en','messages:version-no-ext-name','s:12:\"en:[no name]\";'),('en','messages:version-other','s:8:\"en:Other\";'),('en','messages:version-parser-extensiontags','s:24:\"en:Parser extension tags\";'),('en','messages:version-parser-function-hooks','s:24:\"en:Parser function hooks\";'),('en','messages:version-parserhooks','s:15:\"en:Parser hooks\";'),('en','messages:version-poweredby-credits','s:108:\"en:This wiki is powered by <strong>[https://www.mediawiki.org/ MediaWiki]</strong>, copyright © 2001-$1 $2.\";'),('en','messages:version-poweredby-others','s:9:\"en:others\";'),('en','messages:version-poweredby-translators','s:32:\"en:translatewiki.net translators\";'),('en','messages:version-poweredby-various','s:18:\"en:Various authors\";'),('en','messages:version-skin-colheader-name','s:7:\"en:Skin\";'),('en','messages:version-skins','s:18:\"en:Installed skins\";'),('en','messages:version-skins-no-skin','s:32:\"en:No skins currently installed.\";'),('en','messages:version-software','s:21:\"en:Installed software\";'),('en','messages:version-software-product','s:10:\"en:Product\";'),('en','messages:version-software-version','s:10:\"en:Version\";'),('en','messages:version-specialpages','s:16:\"en:Special pages\";'),('en','messages:version-summary','s:3:\"en:\";'),('en','messages:version-variables','s:12:\"en:Variables\";'),('en','messages:version-version','s:7:\"en:($1)\";'),('en','messages:versionrequired','s:35:\"en:Version $1 of MediaWiki required\";'),('en','messages:versionrequiredtext','s:94:\"en:Version $1 of MediaWiki is required to use this page.\nSee [[Special:Version|version page]].\";'),('en','messages:video-dims','s:15:\"en:$1, $2 × $3\";'),('en','messages:view','s:7:\"en:View\";'),('en','messages:view-missing-pages','s:21:\"en:View missing pages\";'),('en','messages:view-pool-contention','s:18:\"en:pool contention\";'),('en','messages:view-pool-dirty-output','s:26:\"en:parser cache is expired\";'),('en','messages:view-pool-error','s:162:\"en:Sorry, the servers are overloaded at the moment.\nToo many users are trying to view this page.\nPlease wait a while before you try to access this page again.\n\n$1\";'),('en','messages:view-pool-timeout','s:16:\"en:pool overload\";'),('en','messages:viewcontribs','s:21:\"en:View contributions\";'),('en','messages:viewcount','s:59:\"en:This page has been accessed {{PLURAL:$1|once|$1 times}}.\";'),('en','messages:viewdeleted','s:11:\"en:View $1?\";'),('en','messages:viewdeleted_short','s:55:\"en:View {{PLURAL:$1|one deleted edit|$1 deleted edits}}\";'),('en','messages:viewdeletedpage','s:21:\"en:View deleted pages\";'),('en','messages:viewhelppage','s:17:\"en:View help page\";'),('en','messages:viewinguserrights','s:79:\"en:Viewing user groups of {{GENDER:$1|user}} <strong>[[User:$1|$1]]</strong> $2\";'),('en','messages:viewpagelogs','s:26:\"en:View logs for this page\";'),('en','messages:viewpagelogs-lowercase','s:26:\"en:view logs for this page\";'),('en','messages:viewprevnext','s:43:\"en:View ($1 {{int:pipe-separator}} $2) ($3)\";'),('en','messages:views','s:8:\"en:Views\";'),('en','messages:viewsource','s:14:\"en:View source\";'),('en','messages:viewsource-title','s:21:\"en:View source for $1\";'),('en','messages:viewsourcelink','s:14:\"en:view source\";'),('en','messages:viewsourceold','s:14:\"en:view source\";'),('en','messages:viewsourcetext','s:49:\"en:You can view and copy the source of this page.\";'),('en','messages:viewtalkpage','s:18:\"en:View discussion\";'),('en','messages:viewyourtext','s:80:\"en:You can view and copy the source of <strong>your edits</strong> to this page.\";'),('en','messages:virus-badscanner','s:56:\"en:Bad configuration: Unknown virus scanner: <em>$1</em>\";'),('en','messages:virus-scanfailed','s:24:\"en:scan failed (code $1)\";'),('en','messages:virus-unknownscanner','s:21:\"en:unknown antivirus:\";'),('en','messages:wantedcategories','s:20:\"en:Wanted categories\";'),('en','messages:wantedcategories-summary','s:3:\"en:\";'),('en','messages:wantedfiles','s:15:\"en:Wanted files\";'),('en','messages:wantedfiles-summary','s:3:\"en:\";'),('en','messages:wantedfiletext-cat','s:247:\"en:The following files are used but do not exist. Files from foreign repositories may be listed despite existing. Any such false positives will be <del>struck out</del>. Additionally, pages that embed files that do not exist are listed in [[:$1]].\";'),('en','messages:wantedfiletext-cat-noforeign','s:127:\"en:The following files are used but do not exist. Additionally, pages that embed files that do not exist are listed in [[:$1]].\";'),('en','messages:wantedfiletext-nocat','s:169:\"en:The following files are used but do not exist. Files from foreign repositories may be listed despite existing. Any such false positives will be <del>struck out</del>.\";'),('en','messages:wantedfiletext-nocat-noforeign','s:49:\"en:The following files are used but do not exist.\";'),('en','messages:wantedpages','s:15:\"en:Wanted pages\";'),('en','messages:wantedpages-badtitle','s:34:\"en:Invalid title in result set: $1\";'),('en','messages:wantedpages-summary','s:254:\"en:List of non-existing pages with the most links to them, excluding pages which only have redirects linking to them. For a list of non-existent pages that have redirects linking to them, see [[{{#special:BrokenRedirects}}|the list of broken redirects]].\";'),('en','messages:wantedtemplates','s:19:\"en:Wanted templates\";'),('en','messages:wantedtemplates-summary','s:3:\"en:\";'),('en','messages:watch','s:8:\"en:Watch\";'),('en','messages:watching','s:14:\"en:Watching...\";'),('en','messages:watchlist','s:12:\"en:Watchlist\";'),('en','messages:watchlist-details','s:77:\"en:{{PLURAL:$1|$1 page is|$1 pages are}} on your Watchlist (plus talk pages).\";'),('en','messages:watchlist-expires-in-aria-label','s:26:\"en:Expiring watchlist item\";'),('en','messages:watchlist-expiring-days-full-text','s:53:\"en:{{PLURAL:$1|1 day|$1 days}} left in your watchlist\";'),('en','messages:watchlist-expiring-hours-full-text','s:37:\"en:A few hours left in your watchlist\";'),('en','messages:watchlist-expiry-days-left','s:36:\"en:{{PLURAL:$1|$1 day|$1 days}} left\";'),('en','messages:watchlist-expiry-hours-left','s:19:\"en:A few hours left\";'),('en','messages:watchlist-expiry-options','s:101:\"en:Permanent:infinite,1 week:1 week,1 month:1 month,3 months:3 months,6 months:6 months,1 year:1 year\";'),('en','messages:watchlist-hide','s:7:\"en:Hide\";'),('en','messages:watchlist-options','s:20:\"en:Watchlist options\";'),('en','messages:watchlist-submit','s:7:\"en:Show\";'),('en','messages:watchlist-summary','s:3:\"en:\";'),('en','messages:watchlist-unwatch','s:5:\"en:×\";'),('en','messages:watchlist-unwatch-undo','s:4:\"en:+\";'),('en','messages:watchlistanontext','s:57:\"en:Please log in to view or edit items on your watchlist.\";'),('en','messages:watchlistedit-clear-done','s:35:\"en:Your watchlist has been cleared.\";'),('en','messages:watchlistedit-clear-explain','s:56:\"en:All of the titles will be removed from your watchlist\";'),('en','messages:watchlistedit-clear-jobqueue','s:60:\"en:Your watchlist is being cleared. This may take some time!\";'),('en','messages:watchlistedit-clear-legend','s:18:\"en:Clear watchlist\";'),('en','messages:watchlistedit-clear-removed','s:52:\"en:{{PLURAL:$1|1 title was|$1 titles were}} removed:\";'),('en','messages:watchlistedit-clear-submit','s:43:\"en:Clear the watchlist (This is permanent!)\";'),('en','messages:watchlistedit-clear-title','s:18:\"en:Clear watchlist\";'),('en','messages:watchlistedit-clear-titles','s:10:\"en:Titles:\";'),('en','messages:watchlistedit-normal-check-all','s:12:\"en:Check all\";'),('en','messages:watchlistedit-normal-done','s:79:\"en:{{PLURAL:$1|A single title was|$1 titles were}} removed from your watchlist:\";'),('en','messages:watchlistedit-normal-explain','s:200:\"en:Titles on your watchlist are shown below.\nTo remove a title, check the box next to it, and click \"{{int:Watchlistedit-normal-submit}}\".\nYou can also [[Special:EditWatchlist/raw|edit the raw list]].\";'),('en','messages:watchlistedit-normal-legend','s:31:\"en:Remove titles from watchlist\";'),('en','messages:watchlistedit-normal-submit','s:16:\"en:Remove titles\";'),('en','messages:watchlistedit-normal-title','s:17:\"en:Edit watchlist\";'),('en','messages:watchlistedit-raw-added','s:50:\"en:{{PLURAL:$1|1 title was|$1 titles were}} added:\";'),('en','messages:watchlistedit-raw-done','s:35:\"en:Your watchlist has been updated.\";'),('en','messages:watchlistedit-raw-explain','s:244:\"en:Titles on your watchlist are shown below, and can be edited by adding to and removing from the list;\none title per line.\nWhen finished, click \"{{int:Watchlistedit-raw-submit}}\".\nYou can also [[Special:EditWatchlist|use the standard editor]].\";'),('en','messages:watchlistedit-raw-legend','s:21:\"en:Edit raw watchlist\";'),('en','messages:watchlistedit-raw-removed','s:52:\"en:{{PLURAL:$1|1 title was|$1 titles were}} removed:\";'),('en','messages:watchlistedit-raw-submit','s:19:\"en:Update watchlist\";'),('en','messages:watchlistedit-raw-title','s:21:\"en:Edit raw watchlist\";'),('en','messages:watchlistedit-raw-titles','s:10:\"en:Titles:\";'),('en','messages:watchlistedit-too-many','s:77:\"en:Your watchlist has been updated. There are too many pages to display here.\";'),('en','messages:watchlistfor2','s:9:\"en:For $1\";'),('en','messages:watchlistnotwatchable','s:25:\"en:Page is not watchable.\";'),('en','messages:watchlisttools-clear','s:22:\"en:Clear the watchlist\";'),('en','messages:watchlisttools-edit','s:26:\"en:View and edit watchlist\";'),('en','messages:watchlisttools-raw','s:21:\"en:Edit raw watchlist\";'),('en','messages:watchlisttools-view','s:24:\"en:View relevant changes\";'),('en','messages:watchnologin','s:16:\"en:Not logged in\";'),('en','messages:watchthis','s:18:\"en:Watch this page\";'),('en','messages:watchthispage','s:18:\"en:Watch this page\";'),('en','messages:watchthisupload','s:18:\"en:Watch this file\";'),('en','messages:wed','s:6:\"en:Wed\";'),('en','messages:wednesday','s:12:\"en:Wednesday\";'),('en','messages:wednesday-at','s:18:\"en:Wednesday at $1\";'),('en','messages:weeks','s:33:\"en:{{PLURAL:$1|$1 week|$1 weeks}}\";'),('en','messages:welcomecreation-msg','s:115:\"en:Your account has been created.\nYou can change your {{SITENAME}} [[Special:Preferences|preferences]] if you wish.\";'),('en','messages:welcomeuser','s:15:\"en:Welcome, $1!\";'),('en','messages:whatlinkshere','s:18:\"en:What links here\";'),('en','messages:whatlinkshere-count','s:41:\"en:Displayed $1 {{PLURAL:$1|item|items}}.\";'),('en','messages:whatlinkshere-hideimages','s:18:\"en:Hide file links\";'),('en','messages:whatlinkshere-hidelinks','s:13:\"en:Hide links\";'),('en','messages:whatlinkshere-hideredirs','s:17:\"en:Hide redirects\";'),('en','messages:whatlinkshere-hidetrans','s:21:\"en:Hide transclusions\";'),('en','messages:whatlinkshere-links','s:12:\"en:← links\";'),('en','messages:whatlinkshere-next','s:29:\"en:{{PLURAL:$1|next|next $1}}\";'),('en','messages:whatlinkshere-page','s:8:\"en:Page:\";'),('en','messages:whatlinkshere-prev','s:37:\"en:{{PLURAL:$1|previous|previous $1}}\";'),('en','messages:whatlinkshere-sectionredir','s:27:\"en:redirect to section \"$1\"\";'),('en','messages:whatlinkshere-submit','s:5:\"en:Go\";'),('en','messages:whatlinkshere-summary','s:3:\"en:\";'),('en','messages:whatlinkshere-title','s:26:\"en:Pages that link to \"$1\"\";'),('en','messages:whitelistedittext','s:27:\"en:Please $1 to edit pages.\";'),('en','messages:widthheight','s:11:\"en:$1 × $2\";'),('en','messages:widthheightpage','s:40:\"en:$1 × $2, $3 {{PLURAL:$3|page|pages}}\";'),('en','messages:windows-nonascii-filename','s:64:\"en:This wiki does not support filenames with special characters.\";'),('en','messages:withoutinterwiki','s:31:\"en:Pages without language links\";'),('en','messages:withoutinterwiki-legend','s:9:\"en:Prefix\";'),('en','messages:withoutinterwiki-submit','s:7:\"en:Show\";'),('en','messages:withoutinterwiki-summary','s:62:\"en:The following pages do not link to other language versions.\";'),('en','messages:wlheader-enotif','s:33:\"en:Email notification is enabled.\";'),('en','messages:wlheader-showupdated','s:95:\"en:Pages that have been changed since you last visited them are shown in <strong>bold</strong>.\";'),('en','messages:wlnote','s:154:\"en:Below {{PLURAL:$1|is the last change|are the last <strong>$1</strong> changes}} in the last {{PLURAL:$2|hour|<strong>$2</strong> hours}}, as of $3, $4.\";'),('en','messages:wlshowhideanons','s:18:\"en:anonymous users\";'),('en','messages:wlshowhidebots','s:7:\"en:bots\";'),('en','messages:wlshowhidecategorization','s:22:\"en:page categorization\";'),('en','messages:wlshowhideliu','s:19:\"en:registered users\";'),('en','messages:wlshowhidemine','s:11:\"en:my edits\";'),('en','messages:wlshowhideminor','s:14:\"en:minor edits\";'),('en','messages:wlshowhidepatr','s:18:\"en:patrolled edits\";'),('en','messages:wlshowtime','s:29:\"en:Period of time to display:\";'),('en','messages:word-separator','s:8:\"en:&#32;\";'),('en','messages:wrongpassword','s:60:\"en:Incorrect username or password entered.\nPlease try again.\";'),('en','messages:wrongpasswordempty','s:48:\"en:Password entered was blank.\nPlease try again.\";'),('en','messages:xffblockreason','s:161:\"en:An IP address present in the X-Forwarded-For header, either yours or that of a proxy server you are using, has been blocked. The original block reason was: $1\";'),('en','messages:xml-error-string','s:38:\"en:$1 at line $2, col $3 (byte $4): $5\";'),('en','messages:year','s:27:\"en:From year (and earlier):\";'),('en','messages:years','s:33:\"en:{{PLURAL:$1|$1 year|$1 years}}\";'),('en','messages:yesterday-at','s:18:\"en:Yesterday at $1\";'),('en','messages:youhavenewmessages','s:34:\"en:{{PLURAL:$3|You have}} $1 ($2).\";'),('en','messages:youhavenewmessagesfromusers','s:75:\"en:{{PLURAL:$4|You have}} $1 from {{PLURAL:$3|another user|$3 users}} ($2).\";'),('en','messages:youhavenewmessagesmanyusers','s:36:\"en:You have $1 from many users ($2).\";'),('en','messages:yourdiff','s:14:\"en:Differences\";'),('en','messages:yourdomainname','s:15:\"en:Your domain:\";'),('en','messages:youremail','s:9:\"en:Email:\";'),('en','messages:yourgender','s:37:\"en:How do you prefer to be described?\";'),('en','messages:yourlanguage','s:12:\"en:Language:\";'),('en','messages:yourname','s:12:\"en:Username:\";'),('en','messages:yournick','s:17:\"en:New signature:\";'),('en','messages:yourpassword','s:12:\"en:Password:\";'),('en','messages:yourpasswordagain','s:19:\"en:Retype password:\";'),('en','messages:yourrealname','s:13:\"en:Real name:\";'),('en','messages:yourtext','s:12:\"en:Your text\";'),('en','messages:yourvariant','s:28:\"en:Content language variant:\";'),('en','messages:zip-bad','s:102:\"en:The file is a corrupt or otherwise unreadable ZIP file.\nIt cannot be properly checked for security.\";'),('en','messages:zip-file-open-error','s:65:\"en:An error was encountered when opening the file for ZIP checks.\";'),('en','messages:zip-unsupported','s:120:\"en:The file is a ZIP file that uses ZIP features not supported by MediaWiki.\nIt cannot be properly checked for security.\";'),('en','messages:zip-wrong-format','s:41:\"en:The specified file was not a ZIP file.\";'),('en','minimumGroupingDigits','i:1;'),('en','namespaceAliases','a:2:{s:5:\"Image\";i:6;s:10:\"Image_talk\";i:7;}'),('en','namespaceGenderAliases','a:0:{}'),('en','namespaceNames','a:17:{i:-2;s:5:\"Media\";i:-1;s:7:\"Special\";i:0;s:0:\"\";i:1;s:4:\"Talk\";i:2;s:4:\"User\";i:3;s:9:\"User_talk\";i:5;s:7:\"$1_talk\";i:6;s:4:\"File\";i:7;s:9:\"File_talk\";i:8;s:9:\"MediaWiki\";i:9;s:14:\"MediaWiki_talk\";i:10;s:8:\"Template\";i:11;s:13:\"Template_talk\";i:12;s:4:\"Help\";i:13;s:9:\"Help_talk\";i:14;s:8:\"Category\";i:15;s:13:\"Category_talk\";}'),('en','originalFallbackSequence','a:0:{}'),('en','pluralRuleTypes','a:1:{i:0;s:3:\"one\";}'),('en','pluralRules','a:1:{i:0;s:26:\"i = 1 and v = 0 @integer 1\";}'),('en','preload','a:3:{s:8:\"messages\";a:111:{s:9:\"aboutpage\";s:16:\"en:Project:About\";s:9:\"aboutsite\";s:21:\"en:About {{SITENAME}}\";s:17:\"accesskey-ca-edit\";s:4:\"en:e\";s:20:\"accesskey-ca-history\";s:4:\"en:h\";s:23:\"accesskey-ca-nstab-main\";s:4:\"en:c\";s:17:\"accesskey-ca-talk\";s:4:\"en:t\";s:23:\"accesskey-ca-viewsource\";s:4:\"en:e\";s:25:\"accesskey-n-currentevents\";s:3:\"en:\";s:16:\"accesskey-n-help\";s:3:\"en:\";s:32:\"accesskey-n-mainpage-description\";s:4:\"en:z\";s:18:\"accesskey-n-portal\";s:3:\"en:\";s:22:\"accesskey-n-randompage\";s:4:\"en:x\";s:25:\"accesskey-n-recentchanges\";s:4:\"en:r\";s:16:\"accesskey-p-logo\";s:3:\"en:\";s:18:\"accesskey-pt-login\";s:4:\"en:o\";s:26:\"accesskey-pt-createaccount\";s:3:\"en:\";s:16:\"accesskey-search\";s:4:\"en:f\";s:25:\"accesskey-search-fulltext\";s:3:\"en:\";s:19:\"accesskey-search-go\";s:3:\"en:\";s:16:\"accesskey-t-info\";s:3:\"en:\";s:21:\"accesskey-t-permalink\";s:3:\"en:\";s:17:\"accesskey-t-print\";s:4:\"en:p\";s:31:\"accesskey-t-recentchangeslinked\";s:4:\"en:k\";s:24:\"accesskey-t-specialpages\";s:4:\"en:q\";s:25:\"accesskey-t-whatlinkshere\";s:4:\"en:j\";s:7:\"actions\";s:10:\"en:Actions\";s:10:\"anonnotice\";s:4:\"en:-\";s:8:\"brackets\";s:7:\"en:[$1]\";s:15:\"comma-separator\";s:9:\"en:,&#32;\";s:13:\"currentevents\";s:17:\"en:Current events\";s:17:\"currentevents-url\";s:25:\"en:Project:Current events\";s:14:\"disclaimerpage\";s:29:\"en:Project:General disclaimer\";s:11:\"disclaimers\";s:14:\"en:Disclaimers\";s:4:\"edit\";s:7:\"en:Edit\";s:11:\"editsection\";s:7:\"en:edit\";s:15:\"editsectionhint\";s:19:\"en:Edit section: $1\";s:4:\"help\";s:7:\"en:Help\";s:8:\"helppage\";s:66:\"en:https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents\";s:24:\"interlanguage-link-title\";s:12:\"en:$1 – $2\";s:6:\"jumpto\";s:11:\"en:Jump to:\";s:16:\"jumptonavigation\";s:13:\"en:navigation\";s:12:\"jumptosearch\";s:9:\"en:search\";s:14:\"lastmodifiedat\";s:42:\"en:This page was last edited on $1, at $2.\";s:8:\"mainpage\";s:12:\"en:Main Page\";s:20:\"mainpage-description\";s:12:\"en:Main page\";s:14:\"mainpage-nstab\";s:12:\"en:Main page\";s:10:\"namespaces\";s:13:\"en:Namespaces\";s:10:\"navigation\";s:13:\"en:Navigation\";s:23:\"nav-login-createaccount\";s:26:\"en:Log in / create account\";s:10:\"nstab-main\";s:7:\"en:Page\";s:15:\"opensearch-desc\";s:37:\"en:{{SITENAME}} ({{CONTENTLANGUAGE}})\";s:14:\"pagecategories\";s:36:\"en:{{PLURAL:$1|Category|Categories}}\";s:18:\"pagecategorieslink\";s:21:\"en:Special:Categories\";s:9:\"pagetitle\";s:20:\"en:$1 - {{SITENAME}}\";s:23:\"pagetitle-view-mainpage\";s:15:\"en:{{SITENAME}}\";s:9:\"permalink\";s:17:\"en:Permanent link\";s:13:\"personaltools\";s:17:\"en:Personal tools\";s:6:\"portal\";s:19:\"en:Community portal\";s:10:\"portal-url\";s:27:\"en:Project:Community portal\";s:16:\"printableversion\";s:20:\"en:Printable version\";s:7:\"privacy\";s:17:\"en:Privacy policy\";s:11:\"privacypage\";s:25:\"en:Project:Privacy policy\";s:10:\"randompage\";s:14:\"en:Random page\";s:14:\"randompage-url\";s:17:\"en:Special:Random\";s:13:\"recentchanges\";s:17:\"en:Recent changes\";s:27:\"recentchangeslinked-toolbox\";s:18:\"en:Related changes\";s:17:\"recentchanges-url\";s:24:\"en:Special:RecentChanges\";s:13:\"retrievedfrom\";s:22:\"en:Retrieved from \"$1\"\";s:6:\"search\";s:9:\"en:Search\";s:13:\"searcharticle\";s:5:\"en:Go\";s:12:\"searchbutton\";s:9:\"en:Search\";s:20:\"searchsuggest-search\";s:22:\"en:Search {{SITENAME}}\";s:7:\"sidebar\";s:171:\"en:\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* SEARCH\n* TOOLBOX\n* LANGUAGES\";s:18:\"navigation-heading\";s:18:\"en:Navigation menu\";s:14:\"site-atom-feed\";s:15:\"en:$1 Atom feed\";s:10:\"sitenotice\";s:4:\"en:-\";s:12:\"specialpages\";s:16:\"en:Special pages\";s:7:\"tagline\";s:20:\"en:From {{SITENAME}}\";s:4:\"talk\";s:13:\"en:Discussion\";s:7:\"toolbox\";s:8:\"en:Tools\";s:15:\"tooltip-ca-edit\";s:17:\"en:Edit this page\";s:18:\"tooltip-ca-history\";s:30:\"en:Past revisions of this page\";s:21:\"tooltip-ca-nstab-main\";s:24:\"en:View the content page\";s:15:\"tooltip-ca-talk\";s:36:\"en:Discussion about the content page\";s:21:\"tooltip-ca-viewsource\";s:50:\"en:This page is protected.\nYou can view its source\";s:23:\"tooltip-n-currentevents\";s:48:\"en:Find background information on current events\";s:14:\"tooltip-n-help\";s:24:\"en:The place to find out\";s:30:\"tooltip-n-mainpage-description\";s:22:\"en:Visit the main page\";s:16:\"tooltip-n-portal\";s:59:\"en:About the project, what you can do, where to find things\";s:20:\"tooltip-n-randompage\";s:21:\"en:Load a random page\";s:23:\"tooltip-n-recentchanges\";s:39:\"en:A list of recent changes in the wiki\";s:14:\"tooltip-p-logo\";s:22:\"en:Visit the main page\";s:16:\"tooltip-pt-login\";s:61:\"en:You are encouraged to log in; however, it is not mandatory\";s:24:\"tooltip-pt-createaccount\";s:83:\"en:You are encouraged to create an account and log in; however, it is not mandatory\";s:14:\"tooltip-search\";s:22:\"en:Search {{SITENAME}}\";s:23:\"tooltip-search-fulltext\";s:33:\"en:Search the pages for this text\";s:17:\"tooltip-search-go\";s:49:\"en:Go to a page with this exact name if it exists\";s:14:\"tooltip-t-info\";s:35:\"en:More information about this page\";s:19:\"tooltip-t-permalink\";s:47:\"en:Permanent link to this revision of this page\";s:15:\"tooltip-t-print\";s:33:\"en:Printable version of this page\";s:29:\"tooltip-t-recentchangeslinked\";s:48:\"en:Recent changes in pages linked from this page\";s:22:\"tooltip-t-specialpages\";s:30:\"en:A list of all special pages\";s:23:\"tooltip-t-whatlinkshere\";s:42:\"en:A list of all wiki pages that link here\";s:8:\"variants\";s:11:\"en:Variants\";s:16:\"vector-view-edit\";s:7:\"en:Edit\";s:19:\"vector-view-history\";s:15:\"en:View history\";s:16:\"vector-view-view\";s:7:\"en:Read\";s:9:\"viewcount\";s:59:\"en:This page has been accessed {{PLURAL:$1|once|$1 times}}.\";s:5:\"views\";s:8:\"en:Views\";s:13:\"whatlinkshere\";s:18:\"en:What links here\";s:14:\"word-separator\";s:8:\"en:&#32;\";}s:11:\"dateFormats\";a:20:{s:8:\"mdy time\";s:3:\"H:i\";s:8:\"mdy date\";s:6:\"F j, Y\";s:13:\"mdy monthonly\";s:3:\"F Y\";s:8:\"mdy both\";s:11:\"H:i, F j, Y\";s:10:\"mdy pretty\";s:3:\"F j\";s:8:\"dmy time\";s:3:\"H:i\";s:8:\"dmy date\";s:5:\"j F Y\";s:13:\"dmy monthonly\";s:3:\"F Y\";s:8:\"dmy both\";s:10:\"H:i, j F Y\";s:10:\"dmy pretty\";s:3:\"j F\";s:8:\"ymd time\";s:3:\"H:i\";s:8:\"ymd date\";s:5:\"Y F j\";s:13:\"ymd monthonly\";s:3:\"Y F\";s:8:\"ymd both\";s:10:\"H:i, Y F j\";s:10:\"ymd pretty\";s:3:\"F j\";s:13:\"ISO 8601 time\";s:11:\"xnH:xni:xns\";s:13:\"ISO 8601 date\";s:11:\"xnY-xnm-xnd\";s:18:\"ISO 8601 monthonly\";s:7:\"xnY-xnm\";s:13:\"ISO 8601 both\";s:25:\"xnY-xnm-xnd\"T\"xnH:xni:xns\";s:15:\"ISO 8601 pretty\";s:7:\"xnm-xnd\";}s:14:\"namespaceNames\";a:17:{i:-2;s:5:\"Media\";i:-1;s:7:\"Special\";i:0;s:0:\"\";i:1;s:4:\"Talk\";i:2;s:4:\"User\";i:3;s:9:\"User_talk\";i:5;s:7:\"$1_talk\";i:6;s:4:\"File\";i:7;s:9:\"File_talk\";i:8;s:9:\"MediaWiki\";i:9;s:14:\"MediaWiki_talk\";i:10;s:8:\"Template\";i:11;s:13:\"Template_talk\";i:12;s:4:\"Help\";i:13;s:9:\"Help_talk\";i:14;s:8:\"Category\";i:15;s:13:\"Category_talk\";}}'),('en','preloadedMessages','a:111:{i:0;s:9:\"aboutpage\";i:1;s:9:\"aboutsite\";i:2;s:17:\"accesskey-ca-edit\";i:3;s:20:\"accesskey-ca-history\";i:4;s:23:\"accesskey-ca-nstab-main\";i:5;s:17:\"accesskey-ca-talk\";i:6;s:23:\"accesskey-ca-viewsource\";i:7;s:25:\"accesskey-n-currentevents\";i:8;s:16:\"accesskey-n-help\";i:9;s:32:\"accesskey-n-mainpage-description\";i:10;s:18:\"accesskey-n-portal\";i:11;s:22:\"accesskey-n-randompage\";i:12;s:25:\"accesskey-n-recentchanges\";i:13;s:16:\"accesskey-p-logo\";i:14;s:18:\"accesskey-pt-login\";i:15;s:26:\"accesskey-pt-createaccount\";i:16;s:16:\"accesskey-search\";i:17;s:25:\"accesskey-search-fulltext\";i:18;s:19:\"accesskey-search-go\";i:19;s:16:\"accesskey-t-info\";i:20;s:21:\"accesskey-t-permalink\";i:21;s:17:\"accesskey-t-print\";i:22;s:31:\"accesskey-t-recentchangeslinked\";i:23;s:24:\"accesskey-t-specialpages\";i:24;s:25:\"accesskey-t-whatlinkshere\";i:25;s:7:\"actions\";i:26;s:10:\"anonnotice\";i:27;s:8:\"brackets\";i:28;s:15:\"comma-separator\";i:29;s:13:\"currentevents\";i:30;s:17:\"currentevents-url\";i:31;s:14:\"disclaimerpage\";i:32;s:11:\"disclaimers\";i:33;s:4:\"edit\";i:34;s:11:\"editsection\";i:35;s:15:\"editsectionhint\";i:36;s:4:\"help\";i:37;s:8:\"helppage\";i:38;s:24:\"interlanguage-link-title\";i:39;s:6:\"jumpto\";i:40;s:16:\"jumptonavigation\";i:41;s:12:\"jumptosearch\";i:42;s:14:\"lastmodifiedat\";i:43;s:8:\"mainpage\";i:44;s:20:\"mainpage-description\";i:45;s:14:\"mainpage-nstab\";i:46;s:10:\"namespaces\";i:47;s:10:\"navigation\";i:48;s:23:\"nav-login-createaccount\";i:49;s:10:\"nstab-main\";i:50;s:15:\"opensearch-desc\";i:51;s:14:\"pagecategories\";i:52;s:18:\"pagecategorieslink\";i:53;s:9:\"pagetitle\";i:54;s:23:\"pagetitle-view-mainpage\";i:55;s:9:\"permalink\";i:56;s:13:\"personaltools\";i:57;s:6:\"portal\";i:58;s:10:\"portal-url\";i:59;s:16:\"printableversion\";i:60;s:7:\"privacy\";i:61;s:11:\"privacypage\";i:62;s:10:\"randompage\";i:63;s:14:\"randompage-url\";i:64;s:13:\"recentchanges\";i:65;s:27:\"recentchangeslinked-toolbox\";i:66;s:17:\"recentchanges-url\";i:67;s:13:\"retrievedfrom\";i:68;s:6:\"search\";i:69;s:13:\"searcharticle\";i:70;s:12:\"searchbutton\";i:71;s:20:\"searchsuggest-search\";i:72;s:7:\"sidebar\";i:73;s:18:\"navigation-heading\";i:74;s:14:\"site-atom-feed\";i:75;s:10:\"sitenotice\";i:76;s:12:\"specialpages\";i:77;s:7:\"tagline\";i:78;s:4:\"talk\";i:79;s:7:\"toolbox\";i:80;s:15:\"tooltip-ca-edit\";i:81;s:18:\"tooltip-ca-history\";i:82;s:21:\"tooltip-ca-nstab-main\";i:83;s:15:\"tooltip-ca-talk\";i:84;s:21:\"tooltip-ca-viewsource\";i:85;s:23:\"tooltip-n-currentevents\";i:86;s:14:\"tooltip-n-help\";i:87;s:30:\"tooltip-n-mainpage-description\";i:88;s:16:\"tooltip-n-portal\";i:89;s:20:\"tooltip-n-randompage\";i:90;s:23:\"tooltip-n-recentchanges\";i:91;s:14:\"tooltip-p-logo\";i:92;s:16:\"tooltip-pt-login\";i:93;s:24:\"tooltip-pt-createaccount\";i:94;s:14:\"tooltip-search\";i:95;s:23:\"tooltip-search-fulltext\";i:96;s:17:\"tooltip-search-go\";i:97;s:14:\"tooltip-t-info\";i:98;s:19:\"tooltip-t-permalink\";i:99;s:15:\"tooltip-t-print\";i:100;s:29:\"tooltip-t-recentchangeslinked\";i:101;s:22:\"tooltip-t-specialpages\";i:102;s:23:\"tooltip-t-whatlinkshere\";i:103;s:8:\"variants\";i:104;s:16:\"vector-view-edit\";i:105;s:19:\"vector-view-history\";i:106;s:16:\"vector-view-view\";i:107;s:9:\"viewcount\";i:108;s:5:\"views\";i:109;s:13:\"whatlinkshere\";i:110;s:14:\"word-separator\";}'),('en','rtl','b:0;'),('en','separatorTransformTable','N;'),('en','specialPageAliases','a:135:{s:11:\"Activeusers\";a:1:{i:0;s:11:\"ActiveUsers\";}s:11:\"Allmessages\";a:1:{i:0;s:11:\"AllMessages\";}s:12:\"AllMyUploads\";a:2:{i:0;s:12:\"AllMyUploads\";i:1;s:10:\"AllMyFiles\";}s:8:\"Allpages\";a:1:{i:0;s:8:\"AllPages\";}s:12:\"Ancientpages\";a:1:{i:0;s:12:\"AncientPages\";}s:7:\"ApiHelp\";a:1:{i:0;s:7:\"ApiHelp\";}s:10:\"ApiSandbox\";a:1:{i:0;s:10:\"ApiSandbox\";}s:13:\"AutoblockList\";a:2:{i:0;s:13:\"AutoblockList\";i:1;s:14:\"ListAutoblocks\";}s:8:\"Badtitle\";a:1:{i:0;s:8:\"Badtitle\";}s:9:\"Blankpage\";a:1:{i:0;s:9:\"BlankPage\";}s:5:\"Block\";a:3:{i:0;s:5:\"Block\";i:1;s:7:\"BlockIP\";i:2;s:9:\"BlockUser\";}s:9:\"BlockList\";a:3:{i:0;s:9:\"BlockList\";i:1;s:10:\"ListBlocks\";i:2;s:11:\"IPBlockList\";}s:11:\"Booksources\";a:1:{i:0;s:11:\"BookSources\";}s:12:\"BotPasswords\";a:1:{i:0;s:12:\"BotPasswords\";}s:15:\"BrokenRedirects\";a:1:{i:0;s:15:\"BrokenRedirects\";}s:10:\"Categories\";a:1:{i:0;s:10:\"Categories\";}s:18:\"ChangeContentModel\";a:1:{i:0;s:18:\"ChangeContentModel\";}s:17:\"ChangeCredentials\";a:1:{i:0;s:17:\"ChangeCredentials\";}s:11:\"ChangeEmail\";a:1:{i:0;s:11:\"ChangeEmail\";}s:14:\"ChangePassword\";a:3:{i:0;s:14:\"ChangePassword\";i:1;s:9:\"ResetPass\";i:2;s:13:\"ResetPassword\";}s:12:\"ComparePages\";a:1:{i:0;s:12:\"ComparePages\";}s:12:\"Confirmemail\";a:1:{i:0;s:12:\"ConfirmEmail\";}s:10:\"Contribute\";a:1:{i:0;s:10:\"Contribute\";}s:13:\"Contributions\";a:2:{i:0;s:13:\"Contributions\";i:1;s:8:\"Contribs\";}s:13:\"CreateAccount\";a:1:{i:0;s:13:\"CreateAccount\";}s:12:\"Deadendpages\";a:1:{i:0;s:12:\"DeadendPages\";}s:20:\"DeletedContributions\";a:1:{i:0;s:20:\"DeletedContributions\";}s:10:\"DeletePage\";a:2:{i:0;s:10:\"DeletePage\";i:1;s:6:\"Delete\";}s:4:\"Diff\";a:1:{i:0;s:4:\"Diff\";}s:15:\"DoubleRedirects\";a:1:{i:0;s:15:\"DoubleRedirects\";}s:8:\"EditPage\";a:2:{i:0;s:8:\"EditPage\";i:1;s:4:\"Edit\";}s:8:\"EditTags\";a:1:{i:0;s:8:\"EditTags\";}s:13:\"EditWatchlist\";a:1:{i:0;s:13:\"EditWatchlist\";}s:9:\"Emailuser\";a:2:{i:0;s:9:\"EmailUser\";i:1;s:5:\"Email\";}s:15:\"ExpandTemplates\";a:1:{i:0;s:15:\"ExpandTemplates\";}s:6:\"Export\";a:1:{i:0;s:6:\"Export\";}s:15:\"Fewestrevisions\";a:1:{i:0;s:15:\"FewestRevisions\";}s:19:\"FileDuplicateSearch\";a:1:{i:0;s:19:\"FileDuplicateSearch\";}s:8:\"Filepath\";a:1:{i:0;s:8:\"FilePath\";}s:13:\"GoToInterwiki\";a:1:{i:0;s:13:\"GoToInterwiki\";}s:6:\"Import\";a:1:{i:0;s:6:\"Import\";}s:15:\"Invalidateemail\";a:1:{i:0;s:15:\"InvalidateEmail\";}s:14:\"JavaScriptTest\";a:1:{i:0;s:14:\"JavaScriptTest\";}s:12:\"LinkAccounts\";a:1:{i:0;s:12:\"LinkAccounts\";}s:10:\"LinkSearch\";a:1:{i:0;s:10:\"LinkSearch\";}s:10:\"Listadmins\";a:1:{i:0;s:10:\"ListAdmins\";}s:8:\"Listbots\";a:1:{i:0;s:8:\"ListBots\";}s:19:\"ListDuplicatedFiles\";a:2:{i:0;s:19:\"ListDuplicatedFiles\";i:1;s:18:\"ListFileDuplicates\";}s:9:\"Listfiles\";a:3:{i:0;s:9:\"ListFiles\";i:1;s:8:\"FileList\";i:2;s:9:\"ImageList\";}s:10:\"Listgrants\";a:1:{i:0;s:10:\"ListGrants\";}s:15:\"Listgrouprights\";a:2:{i:0;s:15:\"ListGroupRights\";i:1;s:15:\"UserGroupRights\";}s:13:\"Listredirects\";a:1:{i:0;s:13:\"ListRedirects\";}s:9:\"Listusers\";a:3:{i:0;s:9:\"ListUsers\";i:1;s:8:\"UserList\";i:2;s:5:\"Users\";}s:6:\"Lockdb\";a:1:{i:0;s:6:\"LockDB\";}s:3:\"Log\";a:2:{i:0;s:3:\"Log\";i:1;s:4:\"Logs\";}s:11:\"Lonelypages\";a:2:{i:0;s:11:\"LonelyPages\";i:1;s:13:\"OrphanedPages\";}s:9:\"Longpages\";a:1:{i:0;s:9:\"LongPages\";}s:15:\"MediaStatistics\";a:1:{i:0;s:15:\"MediaStatistics\";}s:12:\"MergeHistory\";a:1:{i:0;s:12:\"MergeHistory\";}s:10:\"MIMEsearch\";a:1:{i:0;s:10:\"MIMESearch\";}s:14:\"Mostcategories\";a:1:{i:0;s:14:\"MostCategories\";}s:10:\"Mostimages\";a:3:{i:0;s:15:\"MostLinkedFiles\";i:1;s:9:\"MostFiles\";i:2;s:10:\"MostImages\";}s:14:\"Mostinterwikis\";a:1:{i:0;s:14:\"MostInterwikis\";}s:10:\"Mostlinked\";a:2:{i:0;s:15:\"MostLinkedPages\";i:1;s:10:\"MostLinked\";}s:20:\"Mostlinkedcategories\";a:2:{i:0;s:20:\"MostLinkedCategories\";i:1;s:18:\"MostUsedCategories\";}s:19:\"Mostlinkedtemplates\";a:3:{i:0;s:20:\"MostTranscludedPages\";i:1;s:19:\"MostLinkedTemplates\";i:2;s:17:\"MostUsedTemplates\";}s:13:\"Mostrevisions\";a:1:{i:0;s:13:\"MostRevisions\";}s:8:\"Movepage\";a:1:{i:0;s:8:\"MovePage\";}s:4:\"Mute\";a:1:{i:0;s:4:\"Mute\";}s:15:\"Mycontributions\";a:2:{i:0;s:15:\"MyContributions\";i:1;s:10:\"MyContribs\";}s:10:\"MyLanguage\";a:1:{i:0;s:10:\"MyLanguage\";}s:5:\"Mylog\";a:1:{i:0;s:5:\"MyLog\";}s:6:\"Mypage\";a:1:{i:0;s:6:\"MyPage\";}s:6:\"Mytalk\";a:1:{i:0;s:6:\"MyTalk\";}s:9:\"Myuploads\";a:2:{i:0;s:9:\"MyUploads\";i:1;s:7:\"MyFiles\";}s:9:\"Newimages\";a:2:{i:0;s:8:\"NewFiles\";i:1;s:9:\"NewImages\";}s:8:\"Newpages\";a:1:{i:0;s:8:\"NewPages\";}s:10:\"NewSection\";a:2:{i:0;s:10:\"NewSection\";i:1;s:10:\"Newsection\";}s:8:\"PageData\";a:1:{i:0;s:8:\"PageData\";}s:11:\"PageHistory\";a:2:{i:0;s:11:\"PageHistory\";i:1;s:7:\"History\";}s:8:\"PageInfo\";a:2:{i:0;s:8:\"PageInfo\";i:1;s:4:\"Info\";}s:12:\"PageLanguage\";a:1:{i:0;s:12:\"PageLanguage\";}s:13:\"PagesWithProp\";a:4:{i:0;s:13:\"PagesWithProp\";i:1;s:13:\"Pageswithprop\";i:2;s:11:\"PagesByProp\";i:3;s:11:\"Pagesbyprop\";}s:16:\"PasswordPolicies\";a:1:{i:0;s:16:\"PasswordPolicies\";}s:13:\"PasswordReset\";a:1:{i:0;s:13:\"PasswordReset\";}s:13:\"PermanentLink\";a:2:{i:0;s:13:\"PermanentLink\";i:1;s:9:\"PermaLink\";}s:11:\"Preferences\";a:1:{i:0;s:11:\"Preferences\";}s:11:\"Prefixindex\";a:1:{i:0;s:11:\"PrefixIndex\";}s:14:\"Protectedpages\";a:1:{i:0;s:14:\"ProtectedPages\";}s:15:\"Protectedtitles\";a:1:{i:0;s:15:\"ProtectedTitles\";}s:11:\"ProtectPage\";a:2:{i:0;s:11:\"ProtectPage\";i:1;s:7:\"Protect\";}s:5:\"Purge\";a:1:{i:0;s:5:\"Purge\";}s:16:\"RandomInCategory\";a:1:{i:0;s:16:\"RandomInCategory\";}s:10:\"Randompage\";a:2:{i:0;s:6:\"Random\";i:1;s:10:\"RandomPage\";}s:14:\"Randomredirect\";a:1:{i:0;s:14:\"RandomRedirect\";}s:14:\"Randomrootpage\";a:1:{i:0;s:14:\"RandomRootpage\";}s:13:\"Recentchanges\";a:1:{i:0;s:13:\"RecentChanges\";}s:19:\"Recentchangeslinked\";a:2:{i:0;s:19:\"RecentChangesLinked\";i:1;s:14:\"RelatedChanges\";}s:8:\"Redirect\";a:1:{i:0;s:8:\"Redirect\";}s:17:\"RemoveCredentials\";a:1:{i:0;s:17:\"RemoveCredentials\";}s:10:\"Renameuser\";a:1:{i:0;s:10:\"RenameUser\";}s:11:\"ResetTokens\";a:1:{i:0;s:11:\"ResetTokens\";}s:14:\"Revisiondelete\";a:1:{i:0;s:14:\"RevisionDelete\";}s:7:\"RunJobs\";a:1:{i:0;s:7:\"RunJobs\";}s:6:\"Search\";a:1:{i:0;s:6:\"Search\";}s:10:\"Shortpages\";a:1:{i:0;s:10:\"ShortPages\";}s:12:\"Specialpages\";a:1:{i:0;s:12:\"SpecialPages\";}s:10:\"Statistics\";a:2:{i:0;s:10:\"Statistics\";i:1;s:5:\"Stats\";}s:4:\"Tags\";a:1:{i:0;s:4:\"Tags\";}s:18:\"TrackingCategories\";a:1:{i:0;s:18:\"TrackingCategories\";}s:7:\"Unblock\";a:1:{i:0;s:7:\"Unblock\";}s:23:\"Uncategorizedcategories\";a:1:{i:0;s:23:\"UncategorizedCategories\";}s:19:\"Uncategorizedimages\";a:2:{i:0;s:18:\"UncategorizedFiles\";i:1;s:19:\"UncategorizedImages\";}s:18:\"Uncategorizedpages\";a:1:{i:0;s:18:\"UncategorizedPages\";}s:22:\"Uncategorizedtemplates\";a:1:{i:0;s:22:\"UncategorizedTemplates\";}s:8:\"Undelete\";a:1:{i:0;s:8:\"Undelete\";}s:14:\"UnlinkAccounts\";a:1:{i:0;s:14:\"UnlinkAccounts\";}s:8:\"Unlockdb\";a:1:{i:0;s:8:\"UnlockDB\";}s:16:\"Unusedcategories\";a:1:{i:0;s:16:\"UnusedCategories\";}s:12:\"Unusedimages\";a:2:{i:0;s:11:\"UnusedFiles\";i:1;s:12:\"UnusedImages\";}s:15:\"Unusedtemplates\";a:1:{i:0;s:15:\"UnusedTemplates\";}s:14:\"Unwatchedpages\";a:1:{i:0;s:14:\"UnwatchedPages\";}s:6:\"Upload\";a:1:{i:0;s:6:\"Upload\";}s:11:\"UploadStash\";a:1:{i:0;s:11:\"UploadStash\";}s:9:\"Userlogin\";a:2:{i:0;s:9:\"UserLogin\";i:1;s:5:\"Login\";}s:10:\"Userlogout\";a:2:{i:0;s:10:\"UserLogout\";i:1;s:6:\"Logout\";}s:10:\"Userrights\";a:3:{i:0;s:10:\"UserRights\";i:1;s:9:\"MakeSysop\";i:2;s:7:\"MakeBot\";}s:7:\"Version\";a:1:{i:0;s:7:\"Version\";}s:16:\"Wantedcategories\";a:1:{i:0;s:16:\"WantedCategories\";}s:11:\"Wantedfiles\";a:1:{i:0;s:11:\"WantedFiles\";}s:11:\"Wantedpages\";a:2:{i:0;s:11:\"WantedPages\";i:1;s:11:\"BrokenLinks\";}s:15:\"Wantedtemplates\";a:1:{i:0;s:15:\"WantedTemplates\";}s:9:\"Watchlist\";a:1:{i:0;s:9:\"Watchlist\";}s:13:\"Whatlinkshere\";a:1:{i:0;s:13:\"WhatLinksHere\";}s:16:\"Withoutinterwiki\";a:1:{i:0;s:16:\"WithoutInterwiki\";}}');
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT 0,
  `ll_lang` varbinary(35) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linktarget`
--

DROP TABLE IF EXISTS `linktarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linktarget` (
  `lt_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lt_namespace` int(11) NOT NULL,
  `lt_title` varbinary(255) NOT NULL,
  PRIMARY KEY (`lt_id`),
  UNIQUE KEY `lt_namespace_title` (`lt_namespace`,`lt_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linktarget`
--

LOCK TABLES `linktarget` WRITE;
/*!40000 ALTER TABLE `linktarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `linktarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
INSERT INTO `log_search` VALUES ('associated_rev_id','1',1);
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_actor` bigint(20) unsigned NOT NULL,
  `log_namespace` int(11) NOT NULL DEFAULT 0,
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment_id` bigint(20) unsigned NOT NULL,
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`log_id`),
  KEY `log_type_time` (`log_type`,`log_timestamp`),
  KEY `log_actor_time` (`log_actor`,`log_timestamp`),
  KEY `log_page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `log_times` (`log_timestamp`),
  KEY `log_actor_type_time` (`log_actor`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `log_type_action` (`log_type`,`log_action`,`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,'create','create','20240107200858',2,0,'Main_Page',1,1,'a:1:{s:17:\"associated_rev_id\";i:1;}',0);
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  PRIMARY KEY (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
INSERT INTO `module_deps` VALUES ('mediawiki.page.ready','vector-2022|en','[\"resources/lib/codex-design-tokens/theme-wikimedia-ui.less\",\"resources/lib/codex-icons/codex-icon-paths.less\",\"resources/lib/codex/mixins/button-layout-flush.less\",\"resources/lib/codex/mixins/codex-public-mixins.less\",\"resources/lib/codex/mixins/css-icon.less\",\"resources/lib/codex/mixins/link.less\",\"resources/src/mediawiki.less/@wikimedia/codex-icons/codex-icon-paths.less\",\"resources/src/mediawiki.less/mediawiki.skin.defaults.less\",\"skins/Vector/resources/mediawiki.less/vector-2022/mediawiki.skin.variables.less\"]'),('skins.vector.styles','vector-2022|en','[\"resources/lib/codex-design-tokens/theme-wikimedia-ui.less\",\"resources/lib/codex-icons/codex-icon-paths.less\",\"resources/lib/codex/mixins/button-layout-flush.less\",\"resources/lib/codex/mixins/codex-public-mixins.less\",\"resources/lib/codex/mixins/css-icon.less\",\"resources/lib/codex/mixins/link.less\",\"resources/src/mediawiki.less/@wikimedia/codex-icons/codex-icon-paths.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"resources/src/mediawiki.less/mediawiki.skin.defaults.less\",\"resources/src/mediawiki.skinning/i18n-counter-styles.css\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\",\"resources/src/mediawiki.skinning/variables.less\",\"skins/Vector/resources/mediawiki.less/vector-2022/mediawiki.skin.variables.less\",\"skins/Vector/resources/skins.vector.styles/components/BottomDock.less\",\"skins/Vector/resources/skins.vector.styles/components/Button.less\",\"skins/Vector/resources/skins.vector.styles/components/Dropdown.less\",\"skins/Vector/resources/skins.vector.styles/components/Footer.less\",\"skins/Vector/resources/skins.vector.styles/components/Header.less\",\"skins/Vector/resources/skins.vector.styles/components/Icon.less\",\"skins/Vector/resources/skins.vector.styles/components/Indicators.less\",\"skins/Vector/resources/skins.vector.styles/components/LanguageDropdown.less\",\"skins/Vector/resources/skins.vector.styles/components/Logo.less\",\"skins/Vector/resources/skins.vector.styles/components/MainMenu.less\",\"skins/Vector/resources/skins.vector.styles/components/Menu.less\",\"skins/Vector/resources/skins.vector.styles/components/MenuTabs.less\",\"skins/Vector/resources/skins.vector.styles/components/PageTitlebar.less\",\"skins/Vector/resources/skins.vector.styles/components/PageToolbar.less\",\"skins/Vector/resources/skins.vector.styles/components/PageTools.less\",\"skins/Vector/resources/skins.vector.styles/components/PinnableElement.less\",\"skins/Vector/resources/skins.vector.styles/components/PinnableHeader.less\",\"skins/Vector/resources/skins.vector.styles/components/PopupNotification.less\",\"skins/Vector/resources/skins.vector.styles/components/SearchBox.less\",\"skins/Vector/resources/skins.vector.styles/components/SiteNotice.less\",\"skins/Vector/resources/skins.vector.styles/components/StickyHeader.less\",\"skins/Vector/resources/skins.vector.styles/components/TableOfContents.less\",\"skins/Vector/resources/skins.vector.styles/components/UserLinks.less\",\"skins/Vector/resources/skins.vector.styles/components/Watchstar.less\",\"skins/Vector/resources/skins.vector.styles/images/arrow-down-invert.svg\",\"skins/Vector/resources/skins.vector.styles/images/arrow-down-progressive.svg\",\"skins/Vector/resources/skins.vector.styles/images/arrow-down.svg\",\"skins/Vector/resources/skins.vector.styles/images/bullet-icon.svg\",\"skins/Vector/resources/skins.vector.styles/images/link-external-small-ltr-progressive.svg\",\"skins/Vector/resources/skins.vector.styles/layouts/gradeC.less\",\"skins/Vector/resources/skins.vector.styles/layouts/grid.less\",\"skins/Vector/resources/skins.vector.styles/layouts/preZebra.less\",\"skins/Vector/resources/skins.vector.styles/layouts/print.less\",\"skins/Vector/resources/skins.vector.styles/layouts/screen.less\",\"skins/Vector/resources/skins.vector.styles/layouts/toc/pinned.less\",\"skins/Vector/resources/skins.vector.styles/layouts/toc/unpinned.less\",\"skins/Vector/resources/skins.vector.styles/mixins.less\",\"skins/Vector/resources/skins.vector.styles/normalize.less\",\"skins/Vector/resources/skins.vector.styles/print.less\",\"skins/Vector/resources/skins.vector.styles/typography.less\",\"skins/Vector/resources/skins.vector.styles/variables.less\"]');
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob DEFAULT NULL,
  `exptime` binary(14) NOT NULL,
  `modtoken` varbinary(17) NOT NULL DEFAULT '00000000000000000',
  `flags` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES ('wikidb:messages:en','�1\n�0�r/X�ΒYW)v�BR*B�]��=r7�F~f�c���v��C�\Ze��t�J�Tͳ%!���^PCk�qv�2?���:%�B\r�\"���','99991231235959','00000000000000000',NULL),('wikidb:pcache:idhash:1-0!canonical','�Wmo7�+��~��J~����s�ą��{���;�X��ɕ�3����,Y��.m��Y�g��.�?&�CtEw>J�Q19o����)S�Ub.��!�Bi�e�S��k�/z�Ǟb|l�+s/���H�4����K�d�̅�חH�-MA�{_���_�V�Z�P��Y�?���R%����L�Y)g�Oy���\'�ݗh��#���J�Ѩ/�bj,\0��Bze����)=�X�pf�W�R����!�[H��]��s�Y�4��@zG�C�5�n=e0]SDM�/�b<Z���;J�����\\*-.�\r}5��.5�\nƣ>�d��G�\Z�N=��n��Yi��]�����\rC��y���\\@��;��g@Y�#�ύ[�aC���s���߉���z� `\nx\n㼱�t�ߢ�J�M�S��ڶxH:�r�_�3�J�\n����J��*���)mJ�Z��\Z.�=D^k���{l7���B.I��ܬ�7\"\r\\�,�耑��F}�Gԉ\Z�gJߺ(��k\':��f$��S��T\"���J���Ʒ��|��%�����6�\\<]��)k��(���z�<�\Z8調OTN�;�_�����um��[�f�:t��6�(�\r`=����{	}���;t=rf\"μ�IB}�դ�	�d*sG��=������~-�;��ӢVun�2����߷��\\�ɦ2>����ǫ�ț4�%��	�W4D-�ϭ[\r].nȂ5�B����5�PaXsq]sq�~s��L�H09��DR�sc�ʯ��a��Ǘ؏\0iMAַM��������#�\0���3���x�\Z�����o�������֯�����*��p�j缑^r���R�3�]�ݥ�Jjn1��G��?Ra�o��L���M����^���+��	�`�]K�N�Mλ����� *����2�Ӽ���7�~�;������pK�׽�*�H�.T�W2*��C��\\�]��)*��+E)����p��Ӫ��(d�/���v�C��L\'����ʿ	��#�7]o0�F؞�tN��;2fo���!�QG��q�E玢�ô��unmf�O����Yz�H��4x��2/!�W�eU�V_H�vO��c�=���[�S�>�T	�L�ګ\r[������.��S�q#Ĭ��i�45^J�G_��㮘D��/<,,�>\"X�,�����P��$E \'*ãm���w��Fc��b,Z`bV`Z�����21艏�hYn�+�\0��G��Le�(	O��R�\n��dTn�W!Bf\"H���Ã����zC:|��$��<<���E�\Z��m��7���b�q�`�������t=Y����-j��ִ�\\�B�m����oK�7��K�ۗ����Y��2�7�|!�fxj�̏��ڛc�i���/��Æ���W��<�1�j\\�*�]Szw�.���!���iU����,�a�����qU)O�oCa��*��WwS3�4T��T��|��_S�Z\r�\'����nXn�@�4G3�	��=k����ʢ���pK7��4�#,�[�ua����a�9�m\'����n*gU�W2+&L�\r���Fem8B1���*��T%��\Z�&8�a�ؚ8E��}A��Q!���\0t<}���k���','20240108203138','00000000000000000',NULL),('wikidb:pcache:idoptions:1','}��N�0E���.��\n��J�\n� �e5$C;±-�ݦT�;NHB邕�sf�W��9M�Yl�1�0k��h�Y�P-u�B���\"�.ࠦ�ͣ)05A�?t^Y��=Z���C����o����!�d�ࠔ9Ϋ(5�e\r/�)�ѝB\ro\n��\'���φ�Ɗ�G���k]��������Ĉ��瀎c#W>#�]Y�,j�6}�E�y]�J�?=:���n�\r?�k R���$w��v\"e�2*c[b$G9�ӑ�3��\'<P�f\rb�O�q�w3�ܔVa�m�w�','20240108203138','00000000000000000',NULL);
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `oi_width` int(11) NOT NULL DEFAULT 0,
  `oi_height` int(11) NOT NULL DEFAULT 0,
  `oi_bits` int(11) NOT NULL DEFAULT 0,
  `oi_description_id` bigint(20) unsigned NOT NULL,
  `oi_actor` bigint(20) unsigned NOT NULL,
  `oi_timestamp` binary(14) NOT NULL,
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_actor_timestamp` (`oi_actor`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10)),
  KEY `oi_timestamp` (`oi_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL,
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page',0,1,0.571297860463,'20240107200858',NULL,1,755,'wikitext',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(10) unsigned NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  PRIMARY KEY (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(10) unsigned NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT 0,
  `pl_namespace` int(11) NOT NULL DEFAULT 0,
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  `pl_from_namespace` int(11) NOT NULL DEFAULT 0,
  `pl_target_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_target_id` (`pl_target_id`,`pl_from`),
  KEY `pl_backlinks_namespace_target_id` (`pl_from_namespace`,`pl_target_id`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason_id` bigint(20) unsigned NOT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL,
  `pt_create_perm` varbinary(60) NOT NULL,
  PRIMARY KEY (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT 0,
  `qc_namespace` int(11) NOT NULL DEFAULT 0,
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  PRIMARY KEY (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT 0,
  `qcc_namespace` int(11) NOT NULL DEFAULT 0,
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT 0,
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rc_timestamp` binary(14) NOT NULL,
  `rc_actor` bigint(20) unsigned NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT 0,
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment_id` bigint(20) unsigned NOT NULL,
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT 0,
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT 0,
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT 0,
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rc_logid` int(10) unsigned NOT NULL DEFAULT 0,
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob DEFAULT NULL,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title_timestamp` (`rc_namespace`,`rc_title`,`rc_timestamp`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `rc_new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_actor` (`rc_namespace`,`rc_actor`),
  KEY `rc_actor` (`rc_actor`,`rc_timestamp`),
  KEY `rc_name_type_patrolled_timestamp` (`rc_namespace`,`rc_type`,`rc_patrolled`,`rc_timestamp`),
  KEY `rc_this_oldid` (`rc_this_oldid`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT 0,
  `rd_namespace` int(11) NOT NULL DEFAULT 0,
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `rev_actor` bigint(20) unsigned NOT NULL DEFAULT 0,
  `rev_timestamp` binary(14) NOT NULL,
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `rev_page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `rev_actor_timestamp` (`rev_actor`,`rev_timestamp`,`rev_id`),
  KEY `rev_page_actor_timestamp` (`rev_page`,`rev_actor`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,2,'20240107200858',0,0,755,0,'22vz5zlxa2zctewimaum2bf1due8hkl');
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  `si_site` int(10) unsigned NOT NULL,
  PRIMARY KEY (`si_type`,`si_key`),
  KEY `si_site` (`si_site`),
  KEY `si_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT NULL,
  `ss_good_articles` bigint(20) unsigned DEFAULT NULL,
  `ss_total_pages` bigint(20) unsigned DEFAULT NULL,
  `ss_users` bigint(20) unsigned DEFAULT NULL,
  `ss_active_users` bigint(20) unsigned DEFAULT NULL,
  `ss_images` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,0,0,0,1,0,0);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(64) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(35) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `site_global_key` (`site_global_key`),
  KEY `site_type` (`site_type`),
  KEY `site_group` (`site_group`),
  KEY `site_source` (`site_source`),
  KEY `site_language` (`site_language`),
  KEY `site_protocol` (`site_protocol`),
  KEY `site_domain` (`site_domain`),
  KEY `site_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_roles`
--

DROP TABLE IF EXISTS `slot_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_roles`
--

LOCK TABLES `slot_roles` WRITE;
/*!40000 ALTER TABLE `slot_roles` DISABLE KEYS */;
INSERT INTO `slot_roles` VALUES (1,'main');
/*!40000 ALTER TABLE `slot_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots` (
  `slot_revision_id` bigint(20) unsigned NOT NULL,
  `slot_role_id` smallint(5) unsigned NOT NULL,
  `slot_content_id` bigint(20) unsigned NOT NULL,
  `slot_origin` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`slot_revision_id`,`slot_role_id`),
  KEY `slot_revision_origin_role` (`slot_revision_id`,`slot_origin`,`slot_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots`
--

LOCK TABLES `slots` WRITE;
/*!40000 ALTER TABLE `slots` DISABLE KEYS */;
INSERT INTO `slots` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT 0,
  `tl_target_id` bigint(20) unsigned NOT NULL,
  `tl_from_namespace` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tl_from`,`tl_target_id`),
  KEY `tl_target_id` (`tl_target_id`,`tl_from`),
  KEY `tl_backlinks_namespace_target_id` (`tl_from_namespace`,`tl_target_id`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<strong>MediaWiki has been installed.</strong>\n\nConsult the [https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/postorius/lists/mediawiki-announce.lists.wikimedia.org/ MediaWiki release mailing list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob DEFAULT NULL,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES ('PingBack','21dcf7a91368b96977d227ba3f72814c'),('Pingback-1.41.0','1704659498'),('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` binary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob DEFAULT NULL,
  `us_size` bigint(20) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL,
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(10) unsigned DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  `user_is_temp` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','',':pbkdf2:sha512:30000:64:fEcE2SFo7DN8jUIHDf81xA==:cc6+bPmex6iI2FoAPka308BM1GARFsnzkfDjZ/jS3GRaGRIhWzYrlgKFkZVBhmAe+bgGqRlLcyvQoVVPabfk+A==','',NULL,'admin@ansible2.example.com','20240107200859','1a79eee57c8c0705caedb5708501d93a',NULL,NULL,NULL,'20240107200858',0,NULL,0),(2,'MediaWiki default','','','',NULL,'','20240107200858','*** INVALID ***\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,NULL,'20240107200858',0,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_autocreate_serial`
--

DROP TABLE IF EXISTS `user_autocreate_serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_autocreate_serial` (
  `uas_shard` int(10) unsigned NOT NULL,
  `uas_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uas_shard`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_autocreate_serial`
--

LOCK TABLES `user_autocreate_serial` WRITE;
/*!40000 ALTER TABLE `user_autocreate_serial` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_autocreate_serial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT 0,
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT 0,
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  `ug_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`),
  KEY `ug_expiry` (`ug_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'bureaucrat',NULL),(1,'interface-admin',NULL),(1,'sysop',NULL);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` binary(14) DEFAULT NULL,
  KEY `un_user_id` (`user_id`),
  KEY `un_user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(10) unsigned NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob DEFAULT NULL,
  PRIMARY KEY (`up_user`,`up_property`),
  KEY `up_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT 0,
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` binary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `wl_namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist_expiry`
--

DROP TABLE IF EXISTS `watchlist_expiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist_expiry` (
  `we_item` int(10) unsigned NOT NULL,
  `we_expiry` binary(14) NOT NULL,
  PRIMARY KEY (`we_item`),
  KEY `we_expiry` (`we_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist_expiry`
--

LOCK TABLES `watchlist_expiry` WRITE;
/*!40000 ALTER TABLE `watchlist_expiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist_expiry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-07 21:36:23