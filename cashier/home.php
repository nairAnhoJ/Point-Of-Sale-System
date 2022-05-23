<?php
    session_start();
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
    <title>Home</title>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="../js/sweetalert2.all.min.js"></script>
    <script crossorigin src="../js/react.production.min.js"></script>
    <script crossorigin src="../js/react-dom.production.min.js"></script>
</head>
<body id="chome-body">

<h3 style="text-align: right; margin-right: 100px;">Retail</h3>
    <label for="" style="margin-left: 50px;">Product ID:</label>
    <input type="text" id="prodID" autofocus>
    <!-- <input type="button" value="Transfer" id="btnTrans"> -->

        <br>
        <hr>
        <br>

    <div class="chome-container">
        <h3 style="text-align: center;">Hidden Table</h3>
        <table id="table1">
            <thead>
                <tr>
                    <th>prod id</th>
                    <th>name</th>
                    <th>price</th>
                    <th>quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody id="table1-body">
                <tr>
                    <td>q1</td>
                    <td>Instant noodles (Payless Beef 55g)</td>
                    <td>7</td>
                    <td><input type="number" value="1"></td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>q2</td>
                    <td>Canned sardines (Mega 155g)</td>
                    <td>20</td>
                    <td><input type="number" value="1"></td>
                    <td>20</td>
                </tr>
                <tr>
                    <td>q3</td>
                    <td>Instant coffee (Kopiko 10x27.5g)</td>
                    <td>70</td>
                    <td><input type="number" value="1"></td>
                    <td>70</td>
                </tr>
                <tr>
                    <td>q4</td>
                    <td>Sugar</td>
                    <td>55</td>
                    <td><input type="number" value="1"></td>
                    <td>55</td>
                </tr>
                <tr>
                    <td>q5</td>
                    <td>Cooking oil (4L)</td>
                    <td>330</td>
                    <td><input type="number" value="1"></td>
                    <td>330</td>
                </tr>
                <tr>
                    <td>q6</td>
                    <td>Evaporated milk (Alaska 370ml)</td>
                    <td>27</td>
                    <td><input type="number" value="1"></td>
                    <td>27</td>
                </tr>
                <tr>
                    <td>q7</td>
                    <td>Cheese (Eden 165g)</td>
                    <td>50</td>
                    <td><input type="number" value="1"></td>
                    <td>50</td>
                </tr>
                <tr>
                    <td>q8</td>
                    <td>Rubbing alcohol (Rhea 60ml)</td>
                    <td>22</td>
                    <td><input type="number" value="1"></td>
                    <td>22</td>
                </tr>
                <tr>
                    <td>q9</td>
                    <td>Diapers (Huggies 38/76s)</td>
                    <td>578</td>
                    <td><input type="number" value="1"></td>
                    <td>578</td>
                </tr>
            </tbody>
        </table>

        <br>
        <hr>
        <br>


        <h3 style="text-align: center;">Table na nakikita ng Cashier</h3>
        <table id="table2">
            <thead>
                <tr>
                    <th>prod id</th>
                    <th>name</th>
                    <th>price</th>
                    <th>quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody id="table2-body">
            </tbody>
        </table>


        <br>
        <hr>
        <br>

        <label for="subtotal">Subtotal</label>
        <span id="subtotal">0</span>
        <br>
        <label for="disc">Discount %</label>
        <span id="disc"><input type="text" value="--%"></span>
        <br>
        <label for="grandtotal">Grand Total</label>
        <span id="grandtotal">0</span>

        <br>
        <hr>
        <br>

        <h4>Keyboard Shortcut</h4>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">PgUp</strong> => Click before scanning(only if PgDn is Clicked)</span>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">+</strong> => Increment Quantity of last scanned Item</span>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">-</strong> => Decrement Quantity of last scanned Item</span>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">./del</strong> => Custom Quantity of last scanned Item</span>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">PgDn</strong> => Change Discount Percentage</span>
        <br>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">Home</strong> => Change to Retail(Note: It will clear the recent scanned Items. Make sure to change this first before scanning)</span>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">End</strong> => Change to Whosale(Note: It will clear the recent scanned Items. Make sure to change this first before scanning)</span>
        <br>
        <span style="margin-right: 20px;"><strong style="font-size: 20px;">Ctrl+F3</strong> => Finalize/Print</span>


    </div>

    <script>
        $(document).ready(function(){

            var prodCount, subTotal = 0;

            $("#prodID").on("keyup", function(e) {
                var value = $(this).val().toLowerCase();
                $("#table1 tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
                prodCount = $("#table1 tbody tr:visible").length;

                var t_st = event.which || event.keyCode;
                console.log(t_st);

                // ==================== ENTER ====================
                if(t_st==13){
                    var prodId = $('#prodID').val();
                    console.log(prodId);
                    if($("#prodID").val() == ""){
                        console.log('error');
                    }else{
                        if(prodCount == 0){
                            console.log('error');
                        }else{
                        var t2rcount = $("#table2 tbody tr").length;
                        if(t2rcount == 0){
                            var tr = $("#table1").find("tbody tr:visible").clone();
                            $("#table2 tbody").append(tr);
                            $("#table2").find("tbody tr:first input").addClass('firstRow');
                        }else{
                            var ex = false;
                            $("#table2").find("tbody tr").each(function(){
                                ex = false;
                                var tb2id = $(this).find("td:eq(0)").html();
                                if(tb2id == $("#prodID").val()){
                                    var tb2q = parseInt($(this).find("input").val()) + 1;
                                    $(this).find("input").val(tb2q);
                                    var ntr = $(this).clone();
                                    $("#table2 tbody tr:first").before(ntr);
                                    $(this).remove();
                                    $("#table2").find("tbody tr:first input").addClass('firstRow');
                                    $('#table2 tbody tr').eq(1).find('input').removeClass('firstRow');
                                    var itotalr = parseInt($("#table2").find("tbody tr:first td:eq(2)").html()) * tb2q;
                                    console.log("Quantity"+tb2q);
                                    console.log("Total"+itotalr);
                                    $("#table2").find("tbody tr:first td:eq(4)").html(itotalr);
                                    ex = true;
                                    return false;
                                }
                            });
                            console.log(ex);

                            if(ex == false){
                                var tr = $("#table1").find("tbody tr:visible").clone();
                                $("#table2 tbody tr:first").before(tr);
                                $("#table2").find("tbody tr:first input").addClass('firstRow');
                                $('#table2 tbody tr').eq(1).find('input').removeClass('firstRow');
                            }
                        }
                    }
                }
                $("#prodID").val(null);

                // ==================== ADD ====================
                }else if(t_st==107){

                    e.preventDefault();
                    var t2rcount1 = $("#table2 tbody tr").length;
                    console.log(t2rcount1)
                    if(t2rcount1 > 0){
                        var trvalp = parseInt($("#table2").find("tbody tr:first input").val()) + 1;
                        var itotalp = parseInt($("#table2").find("tbody tr:first td:eq(2)").html()) * trvalp;
                        console.log("Quantity"+trvalp);
                        console.log("Total"+itotalp);
                        $("#table2").find("tbody tr:first td:eq(4)").html(itotalp);
                        $("#table2").find("tbody tr:first input").val(trvalp);
                    }
                $("#prodID").val(null);

                // ==================== MINUS ====================
                }else if(t_st==109){
                    e.preventDefault();
                    var t2rcount1 = $("#table2 tbody tr").length;
                    console.log("Row Count"+t2rcount1)
                    if(t2rcount1 > 0){
                        var trvalm = parseInt($("#table2").find("tbody tr:first input").val()) - 1;
                        var itotalm = parseInt($("#table2").find("tbody tr:first td:eq(2)").html()) * trvalm;
                        console.log("Quantity"+trvalm);
                        console.log("Total"+itotalm);
                        $("#table2").find("tbody tr:first td:eq(4)").html(itotalm);
                        $("#table2").find("tbody tr:first input").val(trvalm);
                    }
                $("#prodID").val(null);

                // ==================== MINUS ====================
                }else if(t_st==110){
                    e.preventDefault();
                    $('#table2').find('tbody tr:first input').focus();
                    $("#table2").find("tbody tr:first input").val("");
                    console.log('edit');
                    $("#prodID").val(null);
                }

                subTotal = 0;
                $("#table2").find("tbody tr").each(function(){
                    var lastCol = parseInt($(this).find("td:eq(4)").html());
                    subTotal = subTotal + lastCol;
                    console.log("GT:" + subTotal);
                });

                $('#subtotal').html(subTotal);
                $('#grandtotal').html(subTotal);

            });

            jQuery(document).on( "keyup", ".firstRow", function(en){
                var keyUp = event.which || event.keyCode;
                console.log(keyUp);

                var itotale = parseInt($("#table2").find("tbody tr:first td:eq(2)").html()) * $('.firstRow').val();
                console.log("Quantity" + parseInt($('.firstRow').val()));
                console.log("Total" + itotale);
                $("#table2").find("tbody tr:first td:eq(4)").html(itotale);

                if(keyUp==13){
                    if($(this).val() == ""){
                        console.log("Error: Empty")
                    }else{
                        $("#prodID").focus();
                    }
                }
                subTotal = 0;
                $("#table2").find("tbody tr").each(function(){
                    var lastCol = parseInt($(this).find("td:eq(4)").html());
                    subTotal = subTotal + lastCol;
                    console.log("GT:" + subTotal);
                });

                $('#subtotal').html(subTotal);
                $('#grandtotal').html(subTotal);
            });
            
                
                

        });
    </script>
    
</body>
</html>