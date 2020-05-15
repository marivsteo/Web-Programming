<?php
    session_start();
$servername = "localhost";
$username = "root";
$password = "";
$db = "wplab7";

// Create connection
$conn = new mysqli($servername, $username, $password,$db);

$sid = $_SESSION["sid"];
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM grades WHERE sid = " . $sid;

// echo $sql;

$result = $conn->query($sql);

if ($result->num_rows > 0) {
	echo '<table style="width:50%;border-collapse: collapse; font-size: 20px;"><tr style="border: 0px solid black; color: #DC143C"><th>COURSE</th><th>GRADE</th></tr>';
	while($row = $result->fetch_assoc()) {
		echo '<tr style="border: 0px solid black; padding: 30px;"><td style="border: 0px solid black; text-align: center; padding: 15px;">' . $row["course"] . '</td><td style="border: 0px solid black;text-align: center;"> ' . $row["grade"] . "</td></tr>";
	}
	echo "</table>";
}

?>