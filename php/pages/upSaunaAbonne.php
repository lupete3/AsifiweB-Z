<?php 
	require_once ('../security_recept.php'); 
	require_once('bd_cnx.php');

	$id =$_POST['id'];
	$a=$_POST['client'];
	$b=$_POST['pu'];
	$c=$_POST['dateDebut'];
	$d=$_POST['dateFin'];
	$qte = 1;
	$nbrjour=$qte;
	$pt = $b *$nbrjour ;
	$reste = 0;
						  
	$req=$bd->prepare('UPDATE sauna SET puSauna = ?,ptSauna = ?,dateDebut = ?, dateFin = ?, id_client = ?,accompte = ? WHERE idSauna = ?');
	if ($req->execute(array($b,$pt,$c,$d,$a,$b,$id)))


	    $design='Sauna'.' ('.date('d-m-Y').')';
	    $diff='SA';
		
      
        $facturation =$bd->prepare('UPDATE facturation SET designActivite = ?,qteFact = ?,puFact = ?,ptFact = ?,accompte = ?,reste = ?,id_client = ? WHERE idOperation = ? AND diffIndex =? ');
					        
		$facturation->execute(array($design,$nbrjour,$b,$pt,$b,$reste,$a,$id,$diff));


		header('location:saunaAbonnement.php');
		
 ?>