/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ebook1
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(200) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES
(1,'James Patterson'),
(2,'Mine Yoshizaki'),
(3,'Aka Akasaka'),
(4,'赤坂アカ×横槍メンゴ'),
(5,'赤坂アカ'),
(6,'新海　誠');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `rakuten_id` varchar(20) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`rakuten_id`),
  KEY `fk_publisher` (`publisher_id`),
  KEY `fk_region` (`region_id`),
  KEY `fk_author` (`author_id`),
  CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `Author` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`publisher_id`),
  CONSTRAINT `fk_region` FOREIGN KEY (`region_id`) REFERENCES `Region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES
(1,'The House of Cross','9780316408912','2024-11-25',14.99,1,2,'**Supreme Court candidates are being murdered—and only Alex Cross and John Sampson can take the case inThe House of Cross.“[Alex Cross’s] innate nature is to protect people…If he has a weakness, it’s his family, especially his children. They’re the chink in his armor. But aside from that, it’s tough to get at him.”–Aldis Hodge, star ofCrosson Prime Video**In Washington, DC, the president-elect is planning her inauguration.The list of Supreme Court candidates is highly confidential—until it becomes evidence in Detective Alex Cross’s toughest investigation.One candidate is gunned down. A second is stabbed. A third is murdered near midnight on a city street.Cross is the FBI’s top expert in criminal behavior. For the sake of his family, his city, and his country, he must put himself in the most dangerous place there is: inside the mind of a diabolical killer.',1),
(2,'The 24th Hour','9780316403283','2024-05-06',14.99,1,2,'As enemies lurk in the shadows, “Tough-but-tender cop Lindsay Boxer” (People) leads the Women’s Murder Club in the high-profile murder investigation of a billionaire San Francisco couple—will Cindy, Claire, Yuki, and Lindsay still be standing when the clock strikes midnight?SFPD Sergeant Lindsay Boxer, Medical Examiner Claire Washburn, Assistant District Attorney Yuki Castellano, and crime writer Cindy Thomas gather at one of San Francisco’s finest restaurants to celebrate exciting news: Cindy is getting married.Before they can raise their glasses, there’s a disturbance in the restaurant. A woman has been assaulted.Claire examines the victim. Lindsay makes an arrest. Yuki takes the case. Cindy covers it.The legal strategy is complicated by gaps in the plaintiff’s memory—and the shocking reason behind her ever-changing testimony.As Yuki leads the prosecution, Lindsay chases down a high-society killer whose target practice may leave the Women’s Murder Club short a bridesmaid … or two.',1),
(3,'Sgt. Frog, Vol. 10','9781421584164','2015-05-26',4.99,2,2,'When Keroro and his gang become mixed up with a ghastly ghost, will life in the Hinata household turn into a fright fest? Later, a soccer match between Keroro Platoon and the Select Keron Forces Team shows that the sport is indeed universal...and one big bore! But not to worry - excitement is just a hop away, as Earth is suddenly anesthetized by Planet Anesthesia: Keroro Platoon members are silenced - and their friends are eliminated! Is there no one on Earth who can save our poor planet? Don\'t bet on it - you can\'t keep a frog-like alien down forever!',2),
(4,'[Oshi No Ko], Vol. 8','9798855405606','2024-11-19',6.99,3,2,'After a major revelation, the flames of vengeance have died down in Aqua’s heart. At the same time, B Komachi is set to have their first music video (and boost their YouTube channel). Aqua is also headed to a vacation with the cast of the 2.5D play, and it\'s near where Aqua and Ruby died in their previous lives!',3),
(5,'【推しの子】 8','4972000047588','2022-06-17',659.00,4,3,'「私アクアくんとなら……キスだってHだってやじゃないよ？」　第六章　プライベート、展開中!!　星野アクアは、自身の父親の現状を知り、“芸能界”への復讐心は下火となっていた。一方、星野ルビーら新生『B小町』はユーチューブでの人気テコ入れの為、MV撮影を決意!!　2.5次元舞台の慰安も兼ねて、アクアや黒川あかねも帯同して、“神話の街・高千穂”へ!!　そこは、前世のアクアとルビーが死んだ場所でもあり…。“赤坂アカ×横槍メンゴ”の豪華タッグが全く新しい切り口で“芸能界”を描く衝撃作…第8巻!!',4),
(6,'【推しの子】 11','4972000058597','2023-03-17',680.00,4,3,'「子供達の心と人生を壊しながらこの芸能界（せかい）は回っているの」　アイとゴローを死に追いやった真犯人への怒りを強く抱くルビーは、至る所で亀裂を生みながらも芸能界を駆け上がる。アクアも斉藤壱護との対話で自らの思考の誤りに気付き、復讐心が再燃する事に。一方、アイドル活動に悩み始めた有馬かなは、演技の仕事に繋がればと思い参加した飲み会で大物映画監督と繋がりが出来る。しかし、これが“スキャンダル”へと発展しかけてしまい…大騒動が巻き起こる第11巻!!',4),
(7,'【推しの子】 12','4972000064024','2023-07-19',680.00,4,3,'「ルビーにとって嘘とはどういうもの？」　大物映画監督・島政則の事務所マンションに出入りする様子を週刊誌に撮影されてしまった有馬かな。アクアは、この“スキャンダル”を揉み消すバーター記事を提案し、世間にも当時16歳のアイの出産と自身らの素性が明るみになる。アイが貫いたアイドルとしての“嘘”への裏切りに激昂したルビーは、アクアへの強い拒絶感を示す事に…そんな中、映画『15年の嘘』企画が本格始動する第12巻!!',4),
(8,'【我推的孩子】(08)','9786263406766','2023-04-12',98.00,5,4,'賀！【我推的孩子】動畫化2023年春季上映！熱血、轉生、戀愛、懸疑、推理──塞滿各種「娛樂」要素的「演藝圈」漫畫！「如果是跟阿奎亞你……無論是接吻，或是上床，我都不排斥喔？」就此進入第六章．私生活篇!!星野阿奎亞在得知生父的情形後，對於「演藝圈」的復仇之火終於是平息下來了。另一方面，星野露比等人組成的新生「Ｂ小町」為了提升YouTube頻道的人氣，決定拍攝ＭＶ!!阿奎亞與黑川茜也一同參加了這趟順便慶祝２.５次元舞台劇殺青的拍攝之旅，來到「神話之鄉．高千穗」!!而這裡也正是阿奎亞與露比揮別前世的葬身之地……「赤坂アカ×横槍メンゴ」的豪華組合，從最新的觀點切入描述「演藝圈」的衝擊作…第8集!!',4),
(9,'【我推的孩子】(07)','9786263402508','2023-01-16',98.00,5,4,'1.赤坂アカ《輝夜姬想讓人告白～天才們的戀愛頭腦戰～》×横槍メンゴ《人渣的本願》《妳是我的淫蕩女王》(作畫)，超級作者搭檔聯手打造最強漫畫！2.榮獲下一部漫畫大獎2021年度紙本漫畫部門第一名！熱血、轉生、戀愛、懸疑、推理──塞滿各種「娛樂」要素的「演藝圈」漫畫！★動畫化決定！「對我而言演戲就是復仇！」超人氣漫畫《東京BLADE》的2.5次元舞台劇正式公演!!「劇團Lalalai」王牌新秀的黑川茜與昔日被譽為天才童星的有馬佳奈，因幼年時期的一段因緣際會而相互對立，並在此次的舞台上以演技一較高下!!星野阿奎亞為了掌握「真情流露的演技」開始正視自己的心理創傷，而他也從中找出屬於自己的演員之路為何!?第五章2.5次元舞台篇就此進入最終高潮!!「赤坂アカ×横槍メンゴ」的豪華組合，從最新的觀點切入描述「演藝圈」的衝擊作…第7集!!',4),
(10,'輝夜姬想讓人告白 (9)','3089572611371','2019-06-26',105.00,6,4,'學生會會長．白銀御行與副會長．四宮輝夜在精英雲集的秀知院學園相遇…。雖然這２個天才兩情相悅，彼此卻一直設法要讓對方愛上自己、主動向自己告白，為達此目的，他們將在日常生活中使出渾身解數鉤心鬥角，演出全新感覺的愛情喜劇！！第９集完全完全收錄了”石上難忘的體育祭篇”！！將石上勇敢面對”ＷＡＹ系”、面對自我過去的故事進行大幅加筆！！此外當然也少不了輝夜＆白銀的戀愛勾心鬥角及白銀＆藤原書記的魔鬼特訓…這點大家可以放心！！',5),
(11,'小説　君の名は。','4336191000300','2016-06-18',616.00,7,3,'山深い町の女子高生・三葉が夢で見た、東京の男子高校生・瀧。2人の隔たりとつながりから生まれる「距離」のドラマを描く新海誠的ボーイミーツガール。2016年8月26日公開映画の、新海監督みずから執筆した原作小説。',6);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Genre`
--

DROP TABLE IF EXISTS `Book_Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book_Genre` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `Book_Genre_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`),
  CONSTRAINT `Book_Genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Genre`
--

LOCK TABLES `Book_Genre` WRITE;
/*!40000 ALTER TABLE `Book_Genre` DISABLE KEYS */;
INSERT INTO `Book_Genre` VALUES
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(1,2),
(2,2),
(11,2),
(10,3),
(1,4),
(2,4);
/*!40000 ALTER TABLE `Book_Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES
(1,'Manga'),
(2,'Novel'),
(3,'Romantic'),
(4,'Mystery');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publisher`
--

DROP TABLE IF EXISTS `Publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publisher`
--

LOCK TABLES `Publisher` WRITE;
/*!40000 ALTER TABLE `Publisher` DISABLE KEYS */;
INSERT INTO `Publisher` VALUES
(1,'Little, Brown and Company'),
(2,'VIZ Media: VIZ Select'),
(3,'Yen Press'),
(4,'ヤングジャンプコミックスDIGITAL'),
(5,'青文出版社'),
(6,'東立出版社'),
(7,'角川文庫');
/*!40000 ALTER TABLE `Publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
INSERT INTO `Region` VALUES
(1,'Canada'),
(2,'United States'),
(3,'Japan'),
(4,'Taiwan');
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `review_time` datetime DEFAULT current_timestamp(),
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`),
  CONSTRAINT `Review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES
(1,6,1,'2024-12-03 17:16:32',5,'MEMちょ最高'),
(2,7,1,'2024-12-03 18:27:11',5,'ルビーちゃんもかわいい');
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `transaction_time` datetime DEFAULT current_timestamp(),
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES
(1,1,'2024-12-03 17:06:43',1360.00),
(2,1,'2024-12-03 18:17:39',659.00);
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction_Items`
--

DROP TABLE IF EXISTS `Transaction_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction_Items` (
  `transaction_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `Transaction_Items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `Transaction` (`transaction_id`),
  CONSTRAINT `Transaction_Items_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction_Items`
--

LOCK TABLES `Transaction_Items` WRITE;
/*!40000 ALTER TABLE `Transaction_Items` DISABLE KEYS */;
INSERT INTO `Transaction_Items` VALUES
(1,6,680.00),
(1,7,680.00),
(2,5,659.00);
/*!40000 ALTER TABLE `Transaction_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_user_region` (`region_id`),
  CONSTRAINT `fk_user_region` FOREIGN KEY (`region_id`) REFERENCES `Region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES
(1,'rpeng25@uwo.ca','Ruilin','Peng',3);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Library`
--

DROP TABLE IF EXISTS `User_Library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Library` (
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `User_Library_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `User_Library_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Library`
--

LOCK TABLES `User_Library` WRITE;
/*!40000 ALTER TABLE `User_Library` DISABLE KEYS */;
INSERT INTO `User_Library` VALUES
(1,6),
(1,7);
/*!40000 ALTER TABLE `User_Library` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-12-04 22:54:16
