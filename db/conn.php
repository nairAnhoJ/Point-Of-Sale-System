<?php

    $dbhost = "localhost";
    $dbuser = "johnarian";
    $dbpass = "johnarian";
    $dbname = "pos";

    if(!$con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname)){
        die("Failed to Connect to Database!");
    }

?>