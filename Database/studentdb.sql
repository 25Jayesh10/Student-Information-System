-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2024 at 04:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `Announcement_ID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Posting_Date` date NOT NULL,
  `Author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`Announcement_ID`, `Title`, `Content`, `Posting_Date`, `Author_ID`) VALUES
(1, 'Mid-term Exam', 'Mid-term exam will be held on 25th Oct.', '2023-10-10', 1),
(2, 'Assignment Submission', 'Submit assignment 2 by 15th Nov.', '2023-11-05', 2),
(3, 'Guest Lecture', 'A guest lecture on AI will be held.', '2023-09-15', 3),
(4, 'Practical Exam', 'Practical exam starts next week.', '2023-12-01', 4),
(5, 'Holiday Notice', 'College will remain closed on 2nd Dec.', '2023-12-02', 5),
(6, 'Lab Sessions', 'Lab sessions rescheduled to Fridays.', '2023-11-10', 6),
(7, 'Project Submission', 'Submit project report by 5th Dec.', '2023-12-01', 7),
(8, 'Seminar Announcement', 'Seminar on cloud computing.', '2023-11-15', 8),
(9, 'Exam Schedule', 'Final exam schedule released.', '2023-11-20', 9),
(10, 'Internship Opportunity', 'Internship openings available.', '2023-11-25', 10),
(11, 'Workshop', 'Workshop on web development.', '2023-12-05', 11),
(12, 'Alumni Meet', 'Annual alumni meet on 15th Dec.', '2023-12-10', 12),
(13, 'Placement Drive', 'Placement drive starts in Jan.', '2023-12-20', 13),
(14, 'Research Paper Submission', 'Submit research paper by 10th Jan.', '2023-12-15', 14),
(15, 'Sports Meet', 'Annual sports meet on 22nd Dec.', '2023-12-22', 15);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Course_ID` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Semester` varchar(10) NOT NULL,
  `Enrollment_Type_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Course_ID`, `course_code`, `CourseName`, `Description`, `Credits`, `Department_ID`, `Semester`, `Enrollment_Type_ID`) VALUES
(1, 'CS101', 'Data Structures', 'Introduction to data structures, covering arrays, linked lists, trees, and graphs.', 4, 1, 'V', 5),
(2, 'CS102', 'Operating Systems', 'Study of process management, memory management, and I/O systems.', 4, 1, 'V', 5),
(3, 'CS103', 'Database Systems', 'Foundations of database management systems, SQL, and query optimization.', 3, 1, 'V', 5),
(4, 'CS104', 'Computer Networks', 'Principles of networking, covering TCP/IP, routing, and security.', 4, 1, 'V', 5),
(5, 'IT101', 'Web Technologies', 'Web development with HTML, CSS, JavaScript, and backend systems.', 3, 2, 'V', 5),
(6, 'IT102', 'Artificial Intelligence', 'Introduction to AI concepts like search, learning, and reasoning.', 4, 2, 'V', 5),
(7, 'IT103', 'Machine Learning', 'Supervised, unsupervised, and reinforcement learning methods.', 3, 2, 'V', 5),
(8, 'ME101', 'Thermodynamics', 'Fundamentals of thermodynamics including laws, cycles, and applications.', 4, 3, 'V', 5),
(9, 'ME102', 'Mechanics of Materials', 'Study of stress, strain, and deformation in materials.', 3, 3, 'V', 5),
(10, 'ME103', 'Fluid Mechanics', 'Concepts of fluid flow, pressure, and fluid dynamics.', 4, 3, 'V', 5),
(11, 'CE101', 'Structural Analysis', 'Analysis of structures and forces in beams, columns, and frames.', 4, 4, 'V', 5),
(12, 'CE102', 'Construction Materials', 'Properties and uses of materials in construction.', 3, 4, 'V', 5),
(13, 'CE103', 'Geotechnical Engineering', 'Soil mechanics and foundation design principles.', 3, 4, 'V', 5),
(14, 'EC101', 'Embedded Systems', 'Study of embedded systems, microcontrollers, and real-time operating systems.', 4, 5, 'V', 5),
(15, 'EC102', 'Digital Signal Processing', 'Introduction to signal processing and applications in communication.', 3, 5, 'V', 5),
(16, 'CS601', 'Advanced Algorithms', 'Study of advanced algorithms such as dynamic programming and graph theory.', 4, 1, 'V', 1),
(17, 'CS602', 'Parallel Computing', 'Introduction to parallel algorithms and multi-threading techniques.', 4, 1, 'V', 1),
(18, 'CS603', 'Machine Learning', 'Fundamentals of machine learning and statistical learning models.', 4, 1, 'V', 1),
(19, 'CS604', 'Data Science', 'Introduction to data science, big data, and data analysis techniques.', 3, 1, 'V', 2),
(20, 'CS605', 'IoT Systems', 'Study of Internet of Things architecture, devices, and communication.', 3, 1, 'V', 2),
(21, 'CS606', 'Cybersecurity Fundamentals', 'Basic principles of network and information security.', 3, 1, 'V', 2),
(22, 'CS607', 'Blockchain Technology', 'Introduction to blockchain systems, cryptocurrency, and decentralized applications.', 3, 1, 'V', 3),
(23, 'CS608', 'Software Project Management', 'Principles of software project planning, execution, and risk management.', 3, 1, 'V', 3),
(24, 'CS609', 'Advanced Databases', 'Study of advanced database management systems and distributed databases.', 3, 1, 'V', 3),
(25, 'CS601', 'Advanced Algorithms', 'Study of advanced algorithms such as dynamic programming and graph theory.', 4, 1, 'V', 1),
(26, 'CS602', 'Parallel Computing', 'Introduction to parallel algorithms and multi-threading techniques.', 4, 1, 'V', 1),
(27, 'CS603', 'Machine Learning', 'Fundamentals of machine learning and statistical learning models.', 4, 1, 'V', 1),
(28, 'CS604', 'Data Science', 'Introduction to data science, big data, and data analysis techniques.', 3, 1, 'V', 2),
(29, 'CS605', 'IoT Systems', 'Study of Internet of Things architecture, devices, and communication.', 3, 1, 'V', 2),
(30, 'CS606', 'Cybersecurity Fundamentals', 'Basic principles of network and information security.', 3, 1, 'V', 2),
(31, 'CS607', 'Blockchain Technology', 'Introduction to blockchain systems, cryptocurrency, and decentralized applications.', 3, 1, 'V', 3),
(32, 'CS608', 'Software Project Management', 'Principles of software project planning, execution, and risk management.', 3, 1, 'V', 3),
(33, 'CS609', 'Advanced Databases', 'Study of advanced database management systems and distributed databases.', 3, 1, 'V', 3),
(34, 'CS610', 'Artificial Intelligence', 'Introduction to AI techniques including machine learning and neural networks.', 3, 1, 'V', 4),
(35, 'CS611', 'Mobile App Development', 'Development of mobile apps using Android and iOS frameworks.', 3, 1, 'V', 4),
(36, 'CS612', 'Human-Computer Interaction', 'Study of user interface design, UX principles, and usability.', 3, 1, 'V', 4),
(37, 'CS701', 'Advanced Computer Networks', 'Study of advanced topics in computer networks.', 4, 1, 'V', 5),
(38, 'cs404', 'Hacking Technology', 'Some course related to computer engineering', 3, 1, 'V', 5),
(41, 'cs404', 'Hacking Technology', 'Some course related to computer engineering', 3, 1, 'V', 5),
(42, 'cs404', 'Hacking Technology', 'Some course related to computer engineering', 3, 1, 'V', 5);

--
-- Triggers `courses`
--
DELIMITER $$
CREATE TRIGGER `after_course_insert` AFTER INSERT ON `courses` FOR EACH ROW BEGIN
    -- Check if the inserted course is of type 'Core' (e.g., Enrollment_Type_ID = 5)
    IF NEW.Enrollment_Type_ID = 5 THEN
        -- Insert enrollment records for all students of the same department and semester
        INSERT INTO enrolls_in (Student_ID, Course_ID, Year)
        SELECT s.Student_ID, NEW.Course_ID, YEAR(CURDATE())
        FROM students s
        WHERE s.Department_ID = NEW.Department_ID
          AND s.Current_Semester = NEW.Semester;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course_selections`
--

CREATE TABLE `course_selections` (
  `Selection_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Accepted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_selections`
--

INSERT INTO `course_selections` (`Selection_ID`, `Student_ID`, `Course_ID`, `Accepted`) VALUES
(1, 1, 15, 0),
(2, 9, 5, 1),
(3, 4, 5, 0),
(4, 11, 5, 0),
(37, 1, 34, 0),
(40, 1, 16, 0),
(41, 1, 24, 0),
(42, 1, 22, 0);

--
-- Triggers `course_selections`
--
DELIMITER $$
CREATE TRIGGER `after_course_acceptance` AFTER UPDATE ON `course_selections` FOR EACH ROW BEGIN
    -- Check if the course has been accepted
    IF NEW.Accepted = TRUE THEN
        -- Insert into Enrolls_In table with Student_ID, Course_ID and current year
        INSERT INTO Enrolls_In (Student_ID,Course_ID,Year)
        VALUES (NEW.Student_ID, NEW.Course_ID, YEAR(CURDATE()));
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `Department_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`Department_ID`, `Name`, `Description`) VALUES
(1, 'Computer Engineering', 'Department of Computer Engineering'),
(2, 'Information Technology', 'Department of Information Technology'),
(3, 'Mechancical Engineering', 'Department of Mechanical Engineering'),
(4, 'Civil Engineering', 'Department of Civil Engineering'),
(5, 'Electronics and Computer Science', 'Department of Electronics and Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_types`
--

CREATE TABLE `enrollment_types` (
  `Enrollment_Type_ID` int(11) NOT NULL,
  `Enrollment_Type_Name` enum('Major','Minor','Professional Elective','Open Elective','Core') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment_types`
--

INSERT INTO `enrollment_types` (`Enrollment_Type_ID`, `Enrollment_Type_Name`) VALUES
(1, 'Major'),
(2, 'Minor'),
(3, 'Professional Elective'),
(4, 'Open Elective'),
(5, 'Core');

-- --------------------------------------------------------

--
-- Table structure for table `enrolls_in`
--

CREATE TABLE `enrolls_in` (
  `Enrollment_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrolls_in`
--

INSERT INTO `enrolls_in` (`Enrollment_ID`, `Student_ID`, `Course_ID`, `Year`) VALUES
(102, 1, 1, 2023),
(103, 1, 2, 2023),
(104, 1, 3, 2023),
(105, 2, 4, 2023),
(106, 2, 5, 2023),
(107, 2, 6, 2023),
(108, 3, 7, 2023),
(109, 3, 8, 2023),
(110, 3, 9, 2023),
(111, 4, 10, 2023),
(112, 4, 11, 2023),
(113, 4, 12, 2023),
(114, 5, 13, 2023),
(115, 5, 14, 2023),
(116, 5, 15, 2023),
(117, 6, 1, 2023),
(118, 6, 2, 2023),
(119, 7, 3, 2023),
(120, 7, 4, 2023),
(121, 8, 5, 2023),
(122, 8, 6, 2023),
(123, 9, 7, 2023),
(124, 9, 8, 2023),
(125, 10, 9, 2023),
(126, 10, 10, 2023),
(127, 11, 11, 2023),
(128, 11, 12, 2023),
(129, 12, 13, 2023),
(130, 12, 14, 2023),
(131, 13, 15, 2023),
(132, 1, 37, 2024),
(133, 2, 37, 2024),
(134, 11, 37, 2024),
(135, 12, 37, 2024),
(140, 2, 38, 2024),
(141, 11, 38, 2024),
(142, 12, 38, 2024),
(147, 2, 41, 2024),
(148, 11, 41, 2024),
(149, 12, 41, 2024),
(154, 2, 42, 2024),
(155, 11, 42, 2024),
(156, 12, 42, 2024),
(161, 9, 5, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `gender_definitions`
--

CREATE TABLE `gender_definitions` (
  `Gender_Code` enum('M','F','X') NOT NULL,
  `Gender_Description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gender_definitions`
--

INSERT INTO `gender_definitions` (`Gender_Code`, `Gender_Description`) VALUES
('M', 'Male'),
('F', 'Female'),
('X', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `Grade_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Semester` varchar(20) NOT NULL,
  `Year` int(11) NOT NULL,
  `IT1` decimal(5,2) DEFAULT NULL,
  `IT2` decimal(5,2) DEFAULT NULL,
  `IT3` decimal(5,2) DEFAULT NULL,
  `Sem` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`Grade_ID`, `Student_ID`, `Course_ID`, `Semester`, `Year`, `IT1`, `IT2`, `IT3`, `Sem`) VALUES
(25, 1, 1, 'V', 2024, 19.00, 19.00, 20.00, 85.00),
(26, 2, 2, 'V', 2023, 17.00, 18.00, 19.00, 72.50),
(27, 3, 3, 'V', 2023, 20.00, 20.00, 19.00, 91.25),
(28, 4, 4, 'V', 2023, 16.50, 17.50, 18.00, 65.30),
(29, 5, 5, 'V', 2023, 19.00, 19.50, 20.00, 78.90),
(30, 6, 6, 'V', 2023, 15.50, 16.00, 17.00, 56.00),
(31, 7, 7, 'V', 2023, 18.00, 18.50, 19.50, 82.40),
(32, 8, 8, 'V', 2023, 19.50, 20.00, 20.00, 88.50),
(33, 9, 9, 'V', 2023, 17.50, 18.00, 18.50, 74.80),
(34, 10, 10, 'V', 2023, 16.00, 17.00, 17.50, 90.60),
(35, 11, 11, 'V', 2023, 18.00, 19.00, 19.50, 66.30),
(36, 12, 12, 'V', 2023, 19.00, 20.00, 20.00, 80.00),
(37, 13, 13, 'V', 2023, 15.50, 16.50, 17.50, 58.70),
(38, 14, 14, 'V', 2023, 16.00, 17.00, 18.00, 85.50),
(39, 15, 15, 'V', 2023, 19.50, 20.00, 20.00, 92.10),
(40, 1, 2, 'V', 2023, 17.00, 18.00, 19.00, 72.00),
(41, 1, 3, 'V', 2023, 22.50, 23.00, 24.50, 75.00),
(42, 6, 1, 'V', 2024, 20.00, 15.00, 18.00, 85.00);

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `Instructor_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Gender` enum('M','F','X') NOT NULL,
  `Contact_Info` varchar(150) DEFAULT NULL,
  `Profile_Picture` varchar(255) DEFAULT NULL,
  `Department_ID` int(11) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`Instructor_ID`, `First_Name`, `Middle_Name`, `Last_Name`, `Gender`, `Contact_Info`, `Profile_Picture`, `Department_ID`, `Start_Date`) VALUES
(1, 'Alan', 'John', 'Smith', 'M', 'alansmith@dbcegoa.ac.in', NULL, 1, '2020-01-15'),
(2, 'Betty', 'Marie', 'Johnson', 'F', 'bettyjohnson@dbcegoa.ac.in', NULL, 1, '2021-02-10'),
(3, 'Charles', 'Michael', 'Davis', 'M', 'charlesdavis@dbcegoa.ac.in', NULL, 1, '2022-03-20'),
(4, 'Dorothy', 'Anne', 'Martinez', 'F', 'dorothymartinez@dbcegoa.ac.in', NULL, 1, '2020-04-25'),
(5, 'Edward', 'Richard', 'Garcia', 'M', 'edwardgarcia@dbcegoa.ac.in', NULL, 2, '2021-05-18'),
(6, 'Fiona', 'Sophia', 'Clark', 'F', 'fionaclark@dbcegoa.ac.in', NULL, 2, '2022-06-11'),
(7, 'George', 'Matthew', 'Rodriguez', 'M', 'georgerodriguez@dbcegoa.ac.in', NULL, 2, '2020-07-09'),
(8, 'Hannah', 'Elizabeth', 'Lewis', 'F', 'hannahlewis@dbcegoa.ac.in', NULL, 2, '2021-08-23'),
(9, 'Isaac', 'Anthony', 'Lee', 'M', 'isaaclee@dbcegoa.ac.in', NULL, 1, '2022-09-14'),
(10, 'Jack', 'Amelia', 'Walker', 'M', 'jackwalker@dbcegoa.ac.in', NULL, 1, '2020-10-29'),
(11, 'Kathy', 'Emily', 'Robinson', 'F', 'kathyrobinson@dbcegoa.ac.in', NULL, 2, '2021-11-06'),
(12, 'Louis', 'Charles', 'Young', 'M', 'louischarles@dbcegoa.ac.in', NULL, 2, '2022-12-17'),
(13, 'Molly', 'Grace', 'King', 'F', 'mollyking@dbcegoa.ac.in', NULL, 2, '2020-01-08'),
(14, 'Nathan', 'David', 'Scott', 'M', 'nathanscott@dbcegoa.ac.in', NULL, 1, '2021-02-27'),
(15, 'Olivia', 'Helen', 'Green', 'F', 'oliviagreen@dbcegoa.ac.in', NULL, 1, '2022-03-15'),
(16, 'John', 'Brian', 'Smith', 'M', 'john.smith@dbcegoa.ac.in', NULL, 1, '2020-04-12');

--
-- Triggers `instructors`
--
DELIMITER $$
CREATE TRIGGER `update_instructor_email` AFTER UPDATE ON `instructors` FOR EACH ROW BEGIN
    IF OLD.Contact_Info != NEW.Contact_Info THEN
        UPDATE users
        SET Email = NEW.Contact_Info
        WHERE User_ID IN (
            SELECT User_ID 
            FROM role_associations 
            WHERE Instructor_ID = NEW.Instructor_ID
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_assignments`
--

CREATE TABLE `instructor_assignments` (
  `Instructor_ID` int(11) NOT NULL,
  `Course_ID` int(11) DEFAULT NULL,
  `Role_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor_assignments`
--

INSERT INTO `instructor_assignments` (`Instructor_ID`, `Course_ID`, `Role_ID`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mentorship`
--

CREATE TABLE `mentorship` (
  `Mentorship_ID` int(11) NOT NULL,
  `Instructor_ID` int(11) NOT NULL,
  `Student_Roll_No` int(11) NOT NULL,
  `Semester` varchar(20) NOT NULL,
  `Department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentorship`
--

INSERT INTO `mentorship` (`Mentorship_ID`, `Instructor_ID`, `Student_Roll_No`, `Semester`, `Department_ID`) VALUES
(1, 16, 11, 'V', 1),
(2, 16, 12, 'V', 1),
(3, 16, 111, 'V', 1),
(4, 16, 112, 'V', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `Quote_ID` int(11) NOT NULL,
  `Quote` text NOT NULL,
  `Author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`Quote_ID`, `Quote`, `Author`) VALUES
(1, 'Education is the most powerful weapon which you can use to change the world.', 'Nelson Mandela'),
(2, 'The future belongs to those who believe in the beauty of their dreams.', 'Eleanor Roosevelt'),
(3, 'The expert in anything was once a beginner.', 'Helen Hayes'),
(4, 'Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.', 'Albert Schweitzer'),
(5, 'The beautiful thing about learning is that no one can take it away from you.', 'B.B. King'),
(6, 'Don’t watch the clock; do what it does. Keep going.', 'Sam Levenson'),
(7, 'The secret to getting ahead is getting started.', 'Mark Twain'),
(8, 'Your attitude, not your aptitude, will determine your altitude.', 'Zig Ziglar'),
(9, 'Education is not the filling of a pail, but the lighting of a fire.', 'William Butler Yeats'),
(10, 'A journey of a thousand miles begins with a single step.', 'Lao Tzu'),
(11, 'The best way to predict your future is to create it.', 'Peter Drucker'),
(12, 'Success is not final, failure is not fatal: it is the courage to continue that counts.', 'Winston Churchill'),
(13, 'The only place where success comes before work is in the dictionary.', 'Vidal Sassoon'),
(14, 'You are never too old to set another goal or to dream a new dream.', 'C.S. Lewis'),
(15, 'Strive for progress, not perfection.', 'Unknown'),
(16, 'Believe you can and you’re halfway there.', 'Theodore Roosevelt'),
(17, 'It’s not about how bad you want it, it’s about how hard you’re willing to work for it.', 'Unknown'),
(18, 'The harder you work for something, the greater you’ll feel when you achieve it.', 'Unknown'),
(19, 'Don’t let what you cannot do interfere with what you can do.', 'John Wooden'),
(20, 'The only limit to our realization of tomorrow is our doubts of today.', 'Franklin D. Roosevelt');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Role_ID` int(11) NOT NULL,
  `Role_Name` enum('Student','Teacher','Admin','HOD','ClassTeacher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Role_ID`, `Role_Name`) VALUES
(1, 'Student'),
(2, 'Teacher'),
(3, 'Admin'),
(4, 'HOD'),
(5, 'ClassTeacher');

-- --------------------------------------------------------

--
-- Table structure for table `role_associations`
--

CREATE TABLE `role_associations` (
  `User_ID` int(11) NOT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Instructor_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_associations`
--

INSERT INTO `role_associations` (`User_ID`, `Student_ID`, `Instructor_ID`) VALUES
(1, 1, NULL),
(2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Student_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Gender` enum('M','F','X') NOT NULL,
  `Roll_No` int(11) NOT NULL,
  `University_No` varchar(50) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `PhoneNo` varchar(15) DEFAULT NULL,
  `Current_Semester` varchar(20) NOT NULL,
  `Profile_Picture` varchar(255) DEFAULT NULL,
  `Bio` text DEFAULT NULL,
  `Department_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `First_Name`, `Middle_Name`, `Last_Name`, `Gender`, `Roll_No`, `University_No`, `Date_Of_Birth`, `Email`, `PhoneNo`, `Current_Semester`, `Profile_Picture`, `Bio`, `Department_ID`) VALUES
(1, 'Malcolm', 'Dos Reis', 'Antao', 'M', 11, 'U12345601', '2004-01-06', '2214025@dbcegoa.ac.in', '7499084979', 'V', '../Assets/ProfileImages/profile_671eada98781a0.11236213.jpg', 'Computer Engineering student . ', 1),
(2, 'Alice', 'Marie', 'Smith', 'F', 12, 'U12345602', '1999-05-23', '2@dbcegoa.ac.in', '9876543211', 'V', NULL, 'Loves AI research.', 1),
(3, 'Bob', 'Robert', 'Johnson', 'M', 23, 'U22345601', '1998-11-30', '3@dbcegoa.ac.in', '9876543212', 'V', NULL, 'Expert in web development.', 2),
(4, 'Carol', 'Anne', 'Williams', 'F', 24, 'U22345602', '2000-03-12', '4@dbcegoa.ac.in', '9876543213', 'V', NULL, 'Focuses on networking.', 2),
(5, 'Dave', 'Matthew', 'Brown', 'M', 35, 'U32345601', '2001-07-18', '5@dbcegoa.ac.in', '9876543214', 'V', NULL, 'Mechanical Engineering student.', 3),
(6, 'Eve', 'Sophia', 'Davis', 'F', 36, 'U32345602', '1999-12-22', '6@dbcegoa.ac.in', '9876543215', 'V', NULL, 'Interested in thermodynamics.', 3),
(7, 'Frank', 'Richard', 'Miller', 'M', 47, 'U42345601', '2001-02-05', '7@dbcegoa.ac.in', '9876543216', 'V', NULL, 'Specializes in structural analysis.', 4),
(8, 'Grace', 'Elizabeth', 'Wilson', 'F', 48, 'U42345602', '2000-09-17', '8@dbcegoa.ac.in', '9876543217', 'V', NULL, 'Focuses on geotechnical engineering.', 4),
(9, 'Hank', 'Anthony', 'Moore', 'M', 59, 'U52345601', '1999-04-25', '9@dbcegoa.ac.in', '9876543218', 'V', NULL, 'Embedded systems enthusiast.', 5),
(10, 'Ivy', 'Amelia', 'Taylor', 'F', 510, 'U52345602', '2001-06-10', '10@dbcegoa.ac.in', '9876543219', 'V', NULL, 'Loves digital signal processing.', 5),
(11, 'Jack', 'George', 'Anderson', 'M', 111, 'U12345611', '1999-11-14', '11@dbcegoa.ac.in', '9876543220', 'V', NULL, 'Focuses on software engineering.', 1),
(12, 'Kim', 'Sarah', 'Thomas', 'F', 112, 'U12345612', '2000-08-19', '12@dbcegoa.ac.in', '9876543221', 'V', NULL, 'Blockchain technology expert.', 1),
(13, 'Leo', 'Charles', 'Jackson', 'M', 313, 'U32345613', '1998-12-03', '13@dbcegoa.ac.in', '9876543222', 'V', NULL, 'Mechanical design and fluid mechanics.', 3),
(14, 'Mia', 'Emily', 'White', 'F', 214, 'U22345614', '2001-09-28', '14@dbcegoa.ac.in', '9876543223', 'V', NULL, 'Focuses on cloud computing.', 2),
(15, 'Nate', 'David', 'Harris', 'M', 415, 'U42345615', '1999-07-04', '15@dbcegoa.ac.in', '9876543224', 'V', NULL, 'Civil Engineering, construction materials.', 4);

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `auto_enroll_core_courses` AFTER INSERT ON `students` FOR EACH ROW BEGIN
  -- Insert into Enrolls_In for core courses in the same department and semester
  INSERT INTO enrolls_in (Student_ID, Course_ID, Year)
  SELECT NEW.Student_ID, c.Course_ID, YEAR(CURDATE())
  FROM courses c
  WHERE c.Department_ID = NEW.Department_ID  -- Same department as student
    AND c.Semester = NEW.Current_Semester    -- Same semester as student
    AND c.Enrollment_Type_ID = 1;            -- Core course (Enrollment_Type_ID = 1)
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_enroll_core_courses_after_update` AFTER UPDATE ON `students` FOR EACH ROW BEGIN
  -- Check if the department or current semester has been changed
  IF NEW.Department_ID != OLD.Department_ID OR NEW.Current_Semester != OLD.Current_Semester THEN
    -- Insert into Enrolls_In for core courses in the updated department and semester
    INSERT INTO enrolls_in (Student_ID, Course_ID, Year)
    SELECT NEW.Student_ID, c.Course_ID, YEAR(CURDATE())
    FROM courses c
    WHERE c.Department_ID = NEW.Department_ID  -- Same updated department as student
      AND c.Semester = NEW.Current_Semester    -- Same updated semester as student
      AND c.Enrollment_Type_ID = 1;            -- Core course (Enrollment_Type_ID = 1)
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_student_email` AFTER UPDATE ON `students` FOR EACH ROW BEGIN
    IF OLD.Email != NEW.Email THEN
        UPDATE users
        SET Email = NEW.Email
        WHERE User_ID IN (
            SELECT User_ID 
            FROM role_associations 
            WHERE Student_ID = NEW.Student_ID
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_sgpa_cgpa`
-- (See below for the actual view)
--
CREATE TABLE `student_sgpa_cgpa` (
`Student_ID` int(11)
,`First_Name` varchar(50)
,`Last_Name` varchar(50)
,`SGPA_Sem1` decimal(5,4)
,`SGPA_Sem2` decimal(5,4)
,`SGPA_Sem3` decimal(5,4)
,`SGPA_Sem4` decimal(5,4)
,`SGPA_Sem5` decimal(5,4)
,`SGPA_Sem6` decimal(5,4)
,`SGPA_Sem7` decimal(5,4)
,`SGPA_Sem8` decimal(5,4)
,`CGPA` decimal(5,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `Instructor_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`Instructor_ID`, `Course_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 1),
(16, 5),
(16, 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `Email`, `Password`, `Role_ID`) VALUES
(1, '2214025@dbcegoa.ac.in', '$2a$12$iLX8IrL0gSt0i15/UevSr.Y84diJJw31zMsKgXKt84d/SIY6Ph0Fu', 1),
(2, 'john.smith@dbcegoa.ac.in', '$2a$12$O7/iOmAO0MAKAK/6adBLXO/KQW43sLTFPlb4aVRAJIZh2LEeopZG.', 4),
(3, 'admin@dbcegoa.ac.in', '$2a$12$6HWNitANOhSwGc45g8koOuT/kMfG68dN.O/U/Vf5wEhg/yhpnn.u.', 3);

-- --------------------------------------------------------

--
-- Structure for view `student_sgpa_cgpa`
--
DROP TABLE IF EXISTS `student_sgpa_cgpa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_sgpa_cgpa`  AS SELECT `s`.`Student_ID` AS `Student_ID`, `s`.`First_Name` AS `First_Name`, `s`.`Last_Name` AS `Last_Name`, avg(case when `g`.`Semester` = 'I' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem1`, avg(case when `g`.`Semester` = 'II' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem2`, avg(case when `g`.`Semester` = 'III' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem3`, avg(case when `g`.`Semester` = 'IV' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem4`, avg(case when `g`.`Semester` = 'V' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem5`, avg(case when `g`.`Semester` = 'VI' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem6`, avg(case when `g`.`Semester` = 'VII' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem7`, avg(case when `g`.`Semester` = 'VIII' then case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end else NULL end) AS `SGPA_Sem8`, avg(case when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 85 then 10 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 75 then 9 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 65 then 8 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 55 then 7 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 50 then 6 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 45 then 5 when ((`g`.`IT1` + `g`.`IT2` + `g`.`IT3`) / 3 + `g`.`Sem`) / 125 * 100 >= 40 then 4 else 0 end) AS `CGPA` FROM (`students` `s` join `grades` `g` on(`s`.`Student_ID` = `g`.`Student_ID`)) GROUP BY `s`.`Student_ID`, `s`.`First_Name`, `s`.`Last_Name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`Announcement_ID`),
  ADD KEY `Author_ID` (`Author_ID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `FK_Courses_Enrollment_Type` (`Enrollment_Type_ID`);

--
-- Indexes for table `course_selections`
--
ALTER TABLE `course_selections`
  ADD PRIMARY KEY (`Selection_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indexes for table `enrollment_types`
--
ALTER TABLE `enrollment_types`
  ADD PRIMARY KEY (`Enrollment_Type_ID`);

--
-- Indexes for table `enrolls_in`
--
ALTER TABLE `enrolls_in`
  ADD PRIMARY KEY (`Enrollment_ID`),
  ADD UNIQUE KEY `Student_ID_2` (`Student_ID`,`Course_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `gender_definitions`
--
ALTER TABLE `gender_definitions`
  ADD PRIMARY KEY (`Gender_Code`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`Grade_ID`),
  ADD UNIQUE KEY `Student_ID_2` (`Student_ID`,`Course_ID`),
  ADD UNIQUE KEY `UNIQUE_Student_Course` (`Student_ID`,`Course_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`Instructor_ID`),
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `FK_Instructor_Gender` (`Gender`);

--
-- Indexes for table `instructor_assignments`
--
ALTER TABLE `instructor_assignments`
  ADD PRIMARY KEY (`Instructor_ID`),
  ADD KEY `FK_Course_ID` (`Course_ID`),
  ADD KEY `FK_Role_ID` (`Role_ID`);

--
-- Indexes for table `mentorship`
--
ALTER TABLE `mentorship`
  ADD PRIMARY KEY (`Mentorship_ID`),
  ADD KEY `FK_Mentorship_Student_Roll_No` (`Student_Roll_No`),
  ADD KEY `FK_Mentorship_Department` (`Department_ID`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`Quote_ID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `role_associations`
--
ALTER TABLE `role_associations`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Instructor_ID` (`Instructor_ID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_ID`),
  ADD KEY `FK_Student_Department` (`Department_ID`),
  ADD KEY `FK_Student_Gender` (`Gender`),
  ADD KEY `idx_roll_no` (`Roll_No`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`Instructor_ID`,`Course_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Role_ID` (`Role_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `Announcement_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `course_selections`
--
ALTER TABLE `course_selections`
  MODIFY `Selection_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `Department_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enrollment_types`
--
ALTER TABLE `enrollment_types`
  MODIFY `Enrollment_Type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enrolls_in`
--
ALTER TABLE `enrolls_in`
  MODIFY `Enrollment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `Grade_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `Instructor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mentorship`
--
ALTER TABLE `mentorship`
  MODIFY `Mentorship_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `Quote_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Role_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `Student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`Author_ID`) REFERENCES `instructors` (`Instructor_ID`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `FK_Courses_Department` FOREIGN KEY (`Department_ID`) REFERENCES `departments` (`Department_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Courses_Enrollment_Type` FOREIGN KEY (`Enrollment_Type_ID`) REFERENCES `enrollment_types` (`Enrollment_Type_ID`) ON DELETE SET NULL;

--
-- Constraints for table `course_selections`
--
ALTER TABLE `course_selections`
  ADD CONSTRAINT `course_selections_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_selections_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`) ON DELETE CASCADE;

--
-- Constraints for table `enrolls_in`
--
ALTER TABLE `enrolls_in`
  ADD CONSTRAINT `enrolls_in_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`),
  ADD CONSTRAINT `enrolls_in_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`);

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `FK_Instructor_Gender` FOREIGN KEY (`Gender`) REFERENCES `gender_definitions` (`Gender_Code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `departments` (`Department_ID`);

--
-- Constraints for table `instructor_assignments`
--
ALTER TABLE `instructor_assignments`
  ADD CONSTRAINT `FK_Course_ID` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Instructor_ID` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructors` (`Instructor_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Role_ID` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`Role_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `mentorship`
--
ALTER TABLE `mentorship`
  ADD CONSTRAINT `FK_Mentorship_Department` FOREIGN KEY (`Department_ID`) REFERENCES `departments` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Mentorship_Student_Roll_No` FOREIGN KEY (`Student_Roll_No`) REFERENCES `students` (`Roll_No`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_associations`
--
ALTER TABLE `role_associations`
  ADD CONSTRAINT `role_associations_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_associations_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_associations_ibfk_3` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructors` (`Instructor_ID`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `FK_Student_Department` FOREIGN KEY (`Department_ID`) REFERENCES `departments` (`Department_ID`),
  ADD CONSTRAINT `FK_Student_Gender` FOREIGN KEY (`Gender`) REFERENCES `gender_definitions` (`Gender_Code`) ON UPDATE CASCADE;

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `fk_teaches_instructor` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructors` (`Instructor_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructors` (`Instructor_ID`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`Role_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
