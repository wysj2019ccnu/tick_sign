-- phpMyAdmin SQL Dump
-- version 4.0.10.19
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2019 at 05:33 PM
-- Server version: 5.5.54-log
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tick_sign_in`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(28) NOT NULL,
  `theme` varchar(256) NOT NULL,
  `fromTime` datetime NOT NULL,
  `toTime` datetime NOT NULL,
  `note` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `admin_id`, `theme`, `fromTime`, `toTime`, `note`, `time`) VALUES
(139, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '计算机基础', '2019-06-22 00:00:00', '0000-00-00 00:00:00', '一个月 8502教师', '2019-06-21 06:53:49'),
(138, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '事务大厅签到', '2019-06-21 06:00:00', '0000-00-00 00:00:00', '事务大厅一号窗口 持续一个月', '2019-06-21 05:52:27'),
(137, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '新闻评论课堂签到', '2019-06-22 12:00:00', '0000-00-00 00:00:00', '8401 持续5分钟', '2019-06-21 04:25:07'),
(142, 'o5xH25TgvQFZkD_mVibO5VDBuckQ', '小程序学习第一期', '2019-06-21 00:00:00', '0000-00-00 00:00:00', '自带电脑', '2019-06-21 08:28:04'),
(143, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '电影鉴赏', '2019-06-22 08:00:00', '0000-00-00 00:00:00', '8513教室 签到持续10分钟', '2019-06-21 08:40:27'),
(144, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '色彩信息魅力课堂', '2019-06-27 10:00:00', '0000-00-00 00:00:00', '6102 持续2个小时', '2019-06-21 09:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `joins`
--

CREATE TABLE IF NOT EXISTS `joins` (
  `join_id` int(11) NOT NULL AUTO_INCREMENT,
  `joiner_id` varchar(28) NOT NULL,
  `joinTime` datetime NOT NULL,
  `event_id` int(11) NOT NULL,
  `joinName` varchar(8) NOT NULL,
  PRIMARY KEY (`join_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `joins`
--

INSERT INTO `joins` (`join_id`, `joiner_id`, `joinTime`, `event_id`, `joinName`) VALUES
(44, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '2019-06-21 14:21:36', 137, 'lilili'),
(43, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '2019-06-21 14:21:04', 138, 'lele'),
(42, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '2019-06-21 14:10:37', 138, 'lili'),
(52, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '2019-06-21 15:21:31', 137, 'lilili'),
(57, 'o5xH25YuIgQI0K81gzFqYJM6UbZ8', '2019-06-21 17:03:23', 144, '李思童');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(24) NOT NULL,
  `openid` varchar(28) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=140 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `session_key`, `openid`) VALUES
(20, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(19, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(18, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(17, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(16, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(15, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(14, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(13, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(21, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(22, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(23, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(24, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(25, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(26, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(27, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(28, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(29, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(30, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(31, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(32, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(33, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(34, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(35, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(36, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(37, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(38, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(39, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(40, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(41, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(42, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(43, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(44, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(45, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(46, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(47, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(48, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(49, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(50, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(51, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(52, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(53, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(54, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(55, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(56, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(57, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(58, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(59, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(60, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(61, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(62, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(63, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(64, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(65, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(66, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(67, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(68, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(69, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(70, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(71, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(72, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(73, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(74, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(75, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(76, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(77, '', ''),
(78, '', ''),
(79, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(80, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(81, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(82, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(83, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(84, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(85, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(86, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(87, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(88, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(89, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(90, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(91, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(92, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(93, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(94, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(95, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(96, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(97, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(98, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(99, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(100, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(101, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(102, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(103, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(104, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(105, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(106, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(107, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(108, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(109, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(110, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(111, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(112, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(113, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(114, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(115, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(116, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(117, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(118, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(119, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(120, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(121, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(122, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(123, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(124, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(125, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(126, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(127, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(128, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(129, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(130, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(131, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(132, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(133, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(134, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(135, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(136, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(137, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(138, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc'),
(139, '', 'o5xH25cSv3J0i5TGD3cL2i_AqOdc');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
