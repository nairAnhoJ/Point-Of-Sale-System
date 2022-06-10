<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../bootstrap-5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="../styles/styles.css?v=<?php echo time(); ?>">
    <link rel="icon" href="../images/logo/<?php echo $_SESSION['logo']; ?>">
    <title>Report</title>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="../js/sweetalert.min.js"></script>
    <script src="../js/chart.min.js"></script>
</head>
<body onload="navF()">

    <?php
        require_once('./nav.php');
    
        if(!isset($_SESSION['importSuccess'])){
        }else{
            if ($_SESSION['importSuccess'] == true){
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "Import Has Been Successfully Finished!",
                        }).then((value) => {
                            $('#itemSearch').focus();
                        });
                    </script>
                <?php
                $_SESSION['importSuccess'] = false;
            }
        }
    ?>

    <div id="admin-report-con">
        <div class="inner-con">
            <div class="top-con">
                <div class="title-con">
                    <h1 class="page-title">REPORT</h1>
                </div>
            </div>
            <div class="bottom-con">
                <div class="left-con">
                    <div class="stock-report">
                        <div class="report-title-con">
                            <h2 class="report-title">LOW STOCK REPORT</h2>
                        </div>
                        <div class="button-con">
                            <a href="./stock-report.php" class="btn btn-primary" target="_blank">GENERATE REPORT</a>
                        </div>
                    </div>
                </div>
                <div class="right-con">
                    <div class="sales-report">
                        <div class="report-title-con">
                            <h2 class="report-title">SALES REPORT</h2>
                        </div>
                        <div class="button-con">
                            <a href="./stock-report.php" class="btn btn-primary" target="_blank">GENERATE REPORT</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function navF(){
            $('.report').addClass('active');
            $('.report').addClass('disabled');
        }

        $(document).ready(function(){
        
        });
            
    </script>
    
</body>
</html>