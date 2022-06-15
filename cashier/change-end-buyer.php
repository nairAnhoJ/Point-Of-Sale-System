<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $endBuyer = $_GET['endBuyer'];
    // echo $endBuyer;
    $_SESSION['endBuyer'] = $endBuyer;


    // $deleteTempItem = "TRUNCATE `temp_item`";
    // mysqli_query($con, $deleteTempItem);
    // $_SESSION['changeSuccess'] = true;
    header("location: home.php");




    


?>