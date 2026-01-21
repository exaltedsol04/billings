<!--start overlay-->
    <div class="overlay btn-toggle"></div>
    <!--end overlay-->


     <!--start footer-->
     <footer class="page-footer">
      <p class="mb-0">Copyright © <?PHP echo date('Y'); ?> <a href="<?php echo SITE_URL; ?>"><?php echo SITE_TITLE; ?></a>. All right reserved.</p>
    </footer>
    <!--top footer-->
	<!--bootstrap js-->
	<script src="assets/js/bootstrap.bundle.min.js"></script>

	<!--plugins-->
	<script src="assets/js/jquery.min.js"></script>
	<!--plugins-->
	<!--<script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>-->
	<script src="assets/plugins/metismenu/metisMenu.min.js"></script>
	<?php if($page=='products.php' || $page=='invoices.php' || $page=='purchase-approved-list.php' || $page=='purchase-rejected-list.php' || $page=='purchase-report.php' || $page=='purchase-request.php' || $page=='purchase-request-list.php' || $page=='stock-transfer.php' || $page=='pos.php' || $page=='available-stock-report.php' || $page=='barcode.php' || $page=='sellers.;php' || $page=='approved-purchase-report.php' || $page=='available-online-report.php' || $page=='purchase-stock-list.php') {  ?>
		<script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
	<?php } if($page=='purchase-request.php' || $page=='stock-transfer.php' || $page=='products.php' || $page=='pos.php' || $page=='online-stock-transfer.php' || $page=='purchase-stock-add.php') {  ?>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
		<script src="assets/plugins/select2/js/select2-custom.js"></script>
	<?php } ?>
	
	<script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script src="assets/js/main.js"></script>

    <script>
	$(function () {
		$('[data-bs-toggle="tooltip"]').tooltip();
		<?php if($page=='products.php' || $page=='invoices.php' || $page=='purchase-approved-list.php' || $page=='purchase-rejected-list.php' || $page=='purchase-report.php' || $page=='purchase-request.php' || $page=='purchase-request-list.php' || $page=='stock-transfer.php' || $page=='pos.php' || $page=='available-stock-report.php' || $page=='barcode.php' || $page=='sellers.;php' || $page=='barcode.php' || $page=='approved-purchase-report.php' || $page=='available-online-report.php'  || $page=='purchase-stock-add.php' || $page=='purchase-stock-list.php') {  ?>
		
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
	
</script>