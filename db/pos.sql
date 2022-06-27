-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 27, 2022 at 03:22 PM
-- Server version: 10.6.7-MariaDB-2ubuntu1
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `set_id` int(11) NOT NULL,
  `discount` float NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `branch_location` varchar(255) NOT NULL,
  `branch_logo` varchar(255) NOT NULL,
  `reciept_code` varchar(10) NOT NULL,
  `reciept_msg` varchar(255) NOT NULL,
  `safe_stock` int(11) NOT NULL,
  `cur_date` date NOT NULL,
  `theme` varchar(10) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`set_id`, `discount`, `branch_name`, `branch_location`, `branch_logo`, `reciept_code`, `reciept_msg`, `safe_stock`, `cur_date`, `theme`, `note`) VALUES
(1, 0, 'Rolnette\'s Store', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'store-logo.png', 'S1', 'Thank you - Please Come Again! This receipt is for inventory purpose only', 15, '2022-06-27', 'blue', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dtr`
--

CREATE TABLE `dtr` (
  `dtr_id` int(11) NOT NULL,
  `rfid_number` varchar(50) NOT NULL,
  `cashier` varchar(255) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time DEFAULT NULL,
  `log_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item_no_barcode`
--

CREATE TABLE `item_no_barcode` (
  `item_code` int(11) NOT NULL,
  `itemnb_name` varchar(255) NOT NULL,
  `itemnb_retail_price` float NOT NULL,
  `itemnb_stock` int(11) NOT NULL,
  `itemnb_category` varchar(50) NOT NULL,
  `itemnb_suppplier` varchar(50) NOT NULL,
  `date_updated` date NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `itemnb_remarks` varchar(255) NOT NULL,
  `itemnb_img` varchar(255) NOT NULL,
  `itemnb_wholesale_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item_with_barcode`
--

CREATE TABLE `item_with_barcode` (
  `item_id` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_retail_price` float NOT NULL,
  `item_stock` int(11) NOT NULL,
  `item_category` varchar(50) NOT NULL,
  `item_supplier` varchar(50) NOT NULL,
  `date_updated` date NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `item_remarks` varchar(255) NOT NULL,
  `item_wholesale_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `req_tran`
--

CREATE TABLE `req_tran` (
  `req_id` int(11) NOT NULL,
  `user_card` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `req_amount` int(11) NOT NULL,
  `req_date` date NOT NULL,
  `req_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(255) NOT NULL,
  `sup_cont_num` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `temp_item`
--

CREATE TABLE `temp_item` (
  `temp_id` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `temp_quantity` int(11) NOT NULL,
  `temp_price` float NOT NULL,
  `temp_name` varchar(255) NOT NULL,
  `temp_total` float NOT NULL,
  `current_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_logs`
--

CREATE TABLE `transaction_logs` (
  `log_id` int(11) NOT NULL,
  `tran_num` varchar(50) NOT NULL,
  `tran_item` varchar(255) NOT NULL,
  `tran_qty` int(11) NOT NULL,
  `tran_total` double NOT NULL,
  `tran_date_time` datetime NOT NULL,
  `tran_cashier` varchar(50) NOT NULL,
  `tran_location` varchar(255) NOT NULL,
  `tran_type` varchar(10) NOT NULL,
  `sup_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `cashier_name` varchar(50) NOT NULL,
  `user_rfid` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `avail_amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `dtr`
--
ALTER TABLE `dtr`
  ADD PRIMARY KEY (`dtr_id`);

--
-- Indexes for table `item_no_barcode`
--
ALTER TABLE `item_no_barcode`
  ADD PRIMARY KEY (`item_code`);

--
-- Indexes for table `item_with_barcode`
--
ALTER TABLE `item_with_barcode`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `req_tran`
--
ALTER TABLE `req_tran`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `temp_item`
--
ALTER TABLE `temp_item`
  ADD PRIMARY KEY (`temp_id`);

--
-- Indexes for table `transaction_logs`
--
ALTER TABLE `transaction_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dtr`
--
ALTER TABLE `dtr`
  MODIFY `dtr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_no_barcode`
--
ALTER TABLE `item_no_barcode`
  MODIFY `item_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_with_barcode`
--
ALTER TABLE `item_with_barcode`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `req_tran`
--
ALTER TABLE `req_tran`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_item`
--
ALTER TABLE `temp_item`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_logs`
--
ALTER TABLE `transaction_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;