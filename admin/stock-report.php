<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

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
                width: 100vw;
            }
            h2{
                font-weight: 900;
                font-size: 25px;
                padding: 0;
                margin: 0;
            }
            div{
                width: 100%;
            }

            h3{
                font-weight: 900;
                font-size: 16px;
                padding: 0;
                margin: 10px 0 20px 0;
                display: inline-block;
                width: 33%
                background-color: blue;
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
    
        <h2>LOW STOCK REPORT</h2>
        <div>
            <h3>Date: '.date('F j, Y').'</h3>
            <h4>'.$_SESSION['branch_name'].'</h4>
            <h5>Location: '.$_SESSION['branch_loc'].'</h5>
        </div>
        <table>
            <thead>
                <th>Item Description</th>
                <th>Category</th>
                <th>Remaining Stock</th>
                <th>Supplier</th>
            </thead>
            <tbody>';

                $safeStock = $_SESSION['safe_stock'];
                $queryLowStock = "SELECT `itemnb_name`,`itemnb_category`,`itemnb_stock`,`itemnb_suppplier` FROM `item_no_barcode` WHERE `itemnb_stock` < '$safeStock' UNION SELECT `item_name`,`item_category`,`item_stock`,`item_supplier` FROM `item_with_barcode` WHERE `item_stock` < '$safeStock'";
                $resultLowStock = mysqli_query($con, $queryLowStock);
                if(mysqli_num_rows($resultLowStock) > 0){
                    while($rowStock = mysqli_fetch_assoc($resultLowStock)){
              $html .= '<tr>
                            <td>'.ucwords($rowStock['itemnb_name']).'</td>
                            <td>'.ucwords($rowStock['itemnb_category']).'</td>
                            <td>'.$rowStock['itemnb_stock'].'</td>
                            <td>'.ucwords($rowStock['itemnb_suppplier']).'</td>
                        </tr>';
                    }
                }
    $html .= '</tbody>
        </table>
    </body>
    </html>';

    $dompdf = new Dompdf();
    $dompdf->loadHtml($html);
    $dompdf->setPaper('A4', 'landscape');
    $dompdf->render();
    $dompdf->stream('low-stock-report.pdf', ['Attachment' => 0]);
?>


        