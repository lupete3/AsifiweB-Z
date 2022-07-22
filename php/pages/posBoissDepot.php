<?php 
	require_once ('../security_cpt.php'); 
	require_once('bd_cnx.php');
	//$point=isset($_SESSION['profil']['agent5'])?$_SESSION['profil']['agent5']['idPv']:'';
	
	$id =$_POST['idStock'];
	$c=htmlspecialchars($_POST['qteSort']);

	$req=$bd->prepare("SELECT * FROM prodboiss AS A,depot AS B WHERE A.idDepot = B.id AND idDepot= ? AND idBoiss=?");
	$req->execute(array($idDep,$id));
	$don=$req->fetch(PDO::FETCH_ASSOC);


	$req0=$bd->prepare('SELECT * FROM stock_init AS A,depot AS B WHERE A.idDepot = B.id AND idDepot = ? AND idBoiss=? AND dateStock = ?');
	$req0->execute(array($idDep,$id,date('Y-m-d')));
	$done=$req0->fetch(PDO::FETCH_ASSOC);

	if(!$done){
		$a = $don['idBoiss'];
		$dtStock = date('Y-m-d');
		$qteInit = $don['qnteBoiss'];
		$req1=$bd->prepare('INSERT INTO stock_init(dateStock,idBoiss,qnteSt,idDepot) VALUES(?,?,?,?)');
		$req1->execute(array($dtStock,$a,$qteInit,$idDep));
	}

	$design =$don['designBoiss'];
	$qteStock=$don['qnteBoiss'];
	$nbUnit=$don['nbUniteBoiss'];
	$val=$don['valUnitBoiss'];

	$pu =$don['pvCasier'];
	$etat='wait';
	$pt=$pu*$c;
	$newNbVal = $val - ($c * $nbUnit);
	$newQnte = $qteStock - $c;

	if ($c>$qteStock) {
		echo '<script>location.replace("venteBoissDepot.php?msg=2")</script>';
	}else{
		$req=$bd->prepare("UPDATE prodboiss SET qnteBoiss=?, valUnitBoiss = ? WHERE idBoiss=? AND idDepot = ? ");
		$req->execute(array($newQnte,$newNbVal,$id,$idDep));		

		$req=$bd->prepare("INSERT INTO panier_dep(designation,qtePanier,puPanier,ptPanier,etatPanier,idBoiss,idDepot)VALUES(?,?,?,?,?,?,?)");
		$req->execute(array($design,$c,$pu,$pt,$etat,$id,$idDep));
		
		echo '<script>location.replace("venteBoissDepot.php?msg=3")</script>';

	}

	

		
 ?>