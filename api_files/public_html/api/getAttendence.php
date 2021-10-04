<?php
    require "init.php";
    $Email = $_GET["email"];
    $sql = "SELECT * FROM `class_dates`;";
    
    $sql2 = "SELECT * FROM `student_attendence` WHERE student_email = '$Email'";
    
    //echo $sql;
   
    $result = mysqli_query($con, $sql);
    $countr = mysqli_num_rows($result);
    $response["class_dates"] = array();
    
    $result2 = mysqli_query($con, $sql2);
    $countr2 = mysqli_num_rows($result2);
    $response["attendence"] = array();

    if ($result) {
        while($row = mysqli_fetch_array($result)) {
            $user = array();
        	$user["date"] = $row['date'];
            $user["from"] = $row['from_time'];
            $user["to"] = $row['to_time'];
            $user["type"] = $row['type'];
            $user["id"] = $row['id'];
            array_push($response["class_dates"], $user);
        }
        
        if ($result2) {
            while($row = mysqli_fetch_array($result2)) {
                $user = array();
            	$user["id"] = $row['class_date_id'];
                array_push($response["attendence"], $user);
            }
        }
        else {
            echo mysql_error();
        }
    }
    else {
        echo mysql_error();
    }
    
    echo json_encode($response);

    mysqli_close($con);


?>