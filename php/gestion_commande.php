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
            <div id="sect1" class="row" style=" background-color:white; padding-top:20px;">
                
                <div class="col-lg-12"><h1 style="text-align:center">Commandes en cours</h1></div>
                
                
                <div class="col-lg-12" style="margin-top:30px; padding:10px; border: 2px solid #b90112; background-color:white; border-radius:50px;">
                    
                    
                    <div class="row" style="padding:10px; " > 
                
                        
                        <div class="col-lg-3 col-md-3" style="">
                            
                             <!-- <center >
                                 <a href="pages/comListBoiss.php" >
                                    <img src="../docs/emoticones/boiss2.png" width="40%" alt="nourriture" > </a>
                            </center>
                            <legend style="color:grey; text-align:center; border-bottom: 1px solid #b90112">Boisson</legend> -->
                        </div>                    
                        
                        <div class="col-lg-6 col-md-6" style=" ">
                            
                            <center title="">
                                 <a href="pages/comListDiv.php" style="">
                                    <img src="../docs/emoticones/cleaning.png" width="40%" alt="Sauna-Gym-Piscine" > </a>
                            </center>
                            <legend style="color:grey; text-align:center; border-bottom: 1px solid #b90112">Produits divers</legend>
                        </div> 
                         

                    </div>
                    
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
             
