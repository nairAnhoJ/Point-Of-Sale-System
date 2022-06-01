<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $Y = date('Y');
    $m = date('m');
    $d = date('d');

    $todaySales = 0;
    $yesSales = 0;
    $weekSales = 0;
    $mSales = 0;
    $dailySales = 0;
    $arrayDaily = array();

    $prevInvNo = 0;
    
    $numDays=cal_days_in_month(CAL_GREGORIAN,date('m'),date('Y'));

    $ws = date("Y-m-d H:i:s", strtotime("sunday -1 week"));
    $we = date("Y-m-d H:i:s", strtotime("sunday 0 week")-1);

    $querySales = "SELECT * FROM `transaction_logs` WHERE  `tran_date_time` BETWEEN '$ws' AND '$we'";
    $resultSales = mysqli_query($con, $querySales);
    if(mysqli_num_rows($resultSales) > 0){
        while($rowSales = mysqli_fetch_assoc($resultSales)){
            if($prevInvNo != $rowSales['tran_num']){
                $prevInvNo = $rowSales['tran_num'];
                $weekSales = $weekSales + $rowSales['tran_total'];
            }
        }
    }

    $ys = date("Y-m-d H:i:s", strtotime("yesterday"));
    $ye = date("Y-m-d H:i:s", strtotime("today")-1);

    $querySales = "SELECT * FROM `transaction_logs` WHERE  `tran_date_time` BETWEEN '$ys' AND '$ye'";
    $resultSales = mysqli_query($con, $querySales);
    if(mysqli_num_rows($resultSales) > 0){
        while($rowSales = mysqli_fetch_assoc($resultSales)){
            if($prevInvNo != $rowSales['tran_num']){
                $prevInvNo = $rowSales['tran_num'];
                $yesSales = $yesSales + $rowSales['tran_total'];
            }
        }
    }

    for($i = 1; $i<=$numDays; $i++){
        $fromDate = $Y.'-'.$m.'-'.$i.' 00:00:00';
        $toDate = $Y.'-'.$m.'-'.$i.' 23:00:00';
        $dailySales = 0;
        $querySales = "SELECT * FROM `transaction_logs` WHERE  `tran_date_time` BETWEEN '$fromDate' AND '$toDate'";
        $resultSales = mysqli_query($con, $querySales);
        if(mysqli_num_rows($resultSales) > 0){
            while($rowSales = mysqli_fetch_assoc($resultSales)){
                if($prevInvNo != $rowSales['tran_num']){
                    $prevInvNo = $rowSales['tran_num'];
                    $mSales = $mSales + $rowSales['tran_total'];
                    $dailySales = $dailySales + $rowSales['tran_total'];

                    $tranTime = strtotime($rowSales['tran_date_time']);
                    
                    if($tranTime >= strtotime("today") && $tranTime <= strtotime("tomorrow")-1){
                        $todaySales = $todaySales + $rowSales['tran_total'];
                    }
                }
            }
        }else{
            
        }
        array_push($arrayDaily, $dailySales);
    }
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
    <title>Dashboard</title>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="../js/sweetalert.min.js"></script>
    <script src="../js/chart.min.js"></script>
</head>
<body onload="navF()">

    <?php require_once('./nav.php'); ?>

    <div id="admin-dashboard-con">
        <div class="title-con">
            <span>Dashboard</span>
        </div>
        <div class="overview-con">
            <div class="sales-con">
                <div class="each-con todaySales">
                    <h1>Today's Sales</h1>
                    <p><span>₱ </span><?php echo number_format($todaySales,2); ?></p>
                </div>
                <div class="each-con yesterdaySales">
                    <h1>Yesterday's Sales</h1>
                    <p><span>₱ </span><?php echo number_format($yesSales,2); ?></p>
                </div>
                <div class="each-con weeklySales">
                    <h1>Weekly Sales</h1>
                    <p><span>₱ </span><?php echo number_format($weekSales,2); ?></p>
                </div>
                <div class="each-con monthlySales">
                    <h1>Monthly Sales</h1>
                    <p><span>₱ </span><?php echo number_format($mSales,2); ?></p>
                </div>
            </div>
        </div>
        <div class="chart-con">
            <canvas id="wholeMonth"></canvas>
        </div>
    </div>

    <!--
        Monthly Sales
        Weekly Sales
        Yesterday's Sales
        Today's Sales
    -->

    <script>

        function navF(){
            $('.dashboard').addClass('active');
            $('.dashboard').addClass('disabled');
        }

        var d = new Date();
        var y = d.getFullYear();
        var m = d.getMonth()+1;
        var numDay = new Date(y, m, 0).getDate();

        var dateArray = [];
        var sampleData = [];

        for(var i=1; i<=numDay; i++){
            dateArray.push(i);
            sampleData.push(i);
        }

        let wChart = document.getElementById('wholeMonth').getContext('2d');
        let weekChart = new Chart(wChart, {
            type:'line',
            data:{
                labels: dateArray,
                datasets:[{
                    label:'Sales',
                    data: <?php echo json_encode($arrayDaily); ?>,
                    borderColor: '#3bafda',
                    borderWidth: 4,
                    fill: false,
                    tension: 0.4
                }]
            },

            options: {
                responsive: true,
                plugins: { 
                    title: {
                        display: true,
                        text: 'Daily Sales',
                    },
                    legend:{
                        display: false,
                    },
                },
                interaction: {
                    intersect: false,
                },
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Week'
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Employees'
                        },
                        min: 0,
                    }
                }
            },
        });
    </script>
    
</body>
</html>