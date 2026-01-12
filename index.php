<?PHP error_reporting(0);
	include_once 'init.php';
	ob_start();

//echo DOMAIN_NAME;
/*=========== LOGIN QUERY START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnLogin'])))
	{
		extract($_POST);

		$user = $general_cls_call->select_query("username, password, id, role_id", ADMIN_MASTER, "WHERE email=:email", array(':email'=>$general_cls_call->specialhtmlremover($txtUser)), 1);
		if($user) 
		{
			if (password_verify($general_cls_call->specialhtmlremover($txtPassword), $user->password)) {
				$_SESSION['USER_ID'] = $user->id;
				$_SESSION['ROLE_ID'] = $user->role_id;
				$_SESSION['USERNAME'] = $user->username;
				if($_REQUEST['rem'] == "ON")
				{
					if($txtUser != "")
					{
					  setcookie ('userid1', " ",time()-(60*60*24*30));    //delete old cookies 58281044
					  setcookie ('userid1', $txtUser,time()+(60*60*24*30));  // "update" by adding a new 
					}
					if($txtPassword != "")
					{
					  setcookie ('password1', " ",time()-(60*60*24*30));    //delete old cookies
					  setcookie ('password1', $txtPassword,time()+(60*60*24*30));  // "update" by adding 
					}
				}
				else
				{
				   setcookie ('userid1', " ",time()-(60*60*24*30));
				   setcookie ('password1', " ",time()-(60*60*24*30));   
				}
				header("location:".SITE_URL."dashboard");
			}
			else
			{
				$msg = 'Invalid username or password.';
			}
		}  
		else
		{
			$msg = 'Invalid username or password.';
		}
	}

	if($_COOKIE['userid1'] != "")
	{
		$txtusername1 = $_COOKIE['userid1'];
		$strchked1 = "CHECKED";
	}
	else
	{
		$txtusername1 = "";
	}

	if($_COOKIE['password1'] != "")
	{
		$txtpassword1 = $_COOKIE['password1'];
		$strchked1 = "CHECKED";
	}
	else
	{
		$txtpassword1 = "";
	}
/*=========== LOGIN QUERY END ===========*/

ob_end_flush();
?>
<!doctype html>
<html lang="en" data-bs-theme="semi-dark">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Order Processing Software</title>
  <!--favicon-->
	<link rel="icon" href="assets/images/favicon-32x32.png" type="image/png">
  <!-- loader
	<link href="assets/css/pace.min.css" rel="stylesheet">
	<script src="assets/js/pace.min.js"></script>-->

  <!--plugins-->
  <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="assets/plugins/metismenu/metisMenu.min.css">
  <link rel="stylesheet" type="text/css" href="assets/plugins/metismenu/mm-vertical.css">
  <!--bootstrap css-->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Material+Icons+Outlined" rel="stylesheet">
  <!--main css-->
  <link href="assets/css/bootstrap-extended.css" rel="stylesheet">
  <link href="sass/main.css" rel="stylesheet">
  <link href="sass/dark-theme.css" rel="stylesheet">
  <link href="sass/blue-theme.css" rel="stylesheet">
  <link href="sass/responsive.css" rel="stylesheet">

  </head>

  <body>

    <!--authentication-->
    <div class="auth-basic-wrapper d-flex align-items-center justify-content-center">
      <div class="container-fluid my-5 my-lg-0">
        <div class="row">
           <div class="col-12 col-md-8 col-lg-6 col-xl-5 col-xxl-4 mx-auto">
            <div class="card rounded-4 mb-0 border-top border-4 border-primary border-gradient-1">
              <div class="card-body p-5">
                  <img src="assets/images/logo1.png" class="mb-4" width="145" alt="">
                  <h4 class="fw-bold">Get Started Now</h4>
                  <p class="mb-0">Enter your credentials to login your account</p>

                  <div class="form-body my-5">
				  <form action="#" name="frm" method="post" id="login-form" class="row g-3">
					<?PHP
						if(isset($msg) && $msg != '')
						{
					?>
						<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong><?PHP echo $Error_mesg; ?></strong> <?PHP echo $msg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					  </div>
					<?PHP
						}
					?>
								<div class="col-12">
									<label for="inputEmailAddress" class="form-label">Username</label>
									<input type="text" class="form-control" id="inputEmailAddress" name="txtUser" value="<?PHP echo $txtusername1; ?>" placeholder="Username" required>
								</div>
								<div class="col-12">
									<label for="inputChoosePassword" class="form-label">Password</label>
									<div class="input-group" id="show_hide_password">
										<input type="password" class="form-control border-end-0" id="inputChoosePassword" name="txtPassword" value="<?PHP echo $txtpassword1; ?>" placeholder="Enter Password" required> 
			  <a href="javascript:;" class="input-group-text bg-transparent"><i class="bi bi-eye-slash-fill"></i></a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" name="rem" value="ON" <?PHP echo $strchked1; ?>>
										<label class="form-check-label" for="flexSwitchCheckChecked">Remember Me</label>
									</div>
								</div>
								<!--<div class="col-md-6 text-end">	<a href="auth-basic-forgot-password.html">Forgot Password ?</a>
								</div>-->
								<div class="col-12">
									<div class="d-grid">
										<button type="submit" name="btnLogin" class="btn btn-grd btn-grd-primary px-5">Login</button>
									</div>
								</div>
							</form>
						</div>

              </div>
            </div>
           </div>
        </div><!--end row-->
     </div>
    </div>
    <!--authentication-->

	<!--bootstrap js-->
	<script src="assets/js/bootstrap.bundle.min.js"></script>
    <!--plugins-->
    <script src="assets/js/jquery.min.js"></script>

    <script>
      $(document).ready(function () {
        $("#show_hide_password a").on('click', function (event) {
          event.preventDefault();
          if ($('#show_hide_password input').attr("type") == "text") {
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass("bi-eye-slash-fill");
            $('#show_hide_password i').removeClass("bi-eye-fill");
          } else if ($('#show_hide_password input').attr("type") == "password") {
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass("bi-eye-slash-fill");
            $('#show_hide_password i').addClass("bi-eye-fill");
          }
        });
      });
    </script>
  
  </body>
</html>