-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 25, 2015 at 01:41 AM
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `woeid` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `latitutde` varchar(10) COLLATE utf8_bin NOT NULL,
  `longtitude` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `woeid` (`woeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=44 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `woeid`, `name`, `latitutde`, `longtitude`) VALUES
(1, 963291, 'Albania', '41.3317', '19.8172'),
(2, 628886, 'Andorra', '42.5075', '1.5218'),
(3, 551801, 'Austria', '48.2092', '16.3728'),
(4, 834463, 'Belarus', '53.9678', '27.5766'),
(5, 23424757, 'Belgium', '50.8371', '4.3676'),
(6, 719258, 'Bosnia and Herzegovina', '43.8608', '18.4214'),
(7, 963291, 'Bulgaria', '42.7105', '23.3238'),
(8, 551801, 'Croatia', '45.8150', '15.9785'),
(9, 645686, 'Czech Republic', '50.0878', '14.4205'),
(10, 23424796, 'Denmark', '55.6763', '12.5681'),
(11, 854823, 'Estonia', '59.4389', '24.7545'),
(12, 2123260, 'Finland', '60.1699', '24.9384'),
(13, 615702, 'France', '48.8567', '2.351'),
(14, 638242, 'Germany', '52.5235', '13.4115'),
(15, 946738, 'Greece', '37.9792', '23.7166'),
(16, 551801, 'Hungary', '47.4984', '19.0408'),
(17, 21125, 'Iceland', '64.1353', '-21.8952'),
(18, 560743, 'Ireland', '53.3441', '-6.2675'),
(19, 721943, 'Italy', '41.8955', '12.4823'),
(20, 854823, 'Latvia', '56.9465', '24.1049'),
(21, 784794, 'Liechtenstein', '47.1411', '9.5215'),
(22, 825848, 'Lithuania', '54.6896', '25.2799'),
(23, 23424757, 'Luxembourg', '49.61', '6.1296'),
(24, 963291, 'FYROM', '42.0024', '21.4361'),
(25, 719846, 'Malta', '35.9042', '14.5189'),
(26, 929398, 'Moldova', '47.0167', '28.8497'),
(27, 716085, 'Monaco', '43.7325', '7.4189'),
(28, 963291, 'Montenegro', '42.4602', '19.2595'),
(29, 727232, 'Netherlands', '52.3738', '4.891'),
(30, 862592, 'Norway', '59.9138', '10.7387'),
(31, 523920, 'Poland', '52.2297', '21.0122'),
(32, 23424925, 'Portugal', '38.7072', '-9.1355'),
(33, 929398, 'Romania', '44.4479', '26.0979'),
(34, 2122265, 'Russia', '55.7558', '37.6176'),
(35, 711080, 'San Marino', '43.9424', '12.4578'),
(36, 551801, 'Serbia', '44.8048', '20.4781'),
(37, 551801, 'Slovakia', '48.2116', '17.1547'),
(38, 23424750, 'Slovenia', '46.0514', '14.506'),
(39, 766273, 'Spain', '40.4167', '-3.7033'),
(40, 906057, 'Sweden', '59.3328', '18.0645'),
(41, 23424957, 'Switzerland', '46.948', '7.4481'),
(42, 924938, 'Ukraine', '50.4422', '30.5367'),
(43, 44418, 'United Kingdom', '51.5002', '-0.1262');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `trend` (`trend`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=232 ;

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
  ADD CONSTRAINT `stream_ibfk_10` FOREIGN KEY (`trend_9`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_11` FOREIGN KEY (`trend_10`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stream_ibfk_12` FOREIGN KEY (`woeid`) REFERENCES `locations` (`woeid`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `tweets_ibfk_2` FOREIGN KEY (`trend_id`) REFERENCES `trends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tweets_ibfk_3` FOREIGN KEY (`woeid`) REFERENCES `locations` (`woeid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
