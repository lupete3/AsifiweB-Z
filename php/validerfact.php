<?php 
	require_once ('security_brmn.php'); 
    require_once('bd_cnx.php');
	$id =$_POST['id'];
	
	$modePaie='Cash';
	$etatFact=(($modePaie=='Cash')?'close':'wait');

	$point=1;

	$res=$bd->query("SELECT * FROM pointvente WHERE idPv='$point'");
	$don=$res->fetch(PDO::FETCH_ASSOC);

	$design=$don['libPv'].' ('.date('d-m-Y').')';
	$idPv = $don['idPv'];

	switch ($don['idPv']) {
		case 1:
			$diff='RE';
			break;
		case 2:
			$diff='TE';
			break;
		case 3:
			$diff='PB';
			break;
		case 4:
			$diff='NC';
			break;
	}

	$etat='wait';
	$etat2='close';

	
	$req2=$bd->prepare('SELECT * FROM panier WHERE idTable=? AND  etatPanier=? AND idPv=? ');
    $req2->execute(array($id,$etat,$point));

	$req1 = $bd->prepare('UPDATE panier SET modePaie=?,etatPanier=? WHERE idTable=? AND etatPanier=? ');
	$req1->execute(array($modePaie,$etat2,$id,$etat));
	


    while($res=$req2->fetch(PDO::FETCH_ASSOC)){

    	$req3=$bd->prepare('SELECT paBoiss FROM prodboiss WHERE idBoiss=? ');
    	$req3->execute(array($res['idBoiss']));
    	$result=$req3->fetch(PDO::FETCH_ASSOC);

    	$paBoiss = $result['paBoiss'];

        $designation = $res['designation'];
        $qtePanier = $res['qtePanier'];
        $puPanier = $res['puPanier'];
        $ptPanier = $res['ptPanier'];
        $idBoiss = $res['idBoiss'];
        $point2=1;

        $benefice = ($puPanier - $paBoiss) * $qtePanier;
        
        $venteJour =$bd->prepare('INSERT INTO ventepdv(designBoiss,qteVendu,prixVente,ptVente,beneficeBouteille,idBoissVend,dateVente,idPvente)VALUES(?,?,?,?,?,?,NOW(),?)');
					        
		$venteJour->execute(array($designation,$qtePanier,$puPanier,$ptPanier,$benefice,$idBoiss,$point2));

		

    }
	echo '<script>location.replace("pages/venteRestaurant.php")</script>';

		
 ?>