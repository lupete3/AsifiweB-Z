<?php 
	require_once ('../security_cpt.php'); 
	require_once('bd_cnx.php');

	if (isset($_POST['idSup'])) {
			$id = $_POST['idSup'];

			$req = $bd->prepare("DELETE FROM comDivers WHERE idComDiv = ?");
			$req->execute(array($id));
			if ($req) {
				header('Location:comDivD.php');
			}else{
				header('Location:comDivD.php');
			}
		}
?>