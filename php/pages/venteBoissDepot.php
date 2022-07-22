<?php 
	require_once ('../security_cpt.php'); 
	require_once('bd_cnx.php');
	//$c=isset($_SESSION['profil']['agent5'])?$_SESSION['profil']['agent5']['idPv']:'';

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
	<script type="text/javascript" src="js/angular.min.js"></script>
	<script type="text/javascript" src="js/angular-animate.js"></script>
	<script type="text/javascript" src="js/angular-route.js"></script>
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
	#h1_bbh_title{
		font-family: century gothic;
		font-size:4em; 
		font-weight: bold; margin-top: 2px; 
		margin-left: 10px; color: white; 
		padding-top: 3px;
    }
</style>
<body class="bg-light">
	<!--================================MODAL DE CONNEXION ========================================== -->
	<div class="modal fade" id="supBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header bg-primary">
						<h4 class="modal-title" id="exampleModalLabel">ANNULATION DE LA COMMANDE </h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="close">
							<span aria-hidden="true">&times;</span>
						</button>
							
					</div>
					<form action="supPosDepot.php" method="POST">
						<div class="modal-body">
							<input type="hidden" name="idSup" id="idSup" required="" autocomplete="off">
							<input type="hidden" name="qteSort" id="qteSort" required="" autocomplete="off">
			           		<div class="input-group mb-4">	 
			           			<h4>Voulez-vous annuler cette commande ?</h4>
			           		</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary btn-block" data-dismiss="modal">Annuler</button>
							<button type="submit" class="btn btn-primary btn-block">Confirmer</button>
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

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<marquee behavior="alternate" >
                <h1 id="h1_bbh_title" style="font-size: 60px; font-family: century gothic; font-weight: bold; margin-top: 2px; margin-left: 10px; color: sienna; padding-top: 3px;text-shadow: 8px 8px 2px white; text-shadow: 0 0 10px white, 0 0 10px white,0 0 10px white;">Ets Asifiwe B&Z
                </h1>
            </marquee> 

			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="../ac_sess/ac_cpt.php"><button type="button" class="btn btn-outline-light connexion"><h3>Retour</h3></button><span class="sr-only">(current)</span></a>
				</li>
			</ul>
			
		</div>
	</nav>

		<!--================================CONTENU ========================================== -->

	<div class="container-fluid spacer">
		<div class="row">
			<div class="col-md-4">
				<div class="row">
					
					<div class="col-md"><h3>AJOUTER UN PRODUIT DANS LE PANIER</h3></div>
				</div>
				
				<div class="row">
					<div class="col-md-12 spacer">
						<?php if (isset($_GET['msg'])):?>
							<?php
							switch ($_GET['msg']) {
								case 1:
									?>
									<div class="alert alert-success alert-dismissible" id="msg" role="alert">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h5>Commande ajoutée avec succès</h5>
									</div>
								<?php
									break;
								
								case 2:
									?>
									<div class="alert alert-primary alert-dismissible" id="msg" role="alert">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h5>Quantié pas disponible</h5>
									</div>
										
									<?php
									break;
								case 3:
								?>
								<div class="alert alert-success alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h5>Commande ajoutée avec succès</h5>
								</div>
									<?php
									break;
								case 4:
								?>
								<div class="alert alert-success alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h5>Commande modifiée avec succès</h5>
								</div>
									<?php
									break;
							}
						 ?>
								
						<?php endif; ?>
					</div>
				</div>
		          
		          <div id="boisson" style="margin-top: -30px">
		          	<form action="posBoissDepot.php" method="POST" class="spacer was-validated">
		          		
		           		<select id="liste-cat" class="form-control btn-lg" required="">
		           			<option value="" selected="" disabled="">Choisir une catégorie</option>
                               <?php 
                                   $select_id = $bd->query('SELECT * FROM catboiss');
                                   while($selec_id = $select_id->fetch()){
                               ?>
                               <option value=" <?php echo $selec_id['idCatBoiss']  ?>">
                               <?php echo $selec_id['designCatBoiss'];?>
                               </option>
                                <?php  }  ?>           
                        </select><br>
		           		<select name="idStock" id="list_boisson" class="form-control btn-lg" required="">
						    <option value="" selected="" disabled="">Choisir une boisson</option>
						</select><br>

						<input type="number" name="qteSort" class="form-control btn-lg" placeholder="Quantité" required="" autocomplete="off"><br>
						<button type="submit" class="btn btn-primary btn-lg btn-block" data-toggle="tooltip" title="Cliquer pour ajouter une commande" name="save">AJOUTER</button>
		           </form>
		          </div>
		    </div>
	      <div class="col-md-8">
	      	  	<div class="col col-md-12 text-right">
	      	  		<form action="../factureDepot.php" method="GET" class="was-validated">
	      	  			<button type="submit" name="facturer" class="btn btn-primary btn-lg " data-toggle="tooltip" title="Cliquer pour imprimer la facture de la table séléctionnée"><i class="fa fa-print"></i> Facturer Client</button>
							    <br>
	      	  		</form>
	      	  	</div>
	      	  <div class="row">
	      	  	<div class="col-md-8">
	      	  		<h4 class="spacer">Commande en cours
		          	<?php 
			          	$count = $bd->query("SELECT  COUNT(*) AS nbre FROM panier_dep, depot WHERE idDepot = id AND idDepot = '$idDep' AND etatpanier='wait' ");
	                    $nbre=$count->fetch(PDO::FETCH_ASSOC);
	                    ?>
	                           	<span class="badge badge-primary badge-pill">
	                           		<?php echo $nbre['nbre']; ?>
	                           		
		          </h4>
	      	  	</div>
	      	  	<div class="col-md-4  spacer">
	      	  		<h4>Total :
	      	  			<?php 
		          			$count = $bd->query("SELECT  SUM(ptpanier) AS nbre FROM panier_dep, depot WHERE idDepot = id AND idDepot = '$idDep' AND etatpanier='wait' ");
                    		$nbre=$count->fetch(PDO::FETCH_ASSOC);?>
                    		<span class="badge badge-primary badge-pill"><?php
                           echo number_format($nbre['nbre'],0).' Fc'; ?>
                           </span>
	      	  		</h4>
	      	  	</div>
	      	  </div>
	          

	          <div class="row">
	          	 <div class="col-md-12">
	 				<table id="tab" class="display table table-bordered table-striped table">
		          	<thead>
		          		<tr style="font-weight:bold" class="btn-primary">
                            <th>N°</th>    
                            <th>Produit</th>
                            <th>Qté</th>  
                            <th>PU</th>
                            <th>PT</th>
		          			<td>Action</td>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<?php
		          			$limit=8;
							$page = isset($_GET['page'])?$_GET['page']:1;
							$start = ($page-1)*$limit;
		          			$req = $bd->query("SELECT A.idPanier,A.designation,A.qtePanier,A.puPanier,A.ptPanier FROM panier_dep AS A, depot AS B WHERE idDepot = id AND idDepot = '$idDep' AND etatpanier='wait'  ORDER BY idpanier DESC LIMIT $start,$limit");

		          			$res = $bd->query("SELECT count(*) as total FROM panier_dep, depot WHERE idDepot = id AND idDepot = '$idDep' AND etatpanier='wait'  ORDER BY idpanier DESC ");
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
                                <td><?php echo $don['idPanier']; ?></td>
                                <td><?php echo $don['designation'] ?></td>
                                <td><?php echo $don['qtePanier'] ?></td>
                                <td><?php echo $don['puPanier'].'fc' ?></td>
                                <td><?php echo $don['ptPanier'].'fc' ?></td>
								<td>
									
									<button type="button" class="btn btn-primary supBtn"><span class="fa fa-trash"></span>	
									</button>
									
									
								</td>
						</tr>
		          		<?php
		          		 endwhile;?>
		          	</tbody>
		          </table>
		          
	          	 </div>
	          </div>
	          <div class="row">
	          	 <div class="col-5 offset-7">
	          	 	<nav aria-label="Page navigation example">
	          			<ul class="pagination pg-blue">
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Previous" href="venteBoissDepot.php?page=<?php echo $prec;?>">
			    				<span aria-hidden="true">&laquo;</span>
			    				<span class="sr-only" ="true">Previous</span>
			    			</a>
			    		</li>
			    		<?php 
			    			for($i=1;$i<=$nbrePage;$i++) {
			    		?> 
			    		<li class="page-item <?php echo(($page==$i)?'active':'')?>"><a  class="page-link" href="venteBoissDepot.php?page=<?php echo $i;?>"><?php echo $i;?></a></li>
			    		<?php
			    		}?>
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Next" href="venteBoissDepot.php?page=<?php echo $suiv;?>">
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
			<div class="col-md-6 offset-1">
				
			</div>
		</div>

		
	</div>
	

	<script src="bootstrap/js/popper.min.js"></script>
	<script src="bootstrap/js/jquery-3.4.1.min.js"></script>
	<script src="js/ajax1.min.js"></script>
	<script src="js/ajax.min.js"></script>
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
		  		$('#qte').val(data[2]);
		  	});
		  	$('.supBtn').on('click', function(){
		  		$('#supBtn').modal('show');

		  		$tr =$(this).closest('tr');
		  		var data = $tr.children('td').map(function(){
		  			return $(this).text();
		  		}).get();
		  		console.log(data);

		  		$('#idSup').val(data[0]);
		  		$('#qteSort').val(data[2]);
		  	});
		  	$('#plat').hide();
		  	$('#boisson').show();
		  	$('.plat').on('click',function(){
		  		$('#plat').show();
		  		$('#boisson').hide();
		  	});
		  	$('.boisson').on('click',function(){
		  		$('#boisson').show();
		  		$('#plat').hide();
		  	});
            $('#liste-cat').change(function(){
		  		var val= $('#liste-cat').val();
		  		$.ajax({
				type:"POST",
				url:"get_boisson.php",
				data:'idBoiss='+val,
				success:function(data){
				  $("#list_boisson").html(data);
				}
				});
		  	});
            $('[data-toggle="tooltip"]').tooltip();
		});
	</script>
</body>
</html>

<?php if(!empty($_POST["typeClient"])) {
	$cli = $_POST["typeClient"];
	echo $cli;}
?>