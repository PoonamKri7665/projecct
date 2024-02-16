<?php
session_start();
include 'login.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['uname'];
    $password = $_POST['psw'];

    $sql = "SELECT * FROM students WHERE Student_Name = '$username' AND Password = '$password'";
    $result = $conn->query($sql);
    echo $sql;
    if ($result->num_rows > 0) {
        // Login successful
        $_SESSION['username'] = $username;
        header('Location: welcome.php');
    } else {
        // Login failed
        echo 'Invalid username or password';
    }
}

$conn->close();
?>

