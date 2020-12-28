-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 04, 2020 at 05:30 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr13_KimberleyB_bigevents`
--
CREATE DATABASE IF NOT EXISTS `cr13_KimberleyB_bigevents` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr13_KimberleyB_bigevents`;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201203122437', '2020-12-03 12:25:02', 92);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `location`, `date`, `time`, `description`, `type`) VALUES
(1, 'Christmas Market Crawl', 'https://cdn.pixabay.com/photo/2016/04/15/22/08/town-hall-1332069_1280.jpg', 'Free admission plus cost of food or drink', 'Vienna City Center', '12 December 2021', '18:00:00', 'Come and experience the Christmas markets of Vienna! Sip punsch and taste great food. You can buy all the gifts you like from various stalls. Walk among the lights and experience Christmas the Viennese way.', 'Tour'),
(2, 'Theater experience', 'https://cdn.pixabay.com/photo/2017/09/29/23/52/vienna-2800887_1280.jpg', '150 Euros per person', 'Burg Theater, Vienna', 'TBD', '19:00:00', 'Due to Corona, performances have been postponed. However, you can reserve tickets for when opening is announced. When performances are announced, a list will become available via this link.', 'Theater'),
(4, 'Berlin Walking tour', 'https://cdn.pixabay.com/photo/2014/02/26/18/31/brandenburg-gate-275437_1280.jpg', '30 Euros Per Person', 'Berlin City Center', '27 March, 2021', '13:00:00', 'Discover Berlin by going on a walking tour. Have your friends and family join you to discover all the history that is hidden within the city center. Tour lasts around 2 hours, so be sure to wear comfortable shoes', 'Tour'),
(5, 'Swan Lake', 'https://cdn.pixabay.com/photo/2017/03/07/17/05/ballet-2124651_1280.jpg', '120 Euros Per Person', 'Vienna Opera House', '19 February 2021', '19:00:00', 'Swan Lake will be showing at the Vienna Opera House in Febrary. Be the first to get amazing seats for this classic ballet. Amazing seats will give you the best view of the performance in the amazing opera house. You will not want to miss this performance.', 'Theater'),
(6, 'Concert', 'https://cdn.pixabay.com/photo/2016/11/18/15/44/audience-1835431_1280.jpg', '25 Euros Entry', 'Mercedes-Benz Arena, Berlin', '31 December 2020', '20:00:00', 'Surprise concert by a #1 charting artist. Feel like taking a risk to see an amazing concert? Come and join us at Mercedes-Benz arena to see who will be performing. We promise you will not be disappointed!', 'Concert'),
(7, 'Chicago Boat Tour', 'https://cdn.pixabay.com/photo/2019/12/07/03/22/chicago-4678595_1280.jpg', '30 Dollars Per Person/50 dollars for 2 adults and 1 child', 'Downtown Chicago', '16 May 2021', '11:00:00', 'Come and discover Chicago on one of our famous river tours! See what the city looks like from the river and experience the giant buildings from below. You will discover the historys past and what is planned for the future. Boat tour lasts 60 minutes.', 'Tour'),
(8, 'Austrian Food Tour', 'https://cdn.pixabay.com/photo/2019/03/25/20/20/schnitzel-4081269_1280.jpg', '40 Euros Per Person', 'Innsbruck', '19 June 2021', '09:00:00', 'Take advantage of this great deal! On sale for 40 Euros per person, this tour will take you on a tour of Innsbruck tasting delicious food along the way. You will tour the city along with stopping at some of the best restaurants for breakfast, lunch and dinner. Come with an empty stomach and good walking shoes!', 'Tour'),
(9, 'The Barber of Seville Opera', 'https://cdn.pixabay.com/photo/2015/08/18/23/23/barber-895148_1280.jpg', '175 Euros for 2', 'Teatro de la Zarzuela, Madrid', '9 July 2021', '19:00:00', 'Bribery, deception and disguise. Figaro needs all his wiles to help the Count out-wit Dr Bartolo and ensure true love wins the day. Jonathan Millers classic production of The Barber of Seville is a feast of frivolous fun. Enjoy Figaros mischievous escapades as he assists Count Almaviva in prising the beautiful Rosina away from her lecherous guardian, Dr Bartolo.', 'Theater'),
(10, 'Napa Valley Wine tasting tour', 'https://cdn.pixabay.com/photo/2014/12/02/03/11/purple-grapes-553462_1280.jpg', '75 dollars per person/115 for two people', 'Various vineyards in Napa Valley, California', '4 September 2021', '11:00:00', 'The best time to discover wine in Napa is between August and October. Our tour will take you on a tour of 4 vineyards to discover the best wines they have to offer. Take advantage of the great deal for two and enjoy the scenery and wine. Be sure to book your spot as there is a maximum of 10 people per tour', 'Tour'),
(11, 'Sushi Tasting Tour', 'https://cdn.pixabay.com/photo/2017/01/26/02/36/sushi-2009611_1280.jpg', '50 Euros Per Person', 'Tokyo, Japan', '5 May 2021', '18:00:00', 'If you love sushi, you will love this tasting tour! Its a great deal at 50 Euros per person and you will taste 3 different sushi restaurants within the city. Make sure you come hungry! Afterwards you can walk through the amazing city of Tokyo to walk off all the food you will eat.', 'Tour'),
(12, 'Geisha Performance', 'https://cdn.pixabay.com/photo/2015/07/04/00/56/geisha-830918_1280.jpg', '300 Euros per person', 'Tokyo, Japan', '3 March 2021', '18:00:00', 'Live Geisha performance in Tokyo. Come see these amazing perfomers in the heart of Tokyo. You will get a private dinner and performance with music, dancing and more. The cost covers only the performance, food and drink will be charged separately, as these prices vary.', 'Theater'),
(13, 'Discover Chopin', 'https://cdn.pixabay.com/photo/2016/11/19/09/57/classical-music-1838390_1280.jpg', 'prices vary', 'Wiener Musikverein', '3 January 2021', '13:00:00', 'Come and experience Chopin in Vienna. This early performance will allow you to enjoy beautiful music and still have time to go and enjoy and wonderful dinner afterwards. The concert takes place in the beautiful Musikverein here in Vienna.', 'Concert');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
