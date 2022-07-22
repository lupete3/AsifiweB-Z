<?php 
	require_once ('../security_eco.php'); 
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
		font-family: Buxton Sketch;
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
				<div class="modal-header bg-primary">
					<h4 class="modal-title" id="exampleModalLabel">MODIFICATION ENTRE CAISSE</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
						
				</div>
				<form action="upCaisse.php" method="POST" class="was-validated">
					<div class="modal-body">
						<input type="hidden" name="id" id="id" required="" autocomplete="off">
						<input type="hidden" name="mtCaisse" id="mtC" required="" autocomplete="off">
						
		           		<div class="input-group mb-4">	
		           		<input type="text" name="mEntreCaisse" id="mt"class="form-control btn-lg" placeholder="Montant " required="" autocomplete="off">	
		           		</div>
		           		<div class="input-group mb-4">	           			
		           			<input type="text" name="motifEntreCaisse" id="motif"class="form-control btn-lg" placeholder="Motif " required="" autocomplete="off">
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
                        <h1 id="h1_bbh_title" style="font-size: 60px; font-family: century gothic; font-weight: bold; margin-top: 2px; margin-left: 10px; color: #b90112; padding-top: 3px;text-shadow: 8px 8px 2px white; text-shadow: 0 0 10px white, 0 0 10px white,0 0 10px white;">Ets Asifiwe B&Z</h1></marquee>
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

		          <h4 class="title">NOUVELLE ENTREE CAISSE</span></h4>
		          <?php
		          		if (isset($_POST['save'])){
		          			
		          			$a=$_POST['mEntreCaisse'];
							$b=$_POST['motifEntreCaisse'];
							
		          			
					            
					        $req = $bd->prepare('INSERT INTO entreecaisse (montantEntree,motifEntree) VALUES (?,?)');
					        $req->execute(array($a,$b));


					        if ($req) { 
					        	$req = $bd->query('SELECT montantCaisse FROM caisse');
					        	$don=$req->fetch(PDO::FETCH_ASSOC);
					        	$a+=$don['montantCaisse'];

					        	$req = $bd->prepare('UPDATE  caisse SET montantCaisse=?');
					        	$req->execute(array($a));

					        	?>
					                <div class="alert alert-success alert-dismissible" id="msg" role="alert">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4>Activité ajoutée</h4>
									</div>
					                <?php 
					            }else{ ?>

					        	<div class="alert alert-danger alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4>Certains champs sont vides</h4>
								</div>

					        <?php } } 

		           ?>
		           <form action="" method="POST" class="spacer was-validated">


		           		<div class="input-group mb-4">
		           			<input type="text" name="mEntreCaisse" class="form-control btn-lg" placeholder="Montant " required="" autocomplete="off">
		           			<div class="input-group-prepend">
		           				<span class="input-group-text "><strong>Fc</strong></span>
		           			</div>	
		           		</div>
		           		<div class="input-group mb-4">	           			
		           			<input type="text" name="motifEntreCaisse" class="form-control btn-lg" placeholder="Motif " required="" autocomplete="off">
		           		</div>
		           		
						<button type="submit" class="btn btn-primary btn-block" name="save">Enregistrer</button>
		           </form>
		    </div>
	      <div class="col-md-9">
	      	<div class="row">
				<div class="col-md-5 col-sm-5 col-lg-5 col-xl-5">
					<h3 class="title">LISTE DES ENTREES EN CAISSE </h3>
				</div>
					<?php $req = $bd->query('SELECT montantCaisse FROM caisse');
						        	$don=$req->fetch(PDO::FETCH_ASSOC); ?>
					<div class="col-md-5 col-sm-5 col-lg-5 col-xl-5 offset-2" >
						<h4>Disponible : <?php echo number_format($don['montantCaisse'],0); ?> Fc </h4>
					</div>
	          	</div>
	          
	          <div class="row spacer">
	          	 <div class="col-12">
	 				<table id="tab" class="display table table-bordered table-striped table">
		          	<thead>
		          		<tr style="font-weight:bold" class="btn-primary">
                            <th>N°</th>  
                            <th>Montant</th>  
                            <th>Motif</th>
                            <th>Action</th>  
                            
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<?php
		          			$limit=20;
							$page = isset($_GET['page'])?$_GET['page']:1;
							$start = ($page-1)*$limit;

							$req = $bd->query("SELECT * FROM entreecaisse ORDER BY idEntreeCaiss ");
							
							$res = $bd->query("SELECT COUNT(*) as total FROM entreecaisse");

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
                                <td><?php echo $don['idEntreeCaiss'] ?></td>
                                <td><?php echo $don['montantEntree'] ?></td>
                                <td><?php echo $don['motifEntree'] ?></td>
                                
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
		  		$('#mt').val(data[1]);
		  		$('#mtC').val(data[1]);
		  		$('#motif').val(data[2]);
		  		
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