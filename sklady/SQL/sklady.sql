-- Adminer 4.4.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `movement`;
CREATE TABLE `movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stock_count` int(11) NOT NULL,
  `stock_name` char(30) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `movement_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `movement` (`id`, `created_at`, `stock_count`, `stock_name`, `warehouse_id`) VALUES
(1,	'2018-01-20 21:19:25',	4,	'Auto',	1),
(2,	'2018-01-20 21:24:40',	5,	'Auto',	1),
(3,	'2018-01-20 21:38:13',	5,	'Auto',	1),
(4,	'2018-01-20 21:57:12',	2,	'Kolo',	2),
(5,	'2018-01-20 22:01:25',	2,	'Kolo',	2),
(6,	'2018-01-20 22:32:13',	2,	'Kolo',	2),
(7,	'2018-01-20 22:40:13',	2,	'Kolo',	2),
(8,	'2018-01-20 22:43:27',	2,	'Kolo',	2),
(9,	'2018-01-20 22:44:20',	2,	'Kolo',	2),
(10,	'2018-01-20 22:44:47',	2,	'Kolo',	2),
(11,	'2018-01-20 23:00:06',	5,	'Baterka',	1),
(12,	'2018-01-20 23:18:52',	5,	'Baterka',	1),
(13,	'2018-01-20 23:23:24',	5,	'Baterka',	1),
(14,	'2018-01-20 23:34:46',	5,	'Baterka',	1),
(15,	'2018-01-20 23:35:38',	3,	'Kolobezka',	3),
(16,	'2018-01-20 23:36:07',	3,	'Kolobezka',	3),
(17,	'2018-01-20 23:37:47',	3,	'Kolobezka',	3),
(18,	'2018-01-20 23:37:59',	10,	'Motorka',	3),
(19,	'2018-01-20 23:58:49',	15,	'Motorka',	1),
(20,	'2018-01-21 00:01:07',	15,	'Motorka',	1),
(21,	'2018-01-21 00:01:15',	11,	'Motorka',	1),
(22,	'2018-01-21 00:01:26',	11,	'Motorka',	1),
(23,	'2018-01-21 00:01:55',	11,	'Motorka',	1);

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `warehouse` (`id`, `name`, `created_at`) VALUES
(1,	'Plzeň',	'2018-01-20 20:30:09'),
(2,	'Praha',	'2018-01-20 20:30:15'),
(3,	'Brno',	'2018-01-20 20:30:23');

-- 2018-01-21 00:04:32
