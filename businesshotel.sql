-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 02:02 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `businesshotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `hoteli`
--

CREATE TABLE `hoteli` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `menadzer_id` int(11) NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `telefon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iznajmljeno`
--

CREATE TABLE `iznajmljeno` (
  `id` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `soba_id` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `poeni` int(11) NOT NULL,
  `ostajedana` int(10) NOT NULL,
  `komentar` varchar(255) NOT NULL,
  `datum_iznajmljeno` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hotel` varchar(50) NOT NULL,
  `status` enum('Iznajmljeno','Upotreba','Otisao') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipsobe`
--

CREATE TABLE `tipsobe` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `kreveti` int(11) NOT NULL,
  `brojsoba` int(11) NOT NULL,
  `brojslobodnih` int(11) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` int(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` enum('administrator','menadzer','korisnik','') NOT NULL,
  `poeni` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hoteli`
--
ALTER TABLE `hoteli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menadzer_id` (`menadzer_id`),
  ADD KEY `naziv` (`naziv`);

--
-- Indexes for table `iznajmljeno`
--
ALTER TABLE `iznajmljeno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `korisnik_id` (`korisnik_id`),
  ADD KEY `soba_id` (`soba_id`),
  ADD KEY `hotel` (`hotel`);

--
-- Indexes for table `tipsobe`
--
ALTER TABLE `tipsobe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iznajmljeno`
--
ALTER TABLE `iznajmljeno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipsobe`
--
ALTER TABLE `tipsobe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hoteli`
--
ALTER TABLE `hoteli`
  ADD CONSTRAINT `hoteli_ibfk_1` FOREIGN KEY (`menadzer_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `iznajmljeno`
--
ALTER TABLE `iznajmljeno`
  ADD CONSTRAINT `iznajmljeno_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `iznajmljeno_ibfk_2` FOREIGN KEY (`hotel`) REFERENCES `hoteli` (`naziv`),
  ADD CONSTRAINT `iznajmljeno_ibfk_3` FOREIGN KEY (`soba_id`) REFERENCES `tipsobe` (`id`);

--
-- Constraints for table `tipsobe`
--
ALTER TABLE `tipsobe`
  ADD CONSTRAINT `tipsobe_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hoteli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
