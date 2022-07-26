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
	<link rel="stylesheet" type="text/css" href="bootstrap/DataTables/media/css/jquery.dataTables.min.css">
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
	<!--================================MODAL DE CONNEXION ========================================== -->
	<div class="modal fade" id="editBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h4 class="modal-title" id="exampleModalLabel">MODIFICATION IDENTITE SERVEUR</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
						
				</div>
				<form action="upServeur.php" method="POST">
					<div class="modal-body">
						<input type="hidden" name="id" id="id" required="" autocomplete="off">
						<div class="input-group mb-4">	           			
							<div class="input-group-append">
		           			<span class="input-group-text" id="basic-addon2">Nom </span>
		           			</div>
		           			<input type="text" name="nom" class="form-control" id="lib" required="" autocomplete="off"><br>
		           		</div>
		           		
		           		<div class="input-group mb-4">	           			
							<div class="input-group-append">
		           				<span class="input-group-text" id="basic-addon2">Sexe</span>
		           			</div><select name="sexe" class="form-control" id='sexeM'>
		           			<option value="Masculin" >Masculin</option>
		           			<option value="Feminin" >Feminin</option>
		           		</select>
		           			<br>
		           		</div>
		           		<div class="input-group mb-4">	           			
							<div class="input-group-append">
		           				<span class="input-group-text" id="basic-addon2">Adresse</span>
		           			</div>
		           			<input type="text" name="adresse" class="form-control" id="adresse" required="" autocomplete="off"><br>
		           		</div>
		           		<div class="input-group mb-4">	           			
							<div class="input-group-append">
		           				<span class="input-group-text" id="basic-addon2">Numero de telephone</span>
		           			</div>
		           			<input type="text" name="contact" class="form-control" id="tel" required="" autocomplete="off">
		           		</div>		           		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary btn-block" data-dismiss="modal">Annuler</button>
						<button type="submit" class="btn btn-primary btn-block">Modifier</button>
					</div>
				</form>				
			</div>
		</div>			
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#"><img src="fichiers/photos/bbh_logos.png" class="bbh">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<marquee behavior="alternate" >
                        <h1 id="h1_bbh_title" style="font-size: 60px; font-family: century gothic; font-weight: bold; margin-top: 2px; margin-left: 10px; color: sienna; padding-top: 3px;text-shadow: 8px 8px 2px white; text-shadow: 0 0 10px white, 0 0 10px white,0 0 10px white;">Ets Asifiwe B&Z</h1></marquee>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="../admin.php"><button type="button" class="btn btn-outline-light connexion"><h3>Retour</h3></button><span class="sr-only">(current)</span></a>
				</li>
			</ul>
			
		</div>
	</nav>

		<!--================================CONTENU ========================================== -->

	<div class="container-fluid spacer">
		<div class="row">
	      <div class="col-md-12">
	      	<div class="row">
	      		<div class="col-md-4">
	      			<h3>LISTE DES SERVEURS
			          <?php 
		                    $count = $bd->query('SELECT  COUNT(*) AS nbre FROM serveur');
		                    $nbre=$count->fetch(PDO::FETCH_ASSOC);
		                           ?>
		                    <span class="badge badge-primary badge-pill">
		                    <?php echo $nbre['nbre']; ?>
		                    </span> 
			          </h3>
	      		</div>
	      		<div class="offset-4 col-md-4">
	      			<a href="serveur.php"><button class="btn btn-primary btn-lg pull-right" type="button"><span class="fa fa-plus"></span> Ajouter Serveur</button></a>
	      		</div>
	      	</div>
	          
	          <div class="row spacer">
	          	 <div class="col-12">
	 				<table id="tab" class="display table table-bordered table-striped table">
		          	<thead>
		          		<tr style="font-weight:bold" class="btn-primary">
		          			<th>N°</th>  
                            <th>Nom</th>  
                            <th>Sexe</th>  
                            <th>Adresse</th>  
                            <th>Tél</th>  
                           
		          			<td>Action</td>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<?php
		          			$limit=10;
							$page = isset($_GET['page'])?$_GET['page']:1;
							$start = ($page-1)*$limit;

							$req = $bd->query("SELECT * FROM serveur ");
							
							$res = $bd->query('SELECT COUNT(*) as total FROM serveur');

							$don1 = $res->fetch();
							$total = $don1['total'];
							$nbrePage=ceil($total/$limit);
							if ($page==1) {
								$prec = $page;
							}else {
								$prec = $page-1;
							}
							if ($page==$nbrePage) {
								$suiv =$nbrePage;	
							}
							else{
								$suiv = $page+1;
							}
		          			while($don=$req->fetch()):
		          				?>
		          		<tr>
                                <td><?php echo $don['id_serveur'] ?></td>
                                <td><?php echo $don['nom_serveur'] ?></td>
                                <td><?php echo $don['sexe_serveur'] ?></td>
                                <td><?php echo $don['adresse'] ?></td>
                                <td><?php echo $don['telServeur'] ?></td>
                                
								<td>
									<button type="button" class="btn btn-primary editBtn"><span class="fa fa-pencil"></span>
										
									</button>
									<button type="button" class="btn btn-danger supBtn"><span class="fa fa-trash"></span>
										
									</button>
								</td>
						</tr>
		          		<?php endwhile;?>
		          	</tbody>
		          </table>
	          	 </div>
	          </div>
	          
	    </div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7 offset-1">
				<div class="modal fade" id="supBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h4 class="modal-title" id="exampleModalLabel">SUPPRESSION SERVEUR</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
						
				</div>
				<form action="supServeur.php" method="POST">
					<div class="modal-body">
						<input type="hidden" name="id" id="idS" required="" autocomplete="off">
							<h3>Voulez-vous supprimer ce serveur ?</h3>           		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary btn-block" data-dismiss="modal">Annuler</button>
						<button type="submit" class="btn btn-primary btn-block">Supprimer</button>
					</div>
				</form>				
			</div>
		</div>			
	</div>
			</div>
		</div>
	</div>
	

	<script src="bootstrap/js/popper.min.js"></script>
	<script src="bootstrap/js/jquery-3.4.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="bootstrap/DataTables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.editBtn').on('click', function(){
		  		$('#editBtn').modal('show');

		  		$tr =$(this).closest('tr');
		  		var data = $tr.children('td').map(function(){
		  			return $(this).text();
		  		}).get();
		  		console.log(data);

		  		$('#id').val(data[0]);
		  		$('#lib').val(data[1]);
		  		$('#sexeM').val(data[2]);
		  		$('#adresse').val(data[3]);
		  		$('#tel').val(data[4]);


		  	});
		  	$('.supBtn').on('click', function(){
		  		$('#supBtn').modal('show');

		  		$tr =$(this).closest('tr');
		  		var data = $tr.children('td').map(function(){
		  			return $(this).text();
		  		}).get();
		  		console.log(data);

		  		$('#idS').val(data[0]);
		  	});
		  	$('#tab').DataTable({
		  		pagingTpe:'full_numbers',
		  		lengthMenu:[5,10,20,50,100,200,500],
		  		pageLength:[10],
		  		language:{
		  			url:"bootstrap/DataTables/media/French.json"
		  		}
		  	});
		});
	</script>
</body>
</html>