<?php
	class general
	{ 
		private $db;
		//Connect to DB when the class construct
		public function __construct($database)
		{
	    		$this->db = $database;
		}
		public function select_query_count($tables,$where,$data_array)
		{
			$query_string="SELECT COUNT(*) FROM ".$tables." ".$where;
			$query = $this->db->prepare($query_string);
			//echo $query_string;print_r($data_array);
			foreach($data_array As $key=>$value)
			{
				$data_array[$key] = stripslashes($value);
			}			 
			try
			{	
				$query->execute($data_array);
				if($query->errorCode() == 0)
				{
					$num_rows = $query->fetchColumn();
					return $num_rows;
				}
			} 
			catch (PDOException $e)
			{
				die($e->getMessage());
			}
		}
		public function select_query_random($fields,$tables,$where,$data_array)
		{
			$query_string="SELECT ".$fields." FROM ".$tables." ".$where." ORDER BY rand() LIMIT 0, 1";
			$query = $this->db->prepare($query_string);
			foreach($data_array As $key=>$value)
			{
				$data_array[$key] = stripslashes($value);
			}			 
			try
			{
 				$query->execute($data_array);
				if($query->errorCode() == 0)
				{
					$result = $query->fetch(PDO::FETCH_ASSOC);
					return $result;
				} 
				else
				{
					$errors = $prepare_sql->errorInfo();
					echo '<pre>';
					print_r($errors);
					echo '</pre>';
					die();
				}
			} 
			catch (PDOException $e)
			{
				die($e->getMessage());
			}
		}
		public function select_query_sum($table,$where,$data_array,$field)
		{
			$query_string="SELECT SUM(".$field.") as total FROM ".$table." ".$where." ";
			$query = $this->db->prepare($query_string);
			//echo $query_string;print_r($data_array);
			foreach($data_array As $key=>$value)
			{
				$data_array[$key] = stripslashes($value);
			}			 
			try
			{	
				$query->execute($data_array);
				if($query->errorCode() == 0)
				{
					$result = $query->fetch(PDO::FETCH_OBJ);
					return $result;
				}
			} 
			catch (PDOException $e)
			{
				die($e->getMessage());
			}
		}
		public function select_query($fields,$tables,$where,$data_array,$mode)
		{
			$query_string="SELECT ".$fields." FROM ".$tables." ".$where." ";
			$query = $this->db->prepare($query_string);
		//	echo $query_string;print_r($data_array);
			foreach($data_array As $key=>$value)
			{
				$data_array[$key] = stripslashes($value);
			}			 
			try
			{
 				$query->execute($data_array);
				if($query->errorCode() == 0)
				{
					if($mode == 1)
					{	
						/*
						fetch single record from database
						Fetch single dataset in default way
						mixed PDOStatement::fetch(
							int$mode=PDO_FETCH_BOTH,
							int$orientation=PDO_FETCH_ORI_NEXT,
							int$offset=0)

						PDO_FETCH_BOTH above send a array default(assoc/numeric)
						*/
						$result = $query->fetch(PDO::FETCH_OBJ);
					}
					else if($mode == 2)
					{
						/*
						fetch multiple record from database
						Fetch all rows at once in default way
						array PDOStatement::fetchAll(
							int$mode=PDO_FETCH_BOTH,
							string$class_name=NULL,
							array$ctor_args=NULL)

						PDO_FETCH_BOTH above send a array default(assoc/numeric)
						*/
						$result = $query->fetchAll(PDO::FETCH_OBJ);
					}
					return $result;
				} 
				else
				{
					$errors = $prepare_sql->errorInfo();
					echo '<pre>';
					print_r($errors);
					echo '</pre>';
					die();
				}
			} 
			catch (PDOException $e)
			{
				die($e->getMessage());
			}
		}
		
		public function select_join_query($fields, $tables, $where = '', $data_array = [], $mode = 2)
		{
			$query_string = "SELECT $fields FROM $tables $where";
			$query = $this->db->prepare($query_string);
			foreach ($data_array as $key => $value) {
				$data_array[$key] = stripslashes($value);
			}

			try {
				$query->execute($data_array);

				if ($mode == 1) {
					return $query->fetch(PDO::FETCH_OBJ);
				} else {
					return $query->fetchAll(PDO::FETCH_OBJ);
				}

			} catch (PDOException $e) {
				die($e->getMessage());
			}
		}

		public function insert_query($table, $fields, $values, $data_array)
		{
			$result = false;
			$query_string = "INSERT INTO ".$table." (".$fields.") VALUES (".$values.")";
			$query = $this->db->prepare($query_string);
			//echo $query_string;print_r($data_array);
			foreach($data_array As $key=>$value)
			{
				$data_array[$key] = stripslashes($value);
			}
			try
			{
 				$query->execute($data_array);
				if($query->errorCode() == 0)
				{
					$result = $this->db->lastInsertId();
					return $result;
				} 
				else
				{
					$errors = $prepare_sql->errorInfo();
					echo '<pre>';
					print_r($errors);
					echo '</pre>';
					die();
				}
			} 
			catch (PDOException $e)
			{
				die($e->getMessage());
			}
		}
		public function update_query($table, $update_field_values, $where, $data_array)
		{
                    $result = false;
                    $query_string = "UPDATE ".$table." SET ".$update_field_values."  ".$where."";
                    $query = $this->db->prepare($query_string);
                    //echo $query_string;print_r($data_array);
                    foreach($data_array As $key=>$value)
                    {
                        $data_array[$key] = stripslashes($value);
                    }
                    try
                    {
                        $affected_rows=$query->execute($data_array);
                        if($query->errorCode() == 0)
                        {
                            if($affected_rows===0)
                            {
                                $result=true;
                            }
                            else if($affected_rows>0)
                            {
                                $result=$affected_rows;
                            }
                            return $result;
                        } 
                        else
                        {
                            $errors = $prepare_sql->errorInfo();
                            echo '<pre>';
                            print_r($errors);
                            echo '</pre>';
                            die();
                        }
                    } 
                    catch (PDOException $e)
                    {
                         die($e->getMessage());
                    }
		}
		public function delete_query($table, $where, $data_array)
		{
			$result = false;
			$query_string = "DELETE FROM ".$table."  ".$where."";
			$query = $this->db->prepare($query_string);
			foreach($data_array As $key=>$value)
			{
				$data_array[$key] = stripslashes($value);
			}
			try
			{
 				$affected_rows=$query->execute($data_array);
				if($query->errorCode() == 0)
				{
					if($affected_rows===0)
					{
						$result=true;
					}
					else if($affected_rows>0)
					{
						$result=$affected_rows;
					}
					return $result;
				} 
				else
				{
					$errors = $prepare_sql->errorInfo();
					echo '<pre>';
					print_r($errors);
					echo '</pre>';
					die();
				}
			} 
			catch (PDOException $e)
			{
				die($e->getMessage());
			}
		}

		
		public function empty_query($table)
		{
			$query_string = "TRUNCATE TABLE ".$table;
			$this->db->query($query_string);
		}

		public function specialhtmlremover($string)
		{
			$string = trim($string);
			return $string;
		}
		
		public function validation_check($checkingVariable, $loggedInRole, $checkRoleArr, $destinationPath)
		{
			if($checkingVariable == '' || !in_array($loggedInRole, $checkRoleArr))
			{
				echo "<script language='javaScript' type='text/javascript'>
					window.location.href='".$destinationPath."';
				</script>";
			}
		}

		public function session_check()
		{
			if($_SESSION['ADMIN_USER_NAME'] == '')
			{
				echo "<script language='javaScript' type='text/javascript'>
					window.location.href='login.php';
				</script>";
			}
		}
		
		
		
		
		
		public function request_uri()
		{
			if($_SERVER['REQUEST_URI'])
			{
				return $_SERVER['REQUEST_URI'];
			}   
			if($_SERVER['HTTP_X_REWRITE_URL'])
			{
				return;
			}
			$P=$_SERVER['SCRIPT_NAME'];
			if($_SERVER['QUERY_STRING'])
			{
				$P.='?'.$_SERVER['QUERY_STRING'];
				return $P;
			}
		}
		public function pageLink()
		{
			preg_match('`/'.FOLDER_PATH.'(.*)(.*)$`',$this->request_uri(),$matches);
			$tabletype=(!empty($matches[1])?($matches[1]):'');
			$url_array=explode('/',$tabletype);

			return($url_array);
		}
		public function pageName($fastPosation,$lastPosation,$countArray)
		{
			if($lastPosation == '') {$lastPosation = 'home';}
			if($countArray == '2') {$lastPosation = $fastPosation;}

			$pageName = $this->select_query("*", SITE_LINK, "WHERE page_url=:page_url", array(':page_url'=>$lastPosation), 1);
			return($pageName);
		}
		public function pageUrl($id)
		{
			$urlName = $this->select_query("*", SITE_LINK, "WHERE id=:id", array(':id'=>$id), 1);
			return($urlName->page_url);
		}	// Seo function.


		function priceFormat($price)
		{
			$nombre_format_francais = number_format($price, 2, ',', ' ');
			return $nombre_format_francais .'&euro;';
		}
		function dateFormat($date)
		{
			$date1 = explode('/', $date);
			$date2 = $date1[2].'-'.$date1[1].'-'.$date1[0];
			return $date2;
		}
		function explode_name($name='')
		{
			if (strpos($name, '*|*') !== false) {
				list($english, $hindi) = explode('*|*', $name, 2);

				return trim($english) . '<br>' . trim($hindi);
			}
			return trim($name);
		}
		
		function cart_product_name($name='')
		{
			if (strpos($name, '*|*') !== false) {
				list($english, $hindi) = explode('*|*', $name, 2);

				return trim($english) . ' (' . trim($hindi) .')';
			}
			return trim($name);
		}
	}
?>