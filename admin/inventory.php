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
    <title>Inventory</title>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="../js/sweetalert.min.js"></script>
    <script src="../js/chart.min.js"></script>
</head>
<body onload="navF()">

    <?php require_once('./nav.php'); ?>

    <div id="admin-inventory-con">
        <div class="top-con">
            <div class="title-con">
                INVENTORY
            </div>

            <div class="control-con">
                <div class="left-con">
                    <input type="text" placeholder="Search..." id="itemSearch" class="form-control" autofocus>
                    <span>Category: </span>
                    <select id="itemFilter" class="form-select" aria-label="Default select example">
                        <option value="All" selected>All</option>
                        <?php
                            // Query and Display all categories
                            $queryCat = "SELECT * FROM `category`";
                            $resultCat = mysqli_query($con, $queryCat);
                            if(mysqli_num_rows($resultCat) > 0){
                                while($rowCat = mysqli_fetch_assoc($resultCat)){
                                    ?>
                                        <option value="<?php echo $rowCat['cat_name']; ?>"><?php echo ucwords($rowCat['cat_name']); ?></option>
                                    <?php
                                }
                            }
                        ?>
                    </select>
                </div>
                <div class="right-con">
                    <input type="button" class="btn btn-primary" value="+ ADD">
                </div>
            </div>
        </div>
        <div class="content-con">
            <div class="table-con">
                <table id="itemTable">
                    <thead>
                        <tr>
                            <th>Action</th>
                            <th>Item Code</th>
                            <th>Item Description</th>
                            <th>Retail Price</th>
                            <th>Wholesale Price</th>
                            <th>Stock</th>
                            <th>Category</th>
                            <th>Supplier</th>
                            <th>Date Updated</th>
                            <th>Updated By</th>
                            <th>Remarks</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <?php
                            // Query and Display all Items
                            $queryItems = "SELECT `item_code`, `itemnb_name`, `itemnb_retail_price`, `itemnb_wholesale_price`, `itemnb_stock`, `itemnb_category`, `itemnb_suppplier`, `date_updated`, `updated_by`, `itemnb_remarks` FROM `item_no_barcode` UNION SELECT `item_code`, `item_name`, `item_retail_price`, `item_wholesale_price`, `item_stock`, `item_category`, `item_supplier`, `date_updated`, `updated_by`, `item_remarks` FROM `item_with_barcode` ORDER BY `itemnb_name` ASC";
                            $resultItems = mysqli_query($con, $queryItems);
                            if(mysqli_num_rows($resultItems) > 0){
                                while($rowItems = mysqli_fetch_assoc($resultItems)){
                                    ?>
                                        <tr>
                                            <td>
                                                <button class="inv-btn-plus" id="<?php echo $rowItems['item_code']; ?>" data-item-name="">
                                                    <svg viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" stroke="none"><path d="M2143 5105 c-87 -19 -176 -64 -254 -128 -77 -64 -132 -143 -168 -241 l-26 -71 -5 -570 c-5 -524 -6 -573 -23 -598 -42 -64 -16 -61 -627 -68 -544 -5 -556 -5 -625 -28 -206 -67 -359 -232 -401 -430 -20 -96 -20 -718 1 -816 42 -200 197 -371 395 -437 63 -21 83 -22 624 -26 607 -4 596 -3 633 -59 16 -25 18 -75 23 -588 6 -550 6 -561 29 -630 67 -206 232 -359 430 -401 96 -20 718 -20 816 1 200 42 372 197 437 395 21 63 22 86 27 637 l6 571 25 27 c14 15 34 32 45 38 14 9 184 14 585 17 542 5 567 6 620 26 221 84 352 227 395 431 20 95 21 718 1 813 -38 178 -153 324 -313 397 -123 57 -115 56 -725 62 l-566 6 -27 25 c-15 14 -32 34 -38 45 -9 14 -14 184 -17 585 -5 542 -6 567 -26 620 -84 221 -227 352 -431 395 -94 20 -728 20 -820 0z"/></g></svg>
                                                </button>
                                                <button class="inv-btn-edit" id="<?php echo $rowItems['item_code']; ?>" data-item-name="">
                                                    <svg viewBox="0 0 512 512"><path d="M421.7 220.3L188.5 453.4L154.6 419.5L158.1 416H112C103.2 416 96 408.8 96 400V353.9L92.51 357.4C87.78 362.2 84.31 368 82.42 374.4L59.44 452.6L137.6 429.6C143.1 427.7 149.8 424.2 154.6 419.5L188.5 453.4C178.1 463.8 165.2 471.5 151.1 475.6L30.77 511C22.35 513.5 13.24 511.2 7.03 504.1C.8198 498.8-1.502 489.7 .976 481.2L36.37 360.9C40.53 346.8 48.16 333.9 58.57 323.5L291.7 90.34L421.7 220.3zM492.7 58.75C517.7 83.74 517.7 124.3 492.7 149.3L444.3 197.7L314.3 67.72L362.7 19.32C387.7-5.678 428.3-5.678 453.3 19.32L492.7 58.75z"/></svg>
                                                </button>
                                                <button class="inv-btn-delete" id="<?php echo $rowItems['item_code']; ?>">
                                                    <svg viewBox="0 0 448 512"><path d="M135.2 17.69C140.6 6.848 151.7 0 163.8 0H284.2C296.3 0 307.4 6.848 312.8 17.69L320 32H416C433.7 32 448 46.33 448 64C448 81.67 433.7 96 416 96H32C14.33 96 0 81.67 0 64C0 46.33 14.33 32 32 32H128L135.2 17.69zM31.1 128H416V448C416 483.3 387.3 512 352 512H95.1C60.65 512 31.1 483.3 31.1 448V128zM111.1 208V432C111.1 440.8 119.2 448 127.1 448C136.8 448 143.1 440.8 143.1 432V208C143.1 199.2 136.8 192 127.1 192C119.2 192 111.1 199.2 111.1 208zM207.1 208V432C207.1 440.8 215.2 448 223.1 448C232.8 448 240 440.8 240 432V208C240 199.2 232.8 192 223.1 192C215.2 192 207.1 199.2 207.1 208zM304 208V432C304 440.8 311.2 448 320 448C328.8 448 336 440.8 336 432V208C336 199.2 328.8 192 320 192C311.2 192 304 199.2 304 208z"/></svg>
                                                </button>
                                            </td>
                                            <td><?php echo $rowItems['item_code']; ?></td>
                                            <td><?php echo $rowItems['itemnb_name']; ?></td>
                                            <td><?php echo $rowItems['itemnb_retail_price']; ?></td>
                                            <td><?php echo $rowItems['itemnb_wholesale_price']; ?></td>
                                            <td><?php echo $rowItems['itemnb_stock']; ?></td>
                                            <td><?php echo $rowItems['itemnb_category']; ?></td>
                                            <td><?php echo $rowItems['itemnb_suppplier']; ?></td>
                                            <td><?php echo $rowItems['date_updated']; ?></td>
                                            <td><?php echo $rowItems['updated_by']; ?></td>
                                            <td><?php echo $rowItems['itemnb_remarks']; ?></td>
                                        </tr>
                                    <?php
                                }
                            }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>

        function navF(){
            $('.inventory').addClass('active');
            $('.inventory').addClass('disabled');
        }

        $(document).ready(function(){
            // Filter Table Row on Keyup
            $("#itemSearch").on("keyup", function() {
                $("#itemFilter").val('All');
                var value = $(this).val().toLowerCase();
                $("#tableBody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
            // Filter Table Row on Change
            $("#itemFilter").on("change", function() {
                $("#itemSearch").val('');
                if($("#itemFilter").val() == 'All'){
                    var value = "";
                    $("#tableBody tr").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                }else{
                    var value = $(this).val().toLowerCase();
                    $("#tableBody tr").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                }
            });
            
            //Keypress shortcut
            $(document).on('keydown', function(e){
                var upKey = e.which || e.keyCode;
                console.log(upKey);
                
                if(upKey == 107){
                    var rowCount = $('#itemTable tbody tr:visible').length;
                    if(rowCount == 1){
                        $("#itemTable").find("tbody tr:first td button:first").click();
                    }
                    e.preventDefault();
                }
            });

            // Update Stock (PLUS BUTTON)
            $('.inv-btn-plus').click(function(){
                console.log('tesqwet');
                
            });


        });

    </script>
    
</body>
</html>