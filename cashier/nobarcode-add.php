<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $itemID = $_GET['itemId'];


    $checkItemID = "SELECT * FROM `temp_item` WHERE `item_code` = $itemID";
    $resultItemID = mysqli_query($con, $checkItemID);
    if(mysqli_num_rows($resultItemID) > 0){

        while($ItemID = mysqli_fetch_assoc($resultItemID)){
            $newQty = $ItemID['temp_quantity'] + 1;
            $deleteTemp = "DELETE FROM `temp_item` WHERE `item_code` = '$itemID'";
            mysqli_query($con, $deleteTemp);
            $updateTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`) VALUES (null,'$itemID','$newQty')";
            mysqli_query($con, $updateTemp);
            header('location: home.php');
        }

    }else{
        $insertNoBC = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`) VALUES (null,'$itemID','1')";
        mysqli_query($con, $insertNoBC);
        header("location: home.php");
    }
?>