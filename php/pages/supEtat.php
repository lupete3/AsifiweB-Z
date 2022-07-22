<?php 
	require_once ('../security_brmn.php'); 
	require_once('bd_cnx.php');

	if (isset($_POST['id'])) {
			$id = $_POST['id'];

			$req = $bd->prepare("DELETE FROM etatbesoin WHERE idEtat = ?");
			$req->execute(array($id));
			if ($req) {
				echo '<script>location.replace("etatBesoin.php")</script>';

			}else{
				echo '<script>location.replace("etatBesoin.php")</script>';
			}
		}
?>