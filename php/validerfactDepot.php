<?php 
	require_once ('security_cpt.php'); 
    require_once('bd_cnx.php');

	$etat='wait';
	$etat2='close';

	
	$req2=$bd->prepare('SELECT A.idBoiss,A.designation,A.qtePanier,A.puPanier,A.ptPanier FROM panier_dep AS A, depot AS B WHERE A.idDepot  = B.id AND A.idDepot = ? AND etatPanier=? ');
    $req2->execute(array($idDep,$etat));

	$req1 = $bd->prepare('UPDATE panier_dep SET etatPanier=? WHERE etatPanier=? AND idDepot = ?');
	$req1->execute(array($etat2,$etat,$idDep));
	


    while($res=$req2->fetch(PDO::FETCH_ASSOC)){

    	$req3=$bd->prepare('SELECT paCasier FROM prodboiss,depot  WHERE idDepot = id AND idBoiss=? ');
    	$req3->execute(array($res['idBoiss']));
    	$result=$req3->fetch(PDO::FETCH_ASSOC);

    	$paCasier = $result['paCasier'];

        $designation = $res['designation'];
        $qtePanier = $res['qtePanier'];
        $puPanier = $res['puPanier'];
        $ptPanier = $res['ptPanier'];
        $idBoiss = $res['idBoiss'];
        $destination = $_POST['destination'];

        $dtJour = date('Y-m-d');

        $point2=isset($_SESSION['profil']['agent5'])?$_SESSION['profil']['agent5']['idPv']:'';

        $benefice = ($puPanier - $paCasier) * $qtePanier;
       

		 $venteJour =$bd->prepare('INSERT INTO ventedepot(designBoiss,qteVendu,prixVente,ptVente,beneficeCasier,idBoissVend,dateVente,destination,idDepot)VALUES(?,?,?,?,?,?,?,?,?)');
					        
		$venteJour->execute(array($designation,$qtePanier,$puPanier,$ptPanier,$benefice,$idBoiss,$dtJour,$destination,$idDep));

		

    }
	echo '<script>location.replace("pages/venteBoissDepot.php")</script>';

		
 ?>