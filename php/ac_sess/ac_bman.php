<?php 
      require_once ('../bd_cnx.php'); 
      require_once ('../security_brmn.php'); 
?>


<!DOCTYPE html>
<html>
    <head>
         <title>Ets Asifiwe B&Z</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initialscale=1.0"> 
        <meta charset="utf-8" />
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-theme.css.map" />
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-theme.min.css.map" />
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css.map" />
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css.map" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Dosis:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="" />

        <link rel="stylesheet" type="text/css" href="../../bootstrap/font-awesome-4.3.0/css/font-awesome.min.css">


    </head>
    
    <body id="bd_pg_ac">
        <header id="head" class="bg-primary"> 
            <div class="row"> 
                <div class="col-lg-2  col-md-2 ">
                    <p><img src="../../docs/img/bbh_logos11.png" alt="logo BBH" style=""></p><br>
                </div>

                <div class="col-lg-7 col-md-7 text-center" id="div_lgos">
                    <div class="col-lg-12">
                        <h3 style="font-size: 2em; color:whitesmoke; text-align:center; margin-top:10px; font-family: Century gothic;">Vente Management System 

                            <span style="color:whitesmoke; margin-left:20px; font-family:Century gothic; font-size: 0.6em; "> 
                                Date : <?php echo date("d-m-Y"); ?>
                                Heure : <?php echo date("H:i"); ?> 
                            </span>   
                        </h3>
                    </div>

                        <h1 class="text-uppercase" id="h1_bbh_title" style="font-size: 60px; font-family: century gothic; font-weight: bold; margin-top: 2px; margin-left: 10px; color: chocolate; padding-top: 3px;text-shadow: 8px 8px 2px white; text-shadow: 0 0 10px white, 0 0 10px white,0 0 10px white;">Ets Asifiwe B&Z</h1>
                </div>
                
                <div class="col-lg-3 col-md-3 " >
                   <div class="col-lg-12 col-md-12 text-right">
                        

                    <a class="nav-link" href="../logout.php"><button type="button" class="btn btn-outline-light "><h3> <span class="fa fa-power-off"></span> Déconnexion</h3></button></a>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right" style="margin-top: 20px;">
                        <span style="text-align: center; color: whitesmoke; font-size: 1.2em;
                                font-family: century gothic">  
                            <?php echo ' '. strtoupper($_SESSION['profil']['agent5']['brm_name']).'<span style="padding-left:10px;">/</span>'.$_SESSION['profil']['agent5']['libPv']; ?>
                        </span>
                    </div>
                </div>
            </div>
        </header>
    
    <div class="container">
        
        <div id="" class="row" style=" background-color:white; padding-top:10px;">
            
            <div class="col-lg-12">
                <h1 style="text-align:center; font-family:century gothic">
                Espace <?php echo $_SESSION['profil']['agent5']['libPv'] ?></h1>
            </div>
            
            <div class="container">
            <div  style="margin-top:10px; padding:10px; border: 2px solid blue; background-color:white; border-radius:70px 70px 70px 70px; box-shadow: 0px 10px 20px;">
                
            <div class="row" style="padding: 20px " > 
                    <div class="col-lg-6 col-md-6" style=""> 
                        <center>
                            <a href="../pages/approvBoissBuvette.php"><img src="../../docs/emoticones/b.jpeg" width="40%" alt="Boisson" > </a>
                        </center>
                        <h4><legend style="color:black; text-align:center;">Achat Boisson Buvette</legend></h4>
                    </div>                 
                    
                    <div class="col-lg-6 col-md-6" style="">
                         <center >
                             <a href="../pages/venteRestaurant.php" >
                                <img src="../../docs/emoticones/new/pdv3.jpg" width="40%" alt="nourriture" > </a>
                        </center>
                        <h4><legend style="color:black; text-align:center; ">Point de ventes</legend></h4>
                    </div>

                    <!-- <div class="col-lg-4 col-md-4" style="">
                         <center >
                             <a href="../avarieRestaurant.php" >
                                <img src="../../docs/emoticones/corbeille.jpg" width="40%" alt="nourriture" > </a>
                        </center>
                        <legend style="color:black; text-align:center; border-bottom: 1px solid #b90112">Signaler un Avarié</legend>
                    </div> 

                     <div class="col-lg-4 col-md-4 " style="">
                        <center>
                            <a href="../pages/stockPV.php"><img src="../../docs/emoticones/vin.jpg" width="40%" alt="Gestion depenses" > </a>
                        </center>
                        <legend style="color:black; text-align:center; ">Gestion boissons</legend>
                    </div>
                    
                    <div class="col-lg-4 col-md-4 " style="">
                        <center>
                            <a href="../pages/depensePdv2.php"><img src="../../docs/emoticones/paiement.png" width="40%" alt="Gestion depenses" > </a>
                        </center>
                        <legend style="color:black; text-align:center; border-bottom: 1px solid #b90112">Gestion depenses</legend>
                    </div> 
                    <div class="col-lg-4 col-md-4" style=" ">
                        
                        <center title="">
                             <a href="../pages/comDiv.php" style="">
                                <img src="../../docs/emoticones/cleaning.png" width="40%" alt="Sauna-Gym-Piscine" > </a>
                        </center>
                        <legend style="color:black; text-align:center; ">Commander Divers</legend>
                    </div> -->
                    <div class="col-lg-4 col-md-4" style="">
                            
                            <center>
                                 <a href="../ficheApprovBoissBuvBrm.php" target="_blank"><img src="../../docs/MAJ/form8.png" width="40%" alt="Ajout nourriture" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Approv Buvette</legend>
                    </div> 
                    <div class="col-lg-4 col-md-4" style=" ">
                        <center title="">
                             <a href="../ficheVentePdv.php" target="__blank" style="">
                                <img src="../../docs/emoticones/srt5.jpg" width="40%" alt="" > </a>
                        </center>
                        <legend style="color:black; text-align:center; ">Historique des ventes</legend>
                    </div>
                
                    <div class="col-lg-4 col-md-4 " style="">
                        <center>
                            <a href="../fichestockBoissBar.php" target="_blank"><img src="../../docs/emoticones/new/tg.png" width="40%" alt="Rapport" > </a>
                        </center>
                        <legend style="color:black;  text-align:center; ">Fiche de Stock</legend>
                    </div>    
                                   

            </div>
            </div>
            </div>
        </div>
                
    </div>
            
            
        
                
            <div style="text-align:center; padding-top: 20px; color:black; font-size: 1.5em; font-family: century gothic">
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> Tous droits réservés | Ce modèle est fait par <a style="color:darkblue" href="https://kivufreelance.com" target="_blank">Kivu Freelance</a><br>
                    <br>
                    
                        <a style="color:darkblue" href="../pages/apropos.php" target="_blank"><button class="btn-lg btn btn-primary ">A propos de nous</button></a>
                    
                </div>

            <style type="text/css">
                legend{font-family: century gothic; font-size: 1.2em; }    
            </style>

    <script src="pages/bootstrap/js/popper.min.js"></script>
    <script src="pages/bootstrap/js/jquery-3.4.1.min.js"></script>
    <script src="pages/js/ajax1.min.js"></script>
    <script src="pages/js/ajax.min.js"></script>
    <script src="pages/bootstrap/js/bootstrap.min.js"></script>

            </body>
    </html>
             
             