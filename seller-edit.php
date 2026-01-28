<?PHP  error_reporting(0);
	include_once 'init.php';
	$pageAccessRoleIds = [1,3];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	ob_start();
	/*=========== ACCOUNT SETTINGS START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		
			
		$setValues="name=:name, store_name=:store_name, email=:email, mobile=:mobile";
		$updateExecute=array(
			':name'	=>$general_cls_call->specialhtmlremover($name),
			':store_name' =>$general_cls_call->specialhtmlremover($store_name),
			':email' =>$general_cls_call->specialhtmlremover($email),
			':mobile' =>$general_cls_call->specialhtmlremover($mobile)
		);
		$whereClause=" WHERE id=".$_GET['seller_id'];
		$general_cls_call->update_query(SELLERS, $setValues, $whereClause, $updateExecute);
		$sucMsg = "Seller has been updated successfully.";
		// password update
		$seller_data = $general_cls_call->select_query("admin_id", SELLERS, "WHERE id=:id", array(':id'=>$_GET['seller_id']), 1);
		if($txtNewPassword)
		{
			$newHashPassword = password_hash(stripslashes(trim($txtNewPassword)), PASSWORD_BCRYPT);
			
			//$password=isset($txtNewPassword) && $txtNewPassword != "" ? $newHashPassword : $hidPassword; 

			$setPassValues="password=:password";
			$updatePassExecute=array(
				':password'	=>$general_cls_call->specialhtmlremover($newHashPassword)
			);
			$wherePassClause=" WHERE id=".$seller_data->admin_id;
			$general_cls_call->update_query(ADMIN_MASTER, $setPassValues, $wherePassClause, $updatePassExecute);
			//$sucMsg = "Seller has been updated successfully.";
		}
	}
/*=========== ACCOUNT SETTINGS END ===========*/
/*=========== SELECT QUERY START ===========*/
	$sellerVal=$general_cls_call->select_query("*", SELLERS, "WHERE id=:id", array(':id'=>$_GET['seller_id']), 1);
	//echo "<pre>";print_r($sellerVal);die;
/*=========== SELECT QUERY END ===========*/


	if(!isset($_POST['name'])) { $_POST['name'] =	$sellerVal->name; }
	if(!isset($_POST['email'])) { $_POST['email'] =	$sellerVal->email; }
	if(!isset($_POST['mobile'])) { $_POST['mobile'] =	$sellerVal->mobile; }
	if(!isset($_POST['store_name'])) { $_POST['store_name'] = $sellerVal->store_name; }
	
	
	ob_end_flush();
?>

<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/adminHeader.php"); ?>
<!-- ######### HEADER END ############### -->
  
<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/adminMenu.php"); ?>
<!-- ######### HEADER END ############### -->

  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Seller</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
      

       

        <div class="row">
           <div class="col-12 col-xl-12">
            <div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
              <div class="card-body p-4">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h5 class="mb-0 fw-bold">Edit Seller<h5>
                  </div>
                  
                 </div>
					<?PHP
						if(isset($erMsg) && $erMsg != '')
						{
					?>
						<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
							<div class="text-white"><strong><?PHP echo $Error_mesg; ?></strong> <?PHP echo $erMsg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
						if(isset($sucMsg) && $sucMsg != '')
						{
					?>
						<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
							<div class="text-white"><strong>Success</strong> <?PHP echo $sucMsg; ?></div>
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<?PHP
						}
					?>
								<form class="row g-4" method="post">
									<div class="col-md-12">
										<label for="input1" class="form-label">Name</label>
										<input type="text" class="form-control" id="input1" placeholder="Name" name="name" value="<?php echo $_POST['name']; ?>" required>
									</div>
									<div class="col-md-12">
										<label for="input1" class="form-label">Email</label>
										<input type="email" class="form-control" id="input1" placeholder="Email" name="email" value="<?php echo $_POST['email']; ?>" required>
									</div>
									<div class="col-md-12">
										<label for="input1" class="form-label">Mobile</label>
										<input type="text" class="form-control" id="input1" placeholder="Mobile" name="mobile" value="<?php echo $_POST['mobile']; ?>" required>
									</div>
									<div class="col-md-12">
										<label for="input1" class="form-label">Store Name</label>
										<input type="text" class="form-control" id="input1" placeholder="Store Name" name="store_name" value="<?php echo $_POST['store_name']; ?>" required>
									</div>
									<div class="col-md-12">
										<label for="input5" class="form-label">New Password</label>
										<input type="password" name="txtNewPassword" class="form-control" id="input5">
										<input type="hidden" name="hidPassword" value="<?PHP echo $_POST['hidPassword']; ?>">
									</div>
									<div class="col-md-12">
										<div class="d-md-flex d-grid align-items-center gap-3">
											<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-primary px-5">Update Seller</button>
										</div>
									</div>
								</form>
							</div>
            </div>
           </div> 
           
        </div><!--end row-->
       


    </div>
  </main>
  <!--end main wrapper-->
	<!-- ######### FOOTER START ############### -->
		<?PHP include_once("includes/adminFooter.php"); ?>
	<!-- ######### FOOTER END ############### -->
	

    


</body>

</html>