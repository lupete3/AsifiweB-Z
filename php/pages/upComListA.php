<?php 
	require_once ('../security_admin.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['qteCom'];
						  
	$req=$bd->prepare('UPDATE commande SET qteCom=? WHERE idCom=?');
	if ($req->execute(array($a,$id)))
		echo '<script>location.replace("comListBoissA.php")</script>';

		
 ?>