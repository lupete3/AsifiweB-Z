<?php 
	require_once ('../security_brmn.php'); 
	require_once('bd_cnx.php');
	$point=isset($_SESSION['profil']['agent5'])?$_SESSION['profil']['agent5']['idPv']:'1';

	$id =$_POST['idSup'];
	

	$req=$bd->prepare("SELECT * FROM panier WHERE idPanier=?");
	$req->execute(array($id));
	$don1=$req->fetch(PDO::FETCH_ASSOC);

	
		$req=$bd->prepare("SELECT * FROM stockpv as A INNER JOIN prodboiss as B ON B.idBoiss=A.idBoiss WHERE designBoiss=? AND idPv=?");
		$req->execute(array($don1['designation'],$point));
		$don=$req->fetch(PDO::FETCH_ASSOC);
		$idBoiss=$don['idBoiss'];
		$qteStock=$don['qtStock']+$don1['qtePanier'];

		$req=$bd->prepare("UPDATE stockpv SET qtStock=? WHERE idBoiss=? AND idPv=?");
		$req->execute(array($qteStock,$idBoiss,$point));
		
		$req=$bd->prepare("DELETE FROM panier WHERE idPanier=?");
		$req->execute(array($id));
		echo '<script>location.replace("venteRestaurant.php")</script>';
	

		
 ?>