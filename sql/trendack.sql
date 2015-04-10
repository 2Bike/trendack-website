-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2015 at 08:38 PM
-- Server version: 5.6.22
-- PHP Version: 5.6.7-1+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `trendack`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `woeid` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`woeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

DROP TABLE IF EXISTS `stream`;
CREATE TABLE IF NOT EXISTS `stream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trend_1` int(11) NOT NULL,
  `trend_2` int(11) NOT NULL,
  `trend_3` int(11) NOT NULL,
  `trend_4` int(11) NOT NULL,
  `trend_5` int(11) NOT NULL,
  `trend_6` int(11) NOT NULL,
  `trend_7` int(11) NOT NULL,
  `trend_8` int(11) NOT NULL,
  `trend_9` int(11) NOT NULL,
  `trend_10` int(11) NOT NULL,
  `woeid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `trend_id` (`trend_1`),
  KEY `trend_2` (`trend_2`,`trend_3`,`trend_4`,`trend_5`,`trend_6`,`trend_7`,`trend_8`,`trend_9`,`trend_10`,`woeid`),
  KEY `woeid` (`woeid`),
  KEY `trend_3` (`trend_3`),
  KEY `trend_4` (`trend_4`),
  KEY `trend_5` (`trend_5`),
  KEY `trend_7` (`trend_7`),
  KEY `trend_6` (`trend_6`),
  KEY `trend_8` (`trend_8`),
  KEY `trend_9` (`trend_9`),
  KEY `trend_10` (`trend_10`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
CREATE TABLE IF NOT EXISTS `trends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trend` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
CREATE TABLE IF NOT EXISTS `tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trend_id` int(11) NOT NULL,
  `woeid` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `trend_id` (`trend_id`),
  KEY `woeid` (`woeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stream`
--
ALTER TABLE `stream`
  ADD CONSTRAINT `stream_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `locations` (`woeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_10` FOREIGN KEY (`trend_9`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_11` FOREIGN KEY (`trend_10`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_2` FOREIGN KEY (`trend_1`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_3` FOREIGN KEY (`trend_2`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_4` FOREIGN KEY (`trend_3`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_5` FOREIGN KEY (`trend_4`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_6` FOREIGN KEY (`trend_5`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_7` FOREIGN KEY (`trend_7`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_8` FOREIGN KEY (`trend_6`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_9` FOREIGN KEY (`trend_8`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `locations` (`woeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tweets_ibfk_2` FOREIGN KEY (`trend_id`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
