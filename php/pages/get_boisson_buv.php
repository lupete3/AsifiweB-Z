<?php
require_once('bd_cnx.php');

if(!empty($_POST["idBoiss"])) {
  //$req = $bd->prepare('SELECT * FROM prodboiss');
  $req = $bd->prepare('SELECT * FROM prodboiss WHERE idCatBoiss =?');
  $req->execute(array($_POST["idBoiss"]));

  
?>
  <option value="">Sélectionner la boisson</option>
<?php
  while($don=$req->fetch(PDO::FETCH_ASSOC)) {

  	$req1 = $bd->prepare('SELECT A.designBoiss, B.qtStock, B.idstock FROM prodboiss AS A,stockpv AS B WHERE A.idBoiss = B.idBoiss AND A.idCatBoiss =?');
  	$req1->execute(array($don["idCatBoiss"]));


  	while($don1=$req1->fetch(PDO::FETCH_ASSOC)) {
?>
  <option value="<?php echo $don1["idstock"]; ?>"><?php echo $don1["designBoiss"].'-->'.$don1['qtStock']; ?></option>
<?php

  }
}
}
?>