-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 05:15 PM
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
-- Database: `si_relasipelangantokoroti`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `Id_pelangan` int(11) NOT NULL,
  `id_distributor` int(11) NOT NULL,
  `password` int(20) NOT NULL,
  `username_admin` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `id_distributor` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `merek_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `kualitas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `alamat_distributor` varchar(30) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `jumlah_barang` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_transaksi`
--

CREATE TABLE `jenis_transaksi` (
  `id_jenistransaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tunai` int(50) NOT NULL,
  `kredit` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE `konsumen` (
  `id_konsumen` int(11) NOT NULL,
  `nama_konsumen` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelangan`
--

CREATE TABLE `pelangan` (
  `Id_pelangan` int(11) NOT NULL,
  `Id_poin` int(11) NOT NULL,
  `nama_pelangan` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penukaran_poin`
--

CREATE TABLE `penukaran_poin` (
  `id_penukaran` int(11) NOT NULL,
  `id_poin` int(11) NOT NULL,
  `jumlah_poin` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poin`
--

CREATE TABLE `poin` (
  `id_poin` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `total_poin` int(100) NOT NULL,
  `poin_transaksi` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_konsumen`
--

CREATE TABLE `riwayat_konsumen` (
  `id_riwayatkonsumen` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `total_transaksi` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pelangan`
--

CREATE TABLE `riwayat_pelangan` (
  `id_riwayatpelangan` int(11) NOT NULL,
  `id_pelangan` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `total_transaksi` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saran_dan_kritik`
--

CREATE TABLE `saran_dan_kritik` (
  `id_sarandantransaksi` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `id_pelangan` int(11) NOT NULL,
  `nama_pengirim` int(50) NOT NULL,
  `email` int(50) NOT NULL,
  `saran_kritik` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_poin` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pelangan` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `tangal_transaksi` date NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `poin_transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_konsumen` (`id_konsumen`,`Id_pelangan`,`id_distributor`),
  ADD KEY `Id_pelangan` (`Id_pelangan`),
  ADD KEY `id_distributor` (`id_distributor`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_distributor` (`id_distributor`,`id_admin`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `jenis_transaksi`
--
ALTER TABLE `jenis_transaksi`
  ADD PRIMARY KEY (`id_jenistransaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`id_konsumen`);

--
-- Indexes for table `pelangan`
--
ALTER TABLE `pelangan`
  ADD PRIMARY KEY (`Id_pelangan`),
  ADD KEY `Id_poin` (`Id_poin`);

--
-- Indexes for table `penukaran_poin`
--
ALTER TABLE `penukaran_poin`
  ADD PRIMARY KEY (`id_penukaran`),
  ADD KEY `id_poin` (`id_poin`);

--
-- Indexes for table `poin`
--
ALTER TABLE `poin`
  ADD PRIMARY KEY (`id_poin`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `riwayat_konsumen`
--
ALTER TABLE `riwayat_konsumen`
  ADD PRIMARY KEY (`id_riwayatkonsumen`),
  ADD KEY `id_transaksi` (`id_transaksi`,`id_konsumen`),
  ADD KEY `id_konsumen` (`id_konsumen`);

--
-- Indexes for table `riwayat_pelangan`
--
ALTER TABLE `riwayat_pelangan`
  ADD PRIMARY KEY (`id_riwayatpelangan`),
  ADD KEY `id_pelangan` (`id_pelangan`,`id_transaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `saran_dan_kritik`
--
ALTER TABLE `saran_dan_kritik`
  ADD PRIMARY KEY (`id_sarandantransaksi`),
  ADD KEY `id_konsumen` (`id_konsumen`,`id_pelangan`),
  ADD KEY `id_pelangan` (`id_pelangan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_poin` (`id_poin`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pelangan` (`id_pelangan`),
  ADD KEY `id_konsumen` (`id_konsumen`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id_konsumen`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`Id_pelangan`) REFERENCES `pelangan` (`Id_pelangan`),
  ADD CONSTRAINT `admin_ibfk_3` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`);

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`),
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `distributor`
--
ALTER TABLE `distributor`
  ADD CONSTRAINT `distributor_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `jenis_transaksi`
--
ALTER TABLE `jenis_transaksi`
  ADD CONSTRAINT `jenis_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `pelangan`
--
ALTER TABLE `pelangan`
  ADD CONSTRAINT `pelangan_ibfk_1` FOREIGN KEY (`Id_poin`) REFERENCES `poin` (`id_poin`);

--
-- Constraints for table `penukaran_poin`
--
ALTER TABLE `penukaran_poin`
  ADD CONSTRAINT `penukaran_poin_ibfk_1` FOREIGN KEY (`id_poin`) REFERENCES `poin` (`id_poin`);

--
-- Constraints for table `poin`
--
ALTER TABLE `poin`
  ADD CONSTRAINT `poin_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `riwayat_konsumen`
--
ALTER TABLE `riwayat_konsumen`
  ADD CONSTRAINT `riwayat_konsumen_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `riwayat_konsumen_ibfk_2` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id_konsumen`);

--
-- Constraints for table `riwayat_pelangan`
--
ALTER TABLE `riwayat_pelangan`
  ADD CONSTRAINT `riwayat_pelangan_ibfk_1` FOREIGN KEY (`id_pelangan`) REFERENCES `pelangan` (`Id_pelangan`),
  ADD CONSTRAINT `riwayat_pelangan_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `saran_dan_kritik`
--
ALTER TABLE `saran_dan_kritik`
  ADD CONSTRAINT `saran_dan_kritik_ibfk_1` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id_konsumen`),
  ADD CONSTRAINT `saran_dan_kritik_ibfk_2` FOREIGN KEY (`id_pelangan`) REFERENCES `pelangan` (`Id_pelangan`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_poin`) REFERENCES `poin` (`id_poin`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_pelangan`) REFERENCES `pelangan` (`Id_pelangan`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id_konsumen`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
