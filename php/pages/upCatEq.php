<?php 
	//require_once ('../security_eco.php'); 
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['designation'];

	$verif=$bd->prepare("SELECT * FROM categorieequip WHERE idCatEq=?");
	$verif->execute(array($a));
	if ($don=$verif->fetch()) {
		echo '<script>location.replace("categorieEquip.php")</script>';
	}else{
		$req1 = $bd->prepare('UPDATE categorieequip SET designation=? WHERE idCatEq=?');
		$req1->execute(array($a,$id));
		echo '<script>location.replace("categorieEquip.php")</script>';

	}

		
 ?>
							  