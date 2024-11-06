-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2024 at 08:51 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tesss`
--

-- --------------------------------------------------------

--
-- Table structure for table `biaya`
--

CREATE TABLE `biaya` (
  `id_biaya` int(11) NOT NULL,
  `id_operasi` int(11) DEFAULT 0,
  `id_petugas` int(11) DEFAULT 0,
  `id_status_pembayaran` int(11) DEFAULT 0,
  `biaya_sandar` double NOT NULL,
  `biaya_bongkar_muatan` double NOT NULL,
  `biaya_penangganan_muatan` double NOT NULL,
  `biaya_perawatan` double NOT NULL,
  `biaya_lain` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kapal_terminal`
--

CREATE TABLE `jenis_kapal_terminal` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kapal`
--

CREATE TABLE `kapal` (
  `id_kapal` int(11) NOT NULL,
  `id_jenis_kapal` int(11) DEFAULT 0,
  `nama_kapal` varchar(50) NOT NULL,
  `nomor_seri` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `operasi_kapal`
--

CREATE TABLE `operasi_kapal` (
  `id_operasi` int(11) NOT NULL,
  `id_terminal` int(11) DEFAULT 0,
  `id_kapal` int(11) DEFAULT 0,
  `id_petugas` int(11) DEFAULT 0,
  `id_status_operasi` int(11) DEFAULT 0,
  `tgl_datang` date NOT NULL,
  `wkt_datang` time NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `wkt_berangkat` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `id_jabatan` int(11) DEFAULT 0,
  `nama_petugas` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status_operasi`
--

CREATE TABLE `status_operasi` (
  `id_status` int(11) NOT NULL,
  `nama_operasi` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status_pembayaran`
--

CREATE TABLE `status_pembayaran` (
  `id_status_pembayaran` int(11) NOT NULL,
  `status_pembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status_terminal`
--

CREATE TABLE `status_terminal` (
  `id_status` int(11) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `terminal`
--

CREATE TABLE `terminal` (
  `id_terminal` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT 0,
  `id_status_terminal` int(11) DEFAULT 0,
  `nama_terminal` varchar(50) NOT NULL,
  `kapasitas_terminal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biaya`
--
ALTER TABLE `biaya`
  ADD PRIMARY KEY (`id_biaya`),
  ADD KEY `id_operasi` (`id_operasi`),
  ADD KEY `id_status_pembayaran` (`id_status_pembayaran`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`),
  ADD UNIQUE KEY `nama_jabatan` (`nama_jabatan`);

--
-- Indexes for table `jenis_kapal_terminal`
--
ALTER TABLE `jenis_kapal_terminal`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `kapal`
--
ALTER TABLE `kapal`
  ADD PRIMARY KEY (`id_kapal`),
  ADD KEY `id_jenis_kapal` (`id_jenis_kapal`);

--
-- Indexes for table `operasi_kapal`
--
ALTER TABLE `operasi_kapal`
  ADD PRIMARY KEY (`id_operasi`),
  ADD KEY `id_terminal` (`id_terminal`),
  ADD KEY `id_kapal` (`id_kapal`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_status_operasi_ibfk_1` (`id_status_operasi`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `status_operasi`
--
ALTER TABLE `status_operasi`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  ADD PRIMARY KEY (`id_status_pembayaran`);

--
-- Indexes for table `status_terminal`
--
ALTER TABLE `status_terminal`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `terminal`
--
ALTER TABLE `terminal`
  ADD PRIMARY KEY (`id_terminal`),
  ADD KEY `terminal_ibfk_1` (`id_jenis`),
  ADD KEY `id_status_terminal_ibfk_1` (`id_status_terminal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biaya`
--
ALTER TABLE `biaya`
  MODIFY `id_biaya` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_kapal_terminal`
--
ALTER TABLE `jenis_kapal_terminal`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kapal`
--
ALTER TABLE `kapal`
  MODIFY `id_kapal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operasi_kapal`
--
ALTER TABLE `operasi_kapal`
  MODIFY `id_operasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_operasi`
--
ALTER TABLE `status_operasi`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  MODIFY `id_status_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_terminal`
--
ALTER TABLE `status_terminal`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terminal`
--
ALTER TABLE `terminal`
  MODIFY `id_terminal` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biaya`
--
ALTER TABLE `biaya`
  ADD CONSTRAINT `biaya_ibfk_1` FOREIGN KEY (`id_operasi`) REFERENCES `operasi_kapal` (`id_operasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `biaya_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `biaya_ibfk_5` FOREIGN KEY (`id_status_pembayaran`) REFERENCES `status_pembayaran` (`id_status_pembayaran`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kapal`
--
ALTER TABLE `kapal`
  ADD CONSTRAINT `kapal_ibfk_1` FOREIGN KEY (`id_jenis_kapal`) REFERENCES `jenis_kapal_terminal` (`id_jenis`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `operasi_kapal`
--
ALTER TABLE `operasi_kapal`
  ADD CONSTRAINT `id_status_operasi_ibfk_1` FOREIGN KEY (`id_status_operasi`) REFERENCES `status_operasi` (`id_status`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_kapal_ibfk_1` FOREIGN KEY (`id_terminal`) REFERENCES `terminal` (`id_terminal`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_kapal_ibfk_2` FOREIGN KEY (`id_kapal`) REFERENCES `kapal` (`id_kapal`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_kapal_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `terminal`
--
ALTER TABLE `terminal`
  ADD CONSTRAINT `id_status_terminal_ibfk_1` FOREIGN KEY (`id_status_terminal`) REFERENCES `status_terminal` (`id_status`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `terminal_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_kapal_terminal` (`id_jenis`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
