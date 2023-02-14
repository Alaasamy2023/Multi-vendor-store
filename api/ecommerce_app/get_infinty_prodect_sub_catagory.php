<?php
	include 'connect.php';

///////////////////////////////////////////////
if(isset($_GET['sub_catagory_id'])){$sub_catagory_id=$_GET['sub_catagory_id'];}else{$sub_catagory_id=1;}
if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}
$start=$per_page * $page - $per_page ;


$sql= " (SELECT product.*
,(SELECT photo_product.photo FROM photo_product WHERE photo_product.product_id=product.id AND photo_product.is_main_photo=1) AS main_photo

,(SELECT COUNT(like_product.id) FROM like_product WHERE like_product.product_id=product.id AND like_product.user_id=1) AS if_like
,(SELECT COUNT(save_product.id) FROM save_product WHERE save_product.product_id=product.id AND save_product.user_id=1) AS if_save
,(SELECT IFNULL(AVG(review_product.rate),0)   FROM review_product WHERE review_product.product_id=product.id ) AS avg_rate_product

,(SELECT COUNT(offer_product.id) FROM offer_product WHERE offer_product.product_id=product.id AND offer_product.active=1) AS if_offer_product
,(SELECT   IFNULL(AVG(offer_product.price_offer),0)  FROM offer_product WHERE offer_product.product_id=product.id AND offer_product.active=1) AS if_offer_nsba



FROM `product` WHERE product.is_active=1 AND  sub_catagory_id ={$sub_catagory_id}

  limit {$start},{$per_page})    ";




$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);
//http://localhost/ecommerce_app/get_infinty_prodect_sub_catagory.php?sub_catagory_id=2
/*\
SELECT store.*
,(SELECT COUNT(follow.id) FROM follow WHERE follow.store_id=store.id AND follow.user_id=1) AS following
,(SELECT AVG(review_product.rate) FROM review_product WHERE review_product.store_id=store.id ) AS avg_rate
FROM `store` where catagory_store_id =1
*/


?>
