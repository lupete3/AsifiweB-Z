<?php 
	require_once ('../security_cpt.php'); 
	require_once('bd_cnx.php');

	$id =$_POST['idSup'];
	$c=htmlspecialchars($_POST['qteSort']);

	$req=$bd->prepare("SELECT A.designation FROM panier_dep AS A, depot AS B WHERE A.idDepot = B.id AND A.idPanier=?");
	$req->execute(array($id));
	$don1=$req->fetch(PDO::FETCH_ASSOC);

	
		$req=$bd->prepare("SELECT * FROM prodboiss AS A, depot AS B WHERE A.idDepot = B.id AND A.designBoiss=? AND A.idDepot = ?");
		$req->execute(array($don1['designation'],$idDep));
		$don=$req->fetch(PDO::FETCH_ASSOC);
		$idBoiss=$don['idBoiss'];
		$qteStock=$don['qnteBoiss']+$c;
		$nbUnite = (($don['qnteBoiss']+$c)*$don['nbUniteBoiss']);

		$req=$bd->prepare("UPDATE prodboiss SET qnteBoiss=?, valUnitBoiss=? WHERE idBoiss=? ");
		$req->execute(array($qteStock,$nbUnite,$idBoiss));
		
		$req=$bd->prepare("DELETE FROM panier_dep WHERE idPanier=?");
		$req->execute(array($id));
		echo '<script>location.replace("venteBoissDepot.php")</script>';


		
 ?>