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
    <title>Users</title>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="../js/sweetalert.min.js"></script>
    <script src="../js/chart.min.js"></script>
</head>
<body onload="navF()">

    <?php
        require_once('./nav.php');
    
        if(!isset($_SESSION['errorAddUsername'])){
        }else{
            if ($_SESSION['errorAddUsername'] == true){
                ?>
                    <script>
                        swal({
                            icon: "error",
                            title: "Username you entered already exist!",
                        }).then((value) => {
                            $('#userSearch').focus();
                        });
                    </script>
                <?php
                $_SESSION['errorAddUsername'] = false;
            }
        }

        if(!isset($_SESSION['errorAddCard'])){
        }else{
            if ($_SESSION['errorAddCard'] == true){
                ?>
                    <script>
                        swal({
                            icon: "error",
                            title: "Card Number you entered already exist!",
                        }).then((value) => {
                            $('#userSearch').focus();
                        });
                    </script>
                <?php
                $_SESSION['errorAddCard'] = false;
            }
        }

        if(!isset($_SESSION['successAdd'])){
        }else{
            if ($_SESSION['successAdd'] == true){
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "User has been added successfully!",
                        }).then((value) => {
                            $('#userSearch').focus();
                        });
                    </script>
                <?php
                $_SESSION['successAdd'] = false;
            }
        }

        if(!isset($_SESSION['successEdit'])){
        }else{
            if ($_SESSION['successEdit'] == true){
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "User has been updated successfully!",
                        }).then((value) => {
                            $('#userSearch').focus();
                        });
                    </script>
                <?php
                $_SESSION['successEdit'] = false;
            }
        }

        if(!isset($_SESSION['successDelete'])){
        }else{
            if ($_SESSION['successDelete'] == true){
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "User has been removed successfully!",
                        }).then((value) => {
                            $('#userSearch').focus();
                        });
                    </script>
                <?php
                $_SESSION['successDelete'] = false;
            }
        }
    ?>

    <div id="admin-cat-con">
        <div class="top-con">
            <div class="title-con">
                <span>Manage User</span>
            </div>
            <div class="control-con">
                <div class="search-con">
                    <input type="text" id="userSearch" class="form-control" placeholder="Search...">
                </div>
                <div class="button-con">
                    <button class="btn btn-primary btnAdd">+ ADD</button>
                </div>
            </div>
        </div>
        <div class="content-con">
            <div class="table-con">
                <table>
                    <thead>
                        <th>Card Number</th>
                        <th>Username</th>
                        <th>Name</th>
                        <th>Action</th>
                    </thead>
                    <tbody id="tableBody">
                        <?php
                            $queryUser = "SELECT * FROM `users`";
                            $resultUser = mysqli_query($con, $queryUser);
                            if(mysqli_num_rows($resultUser) > 0){
                                $x = 0;
                                while($rowUser = mysqli_fetch_assoc($resultUser)){
                                    if($x != 0){
                                        ?>
                                            <tr>
                                                <td><?php echo $rowUser['user_rfid']; ?></td>
                                                <td><?php echo $rowUser['user_name']; ?></td>
                                                <td><?php echo ucwords($rowUser['cashier_name']); ?></td>
                                                <td>
                                                    <button class="btnEdit" data-id="<?php echo $rowUser['user_id']; ?>" data-username="<?php echo $rowUser['user_name']; ?>" data-cname="<?php echo $rowUser['cashier_name']; ?>" data-rfid="<?php echo $rowUser['user_rfid']; ?>" data-role="<?php echo $rowUser['role']; ?>">
                                                        <svg viewBox="0 0 512 512"><path d="M421.7 220.3L188.5 453.4L154.6 419.5L158.1 416H112C103.2 416 96 408.8 96 400V353.9L92.51 357.4C87.78 362.2 84.31 368 82.42 374.4L59.44 452.6L137.6 429.6C143.1 427.7 149.8 424.2 154.6 419.5L188.5 453.4C178.1 463.8 165.2 471.5 151.1 475.6L30.77 511C22.35 513.5 13.24 511.2 7.03 504.1C.8198 498.8-1.502 489.7 .976 481.2L36.37 360.9C40.53 346.8 48.16 333.9 58.57 323.5L291.7 90.34L421.7 220.3zM492.7 58.75C517.7 83.74 517.7 124.3 492.7 149.3L444.3 197.7L314.3 67.72L362.7 19.32C387.7-5.678 428.3-5.678 453.3 19.32L492.7 58.75z"/></svg>
                                                        <span>EDIT</span>
                                                    </button>
                                                    <button class="btnDelete" data-id="<?php echo $rowUser['user_id']; ?>" data-cname="<?php echo ucwords($rowUser['user_name']); ?>">
                                                        <svg viewBox="0 0 448 512"><path d="M135.2 17.69C140.6 6.848 151.7 0 163.8 0H284.2C296.3 0 307.4 6.848 312.8 17.69L320 32H416C433.7 32 448 46.33 448 64C448 81.67 433.7 96 416 96H32C14.33 96 0 81.67 0 64C0 46.33 14.33 32 32 32H128L135.2 17.69zM31.1 128H416V448C416 483.3 387.3 512 352 512H95.1C60.65 512 31.1 483.3 31.1 448V128zM111.1 208V432C111.1 440.8 119.2 448 127.1 448C136.8 448 143.1 440.8 143.1 432V208C143.1 199.2 136.8 192 127.1 192C119.2 192 111.1 199.2 111.1 208zM207.1 208V432C207.1 440.8 215.2 448 223.1 448C232.8 448 240 440.8 240 432V208C240 199.2 232.8 192 223.1 192C215.2 192 207.1 199.2 207.1 208zM304 208V432C304 440.8 311.2 448 320 448C328.8 448 336 440.8 336 432V208C336 199.2 328.8 192 320 192C311.2 192 304 199.2 304 208z"/></svg>
                                                        <span>REMOVE</span>
                                                    </button>
                                                </td>
                                            </tr>
                                        <?php
                                    }
                                    $x++;
                                }
                            }else{
                                ?><tr><td>NO RECORD</td></tr><?php
                            }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="modal-add-edit visually-hidden">
        <div class="inner-modal">
            <div class="top-con">
                <div class="modal-title-con">ADD/EDIT</div>
            </div>
            <form id="formAE" action="" method="POST" class="content-con">
                <div class="row">
                    <div class="col-6">
                        <label>Card Number:</label>
                    </div>
                    <div class="col-6">
                        <input type="hidden" id="userId" name="userId">
                        <input class="form-control" id="userCard" name="userCard" type="text" required autocomplete="off">
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label>Username:</label>
                    </div>
                    <div class="col-6">
                        <input class="form-control" id="userName" name="userName" type="text" required autocomplete="off">
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label>Cashier Name:</label>
                    </div>
                    <div class="col-6">
                        <input class="form-control" id="cashierName" name="cashierName" type="text" required autocomplete="off">
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label>Role:</label>
                    </div>
                    <div class="col-6">
                        <select name="userRole" id="userRole" class="form-select">
                            <option value="cashier">Cashier</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label>Password:</label>
                    </div>
                    <div class="col-6">
                        <input class="form-control" id="userPass" name="userPass" type="password" autocomplete="off">
                    </div>
                </div>
                <div class="row">
                    <div class="btnCol col-6">
                        <input type="submit" value="SAVE" class="btn btn-primary">
                    </div>
                    <div class="btnCol col-6">
                        <input type="button" value="CANCEL" class="btn btn-secondary btnCancel">
                    </div>
                </div>
            </form>
        </div>
    </div>


    <div class="modal-delete visually-hidden">
        <div class="inner-modal">
            <div class="top-con">
                <div class="title-con">REMOVE USER</div>
                <div class="text-con">Are you sure you want to remove this user?</div>
            </div>
            <form class="content-con" action="./users-delete.php" method="POST">
                <div class="row">
                    <div class="col-6">
                        <label>Name:</label>
                    </div>
                    <div class="col-6">
                        <input type="hidden" id="userDelId" name="userDelId">
                        <span id="delUserName"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="btnCol col-6">
                        <input type="submit" value="DELETE" class="btn btn-danger">
                    </div>
                    <div class="btnCol col-6">
                        <input type="button" value="CANCEL" class="btn btn-secondary btnCancel">
                    </div>
                </div>
            </form>
        </div>
    </div>


    <script>
        function navF(){
            $('.users').addClass('active');
            $('.users').addClass('disabled');
        }

        $(document).ready(function(){
            $(document).on('keydown', function(e){
                var eKey = e.keyCode;

                if(eKey == '27'){
                    $('.btnCancel').click();
                }
            });

            $('.btnAdd').click(function(){
                $('.modal-add-edit').removeClass('visually-hidden');
                $('.modal-title-con').html('ADD USER');
                $('#formAE').prop('action', 'users-add.php');
                $('#userPass').attr('required', true);
                $('#userCard').focus();
            });

            $('.btnEdit').click(function(){
                var userId = $(this).data('id');
                var username = $(this).data('username');
                var cName = $(this).data('cname');
                var userCard = $(this).data('rfid');
                var userRole = $(this).data('role');
                $('.modal-add-edit').removeClass('visually-hidden');
                $('.modal-title-con').html('EDIT USER');
                $('#userPass').attr('required', false);
                $('#userId').val(userId);
                $('#userName').val(username);
                $('#cashierName').val(cName);
                $('#userCard').val(userCard);
                $('#userRole').val(userRole);
                $('#userCard').focus();
                $('#formAE').prop('action', 'users-edit.php');
            });

            $('.btnCancel').click(function(){
                $('.modal-add-edit').addClass('visually-hidden');
                $('.modal-delete').addClass('visually-hidden');
                $('#userId').val("");
                $('#userName').val("");
                $('#cashierName').val("");
                $('#userCard').val("");
                $('#userRole').val("cashier");
            });

            $('.btnDelete').click(function(){
                var cName = $(this).data('cname');
                var userId = $(this).data('id');
                $('.modal-delete').removeClass('visually-hidden');
                $('#delUserName').html(cName);
                $('#userDelId').val(userId);
            });

            $("#userSearch").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#tableBody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    
</body>
</html>