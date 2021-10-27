<?php
    require "init.php";
    $Email = $_GET["email"];
    $sql = "SELECT * FROM `payment_details` WHERE student_email = '$Email'";
    
    //echo $sql;
   
    $result = mysqli_query($con, $sql);
    $countr = mysqli_num_rows($result);
    $response["details"] = array();

    if ($result) {
        while($row = mysqli_fetch_array($result)) {
            $user = array();
        	$user["date"] = $row['date'];
            $user["month"] = $row['month'];
            $user["amount"] = $row['amount'];
            $user["bill_no"] = $row['bill_no'];
            array_push($response["details"], $user);
        }
    }
    else {
        echo mysql_error();
    }
    
    echo json_encode($response);

    mysqli_close($con);


?>