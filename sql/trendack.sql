-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2015 at 05:26 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `trendack`
--
CREATE DATABASE IF NOT EXISTS `trendack` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `trendack`;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
`id` int(11) NOT NULL,
  `woeid` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=44 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `woeid`, `name`) VALUES
(1, 963291, 'Albania'),
(2, 628886, 'Andorra'),
(3, 551801, 'Austria'),
(4, 834463, 'Belarus'),
(5, 23424757, 'Belgium'),
(6, 719258, 'Bosnia and Herzegovina'),
(7, 963291, 'Bulgaria'),
(8, 551801, 'Croatia'),
(9, 645686, 'Czech Republic'),
(10, 23424796, 'Denmark'),
(11, 854823, 'Estonia'),
(12, 2123260, 'Finland'),
(13, 615702, 'France'),
(14, 638242, 'Germany'),
(15, 946738, 'Greece'),
(16, 551801, 'Hungary'),
(17, 21125, 'Iceland'),
(18, 560743, 'Ireland'),
(19, 721943, 'Italy'),
(20, 854823, 'Latvia'),
(21, 784794, 'Liechtenstein'),
(22, 825848, 'Lithuania'),
(23, 23424757, 'Luxembourg'),
(24, 963291, 'Macedonia'),
(25, 719846, 'Malta'),
(26, 929398, 'Moldova'),
(27, 716085, 'Monaco'),
(28, 963291, 'Montenegro'),
(29, 727232, 'Netherlands'),
(30, 862592, 'Norway'),
(31, 523920, 'Poland'),
(32, 23424925, 'Portugal'),
(33, 929398, 'Romania'),
(34, 2122265, 'Russia'),
(35, 711080, 'San Marino'),
(36, 551801, 'Serbia'),
(37, 551801, 'Slovakia'),
(38, 23424750, 'Slovenia'),
(39, 766273, 'Spain'),
(40, 906057, 'Sweden'),
(41, 23424957, 'Switzerland'),
(42, 924938, 'Ukraine'),
(43, 44418, 'United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

DROP TABLE IF EXISTS `stream`;
CREATE TABLE IF NOT EXISTS `stream` (
`id` int(11) NOT NULL,
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
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
CREATE TABLE IF NOT EXISTS `trends` (
`id` int(11) NOT NULL,
  `trend` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=232 ;

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
CREATE TABLE IF NOT EXISTS `tweets` (
`id` int(11) NOT NULL,
  `trend_id` int(11) NOT NULL,
  `woeid` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
 ADD PRIMARY KEY (`id`), ADD KEY `woeid` (`woeid`);

--
-- Indexes for table `stream`
--
ALTER TABLE `stream`
 ADD PRIMARY KEY (`id`), ADD KEY `trend_id` (`trend_1`), ADD KEY `trend_2` (`trend_2`,`trend_3`,`trend_4`,`trend_5`,`trend_6`,`trend_7`,`trend_8`,`trend_9`,`trend_10`,`woeid`), ADD KEY `woeid` (`woeid`), ADD KEY `trend_3` (`trend_3`), ADD KEY `trend_4` (`trend_4`), ADD KEY `trend_5` (`trend_5`), ADD KEY `trend_7` (`trend_7`), ADD KEY `trend_6` (`trend_6`), ADD KEY `trend_8` (`trend_8`), ADD KEY `trend_9` (`trend_9`), ADD KEY `trend_10` (`trend_10`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `trend` (`trend`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
 ADD PRIMARY KEY (`id`), ADD KEY `trend_id` (`trend_id`), ADD KEY `woeid` (`woeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `stream`
--
ALTER TABLE `stream`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
