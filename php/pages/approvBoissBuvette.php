<?php 
	require_once ('../security_brmn.php');
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
					<h4 class="modal-title" id="exampleModalLabel">MODIFICATION ENTREE</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
						
				</div>
				<form action="upApprovBuv.php" method="POST" class="was-validated">
					<div class="modal-body">
						<input type="hidden" name="id" id="id" required="" autocomplete="off"><br>
						<div class="input-group mb-4">	           			
							<div class="input-group-append">
		           				<span class="input-group-text" id="basic-addon2">Quantité Achetée</span>
		           			</div>
		           			<input type="text" name="qnteApprov" class="form-control" id="qte" required="" autocomplete="off"><br>
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
					<a class="nav-link" href="../ac_sess/ac_bman.php"><button type="button" class="btn btn-outline-light connexion"><h3>Retour</h3></button><span class="sr-only">(current)</span></a>
				</li>
			</ul>
			
		</div>
	</nav>

		<!--================================CONTENU ========================================== -->

	<div class="container-fluid spacer">
		<div class="row">
			<div class="col-md-3">
		          <h3 class="title">AJOUTER ENTREE</span></h3>
		          <?php
		          		if (isset($_POST['save'])) {

							  $req=$bd->prepare('SELECT * FROM prodboiss WHERE idBoiss=?');
							  $req->execute(array($_POST['idBoiss']));
							  $don=$req->fetch(PDO::FETCH_ASSOC);

							  $req1=$bd->prepare('SELECT * FROM stockpv WHERE idBoiss=?');
							  $req1->execute(array($_POST['idBoiss']));
							  $don1=$req1->fetch(PDO::FETCH_ASSOC);

							  $a=$_POST['idBoiss'];
							  $b=$don['puBoiss'];
							  $c=$_POST['qnteApprov'];
							  $d = $b*$c;

							  $req0=$bd->prepare('SELECT * FROM stock_init_buv WHERE idBoiss=? AND dateStock = ?');
							  $req0->execute(array($a,date('Y-m-d')));
							  $done=$req0->fetch(PDO::FETCH_ASSOC);

							  if(!$done){
							  	$dtStock = date('Y-m-d');
							  	$qteInit = $don1['qtStock'];
							  	$req1=$bd->prepare('INSERT INTO stock_init_buv(dateStock,idBoiss,qnteSt) VALUES(?,?,?)');
							  	$req1->execute(array($dtStock,$a,$qteInit));
							  }

							  $qte = $don1['qtStock'];
							  $qte+=$c;
							  $req=$bd->prepare('UPDATE stockpv SET qtStock=? WHERE idBoiss=?');
							  $req->execute(array($qte,$a));

                              

							  $req=$bd->prepare('INSERT INTO approvboissbuv(idBoiss,qnteApprov,puApprov,ptApprov) VALUES(?,?,?,?)');
							  
							if ($req->execute(array($a,$c,$b,$d)))
							     {
						    ?>
								<div class="alert alert-success alert-dismissible" id="msg" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4>Entrée ajoutée</h4>
								</div>
								<?php
							      }else{
							        ?>
									<div class="alert alert-danger alert-dismissible" id="msg" role="alert" class="spacer">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="text-center">Entrée non ajouté</h4>
									</div>
									<?php
							      }
							  }							
		           ?>
		           <form action="" method="POST" class="spacer was-validated">
		           		<select id="" class="form-control" required="" name="idBoiss">
		           			<option selected="" disabled="" value="">Sélectionner produit</option>
                               <?php 
                                   $req1 = $bd->prepare('SELECT A.designBoiss, B.qtStock, B.idBoiss FROM prodboiss AS A,stockpv AS B WHERE A.idBoiss = B.idBoiss ORDER BY A.designBoiss');
  									$req1->execute();
                                   while($don1=$req1->fetch(PDO::FETCH_ASSOC)) {
								?>
								  <option value="<?php echo $don1["idBoiss"]; ?>"><?php echo $don1["designBoiss"].'-->'.$don1['qtStock']; ?></option>
                                <?php  }  ?>           
                        </select><br>
		           		<input type="text" name="qnteApprov" class="form-control" placeholder="Quantité en Bouteille" required="" autocomplete="off"><br>
		           		<div class="input-group mb-4">	           			
					    </div>	
						<button type="submit" class="btn btn-primary btn-block" name="save">Enregistrer</button>
		           </form>
		    </div>
	      <div class="col-md-9">
	          <h3 class="title">LISTE DES ENTREES</span></h3>
	          <div class="row spacer">
	          	 <div class="col-12">
	 				<table id="tab" class="display table table-bordered table-striped table">
		          	<thead >
		          		<tr  style="font-weight:bold" class="btn-primary">
		          			<th>N°</th>  
                            <th>Produit</th>  
                            <th>Qte/Bouteille entrée </th>  
                            <th>PU</th>
                            <th>PT</th>   
                            <th>Date Approvisionnement</th>   
		          			<td>Action</td>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<?php
		          			$limit=6;
							$page = isset($_GET['page'])?$_GET['page']:1;
							$start = ($page-1)*$limit;

							$req = $bd->query("SELECT * FROM approvboissbuv as A,prodboiss as B WHERE B.idBoiss=A.idBoiss ORDER BY idApprovBoiss DESC LIMIT  $start,$limit");
							
							$res = $bd->query('SELECT COUNT(*) as total FROM approvboissbuv as A,prodboiss as B WHERE B.idBoiss=A.idBoiss');

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
		          		<tr class="table-sm">
                                <td><?php echo $don['idApprovBoiss'] ?></td>
                                <td><?php echo $don['designBoiss'] ?></td>
                                <td><?php echo $don['qnteApprov'] ?></td>
                                <td><?php echo $don['puApprov'].' Fc' ?></td>
                                <td><?php echo $don['ptApprov'].' Fc' ?></td>
                                <td><?php echo $don['dateApprov'] ?></td>
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
	          	 <div class="col-3 offset-9">
	          	 	<nav aria-label="Page navigation example">
	          			<ul class="pagination pg-blue">
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Previous" href="approvBoissBuvette.php?page=<?php echo $prec;?>">
			    				<span aria-hidden="true">&laquo;</span>
			    				<span class="sr-only" ="true">Previous</span>
			    			</a>
			    		</li>
			    		<?php 
			    			for($i=1;$i<=$nbrePage;$i++) {
			    		?> 
			    		<li class="page-item <?php echo(($page==$i)?'active':'')?>"><a  class="page-link" href="approvBoissBuvette.php?page=<?php echo $i;?>"><?php echo $i;?></a></li>
			    		<?php
			    		}?>
			    		<li class="page-item">
			    			<a  class="page-link" aria-label="Next" href="approvBoissBuvette.php?page=<?php echo $suiv;?>">
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
		  		$('#qte').val(data[2]);
		  	});
		  	$('#liste-cat').change(function(){
		  		var val= $('#liste-cat').val();
		  		$.ajax({
				type:"POST",
				url:"get_boisson_buv.php",
				data:'idBoiss='+val,
				success:function(data){
				  $("#list_boisson").html(data);
				}
				});
		  	});
		});
	</script>
</body>
</html>