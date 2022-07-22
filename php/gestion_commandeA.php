<?php 
      require_once ('security_admin.php');
      require_once ('bd_cnx.php');  
?>


<!DOCTYPE html>
<html>
    <head>
        <title>Ets Asifiwe B&Z</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initialscale=1.0"> 
        <meta charset="utf-8" />
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.css.map" />
        <link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css.map" />
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css.map" />
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css.map" />
        <link rel="stylesheet" href="../bootstrap/css/font-awesome.min.css" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="../bootstrap/font-awesome-4.3.0/css/font-awesome.min.css">
    </head>
    
    <body id="">
        
    <header id="head" class="bg-primary"> 
            <div class="row"> 
                <div class="col-lg-2  col-md-2 ">
                    <p><img src="../docs/img/bbh_logos11.png" alt="logo BBH" style=""></p><br>
                </div>

                <div class="col-lg-7 col-md-7 text-center" id="div_lgos">
                    <marquee behavior="alternate" style="margin-top: 20px">
                        

                        <h1 class="text-uppercase" id="h1_bbh_title" style="font-size: 60px; font-family: century gothic; font-weight: bold; margin-top: 2px; margin-left: 10px; color: chocolate; padding-top: 3px;text-shadow: 8px 8px 2px white; text-shadow: 0 0 10px white, 0 0 10px white,0 0 10px white;">Ets Asifiwe B&Z</h1>
                    </marquee>
                </div>
                
                <div class="col-lg-3 col-md-3 " >
                   <div class="col-lg-12 col-md-12 text-right">
                        

                    <a class="nav-link" href="admin.php"><button type="button" class="btn btn-outline-light "><h3> <span class="fa fa-arrow-circle-left"></span> Retour</h3></button></a>
                    </div>

                    
                </div>
            </div>
        </header>

        <div id="sect1" class="row" style=" background-color:white; padding-top:20px;">
            
            <div class="col-lg-12"><h1 style="text-align:center">Commandes en cours</h1></div>
            
            <div class="col-lg-1"></div>
            <div class="col-lg-10" style="margin:30px; padding:10px; border: 2px solid #b90112; background-color:white; border-radius:50px;">
                
                
                <div class="row" style=" padding: 20px;" > 

                    <div class="col-lg-12">                                    
                    
                    <div class="col-lg-3" style="">
                        
                         <!-- <center >
                             <a href="pages/comListBoissA.php" >
                                <img src="../docs/emoticones/boiss2.png" width="40%" alt="nourriture" > </a>
                        </center>
                        <legend style="color:grey; text-align:center; border-bottom: 1px solid #b90112">Boisson</legend> -->
                    </div>                    
                    
                    <div class="col-lg-6" style=" ">
                        
                        <center title="">
                             <a href="pages/comListDivA.php" style="">
                                <img src="../docs/emoticones/cleaning.png" width="40%" alt="Sauna-Gym-Piscine" > </a>
                        </center>
                        <legend style="color:grey; text-align:center; border-bottom: 1px solid #b90112">Produits divers</legend>
                    </div> 
                
                </div>
                    
                </div>
                
            </div>
            
            <div class="col-lg-1"></div>
            
        </div>
        
            <script src="bootstrap/js/jquery.js"></script>
            <script src="bootstrap/js/bootstrap.min.js"></script>

            </body>
    </html>
             
