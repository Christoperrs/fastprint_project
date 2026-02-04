-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 04, 2026 at 09:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_programmer`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'L MTH AKSESORIS (IM)'),
(3, 'L MTH TABUNG (LK)'),
(4, 'SP MTH SPAREPART (LK)'),
(5, 'CI MTH TINTA LAIN (IM)'),
(6, 'L MTH AKSESORIS (LK)'),
(7, 'S MTH STEMPEL (IM)'),
(8, 'asdasd'),
(9, 'L QUEENLY');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `kategori_id`, `status_id`) VALUES
(9, 'ALUMUNIUM FOIL ALL IN ONE BULAT 23mm IMss', '1000.00', 2, 1),
(11, 'ALUMUNIUM FOIL ALL IN ONE BULAT 30mm IM', '1000.00', 2, 1),
(12, 'ALUMUNIUM FOIL ALL IN ONE SHEET 250mm IM', '12500.00', 2, 2),
(15, 'ALUMUNIUM FOIL HDPE/PE BULAT 23mm IM', '12500.00', 2, 1),
(17, 'ALUMUNIUM FOIL HDPE/PE BULAT 30mm IM', '1000.00', 2, 1),
(18, 'ALUMUNIUM FOIL HDPE/PE SHEET 250mm IM', '13000.00', 2, 2),
(19, 'ALUMUNIUM FOIL PET SHEET 250mm IM', '1000.00', 2, 2),
(22, 'ARM PENDEK MODEL U', '13000.00', 2, 1),
(23, 'ARM SUPPORT KECIL', '13000.00', 3, 2),
(24, 'ARM SUPPORT KOTAK PUTIH', '13000.00', 2, 2),
(26, 'ARM SUPPORT PENDEK POLOS', '13000.00', 3, 1),
(27, 'ARM SUPPORT S IM', '1000.00', 2, 2),
(28, 'ARM SUPPORT T (IMPORT)', '13000.00', 2, 1),
(29, 'ARM SUPPORT T - MODEL 1 ( LOKAL )', '10000.00', 3, 1),
(50, 'BLACK LASER TONER FP-T3 (100gr)', '13000.00', 2, 2),
(56, 'BODY PRINTER CANON IP2770', '500.00', 4, 1),
(58, 'BODY PRINTER T13X', '15000.00', 4, 1),
(59, 'BOTOL 1000ML BLUE KHUSUS UNTUK EPSON R1800/R800 - 4180 IM (T054920)', '10000.00', 5, 1),
(60, 'BOTOL 1000ML CYAN KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4120 IM (T054220)', '10000.00', 5, 2),
(61, 'BOTOL 1000ML GLOSS OPTIMIZER KHUSUS UNTUK EPSON R1800/R800/R1900/R2000/IX7000/MG6170 - 4100 IM (T054020)', '1500.00', 5, 1),
(62, 'BOTOL 1000ML L.LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0599 IM', '1500.00', 5, 2),
(63, 'BOTOL 1000ML LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0597 IM', '1500.00', 5, 2),
(64, 'BOTOL 1000ML MAGENTA KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4140 IM (T054320)', '1000.00', 5, 1),
(65, 'BOTOL 1000ML MATTE BLACK KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 3503 IM (T054820)', '1500.00', 5, 2),
(66, 'BOTOL 1000ML ORANGE KHUSUS UNTUK EPSON R1900/R2000 IM - 4190 (T087920)', '1500.00', 5, 1),
(67, 'BOTOL 1000ML RED KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4170 IM (T054720)', '1000.00', 5, 2),
(68, 'BOTOL 1000ML YELLOW KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4160 IM (T054420)', '1500.00', 5, 2),
(70, 'BOTOL KOTAK 100ML LK', '1000.00', 6, 1),
(72, 'BOTOL 10ML IM', '1000.00', 7, 2),
(343, 'dsfdsf', '100.00', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `nama_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `nama_status`) VALUES
(1, 'bisa dijual'),
(2, 'tidak bisa dijual');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `fk_kategori` (`kategori_id`),
  ADD KEY `fk_status` (`status_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id_kategori`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
