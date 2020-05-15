<?php
    session_start();
$servername = "localhost";
$username = "root";
$password = "";
$db = "wplab7";

// Create connection
$conn = new mysqli($servername, $username, $password,$db);

$gid = $_GET["gid"];
$ng = $_GET["ng"];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE grades SET grade = ? WHERE gid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii",$ng,$gid);
$stmt->execute();

echo $sql;

$sql2 = "SELECT * FROM grades WHERE gid = " . $gid;

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