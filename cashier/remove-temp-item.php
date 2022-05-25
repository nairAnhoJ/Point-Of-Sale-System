<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $tempItemCode = $_GET['tempCode'];

    $removeLastItem = "DELETE FROM `temp_item` WHERE `item_code` = $tempItemCode";
    mysqli_query($con, $removeLastItem);
    $_SESSION['removeSuccess'] = true;
    header("location: home.php");


?>