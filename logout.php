<?PHP
	include_once 'init.php';
	
	if($_SESSION['ROLE_ID'] == 5) {
		$setValues="api_token=:api_token";
		$updateExecute=array(
			':api_token'	=> NULL,
			':id'			=> $_SESSION['PACKAGING_OPERATOR_ID']
		);
		$whereClause=" WHERE id=:id";
		$general_cls_call->update_query(PACKAGING_OPERATORS, $setValues, $whereClause, $updateExecute);
	}
    $_SESSION['USER_ID'] = FALSE;
    session_destroy();
    header("location:".SITE_URL);

?>