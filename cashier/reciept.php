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
    <link rel="stylesheet" type="text/css" href="../styles/print.css" media="print">
    <title>Reciept</title>
    <script src="../js/jquery-3.6.0.min.js"></script>
        <script src="../js/sweetalert.min.js"></script>
</head>
<body onload="prinThis()">
    <div class="rec-con">
        <div class="title-con">
            <h6>RolNette's Store</h6>
            <p>60 LuckyR wet&dry mkt<br>Mapulang Lupa, Pandi, Bulacan</p>
        </div>
        <div class="top-con">
            <div class="top-top-con">
                <span>Invoice No:</span><span class="invoiceNumber">44050</span>
            </div>
            <div class="top-mid-con">
                <span>D/T: </span><span id="dateTimeNow"></span>
            </div>
            <div class="top-bot-con">
                <span>Cashier: </span><span class="cashierName">John Arian</span>
            </div>
        </div>

        <div class="table-con">
            <table>
                <thead>
                    <th>Item</th>
                    <th>Qty</th>
                    <th>Price</th>
                    <th>Total</th>
                </thead>
                <tbody>
                    <?php
                        $queryTempItems = "SELECT tmp.temp_id, itm.item_code, itm.item_name, itm.item_price, itm.item_stock, tmp.temp_quantity FROM item_with_barcode AS itm INNER JOIN temp_item AS tmp ON itm.item_code = tmp.item_code UNION SELECT tmp.temp_id, inb.item_code, inb.itemnb_name, inb.itemnb_price, inb.itemnb_stock, tmp.temp_quantity FROM item_no_barcode AS inb INNER JOIN temp_item AS tmp ON inb.item_code = tmp.item_code ORDER BY temp_id DESC";
                        $resultTempItems = mysqli_query($con, $queryTempItems);
                        if(mysqli_num_rows($resultTempItems) > 0){
                            $c = 0;
                            while($rowTempItems = mysqli_fetch_assoc($resultTempItems)){
                                $c++;
                                $totalOfItem = (($rowTempItems['temp_quantity'] * $rowTempItems['item_price']));
                                ?>
                                    <tr>
                                        <td style="text-align: left;"><?php echo $c." ".$rowTempItems['item_name']; ?></td>
                                        <td><?php if($_SESSION['endBuyer'] == "WHOLESALE"){ echo number_format(($rowTempItems['item_price'] - ($rowTempItems['item_price'] * 0.05)), 2); }else{ echo number_format($rowTempItems['item_price'], 2); } ?></td>
                                        <td><?php echo $rowTempItems['temp_quantity']; ?></td>
                                        <td><?php echo number_format($totalOfItem, 2); ?></td>
                                    </tr>
                                <?php
                            }
                        }else{
                            ?>
                                <tr style="text-align: center;"><td colspan="5">NO RECORD</td></tr>
                            <?php
                        }
                    ?>
                </tbody>
            </table>
        </div>
        <hr width="90%">
        <div class="bot-con">
            <div class="bot-bot-con"><span style="float: left; margin-left: 10px;">Total Items: <?php echo $_SESSION['totalItems']; ?></span><span style="float: right; margin-right: 10px;">Total Quantity: <?php echo $_SESSION['totalQty']; ?></span></div>
            <div class="subTotal" style="text-align: right; margin-right: 10px; margin-bottom: 10px;">Subtotal: ₱ <?php echo number_format($_SESSION['subTotal'],2); ?></div>
        </div>
        <hr width="90%">
        <div class="grand-total">
            <p style="font-size: 12px; text-align: right; margin-right: 10px; margin-top: 5px;">Grand Total: ₱ <?php echo number_format($_SESSION['subTotal'],2); ?></p>
        </div>
        <hr width="90%">
        <div class="footer">
            <div>Thank you, Please Come Again!</div>
            <div style="font-size: 12px; margin-bottom: 50px">This Receipt is for inventory purpose only</div>
        </div>
    </div>

    <script>
        function prinThis(){

            var today = new Date();
            var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date+' '+time;
            $('#dateTimeNow').html(dateTime);

            window.print();
            swal({
                title: "Printing Reciept...",
            }).then((value) => {
                window.location.href = './del-temp-after-transaction.php';
            });
        }
    </script>
</body>
</html>