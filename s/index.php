<?php

require 'vendor/autoload.php';
$smarty = new Smarty;

if(isset($_GET['q'])){
	$q = $_GET['q'];
}else{
	$smarty->display('hlavicka.tpl');
	$smarty->display('index.tpl');
	$smarty->display('paticka.tpl');
	exit();
}

$db = new PDO('mysql:host=127.0.0.1;port=9306;charset=utf8', '', '');

$sth = $db->prepare("SELECT url, title, content FROM vyber WHERE MATCH(:query)");

$sth->execute(array(':query' => $q));

$smarty->assign('vysledky', $sth->fetchAll(PDO::FETCH_ASSOC));

$smarty->display('hlavicka.tpl');
$smarty->display('vysledky.tpl');
$smarty->display('paticka.tpl');
