<?php 
	require_once ('../security_recept.php'); 
	require_once('bd_cnx.php');

?>
<!DOCTYPE html>
<html>
<head>
	<title>Kivu Raha Hotel</title>
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
		font-size:4em; 
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
				<div class="modal-header bg-danger">
					<h4 class="modal-title" id="exampleModalLabel">MODIFICATION SAUNA</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
						
				</div>
				<form action="upSaunaAbonne.php" method="POST" class="was-validated">
					<div class="modal-body">
						<input type="hidden" name="id" id="id" required="" autocomplete="off"><br>
						
		           		<div class="input-group mb-4">	           			
							<div class="input-group-append">
		           				<span class="input-group-text" id="basic-addon2">Choisir un client</span>
		           			</div>
		           			<select id="client" class="form-control btn-lg" name="client">
                                <?php 
                                	$select_id = $bd->query('SELECT * FROM client');
                                while($selec_id = $select_id->fetch()){
                                   ?>
                                <option value=" <?php echo $selec_id['id_client']  ?>">
                                     <?php echo $selec_id['nom_client'];  ?>
                                </option>
                                <?php  }  ?>
							</select><br>
		           			<br>
		           		</div>
		           		

		           		<div class="input-group mb-4">	           			
							<div class="input-group-append">
		           			<span class="input-group-text" >Prix Unitaire </span>
		           			</div>
							<input type="text" name="pu" id="pu" class="form-control btn-lg" placeholder="Prix unitaire" required="" autocomplete="off"><span class="input-group-text" >$ </span>		       
						</div>
		           		<div class="input-group mb-4">	
		           			<div class="input-group-append">
		           			<span class="input-group-text" >Date Début </span>
		           			</div>           			
		           			<input type="date" name="dateDebut" id="dateDebut" class="form-control btn-lg" placeholder="Date Debut" required="" autocomplete="off">
		           		</div>
		           		<div class="input-group mb-4">	 
		           			<div class="input-group-append">
		           			<span class="input-group-text" >Date Fin </span>
		           			</div>          			
		           			<input type="date" name="dateFin" id="dateFin" class="form-control btn-lg" placeholder="Date Fin" required="" autocomplete="off">
		           		</div>
		           			           		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary btn-block" data-dismiss="modal">Annuler</button>
						<button type="submit" class="btn btn-danger btn-block">Modifier</button>
					</div>
				</form>				
			</div>
		</div>			
	</div>
	

	<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
		<a class="navbar-brand" href="#"><img src="fichiers/photos/bbh_logos.png" class="bbh">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<marquee behavior="alternate" >
                        <h1 id="h1_bbh_title" style="font-size: 60px; font-family: century gothic; font-weight: bold; margin-top: 2px; margin-left: 10px; color: #b90112; padding-top: 3px;text-shadow: 8px 8px 2px white; text-shadow: 0 0 10px white, 0 0 10px white,0 0 10px white;">Kivu Raha Hotel</h1></marquee>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="../sauna_abonnement.php"><button type="button" class="btn btn-outline-light connexion"><h3>Retour</h3></button><span class="sr-only">(current)</span></a>
				</li>
			</ul>
			
		</div>
	</nav>

		<!--================================CONTENU ========================================== -->

	<div class="container-fluid spacer">
		<div class="row">
			<div class="col-md-3">
		          <h3 class="title">VENTE D'UN SERVICE</span></h3>
		          <?php
		          		if (isset($_POST['save'])) {
		          			$a=$_POST['client'];
							$b='Sauna';
							$c=$_POST['pu'];
							$d=$_POST['dateDebut'];
							$e=$_POST['dateFin'];
							$accompte=$c;
							$typePaie='Espèces';
							$qte = 1;
							$pt = $c * $qte;
							$reste = $pt - $accompte;
							$modePaie=(($reste===0)?'Cash':'Crédit');

							$abonne = 1;

		          			if (!empty($a) AND !empty($b) AND !empty($c)) {
					            
					            $req = $bd->prepare('INSERT INTO sauna (designSauna,qteSauna,puSauna,ptSauna,dateDebut,dateFin,modePaie,id_client,accompte,reste,type,abonne) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)');
					            $req->execute(array($b,$qte,$c,$pt,$d,$e,$modePaie,$a,$accompte,$reste,$typePaie,$abonne));

					        $req=$bd->query("SELECT idSauna FROM sauna ORDER BY idSauna  DESC LIMIT 1");
	 						$don = $req->fetch(PDO::FETCH_ASSOC);
							$idSauna=$don['idSauna'];

							$design='Autres services'.' ('.date('d-m-Y').')';
    						

							$diff='SA';
							$etatFact=(($modePaie=='Cash')?'close':'wait');
    						$facturation =$bd->prepare('INSERT INTO facturation(designActivite,qteFact,puFact,ptFact,modePaieFact,idOperation,diffIndex,accompte,reste,id_client,type,montantPaye,etatFact)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)');
					        
							$facturation->execute(array($design,$qte,$c,$pt,$modePaie,$idSauna,$diff,$accompte,$reste,$a,$typePaie,$accompte,$etatFact));


					            if ($req) { ?>
					                <div class="alert alert-success alert-dismissible" id="msg" role="alert">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4>Activité ajoutée</h4>
									</div>
					                <?php 
					            }
					        }else{ ?>

					        	<div class="alert alert-success alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4>Certains champs sont vides</h4>
								</div>

					        <?php } }

		           ?>
		           <form action="" method="POST" class="spacer was-validated">

		           		<div class="input-group mb-4">	
		           			<select id="organisation" class="form-control btn-lg" name="client" required="">
							<option value="" disabled="" selected="">Choisir un client </option>
                                <?php 
                                	$select_id = $bd->query('SELECT * FROM client');
                                while($selec_id = $select_id->fetch()){
                                   ?>
                                <option value=" <?php echo $selec_id['id_client']  ?>">
                                     <?php echo $selec_id['nom_client'];  ?>
                                </option>
                                <?php  }  ?>
						</select><br>
		           		</div>

		           		
		           		<div class="input-group mb-4">	           			
		           			<input type="text" name="pu" class="form-control btn-lg" placeholder="Prix unitaire" required="" autocomplete="off">
		           		</div>

		           		
		           		<div class="input-group mb-4">	           			
		           			<input type="date" name="dateDebut" class="form-control btn-lg" placeholder="Date Début" required="" autocomplete="off">
		           		</div>
		           		<div class="input-group mb-4">	           			
		           			<input type="date" name="dateFin" class="form-control btn-lg" placeholder="Date Fin " required="" autocomplete="off">
		           		</div>
						<button type="submit" class="btn btn-danger btn-block" name="save">Enregistrer</button>
		           </form>
		    </div>
	      <div class="col-md-9">
	          <h3 class="title">LISTE DES SERVICES VENDUS</span></h3>
	          <div class="row spacer">
	          	 <div class="col-12">
	 				<table id="tab" class="display table table-bordered table-striped table">
		          	<thead>
		          		<tr style="font-weight:bold" class="btn-danger">
                            <th>N°</th>  
                            <th>Nom Client</th>  
                            <th>Activité</th>  
                            <th>PU</th>
                            <th>PT</th>
                            <th>DATE DEBUT</th>
                            <th>DATE FIN</th>
                            <th>Jours Restants</th>
		          			<td>Action</td>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<?php
		          			$limit=10;
							$page = isset($_GET['page'])?$_GET['page']:1;
							$start = ($page-1)*$limit;
							$dateJ=date('Y-m-d');

							$req = $bd->query("SELECT idSauna,designSauna,puSauna,ptSauna,date_format(dateSauna,'%d-%m-%Y') AS dateSauna,date_format(dateDebut,'%d-%m-%Y') AS dateDebut,date_format(dateFin,'%d-%m-%Y') AS dateFin, abonne, nom_client FROM sauna,client WHERE sauna.id_client = client.id_client AND abonne = 1 AND dateSauna LIKE '%$dateJ%' ORDER BY idSauna DESC LIMIT $start,$limit");

							$res = $bd->query("SELECT COUNT(*) as total FROM sauna,client WHERE sauna.id_client = client.id_client AND abonne = 1 AND dateSauna LIKE '%$dateJ%'");

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

		          				$nj= (strtotime($don['dateFin']) - strtotime(date('Y-m-d')));
					        
					        	$nbrjour = number_format($nj/86400,0);
		          				
		          				?>
		          		<tr>
                                <td><?php echo $don['idSauna'] ?></td>
                                <td><?php echo $don['nom_client'] ?></td>
                                <td><?php echo $don['designSauna'] ?></td>
                                <td><?php echo $don['puSauna'] ?></td>
                                <td><?php echo $don['ptSauna'] ?></td>
                                <td><?php echo $don['dateDebut'] ?></td>
                                <td><?php echo $don['dateFin'] ?></td>
                                <td><?php echo (($nbrjour <= 0)?'0': $nbrjour) ?></td>
								<td>
									
									<button type="button" class="btn btn-danger editBtn"><span class="fa fa-pencil"></span>
									</button>
									<a target="_blank" href="../saunaAbonnFac.php?id=<?php echo $don['idSauna'] ?> "><button type="button" class="btn btn-danger"><span class="fa fa-print"></span>
									</button></a>
								</td>
						</tr>
		          		<?php endwhile;?>
		          	</tbody>
		          </table>
	          	 </div>
	          </div>
	          <div class="row">
	          	 <div class="col-3 offset-9">
	          	 	<nav aria-label="Page navigation example">
	          			<ul class="pagination pg-blue">
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Previous" href="sauna.php?page=<?php echo $prec;?>">
			    				<span aria-hidden="true">&laquo;</span>
			    				<span class="sr-only" ="true">Previous</span>
			    			</a>
			    		</li>
			    		<?php 
			    			for($i=1;$i<=$nbrePage;$i++) {
			    		?> 
			    		<li class="page-item <?php echo(($page==$i)?'active':'')?>"><a  class="page-link" href="sauna.php?page=<?php echo $i;?>"><?php echo $i;?></a></li>
			    		<?php
			    		}?>
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Next" href="sauna.php?page=<?php echo $suiv;?>">
			    				<span aria-hidden="true">&raquo;</span>
			    				<span class="sr-only" ="true">Previous</span>
			    			</a>
			    		</li>
			    	</ul>
	          		</nav>
	          	 </div>
	          </div>
	    </div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7 offset-1">
				
			</div>
		</div>
	</div>
	

	<script src="bootstrap/js/popper.min.js"></script>
	<script src="bootstrap/js/jquery-3.4.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
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
		  		$('#pu').val(data[3]);
		  		$('#dateDebut').val(data[5]);
		  		$('#dateFin').val(data[6]);
		  	});
		});
	</script>
</body>
</html>