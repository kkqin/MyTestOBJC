-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-11-17 02:33:15
-- 服务器版本： 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `APP_TEST`
--

-- --------------------------------------------------------

--
-- 表的结构 `Message`
--

CREATE TABLE `Message` (
  `uid` varchar(11) NOT NULL,
  `m_id` varchar(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `m_type` int(11) NOT NULL,
  `m_pic` varchar(255) DEFAULT NULL,
  `relatemsg_id` varchar(11) DEFAULT NULL,
  `ltime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Message`
--

INSERT INTO `Message` (`uid`, `m_id`, `msg`, `m_type`, `m_pic`, `relatemsg_id`, `ltime`) VALUES
('10001', '20022', '图片图片', 1, 'http://127.0.0.1/ios/picture/test01.jpg', NULL, '2016-10-19 16:31:11'),
('10001', '20023', '这条信息没有图片', 1, NULL, NULL, '2016-10-19 17:13:00'),
('10001', '20024', 'This still no picture\n', 1, NULL, NULL, '2016-10-23 08:54:45'),
('10001', '20025', 'S', 1, NULL, NULL, '2016-10-26 13:19:22'),
('10001', '20026', 'http://127.0.0.1/', 1, NULL, NULL, '2016-10-31 14:00:00'),
('10001', '20027', '#hhh the good day', 1, NULL, NULL, '2016-11-03 05:54:03'),
('10001', '20028', 'Do you know ma a @www', 1, NULL, NULL, '2016-11-03 05:55:16'),
('10001', '20029', 'This is admin @admin', 1, NULL, NULL, '2016-11-05 12:16:26'),
('10001', '20030', '#hhh is. A good thing', 1, NULL, NULL, '2016-11-12 14:38:53'),
('10003', '20031', '#hhh now see is hot', 1, NULL, NULL, '2016-11-14 19:00:00'),
('10003', '20032', '@admin try', 2, NULL, '20027', '2016-11-16 15:23:13'),
('10002', '20033', '@admin fuck that.', 2, NULL, '20027', '2016-11-16 18:54:00'),
('10001', '20037', 'Xxx ', 1, NULL, '20027', '2016-11-16 05:24:31'),
('10001', '20038', 'Hhh ', 2, NULL, '20031', '2016-11-17 09:12:47'),
('10001', '20039', 'Fff', 1, NULL, '', '2016-11-17 09:16:37');

-- --------------------------------------------------------

--
-- 表的结构 `Relation`
--

CREATE TABLE `Relation` (
  `uid` varchar(11) NOT NULL,
  `relation_id` blob NOT NULL,
  `band_id` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `User`
--

CREATE TABLE `User` (
  `uid` varchar(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `register_date` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `handler_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `User`
--

INSERT INTO `User` (`uid`, `uname`, `register_date`, `last_active`, `handler_link`) VALUES
('10001', 'admintest', '2016-09-04 00:00:00', '2016-09-04 00:00:00', '@admin'),
('10002', 'guest', '2016-11-16 00:00:00', '2016-11-16 00:00:00', '@guest'),
('10003', 'tttttt', '2016-09-07 00:00:00', '2016-09-07 00:00:00', '@tttttt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `Relation`
--
ALTER TABLE `Relation`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`uid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
