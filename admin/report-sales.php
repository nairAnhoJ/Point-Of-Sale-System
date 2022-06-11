<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $getFromDate = $_POST['fromDate'];
    $getToDate = $_POST['toDate'];
    $dateFrom = date("Y-m-d H:i:s", strtotime(date($getFromDate)));
    $dateTo = date("Y-m-d H:i:s", strtotime(date($getToDate)." +1 day")-1);

    $fDate = date("F j, Y", strtotime($getFromDate));
    $tDate = date("F j, Y", strtotime($getToDate));

    require_once '../dompdf/vendor/autoload.php';
    use Dompdf\Dompdf;

    $html = '<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../bootstrap-5.1.3/css/bootstrap.min.css">
        <title>Stock Report</title>
    
        <script src="../js/jquery-3.6.0.min.js"></script>
        <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    
        <style>
            body{
                padding: 0 0px;
            }
            h2{
                font-weight: 900;
                font-size: 25px;
                padding: 0;
                margin: 0;
            }
            h3{
                font-weight: 900;
                font-size: 16px;
                padding: 0;
                margin: 10px 0 20px 0;
                display: inline-block;
                width: 33%
            }
            h4{
                font-weight: 900;
                font-size: 16px;
                padding: 0;
                margin: 10px 0 20px 0;
                display: inline-block;
                text-align: center;
                width: 33%
            }
            h5{
                font-weight: 900;
                font-size: 16px;
                padding: 0;
                margin: 10px 0 20px 0;
                display: inline-block;
                text-align: right;
                width: 33%
                background-color: red;
            }
            table{
                width: 100%;
                border-collapse: collapse;
            }
    
            td,th{
                border: 1px solid #444;
                padding: 5px 20px;
            }
            th{
                text-align: left;
                font-size: 14px;
            }
            td{
                font-size: 12px;
            }
            td:nth-child(2),td:nth-child(3),td:nth-child(4),th:nth-child(2),th:nth-child(3),th:nth-child(4){
                width: 120px;
                text-align: center;
            }
        </style>
    </head>
    <body>
    
        <h2>SALES REPORT</h2>
        <div>
            <h3>Date: '.$fDate.' - '.$tDate.'</h3>
            <h4>'.$_SESSION['branch_name'].'</h4>
            <h5>Location: '.$_SESSION['branch_loc'].'</h5>
        </div>
        <table>
            <thead>
                <th>Date</th>
                <th>Total Sales (P)</th>
            </thead>
            <tbody>';

                $grandTotal = 0;

                $querySales ="SELECT SUM(`tran_total`) AS total, DATE(`tran_date_time`) AS thisDate FROM (SELECT DISTINCT(`tran_num`),`tran_total`,`tran_date_time` FROM `transaction_logs` WHERE `tran_date_time` BETWEEN '$dateFrom' AND '$dateTo') AS SelTran GROUP BY DATE(`tran_date_time`)";
                $resultSales = mysqli_query($con, $querySales);
                if(mysqli_num_rows($resultSales) > 0){
                    while($rowSales = mysqli_fetch_assoc($resultSales)){
                        $grandTotal = $grandTotal + $rowSales['total'];
              $html .= '<tr>
                            <td>'.date("F j, Y", strtotime($rowSales['thisDate'])).'</td>
                            <td>'.number_format($rowSales['total'],2).'</td>
                        </tr>';
                    }
                }

    $html .= '  <tr>
                    <td style="font-size: 18px; font-weight: 900; text-align: right;">GRAND TOTAL</td>
                    <td style="font-size: 18px; font-weight: 900;">'.number_format($grandTotal,2).'</td>
                </tr>
            </tbody>
        </table>
    </body>
    </html>';

    $dompdf = new Dompdf();
    $dompdf->loadHtml($html);
    $dompdf->setPaper('A4', 'landscape');
    $dompdf->render();
    $dompdf->stream('low-stock-report.pdf', ['Attachment' => 0]);
?>


        