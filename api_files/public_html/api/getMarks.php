<?php
    require "init.php";
    $Email = $_GET["email"];
    $sql = "SELECT * FROM (`marks`, `paper_details`) WHERE marks.paper_no = paper_details.paper_no AND student_email = '$Email'";
    
    //echo $sql;
   
    $result = mysqli_query($con, $sql);
    $countr = mysqli_num_rows($result);
    $response["details"] = array();

    if ($result) {
        while($row = mysqli_fetch_array($result)) {
            $Marks = $row['marks'];
            $PaperNo = $row['paper_no'];
            $Date = $row['date'];
            $Type = $row['type'];
            
            $user = array();
        	$user["marks"] = $Marks;
            $user["paper_no"] = $PaperNo;
            $user["date"] = $Date;
            $user["type"] = $Type;
            array_push($response["details"], $user);
        }
    }
    else {
        echo mysql_error();
    }
    
    echo json_encode($response);

    mysqli_close($con);


?>