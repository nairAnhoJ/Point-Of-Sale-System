<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $newName = $_POST['inputName'];
    echo $newName;

    $updateName = "UPDATE `admin_settings` SET `branch_name`='$newName' WHERE set_id='1'";
    mysqli_query($con, $updateName);

    $_SESSION['successName'] = true;
    $_SESSION['branch_name'] = $newName;
    header('location: settings.php');
?>