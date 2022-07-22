<?php 
	require_once ('../security_eco.php'); 
	require_once('bd_cnx.php');

	if (isset($_POST['idSup'])) {
			$id = $_POST['idSup'];

			$req = $bd->prepare("DELETE FROM commande WHERE idCom = ?");
			$req->execute(array($id));
			if ($req) {
				echo '<script>location.replace("comListBoiss.php")</script>';
			}else{
				echo '<script>location.replace("comListBoiss.php")</script>';

			}
		}
?>