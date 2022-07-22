<?php
    require_once ('security_cpt.php'); 
    require_once('bd_cnx.php');
    //$point=isset($_SESSION['profil']['agent5'])?$_SESSION['profil']['agent5']['idPv']:'';
     $dateJ=date('Y-m-d');
     $etat='wait';
    if (isset($_GET['facturer'])) { 
        $req=$bd->query("SET NAMES 'utf8'");
        $etat='wait';

        
        $req=$bd->prepare('SELECT A.designation,A.qtePanier,A.puPanier,A.ptPanier FROM panier_dep AS A, depot AS B WHERE idDepot = id AND etatPanier=?');
        $req->execute(array($etat));
        

        
    }
    
 ?>
<!DOCTYPE html>

<html>
    <head>
        <title>Ets ASIFIWE B & Z</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=devidev-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" type="text/css" href="pages/bootstrap/font-awesome-4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="pages/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="pages/bootstrap/css/print.css" media="print">
    </head>
    
    <body id="" style="font-size: 20px; margin-left: -0px">
        <div class="container-fluid">
            
            <div class="row">

                            <div class="col-md-7  valider">
                                <div class="form-check mb-4"> 
                                <label style="font-size: 24px; color: blue">Choisir le type de client </label> <br>
                                <input type="radio" id="cli" name="client" class=" form-check-input checkbox-warning" onchange="myFunction(this.value)" value="CLIENT D'HONNEUR" required="">
                                <label for="cli" style="font-size: 28px; margin-right: 30px; color: chocolate"><b>CLIENT D'HONNEUR</b> </label> 
                                <input type="radio" id="depot" name="client" class=" form-check-input checkbox-warning" onchange="myFunction(this.value)" value="BUVETTE" required="">
                                <label for="depot" style="font-size: 28px; color: green"><b>BUVETTE</b></label> 
                                
                            </div><br>

                                
                            <!--   Valider  -->
                            
                            </div>
                            <div class="row">
                            <div class="col-md-3 valider">
                                <form  method="POST" action="validerfactDepot.php" class="was-validated">

                                    <div class="input-group">
                                        
                                        

                                        <input type="hidden" name="destination" id="destination" value="" required="">

                                        
                                        
                                        <button type="submit" class="btn btn-success  pull-right "><span class="fa fa-check-circle"></span> Confirmer</button> 

                                    </div>
                                </form>


                            </div>
                            <div class="col-md-3 offset-1 valider">
                                <a href="pages/venteBoissDepot.php"><button type="button" class="btn btn-danger "><span class="fa fa-chevron-circle-left"></span> Retour</button></a>
                            </div>
                            <div class="col-md-3 offset-1">
                                <button type="button" class="btn btn-primary print pull-right"><span class="fa fa-print"></span> Imprimer</button>
                            </div>
                        </div>
                        </div>
            <div class="col-lg-12" style=" margin-bottom:10px; " >
                <div class="row" style="margin-bottom:5px; margin-top:10px; " >

                            <div class="col col-md-5"> 
                             <p style= " margin-left:0px;">
                                <img src="../docs/emoticones/log1.png"  alt="logo" style="width:30%;">
                            </p>
                            </div>
                            <div class="col col-md-7 text-left style="padding-left:-80px"">
                                <p style="font-family:Century Gothic; font-size:2.3em; "><b>FACTURE</b></b></p>
                            
                                <p style="font-family:Century Gothic; font-size:2em; text">
                                    ETS ASIFIWE B&Z
                                </p>
                            </div>
                </div>  

                <?php $client=$bd->prepare("SELECT * FROM users WHERE user_function=?");
                                $client->execute(array('Chef_Depot_Relais'));
                                $found=$client->fetch(PDO::FETCH_ASSOC);
                                ?>
            
                <div class="row" style="margin-bottom:10px; margin-left: -20px " >
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <center>
                            
                            <h1 style="font-family:Century Gothic; font-size:2.3em; ">======================================================</h1>
                            <table style="width: 100%" class=" ">
                               
                                <tbody style="font-family:arial; font-size:0.9em;">
                                    <tr>
                                        <td>Adresse:</td>
                                        <td class="text-center">Av Paibaz, Baraka</td>
                                    </tr>
                                    <tr>
                                        <td>Tél :</td>
                                        <td class="text-center">(+243) 978685961, 824234556</td>
                                    </tr>
                                    <tr>
                                        <td>Date :</td>
                                        <td class="text-center"><?php echo date('d/m/Y').' à '.date('H:i'); ?></td>
                                    </tr>
                                    <tr>
                                        <td>Chef Dépôt :</td>
                                        <td class="text-center"><?php 
                            
                                            echo($found['user_name']); ; ?></td>
                                    </tr>
                                    <tr>
                                        <td>Client :</td>
                                        <td class="text-center"><label id="client"></label></td>
                                    </tr>
                                </tbody>
                            </table>
                            
                             <h1>======================================================</h1>  
                             
                            </p>
                        </center>        
                    </div>
                    
                </div>
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="row" style="margin-bottom:10px;  " >
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                   

                    <div class="container-fluid">
                        <div class="row spacer" style="margin-bottom:20px; " >

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <table class="table table-bordered table-striped table-sm" style="font-size: 14px; font-family: verdana" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Désignation</th>
                                            <th>Qté</th>
                                            <th>PU</th>
                                            <th>Prix Tot</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $num=1;
                                            while($don=$req->fetch(PDO::FETCH_ASSOC)){
                                                ?>
                                        <tr>
                                            <td><?php echo $don['designation'] ?></td>
                                            <td><?php echo $don['qtePanier'] ?></td>
                                            <td><?php echo $don['puPanier'] ?></td>
                                            <td><?php echo ($don['ptPanier']); ?></td>
                                           
                                        </tr>
                                                <?php
                                                $num++;
                                            }
                                         ?>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    
                    <div class="row spacer" style="margin-bottom: 1.3em;">

                    	<table class="container-fluid">
                    		<tr class="">
                                <td class="text-center">
                                   <p class="" style="font-family:Century Gothic; font-size:1.0em;">Total</p> 
                                </td>
                    			<td class="text-center">
									<p class="" style="font-family:Century Gothic; font-size:1.0em;">
	                                
	                                <!-- Montant HT : --><?php 
	                                $req1=$bd->prepare('SELECT SUM(ptPanier) as total, SUM(puPanier) as totPu, SUM(qtePanier) as totQte FROM panier_dep WHERE etatPanier=?');
	                                $req1->execute(array($etat));
	                                $don=$req1->fetch();
	                               // $tva=$don['total']*0.16;
	                                //echo $don['total']-$tva.' Fc';

	                             ?> 
                                <span><strong><?php echo $don['total'].' Fc'; ?></strong></span><br>
                                
                            </p>
                    		</td>

                    		</tr>
                    	</table>
                    </div> 

                    <div class="container-fluid">
                    	<div class="row">
                    		<center style="width: 100%;">
	                    		<span class="title text-center" style="font-size:2em; font-family: century Gothic; font-weight: bold;" >
	                    			Merci pour la confiance !</span><br> 

	                    		<p class="text-center" style="font-size:1.8em; font-family: century Gothic">
	                    			Copyright &copy; Kivu Freelance
	                    		</p>
                    		</center>
                    	</div>
                    </div> 
                    
                </div>
                
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style=""></div>   
            </div>
        </div>
        
        <style>
            th,td{font-size: 2em;}
        </style>
        

    <script src="pages/bootstrap/js/popper.min.js"></script>
    <script src="pages/bootstrap/js/jquery-3.4.1.min.js"></script>
    <script src="pages/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.print').on('click',function(){
                $('.valider').hide();
                if (!window.print()) {
                    $('.valider').show();
                };
            });
        });

       
    </script>
     <script>
         function myFunction(val){
            $('#idCli').val(val);
            $('#destination').val(val);

            document.getElementById("client").innerHTML = val;
         }
     </script>       

    </body>
</html>
             