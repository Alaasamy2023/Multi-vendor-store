<?php

 include "../connect.php" ; 
	
	$user_id  = $_POST['user_id'];
	$store_id  = $_POST['store_id'];
	$table  = $_POST['table'];
//follow

$connect->query("INSERT INTO `".$table."` (`user_id`,`store_id`)VALUES 	('".$user_id."','".$store_id."')")
/*	

//http://192.168.1.8/sochial_barcode_backend/adddata.php?phone_number=1&pass=1&fullname=1&longitude=1&latitude=1&country=1&large_city=1&city=1&street=1


*/

?>