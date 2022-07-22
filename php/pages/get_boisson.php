<?php
session_start();

$idDep = $_SESSION['idDep'];

require_once('bd_cnx.php');

if(!empty($_POST["idBoiss"])) {
  //$req = $bd->prepare('SELECT * FROM prodboiss');
  $req = $bd->prepare('SELECT * FROM prodboiss AS A, depot AS B WHERE A.idCatBoiss =? AND A.idDepot = B.id AND A.idDepot = ?');
  $req->execute(array($_POST["idBoiss"],$idDep));
?>
  <option value="">Sélectionner la boisson</option>
<?php
  while($don=$req->fetch(PDO::FETCH_ASSOC)) {
?>
  <option value="<?php echo $don["idBoiss"]; ?>"><?php echo $don["designBoiss"].'-->'.$don['qnteBoiss']; ?></option>
<?php

  }
}
?>