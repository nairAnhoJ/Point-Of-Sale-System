<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $itemCode = $_GET['itemCode'];
    $newPrice = $_GET['newPrice'];

    $updatePrice = "UPDATE `item_with_barcode` SET `item_price` = '$newPrice' WHERE `item_code` = $itemCode";
    mysqli_query($con, $updatePrice);


    $updatePrice = "UPDATE `item_no_barcode` SET `itemnb_price` = '$newPrice' WHERE `item_code` = $itemCode";
    mysqli_query($con, $updatePrice);

    $_SESSION['updateSuccessful'] = true;
    header("location: inventory.php");

?>