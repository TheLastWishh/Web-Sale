-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: electrohub
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitems` (
  `CartItemID` int NOT NULL AUTO_INCREMENT,
  `ShoppingCartID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ProductID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `QuantityProduct` int DEFAULT '0',
  PRIMARY KEY (`CartItemID`),
  KEY `ShoppingCartID` (`ShoppingCartID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`ShoppingCartID`) REFERENCES `shoppingcart` (`ShoppingCartID`),
  CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` VALUES (36,'FA27495459','12',2),(38,'FA27495459','23',1),(39,'FA27495459','32',2);
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentID` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(1000) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `rating` int NOT NULL,
  `ProductID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `fk_product` (`ProductID`),
  CONSTRAINT `fk_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Sản phẩm tốt','phnam123','phamnam120103@gmail.com','2024-05-27 13:04:15',3,'1'),(2,'Sản phẩm hơi lởm','Nam','phamnam120103@gmail.com','2024-05-27 13:30:13',5,'1'),(3,'Sản phẩm như củ cải','Nam','phamnam120103@gmail.com','2024-06-03 12:49:53',1,'1'),(4,'sản phẩm tốt','Nam','phamnam120103@gmail.com','2024-06-03 21:47:22',4,'13'),(5,'hàng dùng tốt','phnam123','phamnam120103@gmail.com','2024-06-22 14:07:06',5,'7'),(6,'Ti vi siêu nét','Nam','phamdangnam0308@gmail.com','2024-07-12 17:28:09',5,'20'),(7,'sản phẩm tốt','phnam123','phamnam120103@gmail.com','2024-07-15 20:39:20',3,'21');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `DiscountID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `DiscountName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Decription` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ProductID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `DiscountPercentage` int DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`DiscountID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupproduct`
--

DROP TABLE IF EXISTS `groupproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupproduct` (
  `GroupProductID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `GroupProductName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`GroupProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupproduct`
--

LOCK TABLES `groupproduct` WRITE;
/*!40000 ALTER TABLE `groupproduct` DISABLE KEYS */;
INSERT INTO `groupproduct` VALUES ('AE','Điện tử, Âm thanh'),('EA','Điện gia dụng'),('KA','Gia dụng nhà bếp'),('RF','Điện lạnh');
/*!40000 ALTER TABLE `groupproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ProductCategoryID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ImgProduct` varchar(200) DEFAULT NULL,
  `Description` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `CostPrice` decimal(18,2) DEFAULT NULL,
  `Price` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `ProductCategoryID` (`ProductCategoryID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ProductCategoryID`) REFERENCES `productcategories` (`ProductCategoryID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1','Samsung Smart TV UA55AU7700','TLVS','SS','/img/product/smart-tivi-samsung-4k-55-inch-55au7700-uhd_91627a78.jpg','Kích thước màn hình: 55 inch. Độ phân giải 4K UltraHD (3840x2160px). \r\nHệ điều hành, giao diện : Tizen OS. \r\nTổng công suất loa: 20W. \r\nCông Nghệ Motion Xcelerator cho khung hình rõ nét. \r\nTái hiện sắc màu chân thực với công nghệ PurColor. \r\nThưởng thức nội dung 4K chuẩn điện ảnh.',8,24000000.00,10490000.00),('10','Bếp từ siêu mỏng Kangaroo KG408I 2000W','IIC','KG','/img/product/bp-t-sieu-mng-kangaroo-kg408i-2000w_5f4cba50.jpg','Bếp từ đơn siêu mỏng, Công suất: 2000W. \r\nCó 2 quạt tản nhiệt, tiết kiệm năng lượng. \r\nĐèn LED hiển thị nhiệt độ.\r\nPhím cảm ứng đa chức năng. \r\nMặt kính cao cấp chịu nhiệt, chống xước.',10,1850000.00,699000.00),('100','Smart Tivi LG 4K 55 inch 55UQ8000PSC ThinQ AI','TLVS','LG','https://cdn.mediamart.vn/images/product/smart-tivi-lg-4k-55-inch-55uq8000psc-thinq-ai_19de1036.jpg','Độ sống động, màu sắc và độ sâu của hình ảnh 4K Ultra HD đáng kinh ngạc\r\nChất lượng âm thanh hấp thụ và không khí với AI Sound\r\nNền tảng thông minh webOS với Freeview Play, Netflix, Disney + và hơn thế nữa\r\nKiểu dáng đẹp và mỏng với chân đế hình lưỡi liềm\r\nLệnh điều khiển bằng giọng nói dễ dàng với Trợ lý Google và Alexa\r\nBộ xử lý α5 Gen5 AI Processor 4K sử dụng thuật toán học sâu để phân tích nội dung gốc và tối ưu hóa độ sắc nét hình ảnh',100,19000000.00,16000000.00),('11','Máy giặt lồng ngang LG Inverter 9Kg FM1209S6W','WM','LG','/img/product/may-git-lng-ngang-lg-inverter-9kg-fm1209s6w_65ebfe90.jpg','Máy giặt có khối lượng giặt 9kg thích hợp cho gia đình khoảng 6 người. \r\nĐộng cơ Smart Inverter giúp giảm rung ồn, tiết kiệm điện nước hiệu quả. \r\nCông nghệ giặt 6 chuyển động giúp giặt giũ tối ưu, bảo vệ cấu trúc sợi vải. \r\nCông nghệ Giặt hơi nước Steam™ giảm nhăn, diệt khuẩn, ngăn dị ứng.',5,11490000.00,5990000.00),('12','Máy lọc nước Kangaroo 9 cấp infinity KG109I','WT','KG','/img/product/may-lc-nuc-kangaroo-9-cp-infinity-kg109i_96032a21.png','Thiết kế tràn viền vô cực. \r\nĐiều khiển cơ bằng van tích hợp thân vòi. \r\nLõi Ion Exchange xử lý hiệu quả nước cứng, nước nhiễm đá vôi. \r\nBổ sung vi khoáng tự nhiên cần thiết cho sức khỏe. \r\nTạo nước có độ pH và điện giải tối ưu cho cơ thể. \r\nHệ thống cút nối nhanh ngăn chặn rò rỉ nước. \r\nMàng RO Vortex giảm 75% nước thải.',12,7680000.00,4690000.00),('13','Smart Tivi 4K Sony KD-55X75K 55 inch Google TV','TLVS','SN','/img/product/Smart Tivi 4K Sony KD-55X75K 55 inch Google TV.jpg','Tivi 55 inch, độ phân giải 4K sắc nét.\r\nBộ xử lý X1 4K HDR xử lý hình ảnh tinh vi, giảm nhiễu, giảm mờ, tăng độ chi tiết.\r\nDolby Atmos công nghệ có khả năng tạo nên âm thanh vòm 3 chiều sống động.\r\nHệ điều hành Google TV có giao diện gọn gàng, kho ứng dụng phong phú.\r\nĐiều khiển, tìm kiếm trên tivi với trợ lý ảo Google Assistant.\r\nChiếu màn hình điện thoại lên tivi thông qua Chromecast.',20,21400000.00,13390000.00),('14','Tủ lạnh Side by side 680L Samsung RS62R5001M9 Digital Inverter','FD1','SS','https://cdn.mediamart.vn/images/product/t-lnh-side-by-side-680l-samsung-rs62r5001m9sv-digital-inverter_d99cff8d.jpg','Thiết kế Side by Side đẳng cấp, thời thượng.\r\nTăng thêm dung tích với công nghệ Spacemax viền siêu mỏng.\r\nCông nghệ làm lạnh vòm đảm bảo nhiệt độ đồng đều tại mọi vị trí.\r\nTiết kiệm điện, vận hành êm ái với công nghệ Digital Inverter.\r\nLàm Lạnh Nhanh và Đông Đá Nhanh Chế Độ Power Cool/Power Freeze.\r\nBộ lọc khử mùi than hoạt tính.\r\nChuông báo cửa mở tiện ích.',19,24900000.00,19990000.00),('15','Điều hòa Panasonic 1 chiều Inverter 1HP-9.040BTU CS-PU9AKH-8','AC','PNSN','https://cdn.mediamart.vn/images/product/dieu-hoa-panasonic-1-chieu-inverter-1hp-9040btu-cs-pu9akh-8m_f290c29a.png','Thiết kế hiện đại, công suất 1 HP - 9040 BTU phù hợp phòng có diện tích dưới 15m2.\r\nCông nghệ Nanoe-G tiêu diệt đến hơn 99% vi khuẩn. \r\nChế độ ECO tích hợp AI tiết kiệm năng lượng tối đa lên đến 20%.\r\nLàm lạnh nhanh với Powerful giúp bạn tận hưởng không gian mát lạnh. \r\nSử dụng môi chất lạnh R32 thân thiện với môi trường. \r\nDàn tản nhiệt phủ Bluefin bền bỉ với thời gian.',10,13100000.00,11690000.00),('16','Điều hòa Panasonic 1 chiều Inverter 2HP-17.700BTU CS-PU18AKH-8','AC','PNSN','https://cdn.mediamart.vn/images/product/dieu-hoa-panasonic-1-chieu-inverter-2hp-17700btu-cs-pu18akh-8_4131090f.png','Công suất làm lạnh 2 HP phù hợp không gian dưới 25m².\r\nLọc sạch không khí, loại bỏ bụi mịn PM 2.5 với bộ lọc Nanoe-G.\r\nCông nghệ Powerful làm lạnh nhanh hơn 18% ngay sau khi bật máy lạnh.\r\nTiết kiệm điện năng tối đa với công nghệ Inverter và ECO tích hợp A.I.\r\nChức năng tự chẩn đoán lỗi giúp tiết kiệm chi phí sửa chữa.',30,23680000.00,21190000.00),('17','Điều hòa Panasonic 1 chiều Inverter 2HP-17.700BTU CS-PU18AKH-8','AC','PNSN','https://cdn.mediamart.vn/images/product/dieu-hoa-panasonic-1-chieu-inverter-2hp-17700btu-cs-pu18akh-8_4131090f.png','Công suất làm lạnh 2 HP phù hợp không gian dưới 25m².\r\nLọc sạch không khí, loại bỏ bụi mịn PM 2.5 với bộ lọc Nanoe-G.\r\nCông nghệ Powerful làm lạnh nhanh hơn 18% ngay sau khi bật máy lạnh.\r\nTiết kiệm điện năng tối đa với công nghệ Inverter và ECO tích hợp A.I.\r\nChức năng tự chẩn đoán lỗi giúp tiết kiệm chi phí sửa chữa.',30,23680000.00,21190000.00),('18','Điều hòa Samsung Wind-Free 1 chiều Inverter 2HP-18.000BTU','AC','SS','https://cdn.mediamart.vn/images/product/diu-hoa-samsung-wind-free-cao-cp-1-chiu-inverter-2hp-18000btu-ar18cyfaawknsv_6c89ad64.jpg','Có công suất làm lạnh 2 HP, hơi lạnh phù hợp cho phòng từ 20 - 30m².\r\nTiết kiệm điện năng, làm lạnh hiệu quả nhờ công nghệ Digital Inverter Boost và Eco.\r\nBộ lọc Copper Anti-bacteria Filter lọc bụi và có thể tháo dỡ vệ sinh dễ dàng.\r\nCông nghệ Fast Cooling tăng hiệu suất làm lạnh nhanh không gian.\r\nHơi lạnh tỏa ra đồng đều và dễ chịu với chế độ Wind-Free.\r\nTự hong khô dàn lạnh, hạn chế vi khuẩn phát triển với chức năng tự làm sạch Auto Clean.\r\nCó thể điều khiển nhiệt độ máy lạnh bất cứ đâu qua ứng dụng SmartThings.\r\nLàm lạnh thông minh AI Auto Cooling hơi lạnh tỏa ra nhanh chóng.',12,23990000.00,14990000.00),('19','Điều hòa LG 2 chiều Inverter 2.5HP-24.000BTU B24END1','AC','LG','https://cdn.mediamart.vn/images/product/diu-hoa-lg-2-chiu-inverter-24000btu-b24end1_a5bc826f.jpg','Dòng máy lạnh 2 chiều vừa làm lạnh vừa sưởi tiện lợi.\r\nCông nghệ Dual Inverter tiết kiệm 70% điện năng.\r\nMàng lọc sơ cấp có thể lọc bụi và lông thú hiệu quả.\r\nCông suất 24000 BTU phù hợp với diện tích từ 30 - 40m²\r\nVới đảo gió 4 chiều nên hơi lạnh lan tỏa đồng đều khắp mọi vị trí trong phòng.\r\nChức năng tự chẩn đoán lỗi giúp thông báo lỗi trên dàn lạnh.\r\nLàm lạnh nhanh không gian qua công nghệ Jet Cool.',36,31890000.00,23990000.00),('2','Điều hòa LG 1 chiều Inverter 1HP-8.800BTU V10WIN','AC','LG','https://cdn.mediamart.vn/images/product/diu-hoa-lg-1-chiu-inverter-8800btu-v10win_751d85e1.jpg','Điều hòa 1 chiều sử dụng ga R32 với công nghệ Inverter. \r\nCông suất 1 HP - 8800 BTU phù hợp với diện tích không gian dưới 15 m2. \r\nLàm lạnh nhanh hơn nhờ chế độ Jet Cool. \r\nTiết kiệm lên đến điện năng, vận hành ổn định nhờ công nghệ Dual Inverter. \r\nỐng dẫn gas bằng đồng - lá tản nhiệt bằng nhôm phủ lớp Gold Fin có độ bền cao, tăng hiệu suất làm lạnh. \r\nTiết kiệm thời gian, chi phí sửa chữa nhờ chức năng tự chẩn đoán lỗi. \r\nBảo vệ sức khỏe của bạn với chế độ ngủ đêm tránh buốt.',5,11090000.00,7490000.00),('20','Smart Tivi Coex 4K 55 inch 55UT7000XG Google TV','TLVS','CX','https://cdn.mediamart.vn/images/product/smart-tivi-coex-4k-50-inch-50ut7000xg-google-tv_e3f46952.jpg','Màn hình 50 Inch độ phân giải 4K UHD thiết kế tràn viền 3 cạnh\r\nHệ điều hành Google TV, kho ứng dụng phong phú\r\nCông nghệ hình ảnh HDR 10, âm thanh Dolby Audio + DTS\r\nHỗ trợ Google Assitant - điều khiển, tìm kiếm bằng giọng nói tiện lợi\r\nCông nghệ âm thanh Dolby Audio + DTS mang rạp hát đến căn phòng của bạn',30,13590000.00,6990000.00),('21','QLED Tivi 4K Samsung 55Q60B 55 inch Smart TV','TLVS','SS','https://cdn.mediamart.vn/images/product/qled-tivi-4k-samsung-55q60b-55-inch-smart-tv_d3c52449.jpg','Màn hình vô cực khai phóng tầm nhìn\r\nĐộ phân giải 4K siêu thực, nâng cấp chuẩn 4K\r\nÂm thanh vòm theo chuyển động hình ảnh OTS\r\nTuyệt tác thiết kế ấn tượng từ tương lai',30,22900000.00,12990000.00),('22','OLED Tivi 4K LG 55 inch 55A2PSA ThinQ AI','TLVS','LG','https://cdn.mediamart.vn/images/product/oled-tivi-4k-lg-55-inch-55a2psa-thinq-ai_791f27c6.jpg','LG 4K SELF-LIT OLED evo - độ sáng thực sự rõ ràng của nội dung\r\nThiết kế phòng trưng bày siêu mỏng (19,9 mm) và được tích hợp sẵn giá treo tường vừa vặn\r\nBộ xử lý AI α7 Gen5 nâng cao 4K cho hình ảnh và âm thanh đỉnh cao\r\nĐiện ảnh & thể thao đỉnh cao với Dolby Vision IQ và Dolby Atmos\r\nChơi game vô song với HDMI 2.1, VRR, HFR, Game Optimiser\r\nTại sao chọn LG OLED?\r\nOLED hiển thị dễ chịu cho mắt, thân thiện với môi trường\r\nTrí tuệ nhân tao thông minh vượt bậc ThinQ AI',30,42900000.00,18990000.00),('23','QLED TV 4K Coex 75QA9000XG 75\" Google TV','TLVS','CX','https://cdn.mediamart.vn/images/product/qled-tv-4k-coex-75qa9000xg-75-google-tv_33b8992d.png','Màn hình 75 Inch độ phân giải 4K UHD thiết kế tràn viền 3 cạnh\r\nHệ điều hành Google TV, kho ứng dụng phong phú\r\nCông nghệ hình ảnh HDR 11, âm thanh Dolby Atmos\r\nHỗ trợ Google Assitant - điều khiển, tìm kiếm bằng giọng nói tiện lợi\r\nCông nghệ âm thanh Dolby Atmos mang rạp hát đến căn phòng của bạn',30,26900000.00,21990000.00),('24','Tủ lạnh Sharp Inverter 572 Lít 4 cửa SJ-FXP640VG-BK','FD1','SP','https://cdn.mediamart.vn/images/product/tu-lanh-sharp-inverter-572-lit-4-cua-sj-fxp640vg-bk_577677b0.png','J-Tech Inverter tiết kiệm điện ưu việt\r\nHệ thống Làm lạnh kép tản hơi lạnh hiệu quả, bộ lọc Nano Ag+Cu khử mùi \r\nChế độ Extra Cool làm lạnh nhanh, cấp đông nhanh Express Freezing\r\nNgăn trữ rau quả Moisture Shield, ngăn đông khổng lồ Mega Freezer\r\nBảng điều khiển cảm ứng',30,39260000.00,21900000.00),('25','Tủ lạnh Side by side Inverter COEX RS-4004MSW 535L','FD1','CX','https://cdn.mediamart.vn/images/product/t-lnh-side-by-side-inverter-coex-rs-4004msw-535l_45d31663.jpg','Dung tích 535 lít phù hợp cho gia đình trên 5 người\r\nTự động điều chỉnh nhiệt độ thông minh với công nghệ Smart Sensor\r\nCông nghệ Inverter Quattro tiết kiệm điện tối ưu, vận hành bền bỉ\r\nHệ thống làm lạnh 360 độ Aircooling đảm bảo thực phẩm giữ trọn vị tươi lâu\r\nCông nghệ No Frost giúp tủ không bị đóng tuyết và khí lạnh luôn được lưu thông\r\nBảng điều khiển song ngữ Anh - Việt, LED cảm ứng thông minh bên ngoài. \r\nChuông báo khi quên đóng cửa\r\nLấy nước bên ngoài độc đáo và tiện lợi\r\nBình nước 3L, dễ dàng vệ sinh\r\nKhay kính chịu được lực nặng lên đến 100kg',30,27290000.00,13990000.00),('26','Tủ lạnh LG Inverter 335L GN-M332PS','FD1','LG','https://cdn.mediamart.vn/images/product/t-lnh-lg-inverter-335l-gn-m332ps_3459b863.jpg','Công nghệ LINEARCooling™ giúp cho thực phẩm giữ lại hương vị tươi ngon\r\nCông nghệ làm mát từ cửa tủ Door Cooling+™ giúp làm lạnh nhanh hơn\r\nKiểm soát cài đặt tủ lạnh LG của bạn từ bất cứ nơi nào thông qua thiết bị hỗ trợ WiFi với LG ThinQ™\r\nCông nghệ Smart Inverter Compressor™ giúp tiết kiệm năng lượng và vận hành bền bỉ',100,14290000.00,8990000.00),('27','Tủ lạnh Side by side Inverter 442L COEX RS-4005MGB','FD1','CX','https://cdn.mediamart.vn/images/product/tu-lanh-side-by-side-inverter-442l-coex-rs-4005mgb-mat-guong_84043e65.png','Tủ lạnh Side By Side hiện đại, sang trọng với thiết kế 2 cửa bề mặt bề mặt Gương Đen \r\nlàm nổi bật lên vẻ đẹp cho không gian và dễ vệ sinh\r\nTự động điều chỉnh nhiệt thông minh với công nghệ Electronic Temperature Control\r\nCông nghệ Inveter tiết kiệm điện tối ưu, vận hành bền bỉ\r\nHệ thống làm lạnh R600a đảm bảo thực phẩm giữ trọn vị tươi lâu\r\nCông nghệ làm lạnh đa chiều Multi Air Flow hơi lạnh được tỏa đều, giữ nhiệt ổn định\r\nCông nghệ No Frost giúp tủ không bị đóng tuyết và khí lạnh luôn được lưu thông, lan tỏa đều khắp tủ\r\nBảng điều khiển LED hiển thị bên ngoài, Chuông báo khi quên đóng cửa\r\nKhay kính chịu được lực nặng lên đến 100 kg',100,20900000.00,12990000.00),('28','Tủ lạnh Side by side Bespoke Inverter 442 Lít COEX RS-4005MGWP','FD1','CX','https://cdn.mediamart.vn/images/product/tu-lanh-side-by-side-bespoke-inverter-442-lit---coex-rs-4005mgwp-mat-guong-trang-hong_a73f5939.png','Dung tích 442 lít phù hợp cho gia đình trên 5 - 7 người\r\nTủ lạnh SBS hiện đại, sang trọng với thiết kế 2 cửa, bề mặt Gương nổi bật lên vẻ đẹp \r\ncho không gian và dễ vệ sinh\r\nTự động điều chỉnh nhiệt thông minh với công nghệ Electronic Temperature Control\r\nCông nghệ Inveter tiết kiệm điện tối ưu, vận hành bền bỉ\r\nHệ thống làm lạnh sử dụng Gas R600a đảm bảo thực phẩm giữ trọn vị tươi lâu\r\nCông nghệ làm lạnh đa chiều Multi Air Flow hơi lạnh được tỏa đều, giữ nhiệt ổn định\r\nCông nghệ No Frost bảo quản thực phẩm không cần rã đông\r\nBảng điều khiển LED hiển thị bên ngoài\r\nChuông báo khi quên đóng cửa\r\nKhay kính chịu được lực nặng lên đến 100 kg',99,28900000.00,19990000.00),('29','Bộ loa thanh Sony HT-S400 330W','AS','SN','https://cdn.tgdd.vn/Products/Images/2162/302677/302677-600x600.jpg','Sony HT-S400 gồm có 1 loa thanh và 1 loa subwoofer thiết kế tinh tế, chắc chắn, \r\ntông màu đen đồng nhất sang trọng, hòa nhập vào không gian phòng khách, phòng \r\nlàm việc, phòng ngủ của bạn. \r\nVỏ loa được làm từ chất liệu nhựa và kim loại bền bỉ, hạn chế rạn nứt, \r\nbảo vệ tốt các linh kiện bên trong, lau chùi, vệ sinh dễ dàng khi bám bẩn.\r\nLoa thanh mặt sau phẳng có thể gắn lên tường hoặc đặt trên mặt bàn, kệ tủ vững vàng. \r\nLoa subwoofer thích hợp để bố trí trên sàn nhà, kệ tủ tùy theo thiết kế nội thất của từng không gian. ',29,5990000.00,5690000.00),('3','Lọc không khí Sharp FP-J30E','AF','SP','/img/product/may-loc-khong-khi-sharp-fpj30eb-KK1k7Q.jpg','Lọc không khí tối ưu hơn với 3 cấp độ quạt. \r\nKháng khuẩn, khử mùi hiệu quả với công nghệ Plasmacluster ion. \r\nHoạt động êm ái bảo vệ giấc ngủ của bạn. \r\nSử dụng cho phòng 15-20m2.',6,2990000.00,2190000.00),('30','Bộ loa thanh Sony HT-S40R 600W','AS','SN','https://cdn.tgdd.vn/Products/Images/2162/273221/273221-600x600.jpg','Bộ loa thanh Sony HT-S40R được thiết kế dạng khối hộp vuông vức, \r\nbo tròn các cạnh, màu đen sang trọng.\r\nBộ sản phẩm bao gồm một loa thanh soundbar, một loa Subwoofer, \r\nhai loa sau không dây và bộ khuếch đại không dây.\r\nDàn loa được làm từ hợp kim cao cấp, bền bỉ, bề mặt dễ lau chùi, vệ sinh.',100,8490000.00,7290000.00),('31','Loa kéo karaoke LG Xboom XL7S 250W','AS','LG','https://cdn.tgdd.vn/Products/Images/2162/309069/loa-karaoke-lg-xboom-xl7s-080623-054223-600x600.jpg','Loa kéo karaoke LG Xboom XL7S 250W có tính di động cao, \r\nmang đến chất lượng âm thanh trung thực, \r\nsống động nhờ công suất 250W cùng công nghệ Sound Boost. \r\nNgoài ra, loa còn trang bị bánh xe và tay kéo chắc chắn giúp dễ dàng di chuyển ra ngoài, \r\nđi kèm nhiều kết nối đa dạng để ghép nối với các thiết bị khác một cách linh hoạt, \r\ngiúp giải trí tốt hơn.',100,15490000.00,12920000.00),('32','Lọc không khí Sharp FP-J40E-W- Thailand','AF','SP','https://cdn.mediamart.vn/images/product/-7Wdy29.png','Lọc sạch không khí hiệu quả với bộ lọc Hepa kết hợp bộ phận cảm biến bụi, mùi.\r\nKhử mùi, loại bỏ nấm mốc, phấn hoa, kháng khuẩn tối ưu với công nghệ Plasmacluster Ion.\r\nSử dụng tiết kiệm điện với chế độ Inverter tiết kiệm điện.',100,5350000.00,4290000.00),('33','Lọc không khí Sharp FP-J80EV-H- Thailand','AF','SP','https://cdn.mediamart.vn/images/product/may-loc-khong-khi-sharp-fpj80evh-VLUt70.png','Diện tích hoạt động: 62m2, Khối lượng: 10.6kg\r\nCông nghệ PlasmaCluster Ion mật độ cao kháng khuẩn tốt (25.000 ion/cm3)\r\nNút điều khiển cảm ứng\r\nĐiều khiển và nhận thông báo tình trạng không khí trong phòng bằng smartphone',99,13620000.00,7450000.00),('34','Lọc không khí LG PuriCare™ AeroFurniture Màu trắng| AS20GPWU0','AF','LG','https://cdn.mediamart.vn/images/product/may-loc-khong-khi-lg-puricare-aerofurniture-mau-trang-as20gpwu0_94588e32.png','Thiết Kế Bàn Thông Minh Duy Trì Không Khí Trong Lành\r\nLoại bỏ 99,99% vi khuẩn trên cánh quạt giúp không khí trong nhà luôn trong lành.\r\nLàm sạch không khí một cách êm ái với luồng gió nhẹ nhàng từ Aero Furniture.\r\nĐiều khiển thông minhtrong tay bạn',100,19370000.00,10900000.00),('35','Quạt điều hòa Coex CA-7120A','FAN','CX','https://cdn.mediamart.vn/images/product/qut-diu-hoa-coex-ca-7120a-diu-khin-t-xa_e5483d4b.png','Công suất 80W tạo lưu lượng gió 600 m³/h, phù hợp với phòng từ 20 - 25 m2.\r\nĐa chức năng LÀM MÁT - TẠO ẨM - TẠO ION LÀM SẠCH KHÔNG KHÍ\r\nĐộ ồn thấp dưới mức ≤65dB không gây tiếng ồn \r\nTấm làm mát chất liệu gỗ sồi ép, làm mát hiệu quả và bảo vệ môi trường.\r\nDung tích lớn 5 lít, sử dụng liên tục hơn 8 tiếng.\r\nThang đo mực nước, tiện cho bạn theo dõi lượng nước trong bình \r\nChức năng làm mát không khí, tạo ion lọc sạch không khí, tạo ẩm\r\n3 tốc độ gió bình thường, tự nhiên và chế độ gió nhẹ khi ngủ \r\nTự động đảo chiều gió trái - phải tăng diện tích làm mát\r\nBảng điều khiển cảm ứng dễ dàng thao tác, kèm remote từ xa đa chức năng, hẹn giờ tắt 1 đến 7 tiếng\r\nTrang bị 2 cục đá khô giúp giảm nhiệt độ đáng kể và tăng hiệu quả làm mát\r\nTiết kiệm điện gấp 10 lần so với điều hòa không khí',99,2990000.00,1690000.00),('36','Quạt tích điện Coex - CF-7113R','FAN','CX','https://cdn.mediamart.vn/images/product/quat-tich-dien-coex---cf-7113r_1706e2e8.png','Làm mát liên tục đến 10 giờ/lần sạc\r\nPin sạc Lithium cao cấp – Bền bỉ vượt trội, sạc nhanh gấp 2 lần\r\nĐộng cơ bền – Vận hành êm ái\r\nMạch bảo vệ pin thông minh, đèn báo sạc đầy, an toàn sử dụng\r\nLồng quạt điều chỉnh xoay lên xuống, quay đảo chiều 180 độ\r\nThiết kế nhỏ gọn, làm mát mọi lúc mọi nơi',100,1990000.00,790000.00),('37','Quạt điều hòa Coex CA-7115','FAN','CX','https://cdn.mediamart.vn/images/product/qut-diu-hoa-coex-ca-7115_ebcdf7df.jpg','Công suất 150W tạo lưu lượng gió 3000 m³/h, phù hợp với phòng 30-40m2.\r\nĐộ ồn dưới mức 55dB tương đương tiếng văn phòng làm việc\r\nTấm làm mát chất liệu gỗ sồi ép, làm mát hiệu quả và bảo vệ môi trường.\r\nDung tích lớn 40 lít, sử dụng liên tục hơn 12 tiếng và tự động ngắt khi thiếu nước\r\nThang đo mực nước, tiện cho bạn theo dõi lượng nước trong bình và châm nước.\r\nChức năng làm mát không khí, tạo ion lọc sạch không khí, tạo ẩm\r\n3 mặt lấy gió, lưu lượng gió cực lớn, có lưới chắn bụi xung quanh\r\nCánh đảo gió 2 chiều tự động, kết hợp đá khô tăng diện tích làm mát\r\nBảng điều khiển nút nhấn và núm xoay đơn giản các chức năng tốc độ gió, làm mát, đảo gió\r\nTặng kèm 1 cục đá khô giúp giảm nhiệt độ đáng kể và tăng hiệu quả làm mát\r\nTiết kiệm điện gấp 10 lần so với điều hòa không khí',100,6490000.00,3290000.00),('38','Bình nóng lạnh 30L Kangaroo KG69A3','HT','KG','https://cdn.mediamart.vn/images/product/binh-nong-lnh-30l-kangaroo-kg69a3_7846a260.jpg','Bình nóng lạnh gián tiếp 30L Chống giật kép, Chống đun khô \r\nCông nghệ Nano kháng khuẩn, Hệ thống an toàn đồng bộ CSS \r\nLớp cách nhiệt pu mật độ cao\r\nTiết kiệm điện năng, Cài đặt nhiệt độ',100,4150000.00,2690000.00),('39','Bình nóng lạnh gián tiếp Kangaroo 30L Messi KG76A3','HT','KG','https://cdn.mediamart.vn/images/product/binh-nong-lnh-gian-tip-kangaroo-30l-messi-messi-kg76a3_3971c510.jpg','Dung tích 30L, công suất 2500W\r\nCông nghệ K-sensing độc quyền tiết kiệm 30% điện năng\r\nRuột bình 1 đường hàn duy nhất giúp chống rò rỉ, tăng tuổi thọ\r\nHệ thống bảo vệ đa cấp với ELCB chống giật\r\nChống nước tiêu chuẩn IPX4 toàn diện\r\nLòng bình tráng men kim cương nhân tạo siêu bền',100,4530000.00,2490000.00),('4','Loa tháp Samsung MX-T70','AS','SS','/img/product/loa-thap-samsung-mx-t70-xv-100323-044545-600x600.jpg','Thiết kế 2 mặt loa vát cạnh độc đáo, âm thanh đa hướng sống động. \r\nTái tạo chất âm đỉnh. \r\nHòa mình vào không khí bữa tiệc sôi động điều chỉnh ánh sáng đa dạng với hiệu ứng đèn LED DJ. \r\nDễ dàng điều khiển âm thanh.  \r\nKháng nước tối ưu hạn chế hư hỏng. \r\nTự tin tỏa sáng và thể hiện chất giọng trong mỗi bài hát nhờ chế độ Karaoke trên loa điện. \r\nGhép nối loa với hai thiết bị di động cùng một lúc. \r\nDễ dàng tận hưởng âm nhạc cùng bạn bè nhờ kết nối đa năng Bluetooth. \r\nHỗ trợ đa dạng kết nối.',12,10990000.00,7990000.00),('40','Bình nóng lạnh Panasonic 15L DH-15HAMVW','HT','PNSN','https://cdn.mediamart.vn/images/product/-tgq0mt.png','Bình nóng lạnh gián tiếp dung tích 15L\r\nĐèn báo nước nóng sẵn sàng, Ruột bình bằng Thép không gỉ từ Nhật\r\nThanh đốt bằng Đồng, Tích hợp sẵn ELB chống giật\r\nTự động ngắt nhiệt, Ruột bình bằng thép không gỉ',100,4290000.00,2990000.00),('41','Máy Lọc Nước RO 8 cấp Coex WP-7114','WT','CX','https://cdn.mediamart.vn/images/product/may-lc-nuc-ro-8-cp-coex-wp-7114_7d874d43.jpg','8 cấp lọc tiên tiến loại bỏ các chất bẩn độc hại và bổ sung khoáng chất\r\nMàng lọc RO LG made in Korea\r\nDung tích bình chứa 10L, Công suất lọc 15-20L/h\r\nNgăn chặn bùn đất rỉ sét, các tạp chất trong nước.\r\nKhử mùi clo dư, mùi tanh trong nước\r\nLoại bỏ các kim loại nặng, asen, amoni, mangan, chì, thuốc trừ sâu độc hại, \r\nLoại bỏ các vi khuẩn, virus, gây bệnh ...\r\nTăng oxy hòa tan trong nước, chống lão hóa và ngăn ngừa khô da.\r\nNước qua hệ thống lọc hoàn toàn tinh khiết và có thể uống ngay mà không cần đun',100,5260000.00,2590000.00),('42','Máy lọc nước Kangaroo 9 cấp Omega KG110 VTU','WT','KG','https://cdn.mediamart.vn/images/product/may-lc-nuc-kangaroo-9-cp-omega-kg110-vtu_b1830222.jpg','- Ngăn chặn bùn đất rỉ sét, các tạp chất trong nước.\r\n- Khử mùi clo dư, mùi tanh trong nước\r\n- Tăng oxy hòa tan trong nước, chống lão hóa và ngăn ngừa khô da.\r\n- Nước qua hệ thống lọc hoàn toàn tinh khiết và có thể uống ngay mà không cần đun sôi.\r\n- Loại bỏ sự ô nhiễm của máu, duy trì trạng thái thanh lọc máu, cải thiện lưu thông máu.\r\n- Công suất: 10 - 15L/h',100,6140000.00,3890000.00),('43','Tủ mát Kangaroo 238L KG298AT','FD2','KG','https://cdn.mediamart.vn/images/product/tu-mat-kangaroo-298l-kg298at-46pprC.png','- Dung tích Tổng/Thực: 298/238L\r\n- Khối lượng: 61 / 67 KG\r\n- Kích thước: 575 x 590 x 1705\r\n- Công suất: 150 W',100,10190000.00,9990000.00),('44','Tủ mát Aqua 235L AQS-AF340S','FD2','AQ','https://cdn.mediamart.vn/images/product/t-mat-aqua235l-aqs-af340s_bb1829a4.jpg','Dung tích tổng 235 lít\r\nCông nghệ làm mát đa chiều 360 độ\r\nDàn lạnh nhôm\r\nCó hộp đèn LED',100,10700000.00,9690000.00),('45','Bếp điện từ Coex CI-3370 2000W','IIC','CX','https://cdn.mediamart.vn/images/product/bep-dien-tu-coex-ci-3370-2000w_c0ffb143.png','Công suất 2000W, giúp nấu ăn nhanh- Mặt bếp bằng kính chịu lực, chịu nhiệt tốt, \r\nChống trầy xước và dễ chùi rửa\r\nBảng điều khiển 2 ngôn ngữ Anh/Việt  két hợp với màn hình LED hiên thị công suất sang trọng, dễ dùng.\r\nChế độ hẹn giờ nấu đến 180 phút, không mất thời gian đứng canh chừng\r\n6 Chế độ nấu đã được thiết lập sẵn : súp, hấp, chiên, xào, lẩu..\r\n8 mức điều chỉnh công suất và nhiệt độ đã được thiết lập trước điều chỉnh linh hoạt  từng món khác nhau\r\nHệ thống quạt và khe tản nhiệt giúp bếp luôn ổn định nhiệt, tránh hư hại\r\nCông suất điều chỉnh theo chế độ nấu\r\nTương thích điện từ EMC\r\nTặng kèm NỒI LẨU nắp kính ',200,1590000.00,990000.00),('47','Bếp điện từ COEX CI-3371 2000W','IIC','CX','https://cdn.mediamart.vn/images/product/bep-dien-tu-coex-ci-3371-2000w_8e7f4eaa.png','Công suất 2000W, giúp nấu ăn nhanh\r\nMặt bếp bằng kính chịu lực, chịu nhiệt tốt, Chống trầy xước và dễ chùi rửa\r\nBảng điều khiển 2 ngôn ngữ Anh/Việt  két hợp với màn hình LED hiên thị công suất sang trọng, dễ dùng.\r\nChế độ hẹn giờ nấu đến 180 phút, không mất thời gian đứng canh chừng\r\n8 Chế độ nấu đã được thiết lập sẵn : súp, hấp, chiên, xào, lẩu..\r\n8 mức điều chỉnh công suất và nhiệt độ đã được thiết lập trước điều chỉnh linh hoạt  từng món khác nhau\r\nHệ thống quạt và khe tản nhiệt giúp bếp luôn ổn định nhiệt, tránh hư hại\r\nCông suất điều chỉnh theo chế độ nấu\r\nTương thích điện từ EMC\r\nTặng kèm NỒI LẨU nắp kính',99,1790000.00,1090000.00),('48','Bếp điện từ đa năng cao cấp COEX CI-3303','IIC','CX','https://cdn.mediamart.vn/images/product/bp-din-t-da-nang-cao-cp-coex-ci-3303-kem-ni-lu_4d5e4120.jpg','Công suất 2000W giúp nấu ăn nhanh\r\nMặt kính siêu bền chịu được nhiệt lên đến 600 độ C\r\nBảng điều khiển cảm ứng bằng cảm ứng, dễ dùng.\r\nMàn hình LED hiển thị công suất \r\nChế độ hẹn giờ nấu xong thêm tiện ích sử dụng\r\nChế độ nấu: súp, hấp, chiên, xào, lẩu...\r\n8 mức công suất được thiết lập sẵn có thể điều chỉnh được\r\nKhóa an toàn đối với trẻ em và tự động ngắt khi quá tải, quá nhiệt\r\nĐiều khiển bằng tiếng Việt dễ dàng sử dụng',100,1700000.00,1190000.00),('49','Máy giặt lồng ngang LG Inverter 9Kg FB1209S6W','WM','LG','https://cdn.mediamart.vn/images/product/may-giat-long-ngang-lg-ai-dd-inverter-9kg-fb1209s6w_631b2192.png','Khối lượng giặt tối đa 9kg, thích hợp dùng cho khoảng 5 thành viên\r\nMáy giặt LG công nghệ Inverter tiết kiệm điện, nước, vận hành êm ái\r\nCông nghệ giặt 6 chuyển động tối ưu hóa giặt giũ, bảo vệ cấu trúc sợi vải\r\nChương trình giặt ngừa dị ứng loại bỏ các tác nhân dị ứng, bảo vệ làn da\r\nTính năng vệ sinh lồng giặt Tub Clean loại bỏ mảng bám, bụi bẩn tồn đọng\r\nMáy giặt LG thiết kế sang trọng, nâng tầm không gian sinh sống',100,7990000.00,6490000.00),('5','Nồi cơm điện cơ 1L Panasonic SR-MVN10FRAX','CK','PNSN','/img/product/ni-com-din-co-1l-panasonic-sr-mvn10frax_081455b0.jpg','Dung tích 1 lít đáp ứng khẩu phần cơm cho 2 - 4 người. \r\nCông suất 500W, công nghệ nấu 1D giúp nấu cơm chín nhanh, tiết kiệm thời gian. \r\nLòng nồi bằng hợp kim nhôm phủ chống dính bền tốt, nấu cơm an toàn, chống dính cháy, dễ vệ sinh. \r\nBảng điều khiển nút gạt có đèn báo, 2 chế độ: nấu cơm và giữ ấm.',30,1470000.00,990000.00),('50','Máy giặt Samsung Inverter 12Kg WA12CG5745BVSV','WM','SS','https://cdn.mediamart.vn/images/product/may-git-samsung-inverter-12kg-wa12cg5745bvsv_8677e228.jpg','Thiết kế sang trọng phù hợp với mọi không gian nội thất\r\nCông nghệ giặt siêu mịn Ecobubble làm sạch sâu, đánh bay mọi vết bẩn\r\nCông nghệ Digital Inverter tiết kiệm điện năng hiệu quả, bảo hành động cơ lên đến 20 năm.\r\nChế độ giặt nhanh Speed Spray giảm thời gian giặt tới 40% chỉ 31 phút.\r\nChẩn đoán sự cố với công nghệ Smart Check.\r\nChế độ vệ sinh lồng giặt, giúp lồng giặt tránh cặn bám và mùi hôi\r\nLưu lại hương thơm lâu hơn trên quần áo với chức năng Deep Softener',100,12190000.00,8890000.00),('51','Máy giặt lồng ngang Aqua Inverter 9Kg AQD-A902J.BK','WM','AQ','https://cdn.mediamart.vn/images/product/may-giat-long-ngang-aqua-inverter-9kg-aqd-a902jbk_6f12dd0e.png','Thiết kế dạng máy cửa trước - lồng ngang phong cách hiện đại, tông màu đen sang trọng\r\nKhối lượng giặt 9 kg phù hợp cho nhu cầu giặt giũ của gia đình từ 4 - 6 thành viên\r\nĐược tích hợp sẵn 15 chương trình giặt phù hợp cho nhu cầu giặt giũ khác nhau\r\nSmart Dual Spray tự làm sạch mặt trong cửa và vòng đệm cửa\r\nCông nghệ cân bằng AI DBT đảm bảo vận hành máy giặt êm ái và mạnh mẽ\r\nĐộng cơ Inverter giúp tiết kiệm điện năng tiêu thụ',100,8290000.00,7490000.00),('52','Nồi cơm điện cơ 1.2 Lít COEX CR-3414','CK','CX','https://cdn.mediamart.vn/images/product/ni-com-din-co-12-lit-coex-cr-3414_347d553f.jpg','Công suất 500W, Dung tích 1.2L phù hợp nấu bữa cơm ngon và nhanh cho 2-4 người \r\nThân nồi bằng nhựa PP siêu bền và cách nhiệt tốt \r\nCông nghệ 2D tỏa nhiệt từ 2 hướng\r\nMâm nhiệt lớn kết hợp lòng nồi dạng niêu\r\nLòng nồi 7 lớp dày 2.0 mm nặng 450 gram bằng hợp kim nhôm sơn ceramic chống dính \r\ndẫn nhiệt nhanh,nấu nhanh và cơm chín đều 2 chế độ \"Nấu \" và \"Hâm nóng \" điều chỉnh \r\nbằng nút gạt đơn giản, có đèn báo hiệu dễ quan sát\r\nVan thoát hơi thông minh hạn chế đọng nước, giữ tối đa vitamin và dưỡng chất',99,1190000.00,890000.00),('53','Nồi cơm điện 1,8L Toshiba RC-18JFM2(H)VN','CK','TSB','https://cdn.mediamart.vn/images/product/ni-com-din-18l-toshiba-rc-18jfm2hvn_d610f581.jpg','Công nghệ nhiệt 3D\r\nTự động giữ ấm đến 12h\r\nLòng nồi chống dính\r\nChế độ 3 trong 1 tiện lợi: nấu, hấp, giữ ấm.',100,1280000.00,750000.00),('54','Nồi cơm điện Sharp 1.8L KS-19TJV-BC','CK','SP','https://cdn.mediamart.vn/images/product/ni-com-din-sharp-18l-ks-19tjv-bc_a33c5532.jpg','Dung tích 1.8L, Công suất 700W\r\nGiữ ấm 5 giờ, Chống dính poly-flon\r\nKhả năng giữ ấm lên đến 12 giờ',100,910000.00,549000.00),('6','Quạt cây Toshiba F-LSA10(H)VN','FAN','TSB','/img/product/quat-dung-toshiba-flsa10hkvn-co-dieu-khien-zoaEhf.png','Quạt đứng công suất 50W mạnh mẽ, làm mát không gian rộng với 5 cánh quạt sải 40 cm. \r\nChế độ hẹn giờ tắt quạt kết hợp bảng điều khiển dễ sử dụng. \r\nKhởi động nhanh nhờ động cơ bạc thau. \r\nChiều cao thay đổi linh hoạt từ 114 - 133.5 cm tùy theo nhu cầu dùng.',20,1370000.00,890000.00),('7','Tủ lạnh Toshiba Inverter 249L GR-RT325WE-PMV(06)-MG','FD1','TSB','/img/product/tu-lanh-toshiba-inverter-249l-gr-rt325we-pmv06-mg_817142b8.png','Khử mùi hôi và diệt khuẩn tối đa nhờ vào công nghệ khử khuẩn Ag+ Bio. \r\nBảo quản thực phẩm tươi ngon không cần rã đông nhờ ngăn cấp đông mềm Ultra Cooling Zone -1°C. \r\nBảo quản thực phẩm luôn tươi ngon nhờ vào công nghệ khí lạnh vòng cung Multi Air Flow. \r\nTiết kiệm điện năng tối đa, vận hành êm ái nhờ công nghệ Origin Inverter. \r\nSở hữu dung tích 249 lít, phù hợp cho 2 - 3 người sử dụng.',3,10900000.00,7690000.00),('8','Tủ mát Aqua 240L AQS-F318S','FD2','AQ','/img/product/t-mat-aqua240l-aqs-f318s_bf05e7d1.jpg','Thành tủ kháng khuẩn. Kính cường lực 2 lớp. \r\nMặt kính phủ Low-E. \r\nHệ thống thổi gió–chống đọng sương trên cửa kính. \r\nHệ thống thoát nước tự động. Dải điện áp rộng 160V-240V.',9,10000000.00,9090000.00),('9','Bình nóng lạnh gián tiếp Kangaroo 50L KG73R5','HT','KG','/img/product/binh-nong-lanh-gian-tiep-kangaroo-50l-kg73r5_d1d744d0.png','Máy nước nóng gián tiếp phù hợp cho các khu vực miền Bắc có nhiệt độ lạnh dưới 20°C. \r\nHệ thống an toàn đồng bộ CSS giúp bảo vệ an toàn khi sử dụng. \r\nDung tích 50 lít thích hợp sử dụng cho gia đình từ 4 - 5 thành viên. \r\nCầu dao ELCB tự động ngắt điện khi phát hiện sự cố rỏ rỉ. \r\nChức năng chống đun khô, cảm biến tự động ngắt khi đạt nhiệt độ tối đa tránh gây bỏng.',14,3240000.00,2590000.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategories`
--

DROP TABLE IF EXISTS `productcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategories` (
  `ProductCategoryID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `ProductCategoryName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `GroupProductID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ProductCategoryID`),
  KEY `GroupProductID` (`GroupProductID`),
  CONSTRAINT `productcategories_ibfk_1` FOREIGN KEY (`GroupProductID`) REFERENCES `groupproduct` (`GroupProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategories`
--

LOCK TABLES `productcategories` WRITE;
/*!40000 ALTER TABLE `productcategories` DISABLE KEYS */;
INSERT INTO `productcategories` VALUES ('AC','Điều hòa nhiệt độ','RF'),('AF','Lọc không khí','EA'),('AS','Loa - Âm thanh','AE'),('CK','Nồi cơm','KA'),('FAN','Quạt','EA'),('FD1','Tủ lạnh','RF'),('FD2','Tủ mát','RF'),('HT','Bính nóng lạnh','EA'),('IIC','Bếp từ, hồng ngoại','KA'),('TLVS','Ti vi','AE'),('WM','Máy giặt','RF'),('WT','Máy lọc nước','EA');
/*!40000 ALTER TABLE `productcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder` (
  `PurchaseOrderID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `UserID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `PaymentMethod` varchar(45) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PurchaseOrderID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES ('DN19690303','FA27495459','2024-07-12 20:57:47',10490000.00,'Khi Nhận Hàng','Hoàn thành'),('EI20632634','FA27495459','2024-07-15 14:58:11',990000.00,'Khi Nhận Hàng','Hoàn thành'),('FH78993279','FA27495459','2024-06-17 00:00:00',890000.00,'Khi Nhận Hàng','Hoàn thành'),('FR67140742','FA27495459','2024-06-17 00:00:00',10490000.00,'Khi Nhận Hàng','Hoàn thành'),('JT47864958','FA27495459','2024-06-22 14:08:42',23880000.00,'Khi Nhận Hàng','Chờ xác nhận'),('JY70310416','FA27495459','2024-06-17 00:00:00',9680000.00,'Khi Nhận Hàng','Đang giao hàng'),('LL26496606','FA27495459','2024-07-13 15:57:36',21080000.00,'Khi Nhận Hàng','Chờ xác nhận'),('RM60410362','FA27495459','2024-06-17 00:00:00',31870000.00,'Khi Nhận Hàng','Đang giao hàng'),('RV50195670','FA27495459','2024-07-15 14:58:30',2580000.00,'Khi Nhận Hàng','Chờ xác nhận'),('TE53010132','FA27495459','2024-06-17 00:00:00',36560000.00,'Khi Nhận Hàng','Đang giao hàng'),('TI36870302','FA27495459','2024-07-15 20:42:31',13140000.00,'Khi Nhận Hàng','Hoàn thành'),('WW58397602','FA27495459','2024-07-15 21:01:03',30480000.00,'Khi Nhận Hàng','Chờ xác nhận'),('ZZ36722712','FA27495459','2024-07-12 17:31:44',45970000.00,'Khi Nhận Hàng','Chờ xác nhận');
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorderdetail`
--

DROP TABLE IF EXISTS `purchaseorderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorderdetail` (
  `PurchaseOrderDetailID` int NOT NULL AUTO_INCREMENT,
  `PurchaseOrderID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ProductID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `OrderedQuantity` int DEFAULT NULL,
  `Price` decimal(18,2) DEFAULT NULL,
  `TotalPrice` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`PurchaseOrderDetailID`),
  KEY `PurchaseOrderID` (`PurchaseOrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `purchaseorderdetail_ibfk_1` FOREIGN KEY (`PurchaseOrderID`) REFERENCES `purchaseorder` (`PurchaseOrderID`),
  CONSTRAINT `purchaseorderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorderdetail`
--

LOCK TABLES `purchaseorderdetail` WRITE;
/*!40000 ALTER TABLE `purchaseorderdetail` DISABLE KEYS */;
INSERT INTO `purchaseorderdetail` VALUES (5,'JY70310416','3',1,2190000.00,2190000.00),(6,'JY70310416','2',1,7490000.00,7490000.00),(7,'RM60410362','1',1,10490000.00,10490000.00),(8,'RM60410362','13',1,13390000.00,13390000.00),(9,'RM60410362','4',1,7990000.00,7990000.00),(10,'FR67140742','1',1,10490000.00,10490000.00),(11,'TE53010132','13',1,13390000.00,13390000.00),(12,'TE53010132','4',1,7990000.00,7990000.00),(13,'TE53010132','2',1,7490000.00,7490000.00),(14,'TE53010132','7',1,7690000.00,7690000.00),(16,'FH78993279','6',1,890000.00,890000.00),(17,'JT47864958','1',1,10490000.00,10490000.00),(18,'JT47864958','13',1,13390000.00,13390000.00),(19,'ZZ36722712','4',1,7990000.00,7990000.00),(20,'ZZ36722712','22',2,18990000.00,37980000.00),(21,'DN19690303','1',1,10490000.00,10490000.00),(22,'LL26496606','47',1,1090000.00,1090000.00),(23,'LL26496606','28',1,19990000.00,19990000.00),(24,'EI20632634','45',1,990000.00,990000.00),(25,'RV50195670','52',1,890000.00,890000.00),(26,'RV50195670','35',1,1690000.00,1690000.00),(27,'TI36870302','29',1,5690000.00,5690000.00),(28,'TI36870302','33',1,7450000.00,7450000.00),(29,'WW58397602','14',1,19990000.00,19990000.00),(30,'WW58397602','1',1,10490000.00,10490000.00);
/*!40000 ALTER TABLE `purchaseorderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcart` (
  `ShoppingCartID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `UserID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `TotalPrice` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`ShoppingCartID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES ('FA27495459','FA27495459',92100000.00),('GG93453259','GG93453259',0.00),('GL11566971','GL11566971',0.00),('TI76199840','TI76199840',0.00);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `SupplierName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ContactPerson` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ContactNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Address` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('AQ','Aqua',NULL,NULL,NULL,NULL),('CP','Casper',NULL,NULL,NULL,NULL),('CX','Coex',NULL,NULL,NULL,NULL),('KG','Kangaroo',NULL,NULL,NULL,NULL),('LG','LG',NULL,NULL,NULL,NULL),('PNSN','Panasonic',NULL,NULL,NULL,NULL),('SN','Sony',NULL,NULL,NULL,NULL),('SP','Sharp',NULL,NULL,NULL,NULL),('SS','Samsung',NULL,NULL,NULL,NULL),('TCL','TCL',NULL,NULL,NULL,NULL),('TSB','Toshiba',NULL,NULL,NULL,NULL),('XAM','Xiaomi',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `UserName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Address` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `LockUser` varchar(45) DEFAULT NULL,
  `Role` bit(1) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','admin',NULL,NULL,'1111',NULL,NULL,NULL,'Unlock',_binary ''),('FA27495459','phnam123','Phạm','Nam','$2b$10$6wZRPqM1VxGFdPVD64pCce4TFvTA55zgsohz2JfW9TmTR5I0dnVOu','0976348522','phamnam120103@gmail.com','An Tràng, Quỳnh Phụ, Thái Bình','Unlock',_binary '\0'),('GG93453259','taikonn2004','Hà Hữu','Tài','$2b$10$2LOLPo298aDC/jC/thqNEOswte6ZiNXP3cLgcjo/FswYbKH.nHHye','0258469999','hahuutai04@gmail.com','Phúc Lợi, Long Biên, Hà Nội','Unlock',_binary '\0'),('GL11566971','trunglui123','Trung','Lúi','$2b$10$kE2LeC78yzr35cm7/QoESe2jxiC8ykdbi0CsqlVkZqTgYkVlX0T2.','0352146988','trunglui123@gmail.com','Hai Bà Trưng, Hà Nội','Lock',_binary '\0'),('TI76199840','phnam12345','Phạm','Nam','$2b$10$rpdjCVnMyK887eeIacr4W.zbnvsoBEe0JkuUVtQx.QACuiLwu57j6','0352146988','phamdangnam0308@gmail.com','An Tràng, Quỳnh Phụ, Thái Bình','Unlock',_binary '\0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-15 21:14:11
