<?php
	include 'connect.php';

///////////////////////////////////////////////
if(isset($_GET['catagory_store_id'])){$catagory_store_id=$_GET['catagory_store_id'];}else{$catagory_store_id=1;}
if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}
$start=$per_page * $page - $per_page ;


$sql= " (SELECT store.*
,(SELECT COUNT(follow.id) FROM follow WHERE follow.store_id=store.id AND follow.user_id=1) AS following
,(SELECT  ROUND(IFNULL(AVG(review_product.rate),0),1)  FROM review_product WHERE review_product.store_id=store.id ) AS avg_rate
FROM `store` where catagory_store_id = {$catagory_store_id}  limit {$start},{$per_page})    ";




$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);
//http://localhost/ecommerce_app/get_infinty_store.php?catagory_store_id=2

/*\
SELECT store.*
,(SELECT COUNT(follow.id) FROM follow WHERE follow.store_id=store.id AND follow.user_id=1) AS following
,(SELECT AVG(review_product.rate) FROM review_product WHERE review_product.store_id=store.id ) AS avg_rate
FROM `store` where catagory_store_id =1
*/


?>
