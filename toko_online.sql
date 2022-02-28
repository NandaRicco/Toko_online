-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2022 pada 14.07
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama_admin`, `username`, `password`) VALUES
(2, 'Nanda', 'nco', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_pembelian_sepatu`
--

CREATE TABLE `id_pembelian_sepatu` (
  `id_detail_pembelian_sepatu` int(11) NOT NULL,
  `id_pembelian_sepatu` int(11) NOT NULL,
  `id_sepatu` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_sepatu`
--

CREATE TABLE `pembelian_sepatu` (
  `id_pembelian_sepatu` int(11) NOT NULL,
  `tanggal_beli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `deskripsi`, `harga`, `foto`) VALUES
(1, 'Jordan i black toe', 'Ini sepatu Mahal oyy', '2000000', 'http://localhost/toko_online/admin/assets/coverproduk/7.-Air-Jordan-I-Black-Toe.jpg'),
(4, 'Jordan 3 black cement', 'Ini sepatu bagus', '1500000', 'http://localhost/toko_online/admin/assets/coverproduk/2.-Nike-Air-Jordan-3-Black-Cement.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_pembelian_sepatu`
--
ALTER TABLE `id_pembelian_sepatu`
  ADD PRIMARY KEY (`id_detail_pembelian_sepatu`),
  ADD KEY `id_pembelian_sepatu` (`id_pembelian_sepatu`,`id_sepatu`,`qty`),
  ADD KEY `id_sepatu` (`id_sepatu`);

--
-- Indeks untuk tabel `pembelian_sepatu`
--
ALTER TABLE `pembelian_sepatu`
  ADD PRIMARY KEY (`id_pembelian_sepatu`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `id_pembelian_sepatu`
--
ALTER TABLE `id_pembelian_sepatu`
  MODIFY `id_detail_pembelian_sepatu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembelian_sepatu`
--
ALTER TABLE `pembelian_sepatu`
  MODIFY `id_pembelian_sepatu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `id_pembelian_sepatu`
--
ALTER TABLE `id_pembelian_sepatu`
  ADD CONSTRAINT `id_pembelian_sepatu_ibfk_1` FOREIGN KEY (`id_sepatu`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_pembelian_sepatu_ibfk_2` FOREIGN KEY (`id_pembelian_sepatu`) REFERENCES `pembelian_sepatu` (`id_pembelian_sepatu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
