-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2021 at 09:12 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeigniter-language-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `configeration`
--

CREATE TABLE `configeration` (
  `id` int(11) NOT NULL,
  `Key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Value` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `configeration`
--

INSERT INTO `configeration` (`id`, `Key`, `Value`) VALUES
(1, 'default_display_language', '2');

-- --------------------------------------------------------

--
-- Table structure for table `content_holder`
--

CREATE TABLE `content_holder` (
  `id` int(11) NOT NULL,
  `Programming_Name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Page_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_holder`
--

INSERT INTO `content_holder` (`id`, `Programming_Name`, `Page_ID`) VALUES
(1, 'welcome_message_title', 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_view`
--

CREATE TABLE `content_view` (
  `id` int(11) NOT NULL,
  `Content_ID` int(11) NOT NULL,
  `Language_ID` int(11) NOT NULL,
  `Content` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_view`
--

INSERT INTO `content_view` (`id`, `Content_ID`, `Language_ID`, `Content`) VALUES
(1, 1, 1, 'Willkommen in Codeigniter Sprache db :D'),
(2, 1, 3, 'أهلا بك في مكتبة اللغة لمنصة عمل كودغنايتر :D'),
(3, 1, 2, 'Welcome to Codeigniter language db :D'),
(4, 1, 4, 'Bienvenue dans Codeigniter language db: D'),
(5, 1, 5, 'Codeigniter भाषा में आपका स्वागत है db: D'),
(6, 1, 6, 'Selamat datang di bahasa Codeigniter db: D');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `Language` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `Language`) VALUES
(1, 'German'),
(2, 'English'),
(3, 'Arabic'),
(4, 'French'),
(5, 'Hindi'),
(6, 'Bahasa');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `Name`) VALUES
(1, 'welcome_message');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configeration`
--
ALTER TABLE `configeration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_holder`
--
ALTER TABLE `content_holder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Content_Page1_idx` (`Page_ID`);

--
-- Indexes for table `content_view`
--
ALTER TABLE `content_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ContentDescription_Language1_idx` (`Language_ID`),
  ADD KEY `fk_ContentView_Content1_idx` (`Content_ID`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name_UNIQUE` (`Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configeration`
--
ALTER TABLE `configeration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content_holder`
--
ALTER TABLE `content_holder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `content_view`
--
ALTER TABLE `content_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_holder`
--
ALTER TABLE `content_holder`
  ADD CONSTRAINT `content_holder_ibfk_1` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content_view`
--
ALTER TABLE `content_view`
  ADD CONSTRAINT `content_view_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `content_holder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_view_ibfk_2` FOREIGN KEY (`Language_ID`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
