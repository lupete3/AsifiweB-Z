<?php

    try{
        $bd = new PDO('mysql:host=localhost;dbname=sc2vwly2348_asifiwebz', 'root', ''); 
        $bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (Exception $e){
        die ('Erreur :'.$e->getMessage());
        
    }

    
    /*try{
        $bd = new PDO('mysql:host=localhost;dbname=sc2vwly2348_asifiwebz', 'sc2vwly2348_ASIFIWEBZ', 'asifiwebz2021'); 
        $bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (Exception $e){
        die ('Erreur :'.$e->getMessage());
        
    } */

?>

