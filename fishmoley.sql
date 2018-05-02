-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2018 at 04:44 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fishmoley`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Computers');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` double NOT NULL,
  `product_details` varchar(300) NOT NULL,
  `category_id` int(10) NOT NULL,
  `supplier_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_details`, `category_id`, `supplier_id`) VALUES
(1, 'Xbox One', 100, 'Discounted xbox console', 1, 1),
(2, 'Xbox One', 300, 'Next gen xbox console', 1, 1),
(3, 'PS4', 500, 'Next gen playstation console', 1, 1),
(4, 'Nintendo Wii', 150, 'Nintendo''s best selling console', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplier_id` int(10) NOT NULL,
  `supplier_name` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`) VALUES
(1, 'Asus');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `user_password` varchar(300) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `addressline1` varchar(50) NOT NULL,
  `addressline2` varchar(50) DEFAULT NULL,
  `admin_status` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_email`, `user_phone`, `addressline1`, `addressline2`, `admin_status`) VALUES
(1, 'tomas', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'tomas@yahoo.ie', '123456789', 'Moylaragh Cresent Balbriggan', NULL, 1),
(2, 'colm', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'colm@gmail.com', '123456', 'Dunnes', NULL, 0),
(3, 'Nifemi', 'b3a8e0e1f9ab1bfe3a36f231f676f78bb3a519d2b21e6c530c0eee8ebb4a5d0', 'Nifemi@gmail.com', '123456789', '', NULL, 0),
(4, 'Darcy', '83cf8b609de6036a8277bd0e96135751bbc7eb234256d4b65b893360651bf2', 'Darcy@email.com', '678', '', NULL, 0),
(5, 'NotTomas', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'nottomas@yahoo.ie', '123', '', NULL, 0),
(6, 'CoolUser99', 'f271de0999b83fe5ae1cbd19dbb43e57d4696d58379603a27f44b54e1623c', 'CoolUser99@gmail.com', '0853465', 'CoolLand', 'CoolLandia', 0),
(7, 'NotCoolGuy', 'f271de0999b83fe5ae1cbd19dbb43e57d4696d58379603a27f44b54e1623c', 'NotCoolGuy@gmail.com', '086553245', 'asd asd', 'asd ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_order_products`
--

CREATE TABLE IF NOT EXISTS `user_order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_order_products`
--

INSERT INTO `user_order_products` (`order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`), ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`), ADD KEY `product_id` (`product_id`), ADD KEY `category_id` (`category_id`), ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`), ADD UNIQUE KEY `supplier_id` (`supplier_id`), ADD KEY `supplier_id_2` (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
