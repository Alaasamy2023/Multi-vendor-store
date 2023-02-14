<?php

 include "../connect.php" ; 
	
	$product_id  = $_POST['product_id'];
	$user_id  = $_POST['user_id'];
	$table  = $_POST['table'];
//like_product

$connect->query("INSERT INTO `".$table."` (`product_id`,`user_id`)VALUES 	('".$product_id."','".$user_id."')")
/*	

//http://192.168.1.8/sochial_barcode_backend/adddata.php?phone_number=1&pass=1&fullname=1&longitude=1&latitude=1&country=1&large_city=1&city=1&street=1


*/

?>