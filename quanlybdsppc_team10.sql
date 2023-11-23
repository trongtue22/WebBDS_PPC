-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2023 at 08:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlybdsppc_team10`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Full_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Role` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `Username`, `Password`, `Full_Name`, `Role`, `IsActive`) VALUES
(1, 'lythihuyenchau', '123456', 'Lý Thị Huyền Châu', 'ADMIN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(11) NOT NULL,
  `City_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`ID`, `City_Name`) VALUES
(1, 'Hồ Chí Minh'),
(2, 'Hà Nội'),
(3, 'Đà Nẵng'),
(4, 'Bình Dương'),
(5, 'Vũng Tàu'),
(6, 'Bắc Giang'),
(7, 'Đồng Nai'),
(8, 'Cà Mau'),
(9, 'Long An'),
(10, 'Cần Thơ');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `ID` int(11) NOT NULL,
  `City_ID` int(11) NOT NULL,
  `District_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`ID`, `City_ID`, `District_Name`) VALUES
(1, 1, 'Quận Bình Tân'),
(2, 1, 'Quận Bình Thạnh'),
(3, 1, 'Quận 1'),
(4, 1, 'Quận 2'),
(5, 1, 'Quận 3'),
(6, 1, 'Quận 4'),
(7, 1, 'Quận 5'),
(8, 1, 'Quận 6'),
(9, 1, 'Quận 7'),
(10, 1, 'Quận 8'),
(11, 9, 'Huyện Bến Lức'),
(12, 9, 'Huyện Đức Hòa'),
(14, 9, 'Huyện Đức Huệ'),
(15, 4, 'Huyện Bến Cát'),
(16, 4, 'Huyện Dầu Tiếng'),
(17, 4, 'Huyện Thuận An'),
(18, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `full_contract`
--

CREATE TABLE `full_contract` (
  `ID` int(11) NOT NULL,
  `Full_Contract_Code` varchar(12) DEFAULT NULL,
  `Customer_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Year_Of_Birth` int(11) DEFAULT NULL,
  `SSN` varchar(15) NOT NULL,
  `Customer_Address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Property_ID` int(11) NOT NULL,
  `Date_Of_Contract` date DEFAULT NULL,
  `Price` decimal(18,0) DEFAULT NULL,
  `Deposit` decimal(18,0) DEFAULT NULL,
  `Remain` decimal(18,0) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `full_contract`
--

INSERT INTO `full_contract` (`ID`, `Full_Contract_Code`, `Customer_Name`, `Year_Of_Birth`, `SSN`, `Customer_Address`, `Mobile`, `Property_ID`, `Date_Of_Contract`, `Price`, `Deposit`, `Remain`, `Status`) VALUES
(1, '2311FCC00001', 'Lý Thị Huyền Châu', 1990, '301198908', '45 Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh', '0919686576', 1, '2021-09-20', 1000000000, 100000000, 900000000, 1),
(2, '2311FCC00002', 'Trần Công Anh', 1989, '404948494', '36 Lê Văn Sỹ, Quận 3, TP.HCM', '0967686878', 2, '2023-11-18', 2000000000, 200000000, 1800000000, 1),
(3, '2311FCC00003', 'Tran Bich Ngoc', NULL, '13423123123123', NULL, NULL, 3, NULL, NULL, NULL, NULL, 1),
(11, '2311FCC00004', 'Tran Thanh Quang', NULL, '4545152', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1),
(12, '2311FCC00005', 'John Doe', 1985, '123456789', '123 Main Street', '1234567890', 4, '2023-11-21', 100000, 20000, 80000, 1),
(13, '2311FCC00006', 'Luu Thien Huu', 1999, '134254567', 'GoVap', '0909052312', 2, '2023-11-15', 10000000, 1000000, 10000, 0),
(43, '2311FCC00007', 'Johnwick', 1999, '3432232432', 'Ha Noi', '0909052311', 2, '2023-11-10', 9997, 100, 10, 0);

--
-- Triggers `full_contract`
--
DELIMITER $$
CREATE TRIGGER `TG_FULLCONTRACT_INSERT_AUTOCODE` BEFORE INSERT ON `full_contract` FOR EACH ROW BEGIN
	DECLARE v_ID INT; 
	DECLARE v_NAMHIENTAI VARCHAR(2); 
	DECLARE v_THANGHIENTAI VARCHAR(2); 
	DECLARE v_MAX INT; 
	DECLARE v_FULLCONTRACTCODE VARCHAR(12);
	
	-- LẤY ID
	SET v_ID = NEW.ID;
	
	-- LẤY NĂM HIỆN TẠI
	SET v_NAMHIENTAI = RIGHT(YEAR(NOW()), 2);
	
	-- LẤY THÁNG HIỆN TẠI
	SET v_THANGHIENTAI = LPAD(MONTH(NOW()), 2, '0');
	
	-- KIỂM TRA ÍT NHẤT 1 HỢP ĐỒNG ĐẦY ĐỦ CỦA NĂM HIỆN TẠI
	IF EXISTS (SELECT 1 FROM full_contract WHERE LEFT(Full_Contract_Code, 2) = v_NAMHIENTAI) THEN
		-- TĂNG LÊN 1
		SELECT MAX(RIGHT(Full_Contract_Code, 5)) INTO v_MAX FROM full_contract WHERE LEFT(Full_Contract_Code, 2) = v_NAMHIENTAI;
		SET v_MAX = v_MAX + 1;
	ELSE
		-- MẶC ĐỊNH STT LÀ 1 
		SET v_MAX = 1;
	END IF;
	
	-- TẠO FULLCONTRACTCODE MỚI
	SET v_FULLCONTRACTCODE = CONCAT(v_NAMHIENTAI, v_THANGHIENTAI, 'FCC', LPAD(v_MAX, 5, '0'));
	
	-- CẬP NHẬT FULLCONTRACTCODE CHO BẢNG full_contract VỪA THÊM
	SET NEW.Full_Contract_Code = v_FULLCONTRACTCODE;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `ID` int(11) NOT NULL,
  `Property_Code` varchar(11) DEFAULT NULL,
  `Property_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Property_Type_ID` int(11) NOT NULL,
  `Description` longtext DEFAULT NULL,
  `District_ID` int(11) NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Area` int(11) DEFAULT NULL,
  `Bed_Room` int(11) DEFAULT NULL,
  `Bath_Room` int(11) DEFAULT NULL,
  `Price` decimal(18,0) DEFAULT NULL,
  `Installment_Rate` double DEFAULT NULL,
  `Avatar` longtext DEFAULT NULL,
  `Album` longtext DEFAULT NULL,
  `Property_Status_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`ID`, `Property_Code`, `Property_Name`, `Property_Type_ID`, `Description`, `District_ID`, `Address`, `Area`, `Bed_Room`, `Bath_Room`, `Price`, `Installment_Rate`, `Avatar`, `Album`, `Property_Status_ID`) VALUES
(1, '2311PC00001', 'NHÀ PHỐ GARDEN KHANG ĐIỀN', 3, 'Nhà xây 1 trệt, 2 lầu, hoàn thiện bên ngoài kính cường lực, sơn nước chống rêu mốc chất lượng, có cửa kính cường lực, gara ô tô để xe thoải mái.', 1, 'Dự án Melosa Garden, Quận 9, Hồ Chí Minh', 80, 2, 2, 1000000000, 7.99, 'ppc0001.jpg', 'ppc0002.jpg;ppc0003.jpg;', 6),
(2, '2311PC00002', 'NHÀ 4 TẦNG 3 MẶT THOÁNG TRẦN HƯNG ĐẠO Q1', 3, 'Bán nhà trung tâm Quận 1 đoạn đẹp nhất đường Trần Hưng Đạo.', 1, 'Đường Trần Hưng Đạo, Quận 1, Hồ Chí Minh', 78, 2, 2, 2000000000, 7.99, 'ppc0004.jpg', 'ppc0005.jpg;ppc0006.jpg', 6),
(3, '2311PC00003', 'LAVITA CHARM', 2, 'Trong làn gió mát rượi, hương thơm cỏ cây tại Lavita Charm hòa theo từng bước chân sẽ đưa bạn trở về với không gian sống bình yên, tách biệt khỏi sự huyên náo của chốn phồn hoa. Lavita Charm như một nốt trầm yên ả của điệu nhạc du dương cho cảm xúc thăng hoa và nuôi dưỡng đam mê bất tận, đem đến nguồn vui, nguồn cảm hứng mới cho cuộc sống mỗi ngày.', 2, 'Dự án Lavita Charm, Đường 1, Phường Trường Thọ, Thủ Đức, Hồ Chí Minh', 120, 4, 4, 5000000000, 7.99, 'ppc0007.jpg', 'ppc0008.jpg;', 7),
(4, '2311PC00004', 'Hòa Hảo', 4, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

--
-- Triggers `property`
--
DELIMITER $$
CREATE TRIGGER `TG_PROPERTY_INSERT_AUTOCODE` BEFORE INSERT ON `property` FOR EACH ROW BEGIN
    DECLARE v_ID INT;
    DECLARE v_NAMHIENTAI VARCHAR(2);
    DECLARE v_THANGHIENTAI VARCHAR(2);
    DECLARE v_MAX INT;
    DECLARE v_PROPERTYCODE VARCHAR(11);

    -- GẮN GIÁ TRỊ CHO BIẾN
    -- LẤY ID
    SET v_ID = NEW.ID;
    -- LẤY 2 SỐ CUỐI NĂM HIỆN TẠI
    SET v_NAMHIENTAI = RIGHT(YEAR(NOW()), 2);
    -- LẤY THÁNG HIỆN TẠI
    SET v_THANGHIENTAI = LPAD(MONTH(NOW()), 2, '0');

    -- NẾU TỒN TẠI ÍT NHẤT 1 BẤT ĐỘNG SẢN CỦA NĂM HIỆN TẠI
    IF EXISTS (SELECT 1 FROM property WHERE LEFT(Property_Code, 2) = v_NAMHIENTAI) THEN
        -- TĂNG LÊN 1
        SELECT MAX(RIGHT(Property_Code, 5)) INTO v_MAX FROM property WHERE LEFT(Property_Code, 2) = v_NAMHIENTAI;
        SET v_MAX = v_MAX + 1;
    ELSE
        -- NGƯỢC LẠI THÌ MẶC ĐỊNH STT LÀ 1
        SET v_MAX = 1;
    END IF;

    -- TÍNH GIÁ TRỊ MÃ BẤT ĐỘNG SẢN
    SET v_PROPERTYCODE = CONCAT(v_NAMHIENTAI, v_THANGHIENTAI, 'PC', LPAD(v_MAX, 5, '0'));

    -- GÁN GIÁ TRỊ MÃ BẤT ĐỘNG SẢN VỪA THÊM
    SET NEW.Property_Code = v_PROPERTYCODE;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `property_service`
--

CREATE TABLE `property_service` (
  `ID` int(11) NOT NULL,
  `Service_ID` int(11) NOT NULL,
  `Property_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_service`
--

INSERT INTO `property_service` (`ID`, `Service_ID`, `Property_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 1, 2),
(6, 2, 2),
(7, 1, 3),
(8, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `full_contract`
--
ALTER TABLE `full_contract`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `property_service`
--
ALTER TABLE `property_service`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `full_contract`
--
ALTER TABLE `full_contract`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `property_service`
--
ALTER TABLE `property_service`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
