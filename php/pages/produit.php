<?php 
	require_once ('../security_eco.php');
	require_once('bd_cnx.php');

	if (isset($_GET['submit'])) {
		$id =$_GET['id'];
	$a=$_GET['idCatBoiss'];
	$b=$_GET['qnteBoiss'];
	$c=$_GET['designBoiss'];
	$d=$_GET['nbUniteBoiss'];
	$e=$_GET['puBoiss'];
	$f=$b*$d;

	$verif=$bd->prepare("SELECT * FROM prodboiss WHERE designBoiss=?");
	$verif->execute(array($c));
	if ($don=$verif->fetch()) {
		header('location:produit.php');
	}else{
		$req1 = $bd->prepare('UPDATE prodboiss SET idCatBoiss=?,qnteBoiss=?,designBoiss=?,nbUniteBoiss=?,puBoiss=?,valUnitBoiss=? WHERE idBoiss=?');
		$req1->execute(array($a,$b,$c,$d,$e,$f,$id));
		header('location:produit.php');
	}
	}

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
					<h4 class="modal-title" id="exampleModalLabel">MODIFICATION BOISSON</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
						
				</div>
				<form action="upProd.php" method="POST" class="was-validated">
					<div class="modal-body">
						<input type="hidden" name="id" id="id" required="" autocomplete="off"><br>
						<select id="select" class="form-control" name="idCatBoiss" required="">
                            <option value="" selected="" disabled="">Sélectionner catégorie </option>
                                            
                            <?php 
                                $select_id = $bd->query('SELECT * FROM catboiss');
                                while($selec_id = $select_id->fetch()){
                                    ?>
                                <option value="<?php echo $selec_id['idCatBoiss']; ?>">
                                     <?php echo $selec_id['idCatBoiss'].' '.$selec_id['designCatBoiss'];  ?>
                                </option>
                             <?php  }  ?>
              
                        </select><br>
		           		
		           		<div class="input-group mb-4">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Designation Boisson</span>
		           			</div>	           			
		           			<input type="text" name="designBoiss" class="form-control" placeholder="Désignation boisson" required="" autocomplete="off" id="des">
		           		</div><div class="input-group mb-4">
		           			           			
		           			<input type="hidden" name="qnteBoiss" id="qte" class="form-control" placeholder="Stock initial" required="" autocomplete="off">
		           			
		           		</div>	
		           		<div class="input-group mb-4">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Nombre Bouteilles</span>
		           			</div>	           			
		           			<input type="text" name="nbUniteBoiss" id="nbre" class="form-control" placeholder="Nombre de pièce" required="" autocomplete="off">
		           			
		           		</div>  
		           		<div class="input-group mb-4">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Prix Achat/Casier</span>
		           			</div>	           			
		           			<input type="text" name="paCasier" id="paCasier" class="form-control" placeholder="Prix Achat Casier" required="" autocomplete="off">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Fc</span>
		           			</div>
		           		</div>         		
		           		<div class="input-group mb-4">	
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Prix Vente/Bouteille</span>
		           			</div>           			
		           			<input type="text" name="pvBouteille" id="puBoiss" class="form-control" placeholder="Prix Unitaire Bouteille" required="" autocomplete="off">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Fc</span>
		           			</div>
		           		</div>         		
		           		<div class="input-group mb-4">	
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Prix Vente/Casier</span>
		           			</div>           			
		           			<input type="text" name="pvCasier" id="pvCasier" class="form-control" placeholder="Prix Vente Casier" required="" autocomplete="off">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Fc</span>
		           			</div>
		           		</div>         		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary btn-block" data-dismiss="modal">Annuler</button>
						<button type="submit" name="submit" value="submit" class="btn btn-primary btn-block">Modifier</button>
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
					<a class="nav-link" href="../ac_sess/ac_eco.php"><button type="button" class="btn btn-outline-light connexion"><h3>Retour</h3></button><span class="sr-only">(current)</span></a>
				</li>
			</ul>
			
		</div>
	</nav>

		<!--================================CONTENU ========================================== -->

	<div class="container-fluid spacer">
		<div class="row">
			<div class="col-md-3">
		          <h3 class="title">AJOUTER BOISSON</span></h3>
		          <?php
		          		if (isset($_POST['save'])) {
							  $a=$_POST['idCatBoiss'];
							  $b=$_POST['designBoiss'];
							  $c=$_POST['qnteBoiss'];
							  $d=$_POST['nbUniteBoiss'];
							  $e=$_POST['puBoiss'];
							  $f=$c*$d;
							  $g = $_POST['paCasier'];
							  $h = $_POST['pvCasier'];
							  $i = $_POST['paCasier'] / $d;

							  $req=$bd->prepare('SELECT * FROM prodboiss WHERE designBoiss=?');
							  $req->execute(array($b));
							  if ($don=$req->fetch(PDO::FETCH_ASSOC)) {
							      ?>
								<div class="alert alert-primary alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h6>Cette boisson existe déjà</h6>
								</div>
								<?php
							  }else{

							  	$req2=$bd->prepare('SELECT * FROM depot');
							  	$req2->execute();
							  	while ( $don2=$req2->fetch(PDO::FETCH_ASSOC)) {

							  		$req=$bd->prepare('INSERT INTO prodboiss(idCatBoiss,designBoiss,qnteBoiss,nbUniteBoiss,puBoiss,valUnitBoiss,paBoiss,paCasier,pvCasier,idDepot) VALUES(?,?,?,?,?,?,?,?,?,?)');
							  		$req->execute(array($a,$b,$c,$d,$e,$f,$i,$g,$h,$don2['id']));
							  	}
							  	  								  
							      if ($req) {
							     $req1=$bd->prepare('SELECT MAX(idBoiss) as idBoiss FROM prodboiss ');
							 	 	$req1->execute();
							     	$don=$req1->fetch(PDO::FETCH_ASSOC);

							     	$idB = $don['idBoiss'];
							  
							      $req2=$bd->prepare('INSERT INTO stockpv (idBoiss,idPV) VALUES (?,?)');
							      $req2->execute(array($idB,1));
							            ?>
								<div class="alert alert-success alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4>Boisson ajoutée</h4>
								</div>
								<?php
							      }else{
							        ?>
									<div class="alert alert-primary alert-dismissible" id="msg" role="alert" class="spacer">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="text-center">Boisson non ajouté</h4>
									</div>
									<?php
							      }
							    }
							  }							
		           ?>
		           <form action="" method="POST" class="spacer was-validated">
		           		<select id="select" class="form-control" name="idCatBoiss" required="">
                            <option value="" selected="" disabled="">Sélectionner catégorie </option>
                                            
                            <?php 
                                $select_id = $bd->query('SELECT * FROM catboiss');
                                while($selec_id = $select_id->fetch()){
                                    ?>
                                <option value=" <?php echo $selec_id['idCatBoiss']  ?>">
                                     <?php echo $selec_id['idCatBoiss'].' '.$selec_id['designCatBoiss'];  ?>
                                </option>
                             <?php  }  ?>


                                        
                        </select><br>
		           		<input type="text" name="designBoiss" class="form-control" placeholder="Désignation boisson" required="" autocomplete="off">
		           		<div class="input-group mb-4">	           			
		           			<input type="hidden" value="0" name="qnteBoiss" class="form-control" placeholder="Stock initial" required="" autocomplete="off">
		           			
		           		</div>	
		           		<input type="text" name="nbUniteBoiss" class="form-control" placeholder="Nombre de pièce" required="" autocomplete="off"><br>
		           		<div class="input-group mb-4">	           			
		           			<input type="text" name="puBoiss" class="form-control" placeholder="Prix vente Bouteille" required="" autocomplete="off">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Fc</span>
		           			</div>
		           		</div>
		           		<div class="input-group mb-4">	           			
		           			<input type="text" name="paCasier" class="form-control" placeholder="Prix  d'achat Casier" required="" autocomplete="off">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Fc</span>
		           			</div>
		           		</div>
		           		<div class="input-group mb-4">	           			
		           			<input type="text" name="pvCasier" class="form-control" placeholder="Prix Vente Casier" required="" autocomplete="off">
		           			<div class="input-group-append">
		           				<span class="input-group-text " id="basic-addon2">Fc</span>
		           			</div>
		           		</div>
						<button type="submit" class="btn btn-primary btn-block" name="save">Enregistrer</button>
		           </form>
		    </div>
	      <div class="col-md-9">
	          <h3 class="title">LISTE DES BOISSONS</span></h3>
	          <div class="row spacer">
	          	 <div class="col-12">
	 				<table id="tab" class="display table table-bordered table-striped table-sm">
		          	<thead>
		          		<tr style="font-weight:bold" class="btn-primary">
		          			<th>N°</th>   
                            <th>Catégorie</th>
                            <th>Boisson</th>  
                            <th>Stock</th>  
                            <th>Nombre unité</th>  
                            <th>Total unités</th>  
                            <th>PA/BOUT</th>  
                            <th>PU/BOUT</th>   
                            <th>PA/CASIER</th>  
                            <th>PU/CASIER</th>  
                            <th>Depôt</th>  
		          			<td>Action</td>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<?php
		          			$limit=100;
							$page = isset($_GET['page'])?$_GET['page']:1;
							$start = ($page-1)*$limit;

							$req = $bd->query("SELECT * FROM prodboiss AS A,catboiss AS B, depot AS C WHERE B.idCatBoiss=A.idCatBoiss AND A.idDepot = C.id LIMIT $start,$limit");
							
							$res = $bd->query('SELECT COUNT(*) AS total FROM prodboiss AS A INNER JOIN catboiss AS B ON B.idCatBoiss=A.idCatBoiss');

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
                                <td><?php echo $don['idBoiss'] ?></td>
                                <td><?php echo $don['designCatBoiss'] ?></td>
                                <td><?php echo $don['designBoiss'] ?></td>
                                <td><?php echo $don['qnteBoiss'] ?></td>
                                <td><?php echo $don['nbUniteBoiss'] ?></td>
                                <td><?php echo $don['valUnitBoiss'] ?></td>
                                <td><?php echo number_format($don['paBoiss'],0) ?></td>
                                <td><?php echo $don['puBoiss'] ?></td>
                                <td><?php echo $don['paCasier'] ?></td>
                                <td><?php echo $don['pvCasier'] ?></td>
                                <td><?php echo (($don['designation'] == 'Depot1')?"<span class='badge badge-success'>".$don['designation']."</span>":"<span class='badge badge-info'>".$don['designation']."</span>") ?></td>
								<td>
									<button type="button" class="btn btn-primary editBtn"><span class="fa fa-pencil"></span>
										
									</button>
								</td>
						</tr>
		          		<?php endwhile;?>
		          	</tbody>
		          </table>
	          	 </div>
	          </div>
	          <div class="row">
	          	 <div class="col-9 offset-3">
	          	 	<nav aria-label="Page navigation example">
	          			<ul class="pagination pg-blue">
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Previous" href="produit.php?page=<?php echo $prec;?>">
			    				<span aria-hidden="true">&laquo;</span>
			    				<span class="sr-only" ="true">Previous</span>
			    			</a>
			    		</li>
			    		<?php 
			    			for($i=1;$i<=$nbrePage;$i++) {
			    		?> 
			    		<li class="page-item <?php echo(($page==$i)?'active':'')?>"><a  class="page-link" href="produit.php?page=<?php echo $i;?>"><?php echo $i;?></a></li>
			    		<?php
			    		}?>
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Next" href="produit.php?page=<?php echo $suiv;?>">
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
		  		$('#des').val(data[2]);
		  		$('#qte').val(data[3]);
		  		$('#nbre').val(data[4]);
		  		$('#paCasier').val(data[8]);
		  		$('#puBoiss').val(data[7]);
		  		$('#pvCasier').val(data[9]);



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