<?php

require "init.php";

$email = $_GET["email"];

$sql = "SELECT * FROM `student_data` WHERE email = '$email'";

$result = mysqli_query($con, $sql);

if (!mysqli_num_rows($result)>0){
	$status = "failed";
	echo json_encode(array("response"=>$status));
}
else {
	$status = 'ok';
	$row =mysqli_fetch_assoc($result);
	$name = $row['name'];
	$pass = $row['password'];
	echo json_encode(array("response"=>$status,"name"=>$name,"pass"=>$pass));
}

mysqli_close($con);
?>