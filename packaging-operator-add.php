<?PHP
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/

	ob_start();
	/*=========== START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnSubmit'])) && $_POST['btnSubmit'] === "SAVE")
	{	
		extract($_POST);
		$field = "username, email, password, role_id, status, created_by, created_at, updated_at";
		$value = ":username, :email, :password, :role_id, :status, :created_by, :created_at, :updated_at";
		$newHashPassword = password_hash(stripslashes(trim($password)), PASSWORD_BCRYPT);
		$addExecute=array(
			':username'		=> $general_cls_call->specialhtmlremover($name),
			':email'		=> $general_cls_call->specialhtmlremover($mobile),
			':password'		=> $general_cls_call->specialhtmlremover($newHashPassword),
			':role_id'		=> 5,
			':status'		=> 1,
			':created_by'	=> $_SESSION['USER_ID'],
			':created_at' 	=> date('Y-m-d H:i:s'),
			':updated_at'	=> date('Y-m-d H:i:s')
		);
		$current_insert_id = $general_cls_call->insert_query(ADMIN_MASTER, $field, $value, $addExecute);
		
		if($current_insert_id !='') {
			$field = "admin_id, name, mobile, street, status, created_at, updated_at";
			$value = ":admin_id, :name, :mobile, :street, :status, :created_at, :updated_at";
			$addExecute=array(
				':admin_id'		=> $current_insert_id,
				':name'			=> $general_cls_call->specialhtmlremover($name),
				':mobile'		=> $general_cls_call->specialhtmlremover($mobile),
				':street'		=> $general_cls_call->specialhtmlremover($street),
				':status'		=> 1,
				':created_at' 	=> date('Y-m-d H:i:s'),
				':updated_at'	=> date('Y-m-d H:i:s')
			);
			$general_cls_call->insert_query(PACKAGING_OPERATORS, $field, $value, $addExecute);
			$sucMsg = "Data Inserted Successfully";
			
		} else {
			$erMsg = "Please Fill All Fields";
		}
		
	}
	/*=========== END ===========*/
	ob_end_flush();
	
?>

<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/header.php"); ?>
<!-- ######### HEADER END ############### -->
  
<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/sellerMenu.php"); ?>
<!-- ######### HEADER END ############### -->

  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
		<div class="row">
           <div class="col-12 col-xl-12">
            <div class="card rounded-4 border-top border-4 border-primary border-gradient-1">
				<div class="card-body p-4">
					<div class="d-flex align-items-start justify-content-between mb-3">
					  <div class="">
						<h5 class="mb-0 fw-bold">Packaging Operator</h5>
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
						<form class="row g-4" action="" method="post">
							<div class="col-md-12">
								<label for="input1" class="form-label">Name</label>
								<input type="text" class="form-control" name="name" placeholder="Name" required>	
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Mobile</label>
								<input type="text" class="form-control" name="mobile" placeholder="Mobile/Username" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required maxlength="10">
							</div>
							<div class="col-md-6">
								<label for="input5" class="form-label">Password</label>
								<input type="password" class="form-control" name="password" placeholder="Password" required>
							</div>							
							<div class="col-md-12">
								<label for="input5" class="form-label">Address</label>
								<textarea name="street" class="form-control" required></textarea>
							</div>
							<div class="col-md-12">
							  <div class="d-md-flex d-grid justify-content-md-between">
								<input type="hidden" id="order_id" name="order_id">
								
								<button type="reset" class="btn btn-grd btn-grd-info px-4">Reset</button>
								<button type="submit" name="btnSubmit" value="SAVE" class="btn btn-grd btn-grd-primary px-5">Add Packaging Operator</button>
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
		<?PHP include_once("includes/footer.php"); ?>
	<!-- ######### FOOTER END ############### -->
</body>

</html>
<script>
</script>
