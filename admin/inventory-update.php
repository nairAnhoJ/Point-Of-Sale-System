<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $itemCode = $_POST['addStockItemCode'];
    $addStock = $_POST['stockValue'];

    echo $itemCode;
    echo $addStock;
    
    $updateStock = "UPDATE `item_no_barcode` SET `itemnb_stock` = (`itemnb_stock` + $addStock) WHERE `item_code` = '$itemCode'";
    mysqli_query($con, $updateStock);
    $updateStock = "UPDATE `item_with_barcode` SET `item_stock` = (`item_stock` + $addStock) WHERE `item_code` = '$itemCode'";
    mysqli_query($con, $updateStock);

    $_SESSION['UpdateStockSuccess'] = true;
    header("location: inventory.php");
?>