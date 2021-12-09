-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Des 2021 pada 06.25
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4_hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_price` int(11) NOT NULL,
  `booking_date_start` date NOT NULL,
  `booking_date_end` date NOT NULL,
  `booking_payment_method` enum('Dana','Gopay','Ovo','') NOT NULL,
  `booking_proof_of_payment` varchar(255) NOT NULL,
  `booking_status` enum('pending','ongoing','done','') NOT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`booking_id`, `item_id`, `user_id`, `booking_price`, `booking_date_start`, `booking_date_end`, `booking_payment_method`, `booking_proof_of_payment`, `booking_status`, `admin_id`) VALUES
(12, 1, 1, 250000, '2021-12-04', '2021-12-04', 'Dana', 'WhatsApp Image 2021-12-03 at 18.35.31_14.jpeg', 'pending', 17),
(14, 2, 1, 2000000, '2021-12-04', '2021-12-12', 'Dana', 'virtual-background-sechibar_19.png', 'done', 17),
(15, 1, 10, 265000, '2021-12-29', '2021-12-30', 'Ovo', 'WhatsApp Image 2021-12-03 at 18.35.31_29.jpeg', 'pending', NULL),
(16, 1, 10, 265000, '2021-12-29', '2021-12-30', 'Ovo', 'WhatsApp Image 2021-12-03 at 18.35.31_30.jpeg', 'pending', NULL),
(17, 1, 10, 265000, '2021-12-30', '2021-12-31', 'Ovo', 'virtual-background-sechibar_28.png', 'pending', NULL),
(18, 1, 10, 265000, '2021-12-30', '2021-12-31', 'Ovo', 'virtual-background-sechibar_29.png', 'pending', NULL),
(19, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_31.png', 'pending', NULL),
(20, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_32.png', 'pending', NULL),
(21, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_34.png', 'pending', NULL),
(22, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_42.png', 'pending', NULL),
(23, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_43.png', 'pending', NULL),
(24, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_44.png', 'pending', NULL),
(25, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_46.png', 'pending', NULL),
(26, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_49.png', 'pending', NULL),
(27, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_50.png', 'pending', NULL),
(28, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_51.png', 'pending', NULL),
(29, 1, 10, 265000, '2021-12-22', '2021-12-23', 'Ovo', 'virtual-background-sechibar_52.png', 'pending', NULL),
(30, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_53.png', 'pending', NULL),
(31, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_54.png', 'pending', NULL),
(32, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_55.png', 'pending', NULL),
(33, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_57.png', 'pending', NULL),
(34, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_58.png', 'pending', NULL),
(35, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_59.png', 'pending', NULL),
(36, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_60.png', 'pending', NULL),
(37, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_61.png', 'pending', NULL),
(38, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_62.png', 'pending', NULL),
(39, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_63.png', 'pending', NULL),
(40, 1, 10, 265000, '2021-12-28', '2021-12-28', 'Ovo', 'virtual-background-sechibar_64.png', 'pending', NULL),
(41, 1, 10, 265000, '2021-12-27', '2021-12-27', 'Ovo', 'virtual-background-sechibar_65.png', 'pending', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_telp` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_telp`, `customer_address`, `customer_email`, `customer_password`) VALUES
(1, 'Siti nur baya', '081741231231', 'jl. siti apa hayo', '', ''),
(2, 'namauser1', '08123812', 'kajdwkajdisdw', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_type` enum('hotel','villa','','') NOT NULL,
  `item_city` varchar(255) NOT NULL,
  `item_address` text NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_desc` text NOT NULL,
  `item_facility` text NOT NULL,
  `item_thumbnail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_type`, `item_city`, `item_address`, `item_price`, `item_desc`, `item_facility`, `item_thumbnail`) VALUES
(1, 'Hotel indo', 'hotel', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan', 'virtual-background-sechibar_8.png'),
(2, 'Hotel indo', 'hotel', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan', 'WhatsApp Image 2021-12-03 at 18.35.31.jpeg'),
(5, 'Hotel indo', 'hotel', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan', 'virtual-background-sechibar_8.png'),
(6, 'Hotel indo', 'hotel', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan', 'WhatsApp Image 2021-12-03 at 18.35.31.jpeg'),
(7, 'Hotel indo', 'hotel', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan', 'virtual-background-sechibar_8.png'),
(8, 'Hotel indo', 'villa', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan', 'virtual-background-sechibar_8.png'),
(9, 'Villa apa ya', 'villa', 'awdawda', 'avvvvvvvvvvvv', 156555, '5awwwwwwww', 'dassssssss', 'WhatsApp Image 2021-12-03 at 18.35.31.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_image`
--

CREATE TABLE `item_image` (
  `image_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `item_image`
--

INSERT INTO `item_image` (`image_id`, `item_id`, `image_name`) VALUES
(10, 1, 'virtual-background-sechibar_6.png'),
(11, 1, 'virtual-background-sechibar_7.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_name` varchar(255) NOT NULL,
  `payment_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_name`, `payment_number`) VALUES
(1, 'Ovo', '085156113164'),
(2, 'Gopay', '085156113164'),
(3, 'Dana', '085156113164');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `role` enum('user','admin','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `address`, `telp`, `role`) VALUES
(1, 'bambang@email.com1', '!qweasdzxc11', 'ayam', 'Ini alamat11', '081831273212', 'user'),
(10, 'k@k.com1', 'admin123', 'ayam', 'acs', '081831273212', 'user'),
(11, 'admin@gmail.com', '@qweasdzxc1', 'ayam', 'cas', '123512', 'user'),
(15, 'admin@admin.com1', '123qweasd1', 'ayam', 'aca', '123512', 'user'),
(16, 'a@a.com1', '@qweasdzxc11', 'ayam', 'adadasd1', '12351212', 'user'),
(17, 'awd@ag.com1', 'asdw', 'ayam', 'sdawd', 'awda', 'admin'),
(18, 'admin@gmail.com', 'adawd', 'ayam', 'Karanganyar, Jawa Tengah1', '1235121', 'user'),
(19, 'admin@gmail.com', 'adawd', 'ayam', 'Karanganyar, Jawa Tengah1', '1235121', 'user'),
(20, 'whytrno2205@gmail.com', 'wadawd', 'ayam', 'awd', '081831273212', 'user'),
(21, 'admin@gmail.com', 'adwad', 'ayam', 'Karanganyar, Jawa Tengah1', '081831273212', 'user'),
(22, 'whytrno2205@gmail.com', '123adw', 'Surezluvy1', 'Karanganyar, Jawa Tengah1', '1235121', 'user'),
(23, 'whytrno2205@gmail.com', 'dawdasd', 'Bambang1', 'Karanganyar, Jawa Tengah1', '1235121', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indeks untuk tabel `item_image`
--
ALTER TABLE `item_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `item_image`
--
ALTER TABLE `item_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
