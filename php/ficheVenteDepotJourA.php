<?php
    require_once ('security_admin.php');
   require_once('bd_cnx.php');
 ?>
<!DOCTYPE html>
<html>
    <head>
        <title>Ets Asifiwe B&Z</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=devidev-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" type="text/css" href="pages/bootstrap/font-awesome-4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="pages/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="pages/bootstrap/css/print.css" media="print">
    </head>
    
    <body id="">
        
        <div class="container spacer" style="border-bottom:3px solid black;">
            <div class="row" style="border-bottom:1px solid black;margin-bottom:2px">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <center>
                            <p style= "">
                                <img src="../docs/img/logooooo.png" width="100%;" alt="">
                            </p>
                        </center>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-8 col-xs-8 text" >
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top:0px; margin-top: 30px">
                        <p class="text-right " >Journée du <?php echo date('d/m/Y') ?></p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top:20px; margin-top: 10px">
                        <h3 class="text-center text-uppercase" style="text-align:center; border: 1px solid black">Rapport Journalier de vente Dépôt Rélais 1</h3>
                    </div>
                
                </div>
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                    
            </div>
        </div>
        <div class="container">
            <div class="row spacer" >

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <table class="table table-bordered table-striped table-sm">
                        <thead>
                            <tr>
                                <th>N°</th>
                                <th>QUALITE/NATURE</th>
                                <th>Q.INI</th>
                                <th>ENTREES</th>
                                <th>STOCK</th>
                                <th>PA</th>
                                <th>VENTES</th>
                                <th>PRIX VENTE</th>
                                <th>TOTAL VENTES</th>
                                <th>PROF/ <br>CASIER</th>
                                <th>PROFIT TOT</th>
                                <th>STOCK FINAL</th>
                            </tr>
                        </thead>
                        <tbody>
                                <?php
                                $req = $bd->query("SELECT * FROM prodboiss AS A, catboiss AS B, depot AS C WHERE B.idCatBoiss=A.idCatBoiss AND A.idDepot = C.id AND A.idDepot = 1");
                                $num=1;
                                $totVente = 0;
                                $totProfit = 0;
                                
                                while($don=$req->fetch()):
                                    ?>
                            <tr>
                                    
                                    <?php 
                                        $idB = $don['idBoiss'];
                                        $dtJour = date('Y-m-d');

                                        //Calcul pour trouver le stock initial
                                        $req0 = $bd->query("SELECT * FROM `stock_init` AS A, `depot` AS B WHERE A.idBoiss ='$idB' AND A.dateStock='$dtJour' AND A.idDepot = B.id AND A.idDepot = 1");
                                        $don0=$req0->fetch();
                                        $stockInit = (($don0['qnteSt'] != NULL)?$don0['qnteSt']:$don['qnteBoiss']);

                                        //Calcul pour trouver Approv Buvette
                                        $req1 = $bd->query("SELECT SUM(qnteApprov) as qnteApprov FROM approvboiss AS A,depot AS B WHERE A.idBoiss = '$idB' AND A.idDepot = B.id AND A.dateApprov LIKE '%$dtJour%' AND A.idDepot = 1  ");
                                        $don1=$req1->fetch();

                                        //Calcul pour trouver Entree dans le depot
                                        $req2 = $bd->query("SELECT SUM(qnteSort) as qnteSort FROM sortieboiss AS A, depot AS B WHERE A.idDepot = B.id AND A.idBoiss = '$idB' AND A.dateSort ='$dtJour' AND A.idDepot = 1");
                                        $don2=$req2->fetch();

                                        //Calcul pour calculer le stock apres vente et sortie
                                        $stock = ($stockInit - $don2['qnteSort']) 
                                        + $don1['qnteApprov'];

                                        //Calcul pour trouver les ventes effectuees dans le depot
                                        $req3 = $bd->query("SELECT SUM(qteVendu) as qteVendu FROM ventedepot AS A, depot AS B WHERE A.idDepot = B.id AND A.idBoissVend = '$idB' AND dateVente ='$dtJour' AND A.idDepot = 1 ");
                                        $don3=$req3->fetch();

                                        //Calcul pour calculer total en argent apres vente en depot
                                        $ptVente = ($don['pvCasier'] * $don3['qteVendu']);

                                        //Calcul pour calculer le profit par casier apres vente en depot
                                        $profitCasier = ($don['pvCasier'] - $don['paCasier']);

                                        //Calcul pour calculer le profitTotal obtenu apres vente en depot
                                        $profitTotVente = ($profitCasier * $don3['qteVendu']);


                                    ?>
                                    <td> <?php echo $num; ?></td>
                                    <td><?php echo $don['designBoiss'] ?></td>
                                    <td><?php echo $stockInit ?></td>
                                    <td class="text-right"><?php echo $don1['qnteApprov'] ?></td>
                                    <td class="text-right"><?php echo $stock; ?></td>
                                    <td class="text-right"><?php echo number_format($don['paCasier'],0).'fc' ?></td>
                                    <td class="text-right"><?php echo $don3['qteVendu'] ?></td>
                                    <td class="text-right"><?php echo number_format($don['pvCasier'],0).'fc' ?></td>
                                    <td class="text-right"><?php echo number_format($ptVente,2).'fc' ?></td>
                                    <td class="text-right"><?php echo number_format($profitCasier,0).'fc' ?></td>
                                    <td class="text-right"><?php echo number_format($profitTotVente,0).'fc' ?></td>
                                    <td class="text-right"><?php echo $don['qnteBoiss'] ?></td>
                                    
                            </tr>
                            <?php
                            $num++;
                            $totVente += $ptVente;
                            $totProfit += $profitTotVente;
                             endwhile;?>
                             <tr>
                                <td colspan="8"><strong><h6>Total</h6></strong></td>
                                <td class="text-right"><strong><h6><?php 
                                    echo number_format($totVente,0).' Fc';
                                 ?></h6></strong>
                                 </td>
                                 <td></td>
                                 <td class="text-right"> <strong><h6><?php 
                                    echo number_format($totProfit,0).' Fc';
                                 ?></h6></strong> </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <?php
                
                    $req = $bd->query("SELECT * FROM users, depot WHERE idDepot = id AND user_function = 'Gerant'");
                    $don=$req->fetch(); 
                
                    $req2 = $bd->query("SELECT * FROM users,depot WHERE idDepot = id AND user_function = 'Chef_Depot_Relais' AND idDepot = 1");
                    $don2=$req2->fetch(); 

                ?>

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 spacer">
                   <h5>Le Gérant <br><br> <strong><?php echo strtoupper($don['user_name']); ?></strong></h5> 
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  spacer">
                    <h5>Le Magasinier <br><br> <strong >  <?php echo strtoupper($don2['user_name']); ?></strong></h5>
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 spacer">
                    <h class="text-center"><em>Fait à Baraka, le 
                        <?php $madate= date('d-m-Y H:i:s'); 
                            list($annee,$mois,$jour,$h,$m,$s)=sscanf($madate,"%d-%d-%d %d:%d:%d"); 
                            $h+=2; 
                            $timestamp=mktime($h,$m,$s,$mois,$annee,$jour); 
                            $new_date=date('d-m-Y à H:i:s',$timestamp); 
                            echo $new_date; 
                        ?>
                    </em> </h>
                </div>
                
            </div>
            <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 offset-9">
                        <button type="button" class="btn btn-primary print pull-right"><span class="fa fa-print"></span> Imprimer</button>
                    </div>
                </div>
        </div>

    <script src="pages/bootstrap/js/popper.min.js"></script>
    <script src="pages/bootstrap/js/jquery-3.4.1.min.js"></script>
    <script src="pages/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.print').on('click',function(){
                window.print();
            });
        });
    </script>
            

    </body>
</html>
             