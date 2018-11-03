-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag para indicar se usuário está logado no sistema',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ez_file`;
CREATE TABLE `ez_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `extension` varchar(25) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `orientation` enum('h','v') DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_image` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_image` (`id_image`),
  CONSTRAINT `site_food_ibfk_3` FOREIGN KEY (`id_image`) REFERENCES `ez_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `company_description`;
CREATE TABLE `company_description` (
  `id_company` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id_company`),
  KEY `id_company` (`id_company`),
  CONSTRAINT `site_company_description_ibfk_3` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_company` int(11) DEFAULT NULL,
  `id_image` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_company` (`id_company`),
  KEY `id_image` (`id_image`),
  CONSTRAINT `site_food_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `site_food_ibfk_3` FOREIGN KEY (`id_image`) REFERENCES `ez_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `food_description`;
CREATE TABLE `food_description` (
  `id_food` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `rating` tinyint(5) DEFAULT '5',
  `text` text,
  PRIMARY KEY (`id_food`),
  KEY `id_food` (`id_food`),
  CONSTRAINT `site_food_description_ibfk_3` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 2018-01-08 10:22:22
