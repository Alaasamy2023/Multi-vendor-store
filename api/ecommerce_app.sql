-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2022 at 07:59 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`id`, `title`, `photo`, `active`) VALUES
(1, 'إلكترونيات', 'dress.svg', 1),
(2, 'مستلزمات السيارات', 'dress.svg', 1),
(3, 'السوبرماركت', 'dress.svg', 1),
(4, 'العطور والجمال', 'dress.svg', 1),
(5, 'الازياء', 'dress.svg', 1),
(6, 'الساعات', 'dress.svg', 1),
(7, 'مستلزمات المنزل', 'dress.svg', 1),
(8, 'مستلزمات المطبخ', 'dress.svg', 1),
(9, 'العاب', 'dress.svg', 1),
(10, 'الكتب', 'dress.svg', 1),
(11, 'اجهزه العنايه الشخصيه', 'dress.svg', 1),
(12, 'الصحه والعنايه الشخصيه', 'dress.svg', 1),
(15, 'المفروشات', 'dress.svg', 1),
(16, 'مستلزمات رياضيه', 'dress.svg', 1),
(17, 'مستلزمات الحيوانات ', 'dress.svg', 1),
(18, 'الادوات', 'dress.svg', 1),
(19, 'مستلزمات السيارات', 'dress.svg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catagory_visit`
--

CREATE TABLE `catagory_visit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `catagory_id` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `catagory_visit`
--

INSERT INTO `catagory_visit` (`id`, `user_id`, `catagory_id`, `time`, `date`) VALUES
(65, 1, 1, '08:07', '2022-10-27'),
(66, 1, 2, '08:16', '2022-10-27'),
(67, 1, 1, '08:17', '2022-10-27'),
(68, 1, 1, '08:24', '2022-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `comment_store`
--

CREATE TABLE `comment_store` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `star` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `description_product`
--

CREATE TABLE `description_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `photo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `description_product`
--

INSERT INTO `description_product` (`id`, `product_id`, `title`, `description`, `photo`) VALUES
(1, 1, 'desc1', 'desc1desc1', ''),
(2, 2, 'desc1', 'desc1desc1', '');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id`, `store_id`, `time`, `date`, `active`) VALUES
(1, 2, 3, '', '', 1),
(2, 1, 6, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `information_product`
--

CREATE TABLE `information_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `photo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `information_product`
--

INSERT INTO `information_product` (`id`, `product_id`, `title`, `description`, `photo`) VALUES
(1, 1, 'info1', 'info1', ''),
(2, 2, 'info1', 'info1', '');

-- --------------------------------------------------------

--
-- Table structure for table `like_product`
--

CREATE TABLE `like_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `like_product`
--

INSERT INTO `like_product` (`id`, `product_id`, `user_id`, `active`, `time`, `date`) VALUES
(1, 1, 1, 0, '', ''),
(2, 1, 2, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `login_time_location`
--

CREATE TABLE `login_time_location` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `location_lang` varchar(1000) NOT NULL,
  `location_lat` varchar(1000) NOT NULL,
  `large_city` varchar(1000) NOT NULL,
  `city` varchar(1000) NOT NULL,
  `street` varchar(1000) NOT NULL,
  `country` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offer_product`
--

CREATE TABLE `offer_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_offer` varchar(500) NOT NULL,
  `date_star` varchar(100) NOT NULL,
  `time_star` varchar(100) NOT NULL,
  `date_end` varchar(100) NOT NULL,
  `time_end` varchar(100) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `state` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `offer_product`
--

INSERT INTO `offer_product` (`id`, `product_id`, `price_offer`, `date_star`, `time_star`, `date_end`, `time_end`, `title`, `description`, `state`, `active`) VALUES
(2, 1, '5', '5-10-2022', '', '6-10-2020', '', '', '', 1, 1),
(3, 3, '5', '5-10-2022', '', '6-10-2020', '', 'توصيل مجانى', 'توصيل مجانى الى القاهره الكبري', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_phone_1` varchar(20) NOT NULL,
  `user_phone_2` varchar(20) NOT NULL,
  `address_1` varchar(1000) NOT NULL,
  `address_2` varchar(1000) NOT NULL,
  `full_name` varchar(1000) NOT NULL,
  `time_start` varchar(100) NOT NULL,
  `date_start` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `large_city` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(1000) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `price_one_item` double NOT NULL,
  `total_price` double NOT NULL,
  `Good_time_contact` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `date_end_order` varchar(1000) NOT NULL,
  `state_order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `store_id`, `product_id`, `user_phone_1`, `user_phone_2`, `address_1`, `address_2`, `full_name`, `time_start`, `date_start`, `longitude`, `latitude`, `country`, `large_city`, `city`, `street`, `Quantity`, `price_one_item`, `total_price`, `Good_time_contact`, `active`, `date_end_order`, `state_order`) VALUES
(1, 1, 3, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `photo_product`
--

CREATE TABLE `photo_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `is_main_photo` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `photo_product`
--

INSERT INTO `photo_product` (`id`, `product_id`, `photo`, `is_main_photo`) VALUES
(1, 1, '1.png', 1),
(2, 1, '1.png', 0),
(3, 1, '1.png', 0),
(4, 1, '1.png', 0),
(5, 1, '1.png', 0),
(6, 2, '2.png', 1),
(7, 3, '3.png', 1),
(8, 4, '4.png', 1),
(9, 5, '5.png', 1),
(10, 6, '6.png', 1),
(11, 8, '7.png', 1),
(12, 7, '8.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `catagory_id` int(11) NOT NULL,
  `sub_catagory_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `sub_title` varchar(500) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` varchar(20) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `offer` int(11) NOT NULL DEFAULT 0,
  `Shipping_time` int(11) NOT NULL,
  `if_returnable` int(11) NOT NULL DEFAULT 1,
  `delivery policy` varchar(5000) NOT NULL,
  `lelvel_of_prodect` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `store_id`, `catagory_id`, `sub_catagory_id`, `title`, `sub_title`, `brand`, `price`, `date`, `time`, `is_active`, `offer`, `Shipping_time`, `if_returnable`, `delivery policy`, `lelvel_of_prodect`) VALUES
(1, 3, 1, 1, 'المنتج الاول', 'شرح المنتج الاول', '', '150', '25-5-2022', '', 1, 0, 7, 1, '', 0),
(2, 3, 1, 2, 'المنتج الثانى', 'شرح المنتج الثانى', '', '200', '25-5-2022', '', 1, 0, 7, 1, '', 0),
(3, 3, 1, 1, 'المنتج الثالث', 'شرح المنتج الثالث', '', '250', '25-5-2022', '', 1, 0, 7, 1, '', 0),
(4, 3, 1, 1, 'المنتج الرابع', 'شرح المنتج الرابع', '', '300', '25-5-2022', '', 1, 0, 7, 1, '', 0),
(5, 3, 1, 1, 'المنتج الخامس', 'شرح المنتج الخامس', '', '350', '25-5-2022', '', 1, 0, 7, 1, '', 0),
(6, 3, 1, 1, 'المنتج السادس', 'شرح المنتج السادس', '', '400', '25-5-2022', '', 1, 0, 7, 1, '', 0),
(7, 3, 1, 1, 'المنتج السابع', 'شرح المنتج السابع', '', '500', '25-5-2022', '', 1, 0, 7, 1, '', 0),
(8, 3, 1, 1, 'المنتج الثامن', 'شرح المنتج الثامن', '', '550', '25-5-2022', '', 1, 0, 7, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions_product`
--

CREATE TABLE `questions_product` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `questions` varchar(5000) NOT NULL,
  `answer` varchar(5000) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `active` int(11) NOT NULL,
  `questions_state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `questions_product`
--

INSERT INTO `questions_product` (`id`, `user_id`, `store_id`, `product_id`, `questions`, `answer`, `time`, `date`, `active`, `questions_state`) VALUES
(1, 1, 3, 2, 'السؤال', 'الاجابه', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_prodect`
--

CREATE TABLE `report_prodect` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(1000) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `report_store`
--

CREATE TABLE `report_store` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(1000) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `review_product`
--

CREATE TABLE `review_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `rate` int(11) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `review_product`
--

INSERT INTO `review_product` (`id`, `product_id`, `store_id`, `user_id`, `comment`, `rate`, `answer`, `date`, `time`, `active`) VALUES
(3, 2, 3, 1, 'التعليق الثالث', 2, '', '5-6-2022', '', 1),
(4, 1, 3, 1, 'التعليق 4', 3, '', '5-6-2022', '', 1),
(5, 1, 3, 1, 'التعليق 5', 2, '', '5-6-2022', '', 1),
(6, 1, 3, 1, 'التعليق 6', 2, '', '5-6-2022', '', 1),
(7, 1, 3, 1, 'التعليق 7', 3, '', '5-6-2022', '', 1),
(8, 1, 3, 1, 'التعليق 8', 2, '', '5-6-2022', '', 1),
(9, 1, 3, 1, 'التعليق 9', 2, '', '5-6-2022', '', 1),
(10, 1, 3, 1, 'التعليق 10', 3, '', '5-6-2022', '', 1),
(11, 1, 3, 1, 'التعليق 11', 2, '', '5-6-2022', '', 1),
(12, 1, 3, 1, 'التعليق 12', 2, '', '5-6-2022', '', 1),
(13, 1, 3, 1, 'التعليق 13', 3, '', '5-6-2022', '', 1),
(14, 1, 3, 1, 'التعليق 14', 2, '', '5-6-2022', '', 1),
(15, 1, 3, 1, 'التعليق 15', 2, '', '5-6-2022', '', 1),
(16, 1, 3, 1, 'التعليق 16', 3, '', '5-6-2022', '', 1),
(17, 1, 3, 1, 'التعليق 17', 2, '', '5-6-2022', '', 1),
(18, 1, 3, 1, 'التعليق 18', 2, '', '5-6-2022', '', 1),
(19, 1, 3, 1, 'التعليق 19', 3, '', '5-6-2022', '', 1),
(20, 1, 3, 1, 'التعليق 20', 2, '', '5-6-2022', '', 1),
(21, 1, 3, 1, 'التعليق 21', 2, '', '5-6-2022', '', 1),
(22, 1, 3, 1, 'التعليق 22', 3, '', '5-6-2022', '', 1),
(23, 1, 3, 1, 'التعليق 23', 2, '', '5-6-2022', '', 1),
(24, 1, 3, 1, 'التعليق 24', 2, '', '5-6-2022', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `save_product`
--

CREATE TABLE `save_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `save_product`
--

INSERT INTO `save_product` (`id`, `product_id`, `user_id`, `active`, `time`, `date`) VALUES
(1, 1, 1, 0, '', ''),
(2, 1, 2, 0, '', ''),
(3, 1, 2, 0, '', ''),
(4, 1, 2, 0, '', ''),
(5, 1, 2, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `store_name` varchar(500) NOT NULL,
  `store_photo` varchar(1000) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `information` text NOT NULL,
  `address` varchar(1000) NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL,
  `country` varchar(500) NOT NULL,
  `large_city` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `street` varchar(500) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `time_sing_in` varchar(100) NOT NULL,
  `date_singin` varchar(100) NOT NULL,
  `catagory_store_id` int(11) NOT NULL,
  `return_policy` varchar(10000) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `level_of_store` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `store_name`, `store_photo`, `email`, `phone`, `password`, `information`, `address`, `longitude`, `latitude`, `country`, `large_city`, `city`, `street`, `gender`, `time_sing_in`, `date_singin`, `catagory_store_id`, `return_policy`, `active`, `level_of_store`) VALUES
(3, 'stor_1', '1.png', 's@s.com', '01010', '01010', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 1252658522),
(4, 'stor_2', '1.png', 's2@s2.com', '010102', '010102', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(5, 'stor_3', '1.png', 's3@s3.com', '010103', '010103', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(6, 'stor_4', '1.png', 's4@s4.com', '010104', '010104', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(7, 'stor_5', '1.png', 's5@s5.com', '010105', '010105', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(8, 'stor_6', '1.png', 's6@s6.com', '010106', '010106', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(9, 'stor_7', '1.png', 's7@s7.com', '010107', '010107', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(10, 'stor_8', '1.png', 's8@s8.com', '010108', '010108', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(11, 'stor_9', '1.png', 's9@s9.com', '010109', '010109', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(12, 'stor_10', '1.png', 's10@s10.com', '0101010', '0101010', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(13, 'stor_11', '1.png', 's11@s11.com', '0101011', '0101011', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(14, 'stor_12', '1.png', 's12@s12.com', '0101012', '0101012', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(15, 'stor_13', '1.png', 's13@s13.com', '0101013', '0101013', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(16, 'stor_14', '1.png', 's14@s14.com', '0101014', '0101014', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(17, 'stor_15', '1.png', 's15@s15.com', '0101015', '0101015', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(18, 'stor_16', '1.png', 's16@s16.com', '0101016', '0101016', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(19, 'stor_17', '1.png', 's17@s17.com', '0101017', '0101017', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(20, 'stor_18', '1.png', 's18@s18.com', '0101018', '0101018', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(21, 'stor_19', '1.png', 's19@s19.com', '0101019', '0101019', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(22, 'stor_20', '1.png', 's20@s20.com', '0101020', '0101020', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(23, 'stor_21', '1.png', 's21@s21.com', '0101021', '0101021', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1, 0),
(24, 'stor_22', '1.png', 's22@s22.com', '0101022', '0101022', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 2, '', 1, 0),
(25, 'stor_23', '1.png', 's23@s23.com', '0101023', '0101023', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 2, '', 1, 0),
(26, 'stor_24', '1.png', 's24@s24.com', '0101024', '0101024', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 2, '', 1, 0),
(27, 'stor_25', '1.png', 's25@s25.com', '0101025', '0101025', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 3, '', 1, 0),
(28, 'stor_26', '1.png', 's26@s26.com', '0101026', '0101026', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 4, '', 1, 0),
(29, 'stor_27', '1.png', 's27@s27.com', '0101027', '0101027', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 5, '', 1, 0),
(30, 'stor_28', '1.png', 's28@s28.com', '0101028', '0101028', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 5, '', 1, 0),
(31, 'stor_29', '1.png', 's29@s29.com', '0101029', '0101029', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 6, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_catagory`
--

CREATE TABLE `sub_catagory` (
  `id` int(11) NOT NULL,
  `catagory_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `photo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `sub_catagory`
--

INSERT INTO `sub_catagory` (`id`, `catagory_id`, `title`, `photo`) VALUES
(1, 1, 'اجهزة التلفاز', 'Tshirt.svg'),
(2, 1, 'اجهزة المسموعات المنزلية والمسرح', 'Tshirt.svg'),
(3, 1, 'كاميرات التصوير', 'Tshirt.svg'),
(5, 1, 'ألعاب الفيديو', 'Tshirt.svg'),
(6, 1, 'اجهزة الصوت ', 'Tshirt.svg'),
(7, 1, 'اكترونيات السيارات', 'Tshirt.svg'),
(8, 1, 'اكسسوارات الاكترونيات', 'Tshirt.svg'),
(9, 1, 'اجهزة يمكن ارتدواءها', 'Tshirt.svg'),
(10, 1, 'كمبيوتر محمول', 'Tshirt.svg'),
(11, 1, 'اجهزة الكمبيوتر ', 'Tshirt.svg'),
(12, 1, 'البرامج', 'Tshirt.svg'),
(13, 1, 'الطابعات والحبر', 'Tshirt.svg'),
(14, 1, 'اللوازم المدرسية والمكتبية', 'Tshirt.svg'),
(20, 1, 'الهواتف', 'Tshirt.svg'),
(39, 3, 'الأغذية', 'Tshirt.svg'),
(40, 3, 'المشروبات', 'Tshirt.svg'),
(41, 3, 'العناية المنزلية', 'Tshirt.svg'),
(42, 3, 'العناية الشخصية', 'Tshirt.svg'),
(43, 3, 'العناية بالجمال', 'Tshirt.svg'),
(44, 3, 'منتجات الأطفال', 'Tshirt.svg'),
(45, 3, 'أدوات وتحسينات المنزل', 'Tshirt.svg'),
(58, 4, 'أطفال', 'Tshirt.svg'),
(59, 4, 'رجال', 'Tshirt.svg'),
(60, 4, 'زيوت معطرة', 'Tshirt.svg'),
(61, 4, 'نساء', 'Tshirt.svg'),
(62, 4, 'Avon', 'Tshirt.svg'),
(63, 4, 'Oriflame', 'Tshirt.svg'),
(64, 4, 'Bath & Body Works', 'Tshirt.svg'),
(65, 4, 'My Way', 'Tshirt.svg'),
(66, 4, 'VICTORIA\'S SECRET', 'Tshirt.svg'),
(67, 4, 'Lattafa', 'Tshirt.svg'),
(68, 4, 'Paco Rabanne', 'Tshirt.svg'),
(77, 5, 'النساء', 'Tshirt.svg'),
(78, 5, 'رجال', 'Tshirt.svg'),
(79, 5, 'الفتيات', 'Tshirt.svg'),
(80, 5, 'طفل', 'Tshirt.svg'),
(81, 5, 'امتعة', 'Tshirt.svg'),
(82, 5, 'ملابس تنكرية للنساء', 'Tshirt.svg'),
(83, 5, 'ملابس تنكرية للرجال', 'Tshirt.svg'),
(84, 5, 'ملابس تنكرية للاطفال', 'Tshirt.svg'),
(96, 6, 'الساعات النسائية', 'Tshirt.svg'),
(97, 6, 'الساعات الرجالية', 'Tshirt.svg'),
(98, 6, 'ساعات الاطفال', 'Tshirt.svg'),
(99, 6, 'ساعات فخمة للرجال', 'Tshirt.svg'),
(115, 7, 'المنزل والمطبخ', 'Tshirt.svg'),
(116, 7, 'اجهزة صغيرة', 'Tshirt.svg'),
(117, 7, 'أفران سطح الطاولة', 'Tshirt.svg'),
(118, 7, 'الميكرويف', 'Tshirt.svg'),
(119, 7, 'أفران و مواقد', 'Tshirt.svg'),
(120, 7, 'التدفئة والتبريد', 'Tshirt.svg'),
(121, 7, 'القمامة والسماد وإعادة التدوير', 'Tshirt.svg'),
(122, 7, 'غسالات ومجففات', 'Tshirt.svg'),
(123, 7, 'غسالات ومجففات الصحون', 'Tshirt.svg'),
(124, 7, 'قطع غيار واكسسوارات', 'Tshirt.svg'),
(125, 7, 'مجمدات وثلاجات', 'Tshirt.svg'),
(126, 7, 'الأجهزة الكهربائية', 'Tshirt.svg'),
(127, 7, 'ديكور', 'Tshirt.svg'),
(128, 7, 'طقم الأسرّة', 'Tshirt.svg'),
(129, 7, 'لوازم المنزلية', 'Tshirt.svg'),
(134, 8, 'أدوات المطبخ', 'Tshirt.svg'),
(135, 8, 'أدوات كهربائية', 'Tshirt.svg'),
(136, 8, 'أطقم المطبخ', 'Tshirt.svg'),
(137, 8, 'الأدوات البلاستيكية', 'Tshirt.svg'),
(138, 8, 'رفايع المطبخ', 'Tshirt.svg'),
(139, 8, 'أواني الطهي', 'Tshirt.svg'),
(140, 8, 'زجاجات وبرطمانات', 'Tshirt.svg'),
(153, 9, 'تحف وألعاب للاطفال', 'Tshirt.svg'),
(154, 9, 'اطفال صغار', 'Tshirt.svg'),
(155, 9, 'العاب الفيديو للاطفال', 'Tshirt.svg'),
(156, 9, 'الام ', 'Tshirt.svg'),
(157, 9, 'اعياد ميلاد', 'Tshirt.svg'),
(158, 9, 'للبنات', 'Tshirt.svg'),
(159, 9, 'للاولاد', 'Tshirt.svg'),
(160, 9, 'للاطفال الصغار جدا', 'Tshirt.svg'),
(161, 9, 'أحجيات', 'Tshirt.svg'),
(162, 9, 'الآلات الموسيقية', 'Tshirt.svg'),
(163, 9, 'التعلم والتعليم', 'Tshirt.svg'),
(164, 9, 'الدمى وإكسسواراتها', 'Tshirt.svg'),
(165, 9, 'ألعاب جهاز التحكم', 'Tshirt.svg'),
(166, 9, 'ألعاب مبتكرة', 'Tshirt.svg'),
(167, 9, 'ألعاب محشوة', 'Tshirt.svg'),
(168, 9, 'الفنون والحرف', 'Tshirt.svg'),
(169, 9, 'إلكترونيات الأطفال', 'Tshirt.svg'),
(170, 9, 'المركبات', 'Tshirt.svg'),
(171, 9, 'مجسمات اللعب', 'Tshirt.svg'),
(172, 10, 'الكتب', 'Tshirt.svg'),
(173, 10, 'كتب الاطفال', 'Tshirt.svg'),
(174, 10, 'كتب نصية', 'Tshirt.svg'),
(175, 10, 'مجلات', 'Tshirt.svg'),
(176, 10, 'المسموعة', 'Tshirt.svg'),
(177, 10, 'السير الذاتية والمذكرات', 'Tshirt.svg'),
(178, 10, 'الرياضة والأنشطة الخارجية', 'Tshirt.svg'),
(179, 10, 'الفنون والآداب', 'Tshirt.svg'),
(180, 10, 'المسافرون والمستكشفون', 'Tshirt.svg'),
(181, 10, 'المهنيين والأكاديميين', 'Tshirt.svg'),
(182, 10, 'تاريخي', 'Tshirt.svg'),
(183, 10, 'جرائم حقيقية', 'Tshirt.svg'),
(184, 10, 'قادة وشخصيات بارزة', 'Tshirt.svg'),
(185, 10, 'مرجع', 'Tshirt.svg'),
(186, 10, 'الهندسة والنقل', 'Tshirt.svg'),
(187, 10, 'القانون', 'Tshirt.svg'),
(188, 10, 'الفنون والتصوير', 'Tshirt.svg'),
(189, 10, 'الفكاهة', 'Tshirt.svg'),
(190, 10, 'الغموض والإثارة والتشويق', 'Tshirt.svg'),
(191, 11, 'منتجات الحمام والجسم', 'Tshirt.svg'),
(192, 11, 'عطور وروائح', 'Tshirt.svg'),
(193, 11, 'العناية بالشعر', 'Tshirt.svg'),
(194, 11, 'مكياج', 'Tshirt.svg'),
(195, 11, 'منتجات المنكير والبدكير', 'Tshirt.svg'),
(196, 11, 'معدات الصالون والمنتجع', 'Tshirt.svg'),
(197, 11, 'منتجات الحلاقة وإزالة الشعر', 'Tshirt.svg'),
(198, 11, 'منتجات العناية بالبشرة', 'Tshirt.svg'),
(199, 11, 'إكسسوارات وأدوات التجميل', 'Tshirt.svg'),
(210, 12, 'الأدوية والعلاجات', 'Tshirt.svg'),
(211, 12, 'الصحة', 'Tshirt.svg'),
(212, 12, 'الطفل والعناية بالطفل', 'Tshirt.svg'),
(213, 12, 'العناية البصرية', 'Tshirt.svg'),
(214, 12, 'العناية المنزلية والتنظيف', 'Tshirt.svg'),
(215, 12, 'العناية بالأسنان', 'Tshirt.svg'),
(216, 12, 'الفيتامينات والمعادن', 'Tshirt.svg'),
(217, 12, 'المكملات الغذائية', 'Tshirt.svg'),
(218, 12, 'اللوازم والمعدات الطبية', 'Tshirt.svg'),
(219, 12, 'النظام الغذائي والتغذية', 'Tshirt.svg'),
(220, 12, 'ملحقات التدخين', 'Tshirt.svg'),
(221, 12, 'نظافة المناطق الحساسة', 'Tshirt.svg'),
(222, 5, 'الحقائب', 'Tshirt.svg'),
(223, 12, 'sub_15', 'Tshirt.svg'),
(224, 12, 'sub_16', 'Tshirt.svg'),
(225, 12, 'sub_17', 'Tshirt.svg'),
(226, 12, 'sub_18', 'Tshirt.svg'),
(227, 12, 'sub_19', 'Tshirt.svg'),
(228, 12, 'sub_20', 'Tshirt.svg'),
(267, 15, 'sub_1', 'Tshirt.svg'),
(268, 15, 'sub_2', 'Tshirt.svg'),
(269, 15, 'sub_4', 'Tshirt.svg'),
(270, 15, 'sub_5', 'Tshirt.svg'),
(271, 15, 'sub_6', 'Tshirt.svg'),
(272, 15, 'sub_7', 'Tshirt.svg'),
(273, 15, 'sub_8', 'Tshirt.svg'),
(274, 15, 'sub_9', 'Tshirt.svg'),
(275, 15, 'sub_10', 'Tshirt.svg'),
(276, 15, 'sub_11', 'Tshirt.svg'),
(277, 15, 'sub_12', 'Tshirt.svg'),
(278, 15, 'sub_13', 'Tshirt.svg'),
(279, 15, 'sub_14', 'Tshirt.svg'),
(280, 15, 'sub_15', 'Tshirt.svg'),
(281, 15, 'sub_16', 'Tshirt.svg'),
(282, 15, 'sub_17', 'Tshirt.svg'),
(283, 15, 'sub_18', 'Tshirt.svg'),
(284, 15, 'sub_19', 'Tshirt.svg'),
(285, 15, 'sub_20', 'Tshirt.svg'),
(286, 16, 'sub_1', 'Tshirt.svg'),
(287, 16, 'sub_2', 'Tshirt.svg'),
(288, 16, 'sub_4', 'Tshirt.svg'),
(289, 16, 'sub_5', 'Tshirt.svg'),
(290, 16, 'sub_6', 'Tshirt.svg'),
(291, 16, 'sub_7', 'Tshirt.svg'),
(292, 16, 'sub_8', 'Tshirt.svg'),
(293, 16, 'sub_9', 'Tshirt.svg'),
(294, 16, 'sub_10', 'Tshirt.svg'),
(295, 16, 'sub_11', 'Tshirt.svg'),
(296, 16, 'sub_12', 'Tshirt.svg'),
(297, 16, 'sub_13', 'Tshirt.svg'),
(298, 16, 'sub_14', 'Tshirt.svg'),
(299, 16, 'sub_15', 'Tshirt.svg'),
(300, 16, 'sub_16', 'Tshirt.svg'),
(301, 16, 'sub_17', 'Tshirt.svg'),
(302, 16, 'sub_18', 'Tshirt.svg'),
(303, 16, 'sub_19', 'Tshirt.svg'),
(304, 16, 'sub_20', 'Tshirt.svg'),
(305, 17, 'sub_1', 'Tshirt.svg'),
(306, 17, 'sub_2', 'Tshirt.svg'),
(307, 17, 'sub_4', 'Tshirt.svg'),
(308, 17, 'sub_5', 'Tshirt.svg'),
(309, 17, 'sub_6', 'Tshirt.svg'),
(310, 17, 'sub_7', 'Tshirt.svg'),
(311, 17, 'sub_8', 'Tshirt.svg'),
(312, 17, 'sub_9', 'Tshirt.svg'),
(313, 17, 'sub_10', 'Tshirt.svg'),
(314, 17, 'sub_11', 'Tshirt.svg'),
(315, 17, 'sub_12', 'Tshirt.svg'),
(316, 17, 'sub_13', 'Tshirt.svg'),
(317, 17, 'sub_14', 'Tshirt.svg'),
(318, 17, 'sub_15', 'Tshirt.svg'),
(319, 17, 'sub_16', 'Tshirt.svg'),
(320, 17, 'sub_17', 'Tshirt.svg'),
(321, 17, 'sub_18', 'Tshirt.svg'),
(322, 17, 'sub_19', 'Tshirt.svg'),
(323, 17, 'sub_20', 'Tshirt.svg'),
(324, 18, 'sub_1', 'Tshirt.svg'),
(325, 18, 'sub_2', 'Tshirt.svg'),
(326, 18, 'sub_4', 'Tshirt.svg'),
(327, 18, 'sub_5', 'Tshirt.svg'),
(328, 18, 'sub_6', 'Tshirt.svg'),
(329, 18, 'sub_7', 'Tshirt.svg'),
(330, 18, 'sub_8', 'Tshirt.svg'),
(331, 18, 'sub_9', 'Tshirt.svg'),
(332, 18, 'sub_10', 'Tshirt.svg'),
(333, 18, 'sub_11', 'Tshirt.svg'),
(334, 18, 'sub_12', 'Tshirt.svg'),
(335, 18, 'sub_13', 'Tshirt.svg'),
(336, 18, 'sub_14', 'Tshirt.svg'),
(337, 18, 'sub_15', 'Tshirt.svg'),
(338, 18, 'sub_16', 'Tshirt.svg'),
(339, 18, 'sub_17', 'Tshirt.svg'),
(340, 18, 'sub_18', 'Tshirt.svg'),
(341, 18, 'sub_19', 'Tshirt.svg'),
(342, 18, 'sub_20', 'Tshirt.svg');

-- --------------------------------------------------------

--
-- Table structure for table `sub_catagory_visit`
--

CREATE TABLE `sub_catagory_visit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sub_catagory_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `full_name` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `location_lang` varchar(1000) NOT NULL,
  `location_lat` varchar(1000) NOT NULL,
  `country` varchar(500) NOT NULL,
  `large_city` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `street` varchar(500) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `time_sing_in` varchar(100) NOT NULL,
  `date_singin` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `full_name`, `phone`, `email`, `password`, `adress`, `location_lang`, `location_lat`, `country`, `large_city`, `city`, `street`, `gender`, `time_sing_in`, `date_singin`, `active`) VALUES
(1, 'alaa samy', 'alaa samy', '01010893661', 'a@a.com', '1234', '', '', '', '', '', '', '', '', '', '', 1),
(2, 'amr samy', 'amr samy', '01010893662', 'amr@a.com', '1234', '', '', '', '', '', '', '', '', '', '', 1),
(3, 'ahmed samy', 'ahmed samy', '01010893663', 'ahmed@a.com', '1234', '', '', '', '', '', '', '', '', '', '', 1),
(4, 'amr samy', 'alaa 2 samy', '01010893665', 'amr2@a.com', '1234', '', '', '', '', '', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `visit_product`
--

CREATE TABLE `visit_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `visit_store`
--

CREATE TABLE `visit_store` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catagory_visit`
--
ALTER TABLE `catagory_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagory_id` (`catagory_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `comment_store`
--
ALTER TABLE `comment_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `description_product`
--
ALTER TABLE `description_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`store_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `information_product`
--
ALTER TABLE `information_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `like_product`
--
ALTER TABLE `like_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id_2` (`product_id`,`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login_time_location`
--
ALTER TABLE `login_time_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `offer_product`
--
ALTER TABLE `offer_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `photo_product`
--
ALTER TABLE `photo_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagory_id` (`catagory_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `sub_catagory_id` (`sub_catagory_id`);

--
-- Indexes for table `questions_product`
--
ALTER TABLE `questions_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `report_prodect`
--
ALTER TABLE `report_prodect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `report_store`
--
ALTER TABLE `report_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `review_product`
--
ALTER TABLE `review_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `save_product`
--
ALTER TABLE `save_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagory_store_id` (`catagory_store_id`);

--
-- Indexes for table `sub_catagory`
--
ALTER TABLE `sub_catagory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagory_id` (`catagory_id`);

--
-- Indexes for table `sub_catagory_visit`
--
ALTER TABLE `sub_catagory_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_catagory_id` (`sub_catagory_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visit_product`
--
ALTER TABLE `visit_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `visit_store`
--
ALTER TABLE `visit_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `catagory_visit`
--
ALTER TABLE `catagory_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `comment_store`
--
ALTER TABLE `comment_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `description_product`
--
ALTER TABLE `description_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `information_product`
--
ALTER TABLE `information_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `like_product`
--
ALTER TABLE `like_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_time_location`
--
ALTER TABLE `login_time_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_product`
--
ALTER TABLE `offer_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `photo_product`
--
ALTER TABLE `photo_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `questions_product`
--
ALTER TABLE `questions_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `report_prodect`
--
ALTER TABLE `report_prodect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_store`
--
ALTER TABLE `report_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_product`
--
ALTER TABLE `review_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `save_product`
--
ALTER TABLE `save_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sub_catagory`
--
ALTER TABLE `sub_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;

--
-- AUTO_INCREMENT for table `sub_catagory_visit`
--
ALTER TABLE `sub_catagory_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `visit_product`
--
ALTER TABLE `visit_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `visit_store`
--
ALTER TABLE `visit_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catagory_visit`
--
ALTER TABLE `catagory_visit`
  ADD CONSTRAINT `catagory_visit_ibfk_1` FOREIGN KEY (`catagory_id`) REFERENCES `catagory` (`id`),
  ADD CONSTRAINT `catagory_visit_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_store`
--
ALTER TABLE `comment_store`
  ADD CONSTRAINT `comment_store_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `comment_store_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `description_product`
--
ALTER TABLE `description_product`
  ADD CONSTRAINT `description_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `information_product`
--
ALTER TABLE `information_product`
  ADD CONSTRAINT `information_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `like_product`
--
ALTER TABLE `like_product`
  ADD CONSTRAINT `like_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `like_product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `login_time_location`
--
ALTER TABLE `login_time_location`
  ADD CONSTRAINT `login_time_location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `offer_product`
--
ALTER TABLE `offer_product`
  ADD CONSTRAINT `offer_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `photo_product`
--
ALTER TABLE `photo_product`
  ADD CONSTRAINT `photo_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catagory_id`) REFERENCES `catagory` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`sub_catagory_id`) REFERENCES `sub_catagory` (`id`);

--
-- Constraints for table `questions_product`
--
ALTER TABLE `questions_product`
  ADD CONSTRAINT `questions_product_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `questions_product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `questions_product_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `report_prodect`
--
ALTER TABLE `report_prodect`
  ADD CONSTRAINT `report_prodect_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `report_prodect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `report_store`
--
ALTER TABLE `report_store`
  ADD CONSTRAINT `report_store_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `report_store_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `review_product`
--
ALTER TABLE `review_product`
  ADD CONSTRAINT `review_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `review_product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `review_product_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`);

--
-- Constraints for table `save_product`
--
ALTER TABLE `save_product`
  ADD CONSTRAINT `save_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `save_product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`catagory_store_id`) REFERENCES `catagory` (`id`);

--
-- Constraints for table `sub_catagory`
--
ALTER TABLE `sub_catagory`
  ADD CONSTRAINT `sub_catagory_ibfk_1` FOREIGN KEY (`catagory_id`) REFERENCES `catagory` (`id`);

--
-- Constraints for table `sub_catagory_visit`
--
ALTER TABLE `sub_catagory_visit`
  ADD CONSTRAINT `sub_catagory_visit_ibfk_1` FOREIGN KEY (`sub_catagory_id`) REFERENCES `sub_catagory` (`id`),
  ADD CONSTRAINT `sub_catagory_visit_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `visit_product`
--
ALTER TABLE `visit_product`
  ADD CONSTRAINT `visit_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `visit_product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `visit_store`
--
ALTER TABLE `visit_store`
  ADD CONSTRAINT `visit_store_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `visit_store_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
