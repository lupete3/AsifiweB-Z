<?php 
	require_once('../security_admin.php');
	require_once('bd_cnx.php');
	$id =$_POST['id'];
	$a=$_POST['user_function'];
	$b=$_POST['user_name'];
	$c=$_POST['user_sex'];
	$d=$_POST['user_phone'];
	$f=$_POST['user_address'];
	$g=$_POST['mdp_user'];
							
	$req=$bd->prepare('SELECT * FROM users WHERE user_name=? AND user_function=?');
	$req->execute(array($b,$a));
	if ($don=$req->fetch(PDO::FETCH_ASSOC)) {
			//header('location:users.php');
			echo '<script>
        
                location.replace("users.php")
        
            </script>';
	}else{
	    $req1 = $bd->prepare('UPDATE users SET user_function=?,user_name=?,user_sex=?,user_phone=?,user_address=?,mdp_user=?  WHERE id_user=?');
		$req1->execute(array($a,$b,$c,$d,$f,$g,$id));
		echo '<script> location.replace("users.php") </script>';
		
	}
		
 ?>
							  