<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    if(isset($_GET['mqty'])){
        $manualQty = $_GET['mqty'];
        $itemCode = $_SESSION['lastCode'];
        echo $manualQty;
        echo $itemCode;

        $manualUpdateTempItem = "UPDATE `temp_item` SET `temp_quantity`='$manualQty' WHERE `item_code` = $itemCode";
        mysqli_query($con, $manualUpdateTempItem);
        header("location: home.php");
    }


?>