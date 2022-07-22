<?php
    require_once ('security_eco.php');
    require_once('bd_cnx.php');

    $dateJ=date('Y-m-d');
    $req = $bd->prepare("SELECT date_format(A.dateSortie,'%d-%m-%Y') as dateSortie,A.qteSortie,B.prixDivCuis,B.designDivCuis FROM approvcuisine as A,diverscuisine as B WHERE B.idDivCuis=A.idDivCuis AND  A.dateSortie LIKE '%$dateJ%'");
        $req->execute();
        $req1 = $bd->prepare("SELECT SUM(qteSortie*prixDivCuis) AS total FROM approvcuisine as A,diverscuisine as B WHERE B.idDivCuis=A.idDivCuis AND dateSortie LIKE '%$dateJ%'");
        $req1->execute();
        $don1=$req1->fetch(PDO::FETCH_ASSOC);
        $req2=$bd->prepare('SELECT designDivCuis FROM diverscuisine');
        $req2->execute();
        $don2=$req2->fetch(PDO::FETCH_ASSOC);

    if (isset($_GET['save'])) {
        $in=$_GET['dateIn'];
        $out=$_GET['dateOut'];

        $req = $bd->prepare("SELECT date_format(A.dateSortie,'%d-%m-%Y') as dateSortie,A.qteSortie,B.prixDivCuis,B.designDivCuis FROM approvcuisine as A,diverscuisine as B WHERE B.idDivCuis=A.idDivCuis AND  A.dateSortie BETWEEN ? AND ?");
        $req->execute(array($in,$out));
        $req1 = $bd->prepare("SELECT SUM(qteSortie*prixDivCuis) AS total FROM approvcuisine as A,diverscuisine as B WHERE B.idDivCuis=A.idDivCuis AND dateSortie BETWEEN ? AND ?");
        $req1->execute(array($in,$out));
        $don1=$req1->fetch(PDO::FETCH_ASSOC);
        $req2=$bd->prepare('SELECT designDivCuis FROM diverscuisine');
        $req2->execute();
        $don2=$req2->fetch(PDO::FETCH_ASSOC);
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
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top:70px;">
                        <h3 class="text-center text-uppercase" style="text-align:center; border: 1px solid black">Fiche achat produits connexe cuisine
                        
                        </h3>
                        
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
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-6 text-center">
                                        <button type="submit" class="btn btn-primary" name="save">Visualiser</button><br>
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
                            <tr>
                                <th>N°</th>
                                <th>DESIGNATION</th>  
                                <th>PU</th>
                                <th>QUANTITE</th>
                                <th>DATE </th>
                                <th>PT</th> 
                                <th>OBSERVATION</th>
                            </tr>
                        </thead>
                        <tbody>
                                <?php
                                
                                    $num=1;
                                    
                                    while($don=$req->fetch()):
                                        ?>
                                <tr>
                                        <td><?php echo $num; ?></td>
                                        
                                       <td><?php echo $don['designDivCuis'] ?></td>
                                        <td><?php echo $don['prixDivCuis'] ?></td>
                                       <td class="text-right"><?php echo $don['qteSortie'].' '.$don['unite'] ?></td>
                                       <td class="text-right"><?php echo $don['dateSortie'] ?></td>

                                       
                                       <td class="text-right"><?php echo ($don['qteSortie']*$don['prixDivCuis']) ?></td>
                                        <td></td>
                                        
                                </tr>
                                <?php
                                $num++;
                                 endwhile;
                                ?>
                             <tr>
                                <td colspan="5"><strong><h4>Total</h4></strong></td>
                                <td class="text-right"><strong><h4><?php
                                    
                                        echo(isset($_GET['save'])?number_format($don1['total'],2).' $':number_format($don1['total'],2).'$');
                                    
                                 ?></h4></strong>
                                 </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 offset-8 spacer">
                    <h class="text-center"><em>Fait à Uvira, le <?php $madate= date('d-m-Y H:i:s'); 
                            list($annee,$mois,$jour,$h,$m,$s)=sscanf($madate,"%d-%d-%d %d:%d:%d"); 
                            $h+=2; 
                            $timestamp=mktime($h,$m,$s,$mois,$annee,$jour); 
                            $new_date=date('d-m-Y à H:i:s',$timestamp); 
                            echo $new_date; 
                        ?></em> </h>
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
