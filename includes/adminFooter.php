<!--start overlay-->
    <div class="overlay btn-toggle"></div>
    <!--end overlay-->


     <!--start footer-->
     <footer class="page-footer">
      <p class="mb-0">Copyright © <?PHP echo date('Y'); ?> <a href="<?php echo SITE_URL; ?>"><?php echo SITE_TITLE; ?></a>. All right reserved.</p>
    </footer>
    <!--top footer-->
	<?php if($page=='purchases.php') {  ?>	
	<!-----------modal for delete--->
	
	
	<div class="modal fade" id="confirmDelete">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header border-bottom-0 py-2">
			<h5 class="modal-title">Confirmation</h5>
			<a href="javascript:;" class="primaery-menu-close" data-bs-dismiss="modal">
			  <i class="material-icons-outlined">close</i>
			</a>
		  </div>
		  <div class="modal-body">
			Are you sure to delete ?
			<input type="hidden" id="recordId">
		   <input type="hidden" id="recordTable">
		   <input type="hidden" id="rowCountId">
		  </div>
		  <div class="modal-footer border-top-0">
			<button type="button" class="btn btn-grd btn-grd-danger" data-bs-dismiss="modal">Cancel</button>
			<button type="button" class="btn btn-grd btn-grd-info" id="deleteConfirm">Delete</button>
		  </div>
		</div>
	  </div>
	</div>
				
	<!--  MODAL FOR delete--->
	<?php } ?>
	<!--bootstrap js-->
	<script src="assets/js/bootstrap.bundle.min.js"></script>

	<!--plugins-->
	<script src="assets/js/jquery.min.js"></script>
	<!--plugins-->
	<!--<script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>-->
	<script src="assets/plugins/metismenu/metisMenu.min.js"></script>
	<?php if($page=='products.php' || $page=='invoices.php' || $page=='purchases.php' || $page=='purchase-request.php') {  ?>
		<script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
	<?php if($page=='purchase-request.php') {  ?>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
		<script src="assets/plugins/select2/js/select2-custom.js"></script>
	<?php } ?>
	
	<script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script src="assets/js/main.js"></script>

    <script>
	<?php if($page=='purchases.php') {  ?>	
	function deleteData(TABLE, ID) {
		$('#confirmDelete').modal("show");
		$('#recordTable').val(TABLE);
		$('#recordId').val(ID);
		
		$('#deleteConfirm').one('click', function () {
		//Total amount calculation start(Daily-ac-ex list,Payment received list,Send invoice list)
			
		var table 	= $('#recordTable').val();
		var id 		= $('#recordId').val();
		if(table!='' && id!=''){
			var datapost = 'action=deleteRecord&table='+table+'&id='+id;
			//alert(datapost);
			$.ajax({
					type: "POST",
					url: "<?PHP echo SITE_URL; ?>ajax",
					data: datapost,
					success: function(d){
						//alert(d);
					   $("#dataRow"+id).remove();
					   
					   $("#msg").html('<div class="alert alert-success border-0 bg-success alert-dismissible fade show"><div class="text-white"><strong>Success!</strong> Data deleted successfully.</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
					   
					   $('#confirmDelete').modal("hide");
					}
				});
			}
		});
	}
	function deleteApprovedData(TABLE, ID) {
		$('#confirmDelete').modal("show");
		$('#recordTable').val(TABLE);
		$('#recordId').val(ID);
		
		$('#deleteConfirm').one('click', function () {
		//Total amount calculation start(Daily-ac-ex list,Payment received list,Send invoice list)
			
		var table 	= $('#recordTable').val();
		var id 		= $('#recordId').val();
		if(table!='' && id!=''){
			var datapost = 'action=deleteRecord&table='+table+'&id='+id;
			//alert(datapost);
			$.ajax({
					type: "POST",
					url: "<?PHP echo SITE_URL; ?>ajax",
					data: datapost,
					success: function(d){
						//alert(d);
					   $("#dataARow"+id).remove();
					   
					   $("#msg").html('<div class="alert alert-success border-0 bg-success alert-dismissible fade show"><div class="text-white"><strong>Success!</strong> Data deleted successfully.</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
					   
					   $('#confirmDelete').modal("hide");
					}
				});
			}
		});
	}
	<?php } ?>
	$(function () {
		<?php if($page=='purchases.php') {  ?>
		$('[data-bs-toggle="tooltip"]').tooltip();
		<?php } if($page=='products.php' || $page=='invoices.php' || $page=='purchases.php' || $page=='purchase-request.php') {  ?>
		
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
			$('#search-five').on('keyup', function(){    
				table.column(5).search(this.value).draw();
			});
			table.buttons().container()
				.appendTo( '#example2_wrapper .col-md-6:eq(0)' );
				
		<?php } if($page=='purchases.php') {  ?>		
			var table1 = $('#example1').DataTable( {
				lengthChange: false,
				buttons: [ 'copy', 'excel', 'pdf', 'print']
			} );
			$('#search-zero1').on('keyup', function(){    
				table1.column(0).search(this.value).draw();
			});
			$('#search-one1').on('keyup', function(){    
				table1.column(1).search(this.value).draw();
			});
			$('#search-five1').on('keyup', function(){    
				table1.column(5).search(this.value).draw();
			});
			table1.buttons().container()
				.appendTo( '#example1_wrapper .col-md-6:eq(0)' );
		<?php } ?>
	});
		/*$(".select2").select2();
		$('#table1, #table2').DataTable({
			'responsive'	: true,
			"sScrollX"		: true,
			'paging'      	: true,
			'lengthChange'	: true,
			'searching'   	: true,
			'ordering'    	: false,
			'info'        	: true,
			'autoWidth'   	: false  
		});
		$('#example1').DataTable({
			"sScrollX": true,
			'paging'      : true,
			'lengthChange': true,
			'searching'   : false,
			'ordering'    : false,
			'info'        : true,
			'autoWidth'   : false  
		});*/
    /*$('#example2').DataTable({
	  "sScrollX": true,
      'paging'      : true,
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : false,
      'info'        : true,
      'autoWidth'   : false
    })
    $('#example3').DataTable({
		"sScrollX": true,
      'paging'      : false,
      'lengthChange': true,
      'searching'   : false,
      'ordering'    : false,
      'info'        : false,
      'autoWidth'   : false
    })
    $('#example4').DataTable({
		"sScrollX": true,
      'paging'      : false,
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : false,
      'info'        : false,
      'autoWidth'   : false
    })
  })
   //Date picker
    $('#datepicker,#supply_date').datepicker({
	  dateFormat: "dd/mm/yy",
	  changeYear: true,
	  changeMonth: true,
	  onSelect: function() {
		  $(this).focus();
	  }
    })

	$(document).ready(function() {
		$('#dateFrom').val('<?php echo isset($_POST['dateFrom']) ? $_POST['dateFrom'] : ''; ?>');
		$('#dateTo').val('<?php echo isset($_POST['dateTo']) ? $_POST['dateTo'] : ''; ?>');
	});
	$('#dateFrom').datepicker({
		dateFormat: "dd/mm/yy",
		changeYear: true,
		changeMonth: true,
		onSelect: function (date) {
			var date2 = $('#dateFrom').datepicker('getDate');
			date2.setDate(date2.getDate());
			$('#dateTo').datepicker('setDate', date2);
			$('#dateTo').datepicker('option', 'minDate', date2);
		}
    });
	$('#dateTo').datepicker({
		dateFormat: "dd/mm/yy",
		changeYear: true,
		changeMonth: true
    });
	//start for delete record
	$(document).on("click", ".delModal", function () {
        var rowId = $(this).data('id');
        $(".modal-body #rowId").val( rowId );
        $('#delModal').modal('show');
    });*/
	<?php if($page=='products.php333') {  ?>	
    $(document).on("click", "#delRow", function () {
        var rowId = $("#rowId").val();
        var res = rowId.split("-");
        var id  = res[0];
        var c  = res[1];
        var t  = res[2];
        $.ajax({
            type: "POST",
            url: "ajax.php",
            data:{
                action: 'delete_more_material',
                id: id,
                table: t
            },
            success: function(d){
                if(d!='') {
                    $("#dataRow" + c).remove();
                    $("#msg").html(d);
					
					var sum = 0;
					$(".total_amount").each(function(){
						sum += +$(this).val();
					});
					$("#tot_amt").html(sum.toFixed(2));
                }
            }
        });
        $('#delModal').modal('hide');
    });
	<?php } ?>
    //end for delete record
	//FOR SELECT2 AUTO FOCUS START	
		/*$(document).on('focus', '.select2', function (e) {
			if (e.originalEvent) {
				var s2element = $(this).siblings('select');
				s2element.select2('open');
				// Set focus back to select2 element on closing.
				s2element.on('select2:closing', function (e) {
					s2element.select2('focus');
			   });
			}
		}); */
	//FOR SELECT2 AUTO FOCUS END
</script>