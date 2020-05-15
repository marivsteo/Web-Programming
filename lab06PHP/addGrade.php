<?php
    session_start();
$servername = "localhost";
$username = "root";
$password = "";
$db = "wplab7";

// Create connection
$conn = new mysqli($servername, $username, $password,$db);

$sid = $_GET["sid"];
$course = $_GET["course"];
$grade = $_GET["grade"];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO grades(course,grade,sid) VALUES (?,?,?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sii",$course,$grade,$sid);
$stmt->execute();

echo $sql;

$sql2 = "SELECT * FROM grades WHERE course = " . $course . " AND grade = " . $grade . " AND sid = " . $sid;

$result = $conn->query($sql2);

if ($result->num_rows > 0) {
	echo '<table style="width:50%;border-collapse: collapse;"><tr style="border: 0px solid black;"><th>SID</th><th>Course</th><th>Grade</th></tr>';
	while($row = $result->fetch_assoc()) {
		echo '<tr style="border: 0px solid black; padding: 30px;"><td style="border: 0px solid black; text-align: center; padding: 15px;">' . $row["sid"] . '</td><td style="border: 0px solid black;text-align: center;"> ' . $row["course"] . '</td><td style="border: 0px solid black; text-align: center; padding: 15px;">' . $row["grade"] . "</td></tr>";
	}
	echo "</table>";
}
header("Location: http://localhost/webprog/lab6/professor.html");

?>