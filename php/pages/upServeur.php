<?php 
	require_once ('../security_admin.php');  
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['nom'];
    $b=$_POST['sexe'];
    $c=$_POST['adresse'];
    $d=$_POST['contact'];


    $req1 = $bd->prepare('UPDATE serveur SET nom_serveur=?,adresse=?,telServeur=?,sexe_serveur=?  WHERE id_serveur=?');
	$req1->execute(array($a,$c,$d,$b,$id));
	echo '<script>location.replace("listServeur.php")</script>';

	

		
 ?>
							  