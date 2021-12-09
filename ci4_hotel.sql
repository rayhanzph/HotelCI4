-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Des 2021 pada 06.23
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
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_photo` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_photo`, `admin_email`, `admin_password`) VALUES
(1, 'Wahyu Triono', 'ayam.jpg', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `booking_duration` int(11) NOT NULL,
  `booking_price` int(11) NOT NULL,
  `booking_date_start` date NOT NULL,
  `booking_date_end` date NOT NULL,
  `booking_proof_of_payment` varchar(255) NOT NULL,
  `booking_status` enum('pending','ongoing','done','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`booking_id`, `item_id`, `customer_id`, `booking_duration`, `booking_price`, `booking_date_start`, `booking_date_end`, `booking_proof_of_payment`, `booking_status`) VALUES
(1, 1, 2, 5, 250000, '2021-12-04', '2021-12-06', 'bukti.jpg', 'done'),
(2, 1, 1, 5, 250000, '2021-12-04', '2021-12-06', 'bukti.jpg', 'done');

-- --------------------------------------------------------

--
-- Struktur dari tabel `confirmation`
--

CREATE TABLE `confirmation` (
  `confirmation_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `booking_id` int(11) NOT NULL,
  `confirmation_is_confirmation` tinyint(1) NOT NULL,
  `confirmation_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `confirmation`
--

INSERT INTO `confirmation` (`confirmation_id`, `admin_id`, `booking_id`, `confirmation_is_confirmation`, `confirmation_time`) VALUES
(1, 1, 1, 0, '2021-12-04');

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
  `item_facility` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_type`, `item_city`, `item_address`, `item_price`, `item_desc`, `item_facility`) VALUES
(1, 'Hotel indo', 'hotel', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan'),
(2, 'Hotel indo', 'hotel', 'Purwokerto', 'jl. ayam goreng', 250000, 'Hotel yang berada di pwt', 'Ruangan'),
(3, 'awd', 'villa', 'ad', 'awd', 123, 'ad', 'wadasdwdasda');

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
(1, 1, 'ayam.jpg');

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
(1, 'bambang@email.com1', '!qweasdzxc11', 'Bambang1', 'Ini alamat11', '081831273212', 'user'),
(8, 'admin@gmail.com1', '123qweasd1', 'a1', 'ddddddddddaa1', '1235121', 'user'),
(10, 'k@k.com1', 'admin123', 'Surezluvy', 'acs', '081831273212', 'user'),
(11, 'admin@gmail.com', '@qweasdzxc1', 'Surezluvy1', 'cas', '123512', 'user'),
(15, 'admin@admin.com1', '123qweasd1', 'Bambang1', 'aca', '123512', 'user'),
(16, 'a@a.com', '@qweasdzxc1', 'awd', 'adadasd', '1235121', 'user'),
(17, 'awd@ag.com1', 'asdw', 'ad', 'sdawd', 'awda', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indeks untuk tabel `confirmation`
--
ALTER TABLE `confirmation`
  ADD PRIMARY KEY (`confirmation_id`);

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
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `confirmation`
--
ALTER TABLE `confirmation`
  MODIFY `confirmation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `item_image`
--
ALTER TABLE `item_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
