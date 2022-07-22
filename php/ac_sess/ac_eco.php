<?php 
      require_once ('../security_eco.php');
      require_once ('../bd_cnx.php'); 
       
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
                            <?php echo ' '. strtoupper($_SESSION['profil']['agent2']['user_name']).'<span style="padding-left:10px;">/</span>'.$_SESSION['profil']['agent2']['user_function']; ?>
                        </span>
                    </div>
                </div>
            </div>
        </header>
    
    <div class="container">
        
        <div id="" class="row" style=" background-color:white; padding-top:10px;">
            
            <div class="col-lg-12">
                <h1 style="text-align:center; font-family:century gothic">
                Espace Gérant</h1>
            </div>
            
            <div class="container">
            <div  style="margin-top:10px; padding:10px; border: 2px solid blue; background-color:white; border-radius:100px 100px 100px 100px; box-shadow: 0px 10px 20px;">
                
            <div class="row" style="padding: 20px " > 
                    <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../pages/categorie.php" title="Cliquer pour ajouter une Catégorie"><img src="../../docs/emoticones/cat%20boiss.png" width="40%" alt="Ajout nourriture" > </a>
                        </center>
                        <legend style="color:black; text-align:center;">Catégorie Boisson</legend>
                    </div>
                       
                    <div class="col-lg-3 col-md-3" style="">
                        <center title="">
                            <a href="../pages/entreeCaisse.php"  style="" ><img src="../../docs/emoticones/caisse2.jpg" width="40%" alt="Réquisition" ></a>
                        </center>
                        <legend style="color:black; text-align:center; ">Entrée caisse</legend>
                                
                    </div>
                    <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../pages/produit.php"><img src="../../docs/emoticones/vin.jpg" width="40%" alt="Boisson" > </a>
                        </center>
                        <legend style="color:black; text-align:center;">Gestion Boisson</legend>
                    </div>
                    <div class="col-lg-3 col-md-3" style="">
                        <center title="">
                            <a href="../pages/sortieCaisse.php"  style=""><img src="../../docs/emoticones/paiement%202.png" width="40%" alt="Sauna-Gym-Piscine" > </a>
                        </center>
                        <legend style="color:black; text-align:center; ">Gestion Dépenses</legend>
                    </div>
                    
                   
                    <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../pages/four.php"><img src="../../docs/emoticones/new/rec2.png" width="40%" alt="Gestion organisations" > </a>
                        </center>
                        <legend style=" text-align:center;">Gestion des fournisseurs</legend>
                    </div>
                    <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../pages/categorieEquip.php" target="_blank"><img src="../../docs/MAJ/form6.png" width="40%" alt="Catégorie matériels" > </a>
                        </center>
                        <legend style="color:black; text-align:center; ">Catégorie matériels</legend>
                    </div> 
                <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../pages/materiel.php"><img src="../../docs/emoticones/new/ctrl.png" width="40%" alt="Matériels" > </a>
                        </center>
                        <legend style="color:black; text-align:center; ">Matériels</legend>
                    </div>
                    <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../rapport.php"><img src="../../docs/emoticones/new/tg.png" width="40%" alt="Rapport" > </a>
                        </center>
                        <legend style="color:black;  text-align:center;">Rapport</legend>
                    </div>    
                    <!-- <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../pages/stockDivers.php"><img src="../../docs/emoticones/divers.png" width="40%" alt="Ajout produit" > </a>
                        </center>
                        <legend style="color:black; text-align:center;">Gestion produit divers</legend>
                    </div>
                    <div class="col-lg-3 col-md-3" style="">

                        <center>
                            <a href="../pages/approvDiv.php"><img src="../../docs/emoticones/pdiv.png" width="40%" alt="Approv Produit" > </a>
                        </center>
                        <legend style="color:black; text-align:center;">Achat Produits divers</legend>
                    </div> -->
                    
                 <!-- <div class="col-lg-3 col-md-3" style="">
                        <center>
                            <a href="../gestion_commande.php"><img src="../../docs/emoticones/new/reqAd.png" width="40%" alt="Visualiser bon de commande" > </a>
                        </center>
                        <legend style="color:black; text-align:center; ">Bon de Commande</legend>
                    </div>-->
                                

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
             