-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2014 at 08:45 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `talkingspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Web Programming', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mauris est, tincidunt consectetur tincidunt sed, convallis ut neque. Pellentesque facilisis sollicitudin diam non placerat.'),
(2, 'Web Design', 'Consectetur adipiscing elit. Praesent mauris est, tincidunt consectetur tincidunt sed, convallis ut neque. Pellentesque facilisis sollicitudin diam non placerat.');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `topic_id`, `user_id`, `body`, `create_date`) VALUES
(1, 1, 2, 'Suspendisse in magna ac magna tempor viverra vel eu erat. Vivamus erat est, sodales at enim eu, fermentum sodales augue. Ut nec placerat nisi, sit amet tincidunt quam. Aliquam ullamcorper urna et arcu vehicula, pharetra venenatis orci venenatis. Nunc rutrum, magna et venenatis iaculis, felis tortor tempor sapien, et cursus velit mauris eu quam. Aenean eleifend scelerisque diam, sed placerat elit mattis malesuada', '2014-07-02 16:41:55'),
(2, 2, 2, 'Suspendisse in magna ac magna tempor viverra vel eu erat. Vivamus erat est, sodales at enim eu, fermentum sodales augue. Ut nec placerat nisi, sit amet tincidunt quam. Aliquam ullamcorper urna et arcu vehicula, pharetra venenatis orci venenatis. Nunc rutrum, magna et venenatis iaculis, felis tortor tempor sapien, et cursus velit mauris eu quam. Aenean eleifend scelerisque diam, sed placerat elit mattis malesuada', '2014-07-02 16:41:55'),
(3, 2, 1, '<p>Great Post!</p>', '2014-07-03 18:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `last_activity` datetime NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `category_id`, `user_id`, `title`, `body`, `last_activity`, `create_date`) VALUES
(1, 1, 1, 'Favorite Server-Side Language', 'What is your favorite server-side language?', '0000-00-00 00:00:00', '2014-07-02 15:30:20'),
(2, 2, 2, 'How did you learn CSS and HTML?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mauris est, tincidunt consectetur tincidunt sed, convallis ut neque. Pellentesque facilisis sollicitudin diam non placerat. Suspendisse rutrum lacus tortor, a luctus ante dapibus nec. Suspendisse ac arcu dolor. Interdum et malesuada fames ac ante ipsum primis in faucibus', '0000-00-00 00:00:00', '2014-07-02 16:57:45'),
(3, 2, 1, 'This is a test', '<p>Hello, this is a test</p>', '2014-07-03 20:30:06', '2014-07-03 18:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(64) NOT NULL,
  `about` text NOT NULL,
  `last_activity` datetime NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `username`, `password`, `about`, `last_activity`, `join_date`) VALUES
(1, 'Brad Traversy', 'techguyinfo@gmail.com', 'avatar1.jpg', 'BradT', '827ccb0eea8a706c4c34a16891f84e7b', 'Im a web developer from Boston MA', '0000-00-00 00:00:00', '2014-07-02 15:26:21'),
(2, 'John Doe', 'jdoe@gmail.com', 'avatar2.jpg', 'JDoe', '827ccb0eea8a706c4c34a16891f84e7b', '', '0000-00-00 00:00:00', '2014-07-02 16:40:45'),
(3, 'Steven Wright', 'swright@yahoo.com', 'download.jpg', 'swright', '827ccb0eea8a706c4c34a16891f84e7b', '', '2014-07-03 17:37:16', '2014-07-03 15:37:16'),
(4, 'Jane Doe', 'jane@yahoo.com', 'sample2.jpg', 'jane', '81dc9bdb52d04dc20036dbd8313ed055', 'I am jane', '2014-07-03 17:58:43', '2014-07-03 15:58:43');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
