-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 04:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikeshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cateName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cateName`) VALUES
(1, 'Xe Đạp Trẻ Em'),
(2, 'Xe Đạp Thể Thao'),
(3, 'Xe Đạp Địa Hình'),
(4, 'Xe Đạp Touring'),
(5, 'Xe Đạp Đua'),
(6, 'Xe Đạp Điện'),
(7, 'Giảm Giá Ưu Đãi'),
(8, 'Xe Đạp Phổ Thông'),
(9, 'Phụ Kiện Xe Đạp'),
(10, 'Thương Hiệu Xe Đạp'),
(11, 'Bán Chạy Nhất');

-- --------------------------------------------------------

--
-- Table structure for table `google_users`
--

CREATE TABLE `google_users` (
  `id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `google_users`
--

INSERT INTO `google_users` (`id`, `name`, `email`, `address`, `picture`, `passWord`) VALUES
('107946748490602800148', 'Vũ Nguyễn Long', '22130329@st.hcmuaf.edu.vn', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocKR0KY8dd0nyp4ZfRwxNuRRR8kYBhYqKVLVPERdj5aZx5uovQ=s96-c', NULL),
('100952264124091285511', 'Vũ Nguyễn', 'lvu031028@gmail.com', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJJZlyETXqSVXtsrO5gOo8_Crymz0A9xaXoEvP2aFN9KvnrDg=s96-c', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `promotionId` int(11) DEFAULT NULL,
  `shippingStatus` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `method` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `proName` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `cateId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `proName`, `price`, `description`, `thumb`, `quantity`, `createdAt`, `cateId`) VALUES
(1, 'Xe Đạp Trẻ Em Bé Trai Hector Polo 12 Inch', 1450000, 'Thiết kế năng động, sử dụng các hình ảnh đáng yêu phù hợp các bé gái', 'assets/img/shukyo-nu-hong.jpg', 20, '2025-01-10 00:20:31', 1),
(2, 'Xe Đạp Trẻ Em Xaming Nữ 2 Gióng 14 Inch', 4599000, 'Thiết kế nữ tính và màu sắc tươi sáng, thu hút các bé gái', 'assets/img/shukyo-nam-xanh.jpg', 15, '2025-01-11 19:13:14', 1),
(3, 'Xe Đạp Trẻ Em Bé Trai Hector Polo 12 Inch', 1450000, 'Thiết kế năng động, sử dụng các hình ảnh đáng yêu phù hợp các bé gái', 'assets/img/JsXiong-xam.jpg', 10, '2025-01-11 19:13:58', 1),
(4, 'Xe Đạp Trẻ Em Bé Gái Shukyo S1 12 Inch', 990000, 'Thiết kế thoải mái, nữ tính phù hợp dành cho các bé gái', 'assets/img/melody-hong.jpg', 12, '2025-01-11 19:14:41', 1),
(5, 'Xe Đạp Trẻ Em Bé Trai Shukyo K2 14 Inch', 1050000, 'Thiết kế năng động, màu sắc nổi bật phù hợp cho các bé trai', 'assets/img/xaming-nu-hong.jpg', 8, '2025-01-11 19:15:21', 1),
(6, 'Xe Đạp Cho Bé Gái JsXiong 2305 12 Inch', 1550000, 'Xe Đạp Cho Bé Gái JsXiong 2305 12 Inch được thiết kế xinh xắn', 'assets/img/hector-luna-hong.jpg', 13, '2025-01-11 19:16:02', 1),
(7, 'Xe Đạp Trẻ Em Bé Gái Melody Hello Kitty 14 Inch', 1390000, 'Thiết kế ấn tượng, phù hợp sở thích các bé gái', 'assets/img/subasa-vang.jpg', 11, '2025-01-11 19:16:42', 1),
(8, 'Xe Đạp Trẻ Em Bé Gái Xaming Mini 20 Inch', 1850000, 'Thiết kế nữ tính phù hợp với các bé gái', 'assets/img/bors-xanh.jpg', 8, '2025-01-11 19:17:20', 1),
(9, 'Xe Đạp Đua Papylus PR700s – Khung Nhôm | Phanh Đĩa Cơ | Shimano Giá Rẻ', 3890000, 'Thiết kế bắt mắt và hiện đại', 'assets/img/sport-califa-xam.jpg', 12, '2025-01-11 19:30:14', 2),
(10, 'Xe Đạp Địa Hình Trợ Lực Điện Life Vision 27.5 Inch', 26800000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/sport-thong-nhat-xanh.jpg ', 11, '2025-01-11 19:31:21', 2),
(11, 'Xe Đạp Đua Fascino FR700s – Phanh Đĩa Cơ Giá Rẻ | Khuyến mãi Hot', 1450000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/sport-mtb-kalman-xanh.jpg', 14, '2025-01-11 19:32:14', 2),
(12, 'Xe Đạp Touring Life TX800 – Khung Nhôm | Phanh Dầu | Shimano Sora', 10490000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/sport-fascino-do.jpg', 8, '2025-01-11 19:33:17', 2),
(13, 'Xe Đạp Địa Hình MTB Life MX2000 27.5 Inch – Khung Nhôm', 5800000, 'Phù hợp với người cao từ 1m60 trở lên', 'assets/img/sport-mtb-papylus-xanh-den.jpg', 7, '2025-01-11 19:34:01', 2),
(14, 'Xe Đạp Touring Life Louis – Shimano Toney', 4290000, 'Xe nhập khẩu ĐÀI LOAN', 'assets/img/sport-mtb-califa-cs500-den-xanh.jpg', 9, '2025-01-11 19:34:42', 2),
(15, 'Xe Đạp Đua DTFLY R-2000 – Khung Nhôm | Tay Đề Lắc', 10890000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/sport-mtb-califa-ql680-den.jpg', 10, '2025-01-11 19:35:25', 2),
(16, 'Xe Đạp Touring Papylus Pt700s – Khung Nhôm', 3890000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/sport-mtb-brave-will-den-xanh.jpg', 13, '2025-01-11 19:36:16', 2),
(17, 'Xe Đạp Địa Hình MTB DTFLY B100 24 Inch – Phanh Đĩa', 3390000, 'Khung hợp kim thép chắc chắn, giúp tăng cường độ bền và khả năng', 'assets/img/terrain-mtb-fascino-trang-do.jpg', 11, '2025-01-11 19:39:39', 3),
(18, 'Xe Đạp Địa Hình MTB Vicky Crazy VC800 26 Inch', 2530000, 'Phù hợp với người cao từ 1m55', 'assets/img/terrain-mtb-fascino-328-den-xanh.jpg', 10, '2025-01-11 19:40:44', 3),
(19, 'Xe Đạp Địa Hình MTB Giant Talon 0 2024', 19590000, 'kiểu dáng thể thao với khung “hardtail” cứng cáp', 'assets/img/terrain-mtb-papylus-pz6-xanh-den.jpg', 9, '2025-01-11 19:41:24', 3),
(20, 'Xe Đạp Địa Hình MTB Calli 5900 27.5 Inch – Khung Nhôm', 7990000, 'Khung xe được làm từ Hợp kim thép &, rất bền và chịu được va đập', 'assets/img/terrain-mtb-papylus-pz5-den-do.jpg', 11, '2025-01-11 19:42:01', 3),
(21, 'Xe Đạp Địa Hình MTB Life MX2000 27.5 Inch – Khung Nhôm', 5800000, 'Phù hợp với người cao từ 1m60 trở lên', 'assets/img/terrain-mtb-btfly-b100-den-do.jpg', 10, '2025-01-11 19:42:45', 3),
(22, 'Xe Đạp Địa Hình MTB Life MX1000 – Khung Nhôm', 5200000, 'Phù hợp với người cao từ 1m55 trở lên', 'assets/img/terrain-mtb-hector-apollo-trang.jpg', 15, '2025-01-11 19:43:25', 3),
(23, 'Xe Đạp Địa Hình MTB Life MX3000 27.5 Inch – Khung Nhôm', 7500000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/terrain-mtb-calli-m350-den-do.jpg', 13, '2025-01-11 19:44:09', 3),
(24, 'Xe Đạp Địa hình MTB Satako Akita 29 Inch', 1599000, 'Xe đạp địa hình 29 inch, khung sườn carbon bền nhẹ.', 'assets/img/terrain-mtb-fascino-558-xanh-den.jpg', 12, '2025-01-11 19:44:43', 3),
(25, 'Xe Đạp Touring Califa CT100 – Shimano | Phanh Đĩa Cơ', 3890000, 'Thiết kế bắt mắt và hiện đại', 'assets/img/dua-nesto-zebra-xam.jpg', 12, '2025-01-11 19:30:14', 4),
(26, 'Xe Đạp Touring Fascino FT-700s: Khung Thép Cường Lực Giá Rẻ', 26800000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/touring-califa-ct100-xam-den.jpg', 11, '2025-01-11 19:31:21', 4),
(27, 'Xe Đạp Touring Fornix FR309 – Phanh Đĩa Cơ | Tay Đề Bấm', 10490000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/touring-fascino-ft700s-den-do.jpg', 8, '2025-01-11 19:33:17', 4),
(28, 'Xe Đạp Touring Papylus PT600', 5800000, 'Phù hợp với người cao từ 1m60 trở lên', 'assets/img/touring-papylus-pt600-trang-xanh.jpg', 7, '2025-01-11 19:34:01', 4),
(29, 'Xe Đạp Touring Papylus Pt700s – Khung Nhôm', 4290000, 'Xe nhập khẩu ĐÀI LOAN', 'assets/img/touring-papylus-pt700s-den-cam.jpg', 9, '2025-01-11 19:34:42', 4),
(30, 'Xe Đạp Touring Calli S1500 – Khung Nhôm', 4290000, 'Xe nhập khẩu ĐÀI LOAN', 'assets/img/touring-calli-s1500-trang.jpg', 9, '2025-01-11 19:34:42', 4),
(31, 'Xe Đạp Đua Papylus PR700s – Khung Nhôm | Phanh Đĩa Cơ | Shimano Giá Rẻ', 3890000, 'Thiết kế bắt mắt và hiện đại', 'assets/img/dua-nesto-zebra-xam.jpg', 12, '2025-01-11 19:30:14', 5),
(32, 'Xe Đạp Đua Sava X9.5 4700 – Carbon ', 26800000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/dua-sava-x9.5-4700-den.jpg', 11, '2025-01-11 19:31:21', 5),
(33, 'Xe Đạp Đua Sava Ex7 – Khung Nhôm', 10490000, 'Thiết kế phong cách thể thao, mạnh mẽ', 'assets/img/dua-sava-ex7-sl7120s-den-trang.jpg', 8, '2025-01-11 19:33:17', 5),
(34, 'Xe Đạp Đua Sava X9.8 – Khung Carbon', 5800000, 'Phù hợp với người cao từ 1m60 trở lên', 'assets/img/dua-sava-x9.8-bac.jpg', 7, '2025-01-11 19:34:01', 5),
(35, 'Xe Đạp Đua Nesto Wolf – Khung Carbon ', 4290000, 'Xe nhập khẩu ĐÀI LOAN', 'assets/img/dua-nesto-wolf-bac.jpg', 9, '2025-01-11 19:34:42', 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_img`
--

CREATE TABLE `product_img` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_img`
--

INSERT INTO `product_img` (`id`, `productId`, `path`) VALUES
(1, 1, 'assets/img/shukyo-nu-hong.jpg'),
(2, 1, 'assets/img/shukyo-nu-kem.jpg'),
(3, 1, 'assets/img/shukyo-nu-tim.jpg'),
(4, 2, 'assets/img/shukyo-nam-xanh.jpg'),
(5, 2, 'assets/img/shukyo-nam-do.jpg'),
(6, 3, 'assets/img/JsXiong-xam.jpg'),
(7, 3, 'assets/img/JsXiong-xanh-duong.jpg'),
(8, 4, 'assets/img/melody-hong.jpg'),
(9, 4, 'assets/img/melody-tim.jpg'),
(10, 4, 'assets/img/melody-xanh-ngoc.jpg'),
(11, 5, 'assets/img/xaming-nu-hong.jpg'),
(12, 5, 'assets/img/xaming-nu-tim.jpg'),
(13, 5, 'assets/img/xaming-nu-xanh.jpg'),
(14, 6, 'assets/img/hector-luna-hong.jpg'),
(15, 6, 'assets/img/hector-luna-tim.jpg'),
(16, 6, 'assets/img/hector-luna-trang.jpg'),
(17, 6, 'assets/img/hector-luna-vang.jpg'),
(18, 7, 'assets/img/subasa-vang.jpg'),
(19, 7, 'assets/img/subasa-do.jpg'),
(20, 7, 'assets/img/subasa-trang.jpg'),
(21, 7, 'assets/img/subasa-xanh.jpg'),
(22, 8, 'assets/img/bors-xanh.jpg'),
(23, 8, 'assets/img/bors-xanh-la.jpg'),
(24, 8, 'assets/img/bors-vang.jpg'),
(25, 8, 'assets/img/bors-do.jpg'),
(26, 9, 'assets/img/sport-califa-xam.jpg'),
(27, 9, 'assets/img/sport-califa-ghi.jpg'),
(28, 9, 'assets/img/sport-califa-xanh-dam.jpg'),
(29, 9, 'assets/img/sport-califa-xanh-nhat.jpg'),
(30, 10, 'assets/img/sport-thong-nhat-xanh.jpg'),
(31, 10, 'assets/img/sport-thong-nhat-xam.jpg'),
(32, 10, 'assets/img/sport-thong-nhat-cam.jpg'),
(33, 11, 'assets/img/sport-mtb-kalman-xanh.jpg'),
(34, 11, 'assets/img/sport-mtb-kalman-do.jpg'),
(35, 11, 'assets/img/sport-mtb-kalman-xanh-la.jpg'),
(36, 12, 'assets/img/sport-fascino-do.jpg'),
(37, 12, 'assets/img/sport-fascino-xanh.jpg'),
(38, 12, 'assets/img/sport-fascino-trang.jpg'),
(39, 12, 'assets/img/sport-fascino-xanh-dam.jpg'),
(40, 13, 'assets/img/sport-mtb-papylus-xanh-den.jpg'),
(41, 13, 'assets/img/sport-mtb-papylus-xam-den.jpg'),
(42, 13, 'assets/img/sport-mtb-papylus-trang-do.jpg'),
(43, 13, 'assets/img/sport-mtb-papylus-ghi-cam.jpg'),
(44, 14, 'assets/img/sport-mtb-califa-cs500-den-xanh.jpg'),
(45, 14, 'assets/img/sport-mtb-califa-cs500-den-do.jpg'),
(46, 14, 'assets/img/sport-mtb-califa-cs500-trang-tim.jpg'),
(47, 15, 'assets/img/sport-mtb-califa-ql680-den.jpg'),
(48, 15, 'assets/img/sport-mtb-califa-ql680-xam.jpg'),
(49, 15, 'assets/img/sport-mtb-califa-ql680-trang.jpg'),
(50, 15, 'assets/img/sport-mtb-califa-ql680-kem.jpg'),
(51, 16, 'assets/img/sport-mtb-brave-will-den-xanh.jpg'),
(52, 16, 'assets/img/sport-mtb-brave-will-den-do.jpg'),
(53, 17, 'assets/img/terrain-mtb-fascino-trang-do.jpg'),
(54, 17, 'assets/img/terrain-mtb-fascino-ghi-vang.jpg'),
(55, 17, 'assets/img/terrain-mtb-fascino-xanh-cam.jpg'),
(56, 17, 'assets/img/terrain-mtb-fascino-den-xanh.jpg'),
(57, 18, 'assets/img/terrain-mtb-fascino-328-den-xanh.jpg'),
(58, 18, 'assets/img/terrain-mtb-fascino-328-trang-do.jpg'),
(59, 18, 'assets/img/terrain-mtb-fascino-328-ghi-vang.jpg'),
(60, 18, 'assets/img/terrain-mtb-fascino-328-xanh-cam.jpg'),
(61, 19, 'assets/img/terrain-mtb-papylus-pz6-xanh-den.jpg'),
(62, 19, 'assets/img/terrain-mtb-papylus-pz6-xam-den.jpg'),
(63, 19, 'assets/img/terrain-mtb-papylus-pz6-trang-do.jpg'),
(64, 19, 'assets/img/terrain-mtb-papylus-pz6-den-do.jpg'),
(65, 20, 'assets/img/terrain-mtb-papylus-pz5-xam-den.jpg'),
(66, 20, 'assets/img/terrain-mtb-papylus-pz5-xanh-den.jpg'),
(67, 20, 'assets/img/terrain-mtb-papylus-pz5-den-do.jpg'),
(68, 20, 'assets/img/terrain-mtb-papylus-pz5-trang-do.jpg'),
(69, 21, 'assets/img/terrain-mtb-btfly-b100-den-do.jpg'),
(70, 22, 'assets/img/terrain-mtb-hector-apollo-trang.jpg'),
(71, 22, 'assets/img/terrain-mtb-hector-apollo-vang-dong.jpg'),
(72, 23, 'assets/img/terrain-mtb-calli-m350-den-do.jpg'),
(73, 23, 'assets/img/terrain-mtb-calli-m350-den-xam.jpg'),
(74, 23, 'assets/img/terrain-mtb-calli-m350-trang-do.jpg'),
(75, 24, 'assets/img/terrain-mtb-fascino-558-xanh-den.jpg'),
(76, 24, 'assets/img/terrain-mtb-fascino-558-den-do.jpg'),
(77, 24, 'assets/img/terrain-mtb-fascino-558-trang-do.jpg'),
(78, 24, 'assets/img/terrain-mtb-fascino-558-xam-den.jpg'),
(79, 24, 'assets/img/terrain-mtb-fascino-558-xam-vang.jpg'),
(80, 25, 'assets/img/touring-califa-ct100-xam-den.jpg'),
(81, 25, 'assets/img/touring-califa-ct100-xam-trang.jpg'),
(82, 25, 'assets/img/touring-califa-ct100-den-do.jpg'),
(83, 25, 'assets/img/touring-califa-ct100-trang-do.jpg'),
(84, 26, 'assets/img/touring-fascino-ft700s-den-do.jpg'),
(85, 26, 'assets/img/touring-fascino-ft700s-xanh-den.jpg'),
(86, 26, 'assets/img/touring-fascino-ft700s-xanh-vang.jpg'),
(87, 26, 'assets/img/touring-fascino-ft700s-xam-den.jpg'),
(88, 27, 'assets/img/touring-fornix-fr309-xanh-cam.jpg'),
(89, 27, 'assets/img/touring-fornix-fr309-den-xanh.jpg'),
(90, 27, 'assets/img/touring-fornix-fr309-den-do.jpg'),
(91, 28, 'assets/img/touring-papylus-pt600-trang-xanh.jpg'),
(92, 28, 'assets/img/touring-papylus-pt600-xanh-la.jpg'),
(93, 28, 'assets/img/touring-papylus-pt600-ghi-den.jpg'),
(94, 28, 'assets/img/touring-papylus-pt600-den-do.jpg'),
(95, 29, 'assets/img/touring-papylus-pt700s-den-cam.jpg'),
(96, 29, 'assets/img/touring-papylus-pt700s-trang-do.jpg'),
(97, 30, 'assets/img/touring-calli-s1500-trang.jpg'),
(98, 30, 'assets/img/touring-calli-s1500-den.jpg'),
(99, 30, 'assets/img/touring-calli-s1500-xanh.jpg'),
(100, 30, 'assets/img/touring-calli-s1500-xam.jpg'),
(101, 31, 'assets/img/dua-sava-x9.8-bac.jpg'),
(102, 31, 'assets/img/dua-sava-x9.8-xanh.jpg'),
(103, 31, 'assets/img/dua-sava-x9.8-den.jpg'),
(104, 31, 'assets/img/dua-sava-x9.8-do.jpg'),
(105, 32, 'assets/img/dua-sava-ex7-sl7120s-den-trang.jpg'),
(106, 32, 'assets/img/dua-sava-ex7-sl7120s-den-do.jpg'),
(107, 32, 'assets/img/dua-sava-ex7-sl7120s-den-ghi.jpg'),
(108, 32, 'assets/img/dua-sava-ex7-sl7120s-xanh.jpg'),
(109, 33, 'assets/img/dua-sava-x9.5-4700-den.jpg'),
(110, 33, 'assets/img/dua-sava-x9.5-4700-bac.jpg'),
(111, 33, 'assets/img/dua-sava-x9.5-4700-xanh.jpg'),
(112, 33, 'assets/img/dua-sava-x9.5-4700-do.jpg'),
(113, 34, 'assets/img/dua-nesto-wolf-bac.jpg'),
(114, 34, 'assets/img/dua-nesto-wolf-den.jpg'),
(115, 34, 'assets/img/dua-nesto-wolf-trang.jpg'),
(116, 34, 'assets/img/dua-nesto-wolf-xanh.jpg'),
(117, 34, 'assets/img/dua-nesto-wolf-xam.jpg'),
(118, 35, 'assets/img/dua-nesto-zebra-xam.jpg'),
(119, 35, 'assets/img/dua-nesto-zebra-den.jpg'),
(120, 35, 'assets/img/dua-nesto-zebra-trang.jpg'),
(121, 35, 'assets/img/dua-nesto-zebra-ghi-den.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `codes` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `valueOfPro` int(11) DEFAULT NULL,
  `statusOfPro` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `passWord` varchar(300) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `roleId`, `userName`, `fullName`, `email`, `passWord`, `phone`, `address`, `createdAt`, `status`, `code`) VALUES
(1, 1, 'anhtuan', 'Bui Anh Tuan', 't739223@gmail.com', '123', '030903191', 'ĐH Nông Lâm', '2024-10-18 21:27:41', 1, ''),
(2, 2, 'buianhtuan', 'Bùi Anh Tuấn', 'anhtuan2207gmail.com', '220704', '0833123193', 'ĐH Nông Lâm', '2024-10-18 21:27:41', 1, ''),
(3, 2, 'pvthuan', 'Phan Vĩnh Thuần', 'pvthuan@gmail.com', '23456', '0232392333', 'ĐH Nông Lâm', '2024-10-18 21:27:41', 1, ''),
(4, 2, 'ntpt', 'Nguyen Phuong Tram', 't759223@gmail.com', 'abcxyz', '0623882844', 'ĐH Nông Lâm', '2024-10-18 21:27:41', 0, ''),
(5, 2, 'kennguyen', 'Nguyễn Văn An', 'kennguyen@gmail.com', 'ken123', '0931931322', 'TP. Hồ Chí Minh', '2024-10-18 21:27:41', 1, '132442'),
(6, 2, 'thuanng', 'Nguyễn Minh Thuận', 'thuanne@gmail.com', 'tztztz', '0232883733', 'Hà Nội', '2024-12-20 20:27:41', 1, '442221'),
(7, 2, 'nhtruong', 'Nguyễn Minh Trường', 't75339223@gmail.com', '12345', '0247242444', 'TP. Hồ Chí Minh', '2024-12-20 20:27:41', 1, '556366'),
(8, 2, 'qukhai', 'Nguyễn Quang Khải', 'mattroi@gmail.com', 'hhuu33', '0338828441', 'TP. Hồ Chí Minh', '2024-12-20 20:27:41', 1, '722445'),
(14, 2, 'batuan', 'Lê Bá Tuấn', 't75339223@gmail.com', '12345', '0931931322', 'ĐH Nông Lâm', '2024-12-30 20:27:41', 1, '340147'),
(15, 2, 'letuan', 'Lê AnhTuấn', 't7531371223@gmail.com', '1111', '0931931322', 'ĐH Nông Lâm', '2025-01-08 20:27:41', 1, '435472'),
(16, 2, 'qhaing', 'Nguyễn Quốc Hải', 'haingqu@gmail.com', '8888', '0931376647', 'Hà Nội', '2025-01-08 20:33:12', 1, '934060');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `userId` (`userId`) USING BTREE,
  ADD KEY `promotionId` (`promotionId`) USING BTREE,
  ADD KEY `orders_ibfk_3` (`paymentId`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orderId` (`orderId`) USING BTREE,
  ADD KEY `productId` (`productId`) USING BTREE;

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cateId` (`cateId`) USING BTREE;

--
-- Indexes for table `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `productId` (`productId`) USING BTREE;

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `userId` (`userId`) USING BTREE,
  ADD KEY `productId` (`productId`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `roleId` (`roleId`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_img`
--
ALTER TABLE `product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_img`
--
ALTER TABLE `product_img`
  ADD CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
