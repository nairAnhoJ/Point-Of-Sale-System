<?php
    session_start();
    include("./db/conn.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./bootstrap-5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="./styles/styles.css?v=<?php echo time(); ?>">
    <title>Login</title>

    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="./js/sweetalert2.all.min.js"></script>
    <script crossorigin src="./js/react.production.min.js"></script>
    <script crossorigin src="./js/react-dom.production.min.js"></script>
</head>
<body id="login-body">

    <?php
        if(!isset($_SESSION['errMes'])){
        }else{
            if ($_SESSION['errMes'] == 'true'){
                ?>
                    <script>
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Incorrect Username or Password.',
                        });
                    </script>
                <?php
                session_destroy();
                session_unset();
            }
        }
    ?>

    <div class="login-container">
        RolNette's Store
        <div class="login-inner-container">
            <div class="w-100 text-center mt-4 mb-3">
                <span class="fs-1 fw-bolder">SIGN IN</span>
            </div>
            <div class="w-100 px-5">
                <form action="./login-check.php" method="POST">
                    <div class="mb-4">
                        <label for="InputUsername" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="InputUsername" required autocomplete="off">
                    </div>
                    <div class="mb-4">
                        <label for="InputPassword" class="form-label">Password</label>
                        <input type="password" name="userpass" class="form-control" id="InputPassword" required>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>