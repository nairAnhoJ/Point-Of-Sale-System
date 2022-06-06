<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $userId = $_POST['userDelId'];
    echo $userId;

    $deleteUser = "DELETE FROM `users` WHERE `user_id`='$userId'";
    mysqli_query($con, $deleteUser);
    
    $_SESSION['successDelete'] = true;
    header("location: users.php");
?>