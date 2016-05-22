-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2016 at 07:20 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_tbwebservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_username` varchar(100) NOT NULL,
  `customer_password` varchar(100) NOT NULL,
  `customer_nama` varchar(50) NOT NULL,
  `customer_alamat` varchar(255) NOT NULL,
  `customer_email` varchar(200) NOT NULL,
  `customer_notel` varchar(12) NOT NULL,
  `customer_asal` varchar(100) NOT NULL,
  `customer_foto` varchar(200) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_username`, `customer_password`, `customer_nama`, `customer_alamat`, `customer_email`, `customer_notel`, `customer_asal`, `customer_foto`) VALUES
(9, 'ali', '86318e52f5ed4801abe1d13d509443de', 'Ali Abdul Wahid', 'Cibiru', 'customer1@gmail.com', '081000000000', 'Bandung', 'default.jpg'),
(10, 'yusuf', 'dd2eb170076a5dec97cdbbbbff9a4405', 'Muhammad Yusuf', 'Cianjur', 'customer2@gmail.com', '08222222222', 'Bandung', 'default.jpg'),
(11, 'dafi', '2aae35ed78c2fc395400fad3fae2135a', 'Muhammad Khadafi', 'Bogor', 'customer3@gmail.com', '0833333333', 'BAndung', 'default.jpg'),
(12, 'irfan', '24b90bc48a67ac676228385a7c71a119', 'Irfan Mayendra Putra', 'Lampung', 'customer4@gmail.com', '08444444444', 'Bandung', 'default.jpg'),
(13, 'wandy', '8c42eb74416a43751076e754f1cf87e5', 'Wandy Tua Simatupang', 'Medan', 'customer4@gmail.com', '08555555555', 'Bandung', 'default.jpg'),
(14, 'rahma', 'b007b7d6520a7b3dcccd2a1ec2891009', 'Rahmatul Ridha', 'Lampung', 'customer6@gmail.com', '08666666666', 'Bandung', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_nama` varchar(40) NOT NULL,
  `kategori_icon` varchar(40) NOT NULL,
  `kategori_color` varchar(40) NOT NULL,
  `kategori_post` datetime NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`, `kategori_icon`, `kategori_color`, `kategori_post`) VALUES
(1, 'Pakaian', 'ion-tshirt', 'yellow', '2016-05-10 10:01:31'),
(2, 'Laptop', 'ion-laptop', 'red', '2016-05-10 10:01:31'),
(3, 'Mobil', 'ion-model-s', 'orange', '2016-05-10 10:01:31'),
(4, 'Komputer', 'ion-ios-monitor-outline', 'green', '2016-05-10 10:01:31'),
(5, 'Olahraga', 'ion-ios-football', 'blue', '2016-05-10 10:01:31'),
(6, 'Sepeda', 'ion-android-bicycle', 'purple', '2016-05-10 10:01:31'),
(7, 'Handphone', 'ion-iphone', 'gray', '2016-05-10 10:01:31'),
(8, 'Camera', 'ion-ios-camera-outline', 'black', '2016-05-10 10:01:31'),
(9, 'Joystick', 'ion-ios-game-controller-b-outline', 'cyan', '2016-05-10 10:01:31'),
(10, 'Playstation', 'ion-playstation', 'blue', '2016-05-10 10:01:31');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `pembelian_id` int(5) NOT NULL AUTO_INCREMENT,
  `pembelian_jumlah` int(100) NOT NULL,
  `pembelian_ongkir` int(100) NOT NULL,
  `pembelian_tujuan` varchar(255) NOT NULL,
  `pembelian_harga` int(100) NOT NULL,
  `pembelian_post` datetime NOT NULL,
  `pembelian_sampai` datetime NOT NULL,
  `customer_id` int(5) NOT NULL,
  `produk_id` int(5) NOT NULL,
  PRIMARY KEY (`pembelian_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`pembelian_id`, `pembelian_jumlah`, `pembelian_ongkir`, `pembelian_tujuan`, `pembelian_harga`, `pembelian_post`, `pembelian_sampai`, `customer_id`, `produk_id`) VALUES
(71, 1, 20000, 'Cibiru', 270000, '2016-05-22 07:13:53', '2016-05-29 07:13:53', 9, 98904),
(72, 3, 20000, 'Cibiru', 12320000, '2016-05-22 07:14:24', '2016-05-29 07:14:24', 9, 98917),
(73, 2, 20000, 'Cianjur', 70000, '2016-05-22 07:15:04', '2016-05-29 07:15:04', 10, 98903),
(74, 1, 20000, 'Cianjur', 7220000, '2016-05-22 07:15:11', '2016-05-29 07:15:11', 10, 98919),
(75, 1, 20000, 'Cianjur', 6520000, '2016-05-22 07:15:19', '2016-05-29 07:15:19', 10, 98916),
(76, 1, 20000, 'Cianjur', 75000, '2016-05-22 07:16:39', '2016-05-29 07:16:39', 10, 98918),
(77, 1, 20000, 'Bogor', 2220000, '2016-05-22 07:17:17', '2016-05-29 07:17:17', 11, 98913),
(78, 10, 20000, 'Bogor', 1220000, '2016-05-22 07:17:20', '2016-05-29 07:17:20', 11, 98911),
(79, 1, 20000, 'Lampung', 7020000, '2016-05-22 07:18:20', '2016-05-29 07:18:20', 12, 98910),
(80, 1, 20000, 'Lampung', 5720000, '2016-05-22 07:18:34', '2016-05-29 07:18:34', 12, 98905),
(81, 1, 20000, 'Medan', 10020000, '2016-05-22 07:19:47', '2016-05-29 07:19:47', 13, 98907),
(82, 2, 20000, 'Lampung', 220000, '2016-05-22 07:20:35', '2016-05-29 07:20:35', 14, 98900);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `produk_id` int(5) NOT NULL AUTO_INCREMENT,
  `produk_nama` varchar(40) NOT NULL,
  `produk_deskripsi` varchar(255) NOT NULL,
  `produk_gambar` varchar(200) NOT NULL,
  `produk_harga` int(100) NOT NULL,
  `produk_terjual` int(100) NOT NULL,
  `produk_pesan_min` int(5) NOT NULL,
  `produk_kondisi` varchar(50) NOT NULL,
  `produk_stock` int(100) NOT NULL,
  `produk_post` datetime NOT NULL,
  `kategori_id` int(5) NOT NULL,
  `toko_id` int(5) NOT NULL,
  PRIMARY KEY (`produk_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=98920 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_nama`, `produk_deskripsi`, `produk_gambar`, `produk_harga`, `produk_terjual`, `produk_pesan_min`, `produk_kondisi`, `produk_stock`, `produk_post`, `kategori_id`, `toko_id`) VALUES
(98900, 'Jaket Parasit', 'Ukuran All Size', '1.png', 100000, 2, 1, 'Baru', 98, '2016-05-22 06:15:56', 1, 1),
(98901, 'Baju Jersey MU', 'Ukuran All Size, KW Thailand', 'tshirt2.png', 90000, 10, 1, 'Baru', 20, '2016-05-22 06:23:56', 1, 1),
(98902, 'Baju Jersey Real Madrid', 'All Size KW Thailand', 'tshirt1.png', 80000, 27, 10, 'Baru', 200, '2016-05-22 06:30:15', 1, 1),
(98903, 'Celana hawaii', 'Ukuran L dan M saja', 'tshirt3.jpg', 25000, 2, 1, 'Bekas', 8, '2016-05-22 06:34:05', 1, 1),
(98904, 'Celana Jeans', 'Ukuran XL, L , M , dan S', 'tshirt5.jpg', 250000, 91, 1, 'Baru', 299, '2016-05-22 06:37:04', 1, 1),
(98905, 'Laptop Asus', 'Laptop Keluaran Terbaru Spesifikasi Mantap!!', 'laptop1.png', 5700000, 3, 1, 'Baru', 11, '2016-05-22 06:43:53', 2, 1),
(98906, 'Laptop Toshiba', 'Masih Bagus Baru 2 Bulan', 'laptop2.jpg', 3100000, 1, 1, 'Bekas', 1, '2016-05-22 06:47:28', 2, 1),
(98907, 'Mobil Avanza', 'Hemat Bahan Bakar', '3.png', 10000000, 3, 1, 'Baru', 2, '2016-05-22 06:48:16', 3, 1),
(98908, 'Mobil Isuzu Panther', 'Bahan Bakar Hemat', 'mobil2.jpg', 75000000, 9, 1, 'Baru', 10, '2016-05-22 06:48:52', 3, 1),
(98909, 'Komputer HP White', 'Komputer', 'komputer hp1.png', 7500000, 2, 1, 'Baru', 9, '2016-05-22 06:52:39', 4, 1),
(98910, 'Komputer HP Black', 'Warna Hitam', 'komputer hp2.png', 7000000, 2, 1, 'Baru', 1, '2016-05-22 06:53:22', 4, 1),
(98911, 'Bola', 'Bola Sepakbola', 'olahraga1.png', 120000, 100, 1, 'Baru', 440, '2016-05-22 06:58:14', 5, 1),
(98912, 'Sepeda Gunung Warna Merah', 'Kuat sampai 5 tahun', 'sepeda1.png', 2200000, 10, 1, 'Baru', 91, '2016-05-22 07:05:40', 6, 1),
(98913, 'Sepeda Gunung Warna Biru', 'Kuat Sampai 5 Tahun', 'sepeda2.png', 2200000, 13, 1, 'Baru', 22, '2016-05-22 07:06:13', 6, 1),
(98914, 'Sepeda Ontel', 'Langkaa', 'sepeda3.jpg', 9000000, 2, 1, 'Baru', 7, '2016-05-22 07:06:50', 6, 1),
(98915, 'Oppo', 'Keluaran Terbaru', 'handphone1.png', 2350000, 9, 1, 'Baru', 8, '2016-05-22 07:08:02', 7, 1),
(98916, 'Iphone S6', 'Elegeant', '2.png', 6500000, 11, 1, 'Baru', 4, '2016-05-22 07:08:30', 7, 1),
(98917, 'Camera C360', '12 MG Pixels', 'camera1.png', 4100000, 37, 1, 'Baru', 99, '2016-05-22 07:10:10', 8, 1),
(98918, 'Joystick PS2', 'USB PORT', 'joystick.png', 55000, 94, 1, 'Baru', 238, '2016-05-22 07:11:05', 9, 1),
(98919, 'PS4', 'PLAYSTATION', '5.png', 7200000, 5, 1, 'Baru', 89, '2016-05-22 07:11:39', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE IF NOT EXISTS `toko` (
  `toko_id` int(5) NOT NULL DEFAULT '0',
  `toko_nama` varchar(200) NOT NULL,
  `toko_alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`toko_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`toko_id`, `toko_nama`, `toko_alamat`) VALUES
(1, 'Toko Online', 'Jakarta, Headquarter no.49a');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_foto` varchar(255) NOT NULL,
  `user_nama` varchar(40) NOT NULL,
  `user_post` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `user_foto`, `user_nama`, `user_post`) VALUES
(1, 'admin', '$2a$10$c2892a976d5d89373ee96eHTnmASMA4nrMRZffp9qUcOutX05IB0S', 'default.jpg', 'Administrator', '2016-05-13 02:00:09');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
