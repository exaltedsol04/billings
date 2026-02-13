<?PHP 
	/*******Start Auth Section*******/
	$pageParam = [
		'dataTables' => true,
		'select2' => false,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [1]
	];
	include_once 'includes/authCheck.php';
	/*******End Auth Section*******/
	ob_start();
	if($_SERVER['REQUEST_METHOD'] == "POST" && (isset($_POST['btnUser'])) && $_POST['btnUser'] === "send_notification")
	{
		extract($_POST);
		//echo "<pre>";print_r($_POST);
		$ch = $fcm->sendUserNotification(
			$userId,
			"Title for the notification-30",
			"Body for the notification",
			[
				"screen" => "TEST notification"
			]
		);
		//echo $ch; die;
	}
	else{
		$whereSrc = "1";
		$paramsSrc = [];
	}
	
	/*if(!empty($_GET['vendor_id']) && $_GET['vendor_id'] !='')
	{
		
		$setValues="status=:status";
		$updateExecute=array(
			':status'	=> $_GET['status'],
			':id'	    => $_GET['vendor_id']
		);
		$whereClause=" WHERE id = :id";
		$general_cls_call->update_query(VENDORS, $setValues, $whereClause, $updateExecute);
		
		$sucMsg = "Status Updated Successfully";
	}*/
	
	/*$userId = 10;
	$fields = 'fcm_token';
	$tables = USER_TOKENS;
	$where = "WHERE user_id=:user_id ORDER BY id DESC";
	$params = [
		  ':user_id' => 10
	];*/
	
	/*$userId = 10;
	$ch = $fcm->sendUserNotification(
		$userId,
		"Title for the notification",
		"Body for the notification",
		[
			"screen" => "TEST notification"
		]
	);
	echo $ch;die;*/
	ob_end_flush();
?>
	<!-- ######### HEADER START ############### -->
		<?PHP include_once("includes/header.php"); ?>
	<!-- ######### HEADER END ############### -->
      
		<link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet">
		
	<!-- ######### MENU START ############### -->
		<?PHP include_once("includes/adminMenu.php"); ?>
	<!-- ######### MENU END ############### -->


  <!--start main wrapper-->
  <main class="main-wrapper">
    <div class="main-content">
      <!--breadcrumb-->
	            <div class="alert alert-danger border-0 bg-danger alert-dismissible fade show error-notification" style="display:none">
					<div class="text-white">Select Al Least One Checkbox</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3"><?php echo SITE_TITLE; ?></div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i> Notification List</a>
								</li>
							</ol>
						</nav>
					</div>
					
					
				</div>
				<!--end breadcrumb-->
				<span id="updatemsg"></span>
				<?PHP
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
				<div class="card">
				
					<div class="card-body">
					    <form class="row g-4" action="" method="post">
							<input type="hidden" name="userId" value="16">
							<div>
								<button type="button" class="btn btn-grd btn-grd-success px-2 openNotificationModal">Send notification</button>
								<button type="submit" value="send_notification" name="btnUser" class="btn btn-primary px-2 send_notification" style="float: right;">Send static notification</button>
							</div>
						</form>
						<div class="table-responsive mt-4">
							<table id="example2" class="table table-striped table-bordered">
								<thead>
									<tr>
										<td></td>
										<td><input type="text" class="form-control" id="search-one" placeholder="Search by Vendor"></td>
										<td><input type="text" class="form-control" id="search-two" placeholder="Search by name"></td>
										<td></td>
										<td></td>
									</tr>
								  <tr class="text-center">
									<th  style="white-space: nowrap;">All&nbsp;&nbsp;<input class="form-check-input" type="checkbox" id="checkAll"></th>
									<th style="width:100px">Sl. No.</th>
									<th>Title</th>
									<th>Description</th>
									<!--<th>Notification</th>-->
									<th>Action</th>
								  </tr>
								</thead>
								<tbody>
									<?php
									$fieldsVen = "*";
									$whereVen = "WHERE status!=:status";
									$paramsVen = [
										':status'=>2
									];
									
									$sqlQueryVen = $general_cls_call->select_query($fieldsVen, NOTIFICATIONS, $whereVen, $paramsVen, 2);
									//echo "<pre>";print_r($sqlQueryVen);die;
									if($sqlQueryVen[0] != '')
									{
										foreach($sqlQueryVen as $k=>$selectValue)
										{
											
									?>
									  <tr id="dataRow<?php echo($selectValue->id);?>" class="text-center">
										<td><input class="form-check-input row-checkbox" type="checkbox" value="<?php echo $selectValue->id;?>" id="packed_status"></td>
									    <td style="width:100px"><?php echo $k+1 ;?></td>
										<td style=""><?= (mb_strlen($selectValue->title) > 100) ? mb_substr($selectValue->title,0,100).'...' : $selectValue->title; ?></td>
										<td style=""><?= (mb_strlen($selectValue->message) > 100) ? mb_substr($selectValue->message,0,100).'...' : $selectValue->message; ?></td>
										<!--<td style=""><button type="button" class="btn btn-grd btn-grd-success px-5 send-notification" data-notification-id="<?php echo $selectValue->id; ?>">Send</button></td>-->
										
										<td>
											<div class="dropdown">
												<button class="btn btn-sm btn-filter dropdown-toggle dropdown-toggle-nocaret"
												  type="button" data-bs-toggle="dropdown">
												  <i class="bi bi-three-dots"></i>
												</button>
												<ul class="dropdown-menu">
												  <li><a href="<?php echo SITE_URL.'notification-add'; ?>?notification_id=<?php echo($selectValue->id);?>" class="dropdown-item" title="Click here to edit">Edit</a></li>
												  <li><a href="javascript:void(0);" class="dropdown-item" title="Click here to delete"  onclick="deleteData('<?PHP echo NOTIFICATIONS; ?>', <?PHP echo $selectValue->id; ?>)">Delete</a></li>
												</ul>
											</div>
										</td>
									</tr>
										<?PHP
											$i++;
										}
									}
										
									?>
									  
								</tbody>
							</table>
						</div>
					</div>
				</div>
    </div>
  </main>
  <!--end main wrapper-->
	<div class="modal fade" id="userListModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header border-bottom-0 py-2 bg-grd-success">
					<h5 class="modal-title btn-grd">Payment Mode</h5>
					<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
						<i class="material-icons-outlined">close</i>
					</a>
				</div>
				<div class="modal-body">
					<div class="form-body">
						<div class="row g-3">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="card w-100 mb-0 shadow-none">
								  <div class="card-header border-0 p-3 border-bottom">
									<div class="position-relative">
									  <input class="form-control rounded-5 px-5" type="text" id="userSearch" placeholder="Search by name or email">
									  <span class="material-icons-outlined position-absolute ms-3 translate-middle-y start-0 top-50">search</span>
									  <span class="material-icons-outlined position-absolute me-3 translate-middle-y end-0 top-50">people</span>
									</div>
								  </div>
								  <div class="card-body p-0">
									<div class="user-list p-3">
									  <div class="d-flex flex-column gap-3" id="userListContainer">
									  
									  </div>
									</div>
								  </div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="d-md-flex d-grid justify-content-md-between">
									<!--<button type="button" class="btn btn-outline-danger px-5" data-bs-dismiss="modal">Cancel</button>-->
									<button type="button" class="btn btn-primary px-5" id="sendAllUsers">Send All</button>
									<button type="button" class="btn btn-grd btn-grd-success px-5" id="sendSelectedUsers">Send Selected</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--end main wrapper-->
<!-- ######### FOOTER START ############### -->
	<?PHP include_once("includes/footer.php"); ?>
<!-- ######### FOOTER END ############### -->
<script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<script>
  new PerfectScrollbar(".user-list")
</script>
<script>
const checkAll = document.getElementById('checkAll');

function getCheckboxes() {
    return document.querySelectorAll('.row-checkbox');
}
checkAll.addEventListener('change', function () {
    getCheckboxes().forEach(cb => cb.checked = this.checked);
});

document.addEventListener('change', function(e) {
    if (e.target.classList.contains('row-checkbox')) {
        const checkboxes = getCheckboxes();
        const allChecked = [...checkboxes].every(cb => cb.checked);
        checkAll.checked = allChecked;
    }
});
</script>
<script>
$(document).ready(function(){
	if ($.fn.DataTable.isDataTable('#example2')) {
		$('#example2').DataTable().destroy();
	}
	
	$('#example2').DataTable({
		order: [[2, 'desc']],
		columnDefs: [
        {
            targets: 0,        // 1st column
            orderable: true,  // allow manual ordering
            orderSequence: ['asc', 'desc'] // manual toggle only
        }
    ] 
	});
	
	$(document).on('click', '.send_notification', function(){
		let selectedNotificationIds = [];

		$('.row-checkbox:checked').each(function () {
			selectedNotificationIds.push($(this).val());
		});

		if (selectedNotificationIds.length === 0) {
			//alert('Please select at least one notification');
			$('.error-notification').show();
			return;
		}
	});
	$(document).on('click', '.openNotificationModal', function(){
		let selectedNotificationIds = [];

		$('.row-checkbox:checked').each(function () {
			selectedNotificationIds.push($(this).val());
		});

		if (selectedNotificationIds.length === 0) {
			//alert('Please select at least one notification');
			$('.error-notification').show();
			return;
		}
		$('#userListModal').modal('show');
	});

	$(document).on('click', '.send-notification', function () {

		let notificationId = $(this).data('notification-id');

		$.ajax({
			url: "<?PHP echo SITE_URL; ?>ajax",
			type: "POST",
			data: {
				action: "sendNotification",
                type: 'all',
				notification_ids: [notificationId]
			},
			success: function (response) {
				alert('Notification sent to all users successfully');
			}
		});
	});

	// Load users initially
    loadUsers('');
	
	function loadUsers(search = '') {
		var datapost = 'action=searchUsersList&search='+search;
        $.ajax({
            type: "POST",
			url: "<?PHP echo SITE_URL; ?>ajax",
			data: datapost,
            success: function(response) {
                $('#userListContainer').html(response);
            }
        });
    }
	
	// Search on typing
    $('#userSearch').on('keyup', function(){
        let searchValue = $(this).val();
        loadUsers(searchValue);
    });
	
	// SEND ALL USERS
    $('#sendAllUsers').click(function(){
		let selectedNotificationIds = [];
		$('.row-checkbox:checked').each(function () {
			selectedNotificationIds.push($(this).val());
		});
		if (selectedNotificationIds.length === 0) {
			$('.error-notification').show();
			return;
		}
		
        let searchValue = $('#userSearch').val();

        $.ajax({
            url: "<?PHP echo SITE_URL; ?>ajax",
            type: 'POST',
            data: {
                action: 'sendNotification',
                type: 'all',
				notification_ids: selectedNotificationIds,
                search: searchValue
            },
            success: function(response){
                alert('Notification sent to all users');
                $('#userListModal').modal('hide');
            }
        });
    });

    // SEND SELECTED USERS
    $('#sendSelectedUsers').click(function(){
		let selectedNotificationIds = [];
		$('.row-checkbox:checked').each(function () {
			selectedNotificationIds.push($(this).val());
		});
		if (selectedNotificationIds.length === 0) {
			$('.error-notification').show();
			return;
		}
		
        let selectedUsers = [];
        $('.user-checkbox:checked').each(function(){
            selectedUsers.push($(this).val());
        });
        if(selectedUsers.length === 0){
            alert('Please select at least one user');
            return;
        }

        $.ajax({
            url: "<?PHP echo SITE_URL; ?>ajax",
            type: 'POST',
            data: {
                action: 'sendNotification',
                type: 'selected',
				notification_ids: selectedNotificationIds,
                user_ids: selectedUsers
            },
            success: function(response){
                alert('Notification sent to selected users');
                $('#userListModal').modal('hide');
            }
        });
    });
});

</script>
</body>
</html>