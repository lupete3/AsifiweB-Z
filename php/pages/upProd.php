<?php 
	require_once ('../security_eco.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['idCatBoiss'];
	$b=$_POST['qnteBoiss'];
	$c=$_POST['designBoiss'];
	$d=$_POST['nbUniteBoiss'];
	$e=$_POST['paCasier'];
	$f=$_POST['pvBouteille'];
	$g=$_POST['pvCasier'];
	$h=$b*$d;
	$i = $e / $d;

	$verif=$bd->prepare("SELECT * FROM prodboiss WHERE idBoiss=?");
	$verif->execute(array($id));
	if ($don=$verif->fetch()) {
		$req1 = $bd->prepare('UPDATE `prodboiss` SET `designBoiss`=?,`qnteBoiss`=?,`nbUniteBoiss`=?,`valUnitBoiss`=?,`puBoiss`=?,`paBoiss`=?,`paCasier`=?,`pvCasier`=?,`idCatBoiss`=? WHERE idBoiss = ?');
		$req1->execute(array($c,$b,$d,$h,$f,$i,$e,$g,$a,$id));
		echo '<script>location.replace("produit.php")</script>';
	}else{ 
		echo '<script>location.replace("produit.php")</script>';

	} 
		
 ?>
							  