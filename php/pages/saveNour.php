<?php 
	//require_once ('../security_eco.php');
	require_once('bd_cnx.php');
	$idBoiss=$_POST['idNour'];
	$qte =$_POST['qte'];
	$pu=$_POST['pu'];
	

	
	$req=$bd->prepare("SELECT * FROM prodnour WHERE idNour=?");
	$req->execute(array($idBoiss));
	$don=$req->fetch(PDO::FETCH_ASSOC);
	$design =$don['designNour'];
	$stock =$don['qnteNour'];
	$etat='wait';
	$pt=$pu*$qte;

	$req=$bd->prepare('INSERT INTO etatbesoin(article,qte,pu,pt,stock,etat) VALUES (?,?,?,?,?,?)');
	$req->execute(array($design,$qte,$pu,$pt,$stock,$etat));
	
	header('location:etatBesoin.php?msg=1');

		
 ?>