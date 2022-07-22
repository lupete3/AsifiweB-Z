<?php 
	require_once ('../security_admin.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['qteComDiv'];
						  
	$req=$bd->prepare('UPDATE comcuisine SET qteComDiv=? WHERE idComCuis=?');
	if ($req->execute(array($a,$id)))
		echo '<script>location.replace("comListDivCuisA.php")</script>';

		
 ?>