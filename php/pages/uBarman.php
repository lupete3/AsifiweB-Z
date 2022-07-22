<?php 
	require_once('../security_admin.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=1;
	$b=$_POST['brm_name'];
	$c=$_POST['brm_sex'];
	$d=$_POST['brm_phone'];
	$e=$_POST['brm_adresse'];
	$f=$_POST['mdp_brm'];
													
	
	$req1 = $bd->prepare('UPDATE barman SET idPv=?,brm_name=?,brm_sex=?,brm_phone=?,brm_address=?,mdp_brm=?  WHERE id_brm=?');
	$req1->execute(array($a,$b,$c,$d,$e,$f,$id));
	
	
	echo '<script>
        
          location.replace("barman.php")
        
    </script>';
	
	
 ?>
							  