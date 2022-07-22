<?php 
	require_once ('../security_admin.php'); 
	require_once('bd_cnx.php');

?>
<!DOCTYPE html>
<html>
<head>
	<title>Ets Asifiwe B&Z</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=devidev-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" href="bootstrap/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css">
</head>
<style type="text/css">
	.spacer{
		margin-top:30px;
	}
	.bad{
		font-size:1.5em;
	}
	img:hover{
		cursor:pointer;
	}
	.modal-body img{
		height:400px;
	}
	.mCard{
		width: 170px;
		height: 170px;
	}
	.pagin{
		float:center;
	}
	.ceni{
		color:silver;
	}
	.bbh{
		width:100%;
		height:100%;
	}
	#h1_bbh_title{
		font-family: century gothic;
		font-size:3em; 
		font-weight: bold; margin-top: 2px; 
		margin-left: 10px; color: white; 
		padding-top: 3px;
    }
</style>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#"><img src="fichiers/photos/bbh_logos.png" class="bbh">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<marquee behavior="alternate" >
                        <h1 id="h1_bbh_title" style="font-size: 60px; font-family: century gothic; font-weight: bold; margin-top: 2px; margin-left: 10px; color: sienna; padding-top: 3px;text-shadow: 8px 8px 2px white; text-shadow: 0 0 10px white, 0 0 10px white,0 0 10px white;">Ets Asifize B&Z</h1></marquee>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="../admin.php"><button type="button" class="btn btn-outline-light connexion"><h3>Retour</h3></button><span class="sr-only">(current)</span></a>
				</li>
			</ul>
			
		</div>
	</nav>

		<!--================================CONTENU ========================================== -->

	<div class="container spacer">
		<div class="row">

			<div class="col-md-4">
				<h3>NOUVEAU SERVEUR</h3> 

				<?php
		          		if (isset($_POST['save'])) {
							  $a=$_POST['nom'];
							  $b=$_POST['sexe'];
							  $c=$_POST['residence'];
							  $d=$_POST['telServeur'];

							  $req=$bd->prepare('SELECT * FROM serveur WHERE nom_serveur=? AND sexe_serveur = ? ');
							  $req->execute(array($a,$b));
							  if ($don=$req->fetch(PDO::FETCH_ASSOC)) {
							      ?>
								<div class="alert alert-primary alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h5>Serveur existe déjà</h5>
								</div>
								<?php
							  }else{
							  	$req = $bd->prepare('INSERT INTO serveur(nom_serveur, sexe_serveur, adresse, telServeur) 
                            VALUES 
                                (?,?,?,?)') ;
        
            				$req->execute(array(
                                $a,$b,$c,$d));
							  	if ($req) {
							            ?>
								<div class="alert alert-success alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h5 class="text-center">Serveur ajouté avec succès</h5>
								</div>
								<?php
							      }else{
							        ?>
									<div class="alert alert-primary alert-dismissible" id="msg" role="alert" class="spacer">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h5 class="text-center">Serveur non ajoutée</h5>
									</div>
									<?php
							      }

							  }
							  
							      
							  }							
		           ?>
			</div>
			<div class="col-md-3 offset-5">
				<a href="listServeur.php"><button class="btn btn-primary btn-lg pull-right" type="button"><span class="fa fa-list"></span> Liste Serveur</button></a>
			</div>
		</div><br>
		<form action="" method="POST" enctype="multipart/form-data" class="was-validated">
			<div class="row">
				<div class="col-md-6">
						<input type="text" name="nom" class="form-control btn-lg" placeholder="Nom Serveur" required="" autocomplete="off"><br>
						<select name="sexe" class="form-control btn-lg" required="">
		           			<option selected="" disabled="" value="">Sexe</option>
		           			<option value="Masculin" >Masculin</option>
		           			<option value="Feminin" >Feminin</option>
		           		</select><br>
		           		
		           		
				</div>
				<div class="col-md-6">
					<input type="text" name="telServeur" class="form-control btn-lg" placeholder="Téléphone" required="" autocomplete="off"><br>
						<input type="text" name="residence" class="form-control btn-lg" placeholder="Résidence Serveur" required="" autocomplete="off"><br>
				</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary btn-block btn-lg" name="save">Enregistrer</button>
			</div>
		</div>
		</form>
		
	</div>
	

	<script src="bootstrap/js/popper.min.js"></script>
	<script src="bootstrap/js/jquery-3.4.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>