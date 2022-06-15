<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $itemCode = $_SESSION['lastCode'];

    $removeLastItem = "DELETE FROM `temp_item` WHERE `item_code` = $itemCode";
    mysqli_query($con, $removeLastItem);
    $_SESSION['removeLastSuccess'] = true;
    header("location: home.php");


?>