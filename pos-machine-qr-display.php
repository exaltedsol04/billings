<?php
include_once 'init.php';
$pageParam = [
		'dataTables' => true,
		'select2' => true,
		'daterangepicker' => false,
		'pageAccessRoleIds' => [3]
	];

$machine = $general_cls_call->select_query("id,machine_id", POS_MACHINE, "WHERE status=:status", array(':status'=>1), 2);
//echo "<pre>";print_r($machine);die;
?>

<!DOCTYPE html>
<html>
<head>
<title>POS QR Display</title>
<style>
body{
    font-family: Arial;
    text-align:center;
    margin-top:50px;
}

.info-row{
    display:flex;
    justify-content:center;
    margin:8px 0;
}

.label{
    width:150px;
    font-weight:bold;
    text-align:left;
    margin-right:10px;
}
.custom-select {
    width: 100%;
    padding: 10px 14px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 6px;
    background-color: #fff;
    cursor: pointer;
    outline: none;
    transition: 0.3s ease;
}

/* Hover */
.custom-select:hover {
    border-color: #28a745;
}

/* Focus */
.custom-select:focus {
    border-color: #28a745;
    box-shadow: 0 0 5px rgba(40, 167, 69, 0.4);
}


</style>
</head>
<body>

<h2>Scan to Pay</h2>

	<div class="info-row">
		<div class="label">Select mechine :</div>
		<div>
			<select class="custom-select"  tabindex="1" onchange="select_machine_id(this.value)">
				<option value="">Select machine</option>
				<?php 
				foreach($machine as $val)
				{
				?>
					<option value="<?php echo  $val->machine_id ;?>"><?php echo  $val->machine_id ;?></option>
				<?php 
				}
				?>
			</select>
		</div>
	</div>
<span id="show-div" style="display:none">
	<div class="info-row">
		<div class="label">Order :</div>
		<div><span id="orderid"></span></div>
	</div>

	<div class="info-row">
		<div class="label">Amount :</div>
		<div><span id="amt"></span></div>
	</div>

	<div style="margin-top:20px;">
		<img id="qr" width="300">
	</div>
</span>
<script>


const machineId = new URLSearchParams(window.location.search).get('machine_id');

function loadQR(){
 fetch("<?PHP echo SITE_URL; ?>api/razorpay/get-latest-qr?machine_id=" + machineId)
 .then(r=>r.json())
 .then(data=>{
	 console.log(data.qr_url);
    if(data.qr_url){
		//alert(data.total_amount);
		document.getElementById("show-div").style.display = "block";
        document.getElementById("qr").src =
        "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data="
        + encodeURIComponent(data.qr_url);
		
		//document.getElementById("machid").innerHTML  = machineId;
		document.getElementById("orderid").innerHTML  = data.id;
		document.getElementById("amt").innerHTML  = data.total_amount;
    }
	else{
		document.getElementById("show-div").style.display = "none";
        document.getElementById("qr").src = "";
        document.getElementById("orderid").innerHTML = "";
        document.getElementById("amt").innerHTML = "";
	}
 }).catch(error => {
     console.error("Fetch error:", error);
     document.getElementById("show-div").style.display = "none";
 });
}

/*$(document).ready(function(){
	
	document.getElementById("show-div").style.display = "none";
	window.location.href = "<?PHP echo SITE_URL; ?>pos-machine-qr-display";
});*/



setInterval(loadQR, 3000);
loadQR();

function select_machine_id(val)
{
	//alert(val);
	let url = "http://localhost/billings/pos-machine-qr-display?machine_id=" + val;
	window.location.href = url;
}
</script>

</body>
</html>
