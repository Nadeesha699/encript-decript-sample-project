-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 12:43 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udata`
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `MID` int(10) NOT NULL,
  `sendMessage` blob DEFAULT NULL,
  `UID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`MID`, `sendMessage`, `UID`) VALUES
(1, 0xf69aae3d99fdcc10d7ad9819606456d8b5bd7dfea1, 1),
(2, 0x71c4ca3b8119dde313cab4ea0486d2172f9ff4385cc2, 2),
(3, 0x6a28b58c396fbf9b302bed4effa96ec5106b234591c5, 3),
(4, 0x5bc0c4368c15678a0bc95c8f64584a48b3670476f7, 4),
(5, 0x2b4d47b44df3bffc136be31831bd1aec4c8d5bb717, 5),
(6, 0x512caa813261abba91ace7564ddaa47adf1e3335f32459409f, 8),
(7, 0x475f89bc67aad307ec34fcd43036899aa6fe36242c016d, 10),
(8, 0x8c548f8b2642514b83f216bc3feb31f8f592c3d8d22889f4db7cf24a0adac2a887491f30f28e6f, 11),
(9, 0x7f1d012774a5c7081e18557a745a03b3aeb1e62fd30aff3c3de81aaa, 12),
(10, 0x69fe15f3c2aa6cb5276537babeca764ad7f8acd059c351125902eaca, 13),
(11, 0x8c548f8b264c514b83f216bc5113701c2d15f2e82ea0439aa280cc38, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UID` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `username`, `password`, `role`) VALUES
(1, 'Nadeesha', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'user'),
(2, 'Amara', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'admin'),
(3, 'Sama', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'user'),
(4, 'Saman', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'admin'),
(5, 'Daka', 'f2526ef2e778f31b0ab801dfbcb29734879290a82face048fc50d14e9ec755dc9e168aa504ed2fc53fbea61ec45f8152dad8259b58cad5cdd40dd29e3c5a7b64', 'user'),
(6, 'Samat', 'f2526ef2e778f31b0ab801dfbcb29734879290a82face048fc50d14e9ec755dc9e168aa504ed2fc53fbea61ec45f8152dad8259b58cad5cdd40dd29e3c5a7b64', 'user'),
(7, 'Hera', 'f2526ef2e778f31b0ab801dfbcb29734879290a82face048fc50d14e9ec755dc9e168aa504ed2fc53fbea61ec45f8152dad8259b58cad5cdd40dd29e3c5a7b64', 'user'),
(8, 'kl', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'user'),
(9, 'sam', 'f2526ef2e778f31b0ab801dfbcb29734879290a82face048fc50d14e9ec755dc9e168aa504ed2fc53fbea61ec45f8152dad8259b58cad5cdd40dd29e3c5a7b64', 'user'),
(10, 'thai', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'user'),
(11, 'Nadiya', 'f2526ef2e778f31b0ab801dfbcb29734879290a82face048fc50d14e9ec755dc9e168aa504ed2fc53fbea61ec45f8152dad8259b58cad5cdd40dd29e3c5a7b64', 'user'),
(12, 'Nadeesha', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'user'),
(13, 'Nadeesha', '1195bf826b1333f59258e3ccf2fedabbfa9a589a93682bc75bf0c45304746268a0e06e2fc931551dd5e1b53f70f240177e03fbeaebc27a28b7290d599bd44b73', 'user'),
(14, 'Nadeesha', 'f2526ef2e778f31b0ab801dfbcb29734879290a82face048fc50d14e9ec755dc9e168aa504ed2fc53fbea61ec45f8152dad8259b58cad5cdd40dd29e3c5a7b64', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`MID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `MID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
