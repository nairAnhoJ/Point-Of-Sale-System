<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $itemCode = $_SESSION['lastCode'];

    $checkTemp = "SELECT * FROM `temp_item` WHERE `item_code` = '$itemCode'";
    $resultTemp = mysqli_query($con, $checkTemp);
    if(mysqli_num_rows($resultTemp) > 0){
        while($rowTemp = mysqli_fetch_assoc($resultTemp)){
            if($rowTemp['temp_quantity'] == 1){
                $newQty = 1;
            }else{
                $newQty = $rowTemp['temp_quantity'] - 1;
            }
            $newTotal = $newQty * $rowTemp['temp_price'];

            $updateTemp = "UPDATE `temp_item` SET `temp_quantity`='$newQty',`temp_total`='$newTotal' WHERE `item_code` = $itemCode";
            mysqli_query($con, $updateTemp);
        }
    }

    header("location: home.php");


?>