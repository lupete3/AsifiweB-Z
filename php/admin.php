<?php 
      require_once ('bd_cnx.php'); 
      require_once ('security_admin.php'); 
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
        <link href='http://fonts.googleapis.com/css?family=Dosis:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="" />

        <link rel="stylesheet" type="text/css" href="../bootstrap/font-awesome-4.3.0/css/font-awesome.min.css">
    </head>
    
    <body id="">

         <header id="head" class="bg-primary"> 
            <div class="row"> 
                <div class="col-lg-2  col-md-2 ">
                    <p><img src="../docs/img/bbh_logos11.png" alt="logo BBH" style=""></p><br>
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
                        

                    <a class="nav-link" href="logout.php"><button type="button" class="btn btn-outline-light "><h3> <span class="fa fa-power-off"></span> Déconnexion</h3></button></a>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right" style="margin-top: 20px;">
                        <span style="text-align: center; color: whitesmoke; font-size: 1.2em;
                                font-family: century gothic">  
                            <?php echo ' '. strtoupper($_SESSION['profile']['admin']['nom_admin']).'<span style="padding-left:10px;">/</span>'.$_SESSION['profile']['admin']['user_funct']; ?>
                        </span>
                    </div>
                </div>
            </div>
        </header>
        
        <div id="sect1" class="row">
            <div class="col-lg-12 text-uppercase">
                <center>  
                    <h1 style="text-align:center; font-family:century gothic; border:2px solid blue; width:40%;box-shadow: 0px 10px 20px; border-radius: 30px;">Back-Office</h1>
                    </center> 
                </div>
            <div class="col-lg-12" style="background-color:white; padding:10px; ">

                <div class="col-lg-1"></div>

                

                <div class="col-lg-10" >
                    <div class="container" style="background-color:white; border:1px solid blue ; padding: 40px; border-radius:100px 100px 100px 100px; box-shadow: 0px 10px 20px;">



                    <div class="col-lg-12 col-md-12 "  > 
                        
                        <!-- <div class="col-lg-3 col-md-3 " style="">
                            
                             <center>
                                 <a href="pages/pdv.php"><img src="../docs/emoticones/new/pdv3.jpg" width="40%" alt="G-Points de Vente" > </a>
                            </center>
                            <legend style="color:black; text-align:center; border-bottom: 1px solid #b90112">G-Points de Vente</legend>
                        </div>  

                       <div class="col-lg-3 col-md-3" style="">
                            <center>
                                 <a href="pages/comListReq.php"><img src="../docs/MAJ/form4.JPG" width="40%" alt="Etats de besoin" > </a>
                            </center>
                            <legend style="color:black; text-align:center; border-bottom: 1px solid #b90112 ">Etats de besoin</legend>
                        </div>
                         <div class="col-lg-3 col-md-3" style="">
                             <center>
                                 <a href="gestion_commandeA.php"><img src="../docs/emoticones/new/reqAd.png" width="40%" alt="Visualiser bon de commande" > </a>
                            </center>
                            <legend style="color:black; text-align:center; ">Bon de Commande</legend>
                        </div>  -->
                        
                        <div class="col-lg-4 col-md-4" style="">
                            
                             <center>
                                 <a href="pages/serveur.php"><img src="../docs/emoticones/new/client.png" width="40%" alt="Gestion serveurs" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Gestion serveurs</legend>
                        </div> 

                        <!-- <div class="col-lg-4 col-md-4" style="">
                         <center >
                             <a href="pages/devise.php" >
                                <img src="../docs/emoticones/devise.png" width="40%" alt="nourriture" > </a>
                        </center>
                        <legend style="color:black; text-align:center;">Taux de change</legend>
                         </div> -->
                        <div class="col-lg-4 col-md-4" style=" ">
                            <center title="">
                                 <a href="pages/liquidite.php" style="">
                                    <img src="../docs/emoticones/caisse1.png" width="40%" alt="Sauna-Gym-Piscine" > </a>
                            </center>
                            <legend style="color:black; text-align:center ">Liquidité</legend>
                        </div> 
                        <div class="col-lg-4 col-md-4" style="">
                            <center>
                                 <a href="pages/users.php"><img src="../docs/emoticones/new/rec2.png" width="40%" alt="Gestion des utilisateurs" > </a>
                            </center>
                            <legend style="color:black; text-align:center; ">Gestion des utilisateurs</legend>
                        </div>
                        <div class="col-lg-4 col-md-4" style="">
                            <center>
                                 <a href="pages/barman.php"><img src="../docs/emoticones/barman.png" width="40%" alt="Gestion barmen" > </a>
                            </center>
                            <legend style="color:black; text-align:center; ">Gestion barmen</legend>
                        </div>
                       
                        <div class="col-lg-4 col-md-4" style="">
                            
                            <center>
                                 <a href="rapportComptableA.php"><img src="../docs/emoticones/new/cpt.png" width="40%" alt="Rapports généraux Comptabilité" > </a>
                            </center>
                            <legend style="color:black; text-align:center;">Rapports généraux</legend> 
                    </div>                
                        
                        
                </div>
 

                    <div class="col-lg-12">
                        
                        
                    </div>
                    
            </div> 

        </div> 

        <div class="col-lg-1"></div>                 

    </div>
       
        <div class="col-lg-12" style="text-align:center; padding-top: 20px; font-family: century gothic; font-size: 1.5em;">

                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> Tous droits réservés | Ce modèle est fait par <a style="color:darkblue" href="https://kivufreelance.com" target="_blank">Kivu Freelance</a><br>
                    <br>
                    
                        <a style="color:darkblue" href="pages/apropos.php" target="_blank"><button class="btn-lg btn btn-primary ">A propos de nous</button></a>
                    
        </div>
        

        <style type="text/css">
            legend{font-family: century gothic; font-size: 1.2em;}    
        </style>

    <script src="../bootstrap/js/jquery.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>