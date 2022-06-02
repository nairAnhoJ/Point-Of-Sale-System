<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $ItemDesc = $_POST['aeItemDesc'];
    $ItemRP = $_POST['aeItemRP'];
    $ItemWP = $_POST['aeItemWP'];
    $ItemStock = $_POST['aeItemStock'];
    $ItemCat = $_POST['aeItemCat'];
    $ItemSup = $_POST['aeItemSup'];

    $dateUpdated = date("Y-m-d");
    $updatedBy = $_SESSION['cashier_name'];

    $barcode = $_POST['barcode'];
    if($barcode == 'with-barcode'){
        $itemCode = $_POST['aeItemCode'];

        $addItem = "INSERT INTO `item_with_barcode`(`item_id`, `item_code`, `item_name`, `item_retail_price`, `item_stock`, `item_category`, `item_supplier`, `date_updated`, `updated_by`, `item_remarks`, `item_wholesale_price`) VALUES (null,'$itemCode','$ItemDesc','$ItemRP','$ItemStock','$ItemCat','$ItemSup','$dateUpdated','$updatedBy','Added','$ItemWP')";
        mysqli_query($con, $addItem);
    }else{
        $ItemImage = "../images/items/".$_POST['aeItemImage'];
        $addItem = "INSERT INTO `item_no_barcode`(`item_code`, `itemnb_name`, `itemnb_retail_price`, `itemnb_stock`, `itemnb_category`, `itemnb_suppplier`, `date_updated`, `updated_by`, `itemnb_remarks`, `itemnb_img`, `itemnb_wholesale_price`) VALUES (null,'$ItemDesc','$ItemRP','$ItemStock','$ItemCat','$ItemSup','$dateUpdated','$updatedBy','Added','$ItemImage','$ItemWP')";
        mysqli_query($con, $addItem);
    }

    $_SESSION['addItemSuccess'] = true;
    header("location: inventory.php");
?>