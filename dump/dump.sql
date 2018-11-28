-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_image` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_image` (`id_image`),
  CONSTRAINT `site_food_ibfk_3` FOREIGN KEY (`id_image`) REFERENCES `ez_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `company` (`id`, `id_image`, `status`) VALUES
(1,	5,	1),
(2,	6,	1),
(3,	7,	1),
(4,	8,	1),
(5,	10,	1),
(6,	12,	1);

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

INSERT INTO `company_description` (`id_company`, `title`, `lat`, `long`, `text`) VALUES
(1,	'Di Paollo',	NULL,	NULL,	NULL),
(2,	'Cantina Toldo',	NULL,	NULL,	NULL),
(3,	'Restaurante Andrea',	NULL,	NULL,	NULL),
(4,	'Restaurante Tranquilo',	NULL,	NULL,	NULL),
(5,	'Laço de Ouro',	NULL,	NULL,	NULL),
(6,	'Soulshi',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `ez_file`;
CREATE TABLE `ez_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `extension` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ez_file` (`id`, `file`, `path`, `extension`) VALUES
(1,	'food-0.jpg',	'assets/img',	'jpg'),
(2,	'food-1.jpg',	'assets/img',	'jpg'),
(3,	'food-2.jpg',	'assets/img',	'jpg'),
(4,	'food-3.jpg',	'assets/img',	'jpg'),
(5,	'logo-0.png',	'assets/img',	'png'),
(6,	'logo-1.jpg',	'assets/img',	'jpg'),
(7,	'logo-2.jpg',	'assets/img',	'jpg'),
(8,	'logo-3.png',	'assets/img',	'png'),
(9,	'food-4.jpg',	'assets/img',	'jpg'),
(10,	'logo-4.jpg',	'assets/img',	'jpg'),
(11,	'food-5.jpg',	'assets/img',	'jpg'),
(12,	'logo-5.png',	'assets/img',	'png');

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_company` int(11) NOT NULL,
  `id_image` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_company` (`id_company`),
  KEY `id_image` (`id_image`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_ibfk_3` FOREIGN KEY (`id_image`) REFERENCES `ez_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `food` (`id`, `id_company`, `id_image`, `status`) VALUES
(1,	1,	1,	1),
(2,	2,	2,	1),
(3,	3,	3,	1),
(4,	4,	4,	1),
(5,	5,	9,	1),
(6,	6,	11,	1);

DROP TABLE IF EXISTS `food_description`;
CREATE TABLE `food_description` (
  `id_food` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `rating` tinyint(5) DEFAULT '5',
  `text` text,
  PRIMARY KEY (`id_food`),
  KEY `id_food` (`id_food`),
  CONSTRAINT `food_description_ibfk_3` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `food_description` (`id_food`, `title`, `rating`, `text`) VALUES
(1,	'Agnoline',	5,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. Cras bibendum massa sed sodales rhoncus.'),
(2,	'Massa ao Pesto',	5,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. '),
(3,	'À Parmegiana',	5,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. '),
(4,	'Bife à Cavalo',	5,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. '),
(5,	'Picanha',	5,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. '),
(6,	'Temaki Filadelfia',	5,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. ');

DROP TABLE IF EXISTS `list`;
CREATE TABLE `list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_food` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_food` (`id_food`),
  CONSTRAINT `list_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `list_ibfk_3` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `list` (`id`, `id_user`, `id_food`) VALUES
(3,	1,	4),
(5,	1,	3),
(7,	1,	2),
(8,	1,	6),
(9,	1,	5),
(10,	1,	1);

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

INSERT INTO `user` (`id`, `name`, `email`, `password`, `status`, `online`) VALUES
(1,	'Ricardo Pellicioli',	'pellicioli_r@hotmail.com',	'W#B@ri1.',	1,	0);

-- 2018-11-28 02:16:20
