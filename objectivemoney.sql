-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 26, 2015 at 11:43 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `objectivemoney`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_profile`
--

CREATE TABLE IF NOT EXISTS `client_profile` (
  `client_profile_id` int(11) NOT NULL,
  `client_profile_title` varchar(2000) NOT NULL,
  `client_profile_value` varchar(2000) NOT NULL,
  `client_profile_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_requirement`
--

CREATE TABLE IF NOT EXISTS `client_requirement` (
  `client_requirement_id` int(11) NOT NULL,
  `client_requirement_minimum` int(20) NOT NULL,
  `client_requirement_maxdistance` int(20) NOT NULL,
  `client_requirement_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_review`
--

CREATE TABLE IF NOT EXISTS `client_review` (
  `client_review_id` int(11) NOT NULL,
  `client_review_title` varchar(2000) NOT NULL,
  `client_review_value` varchar(5000) NOT NULL,
  `client_review_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `member_id_role` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_services`
--

CREATE TABLE IF NOT EXISTS `client_services` (
  `client_services_id` int(11) NOT NULL,
  `client_services_title` varchar(2000) NOT NULL,
  `client_services_value` varchar(2000) NOT NULL,
  `client_services_desc` varchar(2000) NOT NULL,
  `client_services_parentid` int(10) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `file_id` int(11) NOT NULL,
  `file_path` varchar(1000) NOT NULL,
  `file_title` varchar(1000) NOT NULL,
  `file_desc` varchar(1000) NOT NULL,
  `file_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL,
  `member_email` varchar(200) NOT NULL,
  `member_password` varchar(200) NOT NULL,
  `member_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_fname` varchar(500) NOT NULL,
  `member_surname` varchar(500) NOT NULL,
  `member_telephone` int(20) NOT NULL,
  `member_role` enum('planner','client','admin','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `member_detail`
--

CREATE TABLE IF NOT EXISTS `member_detail` (
  `member_detail_id` int(11) NOT NULL,
  `member_detail_title` varchar(3000) NOT NULL,
  `member_detail_value` varchar(3000) NOT NULL,
  `member_detail_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `member_file`
--

CREATE TABLE IF NOT EXISTS `member_file` (
  `member_file_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `member_file_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `planner_profile`
--

CREATE TABLE IF NOT EXISTS `planner_profile` (
  `id` int(11) NOT NULL,
  `planner_profile_title` varchar(1000) NOT NULL,
  `planner_profile_value` varchar(2000) NOT NULL,
  `planner_profile_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `planner_requirement`
--

CREATE TABLE IF NOT EXISTS `planner_requirement` (
  `planner_requirement_id` int(11) NOT NULL,
  `planner_requirement_minimum` int(20) NOT NULL,
  `planner_requirement_maxdistance` int(20) NOT NULL,
  `planner_requirement_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `planner_services`
--

CREATE TABLE IF NOT EXISTS `planner_services` (
  `planner_services_id` int(11) NOT NULL,
  `planner_services_title` varchar(2000) NOT NULL,
  `planner_services_value` varchar(2000) NOT NULL,
  `planner_services_desc` varchar(2000) NOT NULL,
  `planner_services_parentid` int(10) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `planner_status`
--

CREATE TABLE IF NOT EXISTS `planner_status` (
  `id` int(11) NOT NULL,
  `planner_status_state` int(11) NOT NULL,
  `planner_status_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_profile`
--
ALTER TABLE `client_profile`
  ADD PRIMARY KEY (`client_profile_id`);

--
-- Indexes for table `client_requirement`
--
ALTER TABLE `client_requirement`
  ADD PRIMARY KEY (`client_requirement_id`);

--
-- Indexes for table `client_review`
--
ALTER TABLE `client_review`
  ADD PRIMARY KEY (`client_review_id`);

--
-- Indexes for table `client_services`
--
ALTER TABLE `client_services`
  ADD PRIMARY KEY (`client_services_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `member_detail`
--
ALTER TABLE `member_detail`
  ADD PRIMARY KEY (`member_detail_id`);

--
-- Indexes for table `member_file`
--
ALTER TABLE `member_file`
  ADD PRIMARY KEY (`member_file_id`);

--
-- Indexes for table `planner_profile`
--
ALTER TABLE `planner_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planner_requirement`
--
ALTER TABLE `planner_requirement`
  ADD PRIMARY KEY (`planner_requirement_id`);

--
-- Indexes for table `planner_services`
--
ALTER TABLE `planner_services`
  ADD PRIMARY KEY (`planner_services_id`);

--
-- Indexes for table `planner_status`
--
ALTER TABLE `planner_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_profile`
--
ALTER TABLE `client_profile`
  MODIFY `client_profile_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_requirement`
--
ALTER TABLE `client_requirement`
  MODIFY `client_requirement_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_review`
--
ALTER TABLE `client_review`
  MODIFY `client_review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_services`
--
ALTER TABLE `client_services`
  MODIFY `client_services_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member_detail`
--
ALTER TABLE `member_detail`
  MODIFY `member_detail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member_file`
--
ALTER TABLE `member_file`
  MODIFY `member_file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `planner_profile`
--
ALTER TABLE `planner_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `planner_requirement`
--
ALTER TABLE `planner_requirement`
  MODIFY `planner_requirement_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `planner_services`
--
ALTER TABLE `planner_services`
  MODIFY `planner_services_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `planner_status`
--
ALTER TABLE `planner_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
