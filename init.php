<?php
	#######################################################################################
	## THIS FILE IS THE COMMON FILE. THIS FILE INCLUDES ALL THE COMMON FILES REQUIRED IN YOUR WEBSITE. PLEASE INCLUDE THIS FILE IN ALL PAGES. SESSION HAS ALREADY STARTED IN THIS PAGE YOU DO NOT HAVE START SESSION IN THOSE PAGES WHERE YOU HAVE ALREADY INCLUDED THIS PAGE.
	## Created By Exalted Solution
	## Open Source Beta Version
	#######################################################################################

	session_start();
	date_default_timezone_set('Asia/Kolkata');
	include_once("includes/connection.php");			/* This is for includeing the all predefine name of database,tables,user,password and database connection*/
	include_once("includes/queryFunction.php");			/* This is for includeing the all query function */
	include_once("includes/databaseTable.php");			/* This is for includeing the all query function */
	include_once("includes/config.php");
    include_once("includes/fcm.php"); 	
	

	$general_cls_call=new general($db);
	//$fcm = new FCM($db);
	$fcm = new FCM($db, $general_cls_call);
?>
