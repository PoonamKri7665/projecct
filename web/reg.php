<?php
include 'login.php';

#if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $Student_name = $_POST['txtName'];
    $Father_name = $_POST['txtFatherName'];
    $Adress = $_POST['txtAddress'];
    $State = $_POST['txtState'];
    $City = $_POST['txtCity'];
    $Mobile_no = $_POST['txtMobileNo'];
    $Email = $_POST['txtEmail'];
    $Password = $_POST['txtPassword'];


   # $result = mysqli_query($conn,
	   $sql = "INSERT INTO students(Student_Name, Father_Name, Address,State, City, Mobile_no, Email_id, Password) VALUES ('$Student_name', '$Father_name', '$Adress', '$State', '$City',  '$Mobile_no', '$Email','$Password')";


if ($conn->query($sql) === TRUE) {
	echo ' Record added successfully ';
         header('Location: index.html');

} else {
    echo 'Error: ' . $sql . '<br>' . $conn->error;
}

$conn->close();



   # if ($result){

#    echo "Registration successful for $Student_name.";
 #   } else {
  #      echo "Error: " . mysqli_error($conn);
   # }
#}
?>

