<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $itemID = $_GET['itemId'];
    $itemName = $_GET['itemName'];
    $itemPrice = $_GET['itemPrice'];

    echo $itemID;
    echo $itemName;
    echo $itemPrice;

    $checkTemp = "SELECT * FROM `temp_item` WHERE `item_code` = '$itemID'";
    $resultTemp = mysqli_query($con, $checkTemp);
    if(mysqli_num_rows($resultTemp) > 0){
        while($rowTemp = mysqli_fetch_assoc($resultTemp)){
            $newQty = $rowTemp['temp_quantity'] + 1;
            $newTotal = $newQty * $rowTemp['temp_price'];
            $tempPrice = $rowTemp['temp_price'];

            $deleteTemp = "DELETE FROM `temp_item` WHERE `item_code` = '$itemID'";
            mysqli_query($con, $deleteTemp);
            $updateTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`, `temp_price`, `temp_name`, `temp_total`) VALUES (null,'$itemID','$newQty','$tempPrice','$itemName','$newTotal')";
            mysqli_query($con, $updateTemp);
        }
    }else{
        $insertTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`, `temp_price`, `temp_name`, `temp_total`) VALUES (null,'$itemID','1','$itemPrice','$itemName','$itemPrice')";
        mysqli_query($con, $insertTemp);
    }

    header('location: home.php');






    // $checkItemID = "SELECT * FROM `temp_item` WHERE `item_code` = $itemID";
    // $resultItemID = mysqli_query($con, $checkItemID);
    // if(mysqli_num_rows($resultItemID) > 0){

    //     while($ItemID = mysqli_fetch_assoc($resultItemID)){
    //         $newQty = $ItemID['temp_quantity'] + 1;
    //         $deleteTemp = "DELETE FROM `temp_item` WHERE `item_code` = '$itemID'";
    //         mysqli_query($con, $deleteTemp);

    //         $updateTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`) VALUES (null,'$itemID','$newQty')";
    //         mysqli_query($con, $updateTemp);
    //         // header('location: home.php');
    //     }

    // }else{
    //     $insertNoBC = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`) VALUES (null,'$itemID','1')";
    //     mysqli_query($con, $insertNoBC);
    //     // header("location: home.php");
    // }
?>