-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 30, 2026 at 06:22 AM
-- Server version: 10.11.15-MariaDB
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postrumilan_billings`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_stock_transaction`
--

CREATE TABLE `product_stock_transaction` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock` double NOT NULL,
  `stock_type` int(11) NOT NULL DEFAULT 1 COMMENT '1=pos; 2=online',
  `created_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=pending, 1=instant approved,2=reject, 3= admin purchase request approved',
  `seller_accept_status` tinyint(1) DEFAULT NULL COMMENT '1=allright; 2=damage; 3=short fault;4=exceed',
  `seller_accept_remark` varchar(225) NOT NULL,
  `selling_price` double NOT NULL,
  `purchase_price` double NOT NULL,
  `transaction_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Purchase Request, 2=Sell POS, 3=Sell APP, 4=Transfer stock, 5=online stock',
  `received_selled_id` int(10) DEFAULT 0,
  `parent_id` int(10) NOT NULL,
  `approved_by` int(10) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `order_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_stock_transaction`
--
ALTER TABLE `product_stock_transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_stock_transaction`
--
ALTER TABLE `product_stock_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
