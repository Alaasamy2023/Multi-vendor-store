<?php
	include 'connect.php';
/*
هنا عملنا اكتر من جمله 
select 
بحيث كل اما يعمل اسكرول يجيله داتا مختلفه بناء على الاسكرول 
*/
///////////////////////////////////////////////
if(isset($_GET['product_id'])){$product_id=$_GET['product_id'];}else{$product_id=1;}

if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}
$start=$per_page * $page - $per_page ;


$sql= " (SELECT review_product.*
,(SELECT users.username FROM users WHERE users.id = review_product.user_id) as username

FROM `review_product`  where product_id = {$product_id}    limit {$start},{$per_page})    ";


$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);
//http://localhost/sochial_barcode%20%20%20%20backend/get_infinty_sub_catagory.php?product_id=2



?>
