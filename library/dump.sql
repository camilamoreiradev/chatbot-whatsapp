-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.33 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para chatbot
CREATE DATABASE IF NOT EXISTS `chatbot` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `chatbot`;

-- Copiando estrutura para tabela chatbot.conversations
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `request` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela chatbot.conversations: ~20 rows (aproximadamente)
INSERT INTO `conversations` (`id`, `code`, `phone`, `request`, `product`, `content`, `date`) VALUES
	(2, 2, '1', NULL, NULL, NULL, '2022-07-16 02:09:15'),
	(3, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:27:03'),
	(4, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:47:21'),
	(5, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:48:21'),
	(6, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:48:40'),
	(7, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:48:50'),
	(8, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:48:50'),
	(9, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:48:50'),
	(10, 1, '5551999438686', NULL, NULL, NULL, '2022-07-16 02:48:51'),
	(11, 1, '5551999438686', NULL, NULL, '1', '2022-07-16 02:49:33'),
	(12, 1, '5551999438686', NULL, NULL, '1', '2022-07-16 02:50:40'),
	(13, 1, '5551999438686', NULL, NULL, '1', '2022-07-16 02:50:40'),
	(14, 1, '5551999438686', NULL, NULL, '1', '2022-07-16 02:50:41'),
	(15, 1, '5551999438686', NULL, NULL, '1', '2022-07-16 02:50:41'),
	(16, 1, '5551999438686', NULL, NULL, '1', '2022-07-16 02:50:41'),
	(17, 1, '5551999438686', NULL, NULL, '1', '2022-07-16 02:50:41'),
	(18, 1, '5551999438686', NULL, NULL, 'Testando cÃ³digo!', '2022-07-16 02:51:08'),
	(19, 1, '5551999438686', NULL, NULL, 'Testando código!', '2022-07-16 02:51:52'),
	(20, 1, '5551999438686', NULL, NULL, 'Testando código!', '2022-07-16 02:52:10'),
	(21, 1, '5551999438686', NULL, NULL, 'Testando código!', '2022-07-16 02:56:20');

-- Copiando estrutura para tabela chatbot.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela chatbot.customers: ~2 rows (aproximadamente)
INSERT INTO `customers` (`id`, `name`, `phone`) VALUES
	(1, 'camila', '1'),
	(2, 'Camila Moreira', '5551999438686');

-- Copiando estrutura para tabela chatbot.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `value` float(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela chatbot.products: ~3 rows (aproximadamente)
INSERT INTO `products` (`id`, `description`, `value`) VALUES
	(5, 'Coca-cola 600ml', 8.00),
	(6, 'Coca-cola 2 litros', 10.00),
	(7, 'Coca-cola 350ml', 5.00);

-- Copiando estrutura para tabela chatbot.requests
CREATE TABLE IF NOT EXISTS `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela chatbot.requests: ~11 rows (aproximadamente)
INSERT INTO `requests` (`id`, `customer`, `product`, `date`) VALUES
	(1, '2', 5, '2022-07-16 02:22:03'),
	(2, '2', 5, '2022-07-16 02:22:25'),
	(3, '2', 5, '2022-07-16 02:22:25'),
	(4, '2', 5, '2022-07-16 02:23:40'),
	(5, '2', 5, '2022-07-16 02:24:02'),
	(6, '2', 5, '2022-07-16 02:24:06'),
	(7, '2', 5, '2022-07-16 02:24:06'),
	(8, '2', 5, '2022-07-16 02:24:07'),
	(9, '2', 5, '2022-07-16 02:24:07'),
	(10, '2', 5, '2022-07-16 02:24:07'),
	(11, '2', 5, '2022-07-16 02:24:07');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
