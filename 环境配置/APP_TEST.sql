-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-09-08 11:43:18
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
  `m_pic` blob,
  `relatemsg_id` varchar(11) DEFAULT NULL,
  `ltime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Message`
--

INSERT INTO `Message` (`uid`, `m_id`, `msg`, `m_type`, `m_pic`, `relatemsg_id`, `ltime`) VALUES
('10001', '20001', 'hello world', 1, NULL, NULL, '2016-09-04 00:00:00'),
('10001', '20002', 'Second Hello World', 1, NULL, NULL, '0000-00-00 00:00:00'),
('10001', '20003', '2016-09-06 10:27:07.742 MyTestApp[2930:11203] numberOfSectionsInTableView S 2\r\n2016-09-06 10:27:07.743 MyTestApp[2930:11203] NumberOfRowsInSection R\r\n2016-09-06 10:27:07.743 MyTestApp[2930:11203] heightForRowAtIndexPath H\r\nasdfasdfsafsaklaml   awa啊圣诞节啊啊说', 1, NULL, NULL, '2016-09-13 00:00:00'),
('10001', '20004', 'ttttttt', 1, NULL, NULL, '2016-09-08 00:00:00'),
('10001', '20005', 'whatthef', 1, NULL, NULL, '2016-09-09 00:00:00'),
('10001', '20005 + 1', 'whatthef', 1, NULL, NULL, '2016-09-09 00:00:00'),
('10001', '20006', 'whatthef', 1, NULL, NULL, '2016-09-09 00:00:00'),
('10001', '20007', 'whatthef', 1, NULL, NULL, '2016-09-09 00:00:00'),
('10001', '20008', 'whatthef', 1, NULL, NULL, '2016-09-09 00:00:00'),
('10001', '20009', 'whatthef', 1, NULL, NULL, '2016-09-09 00:00:00'),
('10001', '20012', 'Jkjk', 1, NULL, NULL, '2016-09-09 00:00:00'),
('10001', '20013', '', 1, NULL, NULL, '0000-00-00 00:00:00');

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
  `last_active` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `User`
--

INSERT INTO `User` (`uid`, `uname`, `register_date`, `last_active`) VALUES
('10001', 'admintest', '2016-09-04 00:00:00', '2016-09-04 00:00:00'),
('10003', 'tttttt', '2016-09-07 00:00:00', '2016-09-07 00:00:00');

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
