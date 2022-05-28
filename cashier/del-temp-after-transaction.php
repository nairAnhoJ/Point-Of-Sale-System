<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $invNo = $_GET['invNo'];

    $queryTempItems = "SELECT tmp.temp_id, itm.item_code, itm.item_name, itm.item_price, itm.item_stock, tmp.temp_quantity FROM item_with_barcode AS itm INNER JOIN temp_item AS tmp ON itm.item_code = tmp.item_code UNION SELECT tmp.temp_id, inb.item_code, inb.itemnb_name, inb.itemnb_price, inb.itemnb_stock, tmp.temp_quantity FROM item_no_barcode AS inb INNER JOIN temp_item AS tmp ON inb.item_code = tmp.item_code ORDER BY temp_id DESC";
    $resultTempItems = mysqli_query($con, $queryTempItems);
    if(mysqli_num_rows($resultTempItems) > 0){
        while($rowTempItems = mysqli_fetch_assoc($resultTempItems)){
            $itemCode = $rowTempItems['item_code'];
            $itemName = $rowTempItems['item_name'];
            $itemQty = $rowTempItems['temp_quantity'];
            $gTotal = number_format($_SESSION['subTotal'],2);
            $dateTimeNow = date("Y-m-d H:i:s");
            $cashierName = $_SESSION['cashier_name'];

            $updateStock = "UPDATE `item_no_barcode` SET `itemnb_stock` = (`itemnb_stock` - $itemQty) WHERE `item_code` = '$itemCode'";
            mysqli_query($con, $updateStock);

            $updateStock = "UPDATE `item_with_barcode` SET `item_stock` = (`item_stock` - $itemQty) WHERE `item_code` = '$itemCode'";
            mysqli_query($con, $updateStock);

            $insertTranLog = "INSERT INTO `transaction_logs`(`log_id`, `tran_num`, `tran_item`, `tran_qty`, `tran_total`, `tran_date_time`, `tran_cashier`) VALUES (null,'$invNo','$itemName','$itemQty','$gTotal','$dateTimeNow','$cashierName')";
            mysqli_query($con, $insertTranLog);
        }
    }

    $deleteTempItem = "TRUNCATE `temp_item`";
    mysqli_query($con, $deleteTempItem);
    $_SESSION['TranComSuccess'] = true;
    header("location: home.php");

?>