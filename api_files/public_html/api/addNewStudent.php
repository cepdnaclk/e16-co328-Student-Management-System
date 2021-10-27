<?php

require "init.php";

$Email = $_GET['email'];
$Name = $_GET['name'];
$Pass = $_GET['pass'];

$sql = "INSERT INTO `student_data` (`email`, `name`, `password`) VALUES  ('$Email', '$Name', '$Pass');";

// echo $sql;

if (mysqli_query($con, $sql)) {
    echo json_encode(array("response"=>"Ok"));
	
} else {
	echo json_encode(array("response"=>"Error"));
}	


mysqli_close($con);

?>