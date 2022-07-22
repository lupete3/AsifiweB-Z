<?php 
	require_once ('../security_brmn.php'); 
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$b=$_POST['qteComDiv'];
						  
	$req=$bd->prepare('UPDATE comDivers SET qteComDiv=? WHERE idComDiv=?');
	if ($req->execute(array($b,$id)))
		echo '<script>location.replace("comDiv.php")</script>';

		
 ?>