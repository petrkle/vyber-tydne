<?php

require 'vendor/autoload.php';
$smarty = new Smarty;
$smarty->assign('envelope', getenvelope());

if(isset($_GET['q'])){
	$q = $_GET['q'];
}else{
	$smarty->display('index.tpl');
	exit();
}

try {
	$db = new PDO('mysql:host=127.0.0.1;port=9306;charset=utf8', '', '');
} catch (PDOException $e) {
	$smarty->assign('chyba', 'Dočasně mimo provoz');
	$smarty->display('error.tpl');
	exit();
}

if(strlen($q)<3){
	$smarty->assign('chyba', 'Zadejte prosím delší hledaný výraz.');
	$smarty->display('error.tpl');
	exit();
}

$sth = $db->prepare("SELECT url, title, content FROM vyber WHERE MATCH(:query)");

$sth->execute(array(':query' => $q));

$vysledky = $sth->fetchAll(PDO::FETCH_ASSOC);

if(count($vysledky) == 0){
	$smarty->assign('chyba', 'Nic nenalezeno :-(');
	$smarty->display('error.tpl');
}else{
	$smarty->assign('vysledky', $vysledky);
	$smarty->display('vysledky.tpl');
}


function getenvelope(){
	$html = file_get_contents('/home/www/vyber-tydne.kle.cz/build/index.html');
	$hlavicka = preg_replace('/(.*<\/h1>).*/', '\1', $html);
	$paticka = preg_replace('/.*(<div class=paticka.*)/', '\1', $html);
	return(array('hlavicka' => $hlavicka, 'paticka' => $paticka));
}
