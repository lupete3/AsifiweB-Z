<?php 
	require_once ('../security_brmn.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];

	$a=$_POST['qnteApprov'];

	$req=$bd->prepare('SELECT * FROM approvboissbuv WHERE idApprovBoiss=?');
	$req->execute(array($id));
	$don=$req->fetch(PDO::FETCH_ASSOC);
	$qteApAv = $don['qnteApprov'];
	$puCaiss = $don['puApprov'];
	$idBois = $don['idBoiss'];
	//Recuperation de la quantite presente du produit
	$req1=$bd->prepare('SELECT * FROM stockpv WHERE idBoiss=?');
	$req1->execute(array($idBois));
	$don1=$req1->fetch(PDO::FETCH_ASSOC);

	$qteSout = $don1['qtStock']-$qteApAv;
	//Modification qunatite produit
	$req2=$bd->prepare('UPDATE stockpv SET qtStock=? WHERE idBoiss=?');
	$req2->execute(array($qteSout,$idBois));
	//-------------------------------------------------------


	$req=$bd->prepare('SELECT * FROM stockpv WHERE idBoiss=?');
	$req->execute(array($idBois));
	$don=$req->fetch(PDO::FETCH_ASSOC);
	$newQte = $don['qtStock'];
	$newQte+=$a;
	$pt = $a * $puCaiss;
							  
	$req2=$bd->prepare('UPDATE stockpv SET qtStock=? WHERE idBoiss=?');
	$req2->execute(array($newQte,$idBois));

	$req=$bd->prepare('UPDATE approvboissbuv SET qnteApprov=?,ptApprov=? WHERE idApprovBoiss=?'); 
	if ($req->execute(array($a,$pt,$id))){

		echo '<script>location.replace("approvBoissBuvette.php")</script>';
	}
		
 ?>