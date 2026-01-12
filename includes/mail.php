<?php
	$MailTo = $general_cls_call->select_query("*", ADMIN_MASTER, "WHERE 1", array(), 1);

//EMAIL

	/*define("MAIL_FROM", "info@exaltedsol.com");
	define("MAIL_FROM_NAME", "Exalted Solution");
	define("MAIL_HOST", "mail.exaltedsol.com");
	define("MAIL_USERNAME", "info@exaltedsol.com");
	define("MAIL_PASSWORD", "exalted2012");
	define("MAIL_PORT", 25);*/


	$mail = new phpmailer();
	$mail->IsSMTP();       // set mailer to use SMTP
	$mail->From     = SITE_TITLE;
	$mail->FromName = $MailTo->mail_name;
	$mail->Host     = $MailTo->host_name;
	$mail->SMTPAuth   = true;
	$mail->Port       = $MailTo->smtp_port;                    // set the SMTP server port
	$mail->Username   = $MailTo->user_name;     // SMTP server username
	$mail->Password   = $MailTo->smtp_password;  
	$mail->IsSendmail();  // tell the class to use Sendmail

?>