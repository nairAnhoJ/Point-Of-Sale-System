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
    $ItemRemark = $_POST['aeItemRemark'];

    $dateUpdated = date("Y-m-d");
    $updatedBy = $_SESSION['cashier_name'];

    $barcode = $_POST['barcode'];
    echo $barcode;
    if($barcode == 'with-barcode'){
        $itemCode = $_POST['aeItemCode'];
        $ItemId = $_POST['aeItemIdwb'];

        $editItem = "UPDATE `item_with_barcode` SET `item_code`='$itemCode',`item_name`='$ItemDesc',`item_retail_price`='$ItemRP',`item_stock`='$ItemStock',`item_category`='$ItemCat',`item_supplier`='$ItemSup',`date_updated`='$dateUpdated',`updated_by`='$updatedBy',`item_remarks`='$ItemRemark',`item_wholesale_price`='$ItemWP' WHERE `item_id` = $ItemId";
        mysqli_query($con, $editItem);
    }else{
        $ItemId = $_POST['aeItemIdwob'];

        if($_POST['aeItemImage'] == ""){
            $editItem = "UPDATE `item_no_barcode` SET `itemnb_name`='$ItemDesc',`itemnb_retail_price`='$ItemRP',`itemnb_stock`='$ItemStock',`itemnb_category`='$ItemCat',`itemnb_suppplier`='$ItemSup',`date_updated`='$dateUpdated',`updated_by`='$updatedBy',`itemnb_remarks`='$ItemRemark',`itemnb_wholesale_price`='$ItemWP' WHERE `item_code` = '$ItemId'";
            mysqli_query($con, $editItem);
        }else{
            $ItemImage = "../images/items/".$_POST['aeItemImage'];
            $editItem = "UPDATE `item_no_barcode` SET `itemnb_name`='$ItemDesc',`itemnb_retail_price`='$ItemRP',`itemnb_stock`='$ItemStock',`itemnb_category`='$ItemCat',`itemnb_suppplier`='$ItemSup',`date_updated`='$dateUpdated',`updated_by`='$updatedBy',`itemnb_remarks`='$ItemRemark',`itemnb_img`='$ItemImage',`itemnb_wholesale_price`='$ItemWP' WHERE `item_code` = '$ItemId'";
            mysqli_query($con, $editItem);
        }
        echo $_POST['aeItemImage'];
    }

    $_SESSION['editItemSuccess'] = true;
    header("location: inventory.php");
?>