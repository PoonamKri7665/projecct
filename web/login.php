<?php
$servername = "172.18.1.3";
$username = "jaya";
$password = "123";
$database = "student";


// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
#echo "Connected successfully";
?>
