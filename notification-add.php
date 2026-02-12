<?PHP  
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => false,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	/*=========== CODE START ===========*/
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "SAVE")
	{	
		extract($_POST);
		//echo "<pre>";print_r($_POST);die;
		
		if(empty($notification_id) && $notification_id == '')
		{
			
			$field = "title, message";
			$value = ":title, :message";
					
			$addExecute=array(
				':title'	=> $general_cls_call->specialhtmlremover($title),
				':message'	=> $general_cls_call->specialhtmlremover($message)
			);
		
			$general_cls_call->insert_query(NOTIFICATIONS, $field, $value, $addExecute);
			$sucMsg = "NotificatioN Created Successfully";
			
			//$erMsg = "Mobile number should be unique";
		}
		else
		{
			$setValues=" title=:title, message=:message";
			$updateExecute=array(
				':title'		=> $general_cls_call->specialhtmlremover($title),
				':message'	=> $general_cls_call->specialhtmlremover($message),
				':id'	    => $notification_id
			);
			$whereClause=" WHERE id = :id";
			$general_cls_call->update_query(NOTIFICATIONS, $setValues, $whereClause, $updateExecute);
			$sucMsg = "Vendor Updated Successfully";
		}
			
		
		
		
		//else{
			//$erMsg = "Mobile number should be unique";
		//}
	}
	
	if(isset($_GET['notification_id']) && $_GET['notification_id']!='')
	{
		$fieldsVen = "*";
		$whereVen = "WHERE id=:id";
		$paramsVen = [
			':id'=> $_GET['notification_id']
		 ];
		$sqlQueryVen = $general_cls_call->select_query($fieldsVen, NOTIFICATIONS, $whereVen, $paramsVen, 1);
	}
/*=========== CODE END ===========*/

	ob_end_flush();
	
?>

<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/header.php"); ?>
<!-- ######### HEADER END ############### -->
  
<!-- ######### HEADER START ############### -->
	<?PHP include_once("includes/adminMenu.php"); ?>
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
						<h5 class="mb-0 fw-bold">Notification</h5>
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
							
							<div class="col-md-8">
								<label for="input5" class="form-label">Title</label>
								<input type="text" class="form-control" name="title" id="title" placeholder="Title" required value="<?php echo isset($sqlQueryVen->title) ? $sqlQueryVen->title : $_POST['name'] ?>">
							</div>
							<div class="col-md-12">
								<label for="input5" class="form-label">Description</label>
								 <textarea class="form-control" id="description" name="message"><?php echo $sqlQueryVen->message; ?></textarea>
								 <span id="error_notification"></span>
							</div>
							<input type="hidden" value="<?php echo $_GET['notification_id'] ?>" name="notification_id">
							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<button type="reset" class="btn btn-outline-danger px-5">Reset</button>
									<button type="submit" name="btnUser" value="SAVE" class="btn btn-grd btn-grd-success px-5">Add Notification</button>
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
	<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
</body>

</html>
<script>
let editor;

ClassicEditor
    .create(document.querySelector('#description'))
    .then(newEditor => {
        editor = newEditor;
    });

document.querySelector('form').addEventListener('submit', function(e) {
    const data = editor.getData().trim();

    if (!data) {
        e.preventDefault();
       $('#error_notification').html('<span class="text-danger">Enter the description</span>');
    }
});
</script>

