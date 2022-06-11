-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 11, 2022 at 04:29 PM
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
  `discount` float NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `branch_location` varchar(255) NOT NULL,
  `branch_logo` varchar(255) NOT NULL,
  `reciept_code` varchar(10) NOT NULL,
  `reciept_msg` varchar(255) NOT NULL,
  `safe_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`set_id`, `discount`, `branch_name`, `branch_location`, `branch_logo`, `reciept_code`, `reciept_msg`, `safe_stock`) VALUES
(1, 0, 'My Store', 'Rosario, Cavite', 'store-logo.png', 'S1', 'Thank you, Please Come Again!', 15);

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
(8, 'home care'),
(12, 'candy');

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

--
-- Dumping data for table `dtr`
--

INSERT INTO `dtr` (`dtr_id`, `rfid_number`, `cashier`, `time_in`, `time_out`, `log_date`) VALUES
(1, '1', 'Admin', '23:40:20', '23:54:23', '2022-06-06'),
(2, '123123', 'test admin', '23:43:52', '23:44:11', '2022-06-06'),
(3, '123321', 'test edit', '23:44:08', '23:44:14', '2022-06-06'),
(4, '987654321', 'John Arian', '23:49:24', '00:00:00', '2022-06-06'),
(5, '1', 'Admin', '00:00:51', '00:07:56', '2022-06-07'),
(6, '123123', 'test admin', '00:01:29', '00:07:45', '2022-06-07'),
(7, '987654321', 'John Arian', '00:08:24', '20:07:46', '2022-06-07'),
(8, '987654321', 'John Arian', '10:25:48', '00:00:00', '2022-06-09'),
(9, '987654321', 'John Arian', '19:13:50', '19:17:59', '2022-06-11');

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
(1, 'M.Y. San Graham Crackers Honey | 700g', 194.5, 99, 'Snacks', 'supplier 1', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 184),
(2, 'Nissin Bread Stix | 20g 10pcs', 62.5, 99, 'Snacks', 'supplier 2', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 59),
(3, 'Super Stix Jr Milk | 330g', 66.5, 10, 'Snacks', 'supplier 1', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 63),
(4, 'ZestO Juice Drink Mango | 200ml', 9.5, 98, 'Beverage', 'supplier 1', '2022-06-10', 'Admin', 'Change Picture', '../images/items/62a313791e64a7.46728940.png', 9),
(5, 'Milo 1.2kg', 314.5, 96, 'Beverage', 'supplier 2', '2022-06-05', 'Admin', 'Change Picture', '../images/items/629c8755873e65.01335907.png', 300),
(6, 'Ovaltine Swiss Chocolate | 29.6g', 18.5, 92, 'Beverage', 'supplier 1', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 16),
(7, 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 150, 99, 'Frozen Goods', 'supplier 1', '2022-06-10', 'test edit', 'Change Picture', '../images/items/62a314214612b3.42657849.png', 143),
(8, 'Purefoods Tender Juicy Hotdog Regular | 500g', 120, 98, 'Frozen Goods', 'supplier 1', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 115),
(9, 'Simply Canola Oil | 2L', 329.5, 99, 'Pantry', 'supplier 5', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 320),
(10, 'Maya All Purpose Flour | 800g', 91.5, 98, 'Pantry', 'supplier 3', '2022-06-05', 'Admin', 'Change Image', '../images/items/629c89a57a6c07.36661562.png', 85),
(11, 'Nissin Pasta Creamy Carbonara | 60g', 14, 98, 'Pantry', 'supplier 4', '2022-06-05', 'Admin', 'Change Image', '../images/items/629c8946153fd5.44873586.png', 12),
(12, 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 23, 98, 'Health And Beauty', 'supplier 4', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 20),
(13, 'Nexguard - KN95 Mask 10pcs', 30, 99, 'Health And Beauty', 'supplier 3', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 27),
(14, 'Safeguard Liquid Hand Soap Pure White | 450ml', 156.75, 99, 'Health And Beauty', 'supplier 1', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 150),
(15, 'Cielo Prem Slced Bread L | 400g', 40, 99, 'Bakery', 'supplier 4', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 35),
(16, 'Goya Chips Milk Chocolate | 150g', 62.5, 99, 'Bakery', 'supplier 2', '2022-06-05', 'Admin', 'Change Image', '../images/items/629c8962974101.80915588.png', 60),
(17, 'Gardenia Loaf Bread California Raisins | 400g', 79.25, 99, 'Bakery', 'supplier 1', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 75),
(18, 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 429.75, 99, 'Baby And Kids', 'supplier 3', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 420),
(19, 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 497.75, 94, 'Baby And Kids', 'supplier 2', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 490),
(20, 'S26 Gold One Infant Formula Milk | 1.8kg', 2752.5, 99, 'Baby And Kids', 'supplier 2', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 2700),
(21, 'Off Lotion Family Care | 100ml', 180, 99, 'Health And Beauty', 'supplier 1', '2022-06-05', 'Admin', 'Change Image', '../images/items/default-image.png', 170),
(22, 'PH Care Feminine Wash Natural Protect 50ml', 57, 98, 'Health And Beauty', 'supplier 1', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 50),
(23, 'Listerine Mouthwash Coolmint | 250ml', 120, 99, 'Health And Beauty', 'supplier 3', '2022-06-05', 'Admin', 'Imported', '../images/items/default-image.png', 110);

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
(1, '1000', 'SkyFlakes Crackers | 25g 24pcs', 127.5, 99, 'Snacks', 'supplier 1', '2022-06-05', 'Admin', 'Imported', 120),
(2, '1001', 'Fita Crackers | 30g 10pcs', 60, 97, 'Snacks', 'supplier 1', '2022-06-05', 'Admin', 'Imported', 55),
(3, '1002', 'Graham Crackers Honey | 210g', 42.5, 95, 'Snacks', 'Supplier 1', '2022-06-05', 'Admin', 'Imported', 40),
(4, '1003', 'Nescafe Refill Classic | 200g', 156.5, 98, 'Beverage', 'Supplier 2', '2022-06-05', 'Admin', 'Imported', 155),
(5, '1004', 'Del Monte Pineapple Juice | 1L', 103.5, 98, 'Beverage', 'Supplier 3', '2022-06-05', 'Admin', 'Imported', 100),
(6, '1005', 'Tang Powdered Juice | 20g', 18.5, 98, 'Beverage', 'Supplier 4', '2022-06-05', 'Admin', 'Imported', 15),
(7, '1006', 'Purefoods Beef Tapa | 220g', 91, 13, 'Frozen Goods', 'Supplier 5', '2022-06-05', 'Admin', 'Imported', 85),
(8, '1007', 'Purefoods Chicken Hotdog Jumbo | 500g', 138, 97, 'Frozen Goods', 'Supplier 5', '2022-06-05', 'Admin', 'Imported', 130),
(9, '1008', 'Purefoods Chicken Breast Nuggets Crispy N Juicy | 200g', 86.5, 98, 'Frozen Goods', 'Supplier 5', '2022-06-05', 'Admin', 'Imported', 80),
(10, '1009', 'Nutella Spread Hazelnut | 200g', 177.5, 97, 'Pantry', 'Supplier 5', '2022-06-05', 'Admin', 'Imported', 170),
(11, '1010', 'Koko Krunch Cereal | 500g', 221.5, 98, 'Pantry', 'Supplier 3', '2022-06-05', 'Admin', 'Imported', 210),
(12, '1011', 'Clear Shampoo Cool Sport Menthol 275ml 2pcs', 210, 98, 'Health And Beauty', 'Supplier 4', '2022-06-05', 'Admin', 'Imported', 200),
(13, '1012', 'Sunsilk Shampoo Perfect Straight | 180ml+13mlx7pcs', 111.75, 98, 'Health And Beauty', 'Supplier 2', '2022-06-05', 'Admin', 'Imported', 100),
(14, '1013', 'Lemon Square Cheese Cake | 30g 10pcs', 69.5, 97, 'Bakery', 'Supplier 2', '2022-06-05', 'Admin', 'Imported', 65),
(15, '1014', 'Gardenia Classic White Bread Regular Slice | 600g', 75, 97, 'Bakery', 'Supplier 4', '2022-06-05', 'Admin', 'Imported', 70),
(16, '1015', 'Fudgee Bar Dark Choco | 38g 10pcs', 66.5, 95, 'Bakery', 'Supplier 4', '2022-06-05', 'Admin', 'Imported', 60),
(17, '1016', 'EQ Pants Big Pack | XL24', 194.75, 48, 'Baby And Kids', 'Supplier 2', '2022-06-05', 'Admin', 'Imported', 190),
(18, '1017', 'Enfamil One A+ Infant Formula Powder 0-6 months | 1.8kg', 2847.5, 13, 'Baby And Kids', 'Supplier 3', '2022-06-05', 'Admin', 'Imported', 2700),
(19, '1018', 'Lactum Milk Supplement Powder 6-12 months | 1.2kg', 789.5, 98, 'Baby And Kids', 'Supplier 5', '2022-06-05', 'Admin', 'Imported', 780),
(20, '1019', 'Jack & Jill Piattos Cheese | 85g', 29.5, 98, 'Snacks', 'Supplier 1', '2022-06-05', 'Admin', 'Imported', 25),
(21, '1020', 'Jack & Jill Nova Country Cheddar | 78g', 29.5, 7, 'Snacks', 'Supplier 1', '2022-06-05', 'Admin', 'Imported', 25),
(22, '1021', 'Ottogi Kimchi Ramen Pouch | 120g', 42.5, 98, 'Pantry', 'Supplier 5', '2022-06-05', 'Admin', 'Imported', 38),
(23, '1022', 'Red Bull Energy Drink Supreme | 150ml', 38.5, 98, 'Beverage', 'Supplier 4', '2022-06-05', 'Admin', 'Imported', 35);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(255) NOT NULL,
  `sup_cont_num` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`sup_id`, `sup_name`, `sup_cont_num`) VALUES
(1, 'supplier 1', '09123456789'),
(2, 'supplier 2', '09987654321'),
(3, 'supplier 3', '09123789456'),
(4, 'supplier 4', '09456123789'),
(5, 'supplier 5', '09789123456');

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
  `tran_total` double NOT NULL,
  `tran_date_time` datetime NOT NULL,
  `tran_cashier` varchar(50) NOT NULL,
  `tran_location` varchar(255) NOT NULL,
  `tran_type` varchar(10) NOT NULL,
  `sup_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_logs`
--

INSERT INTO `transaction_logs` (`log_id`, `tran_num`, `tran_item`, `tran_qty`, `tran_total`, `tran_date_time`, `tran_cashier`, `tran_location`, `tran_type`, `sup_name`) VALUES
(1, '2205291', 'Purefoods Tender Juicy Hotdog Regular | 500g', 1, 120, '2022-05-29 19:17:10', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(3, '2205292', 'ZestO Juice Drink Mango | 200ml', 1, 88.75, '2022-05-29 19:37:14', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(4, '2205292', 'Gardenia Loaf Bread California Raisins | 400g', 1, 88.75, '2022-05-29 19:37:14', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(5, '2205293', '(W)ZestO Juice Drink Mango | 200ml', 12, 108, '2022-05-29 19:39:01', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(6, '2205294', 'Simply Canola Oil | 2L', 1, 569.5, '2022-05-29 19:48:50', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(7, '2205294', '(W)Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 12, 569.5, '2022-05-29 19:48:50', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(8, '2205315', 'Goya Chips Milk Chocolate | 150g', 6, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(9, '2205315', 'Milo 1.2kg', 4, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(10, '2205315', 'Safeguard Liquid Hand Soap Pure White | 450ml', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(11, '2205315', 'Simply Canola Oil | 2L', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(12, '2205315', 'ZestO Juice Drink Mango | 200ml', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(13, '2205315', 'Nissin Bread Stix | 20g 10pcs', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(14, '2205315', 'Purefoods Tender Juicy Hotdog Regular | 500g', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(15, '2205315', 'Nexguard - KN95 Mask 10pcs', 3, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(16, '2205315', 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(17, '2205315', 'Ovaltine Swiss Chocolate | 29.6g', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(18, '2205315', 'Gardenia Loaf Bread California Raisins | 400g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(19, '2205315', 'Maya All Purpose Flour | 800g', 2, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(20, '2205315', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(21, '2205315', 'Cielo Prem Slced Bread L | 400g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(22, '2205315', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(23, '2205315', 'M.Y. San Graham Crackers Honey | 700g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(24, '2205315', 'Nissin Pasta Creamy Carbonara | 60g', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(25, '2205315', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 4663.25, '2022-05-31 00:08:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(26, '2205316', 'Nexguard - KN95 Mask 10pcs', 1, 30, '2022-05-10 22:54:36', 'John Arian', 'Tanza, Cavite', 'Out', ''),
(27, '2205317', 'S26 Gold One Infant Formula Milk | 1.8kg', 1, 2752.5, '2022-05-30 22:55:23', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(28, '2206018', 'Nissin Bread Stix | 20g 10pcs', 1, 377, '2022-06-01 17:28:21', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(29, '2206018', 'Milo 1.2kg', 1, 377, '2022-06-01 17:28:21', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(30, '2206019', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 148, '2022-06-01 17:28:54', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(31, '22060210', 'Goya Chips Milk Chocolate | 150g', 1, 62.5, '2022-06-02 12:24:03', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(32, '22060211', 'M.Y. San Graham Crackers Honey | 700g', 1, 194.5, '2022-06-02 12:24:26', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(33, '22060312', '(W)Off Lotion Family Care | 100ml', 5, 850, '2022-06-03 14:43:59', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(34, '22060313', 'Nexguard - KN95 Mask 10pcs', 1, 30, '2022-06-03 21:48:10', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(35, '22060314', 'Ottogi Kimchi Ramen Pouch | 120g', 1, 42.5, '2022-06-03 23:24:03', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(42, '115580', 'Ottogi Kimchi Ramen Pouch | 120g', 4, 0, '2022-06-04 00:29:05', 'Admin', 'Rosario, Cavite', 'In', ''),
(43, '2206041', 'Safeguard Liquid Hand Soap Pure White | 450ml', 1, 156.75, '2022-06-04 15:12:06', 'John Arian', 'Tanza, Cavite', 'Out', ''),
(44, '22060444', 'Nissin Pasta Creamy Carbonara | 60g', 1, 14, '2022-06-04 15:14:56', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(45, '22060445', 'Listerine Mouthwash Coolmint | 250ml', 1, 120, '2022-06-04 16:35:48', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(46, '22060446', 'ZestO Juice Drink Mango | 200ml', 1, 9.5, '2022-06-04 16:35:57', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(47, '22060447', 'Simply Canola Oil | 2L', 1, 329.5, '2022-06-04 16:36:04', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(48, '22060448', 'Cielo Prem Slced Bread L | 400g', 1, 40, '2022-06-04 16:36:13', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(49, '12345', 'Red Bull Energy Drink Supreme | 150ml', 3, 0, '2022-06-04 21:04:25', 'Admin', 'Rosario, Cavite', 'In', ''),
(50, '22060450', '(W)Fita Crackers | 30g 10pcs', 1, 182.5, '2022-06-04 21:22:01', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(52, '22060450', 'SkyFlakes Crackers | 25g 24pcs', 1, 182.5, '2022-06-04 21:22:01', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(53, '22060553', 'Lemon Square Cheese Cake | 30g 10pcs', 2, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(54, '22060553', 'Gardenia Classic White Bread Regular Slice | 600g', 2, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(55, '22060553', 'Nutella Spread Hazelnut | 200g', 2, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(56, '22060553', 'Purefoods Chicken Hotdog Jumbo | 500g', 2, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(57, '22060553', 'Purefoods Beef Tapa | 220g', 3, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(58, '22060553', 'Graham Crackers Honey | 210g', 6, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(59, '22060553', 'Fudgee Bar Dark Choco | 38g 10pcs', 4, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(60, '22060553', 'Red Bull Energy Drink Supreme | 150ml', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(61, '22060553', 'Ottogi Kimchi Ramen Pouch | 120g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(62, '22060553', 'Jack & Jill Nova Country Cheddar | 78g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(63, '22060553', 'Jack & Jill Piattos Cheese | 85g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(64, '22060553', 'Lactum Milk Supplement Powder 6-12 months | 1.2kg', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(65, '22060553', 'Enfamil One A+ Infant Formula Powder 0-6 months | 1.8kg', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(66, '22060553', 'EQ Pants Big Pack | XL24', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(67, '22060553', 'Sunsilk Shampoo Perfect Straight | 180ml+13mlx7pcs', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(68, '22060553', 'Clear Shampoo Cool Sport Menthol 275ml 2pcs', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(69, '22060553', 'Koko Krunch Cereal | 500g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(70, '22060553', 'Purefoods Chicken Breast Nuggets Crispy N Juicy | 200g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(71, '22060553', 'Tang Powdered Juice | 20g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(72, '22060553', 'Del Monte Pineapple Juice | 1L', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(73, '22060553', 'Nescafe Refill Classic | 200g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(74, '22060553', 'Fita Crackers | 30g 10pcs', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(75, '22060553', 'Goya Chips Milk Chocolate | 150g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(76, '22060553', 'Milo 1.2kg', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(77, '22060553', 'Maya All Purpose Flour | 800g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(78, '22060553', 'Nissin Pasta Creamy Carbonara | 60g', 1, 7136.5, '2022-06-05 23:37:40', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(79, '22060679', 'Milo 1.2kg', 1, 314.5, '2022-06-06 02:13:44', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(80, '22060680', 'Milo 1.2kg', 1, 314.5, '2022-06-06 02:13:57', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(81, '99', 'Graham Crackers Honey | 210g', 99, 0, '2022-06-06 03:20:26', 'Admin', 'Rosario, Cavite', 'In', ''),
(82, '99', 'Fudgee Bar Dark Choco | 38g 10pcs', 99, 0, '2022-06-06 03:20:30', 'Admin', 'Rosario, Cavite', 'In', ''),
(83, '99', 'Purefoods Beef Tapa | 220g', 99, 0, '2022-06-06 03:20:34', 'Admin', 'Rosario, Cavite', 'In', ''),
(84, '99', 'Milo 1.2kg', 99, 0, '2022-06-06 03:20:36', 'Admin', 'Rosario, Cavite', 'In', ''),
(85, '99', 'Purefoods Chicken Hotdog Jumbo | 500g', 99, 0, '2022-06-06 03:20:38', 'Admin', 'Rosario, Cavite', 'In', ''),
(86, '99', 'Lemon Square Cheese Cake | 30g 10pcs', 99, 0, '2022-06-06 03:20:40', 'Admin', 'Rosario, Cavite', 'In', ''),
(87, '99', 'Gardenia Classic White Bread Regular Slice | 600g', 99, 0, '2022-06-06 03:20:41', 'Admin', 'Rosario, Cavite', 'In', ''),
(88, '99', 'Nutella Spread Hazelnut | 200g', 99, 0, '2022-06-06 03:20:43', 'Admin', 'Rosario, Cavite', 'In', ''),
(89, '99', 'EQ Pants Big Pack | XL24', 99, 0, '2022-06-06 03:20:45', 'Admin', 'Rosario, Cavite', 'In', ''),
(90, '99', 'Clear Shampoo Cool Sport Menthol 275ml 2pcs', 99, 0, '2022-06-06 03:20:46', 'Admin', 'Rosario, Cavite', 'In', ''),
(91, '99', 'Red Bull Energy Drink Supreme | 150ml', 99, 0, '2022-06-06 03:20:48', 'Admin', 'Rosario, Cavite', 'In', ''),
(92, '99', 'Fita Crackers | 30g 10pcs', 99, 0, '2022-06-06 03:20:49', 'Admin', 'Rosario, Cavite', 'In', ''),
(93, '99', 'Enfamil One A+ Infant Formula Powder 0-6 months | 1.8kg', 99, 0, '2022-06-06 03:20:51', 'Admin', 'Rosario, Cavite', 'In', ''),
(94, '99', 'Sunsilk Shampoo Perfect Straight | 180ml+13mlx7pcs', 99, 0, '2022-06-06 03:20:52', 'Admin', 'Rosario, Cavite', 'In', ''),
(95, '99', 'Lactum Milk Supplement Powder 6-12 months | 1.2kg', 99, 0, '2022-06-06 03:20:54', 'Admin', 'Rosario, Cavite', 'In', ''),
(96, '99', 'Maya All Purpose Flour | 800g', 99, 0, '2022-06-06 03:20:55', 'Admin', 'Rosario, Cavite', 'In', ''),
(97, '99', 'Purefoods Chicken Breast Nuggets Crispy N Juicy | 200g', 99, 0, '2022-06-06 03:20:57', 'Admin', 'Rosario, Cavite', 'In', ''),
(98, '99', 'Goya Chips Milk Chocolate | 150g', 99, 0, '2022-06-06 03:20:59', 'Admin', 'Rosario, Cavite', 'In', ''),
(99, '99', 'Jack & Jill Piattos Cheese | 85g', 99, 0, '2022-06-06 03:21:00', 'Admin', 'Rosario, Cavite', 'In', ''),
(100, '99', 'Nescafe Refill Classic | 200g', 99, 0, '2022-06-06 03:21:02', 'Admin', 'Rosario, Cavite', 'In', ''),
(101, '99', 'Nissin Pasta Creamy Carbonara | 60g', 99, 0, '2022-06-06 03:21:03', 'Admin', 'Rosario, Cavite', 'In', ''),
(102, '99', 'Jack & Jill Nova Country Cheddar | 78g', 99, 0, '2022-06-06 03:21:05', 'Admin', 'Rosario, Cavite', 'In', ''),
(103, '99', 'Del Monte Pineapple Juice | 1L', 99, 0, '2022-06-06 03:21:06', 'Admin', 'Rosario, Cavite', 'In', ''),
(104, '99', 'Koko Krunch Cereal | 500g', 99, 0, '2022-06-06 03:21:08', 'Admin', 'Rosario, Cavite', 'In', ''),
(105, '99', 'Ottogi Kimchi Ramen Pouch | 120g', 99, 0, '2022-06-06 03:21:09', 'Admin', 'Rosario, Cavite', 'In', ''),
(106, '99', 'Tang Powdered Juice | 20g', 99, 0, '2022-06-06 03:21:11', 'Admin', 'Rosario, Cavite', 'In', ''),
(107, '99', 'Purefoods Tender Juicy Hotdog Regular | 500g', 99, 0, '2022-06-06 03:21:13', 'Admin', 'Rosario, Cavite', 'In', ''),
(108, '99', 'SkyFlakes Crackers | 25g 24pcs', 99, 0, '2022-06-06 03:21:14', 'Admin', 'Rosario, Cavite', 'In', ''),
(109, '99', 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 99, 0, '2022-06-06 03:21:16', 'Admin', 'Rosario, Cavite', 'In', ''),
(110, '99', 'Super Stix Jr Milk | 330g', 99, 0, '2022-06-06 03:21:17', 'Admin', 'Rosario, Cavite', 'In', ''),
(111, '99', 'Safeguard Liquid Hand Soap Pure White | 450ml', 99, 0, '2022-06-06 03:21:19', 'Admin', 'Rosario, Cavite', 'In', ''),
(112, '99', 'Simply Canola Oil | 2L', 99, 0, '2022-06-06 03:21:21', 'Admin', 'Rosario, Cavite', 'In', ''),
(113, '99', 'S26 Gold One Infant Formula Milk | 1.8kg', 99, 0, '2022-06-06 03:21:22', 'Admin', 'Rosario, Cavite', 'In', ''),
(114, '99', 'ZestO Juice Drink Mango | 200ml', 99, 0, '2022-06-06 03:21:24', 'Admin', 'Rosario, Cavite', 'In', ''),
(115, '99', 'Cielo Prem Slced Bread L | 400g', 9, 0, '2022-06-06 03:21:25', 'Admin', 'Rosario, Cavite', 'In', ''),
(116, '99', 'Off Lotion Family Care | 100ml', 9, 0, '2022-06-06 03:21:27', 'Admin', 'Rosario, Cavite', 'In', ''),
(117, '99', 'PH Care Feminine Wash Natural Protect 50ml', 99, 0, '2022-06-06 03:21:29', 'Admin', 'Rosario, Cavite', 'In', ''),
(118, '99', 'Ovaltine Swiss Chocolate | 29.6g', 99, 0, '2022-06-06 03:21:30', 'Admin', 'Rosario, Cavite', 'In', ''),
(119, '99', 'Gardenia Loaf Bread California Raisins | 400g', 99, 0, '2022-06-06 03:21:32', 'Admin', 'Rosario, Cavite', 'In', ''),
(120, '99', 'M.Y. San Graham Crackers Honey | 700g', 99, 0, '2022-06-06 03:21:34', 'Admin', 'Rosario, Cavite', 'In', ''),
(121, '99', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 9, 0, '2022-06-06 03:21:35', 'Admin', 'Rosario, Cavite', 'In', ''),
(122, '99', 'Listerine Mouthwash Coolmint | 250ml', 99, 0, '2022-06-06 03:21:37', 'Admin', 'Rosario, Cavite', 'In', ''),
(123, '99', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 99, 0, '2022-06-06 03:21:39', 'Admin', 'Rosario, Cavite', 'In', ''),
(124, '99', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 99, 0, '2022-06-06 03:21:41', 'Admin', 'Rosario, Cavite', 'In', ''),
(125, '99', 'Nissin Bread Stix | 20g 10pcs', 99, 0, '2022-06-06 03:21:43', 'Admin', 'Rosario, Cavite', 'In', ''),
(126, '99', 'Nexguard - KN95 Mask 10pcs', 99, 0, '2022-06-06 03:21:44', 'Admin', 'Rosario, Cavite', 'In', ''),
(127, '99', 'Cielo Prem Slced Bread L | 400g', 90, 0, '2022-06-06 03:21:47', 'Admin', 'Rosario, Cavite', 'In', ''),
(128, '99', 'Off Lotion Family Care | 100ml', 90, 0, '2022-06-06 03:21:49', 'Admin', 'Rosario, Cavite', 'In', ''),
(129, '99', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 90, 0, '2022-06-06 03:21:51', 'Admin', 'Rosario, Cavite', 'In', ''),
(130, 'S1-220606130', 'ZestO Juice Drink Mango | 200ml', 1, 9.5, '2022-06-06 16:38:16', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(131, 'S1-220606131', 'Graham Crackers Honey | 210g', 1, 102.5, '2022-06-06 16:46:17', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(132, 'S1-220606131', 'Fita Crackers | 30g 10pcs', 1, 102.5, '2022-06-06 16:46:17', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(134, '12354', 'Goya Chips Milk Chocolate | 150g', 2, 0, '2022-06-09 10:20:31', 'Admin', 'Rosario, Cavite', 'In', 'Supplier 2'),
(135, '220609135', 'Purefoods Tender Juicy Hotdog Regular | 500g', 1, 120, '2022-06-09 10:27:55', 'John Arian', 'Rosario, Cavite', 'Out', ''),
(136, '12346', 'Graham Crackers Honey | 210g', 3, 0, '2022-06-09 12:28:18', 'Admin', 'Rosario, Cavite', 'In', 'Supplier 1'),
(137, '220610137', 'Ovaltine Swiss Chocolate | 29.6g', 5, 92.5, '2022-06-10 18:05:14', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(138, '220610138', '(W)Pampers Dry Pants Jumbo Pack XXL | 34pcs', 10, 4900, '2022-06-10 18:05:52', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(139, '061022-1032', 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 5, 0, '2022-06-10 18:07:58', 'Admin', 'Rosario, Cavite', 'In', 'supplier 2'),
(140, '220610140', 'Ovaltine Swiss Chocolate | 29.6g', 1, 18.5, '2022-06-10 20:19:31', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(141, '220611141', 'Enfamil One A+ Infant Formula Powder 0-6 months | 1.8kg', 80, 227800, '2022-06-11 16:22:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(142, '220611142', 'Enfamil One A+ Infant Formula Powder 0-6 months | 1.8kg', 5, 14237.5, '2022-06-11 16:23:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(143, '220611143', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 1, 23, '2022-06-11 16:27:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(144, '220611144', 'Ovaltine Swiss Chocolate | 29.6g', 1, 18.5, '2022-06-11 16:28:11', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(145, 'S11-220611145', 'PH Care Feminine Wash Natural Protect 50ml', 1, 57, '2022-06-11 17:01:05', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(146, '123123123', 'Purefoods Beef Tapa | 220g', 4, 0, '2022-06-11 19:21:39', 'Admin', 'Rosario, Cavite', 'In', 'Supplier 5');

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
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `cashier_name`, `user_rfid`, `role`) VALUES
(1, 'admin', '$2y$10$BxAfLc6FOCZnAf7qgYaIquiiR.WxUrMRRj9JosAE419zK/CRtLMyW', 'Admin', '1', 'admin'),
(2, 'cashier', '$2y$10$N/aTeiGfsYITVrfY3qRA4.uq/nH1QgNqo2EuiBDVNnyRxutQB1ruy', 'John Arian', '987654321', 'cashier'),
(4, 'testedit', '$2y$10$lF84Rsl/4Qu9smoVqcEDxeTQ.jtzLbCw4IQEpW1gBnRMluJMvYnqm', 'test edit', '123321', 'admin'),
(5, 'testadmin', '$2y$10$8ssh3TpQaVVaQMC615AQj.ODs.7dSEE2WFxZr1CfkfCsYLWRwrVEu', 'test admin', '123123', 'admin');

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
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dtr`
--
ALTER TABLE `dtr`
  MODIFY `dtr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item_no_barcode`
--
ALTER TABLE `item_no_barcode`
  MODIFY `item_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `item_with_barcode`
--
ALTER TABLE `item_with_barcode`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `temp_item`
--
ALTER TABLE `temp_item`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_logs`
--
ALTER TABLE `transaction_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;