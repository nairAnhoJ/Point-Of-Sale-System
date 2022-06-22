-- phpMyAdmin SQL Dump
-- version 5.2.0-1.fc36.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 22, 2022 at 01:58 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 8.1.7

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
  `theme` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`set_id`, `discount`, `branch_name`, `branch_location`, `branch_logo`, `reciept_code`, `reciept_msg`, `safe_stock`, `cur_date`, `theme`) VALUES
(1, 0, 'Rolnettes Store', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'store-logo.png', 'S1', 'Thank you - Please Come Again! This receipt is for inventory purpose only', 15, '2022-06-22', 'blue');

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
(1, 'baby food'),
(2, 'baking and cooking breading mix'),
(3, 'baking mix hot cake'),
(4, 'beverages'),
(5, 'cocoa powder'),
(6, 'coffee'),
(7, 'coffee creamer'),
(8, 'coffee rtd'),
(9, 'energy drink'),
(10, 'juice powder'),
(11, 'juice rtd'),
(12, 'milk rtd'),
(13, 'sport drink'),
(14, 'water'),
(15, 'biscuits and cookies'),
(16, 'cakes');

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
(9, '987654321', 'John Arian', '19:13:50', '19:17:59', '2022-06-11'),
(10, '987654321', 'John Arian', '13:29:56', NULL, '2022-06-17'),
(11, '0013663615', 'Test Admin', '09:36:44', '13:43:12', '2022-06-18'),
(12, '0013530290', 'Wilfred Capaglan', '13:43:10', NULL, '2022-06-18'),
(13, '0013530190', 'Jenny Rose M. Loyola', '13:43:15', NULL, '2022-06-18'),
(14, '0013528045', 'Jolina R. Sano', '13:43:17', NULL, '2022-06-18'),
(15, '0013710489', 'Zenaida Camporedondo', '13:43:21', NULL, '2022-06-18'),
(16, '0013663041', 'Monaliza Palicios', '13:43:25', NULL, '2022-06-18'),
(17, '0013663031', 'Judel Magtibay', '13:43:27', NULL, '2022-06-18'),
(18, '0013663608', 'Noli Francisco', '13:43:33', NULL, '2022-06-18'),
(19, '0013730740', 'Christine Joyce Gabion', '13:43:35', NULL, '2022-06-18'),
(20, '0013709151', 'John Gerald Lorenzo', '13:43:37', NULL, '2022-06-18'),
(21, '0013729770', 'Eloisa B. Espino', '13:43:39', NULL, '2022-06-18'),
(22, '0013662478', 'Athena B. Toos', '13:43:41', NULL, '2022-06-18'),
(23, '0013527350', 'Nina Claire M. Santos', '13:43:43', NULL, '2022-06-18'),
(24, '0013527965', 'Jessajoy L. Ariscon', '13:43:44', NULL, '2022-06-18'),
(25, '0013545972', 'Thina P. Rosales', '13:43:45', NULL, '2022-06-18'),
(26, '0015040739', 'Myra C. Santiago', '13:43:46', NULL, '2022-06-18'),
(27, '0013664186', 'Raziel D. Ginto', '13:43:48', NULL, '2022-06-18'),
(28, '0013706230', 'Jovelyn S. Sismar', '13:43:49', NULL, '2022-06-18'),
(29, '0013519078', 'Cherry Mae Canatoy', '13:43:50', NULL, '2022-06-18'),
(30, '0013546409', 'Glenn S. Crisostomo', '13:43:51', NULL, '2022-06-18'),
(31, '0013530940', 'Jimel Baria', '13:43:52', NULL, '2022-06-18'),
(32, '0013543698', 'Joshua Cruz', '13:45:13', NULL, '2022-06-18'),
(33, '987654321', 'Cashier', '19:47:40', NULL, '2022-06-21');

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
(1, 'M.Y. San Graham Crackers Honey | 700g', 194.5, 3, 'Snacks', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 184),
(2, 'Nissin Bread Stix | 20g 10pcs', 62.5, 5, 'Snacks', 'supplier 2', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 59),
(3, 'Super Stix Jr Milk | 330g', 66.5, 5, 'Snacks', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 60),
(4, 'ZestO Juice Drink Mango | 200ml', 9.5, 5, 'Beverage', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 9),
(5, 'Milo 1.2kg', 314.5, 4, 'Beverage', 'supplier 2', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 300),
(6, 'Ovaltine Swiss Chocolate | 29.6g', 18.5, 5, 'Beverage', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 16),
(7, 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 150, 5, 'Frozen Goods', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 143),
(8, 'Purefoods Tender Juicy Hotdog Regular | 500g', 120, 5, 'Frozen Goods', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 115),
(9, 'Simply Canola Oil | 2L', 329.5, 5, 'Pantry', 'supplier 5', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 320),
(10, 'Maya All Purpose Flour | 800g', 95, 4, 'Pantry', 'supplier 3', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 85),
(11, 'Nissin Pasta Creamy Carbonara | 60g', 14, 4, 'Pantry', 'supplier 4', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 12),
(12, 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 25, 4, 'Health And Beauty', 'supplier 4', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 20),
(13, 'Nexguard - KN95 Mask 10pcs', 30, 1, 'Health And Beauty', 'supplier 3', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 27),
(14, 'Safeguard Liquid Hand Soap Pure White | 450ml', 156.75, 5, 'Health And Beauty', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 150),
(15, 'Cielo Prem Slced Bread L | 400g', 50, 5, 'Bakery', 'supplier 4', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 35),
(16, 'Goya Chips Milk Chocolate | 150g', 62.5, 5, 'Bakery', 'supplier 2', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 60),
(17, 'Gardenia Loaf Bread California Raisins | 400g', 79.25, 5, 'Bakery', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 75),
(18, 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 429.75, 5, 'Baby And Kids', 'supplier 3', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 420),
(19, 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 497.75, 5, 'Baby And Kids', 'supplier 2', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 490),
(20, 'S26 Gold One Infant Formula Milk | 1.8kg', 2752.5, 5, 'Baby And Kids', 'supplier 2', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 2700),
(21, 'Off Lotion Family Care | 100ml', 180, 5, 'Health And Beauty', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 170),
(22, 'PH Care Feminine Wash Natural Protect 50ml', 57, 5, 'Health And Beauty', 'supplier 1', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 50),
(23, 'Listerine Mouthwash Coolmint | 250ml', 120, 0, 'Health And Beauty', 'supplier 3', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 110),
(24, 'MC Tofu Japanese 320g', 110, 2, 'Ready To Cook', 'supplier 4', '2022-06-21', 'Admin', 'Imported', '../images/items/default-image.png', 100);

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
(1, '4801958393109', 'Ajinomoto Crispy Fry Garlic (62g)', 18, 0, 'Baking And Cooking Breading Mix', 'supplier 1', '2022-06-21', 'Admin', 'Change Category', 15),
(2, '7801818410004', 'Tasty Boy Breading Mix Regular (67g)', 11, 0, 'Baking And Cooking Breading Mix', 'supplier 4', '2022-06-21', 'Admin', 'Imported', 10),
(3, '9556001132154', 'Cerelac Mixed Fruits & Soya (120g)', 60, 0, 'Baby Food', 'supplier 4', '2022-06-21', 'Admin', 'Imported', 55);

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

--
-- Dumping data for table `req_tran`
--

INSERT INTO `req_tran` (`req_id`, `user_card`, `user_name`, `req_amount`, `req_date`, `req_time`) VALUES
(1, '987654321', 'John Arian', 100, '2022-06-14', '00:00:00'),
(4, '987654321', 'John Arian', 100, '2022-06-14', '00:00:00'),
(5, '987654321', 'John Arian', 300, '2022-06-16', '07:07:12');

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
(146, '123123123', 'Purefoods Beef Tapa | 220g', 4, 0, '2022-06-11 19:21:39', 'Admin', 'Rosario, Cavite', 'In', 'Supplier 5'),
(147, '98762159138', 'MC Tofu Japanese 320g', 5, 0, '2022-06-16 06:58:26', 'Admin', 'Rosario, Cavite', 'In', 'supplier 4'),
(148, 'S1-220616148', '(W)MC Tofu Japanese 320g', 3, 488, '2022-06-16 07:04:37', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(149, 'S1-220616148', 'Manna Premium Kimchi Fresh | 475g', 1, 488, '2022-06-16 07:04:37', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(150, 'S1-220618150', 'Nutri Star', 7, 656, '2022-06-18 10:27:18', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(151, 'S1-220618150', 'Maya All Purpose Flour | 800g', 4, 656, '2022-06-18 10:27:18', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(152, 'S1-220618150', 'MC Tofu Japanese 320g', 2, 656, '2022-06-18 10:27:18', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(153, 'S1-220618153', 'MC Tofu Japanese 320g', 1, 110, '2022-06-18 10:29:30', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(154, 'S1-220618154', 'Maya All Purpose Flour | 800g', 1, 95, '2022-06-18 10:30:28', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(155, 'S1-220618155', 'Maya All Purpose Flour | 800g', 1, 95, '2022-06-18 10:31:32', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(156, 'S1-220618156', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 150, '2022-06-18 10:32:51', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(157, 'S1-220618157', 'Milo 1.2kg', 2, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(158, 'S1-220618157', 'Nexguard - KN95 Mask 10pcs', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(159, 'S1-220618157', 'Nissin Bread Stix | 20g 10pcs', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(160, 'S1-220618157', 'Nissin Pasta Creamy Carbonara | 60g', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(161, 'S1-220618157', 'Off Lotion Family Care | 100ml', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(162, 'S1-220618157', 'Ovaltine Swiss Chocolate | 29.6g', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(163, 'S1-220618157', 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(164, 'S1-220618157', 'PH Care Feminine Wash Natural Protect 50ml', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(165, 'S1-220618157', 'Purefoods Tender Juicy Hotdog Regular | 500g', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(166, 'S1-220618157', 'S26 Gold One Infant Formula Milk | 1.8kg', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(167, 'S1-220618157', 'Safeguard Liquid Hand Soap Pure White | 450ml', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(168, 'S1-220618157', 'Simply Canola Oil | 2L', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(169, 'S1-220618157', 'Super Stix Jr Milk | 330g', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(170, 'S1-220618157', 'ZestO Juice Drink Mango | 200ml', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(171, 'S1-220618157', 'Listerine Mouthwash Coolmint | 250ml', 1, 6303, '2022-06-18 10:37:41', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(172, 'S1-220618157', 'M.Y. San Graham Crackers Honey | 700g', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(173, 'S1-220618157', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(174, 'S1-220618157', 'Maya All Purpose Flour | 800g', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(175, 'S1-220618157', 'MC Tofu Japanese 320g', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(176, 'S1-220618157', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(177, 'S1-220618157', 'Goya Chips Milk Chocolate | 150g', 2, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(178, 'S1-220618157', 'Gardenia Loaf Bread California Raisins | 400g', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(179, 'S1-220618157', 'Cielo Prem Slced Bread L | 400g', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(180, 'S1-220618157', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 1, 6303, '2022-06-18 10:37:42', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(181, 'S1-220618181', 'MC Tofu Japanese 320g', 1, 110, '2022-06-18 10:39:19', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(182, 'S1-220618182', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 150, '2022-06-18 10:40:14', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(183, 'S1-220618183', 'Off Lotion Family Care | 100ml', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(184, 'S1-220618183', 'Nissin Pasta Creamy Carbonara | 60g', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(185, 'S1-220618183', 'Nissin Bread Stix | 20g 10pcs', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(186, 'S1-220618183', 'Nexguard - KN95 Mask 10pcs', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(187, 'S1-220618183', 'Milo 1.2kg', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(188, 'S1-220618183', 'Listerine Mouthwash Coolmint | 250ml', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(189, 'S1-220618183', 'M.Y. San Graham Crackers Honey | 700g', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(190, 'S1-220618183', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(191, 'S1-220618183', 'Maya All Purpose Flour | 800g', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(192, 'S1-220618183', 'MC Tofu Japanese 320g', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(193, 'S1-220618183', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(194, 'S1-220618183', 'Goya Chips Milk Chocolate | 150g', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(195, 'S1-220618183', 'Gardenia Loaf Bread California Raisins | 400g', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(196, 'S1-220618183', 'Cielo Prem Slced Bread L | 400g', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(197, 'S1-220618183', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 1, 1918, '2022-06-18 10:40:47', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(198, 'S1-220618198', 'MC Tofu Japanese 320g', 1, 110, '2022-06-18 10:43:02', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(199, 'S1-220618199', 'Listerine Mouthwash Coolmint | 250ml', 1, 744.25, '2022-06-18 10:45:27', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(200, 'S1-220618199', 'M.Y. San Graham Crackers Honey | 700g', 1, 744.25, '2022-06-18 10:45:27', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(201, 'S1-220618199', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 744.25, '2022-06-18 10:45:27', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(202, 'S1-220618202', 'Maya All Purpose Flour | 800g', 1, 95, '2022-06-18 10:45:46', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(203, 'S1-220618203', 'Nissin Pasta Creamy Carbonara | 60g', 1, 14, '2022-06-18 10:47:02', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(204, 'S1-220618204', 'MC Tofu Japanese 320g', 1, 110, '2022-06-18 10:48:01', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(205, 'S1-220618205', 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 1, 497.75, '2022-06-18 10:49:27', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(206, 'S1-220618206', 'M.Y. San Graham Crackers Honey | 700g', 1, 194.5, '2022-06-18 10:50:37', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(207, 'S1-220618207', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 429.75, '2022-06-18 10:51:33', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(208, 'S1-220618208', 'Nissin Pasta Creamy Carbonara | 60g', 9, 126, '2022-06-18 11:17:50', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(209, 'S1-220618209', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 429.75, '2022-06-18 11:20:11', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(210, 'S1-220618210', 'M.Y. San Graham Crackers Honey | 700g', 1, 194.5, '2022-06-18 11:20:51', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(211, 'S1-220618211', 'Nissin Pasta Creamy Carbonara | 60g', 1, 14, '2022-06-18 11:22:48', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(212, 'S1-220618212', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 429.75, '2022-06-18 11:24:53', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(213, 'S1-220618213', 'Fudgee Bar Dark Choco | 38g 10pcs', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(214, 'S1-220618213', 'Lactum Milk Supplement Powder 6-12 months | 1.2kg', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(215, 'S1-220618213', '(W)Red Bull Energy Drink Supreme | 150ml', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(216, 'S1-220618213', '(W)Ottogi Kimchi Ramen Pouch | 120g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(217, 'S1-220618213', '(W)Clear Shampoo Cool Sport Menthol 275ml 2pcs', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(218, 'S1-220618213', '(W)Koko Krunch Cereal | 500g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(219, 'S1-220618213', '(W)Nescafe Refill Classic | 200g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(220, 'S1-220618213', '(W)Graham Crackers Honey | 210g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(221, 'S1-220618213', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(222, 'S1-220618213', 'Gardenia Loaf Bread California Raisins | 400g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(223, 'S1-220618213', 'Purefoods Tender Juicy Hotdog Regular | 500g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(224, 'S1-220618213', 'PH Care Feminine Wash Natural Protect 50ml', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(225, 'S1-220618213', 'Off Lotion Family Care | 100ml', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(226, 'S1-220618213', 'Nissin Pasta Creamy Carbonara | 60g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(227, 'S1-220618213', 'Nissin Bread Stix | 20g 10pcs', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(228, 'S1-220618213', 'Nexguard - KN95 Mask 10pcs', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(229, 'S1-220618213', 'Ovaltine Swiss Chocolate | 29.6g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(230, 'S1-220618213', 'Simply Canola Oil | 2L', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(231, 'S1-220618213', 'Super Stix Jr Milk | 330g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(232, 'S1-220618213', 'ZestO Juice Drink Mango | 200ml', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(233, 'S1-220618213', 'Milo 1.2kg', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(234, 'S1-220618213', 'Maya All Purpose Flour | 800g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(235, 'S1-220618213', 'Goya Chips Milk Chocolate | 150g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(236, 'S1-220618213', 'Cielo Prem Slced Bread L | 400g', 1, 3048.75, '2022-06-18 11:31:22', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(237, 'S1-220618237', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 429.75, '2022-06-18 11:35:43', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(238, 'S1-220618238', 'M.Y. San Graham Crackers Honey | 700g', 1, 194.5, '2022-06-18 11:37:54', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(239, 'S1-220618239', 'Listerine Mouthwash Coolmint | 250ml', 1, 120, '2022-06-18 11:38:59', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(240, 'S1-220618240', 'M.Y. San Graham Crackers Honey | 700g', 1, 194.5, '2022-06-18 11:39:36', 'John Arian', 'Rosario, Cavite', 'Out', NULL),
(241, '1241256', 'MC Tofu Japanese 320g', 10, 0, '2022-06-18 11:41:30', 'Admin', 'Rosario, Cavite', 'In', 'supplier 4'),
(242, 'S1-220618242', 'Manna Premium Kimchi Fresh | 475g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(243, 'S1-220618242', 'Red Bull Energy Drink Supreme | 150ml', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(244, 'S1-220618242', 'Ottogi Kimchi Ramen Pouch | 120g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(245, 'S1-220618242', 'Jack & Jill Piattos Cheese | 85g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(246, 'S1-220618242', 'Lactum Milk Supplement Powder 6-12 months | 1.2kg', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(247, 'S1-220618242', 'Enfamil One A+ Infant Formula Powder 0-6 months | 1.8kg', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(248, 'S1-220618242', 'EQ Pants Big Pack | XL24', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(249, 'S1-220618242', 'Fudgee Bar Dark Choco | 38g 10pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(250, 'S1-220618242', 'Gardenia Classic White Bread Regular Slice | 600g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(251, 'S1-220618242', 'Lemon Square Cheese Cake | 30g 10pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(252, 'S1-220618242', 'Sunsilk Shampoo Perfect Straight | 180ml+13mlx7pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(253, 'S1-220618242', 'Clear Shampoo Cool Sport Menthol 275ml 2pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(254, 'S1-220618242', 'Koko Krunch Cereal | 500g', 2, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(255, 'S1-220618242', 'Nutella Spread Hazelnut | 200g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(256, 'S1-220618242', 'Purefoods Chicken Breast Nuggets Crispy N Juicy | 200g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(257, 'S1-220618242', 'Purefoods Chicken Hotdog Jumbo | 500g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(258, 'S1-220618242', 'Purefoods Beef Tapa | 220g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(259, 'S1-220618242', 'Tang Powdered Juice | 20g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(260, 'S1-220618242', 'Del Monte Pineapple Juice | 1L', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(261, 'S1-220618242', 'Nescafe Refill Classic | 200g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(262, 'S1-220618242', 'Graham Crackers Honey | 210g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(263, 'S1-220618242', 'Fita Crackers | 30g 10pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(264, 'S1-220618242', 'SkyFlakes Crackers | 25g 24pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(265, 'S1-220618242', 'Listerine Mouthwash Coolmint | 250ml', 95, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(266, 'S1-220618242', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 2, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(267, 'S1-220618242', 'Gardenia Loaf Bread California Raisins | 400g', 2, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(268, 'S1-220618242', 'S26 Gold One Infant Formula Milk | 1.8kg', 2, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(269, 'S1-220618242', 'Purefoods Tender Juicy Hotdog Regular | 500g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(270, 'S1-220618242', 'PH Care Feminine Wash Natural Protect 50ml', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(271, 'S1-220618242', 'Pampers Dry Pants Jumbo Pack XXL | 34pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(272, 'S1-220618242', 'Ovaltine Swiss Chocolate | 29.6g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(273, 'S1-220618242', 'Safeguard Liquid Hand Soap Pure White | 450ml', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(274, 'S1-220618242', 'Simply Canola Oil | 2L', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(275, 'S1-220618242', 'Super Stix Jr Milk | 330g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(276, 'S1-220618242', 'ZestO Juice Drink Mango | 200ml', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(277, 'S1-220618242', 'Off Lotion Family Care | 100ml', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(278, 'S1-220618242', 'Nissin Pasta Creamy Carbonara | 60g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(279, 'S1-220618242', 'Nissin Bread Stix | 20g 10pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(280, 'S1-220618242', 'Nexguard - KN95 Mask 10pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(281, 'S1-220618242', 'Milo 1.2kg', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(282, 'S1-220618242', 'M.Y. San Graham Crackers Honey | 700g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(283, 'S1-220618242', 'Mamypoko Pants Easy to Wear Jumbo Pack | XL38', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(284, 'S1-220618242', 'Maya All Purpose Flour | 800g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(285, 'S1-220618242', 'MC Tofu Japanese 320g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(286, 'S1-220618242', 'JSL Dagupan Daing na Bangus Boneless | 400g 2pcs', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(287, 'S1-220618242', 'Goya Chips Milk Chocolate | 150g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(288, 'S1-220618242', 'Cielo Prem Slced Bread L | 400g', 1, 26180.25, '2022-06-18 11:49:00', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(289, 'S1-220618289', 'Nestea Powder Kiwi Lemon Litro (25g)', 1, 3274, '2022-06-18 13:00:10', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(290, 'S1-220618289', 'Nestea Powder Cranberry Litro (25g)', 1, 3274, '2022-06-18 13:00:10', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(291, 'S1-220618289', 'Nestea Powder Apple Litro (25gx6)', 1, 3274, '2022-06-18 13:00:10', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(292, 'S1-220618289', 'Nesfruta Powder Orange Litro (25g)', 1, 3274, '2022-06-18 13:00:10', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(293, 'S1-220618289', 'Nesfruta Powder Melon Litro (25g)', 1, 3274, '2022-06-18 13:00:10', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(294, 'S1-220618289', 'Nesfruta Powder Mangosteen Litro (22g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(295, 'S1-220618289', 'Nesfruta Powder GuyabanoLitro (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(296, 'S1-220618289', 'Nesfruta Powder Dalandan Litro (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(297, 'S1-220618289', 'Nesfruta Powder Buko Litro (22g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(298, 'S1-220618289', 'Sting Energy Drink Strawberry (330ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(299, 'S1-220618289', 'Sting energy Drink Power Pacq (330ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(300, 'S1-220618289', 'Red Bull Energy Drink Supreme (150ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(301, 'S1-220618289', 'Extra Joss Active Energy Drink (4g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(302, 'S1-220618289', 'Cobra Energy Drink Fit (350ml)', 2, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(303, 'S1-220618289', 'Cobra Energy Drink (350ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(304, 'S1-220618289', 'Cobra Energy Drink Defense (350ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(305, 'S1-220618289', 'Cobra Energy Drink Berry Blast (350ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(306, 'S1-220618289', 'Nescafe Coffee RTD White Mocha (200ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(307, 'S1-220618289', 'Oishi Hi Coffee RTD Coffee + Choco (250ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(308, 'S1-220618289', 'Oishi Hi Coffee RTD Caramel (250ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(309, 'S1-220618289', 'Oishi Hi Coffee RTD Cappuccino (250ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(310, 'S1-220618289', 'Oishi Hi Coffee RTD Cafe Latte (250ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(311, 'S1-220618289', 'Nescafe Coffee RTD French Vanilla (200ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(312, 'S1-220618289', 'Nescafe Coffee RTD Caramel Macchiato (200ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(313, 'S1-220618289', 'Nescafe Coffee RTD Cafe Au Lait (200ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(314, 'S1-220618289', 'Haus Blend Coffee Cafe Classic (240ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(315, 'S1-220618289', 'Haus Blend Coffee Cafe Mocha (240ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(316, 'S1-220618289', 'Haus Blend Coffee Cafe Latte (240ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(317, 'S1-220618289', 'Great Taste RTD Coffee Viet Latte (180ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(318, 'S1-220618289', 'Great Taste RTD Coffee Dark Java (180ml)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(319, 'S1-220618289', 'Krem-Top Coffee Creamer (450g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(320, 'S1-220618289', 'Krem-Top Coffee Creamer (250g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(321, 'S1-220618289', 'Krem-Top Coffee Creamer (170g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(322, 'S1-220618289', 'Krem-Top Coffee Creamer (80g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(323, 'S1-220618289', 'Krem-Top Coffee Creamer (5g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(324, 'S1-220618289', 'Cream All Creamer (450g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(325, 'S1-220618289', 'Cream All Creamer (300g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(326, 'S1-220618289', 'Cream All Creamer (80g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(327, 'S1-220618289', 'Cream All Creamer Stick (5g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(328, 'S1-220618289', 'Coffee Mate Creamer Refill (450g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(329, 'S1-220618289', 'Coffee Mate Creamer (250g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(330, 'S1-220618289', 'Coffee Mate Creamer (170g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(331, 'S1-220618289', 'Coffee Mate Creamer (80g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(332, 'S1-220618289', 'Coffee Mate Creamer (5g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(333, 'S1-220618289', 'Angel Coffee Creamer (200g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(334, 'S1-220618289', 'Angel Coffee Creamer (80g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(335, 'S1-220618289', 'San Mig Coffee Original Polybag (20g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(336, 'S1-220618289', 'San Mig Coffee Original Dos (34g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(337, 'S1-220618289', 'San Mig Coffee Original Strip (20g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(338, 'S1-220618289', 'San Mig Coffee Orig Sugar Free (7g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(339, 'S1-220618289', 'San Mig Coffee Orig Sugar Free SUP (7g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(340, 'S1-220618289', 'San Mig Coffee Mild Sugar Free SUP (7g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(341, 'S1-220618289', 'San Mig Coffee Barako (17g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(342, 'S1-220618289', 'Oishi Hi Coffee Vanilla Caramel (22g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(343, 'S1-220618289', 'Oishi Hi Coffee+Choco (22g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(344, 'S1-220618289', 'Oishi Hi Coffee 3 in 1 Orig (20g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(345, 'S1-220618289', 'Oishi Hi Coffee 3 in 1 Double Creamy (22g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(346, 'S1-220618289', 'Nescafe Coffee 3 in 1 Orig Twin Pack (56g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL);
INSERT INTO `transaction_logs` (`log_id`, `tran_num`, `tran_item`, `tran_qty`, `tran_total`, `tran_date_time`, `tran_cashier`, `tran_location`, `tran_type`, `sup_name`) VALUES
(347, 'S1-220618289', 'Nescafe Coffee Creamy White Polybag (29gx5)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(348, 'S1-220618289', 'Nescafe Coffee Creamy White Twin Pack (58g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(349, 'S1-220618289', 'Nescafe Coffee Coco Mocha Polybag (30g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(350, 'S1-220618289', 'Nescafe Coffee Berry Mocha Polybag (30g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(351, 'S1-220618289', 'Nescafe 3 in 1 Creamylatte twnx5 (27.5g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(352, 'S1-220618289', 'Kopiko Coffee Low Acid Hanger (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(353, 'S1-220618289', 'Kopiko Coffee Low Acid Bag (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(354, 'S1-220618289', 'Kopiko Coffee Cappuccino Pouch (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(355, 'S1-220618289', 'Kopiko Coffee Cappuccino Hanger (25g) ', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(356, 'S1-220618289', 'Kopiko Coffee Kopiccino Bag (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(357, 'S1-220618289', 'Kopiko Coffee Double Cups (33g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(358, 'S1-220618289', 'Kopiko Coffee Blanca Twin (52g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(359, 'S1-220618289', 'Kopiko Coffee Blanca Pouch (30g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(360, 'S1-220618289', 'Kopiko Coffee Blanca Hanger (30g)X5', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(361, 'S1-220618289', 'Kopiko Coffee Blanca Bag (30g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(362, 'S1-220618289', 'Kopiko Coffee Brown Pouch (27.5g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(363, 'S1-220618289', 'Kopiko Coffee Brown Twin (55g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(364, 'S1-220618289', 'Kopiko Coffee Brown Hanger X5', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(365, 'S1-220618289', 'Kopiko Coffee Brown Bag (27.5g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(366, 'S1-220618289', 'Kopiko Coffee Black Twin (50g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(367, 'S1-220618289', 'Kopiko Coffee 3 in 1 Astig Hanger (25g)X5', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(368, 'S1-220618289', 'Kopiko Coffee 3 in 1 Astig Bag (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(369, 'S1-220618289', 'Great Taste 3 in 1 White Sugar Free (17g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(370, 'S1-220618289', 'Great Taste 3 in 1 White Chocolate Twin (50g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(371, 'S1-220618289', 'Great Taste 3 in 1 White Chocolate Tie (30g)X', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(372, 'S1-220618289', 'Great Taste 3 in 1 White Caramel Polybag (30g', 2, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(373, 'S1-220618289', 'Great Taste 3 in 1 White Twin Pack (50g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(374, 'S1-220618289', 'Great Taste 3 in 1 White (30g)X5', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(375, 'S1-220618289', 'Great Taste 3 in 1 Original (165g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(376, 'S1-220618289', 'Great Taste 3 in 1 Original Twin Packx5', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(377, 'S1-220618289', 'Nescafe Classic (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(378, 'S1-220618289', 'Nescafe Classic Stick (2g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(379, 'S1-220618289', 'Great Taste Prem Blend (100g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(380, 'S1-220618289', 'Great Taste Prem Blend (50g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(381, 'S1-220618289', 'Great Taste Prem Blend (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(382, 'S1-220618289', 'Great Taste Prem Blend Stick (2g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(383, 'S1-220618289', 'Great Taste Coffee Budget Pack (100g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(384, 'S1-220618289', 'Great Taste Coffee Budget Pack (50g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(385, 'S1-220618289', 'Great Taste Coffee Budget Pack (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(386, 'S1-220618289', 'Cafe Puro Coffee Budget Pack (100g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(387, 'S1-220618289', 'Cafe Puro Coffee Budget Pack (50g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(388, 'S1-220618289', 'Cafe Puro Coffee Budget Pack (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(389, 'S1-220618289', 'Blend 45 Instant Coffee (100g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(390, 'S1-220618289', 'Blend 45 Instant Coffee (50g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(391, 'S1-220618289', 'Blend 45 Instant Coffee (25g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(392, 'S1-220618289', 'Blend 45 Instant Coffee (2g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(393, 'S1-220618289', 'Ricoa Cocoa Sweetened Pouch (200g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(394, 'S1-220618289', 'Ricoa Cocoa Sweetened Econo Pack (100g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(395, 'S1-220618289', 'Ricoa Cocoa Breakfast Canister (160g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(396, 'S1-220618289', 'Ricoa Cocoa Breakfast (80g)', 1, 3274, '2022-06-18 13:00:11', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(397, 'S1-220618289', 'Ricoa Cocoa Breakfast Econo Pack (70g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(398, 'S1-220618289', 'Zest-O Root Beer Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(399, 'S1-220618289', 'Zest-O Root Beer in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(400, 'S1-220618289', 'Zest-O Root Beer in Can (250ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(401, 'S1-220618289', 'Zest-O Dalandan Soda Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(402, 'S1-220618289', 'Zest-O Dalandan Soda in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(403, 'S1-220618289', 'Zest-O Dalandan Soda in Can (250ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(404, 'S1-220618289', 'Zest-O Calamansi Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(405, 'S1-220618289', 'Zest-O Calamansi Soda in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(406, 'S1-220618289', 'Zest-O Calamansi Soda in Can (250ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(407, 'S1-220618289', 'Sprite Reg. Pet Bootle (2L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(408, 'S1-220618289', 'Sprite Reg. Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(409, 'S1-220618289', 'Sprite Reg. Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(410, 'S1-220618289', 'Sprite Reg. Mismo (300ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(411, 'S1-220618289', 'Seetrus Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(412, 'S1-220618289', 'Seetrus in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(413, 'S1-220618289', 'RC Cola No Sugar in Can (330ml)', 2, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(414, 'S1-220618289', 'Royal Reg. mismo', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(415, 'S1-220618289', ' Royal Reg. Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(416, 'S1-220618289', 'Royal Reg. in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(417, 'S1-220618289', 'RC Cola Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(418, 'S1-220618289', 'RC Cola Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(419, 'S1-220618289', 'RC Cola in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(420, 'S1-220618289', 'Pepsi Reg. Pet Bootle (2L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(421, 'S1-220618289', 'Pepsi Reg. Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(422, 'S1-220618289', 'Pepsi Reg. Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(423, 'S1-220618289', 'Pepsi Reg. Pet Bootle (300ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(424, 'S1-220618289', 'Pepsi Reg. in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(425, 'S1-220618289', 'Pepsi Max in Can (330ml)', 2, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(426, 'S1-220618289', 'Pepsi Max Pet Bootle (2L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(427, 'S1-220618289', 'Mug Root Beer Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(428, 'S1-220618289', 'Mug Root Beer in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(429, 'S1-220618289', 'Mountain Dew Pet Bootle (2L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(430, 'S1-220618289', 'Mountain Dew Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(431, 'S1-220618289', 'Mountain Dew Pet Bootle (1.250L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(432, 'S1-220618289', 'Mountain Dew Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(433, 'S1-220618289', 'Mountain Dew Neon Pet Bottle (400ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(434, 'S1-220618289', 'Mountain Dew in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(435, 'S1-220618289', 'Mountain Dew Pet Bootle (300ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(436, 'S1-220618289', 'Mountain Dew in Can (250ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(437, 'S1-220618289', 'Mirinda Orange Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(438, 'S1-220618289', 'Mirinda Orange Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(439, 'S1-220618289', 'Mirinda Orange in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(440, 'S1-220618289', 'Juicy Lemon Fruit Soda Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(441, 'S1-220618289', 'Juicy Lemon Fruit Soda Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(442, 'S1-220618289', 'Juicy Lemon Fruit Soda in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(443, 'S1-220618289', 'Fruit Soda Orange (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(444, 'S1-220618289', 'Fruit Soda Orange (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(445, 'S1-220618289', 'Fruit Soda Orange in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(446, 'S1-220618289', 'Coke Zero Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(447, 'S1-220618289', 'Coke Zero in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(448, 'S1-220618289', 'Coke Reg. Pet Bootle (2L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(449, 'S1-220618289', 'Coke Reg. Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(450, 'S1-220618289', 'Coke Reg. Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(451, 'S1-220618289', 'Coke Reg. Mismo (300ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(452, 'S1-220618289', 'Coke Reg. in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(453, 'S1-220618289', 'Coke Light Pet Bootle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(454, 'S1-220618289', 'Coke Light in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(455, 'S1-220618289', '7-UP Reg. Pet Bottle (2L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(456, 'S1-220618289', '7-UP Reg. Pet Bottle (1.5L)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(457, 'S1-220618289', '7-UP Reg. Pet Bootle (500ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(458, 'S1-220618289', '7-UP Reg. in Can (330ml)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(459, 'S1-220618289', 'White King Hotcake Mix (400g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(460, 'S1-220618289', 'White King Hotcake Mix (200g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(461, 'S1-220618289', 'Maya Hotcake Original (500g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(462, 'S1-220618289', 'Maya Hotcake Original (200g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(463, 'S1-220618289', 'Magnolia Pancake & Waffle Mix (400g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(464, 'S1-220618289', 'Magnolia Pancake & Waffle Mix (180g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(465, 'S1-220618289', 'Magnolia Pancake Plus w/ Strawberry (200g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(466, 'S1-220618289', 'Magnolia Pancake Plus w/ Maple (200g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(467, 'S1-220618289', 'Magnolia Pancake Plus w/ Choco (200g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(468, 'S1-220618289', 'Queen Baking Soda (500g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(469, 'S1-220618289', 'Queen Baking Soda (250g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(470, 'S1-220618289', 'Queen Baking Soda (125g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(471, 'S1-220618289', 'Magnolia All Purpose Flour (800g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(472, 'S1-220618289', 'Magnolia All Purpose Flour (400g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(473, 'S1-220618289', 'Calumet Baking Powder (14kg)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(474, 'S1-220618289', 'Calumet Baking Powder (1kg)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(475, 'S1-220618289', 'Calumet Baking Powder (50g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(476, 'S1-220618289', 'Cerelac Wheat Banana & Milk (250g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(477, 'S1-220618289', 'Cerelac Wheat Banana & Milk (120g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(478, 'S1-220618289', 'Cerelac Rice & Soya (120g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(479, 'S1-220618289', 'Cerelac Mixed Veg & Soya (120g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(480, 'S1-220618289', 'Cerelac Mixed Fruits & Soya (120g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(481, 'S1-220618289', 'Tasty Boy Breading Mix Spicy (67g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(482, 'S1-220618289', 'Tasty Boy Breading Mix Regular (67g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(483, 'S1-220618289', 'Tasty Boy Breading Mix Garlic (67g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(484, 'S1-220618289', 'Krispers Bread Crumbs (1kg)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(485, 'S1-220618289', 'Krispers Bread Crumbs (230g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(486, 'S1-220618289', 'Del Monte Fried Chicken Mixes (125g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(487, 'S1-220618289', 'Ajinomoto Crispy Fry w/ Gravy (102g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(488, 'S1-220618289', 'Ajinomoto Crispy Fry Original (238g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(489, 'S1-220618289', 'Ajinomoto Crispy Fry Original (62g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(490, 'S1-220618289', 'Ajinomoto Crispy Fry Original (30g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(491, 'S1-220618289', 'Ajinomoto Crispy Fry Spicy (62g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(492, 'S1-220618289', 'Ajinomoto Crispy Fry Garlic (62g)', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(493, 'S1-220618289', 'Birchtree choco33gx4', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(494, 'S1-220618289', 'Rose Bowl Sardines with Chili 155g', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(495, 'S1-220618289', 'Rose Bowl Sardines 155g', 1, 3274, '2022-06-18 13:00:12', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(496, 'S1-220618496', 'Rose Bowl Sardines with Chili 155g', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(497, 'S1-220618496', 'Tang Powder Honey Lemon Litro (25g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(498, 'S1-220618496', 'Tang Powder Guyabano Litro (25g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(499, 'S1-220618496', 'Tang Powder Four Seasons Litro (25g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(500, 'S1-220618496', 'Tang Powder Dalandan Litro (25gx6)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(501, 'S1-220618496', 'Tang Powder Calamansi Litro (25gx6)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(502, 'S1-220618496', 'Tang Powder Apple Litro (25g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(503, 'S1-220618496', 'Oishi Sundays Melon Powder Drink (35g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(504, 'S1-220618496', 'Oishi Sundays Mango Powder Drink (35g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(505, 'S1-220618496', 'Nestea Powder Strawberry Kiwi Blend Litro (25', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(506, 'S1-220618496', 'Nestea Powder Peach Lemon Blend Litro (25g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(507, 'S1-220618496', 'Nestea Powder Lemon (450g)', 1, 665, '2022-06-18 13:08:43', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(508, 'S1-220618496', 'Nestea Powder Lemon 2-Litro (50g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(509, 'S1-220618496', 'Nestea Powder Lemon Litro (25gx6)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(510, 'S1-220618496', 'Nestea Powder Honey Blend (450g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(511, 'S1-220618496', 'Nestea Powder Honey Blend Litro (25g):', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(512, 'S1-220618496', 'Nestea Powder Kiwi Lemon Litro (25g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(513, 'S1-220618496', 'Nestea Powder Cranberry Litro (25g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(514, 'S1-220618496', 'Nestea Powder Apple Litro (25gx6)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(515, 'S1-220618496', 'Nesfruta Powder Orange Litro (25g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(516, 'S1-220618496', 'Nesfruta Powder Melon Litro (25g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(517, 'S1-220618496', 'Nesfruta Powder Mangosteen Litro (22g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(518, 'S1-220618496', 'Nesfruta Powder GuyabanoLitro (25g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(519, 'S1-220618496', 'Nesfruta Powder Dalandan Litro (25g)', 1, 665, '2022-06-18 13:08:44', 'John Arian', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(520, '123', 'Nestea Powder Cranberry Litro (25g)', 50, 0, '2022-06-18 14:06:48', 'Conrad', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'In', ''),
(521, '1235wrhgse4', 'Nesfruta Powder Mangosteen Litro (22g)', 20, 0, '2022-06-20 10:04:28', 'Admin', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'In', ''),
(522, 'S1-220620522', 'milo 24gx7', 1, 67, '2022-06-20 11:58:27', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(523, 'S1-220620522', 'Krispers Bread Crumbs (230g)', 1, 67, '2022-06-20 11:58:27', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(524, 'S1-220620522', '(W)Ajinomoto Crispy Fry Original (30g)', 1, 67, '2022-06-20 11:58:27', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(525, 'S1-220620522', 'Ajinomoto Crispy Fry Garlic (62g)', 1, 67, '2022-06-20 11:58:27', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(526, 'S1-220621526', 'Nissin Pasta Creamy Carbonara | 60g', 1, 208.5, '2022-06-21 23:42:18', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(527, 'S1-220621526', 'M.Y. San Graham Crackers Honey | 700g', 1, 208.5, '2022-06-21 23:42:18', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(528, 'S1-220622528', 'Listerine Mouthwash Coolmint | 250ml', 4, 815, '2022-06-22 00:16:13', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(529, 'S1-220622528', 'Charmee Napkin Heavy Flow Overnight Cotton With Wing | 8pads', 1, 815, '2022-06-22 00:16:13', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(530, 'S1-220622528', 'MC Tofu Japanese 320g', 2, 815, '2022-06-22 00:16:13', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(531, 'S1-220622528', 'Nexguard - KN95 Mask 10pcs', 3, 815, '2022-06-22 00:16:13', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(532, 'S1-220622532', 'Nexguard - KN95 Mask 10pcs', 1, 864, '2022-06-22 21:25:24', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(533, 'S1-220622532', 'Milo 1.2kg', 1, 864, '2022-06-22 21:25:24', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(534, 'S1-220622532', 'Listerine Mouthwash Coolmint | 250ml', 1, 864, '2022-06-22 21:25:24', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(535, 'S1-220622532', 'M.Y. San Graham Crackers Honey | 700g', 1, 864, '2022-06-22 21:25:24', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(536, 'S1-220622532', 'MC Tofu Japanese 320g', 1, 864, '2022-06-22 21:25:24', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL),
(537, 'S1-220622532', 'Maya All Purpose Flour | 800g', 1, 864, '2022-06-22 21:25:24', 'Cashier', 'Stall #60 Lucky8 Wet&Dry Mkt, Mapulang Lupa, Pandi, Bulacan', 'Out', NULL);

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `cashier_name`, `user_rfid`, `role`, `avail_amount`) VALUES
(1, 'admin', '$2y$10$BxAfLc6FOCZnAf7qgYaIquiiR.WxUrMRRj9JosAE419zK/CRtLMyW', 'Admin', '1', 'admin', 1000),
(2, 'cashier', '$2y$10$N/aTeiGfsYITVrfY3qRA4.uq/nH1QgNqo2EuiBDVNnyRxutQB1ruy', 'Cashier', '987654321', 'cashier', 1000),
(7, 'jimel', '$2y$10$H19r4t.ppIc2TtMAcE65I.ZsgkLzuGH8XgeOT6i2McmZu6qrtfHs6', 'Jimel Baria', '0013530940', 'cashier', 1000),
(8, 'glenn', '$2y$10$10nLqhQyuvq2q1gDR0kg/u1mGe0xYSDblmNqXWNtfpBcqXQUd6JVe', 'Glenn S. Crisostomo', '0013546409', 'cashier', 1000),
(9, 'cherry', '$2y$10$XuESskR/LpKlHcsEUlawmOfsBYmOHODBeXpmUY/nejBEABVdwSQRe', 'Cherry Mae Canatoy', '0013519078', 'cashier', 1000),
(10, 'jovelyn', '$2y$10$divzHLiIarY4rn5ZyToK0O9u3r0iDe5FI5sz5gqO2xNjVoDyRMY26', 'Jovelyn S. Sismar', '0013706230', 'cashier', 1000),
(11, 'raziel', '$2y$10$gc3be3lOaf3lFm87DskAWe51mtEWc1OpM2YvY7MNoCWKTAQIwaYoC', 'Raziel D. Ginto', '0013664186', 'cashier', 1000),
(12, 'myra', '$2y$10$.pixHWXpLDO6rjMZ4.3rkOIhYuLPvYgV81BjO6fop9L.GIAAkkj/a', 'Myra C. Santiago', '0015040739', 'cashier', 1000),
(13, 'thina', '$2y$10$2.XhiCaj6CCJ8TLBNMubiuFZ/ljusWcv/i0uYsl1/7bDCxjK3B8t2', 'Thina P. Rosales', '0013545972', 'cashier', 1000),
(14, 'jessajoy', '$2y$10$F88D77e9RMMj0p8rgceGueXZKlHXgVFgLpG5svNO9U7a4sI0Dtod2', 'Jessajoy L. Ariscon', '0013527965', 'cashier', 1000),
(15, 'nina', '$2y$10$796yeKyH0y5V8ZkbJBKBnu6qSNELRHDKD86SioY17afjYpw38FF6u', 'Nina Claire M. Santos', '0013527350', 'cashier', 1000),
(16, 'athena', '$2y$10$u69KpXHyWtpiYxtHw1II1OKEzkgcTidvxUZdklbP1VBZyZYNbHs72', 'Athena B. Toos', '0013662478', 'cashier', 1000),
(17, 'eloisa', '$2y$10$vTCxxoxjbgE7IOZHHx7mw.7RrxT44ECZkC8GaA67H7ybnDYQxwLnC', 'Eloisa B. Espino', '0013729770', 'cashier', 1000),
(18, 'john', '$2y$10$qHBYz1XPWFIJFMXNVPnEB.JrEktk4erakr9rbO0V.RQSpCw.mi0b2', 'John Gerald Lorenzo', '0013709151', 'cashier', 1000),
(19, 'christine', '$2y$10$iwKfFcNr9VwVVxxjPzyqmeCyE58p3t.Cfw7bTT3pe2s//N1PNjiWW', 'Christine Joyce Gabion', '0013730740', 'cashier', 1000),
(20, 'noli', '$2y$10$RbNeu9XVCz6TWcM8lZHPNOU1oHViu6XBMrrnHoOuBPDvKt1Uv4C42', 'Noli Francisco', '0013663608', 'cashier', 1000),
(21, 'judel', '$2y$10$pNGMVFIP448LwLHrqlx17.KTZPICuyThaByealQMBRag.4KRqjhvm', 'Judel Magtibay', '0013663031', 'cashier', 1000),
(22, 'monaliza', '$2y$10$cFXZgIwremCo.o8msVAGIOKwzV7S/nmAbadDmyk.i3X0KCEbqsmPq', 'Monaliza Palicios', '0013663041', 'cashier', 1000),
(23, 'zenaida', '$2y$10$vKqH.JtkvV8wC6U1eFtM..2pz648WzKuos1OqxS.ew4hHqw5ptlNG', 'Zenaida Camporedondo', '0013710489', 'cashier', 1000),
(24, 'jolina', '$2y$10$2Sx1ZIrfFvV/nK09cWETS.td24T0/9g44jAqLUBq9VLXEwwM4suxC', 'Jolina R. Sano', '0013528045', 'cashier', 1000),
(25, 'jenny', '$2y$10$HyngAechin6G34rVOEIwbumUoabC2PMG75XYnsT7uI2L44lVQdoeO', 'Jenny Rose M. Loyola', '0013530190', 'cashier', 1000),
(26, 'wilfred', '$2y$10$ZUeMJRZgrUP8S3sjWGfuDudWJuu8D2HN4prK9DOsblajV4F7fqApS', 'Wilfred Capaglan', '0013530290', 'cashier', 1000),
(27, 'jerry', '$2y$10$xdvLHwJQJZom38D5KTy50Obb7Vu2lwjvkmkIrq85thTdUWT0fDZ4q', 'Jerry Ferrer', '0013663615', 'cashier', 1000),
(28, 'dan', '$2y$10$Niq8c2Xithul3TPEOfmKW.UfW05Q..EF1F4hEySGF2Mzx168QyDfG', 'dan', '0013545705', 'admin', 1000),
(29, 'conrad', '$2y$10$/9WN2QS/pUbWttepWuty2euTw1VI3B0vznD6v1.CmrE/QZfvcqGOG', 'Conrad', '0013527451', 'admin', 1000),
(30, 'ceo', '$2y$10$IhBHUjz9aSgwydugo6bljuWZoUsEI.AMJsZFriUVcg2nStD8LUNHO', 'Jeanette', '0013542977', 'admin', 1000),
(31, 'admin2', '$2y$10$QobmBMvFvyn32XxxQGn1XOMxn8K76FqCOK2rKwC2/e9wqVlZ5oXS6', 'Admin', '0013543963', 'admin', 1000),
(32, 'admin1', '$2y$10$lOzlKt1RHwg/wj7e13dRp.fty.MJ36JvOXT0agSJr3hHBaDqKwfYW', 'Admin', '0013526702', 'admin', 1000),
(33, 'joshua', '$2y$10$2malmCwsGQ1qFc6YJDjijeB4lGowu42/fTZbVKN7y0xa2g0o6ykye', 'Joshua Cruz', '0013543698', 'cashier', 1000);

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
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `dtr`
--
ALTER TABLE `dtr`
  MODIFY `dtr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `item_no_barcode`
--
ALTER TABLE `item_no_barcode`
  MODIFY `item_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `item_with_barcode`
--
ALTER TABLE `item_with_barcode`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `req_tran`
--
ALTER TABLE `req_tran`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;