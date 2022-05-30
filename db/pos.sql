-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2022 at 09:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

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
  `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`set_id`, `discount`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'snacks'),
(2, 'beverage'),
(3, 'frozen goods'),
(4, 'pantry'),
(5, 'health and beauty'),
(6, 'bakery'),
(7, 'baby and kids'),
(8, 'home care');

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

--
-- Dumping data for table `item_no_barcode`
--

INSERT INTO `item_no_barcode` (`item_code`, `itemnb_name`, `itemnb_retail_price`, `itemnb_stock`, `itemnb_category`, `itemnb_suppplier`, `date_updated`, `updated_by`, `itemnb_remarks`, `itemnb_img`, `itemnb_wholesale_price`) VALUES
(1, 'M.Y. San Graham Crackers Honey | 700g', 194.5, 97, 'Snacks', 'S1', '2022-05-26', 'John Arian', 'added', '../images/items/M.Y. San Graham Crackers Honey.png', 184),
(2, 'Nissin Bread Stix | 20g 10pcs', 62.5, 98, 'Snacks', 'S1', '2022-05-26', 'John Arian', 'added', '../images/items/nissin_bread_stix.png', 59),
(3, 'Super Stix Jr Milk | 330g', 66.5, 99, 'Snacks', 'S1', '2022-05-26', 'John Arian', 'added', '../images/items/super_stix_jr_milk_330.png', 63),
(4, 'ZestO Juice Drink Mango | 200ml', 9.5, 85, 'Beverage', 'S2', '2022-05-26', 'John Arian', 'Added', '../images/items/Zest0-Juice.png', 9),
(5, 'Milo 1.2kg', 314.5, 87, 'Beverage', 'S2', '2022-05-26', 'John Arian', 'Added', '../images/items/milo.png', 300),
(6, 'Ovaltine Swiss Chocolate | 29.6g', 18.5, 97, 'Beverage', 'S2', '2022-05-26', 'John Arian', 'Added', '../images/items/ovaltine.png', 16),
(7, 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 148, 98, 'Frozen Goods', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/daing_na_bangus.png', 143),
(8, 'Purefoods Tender Juicy Hotdog Regular | 500g', 120, 84, 'Frozen Goods', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/hotdog.png', 115),
(9, 'Simply Canola Oil | 2L', 329.5, 97, 'Pantry', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/mantika.png', 320),
(10, 'Maya All Purpose Flour | 800g', 91.5, 97, 'Pantry', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/flour.png', 85),
(11, 'Nissin Pasta Creamy Carbonara | 60g', 14, 98, 'Pantry', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/pasta.png', 12),
(12, 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 23, 85, 'Health And Beauty', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/napkin.png', 20),
(13, 'Nexguard - KN95 Mask 10pcs', 30, 81, 'Health And Beauty', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/facemask.png', 27),
(14, 'Safeguard Liquid Hand Soap Pure White | 450ml', 156.75, 98, 'Health And Beauty', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/hand-soap.png', 150),
(15, 'Cielo Prem Slced Bread L | 400g', 38, 98, 'Bakery', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/bread.png', 35),
(16, 'Goya Chips Milk Chocolate | 150g', 62.5, 93, 'Bakery', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/chips.png', 60),
(17, 'Gardenia Loaf Bread California Raisins | 400g', 79.25, 97, 'Bakery', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/gardenia.png', 75),
(18, 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 429.75, 98, 'Baby And Kids', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/mamypoko.png', 420),
(19, 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 497.75, 78, 'Baby And Kids', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/pampers.png', 490),
(20, 'S26 Gold One Infant Formula Milk | 1.8kg', 2752.5, 97, 'Baby And Kids', 'S3', '2022-05-26', 'John Arian', 'Added', '../images/items/infant.png', 2700);

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

--
-- Dumping data for table `item_with_barcode`
--

INSERT INTO `item_with_barcode` (`item_id`, `item_code`, `item_name`, `item_retail_price`, `item_stock`, `item_category`, `item_supplier`, `date_updated`, `updated_by`, `item_remarks`, `item_wholesale_price`) VALUES
(1, '1000', 'SkyFlakes Crackers | 25g 24pcs', 127.5, 89, 'Snacks', 'Supplier 1', '2022-05-24', 'John Arian', '', 120),
(2, '1001', 'Fita Crackers | 30g 10pcs', 60, 98, 'Snacks', 'Supplier 1', '2022-05-24', 'John Arian', '', 55),
(3, '1002', 'Graham Crackers Honey | 210g', 42.5, 96, 'Snacks', 'Supplier 1', '2022-05-24', 'John Arian', '', 40),
(4, '1003', 'Nescafe Refill Classic | 200g', 156.5, 98, 'Beverage', 'Supplier 2', '2022-05-24', 'John Arian', '', 155),
(5, '1004', 'Del Monte Pineapple Juice | 1L', 103.5, 98, 'Beverage', 'Supplier 3', '2022-05-24', 'John Arian', '', 100),
(6, '1005', 'Tang Powdered Juice | 20g', 18.5, 98, 'Beverage', 'Supplier 4', '2022-05-24', 'John Arian', '', 15),
(7, '1006', 'Purefoods Beef Tapa | 220g', 91, 99, 'Frozen Goods', 'Supplier 5', '2022-05-24', 'John Arian', '', 85),
(8, '1007', 'Purefoods Chicken Hotdog Jumbo | 500g', 138, 99, 'Frozen Goods', 'Supplier 5', '2022-05-24', 'John Arian', '', 130),
(9, '1008', 'Purefoods Chicken Breast Nuggets Crispy N Juicy | 200g', 86.5, 99, 'Frozen Goods', 'Supplier 5', '2022-05-24', 'John Arian', '', 80),
(10, '1009', 'Nutella Spread Hazelnut | 200g', 177.5, 99, 'Pantry', 'Supplier 5', '2022-05-24', 'John Arian', '', 170),
(11, '1010', 'Koko Krunch Cereal | 500g', 221.5, 94, 'Pantry', 'Supplier 6', '2022-05-24', 'John Arian', '', 210),
(12, '1011', 'Clear Shampoo Cool Sport Menthol 275ml 2pcs', 209.5, 97, 'Health And Beauty', 'Supplier 7', '2022-05-24', 'John Arian', '', 200),
(13, '1012', 'Sunsilk Shampoo Perfect Straight | 180ml+13mlx7pcs', 111.75, 95, 'Health And Beauty', 'Supplier 7', '2022-05-24', 'John Arian', '', 100),
(14, '1013', 'Lemon Square Cheese Cake | 30g 10pcs', 69.5, 99, 'Bakery', 'Supplier 8', '2022-05-25', 'John Arian', 'Added', 65),
(15, '1014', 'Gardenia Classic White Bread Regular Slice | 600g', 75, 99, 'Bakery', 'Supplier 8', '2022-05-25', 'John Arian', 'Added', 70),
(16, '1015', 'Fudgee Bar Dark Choco | 38g 10pcs', 66.5, 99, 'Bakery', 'Supplier 8', '2022-05-25', 'John Arian', 'Added', 60),
(17, '1016', 'EQ Pants Big Pack | XL24', 194.75, 99, 'Baby & Kids', 'Supplier 9', '2022-05-25', 'John Arian', 'Added', 190),
(18, '1017', 'Enfamil One A+ Infant Formula Powder 0-6 months | 1.8kg', 2847.5, 97, 'Baby & Kids', 'Supplier 9', '2022-05-25', 'John Arian', 'Added', 2800),
(19, '1018', 'Lactum Milk Supplement Powder 6-12 months | 1.2kg', 789.5, 99, 'Baby & Kids', 'Supplier 9', '2022-05-25', 'John Arian', 'Added', 780),
(20, '1019', 'Jack & Jill Piattos Cheese | 85g', 29.5, 99, 'Snacks', 'Supplier 1', '2022-05-25', 'John Arian', 'Added', 25),
(21, '1020', 'Jack & Jill Nova Country Cheddar | 78g', 29.5, 99, 'Snacks', 'Supplier 1', '2022-05-25', 'John Arian', 'Added', 25);

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
  `temp_total` float NOT NULL
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
  `tran_total` float NOT NULL,
  `tran_date_time` datetime NOT NULL,
  `tran_cashier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_logs`
--

INSERT INTO `transaction_logs` (`log_id`, `tran_num`, `tran_item`, `tran_qty`, `tran_total`, `tran_date_time`, `tran_cashier`) VALUES
(1, '2205291', 'Purefoods Tender Juicy Hotdog Regular | 500g', 1, 120, '2022-05-29 19:17:10', 'John Arian'),
(2, '2205291', 'Milo 1.2kg', 1, 314.5, '2022-05-29 19:17:23', 'John Arian'),
(3, '2205292', 'ZestO Juice Drink Mango | 200ml', 1, 88.75, '2022-05-29 19:37:14', 'John Arian'),
(4, '2205292', 'Gardenia Loaf Bread California Raisins | 400g', 1, 88.75, '2022-05-29 19:37:14', 'John Arian'),
(5, '2205293', '(W)ZestO Juice Drink Mango | 200ml', 12, 108, '2022-05-29 19:39:01', 'John Arian'),
(6, '2205294', 'Simply Canola Oil | 2L', 1, 569.5, '2022-05-29 19:48:50', 'John Arian'),
(7, '2205294', '(W)Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 12, 569.5, '2022-05-29 19:48:50', 'John Arian'),
(8, '2205315', 'Goya Chips Milk Chocolate | 150g', 6, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(9, '2205315', 'Milo 1.2kg', 4, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(10, '2205315', 'Safeguard Liquid Hand Soap Pure White | 450ml', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(11, '2205315', 'Simply Canola Oil | 2L', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(12, '2205315', 'ZestO Juice Drink Mango | 200ml', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(13, '2205315', 'Nissin Bread Stix | 20g 10pcs', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(14, '2205315', 'Purefoods Tender Juicy Hotdog Regular | 500g', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(15, '2205315', 'Nexguard - KN95 Mask 10pcs', 3, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(16, '2205315', 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(17, '2205315', 'Ovaltine Swiss Chocolate | 29.6g', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(18, '2205315', 'Gardenia Loaf Bread California Raisins | 400g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(19, '2205315', 'Maya All Purpose Flour | 800g', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(20, '2205315', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(21, '2205315', 'Cielo Prem Slced Bread L | 400g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(22, '2205315', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(23, '2205315', 'M.Y. San Graham Crackers Honey | 700g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(24, '2205315', 'Nissin Pasta Creamy Carbonara | 60g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian'),
(25, '2205315', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `cashier_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `cashier_name`) VALUES
(1, 'admin', '$2y$10$BxAfLc6FOCZnAf7qgYaIquiiR.WxUrMRRj9JosAE419zK/CRtLMyW', '0'),
(2, 'cashier', '$2y$10$N/aTeiGfsYITVrfY3qRA4.uq/nH1QgNqo2EuiBDVNnyRxutQB1ruy', 'John Arian');

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
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item_no_barcode`
--
ALTER TABLE `item_no_barcode`
  MODIFY `item_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `item_with_barcode`
--
ALTER TABLE `item_with_barcode`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `temp_item`
--
ALTER TABLE `temp_item`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_logs`
--
ALTER TABLE `transaction_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
