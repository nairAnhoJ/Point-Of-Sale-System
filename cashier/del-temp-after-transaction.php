<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $deleteTempItem = "TRUNCATE `temp_item`";
    mysqli_query($con, $deleteTempItem);
    $_SESSION['TranComSuccess'] = true;
    header("location: home.php");


?>