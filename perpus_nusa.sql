-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for verafoute
CREATE DATABASE IF NOT EXISTS `verafoute` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `verafoute`;

-- Dumping structure for table verafoute.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `id_b` int(11) NOT NULL AUTO_INCREMENT,
  `nama_b` varchar(50) NOT NULL,
  `harga_b` int(11) NOT NULL,
  `stok_b` int(11) NOT NULL DEFAULT 0,
  `id_k` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_b`),
  KEY `id_k` (`id_k`),
  CONSTRAINT `FK_barang_kategori` FOREIGN KEY (`id_k`) REFERENCES `kategori` (`id_k`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table verafoute.barang: ~15 rows (approximately)
INSERT INTO `barang` (`id_b`, `nama_b`, `harga_b`, `stok_b`, `id_k`) VALUES
	(1, 'Sapu', 15000, 20, 1),
	(2, 'Ember', 10000, 30, 1),
	(3, 'Pel', 12000, 20, 1),
	(4, 'Lemari', 400000, 15, 3),
	(5, 'Sikat', 5000, 25, 1),
	(6, 'Gayung', 12000, 20, 2),
	(7, 'Piring', 8000, 40, 4),
	(8, 'Gelas', 10000, 40, 4),
	(9, 'Rak', 30000, 25, 3),
	(10, 'Sendok', 3000, 50, 4),
	(11, 'Garpu', 3000, 45, 4),
	(12, 'Panci', 25000, 30, 2),
	(13, 'Spatula', 20000, 40, 2),
	(14, 'Wajan', 23000, 25, 2),
	(15, 'Saringan', 15000, 20, 2);

-- Dumping structure for table verafoute.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_k` int(11) NOT NULL AUTO_INCREMENT,
  `nama_k` varchar(50) NOT NULL,
  PRIMARY KEY (`id_k`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table verafoute.kategori: ~5 rows (approximately)
INSERT INTO `kategori` (`id_k`, `nama_k`) VALUES
	(1, 'Alat Kebersihan'),
	(2, 'Alat Masak'),
	(3, 'Tempat Penyimpanan'),
	(4, 'Alat Mandi'),
	(5, 'Lain-lain');

-- Dumping structure for table verafoute.pembeli
CREATE TABLE IF NOT EXISTS `pembeli` (
  `id_p` int(11) NOT NULL AUTO_INCREMENT,
  `nama_p` varchar(50) NOT NULL DEFAULT '',
  `alamat_p` varchar(50) NOT NULL DEFAULT '',
  `notelp_p` varchar(50) NOT NULL DEFAULT '',
  `username_p` varchar(50) NOT NULL DEFAULT '',
  `password_p` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table verafoute.pembeli: ~4 rows (approximately)
INSERT INTO `pembeli` (`id_p`, `nama_p`, `alamat_p`, `notelp_p`, `username_p`, `password_p`) VALUES
	(1, 'Alif', 'Haurmekar', '081234567899', 'alif', '1111'),
	(2, 'Bariq', 'Jatinangor', '081234321112', 'bariq', '2222'),
	(3, 'Tsabina', 'Purwakarta', '081111111111', 'tsabina', '3333'),
	(4, 'Jejen', 'Cimahi', '081234123412', 'jejen', '4444');

-- Dumping structure for table verafoute.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_t` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_t` varchar(50) NOT NULL DEFAULT '',
  `id_b` int(11) NOT NULL,
  `jml_t` int(11) NOT NULL,
  `total_t` int(11) NOT NULL,
  `id_p` int(11) NOT NULL,
  PRIMARY KEY (`id_t`),
  KEY `id_b` (`id_b`),
  KEY `id_p` (`id_p`),
  CONSTRAINT `FK_transaksi_barang` FOREIGN KEY (`id_b`) REFERENCES `barang` (`id_b`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaksi_pembeli` FOREIGN KEY (`id_p`) REFERENCES `pembeli` (`id_p`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table verafoute.transaksi: ~12 rows (approximately)
INSERT INTO `transaksi` (`id_t`, `tgl_t`, `id_b`, `jml_t`, `total_t`, `id_p`) VALUES
	(1, '5/25/22', 2, 1, 10000, 1),
	(2, '5/25/22', 1, 1, 15000, 1),
	(3, '5/26/22', 3, 1, 12000, 2),
	(4, '5/28/22', 1, 3, 45000, 1),
	(5, '5/28/22', 5, 5, 25000, 2),
	(6, '5/28/22', 4, 16, 6400000, 3),
	(7, '5/28/22', 15, 20, 315000, 1),
	(10, '5/30/22', 12, 2, 50000, 4),
	(11, '5/30/22', 9, 2, 60000, 2),
	(12, '5/30/22', 6, 2, 24000, 1),
	(13, '5/31/22', 13, 5, 100000, 4),
	(14, '5/31/22', 11, 5, 15000, 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
