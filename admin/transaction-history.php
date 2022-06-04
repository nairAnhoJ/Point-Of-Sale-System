<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $recentNum = 0;
    $recentLoc = "";
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
    <title>Transaction History</title>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="../js/sweetalert.min.js"></script>
    <script src="../js/chart.min.js"></script>
</head>
<body onload="navF()">

    <?php require_once('./nav.php'); ?>

    <div id="admin-tran-con">
        <div class="top-con">
            <div class="title-con">
                <span>Transaction History</span>
            </div>
            <div class="control-con">
                <div class="left-con">
                    <form method="GET" class="date-filter-con">
                        <span>From:</span>
                        <input type="date" id="dateFrom" name="dateFrom" value="<?php echo date('Y-m-d'); ?>" class="form-control">
                        <span>To:</span>
                        <input type="date" id="dateTo" name="dateTo" value="<?php echo date('Y-m-d'); ?>" class="form-control">
                    </form>
                    <div class="type-con">
                        <span>Type:</span>
                        <select id="typeFilter" class="form-control">
                            <option value="Out">OUT</option>
                            <option value="In">IN</option>
                        </select>
                    </div>
                    <div class="loc-con">
                        <span>Location:</span>
                        <select id="locFilter" class="form-control">
                            <option value="All">ALL</option>
                                <?php
                                    $queryLoc = "SELECT DISTINCT `tran_location` FROM `transaction_logs`";
                                    $resultLoc = mysqli_query($con, $queryLoc);
                                    while($rowLoc = mysqli_fetch_assoc($resultLoc)){
                                        ?>
                                            <option value="<?php echo $rowLoc['tran_location']; ?>"><?php echo $rowLoc['tran_location']; ?></option>
                                        <?php
                                    }
                                ?>
                        </select>
                        <input type="button" id="searchFilter" name="searchFilter" value="Search" class="btn btn-primary">
                    </div>
                </div>
                <div class="right-con">
                    <div class="search-con">
                        <input type="text" id="searchInvDR" class="form-control" placeholder="Search...">
                    </div>
                </div>
            </div>
        </div>
        
        <div class="content-con">
            <div class="left-con">
                <div class="table-con">
                    <table>
                        <thead>
                            <tr>
                                <th>ACTION</th>
                                <th>INVOICE/DR NUMBER</th>
                                <th>TOTAL ITEMS</th>
                                <th>TOTAL QUANTITY</th>
                                <th>TOTAL AMOUNT(₱)</th>
                                <th>DATE & TIME</th>
                                <th>CASHIER</th>
                                <th>LOCATION</th>
                                <th>TYPE</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                            <?php
                                if(isset($_GET['searchDate'])){
                                    $dateFrom = $_GET['dateFrom'];
                                    $dateGetTo = $_GET['dateTo'];
                                    $dateTo = date('Y-m-d', strtotime("+1 day", strtotime($dateGetTo)));
                                    $typeFilter = $_GET['typeFilter'];
                                    $locFilter = $_GET['locFilter'];

                                    if($locFilter == 'All'){
                                        $queryTrans = "SELECT * FROM `transaction_logs` WHERE `tran_type` = '$typeFilter' AND `tran_date_time` BETWEEN '$dateFrom' AND '$dateTo' ORDER BY `tran_date_time` DESC";
                                    }else{
                                        $queryTrans = "SELECT * FROM `transaction_logs` WHERE `tran_location` = '$locFilter' AND `tran_type` = '$typeFilter' AND `tran_date_time` BETWEEN '$dateFrom' AND '$dateTo' ORDER BY `tran_date_time` DESC";
                                    }

                                    $resultTrans = mysqli_query($con, $queryTrans);
                                    if(mysqli_num_rows($resultTrans) > 0){
                                        while($rowTrans = mysqli_fetch_assoc($resultTrans)){
                                            if($recentNum != $rowTrans['tran_num']){
                                                $recentNum = $rowTrans['tran_num'];

                                                $getTotalItems = "SELECT `log_id` FROM transaction_logs WHERE `tran_num` = '$recentNum'";
                                                $resTotalItems = mysqli_num_rows(mysqli_query($con, $getTotalItems));

                                                $getTotalQty = "SELECT SUM(`tran_qty`) FROM transaction_logs WHERE `tran_num` = '$recentNum'";
                                                $resTotalQty = mysqli_fetch_assoc(mysqli_query($con, $getTotalQty));

                                                ?>
                                                    <tr>
                                                        <td>
                                                            <button class="btnView" data-inv="<?php echo $rowTrans['tran_num']; ?>" data-trantype="<?php echo $rowTrans['tran_type']; ?>">
                                                                <svg viewBox="0 0 576 512"><path d="M279.6 160.4C282.4 160.1 285.2 160 288 160C341 160 384 202.1 384 256C384 309 341 352 288 352C234.1 352 192 309 192 256C192 253.2 192.1 250.4 192.4 247.6C201.7 252.1 212.5 256 224 256C259.3 256 288 227.3 288 192C288 180.5 284.1 169.7 279.6 160.4zM480.6 112.6C527.4 156 558.7 207.1 573.5 243.7C576.8 251.6 576.8 260.4 573.5 268.3C558.7 304 527.4 355.1 480.6 399.4C433.5 443.2 368.8 480 288 480C207.2 480 142.5 443.2 95.42 399.4C48.62 355.1 17.34 304 2.461 268.3C-.8205 260.4-.8205 251.6 2.461 243.7C17.34 207.1 48.62 156 95.42 112.6C142.5 68.84 207.2 32 288 32C368.8 32 433.5 68.84 480.6 112.6V112.6zM288 112C208.5 112 144 176.5 144 256C144 335.5 208.5 400 288 400C367.5 400 432 335.5 432 256C432 176.5 367.5 112 288 112z"/></svg>
                                                                <span>View</span>
                                                            </button>
                                                        </td>
                                                        <td><?php echo $rowTrans['tran_num']; ?></td>
                                                        <td><?php echo $resTotalItems; ?></td>
                                                        <td><?php echo $resTotalQty['SUM(`tran_qty`)']; ?></td>
                                                        <td><?php echo number_format($rowTrans['tran_total'],2); ?></td>
                                                        <td><?php echo $rowTrans['tran_date_time']; ?></td>
                                                        <td><?php echo $rowTrans['tran_cashier']; ?></td>
                                                        <td><?php echo $rowTrans['tran_location']; ?></td>
                                                        <td class="tranType"><?php echo $rowTrans['tran_type']; ?></td>
                                                    </tr>
                                                <?php
                                            }
                                        }
                                    }else{
                                        ?> <tr><td>NO RECORD</td></tr> <?php
                                    }
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <?php
        if(isset($_GET['viewInv'])){
            $invNum = $_GET['viewInv'];
            $queryView = "SELECT * FROM `transaction_logs` WHERE `tran_num`='$invNum'";
            $resultView = mysqli_query($con, $queryView);
            $dateCash = mysqli_fetch_assoc($resultView);
            $itemNo = 0;

            ?>
                <div class="modal-view">
                    <div class="inner-modal">
                        <div class="top-con">
                            <div class="title-con">
                                <h1><?php if($_GET['tranType'] == "Out"){ echo "Invoice No: ".$_GET['viewInv']; }else{ echo "Delivery Receipt No: ".$_GET['viewInv']; } ?></h1>
                            </div>
                        </div>
                        <div class="content-con">
                            <div class="details-con">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="dateTime">
                                            <span>Date & Time: <?php echo $dateCash['tran_date_time']; ?></span>
                                        </div>
                                        <div class="cashierName">
                                            <span>Cashier: <?php echo $dateCash['tran_cashier']; ?></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- date; cashier -->
                            </div>
                            <div class="table-con">
                                <table>
                                    <thead>
                                        <th>Item No</th>
                                        <th>Item Name</th>
                                        <th>Quantity</th>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $queryView = "SELECT * FROM `transaction_logs` WHERE `tran_num`='$invNum'";
                                            $resultView = mysqli_query($con, $queryView);
                                            while($rowView = mysqli_fetch_assoc($resultView)){
                                                $itemNo++;
                                                ?>
                                                <tr>
                                                    <td><?php echo $itemNo; ?></td>
                                                    <td><?php echo $rowView['tran_item']; ?></td>
                                                    <td><?php echo $rowView['tran_qty']; ?></td>
                                                </tr>
                                                <?php
                                            }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="footer-con">
                                <div class="total-con">
                                    <div class="float-con">
                                        <span>Grand Total: </span><span>₱ <?php echo number_format($dateCash['tran_total'],2); ?></span>
                                    </div>
                                </div>
                                <div class="btn-con">
                                    <button id="closeModal" class="btn btn-primary">CLOSE</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php
        }
    ?>







    <script>
        function navF(){
            $('.tran').addClass('active');
            $('.tran').addClass('disabled');

            $('#dateFrom').val(<?php echo json_encode($dateFrom) ?>);
            $('#dateGetTo').val(<?php echo json_encode($dateGetTo) ?>);
            $('#typeFilter').val(<?php echo json_encode($typeFilter) ?>);
            $('#locFilter').val(<?php echo json_encode($locFilter) ?>);
        }

        $(document).ready(function(){
            $("#searchInvDR").on("keyup", function() {
                var valueSearch = $(this).val().toLowerCase();
                $("#tableBody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(valueSearch) > -1)
                });
            });

            $('#searchFilter').click(function(){
                var dateFrom = $('#dateFrom').val();
                var dateTo = $('#dateTo').val();
                var typeFilter = $('#typeFilter').val();
                var locFilter = $('#locFilter').val();

                    window.location.href ="./transaction-history.php?dateFrom="+dateFrom+"&dateTo="+dateTo+"&typeFilter="+typeFilter+"&locFilter="+locFilter+"&searchDate=Search";
            });

            $('.btnView').click(function(){
                var invNum = $(this).data('inv');
                var tranType = $(this).data('trantype');
                var currUrl = new URL(window.location.href);
                var urlPar = currUrl.searchParams;
                urlPar.delete('viewInv');
                urlPar.delete('tranType');
                window.location.href = currUrl + "&viewInv=" + invNum + "&tranType=" + tranType;
            });

            $('#closeModal').click(function(){
                var currUrl = new URL(window.location.href);
                var urlPar = currUrl.searchParams;
                urlPar.delete('viewInv');
                urlPar.delete('tranType');
                window.location.href = currUrl;
            });
        });
    </script>
    
</body>
</html>