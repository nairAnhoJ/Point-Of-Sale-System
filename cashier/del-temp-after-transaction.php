<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $invNo = $_GET['invNo'];

    $queryTempItems = "SELECT * FROM `temp_item` ORDER BY temp_id DESC";
    $resultTempItems = mysqli_query($con, $queryTempItems);
    if(mysqli_num_rows($resultTempItems) > 0){
        while($rowTempItems = mysqli_fetch_assoc($resultTempItems)){
            $dateTimeNow = date("Y-m-d H:i:s");
            $cashierName = $_SESSION['cashier_name'];
            $itemCode = $rowTempItems['item_code'];
            $itemName = $rowTempItems['temp_name'];
            $itemQty = $rowTempItems['temp_quantity'];
            $gTotal = $_SESSION['gTotal'];
            $loc = $_SESSION['branch_loc'];

            $updateStock = "UPDATE `item_no_barcode` SET `itemnb_stock` = (`itemnb_stock` - $itemQty) WHERE `item_code` = '$itemCode'";
            mysqli_query($con, $updateStock);

            $updateStock = "UPDATE `item_with_barcode` SET `item_stock` = (`item_stock` - $itemQty) WHERE `item_code` = '$itemCode'";
            mysqli_query($con, $updateStock);

            $insertTranLog = "INSERT INTO `transaction_logs`(`log_id`, `tran_num`, `tran_item`, `tran_qty`, `tran_total`, `tran_date_time`, `tran_cashier`, `tran_location`) VALUES (null,'$invNo','$itemName','$itemQty','$gTotal','$dateTimeNow','$cashierName','$loc')";
            mysqli_query($con, $insertTranLog);
        }
    }

    $deleteTempItem = "TRUNCATE `temp_item`";
    mysqli_query($con, $deleteTempItem);
    $_SESSION['TranComSuccess'] = true;
    header("location: home.php");

?>