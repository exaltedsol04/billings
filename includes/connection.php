<?php 
	/* This is for Pre defineing database name,server name ,tables,user name, password so that change in one place can change all the location where using those */

	/* database configuration "" */
	if($_SERVER['HTTP_HOST']=='localhost')
	{
		define("SERVER_NAME","localhost");
		define("USER_NAME","root");
		define("PASSWORD","");
		define("DATABASE_NAME","billings");
	}
	else
	{
		define("SERVER_NAME","localhost");
		define("USER_NAME","exalteds_stock");
		define("PASSWORD","Exalted@2019");
		define("DATABASE_NAME","exalteds_stock");
	}

	
	$database_connection="mysql:host=".SERVER_NAME.";dbname=".DATABASE_NAME . ";charset=utf8mb4";	/* This is the first parameter for establishing a database connection */
	try 
	{
		$db = new PDO($database_connection, USER_NAME, PASSWORD);
   		$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	catch(PDOException $e) 
	{
    	die($e->getMessage());													/* This will make a database connection and if not connected it will give error */
	}
$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off'
            || $_SERVER['SERVER_PORT'] == 443)
            ? "https://"
            : "http://";
			
	//Domain URL
	define("FOLDER_PATH", "billings/");
	define("DOMAIN_NAME", $protocol.$_SERVER['HTTP_HOST']."/".FOLDER_PATH);
	define("SITE_URL", DOMAIN_NAME."");

	define("IMAGE_FOLDER", "images/");
	//define("IMG_PATH", DOMAIN_NAME."dist/img/");
	define("IMG_PATH", DOMAIN_NAME."assets/images/");
	define("IMAGE_PATH", DOMAIN_NAME."dist/images/");


	define("JS_PATH", DOMAIN_NAME."js/");
	define("CSS_PATH", DOMAIN_NAME."css/");

	define("ADMIN_TITLE", ".::. Billings Control Panel .::.");
	define("SITE_TITLE", "Billings");
	
	define("MAIN_SERVER_PATH", "images/");
?>