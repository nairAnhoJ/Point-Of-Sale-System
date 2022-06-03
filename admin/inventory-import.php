<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $importFile = $_FILES['importFile']['tmp_name'];
    $updatedBy = $_SESSION['cashier_name'];
    
    $file = fopen($importFile, "r");


    while(($column = fgetcsv($file, 10000, ",")) !== FALSE){

        if(is_numeric($column[7])){
            echo $column[7];
            // echo "With Barcode to<br>";

            $importwb = "INSERT INTO `item_with_barcode`(`item_id`, `item_code`, `item_name`, `item_retail_price`, `item_stock`, `item_category`, `item_supplier`, `date_updated`, `updated_by`, `item_remarks`, `item_wholesale_price`) VALUES (null,'".$column[0]."','".$column[1]."','".$column[2]."','".$column[3]."','".$column[4]."','".$column[5]."','".date('Y-m-d')."','$updatedBy','Imported','".$column[6]."')";
            mysqli_query($con, $importwb);
        }else{
            echo $column[7];
            // echo "With out Barcode to<br>";

            $importwob = "INSERT INTO `item_no_barcode`(`item_code`, `itemnb_name`, `itemnb_retail_price`, `itemnb_stock`, `itemnb_category`, `itemnb_suppplier`, `date_updated`, `updated_by`, `itemnb_remarks`, `itemnb_img`, `itemnb_wholesale_price`) VALUES (null,'".$column[1]."','".$column[2]."','".$column[3]."','".$column[4]."','".$column[5]."','".date('Y-m-d')."','$updatedBy','Imported','".$column[7]."','".$column[6]."')";
            mysqli_query($con, $importwob);
        }
    }

    $_SESSION['importSuccess'] = true;
    header("location: inventory.php");

?>