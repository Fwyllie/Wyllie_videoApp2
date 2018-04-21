-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2018 at 03:12 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wyllie_f_videoApp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `comments_id` mediumint(8) UNSIGNED NOT NULL,
  `comments_auth` varchar(125) DEFAULT NULL,
  `comments_copy` text NOT NULL,
  `comments_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments_movie` int(11) NOT NULL,
  `comment_tv` smallint(6) NOT NULL,
  `comments_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_comments`
--

INSERT INTO `tbl_comments` (`comments_id`, `comments_auth`, `comments_copy`, `comments_date`, `comments_movie`, `comment_tv`, `comments_rating`) VALUES
(1, NULL, 'Loved it. Chris Pratt is my hero! I LOVE YOU STAR LORD!!', '2018-03-26 23:08:41', 1, 0, 5),
(2, NULL, 'Not quite as good as the first Guardians, but still WAY better that any DC movie... ', '2018-03-26 23:09:57', 1, 0, 4),
(3, NULL, 'It sucked.', '2018-04-01 18:54:32', 1, 0, 1),
(4, NULL, 'It was amazing. I really liked this way better than any DC movie that\'s ever been made, EVER.\n\nCuz DC movies are garbage.', '2018-04-01 18:55:29', 1, 0, 3),
(5, NULL, 'I thought Logan was great.THIS is the way you do comic book dystopia.', '2018-04-01 18:56:55', 3, 0, 4),
(6, NULL, 'Way too violent. I thought Hugh Jackman would at least do a song and dance, but was VERY disappointed.', '2018-04-01 18:57:35', 3, 0, 1),
(7, NULL, 'OMG i can\'t get enough Deadpool.. what a great movie', '2018-04-01 19:11:30', 7, 0, 5),
(8, NULL, 'I really liked this. Prof X made me sad tho. What a way to go...', '2018-04-01 19:51:58', 3, 0, 4),
(30, 'Bob Hoose', 'This let\'s-all-get-along tale is pretty much exactly the kind of felt-and-glitter silliness you might expect from a movie about something you used to keep in your pencil box', '2018-04-21 02:35:32', 10, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre`
--

CREATE TABLE `tbl_genre` (
  `genre_id` tinyint(3) UNSIGNED NOT NULL,
  `genre_name` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genre`
--

INSERT INTO `tbl_genre` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Crime'),
(5, 'Drama'),
(6, 'Historical'),
(7, 'Horror'),
(8, 'Musical'),
(9, 'Science Fiction'),
(10, 'War'),
(11, 'Western'),
(12, 'Animation'),
(13, 'Family'),
(14, 'Fantasy'),
(15, 'Romance'),
(16, 'Sport');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movies_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_cover` varchar(75) NOT NULL DEFAULT 'cover_default.jpg',
  `movies_title` varchar(125) NOT NULL,
  `movies_year` varchar(5) NOT NULL,
  `movies_runtime` varchar(25) NOT NULL,
  `movies_storyline` text NOT NULL,
  `movies_trailer` varchar(75) NOT NULL DEFAULT 'trailer_default.jpg',
  `movies_release` varchar(125) NOT NULL,
  `movies_kids` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_cover`, `movies_title`, `movies_year`, `movies_runtime`, `movies_storyline`, `movies_trailer`, `movies_release`, `movies_kids`) VALUES
(1, 'guardians2.jpg', 'Guardians of the Galaxy Vol. 2', '2017', '2h 16m', 'The Guardians must fight to keep their newfound family together as they unravel the mystery of Peter Quill&rsquo;s true parentage.', 'Guardians2.mp4', 'May 5, 2017', 'yes'),
(2, 'dunkirk.jpg', 'Dunkirk', '2017', '1h 46m', 'Allied soldiers from Belgium, the British Empire and France are surrounded by the German army and evacuated during a fierce battle in World War II.', 'Dunkirk.mp4', 'July 21, 2017', 'no'),
(3, 'logan.jpg', 'Logan', '2017', '2h 17m', 'In the near future, a weary Logan cares for an ailing Professor X, somewhere on the Mexican border. However, Logan&rsquo;s attempts to hide from the world, and his legacy, are upended when a young mutant arrives, pursued by dark forces.', 'Logan.mp4', 'March 3,2017', 'no'),
(4, 'okja.jpg', 'Okja', '2017', '2h', ' Meet Mija, a young girl who risks everything to prevent a powerful, multi-national company from kidnapping her best friend - a fascinating animal named Okja. ', 'Okja.mp4', 'June 28,2017', 'yes'),
(5, 'beauty.jpg', 'Beauty and the Beast', '2017', '2h 9min', 'An adaptation of the fairy tale about a monstrous-looking prince and a young woman who fall in love. ', 'Beauty.mp4', 'March 17, 2017', 'yes'),
(6, 'hacksaw.jpg', 'Hacksaw Ridge', '2016', '2h 19m', 'WWII American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people, and becomes the first man in American history to receive the Medal of Honor without firing a shot.', 'Hacksaw.mp4', 'November 4, 2016', 'no'),
(7, 'deadpool.jpg', 'Deadpool', '2016', '1h 48m', 'A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.', 'Deadpool.mp4', 'Febuary 12, 2016', 'no'),
(8, 'arrival.jpg', 'Arrival', '2016', '1h 56m', 'When twelve mysterious spacecraft appear around the world, linguistics professor Louise Banks is tasked with interpreting the language of the apparent alien visitors.', 'Arrival.mp4', 'November 11, 2016', 'yes'),
(9, 'eddie.jpg', 'Eddie the Eagle', '2016', '1h 46m', 'The story of Eddie Edwards, the notoriously tenacious British underdog ski jumper who charmed the world at the 1988 Winter Olympics.', 'Eddie.mp4', 'Febuary 26, 2016', 'yes'),
(10, 'trolls.jpg', 'Trolls', '2016', '1h 32m', 'After the Bergens invade Troll Village, Poppy, the happiest Troll ever born, and the curmudgeonly Branch set off on a journey to rescue her friends.', 'Trolls.mp4', 'November 4, 2016', 'yes'),
(11, 'revenant.jpg', 'The Revenant', '2015', '2h 36m', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 'Revenant.mp4', 'January 8, 2015', 'no'),
(12, 'brooklyn.jpg', 'Brooklyn', '2015', '1h 57m', 'An Irish immigrant lands in 1950s Brooklyn, where she quickly falls into a romance with a local. When her past catches up with her, however, she must choose between two countries and the lives that exist within.', 'Brooklyn.mp4', 'November 25, 2015', 'yes'),
(13, 'walk.jpg', 'The Walk', '2015', '2h 3m', 'In 1974, high-wire artist Philippe Petit recruits a team of people to help him realize his dream: to walk the immense void between the World Trade Center towers.', 'Walk.mp4', 'October 9, 2015', 'yes'),
(14, 'colonia.jpg', 'Colonia', '2015', '1h 46m', 'A young woman&rsquo;s desperate search for her abducted boyfriend that draws her into the infamous Colonia Dignidad, a sect nobody has ever escaped from.', 'Colonia.mp4', 'April 15, 2015', 'no'),
(15, 'force.jpg', 'Star Wars: The Force Awakens', '2015', '2h 16m', 'Three decades after the Empire&rsquo;s defeat, a new threat arises in the militant First Order. Stormtrooper defector Finn and spare parts scavenger Rey are caught up in the Resistance&rsquo;s search for the missing Luke Skywalker.', 'Force.mp4', 'December 18, 2015', 'yes'),
(16, 'whiplash.jpg', 'Whiplash', '2014', '1h 47m', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', 'Whiplash.mp4', 'October 15, 2014', 'yes'),
(17, 'guardians.jpg', 'Guardians of the Galaxy', '2014', '2h 1m', 'A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe.', 'Guardians.mp4', 'August 1, 2014', 'yes'),
(18, 'donjon.jpg', 'Don Jon', '2013', '1h 30m', 'A New Jersey guy dedicated to his family, friends, and church, develops unrealistic expectations from watching porn and works to find happiness and intimacy with his potential true love.', 'donjon.mp4', 'September 27, 2013', 'yes'),
(19, 'gravity.jpg', 'Gravity', '2013', '1h 31m', 'Two astronauts work together to survive after an accident which leaves them alone in space.', 'Gravity.mp4', 'October 4, 2013', 'yes'),
(20, 'pi.jpg', 'Life of Pi', '2012', '2h 7m', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.', 'Pi.jpg', 'November 21, 2012', 'no'),
(21, 'silver.jpg', 'Silver Linings Playbook', '2012', '2h 2m', 'After a stint in a mental institution, former teacher Pat Solitano moves back in with his parents and tries to reconcile with his ex-wife. Things get more challenging when Pat meets Tiffany, a mysterious girl with problems of her own.', 'Silver.jpg', 'December 25, 2012', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_genre`
--

CREATE TABLE `tbl_mov_genre` (
  `mov_genre_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_genre`
--

INSERT INTO `tbl_mov_genre` (`mov_genre_id`, `movies_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 9),
(4, 2, 1),
(5, 2, 5),
(6, 2, 6),
(7, 2, 10),
(8, 3, 1),
(9, 3, 5),
(10, 3, 9),
(11, 4, 1),
(12, 4, 2),
(13, 4, 5),
(14, 4, 9),
(15, 5, 8),
(16, 5, 13),
(17, 5, 14),
(18, 6, 5),
(19, 6, 6),
(20, 6, 10),
(21, 7, 1),
(22, 7, 2),
(23, 7, 3),
(24, 7, 15),
(25, 8, 5),
(26, 8, 9),
(27, 9, 3),
(28, 9, 5),
(29, 9, 16),
(30, 10, 14),
(31, 10, 2),
(32, 10, 3),
(33, 10, 8),
(34, 10, 13),
(35, 11, 2),
(36, 11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_music`
--

CREATE TABLE `tbl_music` (
  `music_id` int(10) UNSIGNED NOT NULL,
  `music_thumbnail` varchar(200) NOT NULL,
  `music_name` varchar(200) NOT NULL,
  `music_artist` varchar(200) NOT NULL,
  `music_genre` varchar(20) NOT NULL,
  `music_link` varchar(250) NOT NULL,
  `music_kids` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_music`
--

INSERT INTO `tbl_music` (`music_id`, `music_thumbnail`, `music_name`, `music_artist`, `music_genre`, `music_link`, `music_kids`) VALUES
(1, 'stoneyCover.jpg', 'Congratulations', 'Post Malone', 'hiphop', 'congratulations.mp3', 'no'),
(2, 'iliwysCover.jpg', 'Somebody Else', 'The 1975', 'alternative', 'somebodyElse.mp3', 'yes'),
(3, 'revivalCover.jpg', 'Remind Me', 'Eminem', 'hiphop', 'remindme.mp3', 'no'),
(4, 'channelOrange.jpg', 'Thinking Bout You', 'Frank Ocean', 'pop', 'thinkinBoutYou.mp3', 'yes'),
(5, 'reputation.png', 'Gorgeous', 'Taylor Swift', 'pop', 'gorgeous.mp3', 'yes'),
(6, 'paris.jpg', 'Paris', 'The Chainsmokers', 'dance', 'paris.mp3', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tv`
--

CREATE TABLE `tbl_tv` (
  `tv_id` int(10) UNSIGNED NOT NULL,
  `tv_thumbnail` varchar(200) NOT NULL,
  `tv_video` varchar(200) NOT NULL,
  `tv_name` varchar(150) NOT NULL,
  `tv_desc` varchar(1500) NOT NULL,
  `tv_rating` varchar(10) NOT NULL,
  `tv_genre` varchar(50) NOT NULL,
  `tv_episode` varchar(20) NOT NULL,
  `tv_kids` varchar(10) NOT NULL,
  `tv_fb` varchar(200) NOT NULL,
  `tv_twitter` varchar(200) NOT NULL,
  `tv_insta` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tv`
--

INSERT INTO `tbl_tv` (`tv_id`, `tv_thumbnail`, `tv_video`, `tv_name`, `tv_desc`, `tv_rating`, `tv_genre`, `tv_episode`, `tv_kids`, `tv_fb`, `tv_twitter`, `tv_insta`) VALUES
(1, 'zoey101.jpg', 'zoey101.mp4', 'Zoey 101', 'Zoey 101 is an American comedy-drama television series which originally aired on Nickelodeon from January 9, 2005 until May 2, 2008. It focuses on the lives of teenager Zoey Brooks (Jamie Lynn Spears), her brother (Paul Butcher), and her friends as they attend Pacific Coast Academy (PCA), a fictional boarding school in Southern California. The series was created by Dan Schneider. It was initially filmed at Pepperdine University in Malibu, California, then at stages in Valencia, California beginning in season 3. It was nominated for an \"Outstanding Children\'s Program\" Emmy in 2005. Zoey 101 was the most expensive production ever for a Nickelodeon series, as it was shot completely on location in Malibu.', '5.9/10', 'comedy', '61', 'yes', 'facebook.com', 'twitter.com', 'instagram.com'),
(2, 'aa.jpg', 'aa.mp4', 'Ancient Aliens', 'Ancient Aliens is an American television series that premiered on April 20, 2010, on the History channel. Produced by Prometheus Entertainment in a documentary style, the program presents hypotheses of ancient astronauts and proposes that historical texts, archaeology, and legends contain evidence of past human-extraterrestrial contact. The show has been criticized for presenting pseudoscience and pseudohistory.', '7.4/10', 'history', '135', 'no', 'facebook.com', 'twitter.com', 'instagram.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`comments_id`);

--
-- Indexes for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indexes for table `tbl_mov_genre`
--
ALTER TABLE `tbl_mov_genre`
  ADD PRIMARY KEY (`mov_genre_id`);

--
-- Indexes for table `tbl_music`
--
ALTER TABLE `tbl_music`
  ADD PRIMARY KEY (`music_id`);

--
-- Indexes for table `tbl_tv`
--
ALTER TABLE `tbl_tv`
  ADD PRIMARY KEY (`tv_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `comments_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  MODIFY `genre_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_mov_genre`
--
ALTER TABLE `tbl_mov_genre`
  MODIFY `mov_genre_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_music`
--
ALTER TABLE `tbl_music`
  MODIFY `music_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_tv`
--
ALTER TABLE `tbl_tv`
  MODIFY `tv_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
