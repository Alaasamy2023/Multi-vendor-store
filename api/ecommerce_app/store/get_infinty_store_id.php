<?php
	include '../connect.php';

///////////////////////////////////////////////
if(isset($_GET['id'])){$id=$_GET['id'];}else{$id=1;}

if(isset($_GET['store_id'])){$store_id=$_GET['store_id'];}else{$store_id=1;}
if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}
$start=$per_page * $page - $per_page ;


$sql= " (SELECT store.*
,(SELECT COUNT(follow.id) FROM follow WHERE follow.store_id=store.id AND follow.user_id={$id}) AS following
,(SELECT  ROUND(IFNULL(AVG(review_product.rate),0),1)  FROM review_product WHERE review_product.store_id=store.id ) AS avg_rate



,(SELECT catagory.title FROM catagory WHERE catagory.id=store.catagory_store_id AND catagory.active=1) AS catagory
,(SELECT COUNT(product.id) FROM product WHERE product.store_id=store.id AND product.is_active=1) AS count_prodect
,(SELECT COUNT(follow.id) FROM follow WHERE follow.store_id=store.id AND follow.active=1) AS count_follow
,(SELECT COUNT(review_product.store_id) FROM review_product WHERE review_product.store_id=store.id    AND  review_product.active = 1) AS rate_store
,(SELECT ROUND(IFNULL(AVG(review_product.rate),0),1)   FROM review_product WHERE review_product.store_id=store.id ) AS avg_rate_store



FROM `store` where store.id = {$store_id} AND store.active =1  limit {$start},{$per_page})    ";




$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);
//http://localhost/ecommerce_app/get_infinty_store.php?catagory_store_id=2

/*\




SELECT store.*
,(SELECT COUNT(follow.id) FROM follow WHERE follow.store_id=store.id AND follow.user_id=1) AS following
,(SELECT  ROUND(IFNULL(AVG(review_product.rate),0),1)  FROM review_product WHERE review_product.store_id=store.id ) AS avg_rate



,(SELECT catagory.title FROM catagory WHERE catagory.id=store.catagory_store_id AND catagory.active=1) AS catagory
,(SELECT COUNT(product.id) FROM product WHERE product.store_id=store.id AND product.is_active=1) AS count_prodect
,(SELECT COUNT(follow.id) FROM follow WHERE follow.store_id=store.id AND follow.active=1) AS count_follow
,(SELECT COUNT(review_product.store_id) FROM review_product WHERE review_product.store_id=store.id    AND  review_product.active = 1) AS rate_store
,(SELECT ROUND(IFNULL(AVG(review_product.rate),0),1)   FROM review_product WHERE review_product.store_id=store.id ) AS avg_rate_store



FROM `store` where store.id = 3 AND store.active =1




*/


?>
