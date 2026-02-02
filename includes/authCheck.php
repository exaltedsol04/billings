<?php 
	error_reporting(0);
	include_once 'init.php';
	//print_r($pageParam); die;
	$pageAccessRoleIds = $pageParam['pageAccessRoleIds'];
	$general_cls_call->validation_check($_SESSION['USER_ID'], $_SESSION['ROLE_ID'], $pageAccessRoleIds, SITE_URL);// VALIDATION CHEK
	
	$page = basename($_SERVER["PHP_SELF"]);
?>