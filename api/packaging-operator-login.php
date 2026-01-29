<?PHP 
	//error_reporting(0);
	include_once '../init.php';
	
	extract($_POST);
	
	$user = $general_cls_call->select_query("username, password, id, role_id", ADMIN_MASTER, "WHERE email=:email", array(':email'=>$general_cls_call->specialhtmlremover($username)), 1);
	if($user) 
	{
		if (password_verify($general_cls_call->specialhtmlremover($password), $user->password)) {
			$token_type = 'app';
			// Create random secure token
			$api_token = bin2hex(random_bytes(32)); // 64 char token
			// Expiry (optional)
			$token_expiry = date('Y-m-d H:i:s', strtotime('+7 days'));
			$setValues="api_token=:api_token, token_expiry=:token_expiry, token_type=:token_type";
			$updateExecute=array(
				':api_token'		=>$general_cls_call->specialhtmlremover($api_token),
				':token_expiry'		=> $token_expiry,
				':token_type'		=> $token_type,
				':admin_id'			=> $user->id
			);
			$whereClause=" WHERE admin_id=:admin_id";
			$general_cls_call->update_query(PACKAGING_OPERATORS, $setValues, $whereClause, $updateExecute);
			
			$operator = $general_cls_call->select_query("id, name, api_token, admin_id", PACKAGING_OPERATORS, "WHERE admin_id=:admin_id", array(':admin_id'=>$user->id), 1);
			
			$_SESSION['PACKAGING_OPERATOR_ID'] = $operator->id;
			$_SESSION['API_TOKEN'] = $operator->api_token;
			
			echo json_encode([
				"status" => 200,
				"msg" => "Login successful",
				"data" => [
					"user_id" => $operator->id,
					"name"    => $operator->name,
					"token"   => $api_token,
					"expiry"  => $token_expiry
				]
			]);
		}
		else
		{
			echo json_encode([
				"status" => 400,
				"msg" => 'Invalid username or password.',
				"data" => []
			]);
		}
	}  
	else
	{
		echo json_encode([
			"status" => 300,
			"msg" => 'User not found.',
			"data" => []
		]);
	}
	exit;

?>