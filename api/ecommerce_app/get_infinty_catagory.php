<?php
	include 'connect.php';
/*
هنا عملنا اكتر من جمله 
select 
بحيث كل اما يعمل اسكرول يجيله داتا مختلفه بناء على الاسكرول 
*/
///////////////////////////////////////////////
if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}
$start=$per_page * $page - $per_page ;


$sql= " (SELECT * FROM `catagory`   limit {$start},{$per_page})    ";


$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);
//http://localhost/sochial_barcode%20%20%20%20backend/get_infinty_catagory.php



?>
