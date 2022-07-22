<?php 
	require_once ('../security_admin.php'); 
	require_once('bd_cnx.php');

	if (isset($_POST['idSup'])) {
			$id = $_POST['idSup'];

			$req = $bd->prepare("DELETE FROM users WHERE id_user = ?");
			$req->execute(array($id));
			if ($req) {
			    echo '<script>
        
                location.replace("users.php")
        
            </script>';
				
			}else{
			    echo '<script>
        
                location.replace("users.php")
        
            </script>';
			
			}
		}
?>