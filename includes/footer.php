<!--start overlay-->
    <div class="overlay btn-toggle"></div>
    <!--end overlay-->


     <!--start footer-->
     <footer class="page-footer">
      <p class="mb-0">Copyright © <?PHP echo date('Y'); ?> <a href="<?php echo SITE_URL; ?>"><?php echo SITE_TITLE; ?></a>. All right reserved.</p>
    </footer>
	
	<!--delete modal-->
	<div class="modal fade" id="confirmDelete">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2 bg-grd-warning">
			<h5 class="modal-title btn-grd">Confirmation modal</h5>
			<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
			  <i class="material-icons-outlined">close</i>
			</a>
		  </div>
		  <div class="modal-body">
			<div class="form-body">
				<div class="row g-3">
				<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="card-body text-center">
							 <h5>Are you sure to delete ?</h5>
						   <input type="hidden" id="recordId">
						   <input type="hidden" id="recordTable">
						</div>
				</div>
				<div class="col-md-12">
				<div class="d-md-flex d-grid justify-content-md-between">
					<button type="button" class="btn btn-outline-danger px-5" data-bs-dismiss="modal">Cancel</button>
					<button type="button" id="deleteConfirm" class="btn btn-grd btn-grd-danger px-5">Delete</button>
				 </div>
			  </div>
			  </div>
			</div>
		</div>
		
		  
		</div>
	  </div>
	</div>
    <!--top footer-->
	<!--bootstrap js-->
	<script src="assets/js/bootstrap.bundle.min.js"></script>

	<!--plugins-->
	<script src="assets/js/jquery.min.js"></script>
	<!--plugins-->
	<!--<script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>-->
	<script src="assets/plugins/metismenu/metisMenu.min.js"></script>
	<?php if (!empty($pageParam['dataTables'])) {  ?>
		<script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
	<?php } if (!empty($pageParam['select2'])) {  ?>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
		<script src="assets/plugins/select2/js/select2-custom.js"></script>
	<?php } ?>
	
	<script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script src="assets/js/main.js"></script>

    <script>
	$(function () {
		$('[data-bs-toggle="tooltip"]').tooltip();
		<?php if (!empty($pageParam['dataTables'])) {  ?>
		
			var table = $('#example2').DataTable( {
				lengthChange: false,
				buttons: [ 'copy', 'excel', 'pdf', 'print']
			} );
			$('#search-zero').on('keyup', function(){    
				table.column(0).search(this.value).draw();
			});
			$('#search-one').on('keyup', function(){    
				table.column(1).search(this.value).draw();
			});
			$('#search-two').on('keyup', function(){    
				table.column(2).search(this.value).draw();
			});
			$('#search-five').on('keyup', function(){    
				table.column(5).search(this.value).draw();
			});
			table.buttons().container()
				.appendTo( '#example2_wrapper .col-md-6:eq(0)' );
		<?php } ?>
	});
	
	function deleteData(TABLE, ID) {
		$('#confirmDelete').modal("show");
		$('#recordTable').val(TABLE);
		$('#recordId').val(ID);
		
		$('#deleteConfirm').one('click', function () {
		
		var table 	= $('#recordTable').val();
		var id 		= $('#recordId').val();
		if(table!='' && id!=''){
			var datapost = 'action=updatedelete&table='+table+'&id='+id;
			//alert(datapost);
			$.ajax({
					type: "POST",
					url: "<?PHP echo SITE_URL; ?>ajax",
					data: datapost,
					success: function(d){
						//alert(d);
					   
					  $("#updatemsg").html('<div class="alert alert-success border-0 bg-success alert-dismissible fade show"><div class="text-white"><strong>Success</strong> Success! Data deleted successfully</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
					  
					   setTimeout(() => {
							window.location.reload();
						}, "2000");
					   
					   $('#confirmDelete').modal("hide");
					}
				});
			}
		});
	}
	
	function status_change(TABLE, ID) {
		//alert(TABLE);alert(ID);
		var datapost = 'action=updatestatus&table='+TABLE+'&id='+ID;
		$.ajax({
			type: "POST",
			url: "<?PHP echo SITE_URL; ?>ajax",
			data: datapost,
			success: function(d){
				//alert(d);
			   
			  $("#updatemsg").html('<div class="alert alert-success border-0 bg-success alert-dismissible fade show"><div class="text-white"><strong>Success</strong> Success! Status updated successfully</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
			  
			   setTimeout(() => {
					window.location.reload();
				}, "2000");
			}
		});
	}
	
</script>