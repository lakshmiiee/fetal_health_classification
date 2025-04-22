-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2025 at 05:29 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `little_pulse_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  `doctor` varchar(200) NOT NULL,
  `patient` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `slot`, `doctor`, `patient`, `date`) VALUES
(1, 1, 'amy@gmail.com', 'anya@gmail.com', '2025-03-17'),
(4, 3, 'amy@gmail.com', 'anya@gmail.com', '2025-03-17'),
(9, 4, 'amy@gmail.com', 'zoe@gmail.com', '2025-03-17'),
(11, 8, 'amy@gmail.com', 'zoe@gmail.com', '2025-03-17'),
(3, 9, 'amy@gmail.com', 'anya@gmail.com', '2025-03-18'),
(2, 10, 'amy@gmail.com', 'anya@gmail.com', '2025-03-18'),
(7, 17, 'amy@gmail.com', 'anya@gmail.com', '2025-03-12'),
(8, 41, 'amy@gmail.com', 'zoe@gmail.com', '2025-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `week` int(11) NOT NULL,
  `article` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `image`, `week`, `article`) VALUES
(1, 'Importance of Prenatal Care for Fetal Health', 'article1.jpg', 7, 'Prenatal care is crucial for ensuring the healthy development of a fetus. Regular checkups allow healthcare providers to monitor the baby\'s growth, track important health indicators, and detect any potential complications early. These visits typically include ultrasound scans, blood tests, and fetal heart rate monitoring to assess the baby’s well-being. Proper nutrition also plays a significant role—expecting mothers should consume foods rich in folic acid, iron, and calcium to support fetal brain and bone development. Additionally, avoiding harmful substances such as alcohol, tobacco, and excessive caffeine can reduce the risk of birth defects and developmental delays. Research shows that mothers who attend all recommended prenatal visits are far less likely to experience complications such as premature birth, low birth weight, or gestational diabetes. In summary, consistent and quality prenatal care is one of the most effective ways to ensure a safe and healthy pregnancy.'),
(2, 'Understanding Fetal Heart Rate and Its Significance', 'article2.jpg', 15, 'Fetal heart rate is one of the most critical indicators of a baby’s health inside the womb. A normal fetal heart rate ranges between 110 and 160 beats per minute (BPM), though it can vary based on the baby’s activity level. Doctors use cardiotocography (CTG) and Doppler ultrasound to monitor fetal heart rate and detect irregularities. A heart rate that is too low (bradycardia) or too high (tachycardia) may indicate distress, oxygen supply issues, or underlying medical conditions. Conditions such as umbilical cord compression, placental insufficiency, or maternal dehydration can cause fluctuations in fetal heart rate. Regular monitoring during prenatal checkups and labor helps healthcare providers intervene early if complications arise. Simple lifestyle choices, such as staying hydrated, managing stress, and avoiding excessive caffeine intake, can also help maintain a healthy fetal heart rate. By understanding and tracking fetal heart patterns, doctors can ensure the well-being of both the baby and the mother throughout pregnancy.\r\n\r\n'),
(3, 'How Maternal Stress Affects Fetal Health', 'article3.jpg', 20, 'Many expecting mothers experience stress, but prolonged or extreme stress during pregnancy can negatively impact fetal development. When a pregnant woman is under constant stress, her body releases cortisol and adrenaline, hormones that can cross the placenta and affect the baby’s growth. Studies suggest that high levels of maternal stress can lead to preterm birth, low birth weight, and developmental delays. Chronic stress may also increase the risk of gestational hypertension and preeclampsia, conditions that can endanger both mother and child. Fortunately, there are ways to manage stress effectively. Pregnant women are encouraged to engage in relaxation techniques such as deep breathing, meditation, and prenatal yoga. Adequate sleep, a healthy diet, and social support from family and friends also contribute to reduced stress levels. Seeking professional guidance from a doctor or counselor can further help in managing anxiety during pregnancy. By prioritizing emotional and mental well-being, expecting mothers can create a healthier environment for their growing baby.\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `hospital` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `photo`, `username`, `contact`, `address`, `hospital`) VALUES
(1, 'Amy Lawrence', 'doc1.jpg', 'amy@gmail.com', '8563256985', 'West Fort, Tvm, Kerala', 'mercy@gmail.com'),
(2, 'Brain Ford', 'doc2.jpg', 'brian@gmail.com', '8563256985', 'West Fort, Nicobar', 'mercy@gmail.com'),
(3, 'Maya Hawke', 'doc3.jpg', 'maya@gmail.com', '8987920389', 'Ruby Nagar, Trivandrum, Kerala', 'providence@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `photo`, `username`, `contact`, `address`) VALUES
(1, 'Mercy Hospital', 'Mercy.jpg', 'mercy@gmail.com', '8563256985', 'Mercy Hospital, Ruby Nagar, TVM'),
(2, 'Providence Hospital', 'Providence.jpg', 'providence@gmail.com', '8563256985', 'Providence Hospital, Ruby Nagar, East Fort');

-- --------------------------------------------------------

--
-- Table structure for table `logdata`
--

CREATE TABLE `logdata` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `utype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logdata`
--

INSERT INTO `logdata` (`id`, `username`, `password`, `utype`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin'),
(3, 'mercy@gmail.com', 'mercy', 'hospital'),
(4, 'providence@gmail.com', 'providence', 'hospital'),
(9, 'amy@gmail.com', 'amy', 'doctor'),
(10, 'brian@gmail.com', 'brian', 'doctor'),
(12, 'anya@gmail.com', 'anya', 'patient'),
(13, 'zoe@gmail.com', 'zoe', 'patient'),
(14, 'melanie@gmail.com', 'melanie', 'patient'),
(15, 'kate@gmail.com', 'kate', 'patient'),
(16, 'maya@gmail.com', 'maya', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `doctor` varchar(200) DEFAULT NULL,
  `conception_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `photo`, `username`, `contact`, `address`, `doctor`, `conception_date`) VALUES
(1, 'Anya Taylor-Joy', 'Anya.jpg', 'anya@gmail.com', '8563256985', 'Ruby Nagar, Trivandrum, Kerala', 'amy@gmail.com', '2025-01-15'),
(2, 'Zoe Kravitz', 'Zoe.jpg', 'zoe@gmail.com', '8563256985', 'West Fort, Nicobar', 'amy@gmail.com', '2025-03-01'),
(3, 'Melanie Laurent', 'Melanie.jpg', 'melanie@gmail.com', '8596522424', 'Ruby Nagar, Tvm, Kerala', NULL, '2025-01-08'),
(4, 'Kate Mara', 'Kate.jpg', 'kate@gmail.com', '8596856285', 'Ruby Nagar, Tvm, Kerala', NULL, '2025-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `patient` int(11) NOT NULL,
  `date` date NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `patient`, `date`, `data`) VALUES
(1, 1, '2025-03-08', '{\"baseline_value\": \"120\", \"accelerations\": \"0\", \"fetal_movement\": \"0\", \"uterine_contractions\": \"0\", \"light_decelerations\": \"0\", \"severe_decelerations\": \"0\", \"prolongued_decelerations\": \"0\", \"abnormal_short_term_variability\": \"73\", \"mean_value_of_short_term_variability\": \"0.4997\", \"percentage_of_time_with_abnormal_long_term_variabilty\": \"43\", \"mean_value_of_long_term_variability\": \"2.4\", \"histogram_width\": \"64\", \"histogram_min\": \"62\", \"histogram_max\": \"126\", \"histogram_number_of_peaks\": \"20\", \"histogram_number_of_zeroes\": \"0\", \"histogram_mode\": \"120\", \"histogram_mean\": \"137\", \"histogram_median\": \"121\", \"histogram_variance\": \"73\", \"histogram_tendency\": \"1\"}'),
(2, 1, '2025-03-08', '{\"baseline_value\": \"132\", \"accelerations\": \".006\", \"fetal_movement\": \"0\", \"uterine_contractions\": \".006\", \"light_decelerations\": \".003\", \"severe_decelerations\": \"0\", \"prolongued_decelerations\": \"0\", \"abnormal_short_term_variability\": \"17\", \"mean_value_of_short_term_variability\": \"2.1\", \"percentage_of_time_with_abnormal_long_term_variabilty\": \"0\", \"mean_value_of_long_term_variability\": \"10.4\", \"histogram_width\": \"130\", \"histogram_min\": \"68\", \"histogram_max\": \"198\", \"histogram_number_of_peaks\": \"6\", \"histogram_number_of_zeroes\": \"1\", \"histogram_mode\": \"141\", \"histogram_mean\": \"136\", \"histogram_median\": \"140\", \"histogram_variance\": \"12\", \"histogram_tendency\": \"0\"}'),
(3, 1, '2025-03-08', '{\"baseline_value\": \"132\", \"accelerations\": \".006\", \"fetal_movement\": \"0\", \"uterine_contractions\": \".006\", \"light_decelerations\": \"0.003\", \"severe_decelerations\": \"0\", \"prolongued_decelerations\": \"0\", \"abnormal_short_term_variability\": \"17\", \"mean_value_of_short_term_variability\": \"0.5\", \"percentage_of_time_with_abnormal_long_term_variabilty\": \"0\", \"mean_value_of_long_term_variability\": \"10.4\", \"histogram_width\": \"120\", \"histogram_min\": \"68\", \"histogram_max\": \"198\", \"histogram_number_of_peaks\": \"6\", \"histogram_number_of_zeroes\": \"1\", \"histogram_mode\": \"141\", \"histogram_mean\": \"136\", \"histogram_median\": \"140\", \"histogram_variance\": \"12\", \"histogram_tendency\": \"0\"}');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `patient` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `result` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `patient`, `title`, `date`, `result`, `description`) VALUES
(2, 'anya@gmail.com', 'Blood Test', '2025-03-07', 'Sample.docx', 'First Blood Test Report, Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore aperiam doloremque ipsam tenetur. Mollitia maiores provident cupiditate obcaecati consequatur! At possimus eaque nemo quia quasi, veniam laboriosam ex ut quas! Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore aperiam doloremque ipsam tenetur. Mollitia maiores provident cupiditate obcaecati consequatur! At possimus eaque nemo quia quasi, veniam laboriosam ex ut quas!'),
(3, 'anya@gmail.com', 'Blood Test 2', '2025-03-09', 'Sample.docx', 'Second Blood Test Report, Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore aperiam doloremque ipsam tenetur. Mollitia maiores provident cupiditate obcaecati consequatur! At possimus eaque nemo quia quasi, veniam laboriosam ex ut quas! Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore aperiam doloremque ipsam tenetur. Mollitia maiores provident cupiditate obcaecati consequatur! At possimus eaque nemo quia quasi, veniam laboriosam ex ut quas!');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `doctor` varchar(200) NOT NULL,
  `schedule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`schedule`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `doctor`, `schedule`) VALUES
(1, 'amy@gmail.com', '{\"1\": 1, \"2\": 3, \"3\": 3, \"4\": 2, \"5\": 2, \"6\": 3, \"7\": 0, \"8\": 3, \"9\": 1, \"10\": 2, \"11\": 2, \"12\": 1, \"13\": 4, \"14\": 1, \"15\": 1, \"16\": 7, \"17\": 3, \"18\": 2, \"19\": 3, \"20\": 3, \"21\": 5, \"22\": 2, \"23\": 2, \"24\": 1, \"25\": 2, \"26\": 1, \"27\": 1, \"28\": 2, \"29\": 4, \"30\": 2, \"31\": 2, \"32\": 0, \"33\": 0, \"34\": 0, \"35\": 0, \"36\": 0, \"37\": 0, \"38\": 0, \"39\": 0, \"40\": 0, \"41\": 5, \"42\": 0, \"43\": 0, \"44\": 0, \"45\": 0, \"46\": 0, \"47\": 0, \"48\": 0, \"49\": 0, \"50\": 0, \"51\": 0, \"52\": 0, \"53\": 0, \"54\": 0, \"55\": 0, \"56\": 0}'),
(2, 'brian@gmail.com', '{\"1\": 1, \"2\": 2, \"3\": 2, \"4\": 3, \"5\": 1, \"6\": 12, \"7\": 2, \"8\": 0, \"9\": 1, \"10\": 0, \"11\": 1, \"12\": 0, \"13\": 0, \"14\": 1, \"15\": 0, \"16\": 5, \"17\": 0, \"18\": 1, \"19\": 3, \"20\": 3, \"21\": 1, \"22\": 0, \"23\": 0, \"24\": 0, \"25\": 0, \"26\": 0, \"27\": 12, \"28\": 0, \"29\": 0, \"30\": 0, \"31\": 0, \"32\": 0, \"33\": 0, \"34\": 0, \"35\": 0, \"36\": 2, \"37\": 0, \"38\": 1, \"39\": 0, \"40\": 0, \"41\": 0, \"42\": 1, \"43\": 1, \"44\": 0, \"45\": 0, \"46\": 1, \"47\": 0, \"48\": 0, \"49\": 0, \"50\": 0, \"51\": 0, \"52\": 0, \"53\": 0, \"54\": 0, \"55\": 0, \"56\": 0}');

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `id` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`id`, `day`, `time`) VALUES
(1, 'Monday', '9:00 - 10:00'),
(2, 'Monday', '10:00 - 11:00'),
(3, 'Monday', '11:00 - 12:00'),
(4, 'Monday', '12:00 - 01:00'),
(5, 'Monday', '01:00 - 02:00'),
(6, 'Monday', '02:00 - 03:00'),
(7, 'Monday', '03:00 - 04:00'),
(8, 'Monday', '04:00 - 05:00'),
(9, 'Tuesday', '9:00 - 10:00'),
(10, 'Tuesday', '10:00 - 11:00'),
(11, 'Tuesday', '11:00 - 12:00'),
(12, 'Tuesday', '12:00 - 01:00'),
(13, 'Tuesday', '01:00 - 02:00'),
(14, 'Tuesday', '02:00 - 03:00'),
(15, 'Tuesday', '03:00 - 04:00'),
(16, 'Tuesday', '04:00 - 05:00'),
(17, 'Wednesday', '9:00 - 10:00'),
(18, 'Wednesday', '10:00 - 11:00'),
(19, 'Wednesday', '11:00 - 12:00'),
(20, 'Wednesday', '12:00 - 01:00'),
(21, 'Wednesday', '01:00 - 02:00'),
(22, 'Wednesday', '02:00 - 03:00'),
(23, 'Wednesday', '03:00 - 04:00'),
(24, 'Wednesday', '04:00 - 05:00'),
(25, 'Thursday', '9:00 - 10:00'),
(26, 'Thursday', '10:00 - 11:00'),
(27, 'Thursday', '11:00 - 12:00'),
(28, 'Thursday', '12:00 - 01:00'),
(29, 'Thursday', '01:00 - 02:00'),
(30, 'Thursday', '02:00 - 03:00'),
(31, 'Thursday', '03:00 - 04:00'),
(32, 'Thursday', '04:00 - 05:00'),
(33, 'Friday', '9:00 - 10:00'),
(34, 'Friday', '10:00 - 11:00'),
(35, 'Friday', '11:00 - 12:00'),
(36, 'Friday', '12:00 - 01:00'),
(37, 'Friday', '01:00 - 02:00'),
(38, 'Friday', '02:00 - 03:00'),
(39, 'Friday', '03:00 - 04:00'),
(40, 'Friday', '04:00 - 05:00'),
(41, 'Saturday', '9:00 - 10:00'),
(42, 'Saturday', '10:00 - 11:00'),
(43, 'Saturday', '11:00 - 12:00'),
(44, 'Saturday', '12:00 - 01:00'),
(45, 'Saturday', '01:00 - 02:00'),
(46, 'Saturday', '02:00 - 03:00'),
(47, 'Saturday', '03:00 - 04:00'),
(48, 'Saturday', '04:00 - 05:00'),
(49, 'Sunday', '9:00 - 10:00'),
(50, 'Sunday', '10:00 - 11:00'),
(51, 'Sunday', '11:00 - 12:00'),
(52, 'Sunday', '12:00 - 01:00'),
(53, 'Sunday', '01:00 - 02:00'),
(54, 'Sunday', '02:00 - 03:00'),
(55, 'Sunday', '03:00 - 04:00'),
(56, 'Sunday', '04:00 - 05:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_appointment` (`slot`,`doctor`,`patient`,`date`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `logdata`
--
ALTER TABLE `logdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctor` (`doctor`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logdata`
--
ALTER TABLE `logdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slots`
--
ALTER TABLE `slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
