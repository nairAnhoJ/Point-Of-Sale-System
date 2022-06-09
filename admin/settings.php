<?php
    session_start();
    date_default_timezone_set("Asia/Manila");
    include("../db/conn.php");

    $querySetting = "SELECT * FROM `admin_settings`";
    $resultSetting = mysqli_query($con, $querySetting);
    $rowSetting = mysqli_fetch_assoc($resultSetting);
    $name = $rowSetting['branch_name'];
    $location = $rowSetting['branch_location'];
    $code = $rowSetting['reciept_code'];


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
    <title>Settings</title>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="../js/sweetalert.min.js"></script>
    <script src="../js/chart.min.js"></script>
</head>
<body onload="navF()">

    <?php
        require_once('./nav.php');
    
        if(!isset($_SESSION['success'])){
        }else{
            if ($_SESSION['success'] == true){
                $success = $_SESSION['success'];
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "Store <?php echo json_encode($success); ?> has been updated successfully!",
                        })
                    </script>
                <?php
                $_SESSION['success'] = false;
            }
        }

        if(!isset($_SESSION['successLoc'])){
        }else{
            if ($_SESSION['successLoc'] == true){
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "Store Location has been updated successfully!",
                        })
                    </script>
                <?php
                $_SESSION['successLoc'] = false;
            }
        }

        if(!isset($_SESSION['successCode'])){
        }else{
            if ($_SESSION['successCode'] == true){
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "Store Code has been updated successfully!",
                        })
                    </script>
                <?php
                $_SESSION['successCode'] = false;
            }
        }

        if(!isset($_SESSION['successLogo'])){
        }else{
            if ($_SESSION['successLogo'] == true){
                ?>
                    <script>
                        swal({
                            icon: "success",
                            title: "Store Logo has been updated successfully!",
                        })
                    </script>
                <?php
                $_SESSION['successLogo'] = false;
            }
        }
    ?>

    <div id="admin-settings-con">
        <div class="top-con">
            <div class="title-con">
                <span>STORE SETTINGS</span>
            </div>
        </div>
        <div class="settings-con">
            <div class="left-con">
                <div class="logo-con">
                    <form action="./setting-logo.php" method="POST" enctype="multipart/form-data">
                        <p>Logo</p>
                        <img src="../images/logo/<?php echo $_SESSION['logo']; ?>" alt="">
                        <span><input type="file" class="form-control" id="inputLogo" name="inputLogo" autocomplete="off" accept="image/*"><input type="submit" id="submitLogo" class="btn btn-primary" value="SAVE" disabled></span>
                    </form>
                </div>
                <div class="set-con">
                    <form action="./setting-name.php" method="POST">
                        <p>Name</p>
                        <span><input type="text" class="form-control" id="inputName" name="inputName" value="<?php echo $name; ?>" autocomplete="off"><input type="submit" id="submitName" class="btn btn-primary" value="SAVE" disabled></span>
                    </form>
                </div>
                <div class="set-con">
                    <form action="./setting-location.php" method="POST">
                        <p>Location</p>
                        <span><input type="text" class="form-control" id="inputLocation" name="inputLocation" value="<?php echo $location; ?>" autocomplete="off"><input type="submit" id="submitLocation" class="btn btn-primary" value="SAVE" disabled></span>
                    </form>
                </div>
                <div class="set-con">
                    <form action="./setting-code.php" method="POST">
                        <p>Code</p>
                        <span><input type="text" class="form-control" id="inputCode" name="inputCode" value="<?php echo $code; ?>" autocomplete="off"><input type="submit" id="submitCode" class="btn btn-primary" value="SAVE" disabled></span>
                    </form>
                </div>
                <div class="backup-con">
                    <p>Backup Database</p>
                    <div class="button-con">
                        <button class="btn btn-primary" id="btnBackup">INITIATE BACKUP</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        function navF(){
            $('.setting').addClass('active');
            $('.setting').addClass('disabled');
        }

        $(document).ready(function(){
            const sName = <?php echo json_encode($name); ?>;
            const sLocation = <?php echo json_encode($location); ?>;
            const sCode = <?php echo json_encode($code); ?>;

            $('#inputLogo').change(function(){
                $('#submitLogo').attr('disabled', false);
            });
            $('#inputName').on('keyup',function(){
                if($(this).val() == sName){
                    $('#submitName').attr('disabled', true);
                }else{
                    $('#submitName').attr('disabled', false);
                }
            });
            $('#inputLocation').on('keyup',function(){
                if($(this).val() == sLocation){
                    $('#submitLocation').attr('disabled', true);
                }else{
                    $('#submitLocation').attr('disabled', false);
                }
            });
            $('#inputCode').on('keyup',function(){
                if($(this).val() == sCode){
                    $('#submitCode').attr('disabled', true);
                }else{
                    $('#submitCode').attr('disabled', false);
                }
            });


            $('#restoreFile').change(function(){
                $('#submitRestore').attr('disabled', false);
            });
            $('#btnBackup').click(function(){
                window.location.href = "./backup-database.php";
            });

            // $(document).on('keydown', function(e){
            //     if(e.keyCode == 13){
            //         e.preventDefault();
            //     }
            // });
        });
            
    </script>
    
</body>
</html>