-- phpMyAdmin SQL Dump
-- version 4.0.10.17
-- https://www.phpmyadmin.net
--
-- Host: localhost


-- Generation Time: Oct 31, 2016 at 10:17 PM
-- Server version: 5.5.52
-- PHP Version: 5.6.26


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wheels`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `user_1_id` int(11) NOT NULL,
  `user_2_id` int(11) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `data_1` text,
  `data_2` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_type_id`, `user_1_id`, `user_2_id`, `issue_id`, `data_1`, `data_2`, `date_created`) VALUES
(8, 1, 2, 1, NULL, NULL, NULL, '2016-11-14 07:22:53'),
(9, 1, 1, 4, NULL, NULL, NULL, '2016-11-14 07:23:23'),
(12, 2, 2, NULL, 46, NULL, NULL, '2016-11-14 16:47:50'),
(13, 2, 1, NULL, 47, NULL, NULL, '2016-11-14 16:50:41'),
(14, 2, 4, NULL, 48, NULL, NULL, '2016-11-14 16:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(1, 'follow_user'),
(2, 'report_issue');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followee_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `follower_id`, `followee_id`, `date_created`) VALUES
(43, 2, 1, '0000-00-00 00:00:00'),
(44, 1, 4, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE IF NOT EXISTS `issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `description` varchar(400) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_by` int(11) NOT NULL,
  `img` varchar(500) NOT NULL,
  `solved` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `added_by` (`added_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;


--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`id`, `address`, `description`, `summary`, `date_added`, `added_by`, `img`, `solved`) VALUES
(2, '800 Washington Street, Blacksburg', 'This ramp is very steep. Actually it has a more than 25 percent slope on a metal. that means if you go on it on wheels you will be on a roller coaster.', 'not a ramp', '2016-10-28 00:45:54', 1, 'not_accessible2.jpg, stairs1.jpg, stairs2.jpg, stairs3.jpg, stairs4.jpg', 0),
(28, '240 Kent St', 'There is a tree in the middle of stairs, someone with my size will have a hard time passing in between the stairs', 'tree in the stairs', '2016-10-18 00:34:53', 1, 'not_accessible.jpg, not_accessible2.jpg, not_accessible3.jpg, not_accessible4.jpg', 0),
(29, '320 Drillfield Dr', 'There is a tree in the middle of stairways. someone with a big size will have a very hard time passing the narrow space.', 'tree in the stairs', '2016-10-18 03:21:05', 1, 'not_accessible.jpg, not_accessible2.jpg, not_accessible3.jpg, not accessible4.jpg, ', 0),
(30, '2875 Oak Lane', 'Please make a ramp here, there is no other ramp in between the parking and the building so if a disabled person park in this parking cannot get to the building.', 'No ramp', '2016-10-18 00:34:53', 1, 'noramp.jpg, noramp2.jpg, noramp3.jpg, noramp4.jpg,   ', 0),
(46, '', 'Write a description of the issue in detail...', 'Write a summary less than 20 words...', '2016-11-14 16:47:50', 2, '', 0),
(47, '', 'Write a description of the issue in detail...', 'Write a summary less than 20 words...', '2016-11-14 16:50:41', 1, '', 0),
(48, '', 'Write a description of the issue in detail...', 'Write a summary less than 20 words...', '2016-11-14 16:54:25', 4, '', 0);


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `privilege` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `privilege`) VALUES
(1, 'Navid', 'Falla', 'navidb@vt.edu', 'nav1212', '1234', 0),
(2, 'Sneha', 'Mehta', 'snehamehta@vt.edu', 'sumehta', '1345', 0),
(3, 'Tianyi', 'Li', 'tli@vt.edu', 'tianyi', '1567', 0),
(4, 'John', 'Oliver', 'johnoliver.vt.edu', 'johnoliver', '1453', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_type_id` (`event_type_id`),
  ADD KEY `user_1_id` (`user_1_id`),
  ADD KEY `user_2_id` (`user_2_id`),
  ADD KEY `product_2_id` (`issue_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower` (`follower_id`),
  ADD KEY `follower_2` (`follower_id`),
  ADD KEY `followee` (`followee_id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
=======
(2, 'Nikola', 'Tesla', 'n.tesla@tesla.net', 'tesla', '1234', 1);

--
>>>>>>> navid
-- Constraints for dumped tables
--

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
