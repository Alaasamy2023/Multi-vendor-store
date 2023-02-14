<?php

$connect = new mysqli("localhost","root","","ecommerce_app");

if($connect){
	 
}else{
	echo "Fallo, revise ip o firewall";
	exit();
}




$dsn = "mysql:host=localhost;dbname=ecommerce_app" ;
$user = "root" ;
$pass = "" ;
$option = array(
PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8");
try {
$con = new PDO($dsn , $user , $pass , $option);
$con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e) {echo $e->getMessage() ;}


