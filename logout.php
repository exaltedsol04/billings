<?PHP
	include_once 'init.php';

    $_SESSION['USER_ID'] = FALSE;
    session_destroy();
    header("location:".SITE_URL);

?>