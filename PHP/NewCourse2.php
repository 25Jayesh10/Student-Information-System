<?php
// Establish database connection using PDO
session_start();
include("Connection.php");

// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data
    $CourseName = $_POST['CourseName'];
    $course_code = $_POST['course_code'];
    $Description = $_POST['Description'];
    $Credits = $_POST['Credits'];
    $Semester = $_POST['Current_Semester']; // Updated to match HTML name attribute
    $Enrollment_Type_ID = $_POST['Enrollment_Type_ID'];

    // Check if any department was selected
    if (isset($_POST['Department_ID'])) {
        $departmentIds = (array) $_POST['Department_ID']; // Cast to array if it is a single value

        // Prepare SQL statement to insert data
        $sql = "INSERT INTO courses (course_code, CourseName, Description, Credits, Department_ID, Semester, Enrollment_Type_ID) 
            VALUES (:course_code, :CourseName, :Description, :Credits, :Department_ID, :Semester, :Enrollment_Type_ID)";

        // Loop through each department ID and insert a new row for each
        foreach ($departmentIds as $Department_ID) {
            // Check if the department exists in the departments table
            $checkSql = "SELECT * FROM departments WHERE Department_ID = :Department_ID";
            $checkStmt = $pdo->prepare($checkSql);
            $checkStmt->bindParam(':Department_ID', $Department_ID);
            $checkStmt->execute();

            // If the department exists, insert the course
            if ($checkStmt->rowCount() > 0) {
                // Bind parameters to SQL query
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':course_code', $course_code);
                $stmt->bindParam(':CourseName', $CourseName);
                $stmt->bindParam(':Description', $Description);
                $stmt->bindParam(':Credits', $Credits);
                $stmt->bindParam(':Department_ID', $Department_ID); // The department introducing the course
                $stmt->bindParam(':Semester', $Semester);
                $stmt->bindParam(':Enrollment_Type_ID', $Enrollment_Type_ID);

                // Execute the query
                if ($stmt->execute()) {
                    // echo "Course added successfully for Department ID: $Department_ID<br>";
                } else {
                    echo "Error adding course for Department ID: $Department_ID. " . implode(", ", $stmt->errorInfo()) . "<br>";
                }
            } else {
                echo "Error: Department ID $Department_ID does not exist.<br>";
            }
        }
    } else {
        echo "No department selected!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <title>Course Page</title>
</head>
<style>
    :root {
        --bg-color-dark: #120E0E;
        --bg-color-light: #d9e8e8;

        --text-color-dark: #ffffff;
        --text-color-light: #ffffff;

        --sidebar-bg-color-dark: linear-gradient(130deg,
                hsl(0deg 0% 7%) 0%,
                hsl(0deg 0% 8%) 24%,
                hsl(0deg 0% 9%) 35%,
                hsl(0deg 1% 10%) 44%,
                hsl(0deg 3% 12%) 64%,
                hsl(0deg 4% 13%) 100%);

        --sidebar-bg-color-light: linear-gradient(130deg,
                hsl(196deg 49% 21%) 11%,
                hsl(198deg 38% 25%) 29%,
                hsl(199deg 32% 28%) 37%,
                hsl(199deg 29% 31%) 41%,
                hsl(200deg 27% 34%) 45%,
                hsl(200deg 25% 36%) 48%,
                hsl(200deg 24% 38%) 50%,
                hsl(201deg 23% 40%) 52%,
                hsl(201deg 22% 42%) 54%,
                hsl(201deg 21% 44%) 55%,
                hsl(201deg 21% 46%) 56%,
                hsl(201deg 20% 48%) 57%,
                hsl(202deg 20% 50%) 58%,
                hsl(202deg 21% 51%) 59%,
                hsl(202deg 22% 53%) 60%,
                hsl(202deg 23% 54%) 61%,
                hsl(202deg 24% 56%) 62%,
                hsl(202deg 25% 57%) 63%,
                hsl(202deg 26% 59%) 65%,
                hsl(202deg 27% 60%) 66%,
                hsl(202deg 29% 62%) 68%,
                hsl(202deg 30% 63%) 70%,
                hsl(202deg 32% 64%) 74%,
                hsl(202deg 33% 66%) 79%,
                hsl(202deg 35% 67%) 92%);

        --icons-color-dark: #ffffff;
        --icons-color-light: #ffffff;

        --icons-color-active-dark: #000000;
        --icons-color-active-light: #000000;

        --icon-color-dark: #000000;
        --icon-color-light: #000000;

        --sidebar-circe-dark: #f8290b;
        --sidebar-circe-light: #0f0;

        --card-color-dark: linear-gradient(175deg, hsl(0deg 0% 7%) 0%,
                hsl(0deg 0% 8%) 24%,
                hsl(0deg 0% 9%) 35%,
                hsl(0deg 1% 10%) 44%,
                hsl(0deg 3% 12%) 64%,
                hsl(0deg 4% 13%) 100%);

        --card-color-light: radial-gradient(at top left,
                hsl(202deg 33% 32%) 0%,
                hsl(202deg 29% 35%) 22%,
                hsl(202deg 27% 38%) 37%,
                hsl(202deg 25% 41%) 46%,
                hsl(202deg 24% 44%) 52%,
                hsl(201deg 23% 46%) 56%,
                hsl(201deg 22% 49%) 60%,
                hsl(201deg 22% 51%) 64%,
                hsl(201deg 23% 53%) 68%,
                hsl(201deg 25% 55%) 73%,
                hsl(201deg 26% 57%) 78%,
                hsl(201deg 28% 59%) 85%,
                hsl(201deg 30% 61%) 92%,
                hsl(201deg 32% 63%) 100%);

        --shadow-dark: 0 0 10px rgba(0, 0, 0, 0.2);
        --shadow-light: 0 0 10px rgba(0, 0, 0, 0.5);

        --shadow-card-details-dark: var(--shadow-dark);
        --shadow-card-details-light: #F19B1A;

        --shadow-profile-dark: 0 0 10px rgba(25, 81, 10, 1);
        --shadow-profile-light: #74e857;

        --cot-dark: #D7FE65;
        --cot-light: #0f0;

        --cot-dark-hover: #D3F263;
        --cot-light-hover: #0f0;

        --gradient-bg-dark: radial-gradient(at right bottom, #EFEA75, #02D12F);
        --gradient-bg-light: linear-gradient(200deg, #ff7e5f, #feb47b, #86a8e7);

        --icon-bg-dark: #f8290b;
        --icon-bg-light: var(--card-color-light);

        --icon-bg-dark-hover: #E88010;
        --icon-bg-light-hover: #cccccc;

        --icon-gradient-bg-dark-hover: radial-gradient(at right bottom, #2980b9, #6dd5fa, #ffffff);
        --icon-gradient-bg-light-hover: #cccccc;

        --course-card-dark-gradient: radial-gradient(at right bottom, #EFEA75, #02D12F);
        --course-card-light-gradient: radial-gradient(at left top, rgba(0, 118, 255, 1) 0%, rgba(32, 157, 230, 1) 35%, rgba(109, 203, 255, 1) 69%, rgba(179, 229, 255, 1) 99%);

        --course-card-dark: #232323;
        --course-card-light: #f0f0f0;

        --course-card-dark-gradient-hover: radial-gradient(at right top, rgba(11, 181, 24, 1) 0%, rgba(152, 205, 120, 1) 28%, rgba(67, 216, 29, 1) 63%, rgba(219, 223, 147, 1) 93%);
        --course-card-light-gradient-hover: radial-gradient(at left top, rgba(20, 205, 230, 1) 0%, rgba(146, 203, 236, 1) 40%, rgba(214, 232, 243, 1) 77%, rgba(214, 232, 243, 1) 77%);

        --bold-text-dark: #08C922;
        --bold-text-light: #58baf3;

        --profile-border-dark: #54b23c;
        --profile-border-light: #74e857;
    }


    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: var(--bg-color-dark);
        color: var(--text-color-dark);
        overflow-x: hidden;
        display: flex;
        justify-content: start;
        align-items: start;
        min-height: 100vh;
        transition: background-color 0.3s, color 0.3s;
    }

    body.light-mode {
        background-color: var(--bg-color-light);
        color: var(--text-color-light);
    }

    /* Keyframes for gradient animation */
    @keyframes gradient-animation {
        0% {
            background-position: 0% 50%;
        }

        50% {
            background-position: 100% 50%;
        }

        100% {
            background-position: 0% 50%;
        }
    }


    .gradient-bg {
        background: var(--course-card-dark-gradient);
        background-size: 300% 300%;
        animation: gradient-animation 15s ease infinite;
        transition: animation-duration 0.5s ease;
    }


    .gradient-bg-hover {
        background: var(--course-card-dark-gradient-hover);
        background-size: 300% 300%;
        animation: gradient-animation 10s ease infinite;
        transition: animation-duration 0.5s ease;
    }

    .gradient-sidebar {
        background: var(--sidebar-bg-color-dark);
        background-size: 400% 400%;
        animation: gradient-animation 15s ease infinite;
        transition: animation-duration 0.5s ease;
    }

    .gradient-card {
        background: var(--card-color-dark);
        background-size: 400% 400%;
        animation: gradient-animation 50s ease infinite;
        transition: animation-duration 0.5s ease;
    }

    body.light-mode .gradient-bg-hover {
        background: var(--course-card-light-gradient-hover);
        background-size: 400% 400%;
        animation: gradient-animation 10s ease infinite;
        transition: animation-duration 0.5s ease;
    }

    body.light-mode .gradient-sidebar {
        background: var(--sidebar-bg-color-light);
        background-size: 400% 400%;
        animation: gradient-animation 15s ease infinite;
        transition: animation-duration 0.5s ease;
    }

    body.light-mode .gradient-bg {
        background: var(--icon-gradient-bg-dark-hover);
        background-size: 400% 400%;
    }

    body.light-mode .gradient-card {
        background: var(--card-color-light);
        background-size: 400% 400%;
    }

    .container {
        display: flex;
        background: var(--bg-color-dark);
        height: 100vh;
        transition: 0.3s ease;
        gap: 30px;
    }

    body.light-mode .container {
        background: var(--bg-color-light);
    }


    /* Main content area divided into columns */
    .main-content {
        display: flex;
        flex: 4;
        padding: 20px;
        gap: 20px;
    }

    /* Column 2 layout */
    .column-2 {
        display: flex;
        flex-direction: column;
        flex: 2;
        gap: 20px;
        width: 88vw;
    }

    /* Column 3 layout */
    .column-3 {
        display: flex;
        flex-direction: column;
        flex: 0.8;
        gap: 20px;
    }

    /* gpa and Date blocks smaller */
    .small-block {
        border-radius: 10px;
        padding: 10px;
        text-align: center;
        flex: 1;
        height: 100px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        position: relative;
        box-shadow: var(--shadow-dark);
    }

    .small-block p {
        margin: 0px;
        padding: 5px 0px;
    }

    .notice-block {
        display: flex;
        flex-direction: column;
        align-items: start;
        padding-left: 20px;
    }

    .notice-block a {
        color: #c1e1e2;
        text-decoration: none;
    }

    body.light-mode .notice-block a {
        background-color: transparent;
        color: var(--text-color-dark);
    }

    body.light-mode .small-block {
        box-shadow: var(--shadow-light);
    }

    /* Flex container for date and gpa to be side by side */
    .date-gpa {
        display: flex;
        gap: 20px;
        flex-shrink: 0;
    }

    /* Search bar styling */
    .search-bar {
        width: 98%;
        position: relative;
        top: 0;
    }

    .search-bar h1 {
        padding-top: 15px;
        color: var(--bold-text-dark);
    }

    body.light-mode h2 {
        color: var(--bold-text-light);
    }

    .search-bar input {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #232B3A;
        color: #ffffff;
    }

    body.light-mode .search-bar input {
        background-color: #c3d8da;
        color: #000000;
    }

    /* Courses section */
    .courses {
        background-color: var(--card-color-dark);
        border-radius: 10px;
        padding: 20px;
        display: flex;
        gap: 10px;
        height: 100vh;
        flex-wrap: wrap;
        overflow-y: auto;
        justify-content: space-around;
        box-shadow: var(--shadow-dark);
    }

    .courses::-webkit-scrollbar {
        display: none;
        /* Chrome, Safari, Opera */
    }

    body.light-mode .courses {
        background-color: var(--card-color-light);
        box-shadow: var(--shadow-light);
    }

    /* Course card container */
    .course-card {
        background-color: var(--course-card-dark);
        border-radius: 10px;
        padding: 10px;
        margin: 10px 0;
        text-align: center;
        max-width: 1000vw;
        max-height: 100vh;
        height: 100%;
        word-wrap: break-word;
        position: relative;
        cursor: pointer;
        transition: transform 0.3s ease;
        flex: 1;
        min-width: 200px;
        box-sizing: border-box;
        transform: scale(0.98);
        box-shadow: var(--shadow-card-details-dark);
    }

    .course-card:hover {
        transform: scale(1.05);
    }

    body.light-mode .course-card {
        background-color: var(--course-card-light);
        color: #000;
        box-shadow: var(--shadow-light);
    }

    /* Course basic info */
    .course-basic {
        padding: 10px;
        z-index: 1;
        transition: opacity 0.3s ease, transform 0.3s ease;
    }

    .course-basic strong {
        color: var(--bold-text-dark);
    }

    body.light-mode .course-basic strong {
        color: var(--bold-text-light);
    }

    /* Course marks card (initially hidden under basic info) */
    .course-marks {
        background-color: var(--course-card-dark-gradient-hover);
        color: var(--text-color-light);
        border-radius: 10px;
        padding: 10px;
        box-sizing: border-box;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 70vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        opacity: 0;
        z-index: 0;
        transition: opacity 0.3s ease, z-index 0.3s ease;
    }

    body.light-mode .course-marks {
        background-color: rgba(180, 200, 202, 0.95);
        color: #000000;
    }

    /* On hover, show the marks card and hide the basic info */
    .course-card:hover .course-basic {
        opacity: 0;
        z-index: 0;
    }

    .course-card:hover .course-marks {
        opacity: 1;
        z-index: 1;
    }

    .course-marks p,
    .course-marks strong {
        line-height: 1.2;
        margin: 0;
        transition: color 0.3s ease;
    }

    /* Ensure "Marks Details" changes color along with other texts */
    .course-marks strong {
        color: var(--text-color-light);
    }

    body.light-mode .course-marks strong {
        color: black;
    }

    /* Icons styling */
    .icons {
        display: flex;
        justify-content: flex-end;
        gap: 20px;
        align-items: center;
    }

    .icons:has(.icon) {
        padding-right: 20px;
    }

    .icon {
        padding: 10px;
        background-color: var(--icon-bg-dark);
        border-radius: 25%;
        cursor: pointer;
        height: 45px;
        transition: background-color 0.3s ease;
        transition: transform 0.5s ease;
    }

    .icon:hover {
        background: linear-gradient(to right, #a8ff78, #78ffd6);
        background-size: 400% 400%;
        transition: 0.5 ease;
        transform: scale(1.3);
    }

    .toggle-button ion-icon {
        position: relative;
        top: 0.5px;
        left: 0.5px;
    }

    .icon:hover {
        background-color: var(--icon-bg-dark-hover);
    }

    body.light-mode .icon {
        background-color: var(--icon-bg-light);
    }

    body.light-mode .icon:hover {
        background-color: var(--icon-bg-light-hover);
    }

    .column-3 {
        padding-top: 15px;
    }

    /* Flexbox adjustments for third column */
    .column-3>.small-block {
        flex-shrink: 0;
    }

    /* Toggle button styling */
    .toggle-button {
        border: none;
        height: 45px;
        border-radius: 25%;
        color: #ffffff;
        padding: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        transition: transform 0.5s ease;
    }


    .toggle-button:hover {
        background: var(--icon-gradient-bg-dark-hover);
        background-size: 400% 400%;
        transition: 0.5 ease;
        transform: scale(1.3);
    }

    body.light-mode .toggle-button {
        background-color: var(--icon-bg-light);
        color: #000000;
    }

    body.light-mode .toggle-button:hover {
        background: var(--course-card-dark-gradient);
        background-size: 400% 400%;
    }

    /* Profile Card Styling */
    .profile-card {
        display: flex;
        align-items: center;
        height: 100%;
        background-color: transparent;
        border-radius: 10px;
        padding: 10px;
        gap: 15px;
    }

    .profile-card strong {
        color: var(--bold-text-dark)
    }

    .small-block strong {
        color: var(--bold-text-dark);
    }

    body.light-mode .profile-card strong {
        color: var(--bold-text-light);
    }

    body.light-mode strong {
        color: var(--bold-text-light);
    }

    .profile-card img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 50%;
        box-shadow: var(--shadow-profile-dark);
    }

    body.light-mode .profile-card {
        background-color: transparent;
    }

    body.light-mode .profile-card img {
        box-shadow: var(--shadow-profile-light);
    }

    .profile-details {
        display: grid;
        grid-template-columns: auto;
        row-gap: 0.1px;
        height: 130%;
        padding: 5px;
        overflow: auto;
    }

    .profile-details p {
        margin: 0;
        font-size: 13px;
        display: flex;
        align-items: center;

    }

    .profile-details p strong {
        width: 120px;
        text-align: left;
        color: var(--bold-text-dark);
        padding-right: 10px;
        font-weight: bold;
    }

    .profile-details strong {
        width: 110px !important;
    }

    /* Scrollbar Styling for.profile-details */
    .profile-details::-webkit-scrollbar {
        width: 10px;
    }

    .profile-details::-webkit-scrollbar-track {
        background: transparent;
    }

    .profile-details::-webkit-scrollbar-thumb {
        background-color: var(--scrollbar-dark);
        border-radius: 10px;
        border: 2px solid transparent;
        background-clip: padding-box;
    }

    .profile-details::-webkit-scrollbar-thumb:hover {
        background-color: var(--scrollbar-dark-hover);
    }

    body.light-mode.profile-details::-webkit-scrollbar-thumb {
        background-color: var(--scrollbar-light);
    }

    body.light-mode.profile-details::-webkit-scrollbar-thumb:hover {
        background-color: var(--scrollbar-light-hover);
    }

    .navigation {
        position: relative;
        width: 100px;
        background: var(--sidebar-bg-color-dark);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 95vh;
        margin-left: 20px;
        margin-bottom: 20px;
        margin-top: 20px;
        border-radius: 10px;
        box-shadow: var(--shadow-dark);
        transition: 0.3s ease;
    }

    .navigation ul {
        display: flex;
        flex-direction: column;
        width: 68px;
    }

    .navigation ul li {
        position: relative;
        list-style: none;
        width: 70px;
        height: 70px;
        z-index: 1;
    }

    .navigation ul li a {
        position: relative;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        text-align: center;
        font-weight: 500;
    }

    .navigation ul li a .icons {
        position: relative;
        display: block;
        line-height: 65px;
        font-size: 1.7em;
        text-align: center;
        transition: 0.3s;
        color: var(--icons-color-dark);
    }

    .navigation ul li.active a .icons {
        color: var(--icons-color-active-dark);
        transform: translateX(47px);
    }

    .navigation ul li a .text {
        position: absolute;
        color: var(--text-color-dark);
        font-weight: 75em;
        right: 10px;
        font-size: 1em;
        letter-spacing: 0.05em;
        transition: 0.3s;
        opacity: 0;
        transform: translateX(-20px);
    }

    .navigation ul li.active a .text {
        opacity: 1;
        transform: translateX(-10px);
    }

    .indicator {
        position: absolute;
        left: 68%;
        width: 60px;
        height: 58px;
        border-radius: 50%;
        border: 6px solid var(--bg-color-dark);
        transition: 0.3s ease;
    }

    /* bottom shadow */
    .indicator::before {
        content: '';
        position: absolute;
        left: 13%;
        bottom: -48%;
        width: 20px;
        height: 20px;
        background: transparent;
        border-top-right-radius: 20px;
        box-shadow: 10px -1px 0 0 var(--bg-color-dark);
        transition: 0.3s ease;
    }

    /* top shadow */
    .indicator::after {
        content: '';
        position: absolute;
        left: 13%;
        top: -22px;
        width: 20px;
        height: 20px;
        background: transparent;
        border-bottom-right-radius: 20px;
        box-shadow: 10px 1px 0 0 var(--bg-color-dark);

        transition: 0.3s ease;
    }

    .navigation ul li:hover a .text {
        opacity: 1;
        transform: translateX(-10px);
    }

    .navigation ul li:hover a .icons {
        transform: translateX(47px);
    }

    .navigation ul li:nth-child(1).active~.indicator {
        transform: translateY(calc(70px * 0));
    }

    .navigation ul li:nth-child(2).active~.indicator {
        transform: translateY(calc(70px * 1));
    }

    .navigation ul li:nth-child(3).active~.indicator {
        transform: translateY(calc(70px * 2));
    }

    .navigation ul li:nth-child(4).active~.indicator {
        transform: translateY(calc(70px * 3));
    }

    .navigation ul li:nth-child(5).active~.indicator {
        transform: translateY(calc(70px * 4));
    }

    .navigation ul li:nth-child(6).active~.indicator {
        transform: translateY(calc(70px * 5));
    }

    body.light-mode .navigation {
        box-shadow: var(--sidebar-shadow-light);
    }

    body.light-mode .navigation ul li a .icons {
        color: var(--icons-color-light);
    }

    body.light-mode .navigation ul li.active a .icons {
        color: var(--icons-color-active-light);
    }

    body.light-mode .navigation ul li a .text {
        color: var(--text-color-dark);
    }

    body.light-mode .indicator {
        border: 6px solid var(--bg-color-light);
    }

    /* bottom shadow */
    body.light-mode .indicator::before {
        box-shadow: 10px -1px 0 0 var(--bg-color-light);
    }

    /* top shadow */
    body.light-mode .indicator::after {
        box-shadow: 10px 1px 0 0 var(--bg-color-light);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .profile-card {
            flex-direction: column;
            align-items: flex-start;
        }

        .profile-card img {
            width: 80px;
            height: 80px;
        }

        .profile-details p strong {
            width: 100px;
        }

        .course-card {
            max-width: 100%;
        }
    }

    canvas {
        margin: 10px;
    }

    .chart-container {
        display: inline-flex;
        height: 100%;
        margin: 10px;
        justify-content: center;
        gap: 50px;
    }

    .chart-block {
        text-align: center;
    }

    .chart-block canvas {
        display: block;
        margin: 0 auto;
        max-width: 100%;
        max-height: 100%;
    }

    .colored-icon {
        font-weight: 500;
        color: var(--icon-color-dark);
    }

    body.light-mode .colored-icon {
        color: var(--icon-color-light);
    }

    .table-container {
        height: 70vh;
        /* Adjust this value as per your layout needs */
        background-color: inherit;
        /* padding-right: 10px; */
        margin-right: 10px;
        margin-left: 10px;
        margin-bottom: 20px;
        /* Space between the table and other content */
        overflow: auto;
        /* Enables scrolling */
        -ms-overflow-style: none;
        /* Hides scrollbar in Internet Explorer 10+ */
        scrollbar-width: none;
        /* Hides scrollbar in Firefox */
    }

    .table-container::-webkit-scrollbar {
        display: none;
        /* Hides scrollbar in Chrome, Safari, and Opera */
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background-color: #333;
        color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s ease;
    }

    body.light-mode table {
        background-color: #e0e0e0;
        color: #000;
    }

    table,
    th,
    td {
        border: 1px solid black;
    }

    .table-container table th,
    .table-container table td {
        width: 25px;
        /* Set uniform width for all columns */
    }

    thead {
        position: sticky;
        top: 0;
        background-color: #444;
        /* Ensure header is visible during scroll */
    }

    th,
    td {
        padding: 15px;
        border: none;
        text-align: center;
    }

    th {
        background-color: #444;
        font-weight: bold;
    }

    body.light-mode th {
        background-color: #c0c0c0;
    }

    .course-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #333;
        color: white;
        border-radius: 10px;
        overflow: none;
    }

    .course-table th,
    .course-table td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #444;
    }

    .course-table th {
        background-color: #444;
    }

    .course-table td {
        background-color: #555;
    }

    /* Content column hover effect */
    .course-content {
        white-space: nowrap;
        overflow: none;
        text-overflow: ellipsis;
        max-width: 200px;
        /* Limit the content width */
        cursor: pointer;
        position: relative;
        /* overflow: hidden; */
    }

    .course-content:hover::after {
        content: attr(data-full-content);
        /* Show full content on hover */
        position: absolute;
        left: 0;
        top: 100%;
        white-space: normal;
        background-color: #333;
        padding: 10px;
        border-radius: 5px;
        z-index: 1;
        max-width: 300px;
        color: #fff;
        box-shadow: 0px -5px 10px rgba(0, 0, 0, 0.3);
    }

    /* Responsive adjustments for light mode */
    body.light-mode .course-table {
        background-color: #e0e0e0;
        color: #000;
    }

    body.light-mode .course-table th {
        background-color: #d0d0d0;
    }

    body.light-mode .course-table td {
        background-color: #c0c0c0;
    }

    body.light-mode .course-content:hover::after {
        background-color: #f0f0f0;
        color: #000;
    }

    /* Button Section Styling */
    .button-section {
        margin-top: 20px;
        text-align: right;
        text-decoration: none;
    }

    .button-section .action-button {
        padding: 10px 20px;
        background-color: #1e1e1e;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 10px;
        transition: background-color 0.3s ease;
        text-decoration: none;
    }

    .button-section .action-button:hover {
        background-color: #333;
    }

    .button-section .delete-button {
        background-color: #d9534f;
        color: white;
    }

    .button-section .delete-button:hover {
        background-color: #c9302c;
    }

    body.light-mode .button-section .action-button {
        background-color: #c0c0c0;
        color: black;
    }

    body.light-mode .button-section .action-button:hover {
        background-color: #999;
    }

    body.light-mode .delete-button {
        background-color: #ff6666;
    }

    body.light-mode .delete-button:hover {
        background-color: #ff4d4d;
    }

    /* Form Section */
    .form-container {
            position: relative;
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding-bottom: 80px;
            transition: background-color 0.3s ease;
        }

        body.light-mode .form-container {
            background-color: #f0f0f0;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        label {
            flex: 1;
            margin-right: 10px;
            font-size: 18px;
            align-self: center;
        }

        input,
        select {
            flex: 2;
            padding: 10px;
            border: none;
            border-radius: 10px;
            background-color: #2a2a2a;
            color: white;
        }

        body.light-mode input,
        body.light-mode select {
            background-color: #e0e0e0;
            color: #000;
        }

        /* Dropdown Styling Consistency */
        select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-color: #2a2a2a;
            color: white;
        }

        body.light-mode select {
            background-color: #e0e0e0;
            color: #000;
        }

        .save-btn {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background-color: #1e1e1e;
            color: white;
            border: none;
            padding: 16px;
            border-radius: 50px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        body.light-mode .save-btn {
            background-color: #c0c0c0;
            color: black;
        }

        .save-btn:active {
            background-color: #333;
        }

        body.light-mode .save-btn:active {
            background-color: #999;
        }

        /* Checkbox group container */
        .checkbox-group {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        /* Style for checkbox label */
        .checkbox-container {
            display: flex;
            align-items: center;
            font-size: 16px;
            cursor: pointer;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            width: calc(50% - 10px);
            /* Adjusts the width of each checkbox to fit two per row */
            user-select: none;
        }

        /* Hide the default checkbox */
        .checkbox-container input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
            height: 0;
            width: 0;
        }

        /* Create a custom checkbox */
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 20px;
            width: 20px;
            background-color: #2a2a2a;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        /* Dark mode checkmark */
        body.light-mode .checkmark {
            background-color: #e0e0e0;
        }

        /* On hover, darken the checkmark */
        .checkbox-container:hover input~.checkmark {
            background-color: #3b3b3b;
        }

        body.light-mode .checkbox-container:hover input~.checkmark {
            background-color: #c0c0c0;
        }

        /* Show the checkmark when checked */
        .checkbox-container input:checked~.checkmark {
            background-color: #2F9DFF;
        }

        body.light-mode .checkbox-container input:checked~.checkmark {
            background-color: #4f8585;
        }

        /* Create the checkmark (tick) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        .checkbox-container input:checked~.checkmark:after {
            display: block;
        }

        /* Checkmark/tick styling */
        .checkbox-container .checkmark:after {
            left: 7px;
            top: 3px;
            width: 5px;
            height: 10px;
            border: solid white;
            border-width: 0 3px 3px 0;
            transform: rotate(45deg);
        }
</style>

<body>
    <div class="container">

        <div class="navigation gradient-sidebar">
            <ul>
                <li class="list">
                    <a href="../PHP/NewAdminDashboard.php">
                        <span class="icons"><ion-icon name="home-outline"></ion-icon></span>
                        <span class="text">Home</span>
                    </a>
                </li>
                <li class="list">
                    <a href="../PHP/NewTeacherAccess.php">
                        <span class="icons"><ion-icon name="person-outline"></ion-icon></span>
                        <span class="text">Teacher</span>
                    </a>
                </li>
                <li class="list ">
                    <a href="../PHP/NewStudentAccess.php">
                        <span class="icons"><ion-icon name="school-outline"></ion-icon></span>
                        <span class="text">Student</span>
                    </a>
                </li>
                <li class="list active">
                    <a href="../PHP/NewCourseAccess.php">
                        <span class="icons"><ion-icon name="book-outline"></ion-icon></span>
                        <span class="text">Courses</span>
                    </a>
                </li>
                <li class="list">
                    <a href="../PHP/NewNotices.php">
                        <span class="icons"><ion-icon name="information-circle-outline"></ion-icon></span>
                        <span class="text">Notices</span>
                    </a>
                </li>
                <li class="list">
                    <a href="../PHP/Logout.php">
                        <span class="icons"><ion-icon name="log-out-outline"></ion-icon></span>
                        <span class="text">Logout</span>
                    </a>
                </li>
                <div class="indicator gradient-bg"></div>
            </ul>
        </div>

        <!-- Main content area with two columns -->
        <div class="main-content">
            <!-- Column 2 -->
            <div class="column-2">
                <!-- Search Bar -->
                <div class="search-bar">
                    <h1>New Course</h1>
                    <!-- Icons (Reminders, Game, Profile) aligned to the right -->
                    <div class="icons">
                        <div class="icon gradient-bg">

                            <a href="../PHP/NewNotices.php"><span class="colored-icon"><ion-icon
                                        name="notifications-outline"
                                        style="width: 25px; height: 25px"></ion-icon></span></a>
                        </div>
                        <!-- <div class="icon gradient-bg">
                            <a href="../HTML/Game.html"><span class="colored-icon"><ion-icon name="game-controller-outline"
                                        style="width: 25px; height: 25px"></ion-icon></span></a>
                        </div> -->
                        <div class="icon gradient-bg">
                            <a href="../PHP/StudentProfile.php"><span class="colored-icon"><ion-icon name="person-outline"
                                        style="width: 25px; height: 25px"></ion-icon></span></a>
                        </div>
                        <!-- Dark Mode Toggle Button -->
                        <button class="toggle-button gradient-bg" id="toggle-mode">
                            <span class="colored-icon"><ion-icon name="sunny-outline"
                                    style="width: 25px; height: 25px"></ion-icon></span>
                        </button>
                    </div>
                </div>

                <div class="courses gradient-card">
                    <div class="course-card ">
                        <!-- Basic Info Card -->
                        <div class="course-basic" style=" display: flex; justify-content: center; align-items: center;">
                            <H1><em>Hover to Reveal Information</em></H1>
                        </div>
                        <!-- Marks Info Card (Initially hidden) -->
                        <div class="course-marks gradient-bg-hover">
                            <div class="table-container">
                                <!-- Form Section -->
                                <div class="form-container">
                                    <!-- Form to submit course data -->
                                    <form id="student-form" action="../php/NewCourse2.php" method="POST">
                                        <div class="form-row">
                                            <label for="CourseName">Course Name</label>
                                            <input type="text" id="CourseName" name="CourseName" placeholder="Course Name" required>
                                        </div>
                                        <div class="form-row">
                                            <label for="course_code">Course Code</label>
                                            <input type="text" id="course_code" name="course_code" placeholder="Course Code" required>
                                        </div>
                                        <div class="form-row">
                                            <label for="Description">Description</label>
                                            <input type="text" id="Description" name="Description" placeholder="Description" required>
                                        </div>
                                        <div class="form-row">
                                            <label for="Credits">Number of Credits</label>
                                            <!-- <input type="number" id="Credits" name="Credits" placeholder="Enter Credits" min="1" max="10" required> -->
                                            <select id="Credits" name="Credits" required>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                            </select>
                                        </div>
                                        <div class="form-row" style="margin-top: 20px; margin-bottom: 20px;">
                                            <label for="Department_ID">Department Id:</label>
                                            <select id="Department_ID" name="Department_ID" required>
                                                <option value="" disabled selected>Choose Department</option>
                                                <option value="1">Computer Engineering</option>
                                                <option value="2">Information Technology</option>
                                                <option value="3">Mechanical Engineering</option>
                                                <option value="4">Civil Engineering</option>
                                                <option value="5">Electronics and Computer Science</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="Current_Semester">Semester:</label>
                                            <select id="Current_Semester" name="Current_Semester" style="width: 70%;" required>
                                                <option value="">Select Semester</option>
                                                <option value="I">I</option>
                                                <option value="II">II</option>
                                                <option value="III">III</option>
                                                <option value="IV">IV</option>
                                                <option value="V">V</option>
                                                <option value="VI">VI</option>
                                                <option value="VII">VII</option>
                                                <option value="VIII">VIII</option>
                                            </select>
                                        </div>

                                        <div class="form-row" style="margin-top: 20px; margin-bottom: 20px;">
                                            <label for="Enrollment_Type_ID">Enrollment Type</label>
                                            <select id="Enrollment_Type_ID" name="Enrollment_Type_ID" required>
                                                <option value="" disabled selected>Choose Department</option>
                                                <option value="1">Major</option>
                                                <option value="2">Minor</option>
                                                <option value="3">Proffesional Elective</option>
                                                <option value="4">Open Elective</option>
                                                <option value="5">Core</option>
                                            </select>
                                        </div>

                                        <button type="submit" class="save-btn">Save</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<!-- navbar script -->
<script>
    const list = document.querySelectorAll('.list');
    let currentActiveItem = document.querySelector('.list.active');

    function activeLink() {
        list.forEach((item) => item.classList.remove('active'));
        this.classList.add('active');
        currentActiveItem = this;
    }

    function hoverLink() {
        list.forEach((item) => item.classList.remove('active'));
        this.classList.add('active');
    }

    function leaveLink() {
        list.forEach((item) => item.classList.remove('active'));
        if (currentActiveItem) {
            currentActiveItem.classList.add('active');
        }
    }

    list.forEach((item) => {
        item.addEventListener('click', activeLink);
        item.addEventListener('mouseenter', hoverLink);
        item.addEventListener('mouseleave', leaveLink);
    });

    // Dark mode toggle functionality
    const toggleButton = document.getElementById('toggle-mode');
    const toggleIcon = toggleButton.querySelector('ion-icon'); // Change from img to ion-icon

    // Check local storage for saved mode preference
    const savedMode = localStorage.getItem('mode');
    if (savedMode) {
        document.body.classList.toggle('light-mode', savedMode === 'light');
        toggleIcon.setAttribute('name', savedMode === 'light' ? 'sunny-outline' : 'moon-outline'); // Update Ionicon
    }

    toggleButton.addEventListener('click', function() {
        document.body.classList.toggle('light-mode');
        const newMode = document.body.classList.contains('light-mode') ? 'light' : 'dark';
        localStorage.setItem('mode', newMode);

        // Update the Ionicon icon based on the mode
        toggleIcon.setAttribute('name', newMode === 'light' ? 'sunny-outline' : 'moon-outline'); // Toggle between icons
    });
</script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</html>