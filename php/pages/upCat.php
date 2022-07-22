<?php 
	require_once ('../security_eco.php'); 
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['designCatBoiss'];

	$verif=$bd->prepare("SELECT * FROM catboiss WHERE idCatBoiss=?");
	$verif->execute(array($a));
	if ($don=$verif->fetch()) {
		echo '<script>location.replace("categorie.php")</script>';

	}else{
		$req1 = $bd->prepare('UPDATE catboiss SET designCatBoiss=? WHERE idCatBoiss=?');
		$req1->execute(array($a,$id));
		echo '<script>location.replace("categorie.php")</script>';
	}

		
 ?>
							  