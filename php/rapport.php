<?php 
      require_once ('security_eco.php');
      require_once ('bd_cnx.php');  
?>


<!DOCTYPE html>
<html>
    <head>
        <title>Ets Asifiwe B&Z</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initialscale=1.0"> 
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="pages/bootstrap/font-awesome-4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="pages/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="pages/bootstrap/css/style.css">
    </head>
    
    <body id="">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#"><img src="../docs/img/bbh_logos11.png" class="bbh">
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
                    <a class="nav-link" href="ac_sess/ac_eco.php"><button type="button" class="btn btn-outline-light connexion"><h3>Retour</h3></button><span class="sr-only">(current)</span></a>
                </li>
            </ul>
            
        </div>
    </nav>
      

        <div class="container">
            <div id="sect1" class="row" style=" background-color:white; padding-top:5px;">
                
                <div class="col-lg-12"><h1 style="text-align:center">Rapport Stocks</h1></div>
                
                
                <div class="col-lg-12" style="margin-top:5px; padding:10px; border: 2px solid #b90112; background-color:white; border-radius:50px;">
                    
                    
                    <div class="row" style="padding:1px; " > 
                
                        <div class="col-lg-3 col-md-3 " style="">
                            <center>
                                 <a href="economatG.php" title="Cliquer pour ajouter une Catégorie"><img src="../docs/emoticones/task5.jpg" width="40%" alt="Fiche Boisson" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Dépôt Relais 1</legend>
                        </div> 
                
                        <div class="col-lg-3 col-md-3 " style="">
                            <center>
                                 <a href="economatG1.php" title="Cliquer pour ajouter une Catégorie"><img src="../docs/emoticones/task5.jpg" width="40%" alt="Fiche Boisson" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Dépôt Relais 2</legend>
                        </div> 

                       
                       <div class="col-lg-3 col-md-3 " style="">
                            <center>
                                 <a href="restaurantG.php">
                                     <img src="../docs/emoticones/new/stat2.png" width="40%" alt="Ajout nourriture" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Points de vente</legend>
                        </div> 
                        

                       <div class="col-lg-3 col-md-3 " style="">
                            <center>
                                 <a href="ficheStockDiv.php" target="_blank">
                                     <img src="../docs/emoticones/task7.png" width="40%" alt="Ajout nourriture" >  </a>
                            </center>
                            <legend style="color:black; text-align:center;">Fiche Materiels</legend>
                        </div>
                        <div class="col-lg-3 col-md-3 " style="">
                            <center>
                                 <a href="ficheEntreeCaisseG.php" target="_blank">
                                     <img src="../docs/emoticones/task7.png" width="40%" alt="Ajout nourriture" >  </a>
                            </center>
                            <legend style="color:black; text-align:center;">Fiche Entrée Caisse</legend>
                        </div>
                        

                        <div class="col-lg-3 col-md-3 " style="">
                            <center>
                                 <a href="ficheSortieCaisseG.php" target="_blank">
                                     <img src="../docs/emoticones/task7.png" width="40%" alt="Ajout nourriture" >  </a>
                            </center>
                            <legend style="color:black; text-align:center;">Fiche Sortie Caisse</legend>
                        </div>
                        <div class="col-lg-3 col-md-3 " style="">
                            <center>
                                 <a href="ficheTableauExploitationMensuelleG.php" target="_blank">
                                     <img src="../docs/emoticones/new/tg.png" width="40%" alt="Ajout nourriture" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Tableau D'Eploitation Mensuelle</legend>
                        </div> 
                         
                    
                        <!--
                        <div class="col-lg-4 col-md-4 " style="">
                             <center>
                                 <a href="ficheApprovDiv.php" target="_blank"><img src="../docs/emoticones/fil.png" width="40%" alt="Boisson" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Approv. Produit Divers</legend>
                        </div>
                        
                        <div class="col-lg-4 col-md-4 " style="">
                            <center>
                                 <a href="ficheSortieDiv.php" target="_blank"><img src="../docs/emoticones/fil1.jpeg" width="40%" alt="" > </a>
                            </center>
                            <legend style="color:black;  text-align:center;">Sortie produits divers</legend>
                        </div>
                        <div class="col-lg-3 col-md-3" style="">

                          <center>
                                 <a href="ficheAvarieBoiss.php" target="_blank"><img src="../docs/emoticones/f2.png" width="40%" alt="Approv Produit" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">boissons avariées</legend>
                        </div> 

                                         

                        <div class="col-lg-3 col-md-3 " style=" ">
                            <center>
                                 <a href="ficheAvarieDiv.php" target="_blank"><img src="../docs/emoticones/f44.png" width="40%" alt="Fiche de stock" > </a>
                            </center>
                            <legend style="color:black;  text-align:center;"> produits divers avariés</legend>
                        </div>  -->
                        

                    </div>

                    
                </div>

                <div class="col-lg-12" style="margin-top: 15px; text-align:center; font-family:century gothic; font-size: 1.5em;">
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> Tous droits réservés | Ce modèle est fait par 
                <a style="color:darkblue; font-family: century gothic; font-size: 1em;" href="https://kivufreelance.com" target="_blank">Kivu Freelance</a>
            </div>
                
                
                
            </div>
        </div>

        
            <script src="bootstrap/js/jquery.js"></script>
            <script src="bootstrap/js/bootstrap.min.js"></script>

    <script src="pages/bootstrap/js/popper.min.js"></script>
    <script src="pages/bootstrap/js/jquery-3.4.1.min.js"></script>
    <script src="pages/bootstrap/js/bootstrap.min.js"></script>
            </body>
    </html>
  