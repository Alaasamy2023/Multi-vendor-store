-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2022 at 01:24 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

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
(2, 'الموبيلات', 'dress.svg', 1),
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
(13, 'الحقائب', 'dress.svg', 1),
(14, 'مستلزمات الاطفال', 'dress.svg', 1),
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
(1, 1, 3, '', '', 1),
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
(1, 1, 1, 0, '', '');

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
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `offer_product`
--

INSERT INTO `offer_product` (`id`, `product_id`, `price_offer`, `date_star`, `time_star`, `date_end`, `time_end`, `title`, `description`, `active`) VALUES
(2, 1, '5', '5-10-2022', '', '6-10-2020', '', '', '', 1);

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
  `Shipping_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `store_id`, `catagory_id`, `sub_catagory_id`, `title`, `sub_title`, `brand`, `price`, `date`, `time`, `is_active`, `offer`, `Shipping_time`) VALUES
(1, 3, 1, 1, 'المنتج الاول', 'شرح المنتج الاول', '', '150', '25-5-2022', '', 1, 0, 7),
(2, 3, 1, 2, 'المنتج الثانى', 'شرح المنتج الثانى', '', '200', '25-5-2022', '', 1, 0, 7),
(3, 3, 1, 1, 'المنتج الثالث', 'شرح المنتج الثالث', '', '250', '25-5-2022', '', 1, 0, 7),
(4, 3, 1, 1, 'المنتج الرابع', 'شرح المنتج الرابع', '', '300', '25-5-2022', '', 1, 0, 7),
(5, 3, 1, 1, 'المنتج الخامس', 'شرح المنتج الخامس', '', '350', '25-5-2022', '', 1, 0, 7),
(6, 3, 1, 1, 'المنتج السادس', 'شرح المنتج السادس', '', '400', '25-5-2022', '', 1, 0, 7),
(7, 3, 1, 1, 'المنتج السابع', 'شرح المنتج السابع', '', '500', '25-5-2022', '', 1, 0, 7),
(8, 3, 1, 1, 'المنتج الثامن', 'شرح المنتج الثامن', '', '550', '25-5-2022', '', 1, 0, 7);

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
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `review_product`
--

INSERT INTO `review_product` (`id`, `product_id`, `store_id`, `user_id`, `comment`, `rate`, `date`, `time`, `active`) VALUES
(1, 1, 3, 1, 'التعليق الاول ', 3, '5-6-2022', '', 1),
(2, 1, 3, 1, 'التعليق الثانى ', 2, '5-6-2022', '', 1),
(3, 1, 3, 1, 'التعليق الثالث', 2, '5-6-2022', '', 1),
(4, 1, 3, 1, 'التعليق 4', 3, '5-6-2022', '', 1),
(5, 1, 3, 1, 'التعليق 5', 2, '5-6-2022', '', 1),
(6, 1, 3, 1, 'التعليق 6', 2, '5-6-2022', '', 1),
(7, 1, 3, 1, 'التعليق 7', 3, '5-6-2022', '', 1),
(8, 1, 3, 1, 'التعليق 8', 2, '5-6-2022', '', 1),
(9, 1, 3, 1, 'التعليق 9', 2, '5-6-2022', '', 1),
(10, 1, 3, 1, 'التعليق 10', 3, '5-6-2022', '', 1),
(11, 1, 3, 1, 'التعليق 11', 2, '5-6-2022', '', 1),
(12, 1, 3, 1, 'التعليق 12', 2, '5-6-2022', '', 1),
(13, 1, 3, 1, 'التعليق 13', 3, '5-6-2022', '', 1),
(14, 1, 3, 1, 'التعليق 14', 2, '5-6-2022', '', 1),
(15, 1, 3, 1, 'التعليق 15', 2, '5-6-2022', '', 1),
(16, 1, 3, 1, 'التعليق 16', 3, '5-6-2022', '', 1),
(17, 1, 3, 1, 'التعليق 17', 2, '5-6-2022', '', 1),
(18, 1, 3, 1, 'التعليق 18', 2, '5-6-2022', '', 1),
(19, 1, 3, 1, 'التعليق 19', 3, '5-6-2022', '', 1),
(20, 1, 3, 1, 'التعليق 20', 2, '5-6-2022', '', 1),
(21, 1, 3, 1, 'التعليق 21', 2, '5-6-2022', '', 1),
(22, 1, 3, 1, 'التعليق 22', 3, '5-6-2022', '', 1),
(23, 1, 3, 1, 'التعليق 23', 2, '5-6-2022', '', 1),
(24, 1, 3, 1, 'التعليق 24', 2, '5-6-2022', '', 1);

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
(1, 1, 1, 0, '', '');

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
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `store_name`, `store_photo`, `email`, `phone`, `password`, `information`, `address`, `longitude`, `latitude`, `country`, `large_city`, `city`, `street`, `gender`, `time_sing_in`, `date_singin`, `catagory_store_id`, `return_policy`, `active`) VALUES
(3, 'stor_1', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's@s.com', '01010', '01010', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(4, 'stor_2', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's2@s2.com', '010102', '010102', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(5, 'stor_3', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's3@s3.com', '010103', '010103', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(6, 'stor_4', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's4@s4.com', '010104', '010104', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(7, 'stor_5', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's5@s5.com', '010105', '010105', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(8, 'stor_6', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's6@s6.com', '010106', '010106', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(9, 'stor_7', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's7@s7.com', '010107', '010107', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(10, 'stor_8', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's8@s8.com', '010108', '010108', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(11, 'stor_9', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's9@s9.com', '010109', '010109', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(12, 'stor_10', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's10@s10.com', '0101010', '0101010', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(13, 'stor_11', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's11@s11.com', '0101011', '0101011', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(14, 'stor_12', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's12@s12.com', '0101012', '0101012', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(15, 'stor_13', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's13@s13.com', '0101013', '0101013', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(16, 'stor_14', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's14@s14.com', '0101014', '0101014', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(17, 'stor_15', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's15@s15.com', '0101015', '0101015', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(18, 'stor_16', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's16@s16.com', '0101016', '0101016', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(19, 'stor_17', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's17@s17.com', '0101017', '0101017', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(20, 'stor_18', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's18@s18.com', '0101018', '0101018', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(21, 'stor_19', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's19@s19.com', '0101019', '0101019', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(22, 'stor_20', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's20@s20.com', '0101020', '0101020', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(23, 'stor_21', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's21@s21.com', '0101021', '0101021', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 1, '', 1),
(24, 'stor_22', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's22@s22.com', '0101022', '0101022', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 2, '', 1),
(25, 'stor_23', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's23@s23.com', '0101023', '0101023', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 2, '', 1),
(26, 'stor_24', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's24@s24.com', '0101024', '0101024', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 2, '', 1),
(27, 'stor_25', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's25@s25.com', '0101025', '0101025', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 3, '', 1),
(28, 'stor_26', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's26@s26.com', '0101026', '0101026', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 4, '', 1),
(29, 'stor_27', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's27@s27.com', '0101027', '0101027', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 5, '', 1),
(30, 'stor_28', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's28@s28.com', '0101028', '0101028', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 5, '', 1),
(31, 'stor_29', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=600', 's29@s29.com', '0101029', '0101029', 'هنا معلومات عن المتجر ', '', '', '', '', '', '', '', '', '', '', 6, '', 1);

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
(1, 1, 'sub_1', 'Tshirt.svg'),
(2, 1, 'sub_2', 'Tshirt.svg'),
(3, 1, 'sub_4', 'Tshirt.svg'),
(4, 1, 'sub_5', 'Tshirt.svg'),
(5, 1, 'sub_6', 'Tshirt.svg'),
(6, 1, 'sub_7', 'Tshirt.svg'),
(7, 1, 'sub_8', 'Tshirt.svg'),
(8, 1, 'sub_9', 'Tshirt.svg'),
(9, 1, 'sub_10', 'Tshirt.svg'),
(10, 1, 'sub_11', 'Tshirt.svg'),
(11, 1, 'sub_12', 'Tshirt.svg'),
(12, 1, 'sub_13', 'Tshirt.svg'),
(13, 1, 'sub_14', 'Tshirt.svg'),
(14, 1, 'sub_15', 'Tshirt.svg'),
(15, 1, 'sub_16', 'Tshirt.svg'),
(16, 1, 'sub_17', 'Tshirt.svg'),
(17, 1, 'sub_18', 'Tshirt.svg'),
(18, 1, 'sub_19', 'Tshirt.svg'),
(19, 1, 'sub_20', 'Tshirt.svg'),
(20, 2, 'sub_1', 'Tshirt.svg'),
(21, 2, 'sub_2', 'Tshirt.svg'),
(22, 2, 'sub_4', 'Tshirt.svg'),
(23, 2, 'sub_5', 'Tshirt.svg'),
(24, 2, 'sub_6', 'Tshirt.svg'),
(25, 2, 'sub_7', 'Tshirt.svg'),
(26, 2, 'sub_8', 'Tshirt.svg'),
(27, 2, 'sub_9', 'Tshirt.svg'),
(28, 2, 'sub_10', 'Tshirt.svg'),
(29, 2, 'sub_11', 'Tshirt.svg'),
(30, 2, 'sub_12', 'Tshirt.svg'),
(31, 2, 'sub_13', 'Tshirt.svg'),
(32, 2, 'sub_14', 'Tshirt.svg'),
(33, 2, 'sub_15', 'Tshirt.svg'),
(34, 2, 'sub_16', 'Tshirt.svg'),
(35, 2, 'sub_17', 'Tshirt.svg'),
(36, 2, 'sub_18', 'Tshirt.svg'),
(37, 2, 'sub_19', 'Tshirt.svg'),
(38, 2, 'sub_20', 'Tshirt.svg'),
(39, 3, 'sub_1', 'Tshirt.svg'),
(40, 3, 'sub_2', 'Tshirt.svg'),
(41, 3, 'sub_4', 'Tshirt.svg'),
(42, 3, 'sub_5', 'Tshirt.svg'),
(43, 3, 'sub_6', 'Tshirt.svg'),
(44, 3, 'sub_7', 'Tshirt.svg'),
(45, 3, 'sub_8', 'Tshirt.svg'),
(46, 3, 'sub_9', 'Tshirt.svg'),
(47, 3, 'sub_10', 'Tshirt.svg'),
(48, 3, 'sub_11', 'Tshirt.svg'),
(49, 3, 'sub_12', 'Tshirt.svg'),
(50, 3, 'sub_13', 'Tshirt.svg'),
(51, 3, 'sub_14', 'Tshirt.svg'),
(52, 3, 'sub_15', 'Tshirt.svg'),
(53, 3, 'sub_16', 'Tshirt.svg'),
(54, 3, 'sub_17', 'Tshirt.svg'),
(55, 3, 'sub_18', 'Tshirt.svg'),
(56, 3, 'sub_19', 'Tshirt.svg'),
(57, 3, 'sub_20', 'Tshirt.svg'),
(58, 4, 'sub_1', 'Tshirt.svg'),
(59, 4, 'sub_2', 'Tshirt.svg'),
(60, 4, 'sub_4', 'Tshirt.svg'),
(61, 4, 'sub_5', 'Tshirt.svg'),
(62, 4, 'sub_6', 'Tshirt.svg'),
(63, 4, 'sub_7', 'Tshirt.svg'),
(64, 4, 'sub_8', 'Tshirt.svg'),
(65, 4, 'sub_9', 'Tshirt.svg'),
(66, 4, 'sub_10', 'Tshirt.svg'),
(67, 4, 'sub_11', 'Tshirt.svg'),
(68, 4, 'sub_12', 'Tshirt.svg'),
(69, 4, 'sub_13', 'Tshirt.svg'),
(70, 4, 'sub_14', 'Tshirt.svg'),
(71, 4, 'sub_15', 'Tshirt.svg'),
(72, 4, 'sub_16', 'Tshirt.svg'),
(73, 4, 'sub_17', 'Tshirt.svg'),
(74, 4, 'sub_18', 'Tshirt.svg'),
(75, 4, 'sub_19', 'Tshirt.svg'),
(76, 4, 'sub_20', 'Tshirt.svg'),
(77, 5, 'sub_1', 'Tshirt.svg'),
(78, 5, 'sub_2', 'Tshirt.svg'),
(79, 5, 'sub_4', 'Tshirt.svg'),
(80, 5, 'sub_5', 'Tshirt.svg'),
(81, 5, 'sub_6', 'Tshirt.svg'),
(82, 5, 'sub_7', 'Tshirt.svg'),
(83, 5, 'sub_8', 'Tshirt.svg'),
(84, 5, 'sub_9', 'Tshirt.svg'),
(85, 5, 'sub_10', 'Tshirt.svg'),
(86, 5, 'sub_11', 'Tshirt.svg'),
(87, 5, 'sub_12', 'Tshirt.svg'),
(88, 5, 'sub_13', 'Tshirt.svg'),
(89, 5, 'sub_14', 'Tshirt.svg'),
(90, 5, 'sub_15', 'Tshirt.svg'),
(91, 5, 'sub_16', 'Tshirt.svg'),
(92, 5, 'sub_17', 'Tshirt.svg'),
(93, 5, 'sub_18', 'Tshirt.svg'),
(94, 5, 'sub_19', 'Tshirt.svg'),
(95, 5, 'sub_20', 'Tshirt.svg'),
(96, 6, 'sub_1', 'Tshirt.svg'),
(97, 6, 'sub_2', 'Tshirt.svg'),
(98, 6, 'sub_4', 'Tshirt.svg'),
(99, 6, 'sub_5', 'Tshirt.svg'),
(100, 6, 'sub_6', 'Tshirt.svg'),
(101, 6, 'sub_7', 'Tshirt.svg'),
(102, 6, 'sub_8', 'Tshirt.svg'),
(103, 6, 'sub_9', 'Tshirt.svg'),
(104, 6, 'sub_10', 'Tshirt.svg'),
(105, 6, 'sub_11', 'Tshirt.svg'),
(106, 6, 'sub_12', 'Tshirt.svg'),
(107, 6, 'sub_13', 'Tshirt.svg'),
(108, 6, 'sub_14', 'Tshirt.svg'),
(109, 6, 'sub_15', 'Tshirt.svg'),
(110, 6, 'sub_16', 'Tshirt.svg'),
(111, 6, 'sub_17', 'Tshirt.svg'),
(112, 6, 'sub_18', 'Tshirt.svg'),
(113, 6, 'sub_19', 'Tshirt.svg'),
(114, 6, 'sub_20', 'Tshirt.svg'),
(115, 7, 'sub_1', 'Tshirt.svg'),
(116, 7, 'sub_2', 'Tshirt.svg'),
(117, 7, 'sub_4', 'Tshirt.svg'),
(118, 7, 'sub_5', 'Tshirt.svg'),
(119, 7, 'sub_6', 'Tshirt.svg'),
(120, 7, 'sub_7', 'Tshirt.svg'),
(121, 7, 'sub_8', 'Tshirt.svg'),
(122, 7, 'sub_9', 'Tshirt.svg'),
(123, 7, 'sub_10', 'Tshirt.svg'),
(124, 7, 'sub_11', 'Tshirt.svg'),
(125, 7, 'sub_12', 'Tshirt.svg'),
(126, 7, 'sub_13', 'Tshirt.svg'),
(127, 7, 'sub_14', 'Tshirt.svg'),
(128, 7, 'sub_15', 'Tshirt.svg'),
(129, 7, 'sub_16', 'Tshirt.svg'),
(130, 7, 'sub_17', 'Tshirt.svg'),
(131, 7, 'sub_18', 'Tshirt.svg'),
(132, 7, 'sub_19', 'Tshirt.svg'),
(133, 7, 'sub_20', 'Tshirt.svg'),
(134, 8, 'sub_1', 'Tshirt.svg'),
(135, 8, 'sub_2', 'Tshirt.svg'),
(136, 8, 'sub_4', 'Tshirt.svg'),
(137, 8, 'sub_5', 'Tshirt.svg'),
(138, 8, 'sub_6', 'Tshirt.svg'),
(139, 8, 'sub_7', 'Tshirt.svg'),
(140, 8, 'sub_8', 'Tshirt.svg'),
(141, 8, 'sub_9', 'Tshirt.svg'),
(142, 8, 'sub_10', 'Tshirt.svg'),
(143, 8, 'sub_11', 'Tshirt.svg'),
(144, 8, 'sub_12', 'Tshirt.svg'),
(145, 8, 'sub_13', 'Tshirt.svg'),
(146, 8, 'sub_14', 'Tshirt.svg'),
(147, 8, 'sub_15', 'Tshirt.svg'),
(148, 8, 'sub_16', 'Tshirt.svg'),
(149, 8, 'sub_17', 'Tshirt.svg'),
(150, 8, 'sub_18', 'Tshirt.svg'),
(151, 8, 'sub_19', 'Tshirt.svg'),
(152, 8, 'sub_20', 'Tshirt.svg'),
(153, 9, 'sub_1', 'Tshirt.svg'),
(154, 9, 'sub_2', 'Tshirt.svg'),
(155, 9, 'sub_4', 'Tshirt.svg'),
(156, 9, 'sub_5', 'Tshirt.svg'),
(157, 9, 'sub_6', 'Tshirt.svg'),
(158, 9, 'sub_7', 'Tshirt.svg'),
(159, 9, 'sub_8', 'Tshirt.svg'),
(160, 9, 'sub_9', 'Tshirt.svg'),
(161, 9, 'sub_10', 'Tshirt.svg'),
(162, 9, 'sub_11', 'Tshirt.svg'),
(163, 9, 'sub_12', 'Tshirt.svg'),
(164, 9, 'sub_13', 'Tshirt.svg'),
(165, 9, 'sub_14', 'Tshirt.svg'),
(166, 9, 'sub_15', 'Tshirt.svg'),
(167, 9, 'sub_16', 'Tshirt.svg'),
(168, 9, 'sub_17', 'Tshirt.svg'),
(169, 9, 'sub_18', 'Tshirt.svg'),
(170, 9, 'sub_19', 'Tshirt.svg'),
(171, 9, 'sub_20', 'Tshirt.svg'),
(172, 10, 'sub_1', 'Tshirt.svg'),
(173, 10, 'sub_2', 'Tshirt.svg'),
(174, 10, 'sub_4', 'Tshirt.svg'),
(175, 10, 'sub_5', 'Tshirt.svg'),
(176, 10, 'sub_6', 'Tshirt.svg'),
(177, 10, 'sub_7', 'Tshirt.svg'),
(178, 10, 'sub_8', 'Tshirt.svg'),
(179, 10, 'sub_9', 'Tshirt.svg'),
(180, 10, 'sub_10', 'Tshirt.svg'),
(181, 10, 'sub_11', 'Tshirt.svg'),
(182, 10, 'sub_12', 'Tshirt.svg'),
(183, 10, 'sub_13', 'Tshirt.svg'),
(184, 10, 'sub_14', 'Tshirt.svg'),
(185, 10, 'sub_15', 'Tshirt.svg'),
(186, 10, 'sub_16', 'Tshirt.svg'),
(187, 10, 'sub_17', 'Tshirt.svg'),
(188, 10, 'sub_18', 'Tshirt.svg'),
(189, 10, 'sub_19', 'Tshirt.svg'),
(190, 10, 'sub_20', 'Tshirt.svg'),
(191, 11, 'sub_1', 'Tshirt.svg'),
(192, 11, 'sub_2', 'Tshirt.svg'),
(193, 11, 'sub_4', 'Tshirt.svg'),
(194, 11, 'sub_5', 'Tshirt.svg'),
(195, 11, 'sub_6', 'Tshirt.svg'),
(196, 11, 'sub_7', 'Tshirt.svg'),
(197, 11, 'sub_8', 'Tshirt.svg'),
(198, 11, 'sub_9', 'Tshirt.svg'),
(199, 11, 'sub_10', 'Tshirt.svg'),
(200, 11, 'sub_11', 'Tshirt.svg'),
(201, 11, 'sub_12', 'Tshirt.svg'),
(202, 11, 'sub_13', 'Tshirt.svg'),
(203, 11, 'sub_14', 'Tshirt.svg'),
(204, 11, 'sub_15', 'Tshirt.svg'),
(205, 11, 'sub_16', 'Tshirt.svg'),
(206, 11, 'sub_17', 'Tshirt.svg'),
(207, 11, 'sub_18', 'Tshirt.svg'),
(208, 11, 'sub_19', 'Tshirt.svg'),
(209, 11, 'sub_20', 'Tshirt.svg'),
(210, 12, 'sub_1', 'Tshirt.svg'),
(211, 12, 'sub_2', 'Tshirt.svg'),
(212, 12, 'sub_4', 'Tshirt.svg'),
(213, 12, 'sub_5', 'Tshirt.svg'),
(214, 12, 'sub_6', 'Tshirt.svg'),
(215, 12, 'sub_7', 'Tshirt.svg'),
(216, 12, 'sub_8', 'Tshirt.svg'),
(217, 12, 'sub_9', 'Tshirt.svg'),
(218, 12, 'sub_10', 'Tshirt.svg'),
(219, 12, 'sub_11', 'Tshirt.svg'),
(220, 12, 'sub_12', 'Tshirt.svg'),
(221, 12, 'sub_13', 'Tshirt.svg'),
(222, 12, 'sub_14', 'Tshirt.svg'),
(223, 12, 'sub_15', 'Tshirt.svg'),
(224, 12, 'sub_16', 'Tshirt.svg'),
(225, 12, 'sub_17', 'Tshirt.svg'),
(226, 12, 'sub_18', 'Tshirt.svg'),
(227, 12, 'sub_19', 'Tshirt.svg'),
(228, 12, 'sub_20', 'Tshirt.svg'),
(229, 13, 'sub_1', 'Tshirt.svg'),
(230, 13, 'sub_2', 'Tshirt.svg'),
(231, 13, 'sub_4', 'Tshirt.svg'),
(232, 13, 'sub_5', 'Tshirt.svg'),
(233, 13, 'sub_6', 'Tshirt.svg'),
(234, 13, 'sub_7', 'Tshirt.svg'),
(235, 13, 'sub_8', 'Tshirt.svg'),
(236, 13, 'sub_9', 'Tshirt.svg'),
(237, 13, 'sub_10', 'Tshirt.svg'),
(238, 13, 'sub_11', 'Tshirt.svg'),
(239, 13, 'sub_12', 'Tshirt.svg'),
(240, 13, 'sub_13', 'Tshirt.svg'),
(241, 13, 'sub_14', 'Tshirt.svg'),
(242, 13, 'sub_15', 'Tshirt.svg'),
(243, 13, 'sub_16', 'Tshirt.svg'),
(244, 13, 'sub_17', 'Tshirt.svg'),
(245, 13, 'sub_18', 'Tshirt.svg'),
(246, 13, 'sub_19', 'Tshirt.svg'),
(247, 13, 'sub_20', 'Tshirt.svg'),
(248, 14, 'sub_1', 'Tshirt.svg'),
(249, 14, 'sub_2', 'Tshirt.svg'),
(250, 14, 'sub_4', 'Tshirt.svg'),
(251, 14, 'sub_5', 'Tshirt.svg'),
(252, 14, 'sub_6', 'Tshirt.svg'),
(253, 14, 'sub_7', 'Tshirt.svg'),
(254, 14, 'sub_8', 'Tshirt.svg'),
(255, 14, 'sub_9', 'Tshirt.svg'),
(256, 14, 'sub_10', 'Tshirt.svg'),
(257, 14, 'sub_11', 'Tshirt.svg'),
(258, 14, 'sub_12', 'Tshirt.svg'),
(259, 14, 'sub_13', 'Tshirt.svg'),
(260, 14, 'sub_14', 'Tshirt.svg'),
(261, 14, 'sub_15', 'Tshirt.svg'),
(262, 14, 'sub_16', 'Tshirt.svg'),
(263, 14, 'sub_17', 'Tshirt.svg'),
(264, 14, 'sub_18', 'Tshirt.svg'),
(265, 14, 'sub_19', 'Tshirt.svg'),
(266, 14, 'sub_20', 'Tshirt.svg'),
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
(342, 18, 'sub_20', 'Tshirt.svg'),
(343, 19, 'sub_1', 'Tshirt.svg'),
(344, 19, 'sub_2', 'Tshirt.svg'),
(345, 19, 'sub_4', 'Tshirt.svg'),
(346, 19, 'sub_5', 'Tshirt.svg'),
(347, 19, 'sub_6', 'Tshirt.svg'),
(348, 19, 'sub_7', 'Tshirt.svg'),
(349, 19, 'sub_8', 'Tshirt.svg'),
(350, 19, 'sub_9', 'Tshirt.svg'),
(351, 19, 'sub_10', 'Tshirt.svg'),
(352, 19, 'sub_11', 'Tshirt.svg'),
(353, 19, 'sub_12', 'Tshirt.svg'),
(354, 19, 'sub_13', 'Tshirt.svg'),
(355, 19, 'sub_14', 'Tshirt.svg'),
(356, 19, 'sub_15', 'Tshirt.svg'),
(357, 19, 'sub_16', 'Tshirt.svg'),
(358, 19, 'sub_17', 'Tshirt.svg'),
(359, 19, 'sub_18', 'Tshirt.svg'),
(360, 19, 'sub_19', 'Tshirt.svg'),
(361, 19, 'sub_20', 'Tshirt.svg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `comment_store`
--
ALTER TABLE `comment_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `description_product`
--
ALTER TABLE `description_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `information_product`
--
ALTER TABLE `information_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `like_product`
--
ALTER TABLE `like_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offer_product`
--
ALTER TABLE `offer_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
