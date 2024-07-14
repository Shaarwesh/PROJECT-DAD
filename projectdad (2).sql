-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 02:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectdad`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `author`, `status`, `price`) VALUES
(1, 'Educated', 'Tara Westover', 'Available', 25.4),
(2, 'Silent Spring', 'Rachel Carson', 'Sold', 45),
(3, 'The Love Hypothesis', 'Ali Hazelwood', 'Sold', 62.5),
(4, 'In Cold Blood', 'Truman Capote', 'Available', 77),
(5, 'Between the World and Me', 'Ta-Nehisi Coates', 'Sold', 33.8),
(6, 'Verity', 'Colleen Hoover', 'Available', 125.5);

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `courier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `vehicle` varchar(100) DEFAULT NULL,
  `status` enum('available','busy') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`courier_id`, `name`, `phone`, `vehicle`, `status`, `created_at`, `updated_at`) VALUES
(1, 'J&T', '01023489009', 'Lorry', 'available', '2024-07-14 16:44:04', '2024-07-14 16:44:04'),
(2, 'J&T', '0119992321', 'Van', 'busy', '2024-07-14 16:44:04', '2024-07-14 18:36:39'),
(3, 'J&T', '01678210032', 'Car', 'available', '2024-07-14 16:44:48', '2024-07-14 18:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` int(11) NOT NULL,
  `tr_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `delivery_status` varchar(50) DEFAULT NULL,
  `assigned_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`delivery_id`, `tr_id`, `courier_id`, `delivery_status`, `assigned_at`, `updated_at`, `user_id`) VALUES
(1, 1, 1, 'delivered', '2024-07-14 18:23:25', '2024-07-14 18:29:34', 1),
(2, 2, 2, 'in-progress', '2024-07-14 18:23:25', '2024-07-14 18:29:41', 2),
(3, 1, 3, 'assigned', '2024-07-14 19:04:02', '2024-07-14 19:04:02', 3);

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `status` enum('Returned','Not Returned','','') DEFAULT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`return_id`, `book_id`, `status`, `user_id`) VALUES
(1, 4, 'Not Returned', 3);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `tr_id` int(100) NOT NULL,
  `book_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `tr_type` varchar(100) NOT NULL,
  `tr_date` date NOT NULL,
  `courier_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`tr_id`, `book_id`, `user_id`, `tr_type`, `tr_date`, `courier_id`) VALUES
(1, 3, 1, 'Online Banking', '2024-07-11', 1),
(2, 5, 2, 'E-Wallet', '2024-07-13', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Mariya', 'mariya20@gmail.com', '43, Jalan KI 3, Taman Kangsa Indah 75550 Melaka', '0198892345', '2024-07-14 16:24:36', '2024-07-14 16:25:02'),
(2, 'Varsha', 'varshar@gmail.com', '1, Blok A, Pangsapuri Bukut Beruang Permai 72450', '01178853421', '2024-07-14 16:24:36', '2024-07-14 16:25:10'),
(3, 'Choew Hoo', 'choewhoo12@gmail.com', '98, Jalan SB 12, Taman Sri Bertam 76450 Melaka', '0162230756', '2024-07-14 16:26:41', '2024-07-14 16:26:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`courier_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `tr_id` (`tr_id`),
  ADD KEY `courier_id` (`courier_id`),
  ADD KEY `FK_uid1` (`user_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`tr_id`),
  ADD KEY `fk_bid` (`book_id`),
  ADD KEY `fk_cid` (`courier_id`),
  ADD KEY `fk_uid` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `FK_uid1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`tr_id`) REFERENCES `transactions` (`tr_id`),
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`courier_id`);

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `returns_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_bid` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `fk_cid` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`courier_id`),
  ADD CONSTRAINT `fk_uid` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
