-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2024 at 07:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wefixit`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add order', 8, 'add_order'),
(30, 'Can change order', 8, 'change_order'),
(31, 'Can delete order', 8, 'delete_order'),
(32, 'Can view order', 8, 'view_order'),
(33, 'Can add technician', 9, 'add_technician'),
(34, 'Can change technician', 9, 'change_technician'),
(35, 'Can delete technician', 9, 'delete_technician'),
(36, 'Can view technician', 9, 'view_technician'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add order item', 11, 'add_orderitem'),
(42, 'Can change order item', 11, 'change_orderitem'),
(43, 'Can delete order item', 11, 'delete_orderitem'),
(44, 'Can view order item', 11, 'view_orderitem');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$2SdHclu0onN9GDjARRjHdY$Thwa0nyFgMPDc5joicfEtl7frXQ6oQiIuV2EPOsy7Z8=', '2024-04-29 05:37:15.922364', 1, 'admin', '', '', '', 1, 1, '2024-04-28 17:29:07.747383'),
(2, 'pbkdf2_sha256$720000$C7kmzQDDaa0KjARdKbShbQ$DVj3E3XOhNYTDjTrAup/yWsanHM50GTMjspXgcHpAdU=', '2024-04-29 07:45:39.003298', 0, 'parvez', '', '', '123@45.com', 0, 1, '2024-04-29 07:45:28.524300');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-28 17:30:06.125454', '1', 'lcd', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-04-28 17:30:26.211620', '2', 'Battery', 1, '[{\"added\": {}}]', 7, 1),
(3, '2024-04-28 17:30:48.465757', '1', 'Lcd', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(4, '2024-04-28 17:31:13.504350', '3', 'Charging Put', 1, '[{\"added\": {}}]', 7, 1),
(5, '2024-04-28 17:31:42.833258', '4', 'Software', 1, '[{\"added\": {}}]', 7, 1),
(6, '2024-04-29 06:27:35.295360', '1', 'order 1', 1, '[{\"added\": {}}]', 8, 1),
(7, '2024-04-29 09:09:27.092305', '1', '3TW34T', 1, '[{\"added\": {}}]', 10, 1),
(8, '2024-04-29 09:10:11.607781', '1', '3TW34T', 2, '[]', 10, 1),
(9, '2024-04-29 09:10:33.329196', '2', 'WETQW', 1, '[{\"added\": {}}]', 10, 1),
(10, '2024-04-29 14:09:17.393598', '3', 'PIXEL 6 PRO', 1, '[{\"added\": {}}]', 10, 1),
(11, '2024-04-29 17:29:00.182637', '1', 'iPhone 14 pro', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\", \"Description\", \"Price\", \"Stock\", \"Image\"]}}]', 10, 1),
(12, '2024-04-29 17:31:33.379397', '4', 'iPhone 15 pro', 1, '[{\"added\": {}}]', 10, 1),
(13, '2024-04-29 17:33:09.976499', '2', 'iPhone 14 pro', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\", \"Description\", \"Price\", \"Image\"]}}]', 10, 1),
(14, '2024-04-29 17:34:25.037819', '5', 'Samsung S22 ultra', 1, '[{\"added\": {}}]', 10, 1),
(15, '2024-04-29 17:35:23.018195', '6', 'Samsung S23 ultra', 1, '[{\"added\": {}}]', 10, 1),
(16, '2024-04-29 17:37:13.706680', '7', 'Samsung S22 ultra', 1, '[{\"added\": {}}]', 10, 1),
(17, '2024-04-29 17:38:32.065707', '8', 'Samsung S22 ultra', 1, '[{\"added\": {}}]', 10, 1),
(18, '2024-04-29 17:39:22.892094', '9', 'Samsung S23 ultra', 1, '[{\"added\": {}}]', 10, 1),
(19, '2024-04-29 17:40:22.154685', '3', 'PIXEL 6 PRO', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(20, '2024-04-29 17:44:42.096939', '10', 'PIXEL 6 PRO', 1, '[{\"added\": {}}]', 10, 1),
(21, '2024-04-29 17:45:07.500764', '2', 'iPhone 14 pro', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(22, '2024-04-29 17:45:24.481780', '7', 'Samsung S22 ultra', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(23, '2024-04-29 17:45:52.237916', '8', 'Samsung S22 ultra', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(24, '2024-04-29 17:46:06.705039', '9', 'Samsung S23 ultra', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(25, '2024-04-29 17:51:36.648047', '11', 'Software repair', 1, '[{\"added\": {}}]', 10, 1),
(26, '2024-04-29 17:53:57.330267', '10', 'PIXEL 6 PRO', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(27, '2024-04-29 17:55:06.732652', '11', 'Software repair', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'wefixit', 'category'),
(8, 'wefixit', 'order'),
(11, 'wefixit', 'orderitem'),
(10, 'wefixit', 'product'),
(9, 'wefixit', 'technician');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-28 12:15:02.643258'),
(2, 'auth', '0001_initial', '2024-04-28 12:15:02.992697'),
(3, 'admin', '0001_initial', '2024-04-28 12:15:03.065668'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-28 12:15:03.071653'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-28 12:15:03.079638'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-28 12:15:03.135997'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-28 12:15:03.170755'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-28 12:15:03.183722'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-28 12:15:03.192697'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-28 12:15:03.227043'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-28 12:15:03.229038'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-28 12:15:03.237016'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-28 12:15:03.253971'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-28 12:15:03.266938'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-28 12:15:03.278771'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-28 12:15:03.286555'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-28 12:15:03.297531'),
(18, 'sessions', '0001_initial', '2024-04-28 12:15:03.321902'),
(19, 'wefixit', '0001_initial', '2024-04-28 12:15:03.495118');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8akm40hqztks7qarhymr1sukcd8etv1r', 'eyJ0b3RhbHByaWNlIjoyMTMyNDAwLjAsIm9yZGVyX2lkIjo0LCJjYXJ0Ijp7IjEiOnsicXVhbnRpdHkiOjEsInByaWNlIjoiMTIzNTQuMDAifX19:1s1Rde:PreTp-hQb1d-vP_9dl4ewRWsddMHhk0jDwYHaMf28i4', '2024-05-13 14:05:50.039373'),
('biw6b6ggr790loi3nh15aokbzrb50qk8', '.eJxVjDsOAiEUAO9CbQj_B5b2noG8ByirBpJltzLe3ZBsoe3MZN4s4r7VuI-yxiWzM5Ps9MsI07O0KfID273z1Nu2LsRnwg87-LXn8roc7d-g4qhzazX4cnMhJI8mS6OLFUloJcBZn1VAA96CIqesU0hEVmQJKThAaaRnny-0qjaI:1s1JhT:SOzCBjk5tomgPGSyOHcFeCd-6wZ0P-2lAxllSStPx1A', '2024-05-13 05:37:15.926779'),
('koo1lqx3ndehj1y3k7142sngz4py56ut', '.eJxVjDsOAiEUAO9CbQj_B5b2noG8ByirBpJltzLe3ZBsoe3MZN4s4r7VuI-yxiWzM5Ps9MsI07O0KfID273z1Nu2LsRnwg87-LXn8roc7d-g4qhzazX4cnMhJI8mS6OLFUloJcBZn1VAA96CIqesU0hEVmQJKThAaaRnny-0qjaI:1s18LQ:FoAkrGZ3d-biiBGUjCKcm71g-VXTt-Btr5HP0nxNhFk', '2024-05-12 17:29:44.590180'),
('ndqaz46h45p57jeoubmju4tysazx8jrp', 'eyJjYXJ0Ijp7IjQiOnsicXVhbnRpdHkiOjEsInByaWNlIjoiNDgwMDAuMDAifX19:1s1VVu:xinvzj9_pgKmwxtLXTELOExbkCdA2NbZXzji5Is9vfw', '2024-05-13 18:14:06.069308');

-- --------------------------------------------------------

--
-- Table structure for table `wefixit_category`
--

CREATE TABLE `wefixit_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wefixit_category`
--

INSERT INTO `wefixit_category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Lcd', 'lcd', '2024-04-28 17:30:06.123189', '2024-04-28 17:30:48.464266'),
(2, 'Battery', 'battery', '2024-04-28 17:30:26.210622', '2024-04-28 17:30:26.210622'),
(3, 'Charging Put', 'charging-put', '2024-04-28 17:31:13.502841', '2024-04-28 17:31:13.502841'),
(4, 'Software', 'software', '2024-04-28 17:31:42.832260', '2024-04-28 17:31:42.832260');

-- --------------------------------------------------------

--
-- Table structure for table `wefixit_order`
--

CREATE TABLE `wefixit_order` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `problems` longtext NOT NULL,
  `address` varchar(150) NOT NULL,
  `postal_code` varchar(30) NOT NULL,
  `city` varchar(100) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wefixit_order`
--

INSERT INTO `wefixit_order` (`id`, `first_name`, `last_name`, `email`, `phone`, `problems`, `address`, `postal_code`, `city`, `paid`, `created`, `updated`) VALUES
(1, 'dfsd', 'asdf', 'nirob@gmail.com', '01782925432', 'adsf', 'sadf', '1558', 'asdf', 1, '2024-04-29 06:27:35.286724', '2024-04-29 06:27:35.286724'),
(2, 'parvez', 'Mia', '123@45.com', '01482145', 'asdfsadgf', 'dfa', '6556', 'EFSDA', 0, '2024-04-29 07:55:57.515773', '2024-04-29 07:55:57.515773'),
(3, 'AWERTAT', 'WE', '123@45.com', '01482145', 'RFESAT', 'SAT', '123', 'WAWSDG', 0, '2024-04-29 09:11:50.529217', '2024-04-29 09:11:50.529217'),
(4, 'AWERTAT', 'WE', '123@45.com', '01482145', 'RFESAT', 'SAT', '123', 'WAWSDG', 0, '2024-04-29 09:13:05.011142', '2024-04-29 09:13:05.012147');

-- --------------------------------------------------------

--
-- Table structure for table `wefixit_orderitem`
--

CREATE TABLE `wefixit_orderitem` (
  `id` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wefixit_orderitem`
--

INSERT INTO `wefixit_orderitem` (`id`, `price`, `quantity`, `order_id`, `product_id`) VALUES
(1, '21324.00', 1, 3, 2),
(2, '21324.00', 1, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wefixit_product`
--

CREATE TABLE `wefixit_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL CHECK (`stock` >= 0),
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wefixit_product`
--

INSERT INTO `wefixit_product` (`id`, `name`, `slug`, `description`, `price`, `available`, `stock`, `created_at`, `updated_at`, `image`, `category_id`) VALUES
(1, 'iPhone 14 pro', 'iPhone14pro', 'Get your iPhone 14pro broken screen fixed same day by specialists.\r\n\r\nNew, highest quality screen +  front glass for iPhone 14pro, quality tested in our lab\r\nBring your phone for 2 hours repair, while you wait [?]\r\nSend it in for 5 days turnaround or upgrade to 1- day Express repair [?]\r\n6 months warranty for parts and labour', '40000.00', 1, 2, '2024-04-29 09:09:27.084508', '2024-04-29 17:29:00.172523', 'products/2024/04/29/14pro_tu0KGY8.jpg', 1),
(2, 'iPhone 14 pro', 'iPhone14pro', 'New, highest quality screen +  front glass for iPhone 14pro, quality tested in our lab\r\n6 months warranty for parts and labour', '4500.00', 1, 2, '2024-04-29 09:10:33.327167', '2024-04-29 17:45:07.498770', 'products/2024/04/29/dell-inspiron-15-5000-15_1705483071.jpg', 2),
(3, 'PIXEL 6 PRO', 'pixel-6-pro', 'Get your PIXEL 6 PRO broken screen fixed same day by specialists.\r\n\r\nNew, highest quality screen +  front glass for PIXEL 6 PRO, quality tested in our lab\r\n\r\n6 months warranty for parts and labour', '35000.00', 1, 2, '2024-04-29 14:09:17.389093', '2024-04-29 17:40:22.151724', 'products/2024/04/29/pixel_6pro.jpg', 1),
(4, 'iPhone 15 pro', 'iphone-15-pro', 'Get your iPhone 15pro broken screen fixed same day by specialists.\r\n\r\nNew, highest quality screen +  front glass for iPhone 15pro, quality tested in our lab\r\n6 months warranty for parts and labour', '48000.00', 1, 1, '2024-04-29 17:31:33.374126', '2024-04-29 17:31:33.374126', 'products/2024/04/29/i14.jpg', 1),
(5, 'Samsung S22 ultra', 'samsung-s22-ultra', 'Get your iPhone 15pro broken screen fixed same day by specialists.\r\n\r\nNew, highest quality screen +  front glass for iPhone 15pro, quality tested in our lab\r\n6 months warranty for parts and labour', '40000.00', 1, 2, '2024-04-29 17:34:25.034827', '2024-04-29 17:34:25.034827', 'products/2024/04/29/samsung-galaxy-s22-ultra-white-full-screen-original.jpg', 1),
(6, 'Samsung S23 ultra', 'samsung-s23-ultra', 'Get your Samsung S23 ultra broken screen fixed same day by specialists.\r\n\r\nNew, highest quality screen +  front glass for Samsung S23 ultra, quality tested in our lab\r\n6 months warranty for parts and labour', '55000.00', 1, 1, '2024-04-29 17:35:23.015204', '2024-04-29 17:35:23.015204', 'products/2024/04/29/s23ultra.jpg', 1),
(7, 'Samsung S22 ultra', 'samsung-s22-ultra', 'New, highest quality screen +  front glass for samsung-s22-ultra, quality tested in our lab\r\n\r\n6 months warranty for parts and labour', '4000.00', 1, 4, '2024-04-29 17:37:13.702659', '2024-04-29 17:45:24.478786', 'products/2024/04/29/dell-xps-15-9560_1705483260.jpg', 2),
(8, 'Samsung S22 ultra', 'samsung-s22-ultra', 'New, highest quality screen +  front glass for samsung-s22-ultra, quality tested in our lab\r\n\r\n6 months warranty for parts and labour', '3000.00', 1, 3, '2024-04-29 17:38:32.064708', '2024-04-29 17:45:52.235920', 'products/2024/04/29/s22cher.jpg', 3),
(9, 'Samsung S23 ultra', 'samsung-s23-ultra', 'New, highest quality screen +  front glass for samsung-s23-ultra, quality tested in our lab\r\n\r\n6 months warranty for parts and labour', '4500.00', 1, 3, '2024-04-29 17:39:22.890100', '2024-04-29 17:46:06.705039', 'products/2024/04/29/s23ultrac.jpg', 3),
(10, 'PIXEL 6 PRO', 'pixel-6-pro', 'New, highest quality screen +  front glass for PIXEL 6 PRO, quality tested in our lab\r\n\r\n6 months warranty for parts and labour', '5500.00', 1, 3, '2024-04-29 17:44:42.090876', '2024-04-29 17:53:57.321772', 'products/2024/04/29/pixel6battery.jpg', 2),
(11, 'Software repair', 'software-repair', 'Please send us a email or call explaining the problem before buying the software repair service.\r\n\r\nWe can fix many software issues but there is many problems that are actually hardware related and cannot be resolved. Describe issues first and we check if it qualifies for the software repair. Do you need your data recovered ? \r\n\r\nWe start from the diagnostic service to confirm the software nature of the problem\r\nWe can completely reload the firmware of your phone (Android or iOS)\r\nThe work will be completed within 48 hours or we let you know if more time is needed before we start the job;\r\nThis service may include backup of your files (pictures, videos, songs, contacts, messages) at additional cost', '0.00', 1, 3, '2024-04-29 17:51:36.642540', '2024-04-29 17:55:06.728663', 'products/2024/04/29/software.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `wefixit_technician`
--

CREATE TABLE `wefixit_technician` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expertise` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `wefixit_category`
--
ALTER TABLE `wefixit_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `wefixit_category_name_f8f8bef5` (`name`);

--
-- Indexes for table `wefixit_order`
--
ALTER TABLE `wefixit_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wefixit_orderitem`
--
ALTER TABLE `wefixit_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wefixit_orderitem_order_id_a2043dc8_fk_wefixit_order_id` (`order_id`),
  ADD KEY `wefixit_orderitem_product_id_b093ab4c_fk_wefixit_product_id` (`product_id`);

--
-- Indexes for table `wefixit_product`
--
ALTER TABLE `wefixit_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wefixit_product_category_id_b4470011_fk_wefixit_category_id` (`category_id`),
  ADD KEY `wefixit_product_name_6c4b8e02` (`name`),
  ADD KEY `wefixit_product_slug_b892b48f` (`slug`),
  ADD KEY `wefixit_product_id_slug_d6e44152_idx` (`id`,`slug`);

--
-- Indexes for table `wefixit_technician`
--
ALTER TABLE `wefixit_technician`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wefixit_category`
--
ALTER TABLE `wefixit_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wefixit_order`
--
ALTER TABLE `wefixit_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wefixit_orderitem`
--
ALTER TABLE `wefixit_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wefixit_product`
--
ALTER TABLE `wefixit_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wefixit_technician`
--
ALTER TABLE `wefixit_technician`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `wefixit_orderitem`
--
ALTER TABLE `wefixit_orderitem`
  ADD CONSTRAINT `wefixit_orderitem_order_id_a2043dc8_fk_wefixit_order_id` FOREIGN KEY (`order_id`) REFERENCES `wefixit_order` (`id`),
  ADD CONSTRAINT `wefixit_orderitem_product_id_b093ab4c_fk_wefixit_product_id` FOREIGN KEY (`product_id`) REFERENCES `wefixit_product` (`id`);

--
-- Constraints for table `wefixit_product`
--
ALTER TABLE `wefixit_product`
  ADD CONSTRAINT `wefixit_product_category_id_b4470011_fk_wefixit_category_id` FOREIGN KEY (`category_id`) REFERENCES `wefixit_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
