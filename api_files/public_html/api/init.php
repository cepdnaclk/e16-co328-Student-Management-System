<?php

$host = "localhost";
$user_name = "id17703395_co328_user";
$user_password = "}P#~9+0*vSfvQADt";
$db_name = "id17703395_data";

$con = mysqli_connect($host, $user_name, $user_password, $db_name);

if ($con) {
	//echo "Connction Success...";
} else {
	echo "Connection Faild...";
}


?>