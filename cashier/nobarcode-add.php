<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    if(!isset($_SESSION['conected'])){
        header('location: ../login.php');
    }

    $itemID = $_GET['itemId'];
    $itemName = $_GET['itemName'];
    $itemPrice = $_GET['itemPrice'];
    $curQty = $_GET['curQty'];

if((int)$curQty <= 0){
			$_SESSION['errorStock'] = true;
			header('location: home.php');
		}else{

    $checkTemp = "SELECT * FROM `temp_item` WHERE `item_code` = '$itemID'";
    $resultTemp = mysqli_query($con, $checkTemp);
    if(mysqli_num_rows($resultTemp) > 0){

        while($rowTemp = mysqli_fetch_assoc($resultTemp)){
		

			if($rowTemp['temp_quantity'] != $rowTemp['current_stock']){
            		$newQty = $rowTemp['temp_quantity'] + 1;
			}else{
				$newQty = $rowTemp['temp_quantity'];
			}


            	$newTotal = $newQty * $rowTemp['temp_price'];
            	$tempPrice = $rowTemp['temp_price'];

            	$deleteTemp = "DELETE FROM `temp_item` WHERE `item_code` = '$itemID'";
            	mysqli_query($con, $deleteTemp);

            	$updateTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`, `temp_price`, `temp_name`, `temp_total`, `current_stock`) VALUES (null,'$itemID','$newQty','$tempPrice','$itemName','$newTotal','$curQty')";
            	mysqli_query($con, $updateTemp);
	
        }

    }else{
        $insertTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`, `temp_price`, `temp_name`, `temp_total`, `current_stock`) VALUES (null,'$itemID','1','$itemPrice','$itemName','$itemPrice','$curQty')";
        mysqli_query($con, $insertTemp);
    }

}

    header('location: home.php');
?>