-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2025 at 01:28 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `memebistrorestaurants`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1743761589),
('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1743761589;', 1743761589),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:5:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";s:1:\"j\";s:4:\"code\";}s:11:\"permissions\";a:361:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:9:\"view_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:13:\"view_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:11:\"create_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"update_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"restore_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"restore_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:14:\"replicate_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:12:\"reorder_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:11:\"delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:15:\"delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:17:\"force_delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:21:\"force_delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:9:\"view_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"view_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:11:\"create_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:11:\"update_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:12:\"restore_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:16:\"restore_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:14:\"replicate_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:12:\"reorder_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:11:\"delete_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:15:\"delete_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:17:\"force_delete_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:21:\"force_delete_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:15:\"view_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:19:\"view_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:17:\"create_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:17:\"update_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:18:\"restore_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:22:\"restore_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:20:\"replicate_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:18:\"reorder_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:17:\"delete_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:21:\"delete_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:23:\"force_delete_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:27:\"force_delete_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:12:\"view_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:16:\"view_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:14:\"create_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:14:\"update_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:15:\"restore_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:19:\"restore_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:17:\"replicate_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:15:\"reorder_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:14:\"delete_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:18:\"delete_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:20:\"force_delete_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:24:\"force_delete_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:10:\"view_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:14:\"view_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:12:\"create_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:12:\"update_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:13:\"restore_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:17:\"restore_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:15:\"replicate_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:13:\"reorder_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:12:\"delete_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:16:\"delete_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:18:\"force_delete_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:22:\"force_delete_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:5;i:3;i:8;}}i:66;a:3:{s:1:\"a\";i:67;s:1:\"b\";s:16:\"view_order::item\";s:1:\"c\";s:3:\"web\";}i:67;a:3:{s:1:\"a\";i:68;s:1:\"b\";s:20:\"view_any_order::item\";s:1:\"c\";s:3:\"web\";}i:68;a:3:{s:1:\"a\";i:69;s:1:\"b\";s:18:\"create_order::item\";s:1:\"c\";s:3:\"web\";}i:69;a:3:{s:1:\"a\";i:70;s:1:\"b\";s:18:\"update_order::item\";s:1:\"c\";s:3:\"web\";}i:70;a:3:{s:1:\"a\";i:71;s:1:\"b\";s:19:\"restore_order::item\";s:1:\"c\";s:3:\"web\";}i:71;a:3:{s:1:\"a\";i:72;s:1:\"b\";s:23:\"restore_any_order::item\";s:1:\"c\";s:3:\"web\";}i:72;a:3:{s:1:\"a\";i:73;s:1:\"b\";s:21:\"replicate_order::item\";s:1:\"c\";s:3:\"web\";}i:73;a:3:{s:1:\"a\";i:74;s:1:\"b\";s:19:\"reorder_order::item\";s:1:\"c\";s:3:\"web\";}i:74;a:3:{s:1:\"a\";i:75;s:1:\"b\";s:18:\"delete_order::item\";s:1:\"c\";s:3:\"web\";}i:75;a:3:{s:1:\"a\";i:76;s:1:\"b\";s:22:\"delete_any_order::item\";s:1:\"c\";s:3:\"web\";}i:76;a:3:{s:1:\"a\";i:77;s:1:\"b\";s:24:\"force_delete_order::item\";s:1:\"c\";s:3:\"web\";}i:77;a:3:{s:1:\"a\";i:78;s:1:\"b\";s:28:\"force_delete_any_order::item\";s:1:\"c\";s:3:\"web\";}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:14:\"view_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:18:\"view_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:16:\"create_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:16:\"update_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:17:\"restore_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:21:\"restore_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:19:\"replicate_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:17:\"reorder_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:16:\"delete_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:20:\"delete_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:22:\"force_delete_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:26:\"force_delete_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:16:\"view_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:20:\"view_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:18:\"create_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:18:\"update_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:19:\"restore_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:23:\"restore_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:21:\"replicate_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:19:\"reorder_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:18:\"delete_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:22:\"delete_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:24:\"force_delete_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:28:\"force_delete_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:15:\"view_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:19:\"view_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:17:\"create_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:17:\"update_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:18:\"restore_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:22:\"restore_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:20:\"replicate_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:18:\"reorder_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:17:\"delete_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:21:\"delete_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:112;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:23:\"force_delete_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:113;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:27:\"force_delete_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:114;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:10:\"view_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:115;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:14:\"view_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:116;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:12:\"create_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:12:\"update_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:118;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:13:\"restore_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:17:\"restore_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:120;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:15:\"replicate_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:121;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:13:\"reorder_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:122;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:12:\"delete_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:16:\"delete_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:124;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:18:\"force_delete_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:22:\"force_delete_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:126;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:19:\"view_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:127;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:23:\"view_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:128;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:21:\"create_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:21:\"update_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:130;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:22:\"restore_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:131;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:26:\"restore_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:132;a:4:{s:1:\"a\";i:133;s:1:\"b\";s:24:\"replicate_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:133;a:4:{s:1:\"a\";i:134;s:1:\"b\";s:22:\"reorder_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:134;a:4:{s:1:\"a\";i:135;s:1:\"b\";s:21:\"delete_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:25:\"delete_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:136;a:4:{s:1:\"a\";i:137;s:1:\"b\";s:27:\"force_delete_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:137;a:4:{s:1:\"a\";i:138;s:1:\"b\";s:31:\"force_delete_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:138;a:3:{s:1:\"a\";i:139;s:1:\"b\";s:9:\"view_post\";s:1:\"c\";s:3:\"web\";}i:139;a:3:{s:1:\"a\";i:140;s:1:\"b\";s:13:\"view_any_post\";s:1:\"c\";s:3:\"web\";}i:140;a:3:{s:1:\"a\";i:141;s:1:\"b\";s:11:\"create_post\";s:1:\"c\";s:3:\"web\";}i:141;a:3:{s:1:\"a\";i:142;s:1:\"b\";s:11:\"update_post\";s:1:\"c\";s:3:\"web\";}i:142;a:3:{s:1:\"a\";i:143;s:1:\"b\";s:12:\"restore_post\";s:1:\"c\";s:3:\"web\";}i:143;a:3:{s:1:\"a\";i:144;s:1:\"b\";s:16:\"restore_any_post\";s:1:\"c\";s:3:\"web\";}i:144;a:3:{s:1:\"a\";i:145;s:1:\"b\";s:14:\"replicate_post\";s:1:\"c\";s:3:\"web\";}i:145;a:3:{s:1:\"a\";i:146;s:1:\"b\";s:12:\"reorder_post\";s:1:\"c\";s:3:\"web\";}i:146;a:3:{s:1:\"a\";i:147;s:1:\"b\";s:11:\"delete_post\";s:1:\"c\";s:3:\"web\";}i:147;a:3:{s:1:\"a\";i:148;s:1:\"b\";s:15:\"delete_any_post\";s:1:\"c\";s:3:\"web\";}i:148;a:3:{s:1:\"a\";i:149;s:1:\"b\";s:17:\"force_delete_post\";s:1:\"c\";s:3:\"web\";}i:149;a:3:{s:1:\"a\";i:150;s:1:\"b\";s:21:\"force_delete_any_post\";s:1:\"c\";s:3:\"web\";}i:150;a:3:{s:1:\"a\";i:151;s:1:\"b\";s:19:\"view_post::category\";s:1:\"c\";s:3:\"web\";}i:151;a:3:{s:1:\"a\";i:152;s:1:\"b\";s:23:\"view_any_post::category\";s:1:\"c\";s:3:\"web\";}i:152;a:3:{s:1:\"a\";i:153;s:1:\"b\";s:21:\"create_post::category\";s:1:\"c\";s:3:\"web\";}i:153;a:3:{s:1:\"a\";i:154;s:1:\"b\";s:21:\"update_post::category\";s:1:\"c\";s:3:\"web\";}i:154;a:3:{s:1:\"a\";i:155;s:1:\"b\";s:22:\"restore_post::category\";s:1:\"c\";s:3:\"web\";}i:155;a:3:{s:1:\"a\";i:156;s:1:\"b\";s:26:\"restore_any_post::category\";s:1:\"c\";s:3:\"web\";}i:156;a:3:{s:1:\"a\";i:157;s:1:\"b\";s:24:\"replicate_post::category\";s:1:\"c\";s:3:\"web\";}i:157;a:3:{s:1:\"a\";i:158;s:1:\"b\";s:22:\"reorder_post::category\";s:1:\"c\";s:3:\"web\";}i:158;a:3:{s:1:\"a\";i:159;s:1:\"b\";s:21:\"delete_post::category\";s:1:\"c\";s:3:\"web\";}i:159;a:3:{s:1:\"a\";i:160;s:1:\"b\";s:25:\"delete_any_post::category\";s:1:\"c\";s:3:\"web\";}i:160;a:3:{s:1:\"a\";i:161;s:1:\"b\";s:27:\"force_delete_post::category\";s:1:\"c\";s:3:\"web\";}i:161;a:3:{s:1:\"a\";i:162;s:1:\"b\";s:31:\"force_delete_any_post::category\";s:1:\"c\";s:3:\"web\";}i:162;a:4:{s:1:\"a\";i:163;s:1:\"b\";s:12:\"view_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:163;a:4:{s:1:\"a\";i:164;s:1:\"b\";s:16:\"view_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:164;a:4:{s:1:\"a\";i:165;s:1:\"b\";s:14:\"create_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:165;a:4:{s:1:\"a\";i:166;s:1:\"b\";s:14:\"update_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:166;a:4:{s:1:\"a\";i:167;s:1:\"b\";s:15:\"restore_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:167;a:4:{s:1:\"a\";i:168;s:1:\"b\";s:19:\"restore_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:168;a:4:{s:1:\"a\";i:169;s:1:\"b\";s:17:\"replicate_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:169;a:4:{s:1:\"a\";i:170;s:1:\"b\";s:15:\"reorder_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:170;a:4:{s:1:\"a\";i:171;s:1:\"b\";s:14:\"delete_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:171;a:4:{s:1:\"a\";i:172;s:1:\"b\";s:18:\"delete_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:172;a:4:{s:1:\"a\";i:173;s:1:\"b\";s:20:\"force_delete_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:173;a:4:{s:1:\"a\";i:174;s:1:\"b\";s:24:\"force_delete_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:174;a:4:{s:1:\"a\";i:175;s:1:\"b\";s:11:\"page_Themes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:175;a:4:{s:1:\"a\";i:176;s:1:\"b\";s:16:\"view_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:176;a:4:{s:1:\"a\";i:177;s:1:\"b\";s:20:\"view_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:3;i:2;i:5;i:3;i:8;}}i:177;a:4:{s:1:\"a\";i:178;s:1:\"b\";s:18:\"create_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:178;a:4:{s:1:\"a\";i:179;s:1:\"b\";s:18:\"update_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:179;a:4:{s:1:\"a\";i:180;s:1:\"b\";s:19:\"restore_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:180;a:4:{s:1:\"a\";i:181;s:1:\"b\";s:23:\"restore_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:181;a:4:{s:1:\"a\";i:182;s:1:\"b\";s:21:\"replicate_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:182;a:4:{s:1:\"a\";i:183;s:1:\"b\";s:19:\"reorder_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:183;a:4:{s:1:\"a\";i:184;s:1:\"b\";s:18:\"delete_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:184;a:4:{s:1:\"a\";i:185;s:1:\"b\";s:22:\"delete_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:185;a:4:{s:1:\"a\";i:186;s:1:\"b\";s:24:\"force_delete_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:186;a:4:{s:1:\"a\";i:187;s:1:\"b\";s:28:\"force_delete_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:187;a:3:{s:1:\"a\";i:188;s:1:\"b\";s:6:\"HSHSHS\";s:1:\"c\";s:3:\"web\";}i:188;a:4:{s:1:\"a\";i:189;s:1:\"b\";s:13:\"view_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:189;a:4:{s:1:\"a\";i:190;s:1:\"b\";s:17:\"view_any_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:190;a:4:{s:1:\"a\";i:191;s:1:\"b\";s:15:\"create_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:191;a:4:{s:1:\"a\";i:192;s:1:\"b\";s:15:\"update_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:192;a:4:{s:1:\"a\";i:193;s:1:\"b\";s:16:\"restore_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:193;a:4:{s:1:\"a\";i:194;s:1:\"b\";s:20:\"restore_any_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:194;a:4:{s:1:\"a\";i:195;s:1:\"b\";s:18:\"replicate_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:195;a:4:{s:1:\"a\";i:196;s:1:\"b\";s:16:\"reorder_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:196;a:4:{s:1:\"a\";i:197;s:1:\"b\";s:15:\"delete_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:197;a:4:{s:1:\"a\";i:198;s:1:\"b\";s:19:\"delete_any_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:198;a:4:{s:1:\"a\";i:199;s:1:\"b\";s:21:\"force_delete_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:199;a:4:{s:1:\"a\";i:200;s:1:\"b\";s:25:\"force_delete_any_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:5;i:2;i:8;}}i:200;a:4:{s:1:\"a\";i:201;s:1:\"b\";s:26:\"view_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:201;a:4:{s:1:\"a\";i:202;s:1:\"b\";s:30:\"view_any_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:202;a:4:{s:1:\"a\";i:203;s:1:\"b\";s:28:\"create_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:203;a:4:{s:1:\"a\";i:204;s:1:\"b\";s:28:\"update_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:204;a:4:{s:1:\"a\";i:205;s:1:\"b\";s:29:\"restore_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:205;a:4:{s:1:\"a\";i:206;s:1:\"b\";s:33:\"restore_any_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:206;a:4:{s:1:\"a\";i:207;s:1:\"b\";s:31:\"replicate_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:207;a:4:{s:1:\"a\";i:208;s:1:\"b\";s:29:\"reorder_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:208;a:4:{s:1:\"a\";i:209;s:1:\"b\";s:28:\"delete_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:209;a:4:{s:1:\"a\";i:210;s:1:\"b\";s:32:\"delete_any_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:210;a:4:{s:1:\"a\";i:211;s:1:\"b\";s:34:\"force_delete_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:211;a:4:{s:1:\"a\";i:212;s:1:\"b\";s:38:\"force_delete_any_material::transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:212;a:4:{s:1:\"a\";i:213;s:1:\"b\";s:23:\"widget_ReservationStats\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:213;a:4:{s:1:\"a\";i:214;s:1:\"b\";s:30:\"widget_RestaurantRevenueWidget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:214;a:4:{s:1:\"a\";i:215;s:1:\"b\";s:30:\"widget_RevenueByLocationWidget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:215;a:4:{s:1:\"a\";i:216;s:1:\"b\";s:31:\"widget_LatestReservationsWidget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:216;a:4:{s:1:\"a\";i:217;s:1:\"b\";s:25:\"widget_PendingOrdersTable\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:8;}}i:217;a:4:{s:1:\"a\";i:218;s:1:\"b\";s:20:\"view_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:218;a:4:{s:1:\"a\";i:219;s:1:\"b\";s:24:\"view_any_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:219;a:4:{s:1:\"a\";i:220;s:1:\"b\";s:22:\"create_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:220;a:4:{s:1:\"a\";i:221;s:1:\"b\";s:22:\"update_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:221;a:4:{s:1:\"a\";i:222;s:1:\"b\";s:23:\"restore_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:222;a:4:{s:1:\"a\";i:223;s:1:\"b\";s:27:\"restore_any_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:223;a:4:{s:1:\"a\";i:224;s:1:\"b\";s:25:\"replicate_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:224;a:4:{s:1:\"a\";i:225;s:1:\"b\";s:23:\"reorder_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:225;a:4:{s:1:\"a\";i:226;s:1:\"b\";s:22:\"delete_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:226;a:4:{s:1:\"a\";i:227;s:1:\"b\";s:26:\"delete_any_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:227;a:4:{s:1:\"a\";i:228;s:1:\"b\";s:28:\"force_delete_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:228;a:4:{s:1:\"a\";i:229;s:1:\"b\";s:32:\"force_delete_any_import::request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:229;a:4:{s:1:\"a\";i:230;s:1:\"b\";s:23:\"view_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:230;a:4:{s:1:\"a\";i:231;s:1:\"b\";s:27:\"view_any_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:231;a:4:{s:1:\"a\";i:232;s:1:\"b\";s:25:\"create_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:232;a:4:{s:1:\"a\";i:233;s:1:\"b\";s:25:\"update_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:233;a:4:{s:1:\"a\";i:234;s:1:\"b\";s:26:\"restore_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:234;a:4:{s:1:\"a\";i:235;s:1:\"b\";s:30:\"restore_any_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:235;a:4:{s:1:\"a\";i:236;s:1:\"b\";s:28:\"replicate_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:236;a:4:{s:1:\"a\";i:237;s:1:\"b\";s:26:\"reorder_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:237;a:4:{s:1:\"a\";i:238;s:1:\"b\";s:25:\"delete_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:238;a:4:{s:1:\"a\";i:239;s:1:\"b\";s:29:\"delete_any_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:239;a:4:{s:1:\"a\";i:240;s:1:\"b\";s:31:\"force_delete_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:240;a:4:{s:1:\"a\";i:241;s:1:\"b\";s:35:\"force_delete_any_return::ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:241;a:4:{s:1:\"a\";i:242;s:1:\"b\";s:23:\"view_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:242;a:4:{s:1:\"a\";i:243;s:1:\"b\";s:27:\"view_any_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:243;a:4:{s:1:\"a\";i:244;s:1:\"b\";s:25:\"create_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:244;a:4:{s:1:\"a\";i:245;s:1:\"b\";s:25:\"update_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:245;a:4:{s:1:\"a\";i:246;s:1:\"b\";s:26:\"restore_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:246;a:4:{s:1:\"a\";i:247;s:1:\"b\";s:30:\"restore_any_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:247;a:4:{s:1:\"a\";i:248;s:1:\"b\";s:28:\"replicate_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:248;a:4:{s:1:\"a\";i:249;s:1:\"b\";s:26:\"reorder_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:249;a:4:{s:1:\"a\";i:250;s:1:\"b\";s:25:\"delete_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:250;a:4:{s:1:\"a\";i:251;s:1:\"b\";s:29:\"delete_any_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:251;a:4:{s:1:\"a\";i:252;s:1:\"b\";s:31:\"force_delete_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:252;a:4:{s:1:\"a\";i:253;s:1:\"b\";s:35:\"force_delete_any_warehouse::receipt\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:8;}}i:253;a:3:{s:1:\"a\";i:254;s:1:\"b\";s:9:\"view_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:254;a:3:{s:1:\"a\";i:255;s:1:\"b\";s:13:\"view_any_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:255;a:3:{s:1:\"a\";i:256;s:1:\"b\";s:11:\"create_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:256;a:3:{s:1:\"a\";i:257;s:1:\"b\";s:11:\"update_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:257;a:3:{s:1:\"a\";i:258;s:1:\"b\";s:12:\"restore_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:258;a:3:{s:1:\"a\";i:259;s:1:\"b\";s:16:\"restore_any_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:259;a:3:{s:1:\"a\";i:260;s:1:\"b\";s:14:\"replicate_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:260;a:3:{s:1:\"a\";i:261;s:1:\"b\";s:12:\"reorder_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:261;a:3:{s:1:\"a\";i:262;s:1:\"b\";s:11:\"delete_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:262;a:3:{s:1:\"a\";i:263;s:1:\"b\";s:15:\"delete_any_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:263;a:3:{s:1:\"a\";i:264;s:1:\"b\";s:17:\"force_delete_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:264;a:3:{s:1:\"a\";i:265;s:1:\"b\";s:21:\"force_delete_any_dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:265;a:3:{s:1:\"a\";i:266;s:1:\"b\";s:19:\"view_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:266;a:3:{s:1:\"a\";i:267;s:1:\"b\";s:23:\"view_any_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:267;a:3:{s:1:\"a\";i:268;s:1:\"b\";s:21:\"create_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:268;a:3:{s:1:\"a\";i:269;s:1:\"b\";s:21:\"update_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:269;a:3:{s:1:\"a\";i:270;s:1:\"b\";s:22:\"restore_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:270;a:3:{s:1:\"a\";i:271;s:1:\"b\";s:26:\"restore_any_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:271;a:3:{s:1:\"a\";i:272;s:1:\"b\";s:24:\"replicate_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:272;a:3:{s:1:\"a\";i:273;s:1:\"b\";s:22:\"reorder_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:273;a:3:{s:1:\"a\";i:274;s:1:\"b\";s:21:\"delete_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:274;a:3:{s:1:\"a\";i:275;s:1:\"b\";s:25:\"delete_any_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:275;a:3:{s:1:\"a\";i:276;s:1:\"b\";s:27:\"force_delete_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:276;a:3:{s:1:\"a\";i:277;s:1:\"b\";s:31:\"force_delete_any_food::category\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:277;a:3:{s:1:\"a\";i:278;s:1:\"b\";s:20:\"view_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:278;a:3:{s:1:\"a\";i:279;s:1:\"b\";s:24:\"view_any_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:279;a:3:{s:1:\"a\";i:280;s:1:\"b\";s:22:\"create_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:280;a:3:{s:1:\"a\";i:281;s:1:\"b\";s:22:\"update_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:281;a:3:{s:1:\"a\";i:282;s:1:\"b\";s:23:\"restore_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:282;a:3:{s:1:\"a\";i:283;s:1:\"b\";s:27:\"restore_any_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:283;a:3:{s:1:\"a\";i:284;s:1:\"b\";s:25:\"replicate_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:284;a:3:{s:1:\"a\";i:285;s:1:\"b\";s:23:\"reorder_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:285;a:3:{s:1:\"a\";i:286;s:1:\"b\";s:22:\"delete_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:286;a:3:{s:1:\"a\";i:287;s:1:\"b\";s:26:\"delete_any_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:287;a:3:{s:1:\"a\";i:288;s:1:\"b\";s:28:\"force_delete_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:288;a:3:{s:1:\"a\";i:289;s:1:\"b\";s:32:\"force_delete_any_import::request\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:289;a:3:{s:1:\"a\";i:290;s:1:\"b\";s:15:\"view_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:290;a:3:{s:1:\"a\";i:291;s:1:\"b\";s:19:\"view_any_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:291;a:3:{s:1:\"a\";i:292;s:1:\"b\";s:17:\"create_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:292;a:3:{s:1:\"a\";i:293;s:1:\"b\";s:17:\"update_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:293;a:3:{s:1:\"a\";i:294;s:1:\"b\";s:18:\"restore_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:294;a:3:{s:1:\"a\";i:295;s:1:\"b\";s:22:\"restore_any_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:295;a:3:{s:1:\"a\";i:296;s:1:\"b\";s:20:\"replicate_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:296;a:3:{s:1:\"a\";i:297;s:1:\"b\";s:18:\"reorder_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:297;a:3:{s:1:\"a\";i:298;s:1:\"b\";s:17:\"delete_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:298;a:3:{s:1:\"a\";i:299;s:1:\"b\";s:21:\"delete_any_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:299;a:3:{s:1:\"a\";i:300;s:1:\"b\";s:23:\"force_delete_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:300;a:3:{s:1:\"a\";i:301;s:1:\"b\";s:27:\"force_delete_any_ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:301;a:3:{s:1:\"a\";i:302;s:1:\"b\";s:26:\"view_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:302;a:3:{s:1:\"a\";i:303;s:1:\"b\";s:30:\"view_any_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:303;a:3:{s:1:\"a\";i:304;s:1:\"b\";s:28:\"create_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:304;a:3:{s:1:\"a\";i:305;s:1:\"b\";s:28:\"update_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:305;a:3:{s:1:\"a\";i:306;s:1:\"b\";s:29:\"restore_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:306;a:3:{s:1:\"a\";i:307;s:1:\"b\";s:33:\"restore_any_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:307;a:3:{s:1:\"a\";i:308;s:1:\"b\";s:31:\"replicate_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:308;a:3:{s:1:\"a\";i:309;s:1:\"b\";s:29:\"reorder_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:309;a:3:{s:1:\"a\";i:310;s:1:\"b\";s:28:\"delete_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:310;a:3:{s:1:\"a\";i:311;s:1:\"b\";s:32:\"delete_any_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:311;a:3:{s:1:\"a\";i:312;s:1:\"b\";s:34:\"force_delete_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:312;a:3:{s:1:\"a\";i:313;s:1:\"b\";s:38:\"force_delete_any_material::transaction\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:313;a:3:{s:1:\"a\";i:314;s:1:\"b\";s:23:\"view_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:314;a:3:{s:1:\"a\";i:315;s:1:\"b\";s:27:\"view_any_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:315;a:3:{s:1:\"a\";i:316;s:1:\"b\";s:25:\"create_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:316;a:3:{s:1:\"a\";i:317;s:1:\"b\";s:25:\"update_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:317;a:3:{s:1:\"a\";i:318;s:1:\"b\";s:26:\"restore_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:318;a:3:{s:1:\"a\";i:319;s:1:\"b\";s:30:\"restore_any_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:319;a:3:{s:1:\"a\";i:320;s:1:\"b\";s:28:\"replicate_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:320;a:3:{s:1:\"a\";i:321;s:1:\"b\";s:26:\"reorder_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:321;a:3:{s:1:\"a\";i:322;s:1:\"b\";s:25:\"delete_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:322;a:3:{s:1:\"a\";i:323;s:1:\"b\";s:29:\"delete_any_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:323;a:3:{s:1:\"a\";i:324;s:1:\"b\";s:31:\"force_delete_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:324;a:3:{s:1:\"a\";i:325;s:1:\"b\";s:35:\"force_delete_any_return::ingredient\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:325;a:3:{s:1:\"a\";i:326;s:1:\"b\";s:10:\"view_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:326;a:3:{s:1:\"a\";i:327;s:1:\"b\";s:14:\"view_any_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:327;a:3:{s:1:\"a\";i:328;s:1:\"b\";s:12:\"create_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:328;a:3:{s:1:\"a\";i:329;s:1:\"b\";s:12:\"update_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:329;a:3:{s:1:\"a\";i:330;s:1:\"b\";s:13:\"restore_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:330;a:3:{s:1:\"a\";i:331;s:1:\"b\";s:17:\"restore_any_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:331;a:3:{s:1:\"a\";i:332;s:1:\"b\";s:15:\"replicate_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:332;a:3:{s:1:\"a\";i:333;s:1:\"b\";s:13:\"reorder_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:333;a:3:{s:1:\"a\";i:334;s:1:\"b\";s:12:\"delete_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:334;a:3:{s:1:\"a\";i:335;s:1:\"b\";s:16:\"delete_any_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:335;a:3:{s:1:\"a\";i:336;s:1:\"b\";s:18:\"force_delete_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:336;a:3:{s:1:\"a\";i:337;s:1:\"b\";s:22:\"force_delete_any_table\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:337;a:3:{s:1:\"a\";i:338;s:1:\"b\";s:16:\"view_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:338;a:3:{s:1:\"a\";i:339;s:1:\"b\";s:20:\"view_any_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:339;a:3:{s:1:\"a\";i:340;s:1:\"b\";s:18:\"create_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:340;a:3:{s:1:\"a\";i:341;s:1:\"b\";s:18:\"update_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:341;a:3:{s:1:\"a\";i:342;s:1:\"b\";s:19:\"restore_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:342;a:3:{s:1:\"a\";i:343;s:1:\"b\";s:23:\"restore_any_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:343;a:3:{s:1:\"a\";i:344;s:1:\"b\";s:21:\"replicate_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:344;a:3:{s:1:\"a\";i:345;s:1:\"b\";s:19:\"reorder_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:345;a:3:{s:1:\"a\";i:346;s:1:\"b\";s:18:\"delete_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:346;a:3:{s:1:\"a\";i:347;s:1:\"b\";s:22:\"delete_any_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:347;a:3:{s:1:\"a\";i:348;s:1:\"b\";s:24:\"force_delete_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:348;a:3:{s:1:\"a\";i:349;s:1:\"b\";s:28:\"force_delete_any_table::dish\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:349;a:3:{s:1:\"a\";i:350;s:1:\"b\";s:23:\"view_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:350;a:3:{s:1:\"a\";i:351;s:1:\"b\";s:27:\"view_any_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:351;a:3:{s:1:\"a\";i:352;s:1:\"b\";s:25:\"create_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:352;a:3:{s:1:\"a\";i:353;s:1:\"b\";s:25:\"update_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:353;a:3:{s:1:\"a\";i:354;s:1:\"b\";s:26:\"restore_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:354;a:3:{s:1:\"a\";i:355;s:1:\"b\";s:30:\"restore_any_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:355;a:3:{s:1:\"a\";i:356;s:1:\"b\";s:28:\"replicate_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:356;a:3:{s:1:\"a\";i:357;s:1:\"b\";s:26:\"reorder_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:357;a:3:{s:1:\"a\";i:358;s:1:\"b\";s:25:\"delete_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:358;a:3:{s:1:\"a\";i:359;s:1:\"b\";s:29:\"delete_any_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:359;a:3:{s:1:\"a\";i:360;s:1:\"b\";s:31:\"force_delete_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}i:360;a:3:{s:1:\"a\";i:361;s:1:\"b\";s:35:\"force_delete_any_warehouse::receipt\";s:1:\"c\";s:8:\"HGHHGHGH\";}}s:5:\"roles\";a:5:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";s:1:\"j\";N;}i:1;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";s:1:\"j\";N;}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:15:\"Bếp trưởng\";s:1:\"c\";s:3:\"web\";s:1:\"j\";N;}i:3;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:21:\"Nhân viên thu ngân\";s:1:\"c\";s:3:\"web\";s:1:\"j\";N;}i:4;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:10:\"Kế toán\";s:1:\"c\";s:3:\"web\";s:1:\"j\";N;}}}', 1743831005);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`, `status`) VALUES
(1, '123', '123@2', '123', '2025-03-14 13:31:49', '2025-04-03 02:06:14', 'processed'),
(2, '123', '1@1', 'Message123', '2025-03-14 13:33:56', '2025-03-14 13:33:56', 'pending'),
(3, '1', '2@2', '123', '2025-03-14 13:35:06', '2025-03-14 13:35:06', 'pending'),
(4, '123', '2509roblox@gmail.com', '123', '2025-03-14 13:35:32', '2025-03-14 13:35:32', 'pending'),
(5, '123', '2509roblox@gmail.com', '123', '2025-03-16 13:08:57', '2025-03-16 13:08:57', 'pending'),
(6, 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', '2025-03-16 13:51:15', '2025-03-16 13:51:15', 'pending'),
(7, '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', '2025-04-03 02:06:29', '2025-04-03 02:06:29', 'pending'),
(8, '123', '2509roblox@gmail.com', '123123', '2025-04-03 02:48:05', '2025-04-03 02:48:05', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `loyalty_points` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `email`, `name`, `address`, `phone`, `is_locked`, `loyalty_points`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'Trần Lê Huy Hoàng', 'Quận 12, HCM a', '0999999999 a', 0, 30499, '2025-03-23 02:19:30', '2025-03-26 11:09:36'),
(3, '2509roblox@gmail.com', '2509roblox@gmail.com', NULL, '0999999999', 0, 0, '2025-03-26 11:14:13', '2025-03-26 11:14:13'),
(4, 'admin@gmail.comxxx', 'admin@gmail.comxxx', 'admin@gmail.comxxx', 'admin@gmail.comxxx', 0, 36000, '2025-03-26 11:17:06', '2025-03-26 11:17:53'),
(5, 'adxxxmin@gmail.com', 'adxxxmin@gmail.com', 'adxxxmin@gmail.com', 'adxxxmin@gmail.com', 0, 0, '2025-03-26 11:18:21', '2025-03-26 11:18:21'),
(6, '2508roblox@gmail.com', '2508roblox@gmail.com', NULL, '1111111111', 0, 0, '2025-04-02 02:00:34', '2025-04-02 02:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `food_category_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold_quantity` int NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daily_sold_quantity` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `food_category_id`, `image`, `slug`, `sold_quantity`, `status`, `daily_sold_quantity`) VALUES
(12, 'Gỏi tôm và sốt chanh tuyết', 'Gỏi tôm và sốt chanh tuyết', '245000.00', '2025-03-19 02:39:17', '2025-04-03 02:29:58', 2, 'goi-tom-va-sot-chanh-tuyet-1742351957.jpeg', 'goi-tom-va-sot-chanh-tuyet', 0, 'unavailable', 100),
(13, 'Lưỡi bò nướng chấm trứng lòng đào mắm tỏi và mắm me', 'Lưỡi bò nướng chấm trứng lòng đào mắm tỏi và mắm me', '205000.00', '2025-03-19 02:39:18', '2025-03-19 02:39:18', 2, 'luoi-bo-nuong-cham-trung-long-dao-mam-toi-va-mam-me-1742351958.jpeg', 'luoi-bo-nuong-cham-trung-long-dao-mam-toi-va-mam-me', 0, 'available', 0),
(14, 'Mực chiên trứng muối', 'Mực chiên trứng muối', '170000.00', '2025-03-19 02:39:19', '2025-03-19 02:39:19', 2, 'muc-chien-trung-muoi-1742351959.jpeg', 'muc-chien-trung-muoi', 0, 'available', 0),
(15, 'Xiên sườn bò Black Angus Mỹ nướng sốt Satay', 'Xiên sườn bò Black Angus Mỹ nướng sốt Satay', '175000.00', '2025-03-19 02:39:20', '2025-03-19 02:39:20', 2, 'xien-suon-bo-black-angus-my-nuong-sot-satay-1742351960.jpeg', 'xien-suon-bo-black-angus-my-nuong-sot-satay', 0, 'available', 0),
(16, 'Xiên Heo nướng ăn kèm bánh mì bơ dừa', 'Xiên Heo nướng ăn kèm bánh mì bơ dừa', '135000.00', '2025-03-19 02:39:21', '2025-03-19 02:39:21', 2, 'xien-heo-nuong-an-kem-banh-mi-bo-dua-1742351961.jpeg', 'xien-heo-nuong-an-kem-banh-mi-bo-dua', 0, 'available', 0),
(17, 'Gỏi phile cá diêu hồng kiểu Thái', 'Gỏi phile cá diêu hồng kiểu Thái', '195000.00', '2025-03-19 02:39:23', '2025-03-19 02:39:23', 2, 'goi-phile-ca-dieu-hong-kieu-thai-1742351963.png', 'goi-phile-ca-dieu-hong-kieu-thai', 0, 'available', 0),
(18, 'Cánh gà chiên kiểu Bangkok', 'Cánh gà chiên kiểu Bangkok', '110000.00', '2025-03-19 02:39:23', '2025-03-19 02:39:23', 2, 'canh-ga-chien-kieu-bangkok-1742351963.jpeg', 'canh-ga-chien-kieu-bangkok', 0, 'available', 0),
(19, 'Cánh gà chiên sốt Tom Yum', 'Cánh gà chiên sốt Tom Yum', '115000.00', '2025-03-19 02:39:24', '2025-03-19 02:39:24', 2, 'canh-ga-chien-sot-tom-yum-1742351964.jpeg', 'canh-ga-chien-sot-tom-yum', 0, 'available', 0),
(20, 'Ngao hấp bia Chang và lá chanh Thái', 'Ngao hấp bia Chang và lá chanh Thái', '145000.00', '2025-03-19 02:39:25', '2025-03-19 02:39:25', 2, 'ngao-hap-bia-chang-va-la-chanh-thai-1742351965.jpeg', 'ngao-hap-bia-chang-va-la-chanh-thai', 0, 'available', 0),
(21, 'Đậu hũ chiên sốt me', 'Đậu hũ chiên sốt me', '65000.00', '2025-03-19 02:39:26', '2025-03-19 02:39:26', 2, 'dau-hu-chien-sot-me-1742351966.jpeg', 'dau-hu-chien-sot-me', 0, 'available', 0),
(22, 'Gỏi trứng lòng đào trộn thịt bằm thính hành khô', 'Gỏi trứng lòng đào trộn thịt bằm thính hành khô', '110000.00', '2025-03-19 02:39:27', '2025-03-19 02:39:27', 2, 'goi-trung-long-dao-tron-thit-bam-thinh-hanh-kho-1742351967.jpeg', 'goi-trung-long-dao-tron-thit-bam-thinh-hanh-kho', 0, 'available', 0),
(23, 'Lạp heo phồng tôm', 'Lạp heo phồng tôm', '110000.00', '2025-03-19 02:39:28', '2025-03-19 02:39:28', 2, 'lap-heo-phong-tom-1742351968.jpeg', 'lap-heo-phong-tom', 0, 'available', 0),
(24, 'Thịt trâu lát mỏng tái chanh kiểu Thái', 'Thịt trâu lát mỏng tái chanh kiểu Thái', '150000.00', '2025-03-19 02:39:29', '2025-03-19 02:39:29', 2, 'thit-trau-lat-mong-tai-chanh-kieu-thai-1742351969.jpeg', 'thit-trau-lat-mong-tai-chanh-kieu-thai', 0, 'available', 0),
(25, 'Cơm cháy chấm sốt tôm thịt kiểu Thái', 'Cơm cháy chấm sốt tôm thịt kiểu Thái', '90000.00', '2025-03-19 02:39:29', '2025-03-19 02:39:29', 2, 'com-chay-cham-sot-tom-thit-kieu-thai-1742351969.jpeg', 'com-chay-cham-sot-tom-thit-kieu-thai', 0, 'available', 0),
(26, 'Nấm chiên giòn chua cay', 'Nấm chiên giòn chua cay', '75000.00', '2025-03-19 02:39:31', '2025-03-19 02:39:31', 2, 'nam-chien-gion-chua-cay-1742351971.jpeg', 'nam-chien-gion-chua-cay', 0, 'available', 0),
(27, 'Salad miến trộn hải sản cay', 'Salad miến trộn hải sản cay', '160000.00', '2025-03-19 02:39:32', '2025-03-19 02:39:32', 1, 'salad-mien-tron-hai-san-cay-1742351972.jpeg', 'salad-mien-tron-hai-san-cay', 0, 'available', 0),
(28, 'Gỏi bưởi hạt điều và dừa khô', 'Gỏi bưởi hạt điều và dừa khô', '120000.00', '2025-03-19 02:39:32', '2025-03-19 02:39:32', 1, 'goi-buoi-hat-dieu-va-dua-kho-1742351972.jpeg', 'goi-buoi-hat-dieu-va-dua-kho', 0, 'available', 0),
(29, 'Cải làn xào thịt heo quay - Rau thay đổi theo mùa)', 'Cải làn xào thịt heo quay - Rau thay đổi theo mùa)', '115000.00', '2025-03-19 02:39:33', '2025-03-19 02:39:33', 1, 'cai-lan-xao-thit-heo-quay-rau-thay-doi-theo-mua-1742351973.jpeg', 'cai-lan-xao-thit-heo-quay-rau-thay-doi-theo-mua', 0, 'available', 0),
(30, 'Gỏi Ngô', 'Gỏi Ngô', '105000.00', '2025-03-19 02:39:35', '2025-03-19 02:39:35', 1, 'goi-ngo-1742351975.png', 'goi-ngo', 0, 'available', 0),
(31, 'Gỏi Cá Hồi', 'Gỏi Cá Hồi', '245000.00', '2025-03-19 02:39:36', '2025-03-19 02:39:36', 1, 'goi-ca-hoi-1742351976.jpeg', 'goi-ca-hoi', 0, 'available', 0),
(32, 'Gỏi roi trộn', 'Gỏi roi trộn', '120000.00', '2025-03-19 02:39:37', '2025-03-19 02:39:37', 1, 'goi-roi-tron-1742351977.png', 'goi-roi-tron', 0, 'available', 0),
(33, 'Gỏi sò huyết Thái', 'Gỏi sò huyết Thái', '260000.00', '2025-03-19 02:39:38', '2025-03-19 02:39:38', 1, 'goi-so-huyet-thai-1742351978.png', 'goi-so-huyet-thai', 0, 'available', 0),
(34, 'Súp Tom Yum với Tôm', 'Súp Tom Yum với Tôm', '120000.00', '2025-03-19 02:39:39', '2025-03-19 02:39:39', 3, 'sup-tom-yum-voi-tom-1742351979.jpeg', 'sup-tom-yum-voi-tom', 0, 'available', 0),
(35, 'Súp thịt gà nước cốt dừa', 'Súp thịt gà nước cốt dừa', '115000.00', '2025-03-19 02:39:42', '2025-03-19 02:39:42', 3, 'sup-thit-ga-nuoc-cot-dua-1742351982.jpeg', 'sup-thit-ga-nuoc-cot-dua', 0, 'available', 0),
(36, 'Súp Tom Yum nước trong với chân gà', 'Súp Tom Yum nước trong với chân gà', '120000.00', '2025-03-19 02:39:44', '2025-03-19 02:39:44', 3, 'sup-tom-yum-nuoc-trong-voi-chan-ga-1742351984.jpeg', 'sup-tom-yum-nuoc-trong-voi-chan-ga', 0, 'available', 0),
(37, 'Súp sườn cay', 'Súp sườn cay', '225000.00', '2025-03-19 02:39:45', '2025-03-19 02:39:45', 3, 'sup-suon-cay-1742351985.jpeg', 'sup-suon-cay', 0, 'available', 0),
(38, 'Súp xoài xanh cá điêu hồng chua cay', 'Súp xoài xanh cá điêu hồng chua cay', '130000.00', '2025-03-19 02:39:46', '2025-03-19 02:39:46', 3, 'sup-xoai-xanh-ca-dieu-hong-chua-cay-1742351986.jpeg', 'sup-xoai-xanh-ca-dieu-hong-chua-cay', 0, 'available', 0),
(39, 'Bò lúc lắc với lá chanh Thái và ớt khô', 'Bò lúc lắc với lá chanh Thái và ớt khô', '200000.00', '2025-03-19 02:39:47', '2025-03-19 02:39:47', 4, 'bo-luc-lac-voi-la-chanh-thai-va-ot-kho-1742351987.jpeg', 'bo-luc-lac-voi-la-chanh-thai-va-ot-kho', 0, 'available', 0),
(40, 'Nọng heo nướng chấm sốt me', 'Nọng heo nướng chấm sốt me', '210000.00', '2025-03-19 02:39:48', '2025-03-19 02:39:48', 4, 'nong-heo-nuong-cham-sot-me-1742351988.jpeg', 'nong-heo-nuong-cham-sot-me', 0, 'available', 0),
(41, '1/2 Gà nướng kiểu Bắc Thái ăn kèm với gỏi xoài', '1/2 Gà nướng kiểu Bắc Thái ăn kèm với gỏi xoài', '225000.00', '2025-03-19 02:39:49', '2025-03-19 02:39:49', 4, '12-ga-nuong-kieu-bac-thai-an-kem-voi-goi-xoai-1742351989.jpeg', '12-ga-nuong-kieu-bac-thai-an-kem-voi-goi-xoai', 0, 'available', 0),
(42, 'Sườn nướng mật ong với sốt Nam Jim Jaew', 'Sườn nướng mật ong với sốt Nam Jim Jaew', '260000.00', '2025-03-19 02:39:50', '2025-03-19 02:39:50', 4, 'suon-nuong-mat-ong-voi-sot-nam-jim-jaew-1742351990.jpeg', 'suon-nuong-mat-ong-voi-sot-nam-jim-jaew', 0, 'available', 0),
(43, 'Cua lột cà ri trứng muối', 'Cua lột cà ri trứng muối', '395000.00', '2025-03-19 02:39:51', '2025-03-19 02:39:51', 4, 'cua-lot-ca-ri-trung-muoi-1742351991.jpeg', 'cua-lot-ca-ri-trung-muoi', 0, 'available', 0),
(44, 'Cá điêu hồng hấp sốt chanh', 'Cá điêu hồng hấp sốt chanh', '335000.00', '2025-03-19 02:39:53', '2025-03-19 02:39:53', 4, 'ca-dieu-hong-hap-sot-chanh-1742351993.jpeg', 'ca-dieu-hong-hap-sot-chanh', 0, 'available', 0),
(45, 'Sườn cay (suất 2 người)', 'Sườn cay (suất 2 người)', '385000.00', '2025-03-19 02:39:55', '2025-03-19 02:39:55', 4, 'suon-cay-suat-2-nguoi-1742351995.jpeg', 'suon-cay-suat-2-nguoi', 0, 'available', 0),
(46, 'Padthai xào tôm với trứng chần', 'Padthai xào tôm với trứng chần', '155000.00', '2025-03-19 02:39:56', '2025-03-19 02:39:56', 5, 'padthai-xao-tom-voi-trung-chan-1742351996.png', 'padthai-xao-tom-voi-trung-chan', 0, 'available', 0),
(47, 'Phở bản to xào gà và tôm kiểu Thái sốt cay', 'Phở bản to xào gà và tôm kiểu Thái sốt cay', '110000.00', '2025-03-19 02:39:58', '2025-03-19 02:39:58', 5, 'pho-ban-to-xao-ga-va-tom-kieu-thai-sot-cay-1742351998.jpeg', 'pho-ban-to-xao-ga-va-tom-kieu-thai-sot-cay', 0, 'available', 0),
(48, 'Bún cà ri cua', 'Bún cà ri cua', '170000.00', '2025-03-19 02:39:59', '2025-03-19 02:39:59', 5, 'bun-ca-ri-cua-1742351999.jpeg', 'bun-ca-ri-cua', 0, 'available', 0),
(49, 'Phở bản to xào Bò với sốt xì dầu', 'Phở bản to xào Bò với sốt xì dầu', '140000.00', '2025-03-19 02:40:01', '2025-03-19 02:40:01', 5, 'pho-ban-to-xao-bo-voi-sot-xi-dau-1742352001.jpeg', 'pho-ban-to-xao-bo-voi-sot-xi-dau', 0, 'available', 0),
(50, 'Cơm thịt Gà xe BBQ, trứng muối và trái vải', 'Cơm thịt Gà xe BBQ, trứng muối và trái vải', '150000.00', '2025-03-19 02:40:03', '2025-03-19 02:40:03', 5, 'com-thit-ga-xe-bbq-trung-muoi-va-trai-vai-1742352003.png', 'com-thit-ga-xe-bbq-trung-muoi-va-trai-vai', 0, 'available', 0),
(51, 'Cơm chiên dứa tôm và hạt điều', 'Cơm chiên dứa tôm và hạt điều', '155000.00', '2025-03-19 02:40:04', '2025-03-19 02:40:04', 5, 'com-chien-dua-tom-va-hat-dieu-1742352004.jpeg', 'com-chien-dua-tom-va-hat-dieu', 0, 'available', 0),
(52, 'Cơm chiên sốt Tom Yum', 'Cơm chiên sốt Tom Yum', '150000.00', '2025-03-19 02:40:08', '2025-03-19 02:40:08', 5, 'com-chien-sot-tom-yum-1742352008.jpeg', 'com-chien-sot-tom-yum', 0, 'available', 0),
(53, 'Mỳ bò trộn kiểu Thái', 'Mỳ bò trộn kiểu Thái', '215000.00', '2025-03-19 02:40:09', '2025-03-19 02:40:09', 5, 'my-bo-tron-kieu-thai-1742352009.jpeg', 'my-bo-tron-kieu-thai', 0, 'available', 0),
(54, 'Cơm thịt heo bằm, mực xào lá quế và trứng ốp la', 'Cơm thịt heo bằm, mực xào lá quế và trứng ốp la', '135000.00', '2025-03-19 02:40:10', '2025-03-19 02:40:10', 5, 'com-thit-heo-bam-muc-xao-la-que-va-trung-op-la-1742352010.jpeg', 'com-thit-heo-bam-muc-xao-la-que-va-trung-op-la', 0, 'available', 0),
(55, 'Miếm om tay cầm', 'Miếm om tay cầm', '155000.00', '2025-03-19 02:40:11', '2025-03-19 02:40:11', 5, 'miem-om-tay-cam-1742352011.jpeg', 'miem-om-tay-cam', 0, 'available', 0),
(56, 'Cà ri vịt nướng trái vải và dứa', 'Cà ri vịt nướng trái vải và dứa', '260000.00', '2025-03-19 02:40:12', '2025-03-19 02:40:12', 6, 'ca-ri-vit-nuong-trai-vai-va-dua-1742352012.jpeg', 'ca-ri-vit-nuong-trai-vai-va-dua', 0, 'available', 0),
(57, 'Cà ri đỏ với tôm', 'Cà ri đỏ với tôm', '170000.00', '2025-03-19 02:40:13', '2025-03-19 02:40:13', 6, 'ca-ri-do-voi-tom-1742352013.jpeg', 'ca-ri-do-voi-tom', 0, 'available', 0),
(58, 'Cà ri xanh với nấm, đậu phụ và cà tím', 'Cà ri xanh với nấm, đậu phụ và cà tím', '110000.00', '2025-03-19 02:40:14', '2025-03-19 02:40:14', 6, 'ca-ri-xanh-voi-nam-dau-phu-va-ca-tim-1742352014.jpeg', 'ca-ri-xanh-voi-nam-dau-phu-va-ca-tim', 0, 'available', 0),
(59, 'Cà ri Massaman bò Úc khoai tây và hạt điều', 'Cà ri Massaman bò Úc khoai tây và hạt điều', '250000.00', '2025-03-19 02:40:15', '2025-03-19 02:40:15', 6, 'ca-ri-massaman-bo-uc-khoai-tay-va-hat-dieu-1742352015.png', 'ca-ri-massaman-bo-uc-khoai-tay-va-hat-dieu', 0, 'available', 0),
(60, 'Tôm cà ri trứng', 'Tôm cà ri trứng', '215000.00', '2025-03-19 02:40:16', '2025-03-19 02:40:16', 6, 'tom-ca-ri-trung-1742352016.jpeg', 'tom-ca-ri-trung', 0, 'available', 0),
(61, 'Cà ri sake', 'Cà ri sake', '155000.00', '2025-03-19 02:40:17', '2025-03-19 02:40:17', 6, 'ca-ri-sake-1742352017.jpeg', 'ca-ri-sake', 0, 'available', 0),
(62, 'Xôi xoài', 'Xôi xoài', '75000.00', '2025-03-19 02:40:19', '2025-03-19 02:40:19', 6, 'xoi-xoai-1742352019.png', 'xoi-xoai', 0, 'available', 0),
(63, 'Kem dừa nhà làm', 'Kem dừa nhà làm', '65000.00', '2025-03-19 02:40:20', '2025-03-19 02:40:20', 6, 'kem-dua-nha-lam-1742352020.jpeg', 'kem-dua-nha-lam', 0, 'available', 0),
(64, 'Kem đốt sầu riêng và nếp cẩm', 'Kem đốt sầu riêng và nếp cẩm', '100000.00', '2025-03-19 02:40:21', '2025-03-19 02:40:21', 6, 'kem-dot-sau-rieng-va-nep-cam-1742352021.jpeg', 'kem-dot-sau-rieng-va-nep-cam', 0, 'available', 0),
(65, 'Pudding sữa sốt xoài', 'Pudding sữa sốt xoài', '60000.00', '2025-03-19 02:40:22', '2025-03-19 02:40:22', 6, 'pudding-sua-sot-xoai-1742352022.jpeg', 'pudding-sua-sot-xoai', 0, 'available', 0),
(66, 'Cơm nọng heo nướng với gỏi đu đủ & soup gà cốt dừa', 'Cơm nọng heo nướng với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:23', '2025-03-19 02:40:23', 8, 'com-nong-heo-nuong-voi-goi-du-du-soup-ga-cot-dua-1742352023.png', 'com-nong-heo-nuong-voi-goi-du-du-soup-ga-cot-dua', 0, 'available', 0),
(67, 'Padthai với gỏi đu đủ & soup gà cốt dừa', 'Padthai với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:25', '2025-03-19 02:40:25', 8, 'padthai-voi-goi-du-du-soup-ga-cot-dua-1742352025.png', 'padthai-voi-goi-du-du-soup-ga-cot-dua', 0, 'available', 0),
(68, 'Cơm cải làn xào heo quay với gỏi đu đủ & soup Tomyum', 'Cơm cải làn xào heo quay với gỏi đu đủ & soup Tomyum', '120000.00', '2025-03-19 02:40:26', '2025-03-19 02:40:26', 8, 'com-cai-lan-xao-heo-quay-voi-goi-du-du-soup-tomyum-1742352026.png', 'com-cai-lan-xao-heo-quay-voi-goi-du-du-soup-tomyum', 0, 'available', 0),
(69, 'Cơm curry đỏ với soup gà cốt dừa', 'Cơm curry đỏ với soup gà cốt dừa', '120000.00', '2025-03-19 02:40:27', '2025-03-19 02:40:27', 8, 'com-curry-do-voi-soup-ga-cot-dua-1742352027.png', 'com-curry-do-voi-soup-ga-cot-dua', 0, 'available', 0),
(70, 'Cơm bò lúc lắc với gỏi đu đủ & soup gà cốt dừa', 'Cơm bò lúc lắc với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:30', '2025-03-19 02:40:30', 8, 'com-bo-luc-lac-voi-goi-du-du-soup-ga-cot-dua-1742352030.png', 'com-bo-luc-lac-voi-goi-du-du-soup-ga-cot-dua', 0, 'available', 0),
(71, 'Cơm curry xanh với soup gà cốt dừa', 'Cơm curry xanh với soup gà cốt dừa', '120000.00', '2025-03-19 02:40:31', '2025-03-19 02:40:31', 8, 'com-curry-xanh-voi-soup-ga-cot-dua-1742352031.png', 'com-curry-xanh-voi-soup-ga-cot-dua', 0, 'available', 0),
(72, 'Cơm thịt gà xé BBQ, trứng muối & trái vải với gỏi đu đủ & soup gà cốt dừa', 'Cơm thịt gà xé BBQ, trứng muối & trái vải với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:33', '2025-03-19 02:40:33', 8, 'com-thit-ga-xe-bbq-trung-muoi-trai-vai-voi-goi-du-du-soup-ga-cot-dua-1742352033.png', 'com-thit-ga-xe-bbq-trung-muoi-trai-vai-voi-goi-du-du-soup-ga-cot-dua', 0, 'available', 0),
(73, 'Set Thư Thái (2-3 người)', 'Set Thư Thái (2-3 người)', '450000.00', '2025-03-19 02:40:34', '2025-03-19 02:40:34', 9, 'set-thu-thai-2-3-nguoi-1742352034.jpeg', 'set-thu-thai-2-3-nguoi', 0, 'available', 0),
(74, 'Set Sẻ Chia (4-6 người)', 'Set Sẻ Chia (4-6 người)', '610000.00', '2025-03-19 02:40:36', '2025-03-19 02:40:36', 9, 'set-se-chia-4-6-nguoi-1742352036.jpeg', 'set-se-chia-4-6-nguoi', 0, 'available', 0),
(75, 'Set Sum Vầy (6-8 người)', 'Set Sum Vầy (6-8 người)', '800000.00', '2025-03-19 02:40:37', '2025-03-19 02:40:37', 9, 'set-sum-vay-6-8-nguoi-1742352037.jpeg', 'set-sum-vay-6-8-nguoi', 0, 'available', 0),
(76, 'Bí Đỏ Chiên Giòn', 'Bí Đỏ Chiên Giòn', '75000.00', '2025-03-19 02:40:37', '2025-03-19 02:40:37', 10, 'bi-do-chien-gion-1742352037.jpeg', 'bi-do-chien-gion', 0, 'available', 0),
(77, 'Gỏi Má Heo nướng Ngó Sen', 'Gỏi Má Heo nướng Ngó Sen', '145000.00', '2025-03-19 02:40:38', '2025-03-19 02:40:38', 10, 'goi-ma-heo-nuong-ngo-sen-1742352038.jpeg', 'goi-ma-heo-nuong-ngo-sen', 0, 'available', 0),
(78, 'Lạp Bò với Tuỷ Bò nướng xúc Bánh Đa', 'Lạp Bò với Tuỷ Bò nướng xúc Bánh Đa', '135000.00', '2025-03-19 02:40:40', '2025-03-19 02:40:40', 10, 'lap-bo-voi-tuy-bo-nuong-xuc-banh-da-1742352040.jpeg', 'lap-bo-voi-tuy-bo-nuong-xuc-banh-da', 0, 'available', 0),
(79, 'Gà chiên giòn ăn kèm Gỏi Xoài chua ngọt', 'Gà chiên giòn ăn kèm Gỏi Xoài chua ngọt', '155000.00', '2025-03-19 02:40:41', '2025-03-19 02:40:41', 10, 'ga-chien-gion-an-kem-goi-xoai-chua-ngot-1742352041.jpeg', 'ga-chien-gion-an-kem-goi-xoai-chua-ngot', 0, 'available', 0),
(80, 'Soup Tomyum Thịt bằm', 'Soup Tomyum Thịt bằm', '120000.00', '2025-03-19 02:40:42', '2025-03-19 02:40:42', 10, 'soup-tomyum-thit-bam-1742352042.jpeg', 'soup-tomyum-thit-bam', 0, 'available', 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_categories`
--

CREATE TABLE `food_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_categories`
--

INSERT INTO `food_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Salads, Rau & Món Phụ', 'Salads, Rau & Món Phụ', '2025-03-10 01:06:09', '2025-03-19 02:08:30'),
(2, ' Khai vị', '\nKhai vị', '2025-03-19 02:08:40', '2025-03-19 02:08:40'),
(3, 'Súp', 'Súp', '2025-03-19 02:08:51', '2025-03-19 02:08:51'),
(4, 'Món chính', 'Món chính', '2025-03-19 02:08:59', '2025-03-19 02:08:59'),
(5, 'Mì & Cơm', 'Mì & Cơm', '2025-03-19 02:09:10', '2025-03-19 02:09:10'),
(6, 'Cà Ri', 'Cà Ri', '2025-03-19 02:09:15', '2025-03-19 02:09:15'),
(7, 'Tráng miệng', 'Tráng miệng', '2025-03-19 02:09:25', '2025-03-19 02:09:25'),
(8, 'Cơm Trưa', 'Cơm Trưa', '2025-03-19 02:09:29', '2025-03-19 02:09:29'),
(9, 'Lẩu Thái', 'Lẩu Thái', '2025-03-19 02:09:36', '2025-03-19 02:09:36'),
(10, 'Menu Mùa Thu', 'Menu Mùa Thu', '2025-03-19 02:09:41', '2025-03-19 02:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `import_requests`
--

CREATE TABLE `import_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `request_date` date NOT NULL,
  `requested_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_requests`
--

INSERT INTO `import_requests` (`id`, `request_date`, `requested_by`, `status`, `created_at`, `updated_at`) VALUES
(4, '2025-04-18', '1', 'pending', '2025-04-04 13:11:34', '2025-04-04 13:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `import_request_details`
--

CREATE TABLE `import_request_details` (
  `id` bigint UNSIGNED NOT NULL,
  `import_request_id` bigint UNSIGNED NOT NULL,
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `requested_quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_request_details`
--

INSERT INTO `import_request_details` (`id`, `import_request_id`, `ingredient_id`, `requested_quantity`, `created_at`, `updated_at`) VALUES
(5, 4, 1, 100, '2025-04-04 13:11:34', '2025-04-04 13:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_in_stock` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `minimum_threshold` decimal(8,2) DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_auto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `image`, `quantity_in_stock`, `created_at`, `updated_at`, `minimum_threshold`, `unit`, `restaurant_id`, `expiration_date`, `status`, `quantity_auto`) VALUES
(1, 'Bột tỏi', '01JPKPW1XFTPPNHS8G1XZE3W21.png', '99999999.00', '2025-03-16 13:16:42', '2025-04-04 10:12:36', '100.00', 'gram', 1, '2025-03-18', 'in_stock', '0');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_code`, `restaurant_id`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(10, 'INV-67DFF9FF77A03', 1, '245000.00', 'pending', '2025-03-23 12:09:35', '2025-03-23 12:09:35'),
(11, 'INV-67E36C3D4038A', 1, '450000.00', 'pending', '2025-03-26 02:53:49', '2025-03-26 02:55:35'),
(12, 'INV-67E36DC252F18', 1, '490000.00', 'pending', '2025-03-26 03:00:18', '2025-03-26 03:00:18'),
(13, 'INV-67E4BFA9C564B', 1, '0.00', 'pending', '2025-03-27 03:02:01', '2025-03-27 03:02:01'),
(14, 'INV-67E7EDDE7CB58', 1, '170000.00', 'pending', '2025-03-29 12:55:58', '2025-03-29 12:55:58'),
(15, 'INV-67ECA5F0F3CCA', 1, '245000.00', 'pending', '2025-04-02 02:50:24', '2025-04-02 02:54:11'),
(16, 'INV-67EF6F5F9353C', 2, '3260000.00', 'pending', '2025-04-04 05:34:23', '2025-04-04 10:35:17'),
(17, 'INV-67EFB4E8A2FE4', 2, '0.00', 'pending', '2025-04-04 10:31:04', '2025-04-04 10:31:04'),
(18, 'INV-67EFB60344B9E', 2, '310000.00', 'pending', '2025-04-04 10:35:47', '2025-04-04 10:40:26'),
(19, 'INV-67EFC96A8BBC9', 2, '160000.00', 'pending', '2025-04-04 11:58:34', '2025-04-04 11:58:34'),
(20, 'INV-67EFCA6D558B1', 2, '90000.00', 'pending', '2025-04-04 12:02:53', '2025-04-04 12:02:53'),
(21, 'INV-67EFCAAD2188D', 2, '90000.00', 'pending', '2025-04-04 12:03:57', '2025-04-04 12:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `dish_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `dish_id`, `quantity`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(4, 10, 12, 1, '245000.00', '245000.00', '2025-03-23 12:09:35', '2025-03-23 12:09:35'),
(5, 11, 12, 1, '245000.00', '245000.00', '2025-03-26 02:53:49', '2025-03-26 02:53:49'),
(6, 11, 13, 1, '205000.00', '205000.00', '2025-03-26 02:55:35', '2025-03-26 02:55:35'),
(7, 12, 12, 1, '245000.00', '245000.00', '2025-03-26 03:00:18', '2025-03-26 03:00:18'),
(8, 12, 12, 1, '245000.00', '245000.00', '2025-03-26 03:00:18', '2025-03-26 03:00:18'),
(9, 14, 14, 1, '170000.00', '170000.00', '2025-03-29 12:55:58', '2025-03-29 12:55:58'),
(10, 15, 12, 1, '245000.00', '245000.00', '2025-04-02 02:54:11', '2025-04-02 02:54:11'),
(11, 16, 12, 12, '245000.00', '2940000.00', '2025-04-04 10:31:16', '2025-04-04 10:31:16'),
(12, 16, 27, 2, '160000.00', '320000.00', '2025-04-04 10:35:17', '2025-04-04 10:35:17'),
(13, 18, 26, 1, '75000.00', '75000.00', '2025-04-04 10:35:47', '2025-04-04 10:35:47'),
(14, 18, 27, 1, '160000.00', '160000.00', '2025-04-04 10:39:27', '2025-04-04 10:39:27'),
(15, 18, 26, 1, '75000.00', '75000.00', '2025-04-04 10:40:26', '2025-04-04 10:40:26'),
(16, 19, 27, 1, '160000.00', '160000.00', '2025-04-04 11:58:34', '2025-04-04 11:58:34'),
(17, 20, 25, 1, '90000.00', '90000.00', '2025-04-04 12:02:53', '2025-04-04 12:02:53'),
(18, 21, 25, 1, '90000.00', '90000.00', '2025-04-04 12:03:57', '2025-04-04 12:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_transactions`
--

CREATE TABLE `material_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `type` enum('import','export') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material_transactions`
--

INSERT INTO `material_transactions` (`id`, `ingredient_id`, `reason`, `quantity`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'đã hỏng', 100, 'export', '2025-03-19 13:25:35', '2025-03-19 13:30:12'),
(2, 1, '123', 123, 'export', '2025-03-29 12:59:19', '2025-03-29 12:59:27'),
(3, 1, '123', 123, 'export', '2025-03-29 12:59:38', '2025-03-29 12:59:38'),
(4, 1, 'nhập hàng', 10000, 'import', '2025-04-02 03:05:21', '2025-04-02 03:05:21'),
(5, 1, 'nhập hàng', 10000, 'import', '2025-04-02 03:05:21', '2025-04-02 03:05:21'),
(6, 1, 'nhập hàng', 10000, 'import', '2025-04-02 03:06:20', '2025-04-02 03:06:20'),
(7, 1, 'nhập hàng', 10000, 'import', '2025-04-02 03:06:20', '2025-04-02 03:06:20'),
(8, 1, 'nhập hàng', 1000, 'import', '2025-04-02 03:07:26', '2025-04-02 03:07:26'),
(9, 1, 'hỏng', 1000, 'import', '2025-04-02 03:09:25', '2025-04-02 03:09:25'),
(10, 1, 'hỏng', 1000, 'export', '2025-04-02 03:09:57', '2025-04-02 03:09:57'),
(11, 1, 'nhập hàng', 10000, 'import', '2025-04-02 03:14:58', '2025-04-02 03:14:58'),
(12, 1, 'hủy', 999999, 'export', '2025-04-02 03:15:25', '2025-04-02 03:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_10_045113_create_permission_tables', 2),
(5, '2025_03_10_071927_create_ingredients_table', 3),
(6, '2025_03_10_071931_create_orders_table', 4),
(7, '2025_03_10_071934_create_order_items_table', 4),
(8, '2025_03_10_071936_create_promotions_table', 4),
(9, '2025_03_10_071943_create_restaurants_table', 5),
(10, '2025_03_10_071945_create_tables_table', 5),
(11, '2025_03_10_073539_create_food_categories_table', 6),
(12, '2025_03_10_073553_create_post_categories_table', 6),
(13, '2025_03_10_073556_create_posts_table', 6),
(14, '2025_03_10_074027_add_food_category_id_to_dishes_table', 6),
(15, '2025_03_10_081029_add_image_to_dishes_table', 7),
(16, 'a2025_03_10_081135_add_slug_and_sold_quantity_to_dishes_table', 8),
(17, '2025_03_12_175816_add_banner_and_slug_to_promotions_table', 9),
(18, '2025_03_12_180553_add_columns_to_ingredients_table', 10),
(19, '2025_03_12_181137_add_reservation_code_to_reservations_table', 11),
(20, '2025_03_12_181841_add_payment_status_to_orders_table', 12),
(21, '2025_03_12_182130_add_address_to_users_table', 13),
(22, '2025_03_12_182213_add_order_code_to_orders_table', 14),
(23, '2025_03_12_184419_add_notes_to_orders_table', 15),
(24, '2025_03_12_205620_add_column_to_reservations_table', 16),
(25, '2025_03_12_210147_add_columns_to_reservations_table', 17),
(26, '2025_03_12_210600_add_columns_to_restaurants_table', 18),
(27, '2025_03_14_184136_add_loyalty_points_to_users_table', 19),
(28, '2025_03_14_190852_add_restaurant_id_to_dishes_table', 20),
(29, '2025_03_14_202943_create_contacts_table', 20),
(30, '2025_03_15_104309_add_reservation_id_to_tables_table', 21),
(31, '2025_03_16_193606_add_short_description_to_restaurants_table', 22),
(32, '2025_03_16_194909_create_recipes_table', 23),
(33, '2025_03_16_204145_add_status_to_dishes_table', 24),
(34, '2025_03_17_094501_add_themes_settings_to_users_table', 25),
(35, '2025_03_17_200419_add_is_locked_to_users_table', 26),
(36, '2025_03_18_104024_create_table_dishes_table', 27),
(37, '2025_03_18_142451_create_invoices_table', 28),
(38, '2025_03_19_201434_add_expiration_date_to_ingredients_table', 29),
(39, '2025_03_19_202035_create_material_transactions_table', 30),
(40, '2025_03_22_101309_create_invoice_items_table', 31),
(41, '2025_03_23_091222_create_customers_table', 32),
(42, '2025_03_23_184544_add_status_to_invoices_table', 33),
(43, '2025_03_27_181245_create_import_requests_table', 34),
(44, '2025_03_27_181249_create_import_request_details_table', 34),
(45, '2025_03_27_181252_create_warehouse_receipts_table', 34),
(46, '2025_03_27_181255_create_warehouse_receipt_details_table', 34),
(47, '2025_03_27_181258_create_return_ingredients_table', 34),
(48, '2025_04_01_171308_add_restaurant_id_to_users_table', 35),
(49, '2025_04_02_083435_add_custom_fields_to_users_table', 36),
(50, '2025_04_02_083436_add_avatar_url_to_users_table', 36),
(51, '2025_04_03_090246_add_status_to_contacts_table', 37),
(52, '2025_04_03_092720_add_daily_sold_quantity_to_dishes_table', 38);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 6),
(1, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(5, 'App\\Models\\User', 18);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `restaurant_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `total_amount`, `payment_method`, `created_at`, `updated_at`, `payment_status`, `address`, `name`, `phone`, `email`, `order_code`, `notes`, `restaurant_id`) VALUES
(25, 1, 'canceled', '205000.00', 'cod', '2025-03-24 13:26:08', '2025-03-27 02:47:44', 'paid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E15D707155D', NULL, 1),
(26, NULL, 'on_the_way', '205000.00', 'cod', '2025-03-25 07:35:14', '2025-03-26 03:03:56', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E25CB2E3D0B', NULL, 1),
(28, NULL, 'pending', '115000.00', 'cod', '2025-03-26 10:32:03', '2025-03-26 10:32:03', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E3D7A3EB9F9', NULL, NULL),
(29, NULL, 'pending', '205000.00', 'bank', '2025-03-26 10:32:40', '2025-03-26 10:33:30', 'failed', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E3D7C827F12', NULL, NULL),
(30, NULL, 'pending', '170000.00', 'bank', '2025-03-26 10:36:55', '2025-03-26 10:36:55', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E3D8C754B07', NULL, NULL),
(31, NULL, 'pending', '205000.00', 'bank', '2025-03-26 10:39:35', '2025-03-26 10:40:28', 'failed', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E3D96750F8D', NULL, NULL),
(32, NULL, 'pending', '205000.00', 'bank', '2025-03-26 10:40:45', '2025-03-26 10:40:49', 'failed', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E3D9AD96DDC', NULL, NULL),
(33, NULL, 'pending', '170000.00', 'cod', '2025-03-26 10:41:10', '2025-03-26 10:41:10', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E3D9C621F2F', NULL, NULL),
(34, 1, 'canceled', '205000.00', 'bank', '2025-03-26 10:46:39', '2025-03-27 02:47:56', 'paid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E3DB0FBAC76', NULL, NULL),
(35, NULL, 'delivered', '720000.00', 'cod', '2025-03-26 11:17:06', '2025-03-26 11:46:51', 'unpaid', 'admin@gmail.comxxx', 'admin@gmail.comxxx', 'admin@gmail.comxxx', 'admin@gmail.comxxx', 'ORDER_67E3E2325DF9B', NULL, NULL),
(36, 1, 'canceled', '205000.00', 'cod', '2025-03-27 02:15:09', '2025-03-27 02:48:01', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E4B4ADF3628', NULL, NULL),
(37, 1, 'pending', '205000.00', 'cod', '2025-03-29 13:06:42', '2025-03-29 13:06:42', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67E7F06205F4D', NULL, NULL),
(38, 1, 'pending', '205000.00', 'cod', '2025-04-01 10:48:52', '2025-04-01 10:48:52', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EBC4940E2BC', NULL, NULL),
(39, 1, 'pending', '205000.00', 'bank', '2025-04-01 10:49:32', '2025-04-01 10:49:39', 'failed', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EBC4BCDC3DE', NULL, NULL),
(40, 1, 'pending', '170000.00', 'cod', '2025-04-01 10:51:42', '2025-04-01 10:51:42', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EBC53E72DD3', NULL, NULL),
(41, 1, 'pending', '170000.00', 'bank', '2025-04-01 10:51:55', '2025-04-01 10:51:58', 'failed', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EBC54B54DEC', NULL, NULL),
(42, 1, 'pending', '170000.00', 'cod', '2025-04-01 10:52:43', '2025-04-01 10:52:43', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EBC57BD5C0A', NULL, NULL),
(43, 1, 'pending', '170000.00', 'bank', '2025-04-01 10:52:52', '2025-04-01 10:52:55', 'failed', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EBC58433A15', NULL, NULL),
(45, 1, 'pending', '175000.00', 'cod', '2025-04-01 10:53:32', '2025-04-01 10:53:32', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EBC5AC9D68B', NULL, NULL),
(52, 1, 'pending', '205000.00', 'cod', '2025-04-02 01:25:16', '2025-04-02 01:25:16', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EC91FC4EC09', NULL, NULL),
(53, 1, 'confirmed', '205000.00', 'cod', '2025-04-03 02:19:05', '2025-04-04 12:14:33', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EDF0198D720', NULL, 2),
(54, 1, 'pending', '205000.00', 'cod', '2025-04-03 02:19:57', '2025-04-03 02:19:57', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EDF04D493D6', NULL, 1),
(55, 1, 'confirmed', '205000.00', 'cod', '2025-04-03 02:20:34', '2025-04-04 12:13:47', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EDF072645D8', NULL, 2),
(56, 1, 'pending', '205000.00', 'cod', '2025-04-03 02:20:44', '2025-04-03 02:20:44', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EDF07CBA02D', NULL, 1),
(57, 1, 'confirmed', '205000.00', 'cod', '2025-04-03 02:21:20', '2025-04-04 12:13:12', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EDF0A0A1EE4', NULL, 2),
(58, NULL, 'pending', '205000.00', 'cod', '2025-04-04 13:03:59', '2025-04-04 13:03:59', 'unpaid', 'admin@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', 'ORDER_67EFD8BF79C44', NULL, 1),
(59, NULL, 'pending', '205000.00', 'cod', '2025-04-04 13:04:38', '2025-04-04 13:04:38', 'unpaid', '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', 'ORDER_67EFD8E6A035F', NULL, 1),
(60, NULL, 'pending', '205000.00', 'cod', '2025-04-04 13:05:45', '2025-04-04 13:05:45', 'unpaid', '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', 'ORDER_67EFD9294AEFB', NULL, 1),
(61, NULL, 'pending', '205000.00', 'cod', '2025-04-04 13:06:51', '2025-04-04 13:06:51', 'unpaid', '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', '2509roblox@gmail.com', 'ORDER_67EFD96B419A0', NULL, 1),
(62, 1, 'pending', '520000.00', 'cod', '2025-04-04 13:08:53', '2025-04-04 13:08:53', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EFD9E5A7DEC', NULL, 1),
(63, 1, 'pending', '205000.00', 'cod', '2025-04-04 13:09:40', '2025-04-04 13:09:40', 'unpaid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67EFDA149A8C8', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `dish_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `dish_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(22, 25, 13, 1, '205000.00', '2025-03-24 13:26:08', '2025-03-24 13:26:08'),
(23, 26, 13, 1, '205000.00', '2025-03-25 07:35:14', '2025-03-25 07:35:14'),
(24, 28, 19, 1, '115000.00', '2025-03-26 10:32:03', '2025-03-26 10:32:03'),
(25, 29, 13, 1, '205000.00', '2025-03-26 10:32:40', '2025-03-26 10:32:40'),
(26, 30, 14, 1, '170000.00', '2025-03-26 10:36:55', '2025-03-26 10:36:55'),
(27, 31, 13, 1, '205000.00', '2025-03-26 10:39:35', '2025-03-26 10:39:35'),
(28, 32, 13, 1, '205000.00', '2025-03-26 10:40:45', '2025-03-26 10:40:45'),
(29, 33, 14, 1, '170000.00', '2025-03-26 10:41:10', '2025-03-26 10:41:10'),
(30, 34, 13, 1, '205000.00', '2025-03-26 10:46:39', '2025-03-26 10:46:39'),
(31, 35, 80, 6, '120000.00', '2025-03-26 11:17:06', '2025-03-26 11:17:06'),
(32, 36, 13, 1, '205000.00', '2025-03-27 02:15:10', '2025-03-27 02:15:10'),
(33, 37, 13, 1, '205000.00', '2025-03-29 13:06:42', '2025-03-29 13:06:42'),
(34, 38, 13, 1, '205000.00', '2025-04-01 10:48:52', '2025-04-01 10:48:52'),
(35, 39, 13, 1, '205000.00', '2025-04-01 10:49:32', '2025-04-01 10:49:32'),
(36, 40, 14, 1, '170000.00', '2025-04-01 10:51:42', '2025-04-01 10:51:42'),
(37, 41, 14, 1, '170000.00', '2025-04-01 10:51:55', '2025-04-01 10:51:55'),
(38, 42, 14, 1, '170000.00', '2025-04-01 10:52:43', '2025-04-01 10:52:43'),
(39, 43, 14, 1, '170000.00', '2025-04-01 10:52:52', '2025-04-01 10:52:52'),
(41, 45, 15, 1, '175000.00', '2025-04-01 10:53:32', '2025-04-01 10:53:32'),
(48, 52, 13, 1, '205000.00', '2025-04-02 01:25:16', '2025-04-02 01:25:16'),
(49, 53, 13, 1, '205000.00', '2025-04-03 02:19:05', '2025-04-03 02:19:05'),
(50, 56, 13, 1, '205000.00', '2025-04-03 02:20:44', '2025-04-03 02:20:44'),
(51, 57, 13, 1, '205000.00', '2025-04-03 02:21:20', '2025-04-03 02:21:20'),
(52, 58, 13, 1, '205000.00', '2025-04-04 13:03:59', '2025-04-04 13:03:59'),
(53, 59, 13, 1, '205000.00', '2025-04-04 13:04:38', '2025-04-04 13:04:38'),
(54, 60, 13, 1, '205000.00', '2025-04-04 13:05:45', '2025-04-04 13:05:45'),
(55, 61, 13, 1, '205000.00', '2025-04-04 13:06:51', '2025-04-04 13:06:51'),
(56, 62, 13, 2, '205000.00', '2025-04-04 13:08:53', '2025-04-04 13:08:53'),
(57, 62, 18, 1, '110000.00', '2025-04-04 13:08:53', '2025-04-04 13:08:53'),
(58, 63, 13, 1, '205000.00', '2025-04-04 13:09:40', '2025-04-04 13:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(2, 'view_any_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(3, 'create_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(4, 'update_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(5, 'delete_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(6, 'delete_any_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(7, 'view_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(8, 'view_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(9, 'create_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(10, 'update_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(11, 'restore_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(12, 'restore_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(13, 'replicate_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(14, 'reorder_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(15, 'delete_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(16, 'delete_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(17, 'force_delete_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(18, 'force_delete_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(19, 'view_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(20, 'view_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(21, 'create_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(22, 'update_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(23, 'restore_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(24, 'restore_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(25, 'replicate_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(26, 'reorder_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(27, 'delete_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(28, 'delete_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(29, 'force_delete_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(30, 'force_delete_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(31, 'view_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(32, 'view_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(33, 'create_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(34, 'update_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(35, 'restore_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(36, 'restore_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(37, 'replicate_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(38, 'reorder_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(39, 'delete_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(40, 'delete_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(41, 'force_delete_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(42, 'force_delete_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(43, 'view_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(44, 'view_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(45, 'create_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(46, 'update_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(47, 'restore_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(48, 'restore_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(49, 'replicate_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(50, 'reorder_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(51, 'delete_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(52, 'delete_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(53, 'force_delete_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(54, 'force_delete_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(55, 'view_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(56, 'view_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(57, 'create_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(58, 'update_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(59, 'restore_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(60, 'restore_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(61, 'replicate_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(62, 'reorder_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(63, 'delete_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(64, 'delete_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(65, 'force_delete_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(66, 'force_delete_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(67, 'view_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(68, 'view_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(69, 'create_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(70, 'update_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(71, 'restore_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(72, 'restore_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(73, 'replicate_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(74, 'reorder_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(75, 'delete_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(76, 'delete_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(77, 'force_delete_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(78, 'force_delete_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(79, 'view_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(80, 'view_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(81, 'create_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(82, 'update_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(83, 'restore_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(84, 'restore_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(85, 'replicate_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(86, 'reorder_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(87, 'delete_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(88, 'delete_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(89, 'force_delete_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(90, 'force_delete_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(91, 'view_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(92, 'view_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(93, 'create_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(94, 'update_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(95, 'restore_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(96, 'restore_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(97, 'replicate_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(98, 'reorder_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(99, 'delete_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(100, 'delete_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(101, 'force_delete_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(102, 'force_delete_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(103, 'view_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(104, 'view_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(105, 'create_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(106, 'update_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(107, 'restore_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(108, 'restore_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(109, 'replicate_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(110, 'reorder_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(111, 'delete_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(112, 'delete_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(113, 'force_delete_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(114, 'force_delete_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(115, 'view_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(116, 'view_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(117, 'create_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(118, 'update_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(119, 'restore_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(120, 'restore_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(121, 'replicate_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(122, 'reorder_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(123, 'delete_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(124, 'delete_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(125, 'force_delete_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(126, 'force_delete_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(127, 'view_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(128, 'view_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(129, 'create_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(130, 'update_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(131, 'restore_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(132, 'restore_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(133, 'replicate_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(134, 'reorder_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(135, 'delete_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(136, 'delete_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(137, 'force_delete_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(138, 'force_delete_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(139, 'view_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(140, 'view_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(141, 'create_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(142, 'update_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(143, 'restore_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(144, 'restore_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(145, 'replicate_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(146, 'reorder_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(147, 'delete_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(148, 'delete_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(149, 'force_delete_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(150, 'force_delete_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(151, 'view_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(152, 'view_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(153, 'create_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(154, 'update_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(155, 'restore_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(156, 'restore_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(157, 'replicate_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(158, 'reorder_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(159, 'delete_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(160, 'delete_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(161, 'force_delete_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(162, 'force_delete_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(163, 'view_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(164, 'view_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(165, 'create_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(166, 'update_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(167, 'restore_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(168, 'restore_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(169, 'replicate_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(170, 'reorder_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(171, 'delete_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(172, 'delete_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(173, 'force_delete_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(174, 'force_delete_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(175, 'page_Themes', 'web', '2025-03-18 03:47:32', '2025-03-18 03:47:32'),
(176, 'view_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(177, 'view_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(178, 'create_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(179, 'update_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(180, 'restore_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(181, 'restore_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(182, 'replicate_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(183, 'reorder_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(184, 'delete_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(185, 'delete_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(186, 'force_delete_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(187, 'force_delete_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(188, 'HSHSHS', 'web', '2025-03-24 12:33:35', '2025-03-24 12:33:35'),
(189, 'view_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(190, 'view_any_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(191, 'create_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(192, 'update_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(193, 'restore_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(194, 'restore_any_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(195, 'replicate_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(196, 'reorder_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(197, 'delete_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(198, 'delete_any_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(199, 'force_delete_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(200, 'force_delete_any_customer', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(201, 'view_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(202, 'view_any_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(203, 'create_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(204, 'update_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(205, 'restore_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(206, 'restore_any_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(207, 'replicate_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(208, 'reorder_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(209, 'delete_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(210, 'delete_any_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(211, 'force_delete_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(212, 'force_delete_any_material::transaction', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(213, 'widget_ReservationStats', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(214, 'widget_RestaurantRevenueWidget', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(215, 'widget_RevenueByLocationWidget', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(216, 'widget_LatestReservationsWidget', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(217, 'widget_PendingOrdersTable', 'web', '2025-03-27 02:52:45', '2025-03-27 02:52:45'),
(218, 'view_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(219, 'view_any_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(220, 'create_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(221, 'update_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(222, 'restore_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(223, 'restore_any_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(224, 'replicate_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(225, 'reorder_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(226, 'delete_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(227, 'delete_any_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(228, 'force_delete_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(229, 'force_delete_any_import::request', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(230, 'view_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(231, 'view_any_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(232, 'create_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(233, 'update_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(234, 'restore_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(235, 'restore_any_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(236, 'replicate_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(237, 'reorder_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(238, 'delete_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(239, 'delete_any_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(240, 'force_delete_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(241, 'force_delete_any_return::ingredient', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(242, 'view_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(243, 'view_any_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(244, 'create_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(245, 'update_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(246, 'restore_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(247, 'restore_any_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(248, 'replicate_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(249, 'reorder_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(250, 'delete_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(251, 'delete_any_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(252, 'force_delete_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(253, 'force_delete_any_warehouse::receipt', 'web', '2025-03-27 12:11:29', '2025-03-27 12:11:29'),
(254, 'view_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(255, 'view_any_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(256, 'create_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(257, 'update_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(258, 'restore_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(259, 'restore_any_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(260, 'replicate_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(261, 'reorder_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(262, 'delete_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(263, 'delete_any_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(264, 'force_delete_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(265, 'force_delete_any_dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(266, 'view_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(267, 'view_any_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(268, 'create_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(269, 'update_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(270, 'restore_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(271, 'restore_any_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(272, 'replicate_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(273, 'reorder_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(274, 'delete_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(275, 'delete_any_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(276, 'force_delete_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(277, 'force_delete_any_food::category', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(278, 'view_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(279, 'view_any_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(280, 'create_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(281, 'update_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(282, 'restore_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(283, 'restore_any_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(284, 'replicate_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(285, 'reorder_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(286, 'delete_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(287, 'delete_any_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(288, 'force_delete_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(289, 'force_delete_any_import::request', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(290, 'view_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(291, 'view_any_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(292, 'create_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(293, 'update_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(294, 'restore_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(295, 'restore_any_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(296, 'replicate_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(297, 'reorder_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(298, 'delete_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(299, 'delete_any_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(300, 'force_delete_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(301, 'force_delete_any_ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(302, 'view_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(303, 'view_any_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(304, 'create_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(305, 'update_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(306, 'restore_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(307, 'restore_any_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(308, 'replicate_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(309, 'reorder_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(310, 'delete_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(311, 'delete_any_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(312, 'force_delete_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(313, 'force_delete_any_material::transaction', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(314, 'view_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(315, 'view_any_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(316, 'create_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(317, 'update_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(318, 'restore_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(319, 'restore_any_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(320, 'replicate_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(321, 'reorder_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(322, 'delete_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(323, 'delete_any_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(324, 'force_delete_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(325, 'force_delete_any_return::ingredient', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(326, 'view_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(327, 'view_any_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(328, 'create_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(329, 'update_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(330, 'restore_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(331, 'restore_any_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(332, 'replicate_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(333, 'reorder_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(334, 'delete_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(335, 'delete_any_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(336, 'force_delete_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(337, 'force_delete_any_table', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(338, 'view_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(339, 'view_any_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(340, 'create_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(341, 'update_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(342, 'restore_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(343, 'restore_any_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(344, 'replicate_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(345, 'reorder_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(346, 'delete_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(347, 'delete_any_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(348, 'force_delete_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(349, 'force_delete_any_table::dish', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(350, 'view_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(351, 'view_any_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(352, 'create_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(353, 'update_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(354, 'restore_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(355, 'restore_any_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(356, 'replicate_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(357, 'reorder_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(358, 'delete_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(359, 'delete_any_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(360, 'force_delete_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06'),
(361, 'force_delete_any_warehouse::receipt', 'HGHHGHGH', '2025-04-03 01:12:06', '2025-04-03 01:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `banner`, `slug`) VALUES
(1, 'Giảm 10% Tất Cả Menu Từ T2-CN', '<p>&nbsp;</p><h2>Điều kiện áp dụng</h2><p><strong>1. Ưu đãi:</strong></p><p><strong>- Giảm 10% Tất cả Menu </strong>cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần <strong>T2-CN</strong>. <strong>Áp dụng</strong> <strong>hết ngày 30/06/2025.</strong></p><p><strong>2. Quy định về ưu đãi: Có, cụ thể như sau:</strong></p><p>- Không áp dụng Ưu đãi vào ngày lễ tết: <strong>Tháng 1</strong> ( Ngày 1); <strong>Tháng 2</strong> (Từ ngày 2-7 &amp; ngày 14);<strong> Tháng 3</strong> (Ngày 8); <strong>Tháng 4</strong> (Ngày 30); Tháng 5 (Ngày 1); <strong>Tháng 9</strong> (Ngày 2,3,4,10); <strong>Tháng 10</strong> (Ngày 19, 20); <strong>Tết Nguyên Đán</strong> &amp; 10/3; 15/8 Âm Lịch</p><p><strong>3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.</strong></p><p><strong>4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận</strong></p><p><strong>5. Quy định về đặt cọc:</strong></p><p>- Đoàn khách từ <strong>20 người lớn</strong> <strong>hoặc đặt món</strong> trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.</p><p><strong>6. Khác</strong></p><p>- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.</p><p>- Thời gian nhà hàng giữ chỗ tối đa: <strong>15 phút.</strong></p><p>- Nhà hàng quy định <strong>Không mang thức ăn </strong>và <strong>Tính phí khi mang thức uống</strong> từ ngoài vào.&nbsp;</p><p>Áp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".&nbsp;</p>', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-19 02:47:54', '01JPP4SR0VYC97BTMG0TMBYTYN.png', '1'),
(2, 'Giảm 10% Tất Cả Menu Từ T2-CN', '<p>&nbsp;</p><h2>Điều kiện áp dụng</h2><p><strong>1. Ưu đãi:</strong></p><p><strong>- Giảm 10% Tất cả Menu </strong>cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần <strong>T2-CN</strong>. <strong>Áp dụng</strong> <strong>hết ngày 30/06/2025.</strong></p><p><strong>2. Quy định về ưu đãi: Có, cụ thể như sau:</strong></p><p>- Không áp dụng Ưu đãi vào ngày lễ tết: <strong>Tháng 1</strong> ( Ngày 1); <strong>Tháng 2</strong> (Từ ngày 2-7 &amp; ngày 14);<strong> Tháng 3</strong> (Ngày 8); <strong>Tháng 4</strong> (Ngày 30); Tháng 5 (Ngày 1); <strong>Tháng 9</strong> (Ngày 2,3,4,10); <strong>Tháng 10</strong> (Ngày 19, 20); <strong>Tết Nguyên Đán</strong> &amp; 10/3; 15/8 Âm Lịch</p><p><strong>3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.</strong></p><p><strong>4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận</strong></p><p><strong>5. Quy định về đặt cọc:</strong></p><p>- Đoàn khách từ <strong>20 người lớn</strong> <strong>hoặc đặt món</strong> trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.</p><p><strong>6. Khác</strong></p><p>- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.</p><p>- Thời gian nhà hàng giữ chỗ tối đa: <strong>15 phút.</strong></p><p>- Nhà hàng quy định <strong>Không mang thức ăn </strong>và <strong>Tính phí khi mang thức uống</strong> từ ngoài vào.&nbsp;</p><p>Áp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".&nbsp;</p>', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-19 02:48:11', '01JPP4T9835Q0E3T0M2KHKXRR3.png', '12'),
(3, 'Giảm 10% Tất Cả Menu Từ T2-CN', 'Điều kiện áp dụng\r\n1. Ưu đãi:\r\n\r\n- Giảm 10% Tất cả Menu cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần T2-CN. Áp dụng hết ngày 30/06/2025.\r\n\r\n2. Quy định về ưu đãi: Có, cụ thể như sau:\r\n\r\n- Không áp dụng Ưu đãi vào ngày lễ tết: Tháng 1 ( Ngày 1); Tháng 2 (Từ ngày 2-7 & ngày 14); Tháng 3 (Ngày 8); Tháng 4 (Ngày 30); Tháng 5 (Ngày 1); Tháng 9 (Ngày 2,3,4,10); Tháng 10 (Ngày 19, 20); Tết Nguyên Đán & 10/3; 15/8 Âm Lịch\r\n\r\n3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.\r\n\r\n4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận\r\n\r\n5. Quy định về đặt cọc:\r\n\r\n- Đoàn khách từ 20 người lớn hoặc đặt món trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.\r\n\r\n6. Khác\r\n\r\n- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.\r\n\r\n- Thời gian nhà hàng giữ chỗ tối đa: 15 phút.\r\n\r\n- Nhà hàng quy định Không mang thức ăn và Tính phí khi mang thức uống từ ngoài vào. \r\n\r\nÁp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-19 02:48:21', '01JPP4TK5BMAHTT60S3HAM1SSR.png', '123'),
(4, 'Giảm 10% Tất Cả Menu Từ T2-CN', 'Điều kiện áp dụng\r\n1. Ưu đãi:\r\n\r\n- Giảm 10% Tất cả Menu cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần T2-CN. Áp dụng hết ngày 30/06/2025.\r\n\r\n2. Quy định về ưu đãi: Có, cụ thể như sau:\r\n\r\n- Không áp dụng Ưu đãi vào ngày lễ tết: Tháng 1 ( Ngày 1); Tháng 2 (Từ ngày 2-7 & ngày 14); Tháng 3 (Ngày 8); Tháng 4 (Ngày 30); Tháng 5 (Ngày 1); Tháng 9 (Ngày 2,3,4,10); Tháng 10 (Ngày 19, 20); Tết Nguyên Đán & 10/3; 15/8 Âm Lịch\r\n\r\n3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.\r\n\r\n4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận\r\n\r\n5. Quy định về đặt cọc:\r\n\r\n- Đoàn khách từ 20 người lớn hoặc đặt món trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.\r\n\r\n6. Khác\r\n\r\n- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.\r\n\r\n- Thời gian nhà hàng giữ chỗ tối đa: 15 phút.\r\n\r\n- Nhà hàng quy định Không mang thức ăn và Tính phí khi mang thức uống từ ngoài vào. \r\n\r\nÁp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-12 12:25:55', '01JP5533NZPF5JETB29YPD261A.png', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` bigint UNSIGNED NOT NULL,
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `dish_id`, `ingredient_id`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 12, 1, '11.00', '2025-04-02 02:58:58', '2025-04-02 02:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `number_of_people` int NOT NULL,
  `reservation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed','confirmed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reservation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservation_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `restaurant_id`, `number_of_people`, `reservation_time`, `status`, `created_at`, `updated_at`, `reservation_code`, `notes`, `name`, `phone`, `reservation_day`) VALUES
(9, 1, 1, 1, '19:00:00', 'confirmed', '2025-03-17 10:52:33', '2025-03-18 03:36:31', 'RESERVATION_67D8018839DEA', '123', 'admin', '0999999999', '2025-03-20'),
(10, 1, 2, 1, '18:03:00', 'completed', '2025-03-17 11:03:36', '2025-04-04 12:21:35', 'RESERVATION_67D8018839DEE', '23', 'admin@gmail.com', '0999999999', '2025-03-17'),
(11, 1, 1, 1, '18:07', 'canceled', '2025-03-17 11:07:41', '2025-03-17 12:38:48', 'RESERVATION_67D8027D45909', '123', 'admin@gmail.com1132', 'admin@gmail.com123', '2025-03-17'),
(12, 1, 1, 1, '18:08', 'canceled', '2025-03-17 11:08:31', '2025-03-17 12:39:18', 'RESERVATION_67D802AFB99DB', NULL, 'admin@gmail.com', 'admin@gmail.com', '2025-03-17'),
(13, 1, 1, 1, '20:03', 'canceled', '2025-03-17 13:03:21', '2025-03-27 02:50:50', 'RESERVATION_67D81D9985752', NULL, 'admin@gmail.com', 'admin@gmail.com', '2025-03-17'),
(14, 1, 1, 1, '10:12', 'canceled', '2025-03-18 03:12:40', '2025-03-27 02:50:59', 'RESERVATION_67D8E4A855DAD', NULL, 'admin@gmail.com', 'admin@gmail.com', '2025-03-18'),
(15, NULL, 1, 1, '20:06', 'pending', '2025-03-22 13:06:27', '2025-03-22 13:06:27', 'RESERVATION_67DEB5D38F49D', '123', '123', '123', '2025-03-22'),
(16, 1, 1, 1, '18:53', 'canceled', '2025-03-23 11:54:13', '2025-03-27 02:51:02', 'RESERVATION_67DFF665B1266', NULL, 'admin@gmail.com', 'admin@gmail.com', '2025-03-23'),
(17, 1, 1, 1, '18:56', 'canceled', '2025-03-23 11:56:58', '2025-03-27 02:51:22', 'RESERVATION_67DFF70AA6ACD', '2509roblox@gmail.com', 'admin@gmail.com', 'admin@gmail.com', '2025-03-23'),
(18, 1, 1, 1, '10:12', 'canceled', '2025-03-26 03:12:42', '2025-03-27 02:51:31', 'RESERVATION_67E370AAEE2A1', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', '2025-03-26'),
(19, 1, 1, 1, '09:55', 'pending', '2025-03-27 02:55:59', '2025-03-27 02:55:59', 'RESERVATION_67E4BE3FA73D1', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', '2025-03-27'),
(20, NULL, 1, 1, '17:35', 'pending', '2025-03-27 10:35:31', '2025-03-27 10:35:31', 'RESERVATION_67E529F3286D4', '2508roblox@gmail.com', '2508roblox@gmail.com', '2508roblox@gmail.com', '2025-03-27'),
(21, 1, 1, 1, '17:13', 'pending', '2025-04-04 10:13:48', '2025-04-04 10:13:48', 'RESERVATION_67EFB0DC21730', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(22, 1, 1, 1, '17:14', 'pending', '2025-04-04 10:14:49', '2025-04-04 10:14:49', 'RESERVATION_67EFB119363B9', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(23, 1, 1, 1, '17:16', 'pending', '2025-04-04 10:16:37', '2025-04-04 10:16:37', 'RESERVATION_67EFB185A022B', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(24, 1, 1, 1, '17:19', 'pending', '2025-04-04 10:19:41', '2025-04-04 10:19:41', 'RESERVATION_67EFB23D1DEF5', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(25, 1, 1, 1, '17:21', 'pending', '2025-04-04 10:21:34', '2025-04-04 10:21:34', 'RESERVATION_67EFB2AE469E5', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(26, 1, 1, 1, '17:21', 'pending', '2025-04-04 10:21:48', '2025-04-04 10:21:48', 'RESERVATION_67EFB2BC9BD37', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(27, 1, 1, 1, '17:23', 'pending', '2025-04-04 10:23:09', '2025-04-04 10:23:09', 'RESERVATION_67EFB30D5F4AD', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(28, 1, 1, 1, '19:15', 'pending', '2025-04-04 12:15:33', '2025-04-04 12:15:33', 'RESERVATION_67EFCD657160A', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(29, 1, 1, 1, '20:21', 'pending', '2025-04-04 13:18:33', '2025-04-04 13:18:33', 'RESERVATION_67EFDC2960866', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-04'),
(30, 1, 1, 1, '20:24', 'pending', '2025-04-04 13:19:39', '2025-04-04 13:19:39', 'RESERVATION_67EFDC6B040B6', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-24'),
(31, 1, 1, 1, '20:28', 'pending', '2025-04-04 13:26:57', '2025-04-04 13:26:57', 'RESERVATION_67EFDE2186F9C', NULL, 'Trần Lê Huy Hoàng', '0999999999 a', '2025-04-11');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `map` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `image`, `location`, `description`, `short_description`, `created_at`, `updated_at`, `map`, `phone`, `email`) VALUES
(1, 'ME ME HAI BÀ TRƯNG', '01JPP4MQBSQNCW5CZ0CSH0NEBY.png', '51A MAI HẮC ĐẾ', '<p><strong>Giới thiệu về IZAKAYA UNATOTO</strong></p><p>Chào mừng bạn đến với <strong>IZAKAYA UNATOTO</strong>, một trong những điểm đến ẩm thực nổi bật nhất dành cho những tín đồ yêu thích <strong>ẩm thực Nhật Bản</strong>. Tại đây, món <strong>lươn nướng</strong> không chỉ đơn thuần là một món ăn, mà còn là một biểu tượng của <strong>dinh dưỡng và sự tinh tế</strong> trong ẩm thực.</p><p>Với không gian <strong>ấm cúng</strong> và thiết kế mang đậm văn hóa Nhật Bản, IZAKAYA UNATOTO tạo ra một bầu không khí thân thiện, nơi thực khách có thể thư giãn và thưởng thức những món ăn tuyệt vời. Mỗi món lươn được chế biến từ những nguyên liệu tươi ngon nhất, mang đến hương vị đậm đà và hấp dẫn.</p><p>Điều đặc biệt tại IZAKAYA UNATOTO là sự kết hợp giữa <strong>truyền thống và sáng tạo</strong>. Đội ngũ đầu bếp tài năng của chúng tôi không ngừng nỗ lực để mang đến những món ăn không chỉ ngon mà còn đẹp mắt, tạo nên những trải nghiệm ẩm thực khó quên.</p><p>Hãy đến với IZAKAYA UNATOTO để cùng khám phá <strong>hương vị độc đáo</strong> và tận hưởng sự phục vụ tận tình từ đội ngũ nhân viên chuyên nghiệp. Chúng tôi tin rằng mỗi bữa ăn tại đây sẽ là một hành trình ẩm thực đáng nhớ, làm hài lòng cả những thực khách khó tính nhất!</p>', 'Chào mừng bạn đến với IZAKAYA UNATOTO, một trong những điểm đến ẩm thực nổi bật nhất dành cho những tín đồ yêu thích ẩm thực Nhật Bản. Tại đây, món lươn nướng không chỉ đơn thuần là một món ăn, mà còn là một biểu tượng của dinh dưỡng và sự tinh tế trong ẩm thực.', '2025-03-10 01:07:59', '2025-03-19 02:45:09', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d95865.71390934997!2d106.52494024335938!3d10.768954500000017!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f52d2e999fb%3A0x2c2739f3ca688d63!2sIzakaya%20Unatoto%20Ba%20Th%C3%A1ng%20Hai!5e1!3m2!1svi!2s!4v1741958363480!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '02839369986', 'a@a'),
(2, '​ME ME CẦU GIẤY', '01JPP4PFKHN2RWC5ESGV3P65D3.png', ' 34T HOÀNG ĐẠO THUÝ', NULL, NULL, '2025-03-18 08:35:42', '2025-03-19 02:46:07', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2487.9230920214663!2d105.80031227296512!3d21.008264488486606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ad611f5ebc87%3A0x3ed01a9b830aa8f!2sMe%20Me%20Bistro!5e1!3m2!1svi!2s!4v1742352363454!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '02839369986', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `return_ingredients`
--

CREATE TABLE `return_ingredients` (
  `id` bigint UNSIGNED NOT NULL,
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `returned_quantity` int NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_ingredients`
--

INSERT INTO `return_ingredients` (`id`, `ingredient_id`, `returned_quantity`, `reason`, `created_at`, `updated_at`) VALUES
(2, 1, 1000, 'hỏng', '2025-04-02 03:09:25', '2025-04-02 03:09:25'),
(3, 1, 1000, 'hỏng', '2025-04-02 03:09:57', '2025-04-02 03:09:57'),
(4, 1, 999999, 'hủy', '2025-04-02 03:15:25', '2025-04-02 03:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', NULL, '2025-03-09 21:56:43', '2025-03-16 13:26:46'),
(3, 'Bếp trưởng', 'web', NULL, '2025-03-15 03:55:44', '2025-04-03 01:12:49'),
(4, 'Kế toán', 'web', NULL, '2025-03-15 03:55:54', '2025-03-15 03:55:54'),
(5, 'Nhân viên thu ngân', 'web', NULL, '2025-03-15 03:56:03', '2025-03-15 03:56:03'),
(6, 'Nhân viên phục vụ', 'web', NULL, '2025-03-15 03:56:16', '2025-03-15 03:56:16'),
(7, 'Nhân viên bếp', 'web', NULL, '2025-03-15 03:56:23', '2025-03-15 03:56:23'),
(8, 'super_admin', 'web', NULL, '2025-03-27 02:52:45', '2025-03-27 02:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(123, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(128, 3),
(129, 3),
(130, 3),
(131, 3),
(132, 3),
(133, 3),
(134, 3),
(135, 3),
(136, 3),
(137, 3),
(138, 3),
(176, 3),
(177, 3),
(178, 3),
(179, 3),
(180, 3),
(181, 3),
(182, 3),
(183, 3),
(184, 3),
(185, 3),
(186, 3),
(187, 3),
(201, 3),
(202, 3),
(203, 3),
(204, 3),
(205, 3),
(206, 3),
(207, 3),
(208, 3),
(209, 3),
(210, 3),
(211, 3),
(212, 3),
(218, 3),
(219, 3),
(220, 3),
(221, 3),
(222, 3),
(223, 3),
(224, 3),
(225, 3),
(226, 3),
(227, 3),
(228, 3),
(229, 3),
(230, 3),
(231, 3),
(232, 3),
(233, 3),
(234, 3),
(235, 3),
(236, 3),
(237, 3),
(238, 3),
(239, 3),
(240, 3),
(241, 3),
(242, 3),
(243, 3),
(244, 3),
(245, 3),
(246, 3),
(247, 3),
(248, 3),
(249, 3),
(250, 3),
(251, 3),
(252, 3),
(253, 3),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(19, 5),
(20, 5),
(21, 5),
(22, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 5),
(47, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(52, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(57, 5),
(58, 5),
(59, 5),
(60, 5),
(61, 5),
(62, 5),
(63, 5),
(64, 5),
(65, 5),
(66, 5),
(79, 5),
(80, 5),
(81, 5),
(82, 5),
(83, 5),
(84, 5),
(85, 5),
(86, 5),
(115, 5),
(116, 5),
(117, 5),
(118, 5),
(119, 5),
(120, 5),
(121, 5),
(122, 5),
(123, 5),
(124, 5),
(125, 5),
(126, 5),
(127, 5),
(163, 5),
(176, 5),
(177, 5),
(189, 5),
(190, 5),
(191, 5),
(192, 5),
(193, 5),
(194, 5),
(195, 5),
(196, 5),
(197, 5),
(198, 5),
(199, 5),
(200, 5),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8),
(6, 8),
(7, 8),
(8, 8),
(9, 8),
(10, 8),
(11, 8),
(12, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(17, 8),
(18, 8),
(19, 8),
(20, 8),
(21, 8),
(22, 8),
(23, 8),
(24, 8),
(25, 8),
(26, 8),
(27, 8),
(28, 8),
(29, 8),
(30, 8),
(31, 8),
(32, 8),
(33, 8),
(34, 8),
(35, 8),
(36, 8),
(37, 8),
(38, 8),
(39, 8),
(40, 8),
(41, 8),
(42, 8),
(43, 8),
(44, 8),
(45, 8),
(46, 8),
(47, 8),
(48, 8),
(49, 8),
(50, 8),
(51, 8),
(52, 8),
(53, 8),
(54, 8),
(55, 8),
(56, 8),
(57, 8),
(58, 8),
(59, 8),
(60, 8),
(61, 8),
(62, 8),
(63, 8),
(64, 8),
(65, 8),
(66, 8),
(79, 8),
(80, 8),
(81, 8),
(82, 8),
(83, 8),
(84, 8),
(85, 8),
(86, 8),
(87, 8),
(88, 8),
(89, 8),
(90, 8),
(91, 8),
(92, 8),
(93, 8),
(94, 8),
(95, 8),
(96, 8),
(97, 8),
(98, 8),
(99, 8),
(100, 8),
(101, 8),
(102, 8),
(103, 8),
(104, 8),
(105, 8),
(106, 8),
(107, 8),
(108, 8),
(109, 8),
(110, 8),
(111, 8),
(112, 8),
(113, 8),
(114, 8),
(115, 8),
(116, 8),
(117, 8),
(118, 8),
(119, 8),
(120, 8),
(121, 8),
(122, 8),
(123, 8),
(124, 8),
(125, 8),
(126, 8),
(127, 8),
(128, 8),
(129, 8),
(130, 8),
(131, 8),
(132, 8),
(133, 8),
(134, 8),
(135, 8),
(136, 8),
(137, 8),
(138, 8),
(163, 8),
(164, 8),
(165, 8),
(166, 8),
(167, 8),
(168, 8),
(169, 8),
(170, 8),
(171, 8),
(172, 8),
(173, 8),
(174, 8),
(175, 8),
(176, 8),
(177, 8),
(178, 8),
(179, 8),
(180, 8),
(181, 8),
(182, 8),
(183, 8),
(184, 8),
(185, 8),
(186, 8),
(187, 8),
(189, 8),
(190, 8),
(191, 8),
(192, 8),
(193, 8),
(194, 8),
(195, 8),
(196, 8),
(197, 8),
(198, 8),
(199, 8),
(200, 8),
(201, 8),
(202, 8),
(203, 8),
(204, 8),
(205, 8),
(206, 8),
(207, 8),
(208, 8),
(209, 8),
(210, 8),
(211, 8),
(212, 8),
(213, 8),
(214, 8),
(215, 8),
(216, 8),
(217, 8),
(218, 8),
(219, 8),
(220, 8),
(221, 8),
(222, 8),
(223, 8),
(224, 8),
(225, 8),
(226, 8),
(227, 8),
(228, 8),
(229, 8),
(230, 8),
(231, 8),
(232, 8),
(233, 8),
(234, 8),
(235, 8),
(236, 8),
(237, 8),
(238, 8),
(239, 8),
(240, 8),
(241, 8),
(242, 8),
(243, 8),
(244, 8),
(245, 8),
(246, 8),
(247, 8),
(248, 8),
(249, 8),
(250, 8),
(251, 8),
(252, 8),
(253, 8);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1riocSFPxiCm2lPA3kgj717LzvdCUIt3Ekrg4TEL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWEZyejgxVFdMSU1taWNyNXpNSzZPN2NVTVJ0dWtKVTNDZkNaTFlrVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGVja291dD9wZF9pZD0xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTc6InZlcmlmaWNhdGlvbl9jb2RlIjtpOjMxNTExMDtzOjE4OiJ2ZXJpZmljYXRpb25fZW1haWwiO3M6MjA6IjI1MDlyb2Jsb3hAZ21haWwuY29tIjtzOjE0OiJlbWFpbF92ZXJpZmllZCI7YjoxO30=', 1743772108),
('xNLzxNrAuemdBDeqekyMZMdSgxWQQhWrjTFrxilw', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQ2pCWHJFUm1wN3hxUFVHZmJJQmllNmN0OXV4c3Q3cjNEZGhRRWNOYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkYWlTOXVOeWt6TlZiN2xRdUI4SnRJLnhEZjI3cTgxanhIeFFIZ2dSSG40ZDJnQ2VKQ1l5SnEiO3M6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1743773275);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `table_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_guest` int NOT NULL DEFAULT '0',
  `reservation_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `restaurant_id`, `table_code`, `status`, `number_guest`, `reservation_id`, `created_at`, `updated_at`) VALUES
(1, 1, '123', 'available', 4, NULL, '2025-03-15 03:54:38', '2025-03-29 12:55:58'),
(2, 2, 'TABLE_1763', 'occupied', 1, 9, '2025-04-04 10:13:18', '2025-04-04 10:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `table_dishes`
--

CREATE TABLE `table_dishes` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` bigint UNSIGNED NOT NULL,
  `table_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_dishes`
--

INSERT INTO `table_dishes` (`id`, `dish_id`, `table_id`, `quantity`, `status`, `order_code`, `invoice_code`, `created_at`, `updated_at`) VALUES
(31, 15, 1, 1, 'pending', NULL, NULL, '2025-04-02 02:45:17', '2025-04-02 02:45:17'),
(32, 13, NULL, 1, 'pending', 'ORDER_67EDF0198D720', NULL, '2025-04-03 02:19:05', '2025-04-03 02:19:05'),
(33, 13, NULL, 1, 'pending', 'ORDER_67EDF07CBA02D', NULL, '2025-04-03 02:20:44', '2025-04-03 02:20:44'),
(34, 13, NULL, 1, 'pending', 'ORDER_67EDF0A0A1EE4', NULL, '2025-04-03 02:21:20', '2025-04-03 02:21:20'),
(35, 25, NULL, 1, 'pending', NULL, NULL, '2025-04-04 12:03:57', '2025-04-04 12:03:57'),
(36, 13, NULL, 1, 'pending', NULL, NULL, '2025-04-04 12:14:33', '2025-04-04 12:14:33'),
(37, 13, NULL, 1, 'pending', 'ORDER_67EFD8BF79C44', NULL, '2025-04-04 13:03:59', '2025-04-04 13:03:59'),
(38, 13, NULL, 1, 'pending', 'ORDER_67EFD8E6A035F', NULL, '2025-04-04 13:04:38', '2025-04-04 13:04:38'),
(39, 13, NULL, 1, 'pending', 'ORDER_67EFD9294AEFB', NULL, '2025-04-04 13:05:45', '2025-04-04 13:05:45'),
(40, 13, NULL, 1, 'pending', 'ORDER_67EFD96B419A0', NULL, '2025-04-04 13:06:51', '2025-04-04 13:06:51'),
(41, 13, NULL, 2, 'pending', 'ORDER_67EFD9E5A7DEC', NULL, '2025-04-04 13:08:53', '2025-04-04 13:08:53'),
(42, 18, NULL, 1, 'pending', 'ORDER_67EFD9E5A7DEC', NULL, '2025-04-04 13:08:53', '2025-04-04 13:08:53'),
(43, 13, NULL, 1, 'pending', 'ORDER_67EFDA149A8C8', NULL, '2025-04-04 13:09:40', '2025-04-04 13:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loyalty_points` int NOT NULL DEFAULT '0',
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` json DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `restaurant_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_locked`, `phone`, `created_at`, `updated_at`, `address`, `loyalty_points`, `theme`, `theme_color`, `custom_fields`, `avatar_url`) VALUES
(1, 2, 'admin@gmail.com', 'admin@gmail.com', NULL, '$2y$12$aiS9uNykzNVb7lQuB8JtI.xDf27q81jxHxQHggRHn4d2gCeJCYyJq', 'QKfgxSDjtZwBz8ErxyTuWUK3BjEDx1dundwozLpHVTsDhO7jF44xX75j3k3G', 0, 'admin@gmail.com', '2025-03-09 21:32:39', '2025-04-04 10:26:41', 'admin@gmail.com', 50000, 'default', NULL, NULL, '01JQT3JK81A9NY0PYW4PF98FER.jpg'),
(6, 1, 'beptruong@gmail.com', 'beptruong@gmail.com', NULL, '$2y$12$AnKMLUKYHLoinNGtE/nrtu.gTPFi3XbDCaKYv.nwHSJ3EfL3cAr1a', NULL, 0, NULL, '2025-03-16 13:25:36', '2025-04-01 10:14:52', NULL, 0, 'default', NULL, NULL, NULL),
(14, 2, '2509roblox@gmail.com', '2509roblox@gmail.com', NULL, '$2y$12$AIqcdT2FOWJyQlEjJeoB6eBwKzfH2TBVFeKELV8dIejwtLFBkHxCK', 'UC4u0tOQUhzRCwHd9P2aFhUXlAAgll3pxvDch0QcM5NpX8mLJ64q52JAGfxn', 0, '0999999999', '2025-03-26 11:14:13', '2025-04-02 02:09:38', NULL, 0, 'default', NULL, NULL, NULL),
(15, NULL, '2508roblox@gmail.com', '2508roblox@gmail.com', NULL, '$2y$12$3K8JslhaDpUXWdd63cbjKeP9bMQn1Rx1fZX4AkPHzUzS6TIVZxKFC', NULL, 0, '1111111111', '2025-04-02 02:00:34', '2025-04-02 02:00:34', NULL, 0, 'default', NULL, NULL, NULL),
(16, 1, 'user', '2507roblox@gmail.com', NULL, '$2y$12$UEQqZHPiSaKlzdNT22YdcObXB8ZchkV7zt6EGp4U.EIW07uUNSkOi', NULL, 0, NULL, '2025-04-02 02:01:55', '2025-04-02 02:01:55', NULL, 0, 'default', NULL, NULL, NULL),
(17, 2, 'user', 'dohongba03@gmail.com', NULL, '$2y$12$cCTCrgtWWWYrbwNOTLOLFOD4M.O6aVazRcNcxOswaEd.MqXp32tE.', NULL, 0, NULL, '2025-04-03 02:31:38', '2025-04-03 02:31:38', NULL, 0, 'default', NULL, NULL, NULL),
(18, NULL, 'user', 'tranthutrang123@gmail.com', NULL, '$2y$12$mBlWZgG.4zx1jovz44b9GubZ1gBT5kf9MUYkavUIgpKVJelgmZjp2', NULL, 0, NULL, '2025-04-03 02:32:30', '2025-04-03 02:33:55', NULL, 0, 'default', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_receipts`
--

CREATE TABLE `warehouse_receipts` (
  `id` bigint UNSIGNED NOT NULL,
  `import_date` date NOT NULL,
  `imported_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_receipts`
--

INSERT INTO `warehouse_receipts` (`id`, `import_date`, `imported_by`, `supplier`, `created_at`, `updated_at`) VALUES
(1, '2025-03-28', '1', 'HCM', '2025-03-27 11:41:05', '2025-03-27 11:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_receipt_details`
--

CREATE TABLE `warehouse_receipt_details` (
  `id` bigint UNSIGNED NOT NULL,
  `warehouse_receipt_id` bigint UNSIGNED NOT NULL,
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `actual_quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_receipt_details`
--

INSERT INTO `warehouse_receipt_details` (`id`, `warehouse_receipt_id`, `ingredient_id`, `actual_quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1000, '1.00', '2025-03-27 12:07:55', '2025-03-27 12:07:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dishes_slug_unique` (`slug`),
  ADD KEY `dishes_food_category_id_foreign` (`food_category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food_categories`
--
ALTER TABLE `food_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_requests`
--
ALTER TABLE `import_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_request_details`
--
ALTER TABLE `import_request_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_request_details_import_request_id_foreign` (`import_request_id`),
  ADD KEY `import_request_details_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredients_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_code_unique` (`invoice_code`),
  ADD KEY `invoices_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_dish_id_foreign` (`dish_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_transactions`
--
ALTER TABLE `material_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_transactions_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_dish_id_foreign` (`dish_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promotions_slug_unique` (`slug`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_dish_id_foreign` (`dish_id`),
  ADD KEY `recipes_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reservations_reservation_code_unique` (`reservation_code`),
  ADD KEY `reservations_user_id_foreign` (`user_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_ingredients`
--
ALTER TABLE `return_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_ingredients_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `table_dishes`
--
ALTER TABLE `table_dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_dishes_dish_id_foreign` (`dish_id`),
  ADD KEY `table_dishes_table_id_foreign` (`table_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouse_receipts`
--
ALTER TABLE `warehouse_receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_receipt_details`
--
ALTER TABLE `warehouse_receipt_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_receipt_details_warehouse_receipt_id_foreign` (`warehouse_receipt_id`),
  ADD KEY `warehouse_receipt_details_ingredient_id_foreign` (`ingredient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_categories`
--
ALTER TABLE `food_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `import_requests`
--
ALTER TABLE `import_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `import_request_details`
--
ALTER TABLE `import_request_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `material_transactions`
--
ALTER TABLE `material_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `return_ingredients`
--
ALTER TABLE `return_ingredients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_dishes`
--
ALTER TABLE `table_dishes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `warehouse_receipts`
--
ALTER TABLE `warehouse_receipts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouse_receipt_details`
--
ALTER TABLE `warehouse_receipt_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_food_category_id_foreign` FOREIGN KEY (`food_category_id`) REFERENCES `food_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `import_request_details`
--
ALTER TABLE `import_request_details`
  ADD CONSTRAINT `import_request_details_import_request_id_foreign` FOREIGN KEY (`import_request_id`) REFERENCES `import_requests` (`id`),
  ADD CONSTRAINT `import_request_details_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_dish_id_foreign` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `material_transactions`
--
ALTER TABLE `material_transactions`
  ADD CONSTRAINT `material_transactions_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_dish_id_foreign` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_dish_id_foreign` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipes_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `return_ingredients`
--
ALTER TABLE `return_ingredients`
  ADD CONSTRAINT `return_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_dishes`
--
ALTER TABLE `table_dishes`
  ADD CONSTRAINT `table_dishes_dish_id_foreign` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `table_dishes_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse_receipt_details`
--
ALTER TABLE `warehouse_receipt_details`
  ADD CONSTRAINT `warehouse_receipt_details_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `warehouse_receipt_details_warehouse_receipt_id_foreign` FOREIGN KEY (`warehouse_receipt_id`) REFERENCES `warehouse_receipts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
