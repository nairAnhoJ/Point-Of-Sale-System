<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");
    $subTotal = 0.00;
    $totalItems = 0.00;
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../bootstrap-5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="../styles/styles.css?v=<?php echo time(); ?>">
        <link rel="icon" href="../images/logo/shops.png">
        <title>POS</title>

        <script src="../js/jquery-3.6.0.min.js"></script>
        <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
        <script src="../js/sweetalert.min.js"></script>
        <script crossorigin src="../js/react.production.min.js"></script>
        <script crossorigin src="../js/react-dom.production.min.js"></script>
    </head>
    <body id="nchome-body">


        <?php
            if(!isset($_SESSION['unregItemError'])){
            }else{
                if ($_SESSION['unregItemError'] == true){
                    ?>
                        <script>
                            swal({
                                icon: "error",
                                title: "Unregistered Item!",
                            }).then((value) => {
                                $('#inputItemCode').focus();
                            });
                        </script>
                    <?php
                    $_SESSION['unregItemError'] = false;
                }
            }

            if(!isset($_SESSION['deleteAllSuccess'])){
            }else{
                if ($_SESSION['deleteAllSuccess'] == true){
                    ?>
                        <script>
                            swal({
                                icon: "success",
                                title: "Transaction has been cancel.",
                            }).then((value) => {
                                $('#inputItemCode').focus();
                            });
                        </script>
                    <?php
                    $_SESSION['deleteAllSuccess'] = false;
                }
            }

            if(!isset($_SESSION['removeSuccess'])){
            }else{
                if ($_SESSION['removeSuccess'] == true){
                    ?>
                        <script>
                            swal({
                                icon: "success",
                                title: "Item has been remove.",
                            }).then((value) => {
                                $('#inputItemCode').focus();
                            });
                        </script>
                    <?php
                    $_SESSION['removeSuccess'] = false;
                }
            }
        ?>

        <div class="nchome-container">
            <div class="left-con">
                <div class="left-top-con">
                    <div class="logo-con">
                        <div class="the-logo">
                            <img src="../images/logo/shops.png" alt="">
                            <h1>RolNette's Store</h1>
                        </div>
                    </div>
                    <div class="search-con">
                        <input type="text" placeholder="Search..." class="form-control">
                    </div>
                </div>
                <div class="left-mid-con">
                    <div class="left-nav-con">
                        <div class="top-title"><span>Category</span></div>
                        <div class="nav-content">
                            <div class="nav flex-column nav-pills me-3 btn-nav-con" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <button class="nav-link active" id="v-pills-all-tab" data-bs-toggle="pill" data-bs-target="#all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true">All</button>
                                <?php
                                    $queryCategoryNav = "SELECT * FROM `category`";
                                    $resultCategoryNav = mysqli_query($con, $queryCategoryNav);
                                    if(mysqli_num_rows($resultCategoryNav) > 0){
                                        while($rowCatNav = mysqli_fetch_assoc($resultCategoryNav)){
                                            ?>
                                                <button class="nav-link" id="v-pills-<?php echo str_replace(" ", "-", $rowCatNav['cat_name']); ?>-tab" data-bs-toggle="pill" data-bs-target="#<?php echo str_replace(" ", "-", $rowCatNav['cat_name']);  ?>" type="button" role="tab" aria-controls="v-pills-<?php echo str_replace(" ", "-", $rowCatNav['cat_name']);  ?>" aria-selected="false"><?php echo ucfirst($rowCatNav['cat_name']);  ?></button>
                                            <?php
                                        }
                                    }
                                ?>
                            </div>
                        </div>
                        <div class="down-arrow">
                            <button class="btnArrow">
                                <svg height="30px" viewBox="0 0 384 512">
                                    <path d="M192 384c-8.188 0-16.38-3.125-22.62-9.375l-160-160c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L192 306.8l137.4-137.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-160 160C208.4 380.9 200.2 384 192 384z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="content-con">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="v-pills-all-tab">
                                <div class="con-con">
                                    <div class="item-con">
                                        <a class="con-item" href="#">
                                            <img src="../images/items/skyflakes.png" alt="">
                                            <p>SkyFlakes Crackers | 25g 24pcs</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <?php
                                $queryCategoryCon = "SELECT * FROM `category`";
                                $resultCategoryCon = mysqli_query($con, $queryCategoryCon);
                                if(mysqli_num_rows($resultCategoryCon) > 0){
                                    while($rowCatCon = mysqli_fetch_assoc($resultCategoryCon)){
                                        ?>
                                            <div class="tab-pane fade" id="<?php echo str_replace(" ", "-", $rowCatCon['cat_name']); ?>" role="tabpanel" aria-labelledby="v-pills-<?php echo str_replace(" ", "-", $rowCatCon['cat_name']); ?>-tab">
                                                <div class="con-con">
                                                    <?php echo strtoupper(str_replace(" ", "-", $rowCatCon['cat_name'])); ?>
                                                </div>
                                            </div>
                                        <?php
                                    }
                                }
                            ?>
                        </div>
                    </div>
                </div>
                <div class="left-bot-con">

                </div>
            </div>
            <div class="right-con">
                <div class="right-top-con">
                    <form class="item-code-con" method="POST">
                        <label for="inputItemCode" class="align-middle ps-5 pe-3">Item Code:</label>
                        <input type="text" class="form-control shadow-sm" name="itemCode" id="inputItemCode" autofocus autocomplete="off">
                        <input type="submit" name="itemCodeSubmit" id="codeSubmit" tabindex="-1">
                    </form>
                    <div class="end-buyer-con">
                        <h1 id="end-buyer">RETAIL</h1>
                    </div>
                </div>
                <div class="right-bottom-con">
                    <div class="scanned-item-table">
                        <table id="scanned-items">
                            <thead id="tableHead">
                                <tr>
                                    <th>Item Name</th>
                                    <th>Price (₱)</th>
                                    <th>Qty</th>
                                    <th>Total (₱)</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    if(isset($_POST['itemCodeSubmit'])){
                                        $itemCode = $_REQUEST['itemCode'];
                                        $checkItem = "SELECT * FROM `item_with_barcode` WHERE `item_code` = '$itemCode'";
                                        $resultItem = mysqli_query($con, $checkItem);
                                        if(mysqli_num_rows($resultItem) > 0){
                                            $checkTemp = "SELECT * FROM `temp_item` WHERE `item_code` = '$itemCode'";
                                            $resultTemp = mysqli_query($con, $checkTemp);
                                            if(mysqli_num_rows($resultTemp) > 0){
                                                while($rowTemp = mysqli_fetch_assoc($resultTemp)){
                                                    $newQty = $rowTemp['temp_quantity'] + 1;
                                                    $deleteTemp = "DELETE FROM `temp_item` WHERE `item_code` = '$itemCode'";
                                                    mysqli_query($con, $deleteTemp);
                                                    $updateTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`) VALUES (null,'$itemCode','$newQty')";
                                                    mysqli_query($con, $updateTemp);
                                                    // header('location: home.php');
                                                }
                                            }else{
                                                $insertTemp = "INSERT INTO `temp_item`(`temp_id`, `item_code`, `temp_quantity`) VALUES (null,'$itemCode','1')";
                                                mysqli_query($con, $insertTemp);
                                                // header('location: home.php');
                                            }

                                        }else{
                                            $_SESSION['unregItemError'] = true;
                                            // header('location: home.php');
                                        }
                                    }

                                        $queryTempItems = "SELECT tmp.temp_id, itm.item_code, itm.item_name, itm.item_price, itm.item_stock, tmp.temp_quantity FROM item_with_barcode AS itm INNER JOIN temp_item AS tmp ON itm.item_code = tmp.item_code ORDER BY tmp.temp_id DESC";
                                        $resultTempItems = mysqli_query($con, $queryTempItems);
                                        if(mysqli_num_rows($resultTempItems) > 0){
                                            $c = 0;
                                            while($rowTempItems = mysqli_fetch_assoc($resultTempItems)){
                                                if($c == 0){
                                                    $_SESSION['lastCode'] = $rowTempItems['item_code'];
                                                    $_SESSION['lastQty'] = $rowTempItems['temp_quantity'];
                                                    $c++;
                                                }
                                                $totalOfItem = (($rowTempItems['temp_quantity'] * $rowTempItems['item_price']));
                                                ?>
                                                    <tr>
                                                        <td><?php echo $rowTempItems['item_name']; ?></td>
                                                        <td><?php echo number_format($rowTempItems['item_price'], 2); ?></td>
                                                        <td><?php echo $rowTempItems['temp_quantity']; ?></td>
                                                        <td><?php echo number_format($totalOfItem, 2); ?></td>
                                                        <td><button class="btn btn-danger remTempItem" data-item-code="<?php echo $rowTempItems['item_code'] ?>">Remove</button></td>
                                                    </tr>
                                                <?php
                                                $subTotal = $subTotal + $totalOfItem;
                                                $totalItems++;
                                            }
                                        }else{
                                            ?>
                                                <tr style="text-align: center;"><td colspan="5">NO RECORD</td></tr>
                                            <?php
                                        }
                                ?>


                                
                                <!-- <tr>
                                    <td>Cheese (Eden 165g)</td>
                                    <td>5550.00</td>
                                    <td>1</td>
                                    <td>5550.00</td>
                                    <td><a class="btn btn-danger" href="#">Remove</a></td>
                                </tr> -->
                            </tbody>
                        </table>
                    </div>
                    <div class="total-con">
                        <div class="row1">
                            <div class="col1">
                                <span>Total Items</span>
                                <span><?php echo $totalItems; ?></span>
                            </div>
                            <div class="col2">
                                <span>Subtotal</span>
                                <span><span>₱ </span><?php echo number_format($subTotal, 2); ?></span>
                            </div>
                        </div>
                        <div class="srow">
                            <span>Discount</span>
                            <span>0.00%</span>
                        </div>
                        <div class="srow">
                            <span>GRAND TOTAL</span>
                            <span id="grandTotal"><span>₱ </span><?php echo number_format($subTotal, 2); ?></span>
                        </div>
                    </div>
                    <div class="button-con">
                        <div class="payment-con">
                            <a href="#" class="btn btn-primary">PAYMENT (F8)</a>
                        </div>
                        <div class="cancel-con">
                            <a href="#" class="btn btn-danger">CANCEL (F9)</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">

                // function onloadFunction(){
                //     $('#grandTotal').html()
                // }

            $(document).ready(function(){

                $("#inputItemCode").on("keyup", function(e) {
                    var keyUp = e.which || e.keyCode;
                    console.log(keyUp);

                    if(keyUp == 107){
                        console.log('plus');
                        $("#inputItemCode").val("");
                        window.location.href = './inc-qty.php';
                    }else if(keyUp == 109){
                        console.log('minus');
                        $("#inputItemCode").val("");
                        window.location.href = './dec-inc.php';
                    }else if(keyUp == 110){
                        console.log('manual');
                        $("#inputItemCode").val("");
                        
                        swal({
                            title: "QUANTITY",
                            closeOnClickOutside: false,
                            content: {
                                element: "input",
                                attributes: {
                                    name: "manualQty",
                                    id: "manualQty",
                                    type: "number",
                                    min: "1",
                                    max: "999",
                                    step: "1",
                                },
                            },
                            buttons:{
                                submit: {
                                    text: "Submit",
                                    value: 'sbmtQty',
                                    visible: true,
                                    className: "sbmtQty",
                                    closeModal: true,
                                },
                                cancel: {
                                    text: "Cancel",
                                    value: null,
                                    visible: true,
                                    className: "cncl",
                                    closeModal: true,
                                },
                            },
                        })
                    }else if(keyUp == 120){
                        console.log('cancel');
                        $("#inputItemCode").val("");
                        
                        swal({
                            icon: "warning",
                            title: "CANCEL TRANSACTION",
                            text: "Are you sure you want to cancel the transactions?",
                            closeOnClickOutside: false,
                            dangerMode: true,
                            buttons:{
                                confirm: {
                                    text: "YES",
                                    visible: true,
                                    className: "yesCancel",
                                    closeModal: true,
                                    attributes: {
                                        autofocus: true,
                                    },
                                },
                                cancel: {
                                    text: "NO",
                                    visible: true,
                                    className: "cncl",
                                    closeModal: true,
                                },
                            },
                        })
                    }else if(keyUp == 115){
                        console.log('delete last item');
                        $("#inputItemCode").val("");
                        
                        swal({
                            icon: "warning",
                            title: "REMOVE LAST ITEM",
                            text: "Are you sure you want to remove the last item?",
                            closeOnClickOutside: false,
                            dangerMode: true,
                            buttons:{
                                confirm: {
                                    text: "YES",
                                    visible: true,
                                    className: "yesRemove",
                                    closeModal: true,
                                    attributes: {
                                        autofocus: true,
                                    },
                                },
                                cancel: {
                                    text: "NO",
                                    visible: true,
                                    className: "cncl",
                                    closeModal: true,
                                },
                            },
                        })
                    }else if(keyUp == 123){
                        e.preventDefault();
                        console.log('retail/wholesale');
                        $("#inputItemCode").val("");
                        var retailWholesale = $('#end-buyer').html();
                        var changeTo;
                        console.log(retailWholesale);
                        if(retailWholesale == "RETAIL"){
                            changeTo = "WHOLESALE";
                        }else if(retailWholesale == "WHOLESALE"){
                            changeTo = "RETAIL";
                        }

                        swal({
                        title: "Are you sure you want to change to "+changeTo+"?",
                        text: "All scanned Items will be removed.",
                        icon: "warning",
                        dangerMode: true,buttons:{
                                confirm: {
                                    text: "YES",
                                    visible: true,
                                    closeModal: true,
                                    attributes: {
                                        autofocus: true,
                                    },
                                },
                                cancel: {
                                    text: "NO",
                                    visible: true,
                                    className: "cncl",
                                    closeModal: true,
                                },
                            },
                        })
                        .then((willDelete) => {
                            if (willDelete) {
                                window.location.href = './remove-temp-item.php?tempCode=' + thisItemCode;
                            } else {
                                $("#inputItemCode").focus();
                            }
                        });
                    }
                });

                $('.remTempItem').click(function(){
                    var thisItemCode = $(this).data('item-code');
                    console.log(thisItemCode);
                    swal({
                        title: "Delete Item",
                        text: "Are you sure you want to delete this item?",
                        icon: "warning",
                        dangerMode: true,buttons:{
                                confirm: {
                                    text: "YES",
                                    visible: true,
                                    closeModal: true,
                                    attributes: {
                                        autofocus: true,
                                    },
                                },
                                cancel: {
                                    text: "NO",
                                    visible: true,
                                    className: "cncl",
                                    closeModal: true,
                                },
                            },
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            window.location.href = './remove-temp-item.php?tempCode=' + thisItemCode;
                        } else {
                            $("#inputItemCode").focus();
                        }
                    });
                });

                function sbtManualQty(){
                    var manualQty = $('#manualQty').val()
                    console.log(manualQty);
                    window.location.href = './manual-qty.php?mqty=' + manualQty;
                }

                function cancelTran(){
                    window.location.href = './del-temp-table.php';
                }


                function removeLastItem(){
                    window.location.href = './remove-last-item.php';
                }

                jQuery(document).on( "keyup", "#manualQty", function(em){
                    var emKey = em.which || em.keyCode;
                    // console.log(emKey);
                    
                    if(emKey == 13){
                        if($('#manualQty').val() != ""){
                            sbtManualQty();
                        }else{
                            $("#inputItemCode").focus();
                        }

                    }else if(emKey == 27){
                        $("#inputItemCode").focus();
                    }

                    if(event.key==='.'){event.preventDefault();}
                });

                jQuery(document).on( "click", ".sbmtQty", function(){
                    if($('#manualQty').val() != ""){
                        sbtManualQty();
                    }else{
                        $("#inputItemCode").focus();
                    }
                });

                jQuery(document).on( "click", ".cncl", function(){
                    $("#inputItemCode").focus();
                });

                jQuery(document).on( "keyup", ".swal-modal", function(ec){
                    var ecKey = ec.which || ec.keyCode;
                    console.log(ecKey);
                    
                    if(ecKey == 27){
                        $("#inputItemCode").focus();
                    }
                });

                jQuery(document).on( "click", ".yesCancel", function(){
                    cancelTran();
                });

                jQuery(document).on( "click", ".yesRemove", function(){
                    removeLastItem();
                });

                const itemCount = <?php echo json_encode($totalItems); ?>;
                if(screen.height <= '1080'){
                    console.log(screen.height);
                    if(itemCount > 12){
                        $('#tableHead').css("width","calc(100% - 15px)");
                    }
                }
            });
        </script>

    </body>
</html>