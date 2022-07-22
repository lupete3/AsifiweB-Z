<?php 
	require_once ('../security_eco.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['qteComDiv'];
						  
	$req=$bd->prepare('UPDATE comcuisine SET qteComDiv=? WHERE idComCuis=?');
	if ($req->execute(array($a,$id)))
		echo '<script>location.replace("comListDivCuis.php")</script>';

		
 ?>