<?php
$servername = "localhost";
$username = "root";
$password = "";
$db = "wplab7";

// Create connection
$conn = new mysqli($servername, $username, $password,$db);

$groupnr = $_GET["groupnr"];
$nr = $_GET["nr"];
$nr2 = $nr + 4;

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM students WHERE groupnr = " . $groupnr . " AND sid < " . $nr2 . " AND sid >= " . $nr;

// echo $sql;

$result = $conn->query($sql);

if ($result->num_rows > 0) {
	echo '<table style="width:50%;border-collapse: collapse;"><tr style="border: 0px solid black;"><th>ID</th><th>Firstname</th><th>Lastname</th></tr>';
	while($row = $result->fetch_assoc()) {
		echo '<tr style="border: 0px solid black; padding: 30px;"><td style="border: 0px solid black; text-align: center; padding: 15px;">' . $row["sid"] . '</td><td style="border: 0px solid black;text-align: center;"> ' . $row["firstname"] . '</td><td style="border: 0px solid black; text-align: center; padding: 15px;">' . $row["lastname"] . "</td></tr>";
	}
	echo "</table>";
}

?>