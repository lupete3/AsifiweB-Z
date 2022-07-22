
<?php
    require_once ('security_admin.php');
   require_once('bd_cnx.php');
    $dateJ=date('Y-m-d'); 
    $poste=isset($_SESSION['profil']['agent2'])?$_SESSION['profil']['agent2']['user_function']:'';

    $req = $bd->prepare("SELECT A.idNourAv,A.qteNourAv,A.motifPvNour,date_format(A.dateNourAv,'%e-%m-%Y à %T') as dateAv,A.postePvNour, B.designNour,B.puNour, B.idNour FROM prodnour as B,avarienour as A WHERE A.idNour=B.idNour AND  A.dateNourAv LIKE '%$dateJ%' AND postePvNour = '$poste'");
        $req->execute();
        $req1 = $bd->prepare("SELECT SUM(qteNourAv*puNour) AS total FROM avarienour as A, prodnour as B WHERE A.idNour = B.idNour AND  dateNourAv LIKE '%$dateJ%' AND postePvNour = '$poste'");
        $req1->execute();
        $don1=$req1->fetch(PDO::FETCH_ASSOC);
        $req2=$bd->prepare('SELECT designNour FROM prodnour');
        $req2->execute();
        $don2=$req2->fetch(PDO::FETCH_ASSOC);

    if (isset($_GET['save'])) {
        $in=$_GET['dateIn'];
        $out=$_GET['dateOut'];

        $req = $bd->prepare("SELECT A.idNourAv,A.qteNourAv,A.motifPvNour,date_format(A.dateNourAv,'%e-%m-%Y à %T') as dateAv,A.postePvNour, B.designNour,B.puNour, B.idNour FROM prodnour as B,avarienour as A WHERE A.idNour=B.idNour AND  A.dateNourAv BETWEEN ? AND ? AND postePvNour = '$poste'");
        $req->execute(array($in,$out));
        $req1 = $bd->prepare("SELECT SUM(qteNourAv*puNour) AS total FROM avarienour as A, prodnour as B WHERE A.idNour = B.idNour AND  dateNourAv BETWEEN ? AND ? AND postePvNour = '$poste'");
        $req1->execute(array($in,$out));
        $don1=$req1->fetch(PDO::FETCH_ASSOC);
        $req2=$bd->prepare('SELECT designNour FROM prodnour ');
        $req2->execute();
        $don2=$req2->fetch(PDO::FETCH_ASSOC);
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
                        <h1 class="text-center text-uppercase" style="text-align:center; border: 1px solid black">Fiche Avarie NOURRITURES
                        </h1>
                        
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
                    <table class="table table-bordered table-striped spacer">
                        <thead>
                            <tr style="font-weight:bold" class="btn-danger">
                            <th>N°</th>
                            <th>Produit</th> 
                            <th>Quantite </th>  
                            <th>Pu </th>  
                            <th>Motif </th>  
                            <th>Date</th>
                            <th>PT</th>
                            
                            <td>Observation</td>
                        </tr>
                        </thead>
                        <tbody>
                                <?php
                                
                                    $num=1;
                                    
                                    while($don=$req->fetch()):
                                        ?>
                                <tr>
                                        <td><?php echo $num; ?></td>
                                        <td><?php echo $don['designNour'] ?></td>
                                       <td class="text-right"><?php echo $don['qteNourAv'] ?></td>
                                       <td class="text-right"><?php echo $don['puNour'] ?></td>
                                        <td class="text-right"><?php echo $don['motifPvNour'] ?></td>
                                        <td class="text-right"><?php echo $don['dateAv'] ?></td>
                                 

                                       
                                       <td><?php echo ($don['qteNourAv']*$don['puNour']) ?></td>
                                        <td></td>
                                        
                                </tr>
                                <?php
                                $num++;
                                 endwhile;
                                ?>
                             <tr>
                                <td colspan="6"><strong><h4>Total</h4></strong></td>
                                <td class="text-right"><strong><h4><?php
                                    
                                        echo(isset($_GET['save'])?number_format($don1['total'],2).' $':number_format($don1['total'],2).' $');
                                    
                                 ?></h4></strong>
                                 </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 spacer">
                   <p>Editeur : <strong><?php echo(isset($_SESSION['profil']['agent2'])?$_SESSION['profil']['agent2']['user_name']:''); ?></strong></p> 
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
            $('#liste_cat').change(function(){
                var val= $('#liste_cat').val();
                $.ajax({
                type:"POST",
                url:"pages/get_nour.php",
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
