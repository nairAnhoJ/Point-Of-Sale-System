<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $nQty = $_SESSION['lastQty'] - 1;
    $itemCode = $_SESSION['lastCode'];

    $updateTempItem = "UPDATE `temp_item` SET `temp_quantity`='$nQty' WHERE `item_code` = $itemCode";
    mysqli_query($con, $updateTempItem);
    header("location: home.php");


?>