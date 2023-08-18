-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 27, 2023 lúc 03:22 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `prod_qty` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `prod_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `price`, `prod_qty`, `image`, `prod_id`) VALUES
(128, 2, 'English Grammar in Use Book w Ans', 178000, 1, 'english_grammar_in_use_bookwAns.jpg', 26),
(129, 2, 'Thay Đổi Cuộc Sống Với Nhân Số Học', 248000, 1, 'thay-doi-cuoc-song-voi-nhan-so-hoc.jpg', 25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(1, 'Sách trong nước'),
(2, 'Sách nước ngoài');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(11) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(4, 2, 'Nguyễn Văn B', 'VanB@gmail.com', '0123456789', 'Test!!');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'Chưa xử lý'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(36, 2, 'Huỳnh Hoàng Minh', '0852099497', 'minhhuynh197277@gmail.com', 'Thanh toán khi giao hàng', '123, Tô Hiến Thành, Phường 13, Quận 10, HCM', ' Nhà Giả Kim (1)  Trăng Lạnh (1) ', 165000, '11-May-2023', 'Chưa xử lý'),
(37, 2, 'Hoàng Minh', '09090909', 'minh@gmail.com', 'Thanh toán khi giao hàng', '123, Tô Hiến Thành, Phường 13, Quận 10, HCM', ' Trăng Lạnh (1)  Nhà Giả Kim (1) ', 165000, '11-May-2023', 'Chưa xử lý'),
(39, 2, 'Huỳnh Hoàng Minh', '0852099497', 'minhhuynh197277@gmail.com', 'Thanh toán khi giao hàng', '123, Tô Hiến Thành, Phường 13, Quận 10, HCM', ' Trăng Lạnh (1)  Mình Chỉ Là Người Bình Thường (1) ', 234000, '12-May-2023', 'Chưa xử lý');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(191) NOT NULL,
  `prod_id` int(191) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` int(191) NOT NULL,
  `creatd_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `name`, `image`, `qty`, `price`, `creatd_at`) VALUES
(19, 36, 16, 'Trăng Lạnh', 'trang_lanh.jpg', 1, 96000, '2023-05-11 19:09:58'),
(20, 36, 15, 'Nhà Giả Kim', 'nha_gia_kim.jpg', 1, 69000, '2023-05-11 19:09:58'),
(21, 37, 15, 'Nhà Giả Kim', 'nha_gia_kim.jpg', 1, 69000, '2023-05-11 19:18:45'),
(22, 37, 16, 'Trăng Lạnh', 'trang_lanh.jpg', 1, 96000, '2023-05-11 19:18:45'),
(23, 38, 13, 'Bí Mật Của Naoko', 'bi_mat_cua_naoko.jpg', 1, 99000, '2023-05-11 19:24:12'),
(24, 39, 18, 'Mình Chỉ Là Người Bình Thường', 'minh_chi_la_nguoi_binh_thuong.jpg', 1, 138000, '2023-05-12 19:01:41'),
(25, 39, 16, 'Trăng Lạnh', 'trang_lanh.jpg', 1, 96000, '2023-05-12 19:01:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `author`, `id_cat`, `category`, `price`, `image`, `stock`, `description`) VALUES
(12, 'Bạch Dạ Hành', 'Higashino Keigo', 2, 'Sách nước ngoài', 169000, 'bach_da_hanh.jpg', 100, 'Được dịch từ tiếng Anh-Journey Under the Midnight Sun là một tiểu thuyết bí ẩn được viết bởi Keigo Higashino, được đăng lần đầu trên tạp chí tiểu thuyết hàng tháng Subaru từ Shueisha từ tháng 1 năm 1997 đến tháng 1 năm 1999. Toàn bộ tập truyện được xuất bản vào tháng 8 năm 1999 và trở thành một cuốn sách bán chạy nhất.'),
(13, 'Bí Mật Của Naoko', 'Higashino Keigo', 2, 'Sách nước ngoài', 98000, 'bi_mat_cua_naoko.jpg', 150, 'Bí mật của Naoko là một tiểu thuyết của nhà văn Higashino Keigo. Tên gốc của cuốn tiểu thuyết này là Himitsu. '),
(14, 'Cây Cam Ngọt Của Tôi', 'José Mauro de Vasconcelos', 2, 'Sách nước ngoài', 77000, 'cay_cam_ngot_cua_toi.jpg', 150, 'Được dịch từ tiếng Anh-My Sweet Orange Tree là một tiểu thuyết của José Mauro de Vasconcelos. Cuốn sách được xuất bản lần đầu tiên vào năm 1968 và được sử dụng cho các lớp học văn của các trường tiểu học ở Brazil. Nó cũng đã được dịch và xuất bản ở Mỹ và Châu Âu.'),
(15, 'Nhà Giả Kim', 'Paulo Coelho', 2, 'Sách nước ngoài', 69000, 'nha_gia_kim.jpg', 100, 'Nhà giả kim là tiểu thuyết được xuất bản lần đầu ở Brasil năm 1988, và là cuốn sách nổi tiếng nhất của nhà văn Paulo Coelho. Tác phẩm đã được dịch ra 67 ngôn ngữ và bán ra tới 95 triệu bản, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại.'),
(16, 'Trăng Lạnh', 'Jeffery Deaver', 2, 'Sách nước ngoài', 96000, 'trang_lanh.jpg', 100, 'Được dịch từ tiếng Anh-The Cold Moon là một tiểu thuyết kinh dị tội phạm được viết bởi Jeffery Deaver. Đây là cuốn sách thứ bảy trong loạt Lincoln Rhyme, và cũng giới thiệu đặc vụ Kathryn Dance của CBI, người sẽ nhận được loạt sách của riêng mình.'),
(17, 'Tôi Là Bêtô', 'Nguyễn Nhật Ánh', 1, 'Sách trong nước', 85000, 'toi_la_beto.jpg', 100, 'Tôi Là Bêtô là tác phẩm của nhà văn chuyên viết cho thanh thiếu niên Nguyễn Nhật Ánh. Ông đã được đông đảo bạn đọc biết đến qua các tác phẩm quen thuộc như Thằng quỷ nhỏ, Trại hoa vàng, Bong bóng lên trời, Cô gái đến từ hôm qua… và hai bộ truyện nhiều tập Kính vạn hoa và Chuyện xứ Lang Biang.'),
(18, 'Mình Chỉ Là Người Bình Thường', 'Kulzsc', 2, 'Sách nước ngoài', 138000, 'minh_chi_la_nguoi_binh_thuong.jpg', 120, '“Mình chỉ là người bình thường” - muốn trao đi rất nhiều yêu thương  còn là NHẬT KÍ của chính tác giả, ghi lại khoảng thời gian thanh xuân tươi đẹp nhất của Kulzsc. Đẹp bởi những điều tuyệt vời, đẹp bởi những khi may mắn, đẹp bởi cả những lúc khó khăn, đẹp bởi cô đơn, đẹp bởi những rung động thật khẽ…'),
(23, 'Không Phải Sói Nhưng Cũng Đừng Là Cừu', 'Lê Bảo Ngọc', 1, 'Sách trong nước', 128000, 'khong-phai-soi-nhung-cung-dung-la-cuu.jpg', 120, 'Cuốn sách “Không phải sói nhưng cũng đừng là cừu” của tác giả Lê Bảo Ngọc - admin Tâm Lý Học Tổ Kén đồng thời là Giám đốc Trung tâm Pháp Luật và Văn hóa sẽ là câu trả lời thấu suốt và khiến bạn phải đặt ra câu hỏi cho lối tư duy bấy lâu bạn luôn nghĩ là đúng. Bạn sẽ là người giải phóng chính mình, khỏi gông xiềng của định kiến, quy chuẩn cũ kĩ vốn được thiết lập lên để mang lại lợi ích cho kẻ khác. Và bạn sẽ không còn phải lăn tăn giữa tốt và xấu, sói hay cừu, vì điều đó là không quan trọng. Bạn'),
(24, 'Rèn Luyện Tư Duy Phản Biện', 'Albert Rutherford', 1, 'Sách trong nước', 99000, 'ren-luyen-tu-duy-phan-bien.jpg', 80, 'Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện!'),
(25, 'Thay Đổi Cuộc Sống Với Nhân Số Học', 'Lê Đỗ Quỳnh Hương', 1, 'Sách trong nước', 248000, 'thay-doi-cuoc-song-voi-nhan-so-hoc.jpg', 110, 'Cuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị Lê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc “The Complete Book of Numerology” của tiến sỹ David A. Phillips, khiến bộ môn Nhân số học khởi nguồn từ nhà toán học Pythagoras trở nên gần gũi, dễ hiểu hơn với độc giả Việt Nam.'),
(26, 'English Grammar in Use Book w Ans', 'Raymond Murphy', 2, 'Sách nước ngoài', 178000, 'english_grammar_in_use_bookwAns.jpg', 60, 'The world\'s best-selling grammar series for learners of English. English Grammar in Use Fourth edition is an updated version of the world\'s best-selling grammar title. It has a fresh, appealing new design and clear layout, with revised and updated examples, but retains all the key features of clarity and accessibility that have made the book popular with millions of learners and teachers around the world. This \'with answers\' version is ideal for self-study. '),
(27, '999 Lá Thư Gửi Cho Chính Mình', 'Miêu Công Tử', 1, 'Sách trong nước', 99000, '999-la-thu-gui-cho-chinh-minh.jpg', 55, 'Theo dòng chảy hối hả của cuộc sống hiện nay – khi mỗi một ngày đều trôi qua nhanh chóng nhưng chẳng đọng lại được điều gì thì việc viết lách hay nhắn nhủ những lời tâm tình cho nhau càng trở thành một điều xa xỉ, dường như chẳng mấy ai nguyện làm. Nhưng không sao hết, đã có “999 lá thư gửi cho chính mình” – với Phiên bản chọn lọc, tổng hợp lại những lá thư hay nhất, những lá thư ý nghĩa nhất, chất chứa nội hàm, khả năng chữa lành cao sẽ thay những lá thư tay nói lên những điều bạn muốn giãi bày');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  `user_status` varchar(20) NOT NULL DEFAULT 'Hoạt động'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `user_status`) VALUES
(1, 'admin', 'admin@gmail.com', 'c92f1d1f2619172bf87a12e5915702a6', 'admin', 'Hoạt động'),
(2, 'Hoàng Minh', 'minh@gmail.com', 'c92f1d1f2619172bf87a12e5915702a6', 'user', 'Hoạt động'),
(7, 'Minh test', 'test@gmail.com', 'c92f1d1f2619172bf87a12e5915702a6', 'user', 'Tạm ngưng'),
(8, 'Hoàng Minh', 'minh2@gmail.com', 'c92f1d1f2619172bf87a12e5915702a6', 'user', 'Hoạt động');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
