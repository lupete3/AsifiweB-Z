<?php
    require_once ('security_admin.php');
    require_once('bd_cnx.php');
    $dateJ=date('Y-m-d');

    $req = $bd->prepare("SELECT  montantEntree,date_format(dateEntree,'%d-%m-%Y') as dateEntree,motifEntree FROM entreeCaisse WHERE  dateEntree LIKE '%$dateJ%' ");
        $req->execute();
        $req1 = $bd->prepare("SELECT SUM(montantEntree) AS total FROM entreeCaisse WHERE dateEntree LIKE '%$dateJ%'");
        $req1->execute();
        $don1=$req1->fetch(PDO::FETCH_ASSOC);

    $req2 = $bd->prepare("SELECT  agent,montantSortie,date_format(dateSortie,'%d-%m-%Y') as dateSortie,motifSortie FROM sortieCaisse WHERE  dateSortie LIKE '%$dateJ%'");
        $req2->execute();
        $req3 = $bd->prepare("SELECT SUM(montantSortie) AS total FROM sortieCaisse WHERE dateSortie LIKE '%$dateJ%'");
        $req3->execute();
        $don3=$req3->fetch(PDO::FETCH_ASSOC);

        $franc=$bd->query("SELECT * FROM devise WHERE idDevise=1");
        $fc = $franc->fetch(PDO::FETCH_ASSOC);
        $devise=$fc['devise'];
        $taux=$fc['taux'];


    if (isset($_GET['save'])) {
        
        $in=$_GET['dateIn'];
        $out=$_GET['dateOut'];

        $req = $bd->prepare("SELECT  montantEntree,date_format(dateEntree,'%d-%m-%Y') as dateEntree,motifEntree FROM entreeCaisse WHERE  dateEntree BETWEEN ? AND ? ");
        $req->execute(array($in,$out));
        $req1 = $bd->prepare("SELECT SUM(montantEntree) AS total FROM entreeCaisse WHERE dateEntree BETWEEN ? AND ? ");
        $req1->execute(array($in,$out));
        $don1=$req1->fetch(PDO::FETCH_ASSOC);

        $req2 = $bd->prepare("SELECT  agent,montantSortie,date_format(dateSortie,'%d-%m-%Y') as dateSortie,motifSortie FROM sortieCaisse WHERE  dateSortie BETWEEN ? AND ? ");
        $req2->execute(array($in,$out));
        $req3 = $bd->prepare("SELECT SUM(montantSortie) AS total FROM sortieCaisse WHERE dateSortie BETWEEN ? AND ? ");
        $req3->execute(array($in,$out));
        $don3=$req3->fetch(PDO::FETCH_ASSOC);
        
        
    }
 ?>
<!DOCTYPE html>
<html>
    <head>
        <title>Bahari Beach Hôtel</title>
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
                        <h3 class="text-center text-uppercase" style="text-align:center; border: 1px solid black">Situation financière du <?php echo date('d/m/Y') ?>
                         
                        </h3>
                        
                        <div class="cacher">
                            <form action="" method="GET">
                            
                                <div class="input-group">
                                    <div class="input-group-append">
                                        <span class="input-group-text">Date début</span>
                                    </div>
                                    <input type="date" name="dateIn" value="<?php echo(isset($_GET['dateIn'])?$_GET['dateIn']:'') ?>" class="form-control">
                                </div>
                                <br>
                                <div class="input-group">
                                    <div class="input-group-append">
                                        <span class="input-group-text">Date fin</span>
                                    </div>
                                    <input type="date" name="dateOut"value="<?php echo(isset($_GET['dateOut'])?$_GET['dateOut']:'') ?>" class="form-control"><br>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-center">
                                        <button type="submit" class="btn btn-danger" name="save">Visualiser</button><br>
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
                    <table class="table table-bordered table-striped spacer table-sm">
                        <thead>
                            <tr>
                                <th>DATE</th>
                                <th>I. RECETTES </th>  
                                <th class="text-center">USD </th>  
                                <th class="text-center">DEVISE FC</th>  
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?php echo date('d-m-Y') ?></td>
                                <td>Report solde  
                                </td>
                                <td class="text-right"><?php $donat = $bd->query('SELECT montantCaisse FROM caisse');
                                    $res=$donat->fetch(PDO::FETCH_ASSOC);
                                    $report= $res['montantCaisse']-$don1['total']+$don3['total'];
                                    echo number_format($report,2);
                                    ?>
                                        
                                    </td>
                                <td class="text-right">
                                    <?php echo number_format($report*$taux,2).' Fc'; ?>
                                </td>
                            </tr>
                                <?php
                                
                                    
                                    while($don=$req->fetch()):
                                        ?>
                                <tr>
                                        <td><?php echo  $don['dateEntree']; ?></td>
                                        <td><?php echo $don['motifEntree'] ?></td>
                                        <td class="text-right"><?php echo number_format($don['montantEntree'],2) ?></td>
                                        <td class="text-right"><?php echo number_format($don['montantEntree']*$taux,2).' Fc' ?></td>
                                        
                                </tr>
                                <?php
                                 endwhile;
                                ?>
                             <tr>
                                <td></td>
                                <td><h6><strong>SOUS-TOTAL</strong></h6></td>
                                <td class="text-right"><h6><strong><?php
                                        $sousTot=$report+$don1['total'];
                                        echo(isset($_GET['save'])?number_format($sousTot,2).' $':number_format($sousTot,2).' $');
                                    
                                 ?></strong></h6>
                                 </td>
                                 <td class="text-right">
                                    <h6>
                                        <strong>
                                        <?php echo(isset($_GET['save'])?number_format($don1['total']*$taux,2).' Fc':number_format($sousTot*$taux,2).' Fc'); ?>
                                        </strong>
                                    </h6>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <th>II. DEPENSES</th>
                                <th></th>
                                <th></th>
                            </tr>
                                <?php
                                
                                    
                                    while($don2=$req2->fetch()):
                                        ?>
                                <tr>
                                        <td><?php echo $don2['dateSortie'] ?></td>
                                        <td><?php echo $don2['motifSortie'] ?></td>
                                        <td class="text-right"><?php echo number_format($don2['montantSortie'],2) ?></td>
                                        <td class="text-right"><?php echo number_format($don2['montantSortie']*$taux,2).' Fc' ?></td>
                                        
                                </tr>
                                <?php
                                 endwhile;
                                ?>
                             <tr>
                                <td></td>
                                <td><h6><strong>SOUS-TOTAL</strong></h6></td>
                                <td class="text-right"><h6><strong><?php
                                    
                                        echo(isset($_GET['save'])?number_format($don3['total'],2).' $':number_format($don3['total'],2).' $');
                                    
                                 ?></strong></h6>
                                 </td>
                                  <td class="text-right">
                                    <h6>
                                        <strong>
                                        <?php echo(isset($_GET['save'])?number_format($don3['total']*$taux,2).' Fc':number_format($don3['total']*$taux,2).' Fc'); ?>
                                        </strong>
                                    </h6>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><h5><strong>SOLDE(I-II)</strong></h5></td>
                                <td class="text-right"><h5><strong><?php
                                    
                                        echo(isset($_GET['save'])?number_format($don1['total']-$don3['total'],2).' $':number_format($sousTot-$don3['total'],2).' $');
                                    
                                 ?></strong></h5>
                                    
                                </td>
                                <td class="text-right">
                                    <h5>
                                        <strong>
                                        <?php echo(isset($_GET['save'])?number_format(($sousTot-$don3['total'])*$taux,2).' Fc':number_format(($sousTot-$don3['total'])*$taux,2).' Fc'); ?>
                                        </strong>
                                    </h5>
                                </td>
                            </tr>


                        </tbody>
                    </table>
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 offset-4 spacer">
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
        });
    </script>
            

    </body>
</html>
             