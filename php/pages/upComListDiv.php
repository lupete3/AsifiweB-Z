<?php 
	require_once ('../security_eco.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['qteComDiv'];
						  
	$req=$bd->prepare('UPDATE comDivers SET qteComDiv=? WHERE idComDiv=?');
	if ($req->execute(array($a,$id)))
		echo '<script>location.replace("comListDiv.php")</script>';

		
 ?>