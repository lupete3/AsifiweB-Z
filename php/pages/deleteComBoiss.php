<?php 
	require_once ('../security_brmn.php'); 
	require_once('bd_cnx.php');

	if (isset($_POST['idSup'])) {
			$id = $_POST['idSup'];

			$req = $bd->prepare("DELETE FROM commande WHERE idCom = ?");
			$req->execute(array($id));
			if ($req) {
				echo '<script>location.replace("comBoiss.php")</script>';
			}else{
				echo '<script>location.replace("comBoiss.php")</script>';

			}
		}
?>