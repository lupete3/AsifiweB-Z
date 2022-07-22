
<?php
    require_once ('security_eco.php'); 
    require_once('bd_cnx.php');

    $dateJ = date('Y-m-d');

    $pointvente=1;

    $in = date("Y-m-d ", mktime(0,0,0,date("m")-0,1,date("Y")));
    $out = date("Y-m-d");
    $date = new DateTime($dateJ);
    $date->add(new DateInterval('P1D'));
    $date2 = $date->format('Y-m-d');
                            
    $req1 = $bd->prepare("SELECT SUM(ptVente) as total, SUM(beneficeBouteille) as beneficeBouteille FROM ventepdv WHERE dateVente BETWEEN ? AND ? AND idPvente='$pointvente'");
        $req1->execute(array($in,$out));
        $don1=$req1->fetch();

        $req2=$bd->prepare("SELECT idBoissVend,designBoiss,qteVendu,prixVente,ptVente,date_format(dateVente, '%d-%m-%Y à %T ') as dateVente FROM ventepdv  WHERE dateVente BETWEEN ? AND ? AND idPvente='$pointvente' GROUP BY  designBoiss");
        $req2->execute(array($in,$out));

    if (isset($_GET['save'])) {
        $in=$_GET['dateIn'];
        $out=$_GET['dateOut'];
        $pointvente=1;

        $req1 = $bd->prepare("SELECT SUM(ptVente) as total, SUM(beneficeBouteille) as beneficeBouteille FROM ventepdv WHERE dateVente BETWEEN ? AND ? AND idPvente='$pointvente'");
        $req1->execute(array($in,$out));
        $don1=$req1->fetch();

        $req2=$bd->prepare("SELECT idBoissVend,designBoiss,qteVendu,prixVente,ptVente,date_format(dateVente, '%d-%m-%Y à %T ') as dateVente FROM ventepdv  WHERE dateVente BETWEEN ? AND ? AND idPvente='$pointvente' GROUP BY  designBoiss");
        $req2->execute(array($in,$out));
        

        
    }
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
                
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" >
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top:30px;">
                        <p class="text-right text-uppercase " >Mois DE <?php $liste_mois=array('JANVIER', 'FEVRIER', 'MARS', 'AVRIL', 'MAI', 'JUIN', 'JUILLET', 'AOÛT', 'SEPTEMBRE', 'OCTOBRE', 'NOVEMBRE', 'DECEMBRE');
                                    echo $liste_mois[date(date('m'))-1].' / '.date('Y'); ?>
                                

                        <h4 class="text-center text-uppercase" style="text-align:center; border: 1px ">RELEVES DES VENTES MENSUELLES <?php 
                            $res=$bd->query("SELECT * FROM pointvente WHERE idPv='1'");
                            $don=$res->fetch(PDO::FETCH_ASSOC);
                            echo $don['libPv'];
                        ?> 
                        
                        </h4>

                        <div class="cacher">
                            <form action="" method="GET">
                                <div class="input-group">
                                    <div class="input-group-append">
                                        <span class="input-group-text">Date début</span>
                                    </div>
                                    <input type="date" name="dateIn" value="<?php echo(isset($_GET['dateIn'])?$_GET['dateIn']:'') ?>" class="form-control">
                                    
                                </div><br>
                                <div class="input-group">
                                    <div class="input-group-append">
                                        <span class="input-group-text">Date de fin</span>
                                    </div>
                                        <input type="date" name="dateOut"value="<?php echo(isset($_GET['dateOut'])?$_GET['dateOut']:'') ?>" class="form-control">
                                </div><br>
                                <div class="row">
                                    <div class="col-md-6 text-center">
                                        <button type="submit" class="btn btn-primary cacher" name="save">Visualiser</button><br>
                                    </div>
                                </div>
                            </form>
                        </div>
                        
                        
                    </div>
                
                </div>
                
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                    
                    
            </div>
        </div>
        <div class="container spacer">
            <div class="row spacer">

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <table class="table table-bordered table-striped spacer">
                        <thead>
                            <tr style="font-weight:bold" >
                            <th>N°</th>
                            <th>Qualité/Nature</th>
                            <th>Ventes/Quantité</th>
                            <th>Prix Achat</th>
                            <th>Prix Vente </th>
                            <th>Prix Total </th>
                            <th>Bénéf/Bouteille </th>
                            <th>Profit Tot </th>
                           
                        </tr>
                        </thead>
                        <tbody>
                                <?php
                        
                                //if(isset($_GET['save'])){
                                    $num=1;
                                     while($don2=$req2->fetch()):

                                        $idProd = $don2['idBoissVend'];
                                        $designBoiss = $don2['designBoiss'];

                                        $req3=$bd->prepare("SELECT SUM(qteVendu) as totalQteVente, SUM(prixVente) as totalPrixVente  FROM ventepdv  WHERE designBoiss = ? AND dateVente BETWEEN ? AND ? AND idPvente='$pointvente' ");
                                        $req3->execute(array($designBoiss,$in,$out));
                                        $resu=$req3->fetch(PDO::FETCH_ASSOC);


                                        $req=$bd->query("SELECT paBoiss FROM prodboiss WHERE idBoiss='$idProd'");
                                        $result=$req->fetch(PDO::FETCH_ASSOC);
                                

                                        
                                        
                                ?>     
                                <tr>
                                       <td><?php echo $num; ?></td>
                                       <td><?php echo $don2['designBoiss'] ?></td>
                                       <td><?php echo $resu['totalQteVente'] ?></td>
                                       <td><?php echo $result['paBoiss'].' Fc' ?></td>
                                       <td><?php echo $don2['prixVente'].' Fc' ?></td>
                                       <td><?php echo $resu['totalQteVente'] * $don2['prixVente'].' Fc' ?></td>
                                       <td><?php echo $don2['prixVente'] - $result['paBoiss'].' Fc' ?></td>
                                       <td><?php echo ($don2['prixVente'] - $result['paBoiss']) * $resu['totalQteVente'].' Fc' ?></td>
                                      
                                        <?php $ben = ($don2['prixVente'] - $result['paBoiss']) * $resu['totalQteVente']; ?>
                                        
                                </tr>
                                <?php
                                $num++;
                                 endwhile;
                                 
                                //}?>
                            
                             <tr>
                                <td colspan="5"><strong><h5>Total</h5></strong></td>
                                <td><strong><h5><?php
                                    
                                 echo   ((isset($don1['total']))?number_format($don1['total'],0):0).' Fc';
                                    
                                 ?> 
                                </h5></strong>
                                 </td>
                                 <td></td>
                                 <td><h5><?php
                                   $benn = ((isset($ben))?$ben:0); 
                                   echo   ((isset($don1['beneficeBouteille']))?number_format($don1['beneficeBouteille'],0):0).' Fc';
                                    
                                 ?> </td>
                               
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 offset-4 spacer">
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
            </div><br><br>
            <div class="row space">
                
                <?php
                
                    $req = $bd->query("SELECT * FROM users WHERE user_function = 'Gerant'");
                    $don=$req->fetch(); 
                
                    $req2 = $bd->query("SELECT * FROM barman LIMIT 0,1");
                    $don2=$req2->fetch(); 

                ?>

                <div class="col col-md-6 offset-1">
                   <h5>Le Gérant <br><br> <strong><?php echo strtoupper($don['user_name']); ?></strong></h5> 
                </div>
                
                <div class="col col-md-5">
                    <h5>Le Magasinier <br><br> <strong >  <?php echo strtoupper($don2['brm_name']); ?></strong></h5>
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
                $('.cacher').hide();
                if (!window.print()) {
                    $('.cacher').show();
                }
            });
        });
    </script>
            

    </body>
</html>
             
                
            </div>
        </div>

    <script src="pages/bootstrap/js/popper.min.js"></script>
    <script src="pages/bootstrap/js/jquery-3.4.1.min.js"></script>
    <script src="pages/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.print').on('click',function(){
                $('.cacher').hide();
                if (!window.print()) {
                    $('.cacher').show();
                }
            });
            $('#liste_cat').change(function(){
                var val= $('#liste_cat').val();
                $.ajax({
                type:"POST",
                url:"pages/get_boisson.php",
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
