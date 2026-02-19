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
			if($_FILES['image']['tmp_name']!='') {
				// $rand = substr(number_format(time() * rand(),0,'',''),0,6);
				$file_name=$_FILES['image']['name'];
				$explode = explode(".",$file_name);
				$filename=time().".".strtolower($explode[count($explode)-1]);			
				$general_cls_call->uploadImage($_FILES["image"], 'images/notification/', $filename);
			}
			
			$field = "title, message, image";
			$value = ":title, :message, :image";
					
			$addExecute=array(
				':title'	=> $general_cls_call->specialhtmlremover($title),
				':message'	=> $general_cls_call->specialhtmlremover($message),
				':image'	=> $general_cls_call->specialhtmlremover($filename)
			);
		
			$general_cls_call->insert_query(NOTIFICATIONS, $field, $value, $addExecute);
			$sucMsg = "NotificatioN Created Successfully";
			
			//$erMsg = "Mobile number should be unique";
		}
		else
		{
			$whereft = "WHERE id=".$_GET['notification_id'];
			$ft = $general_cls_call->select_query("*", NOTIFICATIONS, $whereft, array(), 1);
			if($_FILES['image']['tmp_name']!='') {
				if($ft->image!='') {	
					$unlink_photo_path1 = 'images/notification/'.$ft->image;	
					if(file_exists($unlink_photo_path1)){ unlink($unlink_photo_path1); }
				}
				// $rand = substr(number_format(time() * rand(),0,'',''),0,6);
				$file_name=$_FILES['image']['name'];
				$explode = explode(".",$file_name);
				$filename=time().".".strtolower($explode[count($explode)-1]);
				$general_cls_call->uploadImage($_FILES["image"], 'images/notification/', $filename);
			} else {
				$filename = $txtHidden;
			}
			
			$setValues=" title=:title, message=:message, image=:image";
			$updateExecute=array(
				':title'		=> $general_cls_call->specialhtmlremover($title),
				':message'	=> $general_cls_call->specialhtmlremover($message),
				':image'	=> $general_cls_call->specialhtmlremover($filename),
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
						<form class="row g-4" action="" method="post" enctype="multipart/form-data">
							
							<div class="col-md-8">
								<label for="input5" class="form-label">Title</label>
								<input type="text" class="form-control" name="title" id="title" placeholder="Title" required value="<?php echo isset($sqlQueryVen->title) ? $sqlQueryVen->title : $_POST['name'] ?>">
							</div>
							<div class="col-md-12">
								<label for="input5" class="form-label">Description</label>
								 <textarea class="form-control" id="description" name="message"><?php echo $sqlQueryVen->message; ?></textarea>
								 <span id="error_notification"></span>
							</div>
							<div class="col-md-6">
								<label class="form-label">Image</label>
								<input class="form-control" type="file" name="image" accept="image/x-png,image/gif,image/jpeg"  onchange="readImage(this);">
								<?PHP if($sqlQueryVen->image!='') { ?>
									<img id="prevImage" class="mt-2" src="<?PHP echo 'images/notification/'.$sqlQueryVen->image; ?>" style="height:150px;width:150px;" />
									<input type="hidden" name="txtHidden" value="<?PHP echo $sqlQueryVen->image; ?>">
								<?PHP }else{ ?>
								<img id="prevImage" class="mt-2" src="#" style="height:150px;width:150px;">
								<?PHP } ?>
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
<script>
function readImage(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('#prevImage').attr('src', e.target.result).width(150).height(150);
		};

		reader.readAsDataURL(input.files[0]);
	}
}
</script>

