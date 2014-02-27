-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 30 Décembre 2011 à 16:00
-- Version du serveur: 5.5.9
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `talendstore`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `numRating` tinyint(4) NOT NULL,
  `rating` float NOT NULL,
  `icon` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DATA DIRECTORY='./TalendStore/' INDEX DIRECTORY='./TalendStore/';

--
-- Contenu de la table `products`
--

INSERT INTO `products` VALUES('231035933', 'Talend Dog T-Shirt', 'Talend Inc.', 123, 2, 'dog.png', 'Doggie t-shirt from American Apparel !!', 12);
INSERT INTO `products` VALUES('231035934', 'Talend Jr. Spaghetti Tank', 'Talend Inc.', 34, 4, 'spaghetti.png', 'Spaghetti tank from American Apparel !', 16.99);
INSERT INTO `products` VALUES('231035935', 'Talend Golf Shirt', 'Talend Inc.', 127, 3.4, 'golf.png', 'Golf-style, collared t-shirt !!', 16.99);
INSERT INTO `products` VALUES('231035936', 'Talend Fitted T-Shirt', 'Talend Inc.', 127, 4.5, 'shirt.png', 'Fitted T. ultra-fine combed ring spun cotton !!', 15.99);
INSERT INTO `products` VALUES('231035939', 'Talend Large Mug', 'Talend Inc.', 127, 3, 'large.png', '15 oz. ceramic Large Mug', 12);
INSERT INTO `products` VALUES('231035937', 'Talend Stein', 'Talend Inc.', 127, 4.3, 'stein.png', '22 oz. ceramic stein with gold trim', 13.99);
INSERT INTO `products` VALUES('231035938', 'Talend Mugs', 'Talend Inc.', 93, 2.9, 'mugs.png', 'Large mug, easy-grip handle', 15.99);
INSERT INTO `products` VALUES('231035940', 'Talend Cap', 'Talend Inc.', 127, 3.5, 'cap.png', 'Adjustable, 100% brushed cotton Cap', 14.99);
INSERT INTO `products` VALUES('231035941', 'Talend Trucker Hat', 'Talend Inc.', 64, 2.4, 'hat.png', 'Standard Trucker Hat, resilient polyester foam front, adjustable headband !', 10.99);

--
-- Déclencheurs `products`
--
DROP TRIGGER IF EXISTS `TCDC_TG_products_I`;
DELIMITER //
CREATE TRIGGER `TCDC_TG_products_I` AFTER INSERT ON `products`
 FOR EACH ROW INSERT INTO `talendstore`.`TCDC_products` 
  ( 
   `TALEND_CDC_SUBSCRIBERS_NAME`,
   `TALEND_CDC_STATE`,
   `TALEND_CDC_TYPE`,
   `TALEND_CDC_CREATION_DATE`,
   `id`
  ) SELECT 
     `TALEND_CDC_SUBSCRIBER_NAME`,
     '0',
     'I',
     sysdate(),
     new.`id`      
    FROM `talendstore`.`TSUBSCRIBERS`
    WHERE `TALEND_CDC_TABLE_TO_WATCH`='TalendStore.products'
//
DELIMITER ;
DROP TRIGGER IF EXISTS `TCDC_TG_products_U`;
DELIMITER //
CREATE TRIGGER `TCDC_TG_products_U` AFTER UPDATE ON `products`
 FOR EACH ROW INSERT INTO `talendstore`.`TCDC_products` 
  ( 
   `TALEND_CDC_SUBSCRIBERS_NAME`,
   `TALEND_CDC_STATE`,
   `TALEND_CDC_TYPE`,
   `TALEND_CDC_CREATION_DATE`,
   `id`
  ) SELECT 
     `TALEND_CDC_SUBSCRIBER_NAME`,
     '0',
     'U',
     sysdate(),
     new.`id`
    FROM `talendstore`.`TSUBSCRIBERS`
    WHERE `TALEND_CDC_TABLE_TO_WATCH`='TalendStore.products'
//
DELIMITER ;
DROP TRIGGER IF EXISTS `TCDC_TG_products_D`;
DELIMITER //
CREATE TRIGGER `TCDC_TG_products_D` AFTER DELETE ON `products`
 FOR EACH ROW INSERT INTO `talendstore`.`TCDC_products` 
  ( 
   `TALEND_CDC_SUBSCRIBERS_NAME`,
   `TALEND_CDC_STATE`,
   `TALEND_CDC_TYPE`,
   `TALEND_CDC_CREATION_DATE`,
   `id`
  ) SELECT 
     `TALEND_CDC_SUBSCRIBER_NAME`,
     '0',
     'D',
     sysdate(),
     old.`id` 
    FROM `talendstore`.`TSUBSCRIBERS`
    WHERE `TALEND_CDC_TABLE_TO_WATCH`='TalendStore.products'
//
DELIMITER ;
