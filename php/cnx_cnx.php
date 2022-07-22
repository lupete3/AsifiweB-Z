<?php 
session_start();
//require_once ('bd_cnx.php');

try{
        $bd = new PDO('mysql:host=localhost;dbname=sc2vwly2348_asifiwebz', 'root', ''); 
        $bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (Exception $e){
        die ('Erreur :'.$e->getMessage());
        
    }


if(isset($_POST['log_in'])){
	$user = htmlentities(trim(strtolower($_POST['username'])));
	$pwd = htmlentities(trim($_POST['pass']));
	$funct = htmlentities(trim($_POST['funct']));


		if(isset($_POST['funct']) AND $_POST['funct'] == 'admin'){

			$query1 = $bd->prepare("SELECT * FROM admin_gstock_baraka WHERE nom_admin=? AND mdp_admin=? ");
			$query1->execute(array($user, $pwd ));

				if ($done=$query1->fetch(PDO::FETCH_ASSOC)) {

							$_SESSION['profile']['admin']=$done;

							//header('location:admin.php');
							echo '<script> location.replace("admin.php") </script>';
				} else {
				  	echo '<script> location.replace("../index.php") </script>';

				}
		} 
		elseif(isset($_POST['funct']) AND $_POST['funct'] == 'Chef_Depot_Relais') {

				$query2 = $bd->prepare("SELECT * FROM users,depot WHERE user_name=? AND mdp_user=? AND user_function=? AND idDepot = id ");
				$query2->execute(array($user, $pwd, $funct ));

					if ($done2=$query2->fetch(PDO::FETCH_ASSOC)){
							
							$depot = $done2['idDepot'];
							if ($depot == 1) {
								$_SESSION['profil']['agent1']=$done2;
								$_SESSION['idDep'] =  $done2['idDepot'];
								
								echo '<script> location.replace("ac_sess/ac_cpt.php") </script>';
							}else if ($depot == 2) {
								$_SESSION['idDep'] =  $done2['idDepot'];
								$_SESSION['profil']['agent1']=$done2;
								
								echo '<script> location.replace("ac_sess/ac_cpt.php") </script>';
							}

							
						} else { echo '<script> location.replace("../index.php") </script>'; }
        }  
         elseif (isset($_POST['funct']) AND $_POST['funct'] == 'Gerant') {
                $query2 = $bd->prepare("SELECT * FROM users,depot WHERE user_name=? AND mdp_user=? AND user_function=? AND idDepot = id");
				$query2->execute(array($user, $pwd, $funct ));

					if ($done2=$query2->fetch(PDO::FETCH_ASSOC)){
                        $_SESSION['profil']['agent2']=$done2;
                        echo '<script> location.replace("ac_sess/ac_eco.php") </script>';

                    }else { echo '<script> location.replace("../index.php") </script>'; }

         } elseif (isset($_POST['funct']) AND $_POST['funct'] == 'barman') {
				$query2 = $bd->prepare("SELECT * FROM barman as A INNER JOIN pointvente AS B ON B.idPv=A.idPv WHERE brm_name=? AND mdp_brm=? AND B.idPv=? ");
				$query2->execute(array($user, $pwd,1 ));

					if ($done2=$query2->fetch(PDO::FETCH_ASSOC)){
							$_SESSION['profil']['agent5']=$done2;
				            echo '<script> location.replace("ac_sess/ac_bman.php") </script>';
							
						} else { echo '<script> location.replace("../index.php") </script>'; }           

         } }

        else {
            echo '<script> location.replace("../index.php") </script>';
				}

 ?>