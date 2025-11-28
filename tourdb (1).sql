-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 28, 2025 lúc 11:24 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tourdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `status` varchar(50) DEFAULT 'Confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking`
--

INSERT INTO `booking` (`id`, `tour_id`, `customer_id`, `booking_date`, `status`) VALUES
(1, 1, 1, '2025-11-28', 'Confirmed'),
(2, 2, 1, '2025-11-29', 'Confirmed'),
(3, 4, 1, '2025-11-28', 'Confirmed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `phone`, `user_id`) VALUES
(1, 'abc', 'qui@gmail.com', '03211554544', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `reviewID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `tourID` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `review`
--

INSERT INTO `review` (`reviewID`, `userID`, `tourID`, `rating`, `comment`, `createdAt`) VALUES
(2, 2, 1, 5, 'acx', '2025-11-28 15:31:11'),
(3, 2, 1, 5, 'cc', '2025-11-28 15:31:56'),
(4, 2, 2, 5, 'dsadasd', '2025-11-28 15:35:19'),
(5, 2, 2, 4, 'cmn', '2025-11-28 15:37:00'),
(6, 2, 2, 5, 'thằng bố mày', '2025-11-28 15:37:09'),
(7, 2, 2, 5, 'tổ bà mày', '2025-11-28 15:37:15'),
(8, 2, 2, 3, 'con chó', '2025-11-28 15:37:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour`
--

CREATE TABLE `tour` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` double NOT NULL,
  `start_date` date NOT NULL,
  `capacity` int(11) DEFAULT 20,
  `imageURL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tour`
--

INSERT INTO `tour` (`id`, `name`, `description`, `price`, `start_date`, `capacity`, `imageURL`) VALUES
(1, 'Tour Đà Nẵng', 'Khám phá biển xanh', 5000000, '2023-12-01', 20, 'https://ik.imagekit.io/tvlk/blog/2022/09/dia-diem-check-in-da-nang-cover.jpeg'),
(2, 'Tour Sapa', 'Leo núi và thưởng thức văn hóa', 3000000, '2023-11-15', 20, 'https://media.vietravel.com/images/Content/dia-diem-du-lich-sapa-1.png'),
(3, 'Hà Giang - Mùa Hoa Tam Giác Mạch', 'Chinh phục đèo Mã Pí Lèng, Cột cờ Lũng Cú, Phố cổ Đồng Văn và ngắm hoa Tam Giác Mạch tuyệt đẹp.', 3500000, '2025-12-10', 20, 'https://vitracotour.com/wp-content/uploads/2023/12/ha-giang-1.jpg'),
(4, 'Hạ Long - Ngủ Đêm Du Thuyền 5 Sao', 'Trải nghiệm đẳng cấp trên du thuyền, thăm hang Sửng Sốt, chèo Kayak và tiệc trà chiều ngắm hoàng hôn.', 4200000, '2025-12-25', 20, 'https://phetravel.com/uploads/tour-vinh-ha-long-2ngay-1-dem.jpg'),
(5, 'Sapa - Chinh Phục Fansipan', 'Săn mây trên đỉnh Fansipan, thăm bản Cát Cát và thưởng thức lẩu cá tầm nóng hổi trong tiết trời se lạnh.', 3800000, '2026-01-05', 20, 'https://lotustourist.vn/wp-content/uploads/2024/02/Chinh-Phuc-Fansipan-SaPa1.jpeg'),
(6, 'Hành Trình Di Sản Miền Trung', 'Huế - Đà Nẵng - Hội An. Tham quan Đại Nội, Chùa Cầu, tắm biển Mỹ Khê và thưởng thức cao lầu.', 5500000, '2026-01-15', 20, 'https://vietdulich.com.vn/uploads/details/2022/08/images/tour-mien-trung-7.jpg'),
(7, 'Quy Nhơn - Phú Yên: Xứ Nẫu Thân Thương', 'Check-in Eo Gió, Kỳ Co, Ghềnh Đá Đĩa và bãi Xếp (phim trường Tôi thấy hoa vàng trên cỏ xanh).', 4900000, '2026-02-10', 20, 'https://lalago.vn/wp-content/uploads/2025/06/Tour-Quy-Nhon-3-ngay-2-dem-3.jpg'),
(8, 'Nha Trang - Thiên Đường Biển Đảo', 'Vui chơi tại VinWonders, lặn ngắm san hô tại Hòn Mun, tắm bùn khoáng nóng I-Resort.', 4500000, '2025-12-30', 20, 'https://puolotrip.com/uploads/images/2019/05/tour-du-lich-nha-trang-jpg.webp'),
(9, 'Đà Lạt - Thành Phố Ngàn Hoa', 'Săn mây đồi chè Cầu Đất, tham quan Langbiang, Thung lũng Tình Yêu và thưởng thức cafe view đồi.', 3200000, '2025-12-20', 20, 'https://puolotrip.com/uploads/images/hinh-anh-da-lat-8.jpg'),
(10, 'Khám Phá Đảo Ngọc Phú Quốc', 'Tour 4 đảo bằng cano, cáp treo Hòn Thơm, ngắm hoàng hôn tại Sunset Sanato và chợ đêm.', 6800000, '2026-01-20', 30, NULL),
(11, 'Miền Tây Sông Nước Cửu Long', 'Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau. Đi chợ nổi Cái Răng, thăm nhà công tử Bạc Liêu.', 3900000, '2026-02-05', 25, NULL),
(12, 'Thái Lan: Bangkok - Pattaya', 'Khám phá xứ sở Chùa Vàng, đảo Coral, chợ nổi 4 miền và thưởng thức Buffet tại tòa nhà 86 tầng.', 8500000, '2026-03-10', 40, NULL),
(13, 'Nhật Bản: Cung Đường Vàng Mùa Xuân', 'Tokyo - Phú Sĩ - Kyoto - Osaka. Ngắm hoa anh đào sớm, tắm Onsen và thưởng thức bò Kobe.', 32900000, '2026-03-25', 20, 'https://nippontravel.vn/wp-content/uploads/2024/04/tour-cung-duong-vang-nhat-ban.webp'),
(14, 'Tour Du Lịch Huế', 'Huế mộng Huế mơ', 1000000, '2025-11-29', 20, 'https://www.arttravel.com.vn/upload/sanpham/hue-4-6059-6700.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2a$10$iDi5nDAn5AAT/Xrk3El2Du2qWwtPv3DmInTU4YrgScKSfpfj2gCAG', 'admin'),
(2, 'user1', '$2a$10$I3F5QcbiAifts3Sln/xOZuWDQQILnuZ4oyyH9yGimvtGXczbiTcz2', 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_id` (`tour_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `fk_review_tour` (`tourID`),
  ADD KEY `fk_review_customer` (`userID`);

--
-- Chỉ mục cho bảng `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tour`
--
ALTER TABLE `tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_customer` FOREIGN KEY (`userID`) REFERENCES `customer` (`user_id`),
  ADD CONSTRAINT `fk_review_tour` FOREIGN KEY (`tourID`) REFERENCES `tour` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
