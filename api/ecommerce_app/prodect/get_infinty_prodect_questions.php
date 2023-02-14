<?php
	include '../connect.php';

///////////////////////////////////////////////
if(isset($_GET['product_id'])){$product_id=$_GET['product_id'];}else{$product_id=1;}
if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}
$start=$per_page * $page - $per_page ;


$sql= " (SELECT questions_product.*
,(SELECT users.username FROM users WHERE users.id = questions_product.user_id AND questions_product.active =1) AS username

FROM `questions_product`
WHERE questions_product.active =1 AND questions_product.product_id = {$product_id}

  limit {$start},{$per_page})    ";




$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);
//http://localhost/ecommerce_app/prodect/get_infinty_prodect_questions.php?product_id=2

/*\











 String? id;
  String? storeId;
  String? catagoryId;
  String? subCatagoryId;
  String? title;
  String? subTitle;
  String? brand;
  String? price;
  String? date;
  String? time;
  String? isActive;
  String? offer;
  String? shippingTime;
  String? mainPhoto;
  String? ifLike;
  String? ifSave;
  String? avgRateProduct;
  String? ifOfferProduct;
  String? ifOfferNsba;
  
  
  .................................................................................
  
  
  
  
  SELECT product.*
,(SELECT photo_product.photo FROM photo_product WHERE photo_product.product_id=product.id AND photo_product.is_main_photo=1) AS main_photo

,(SELECT store.id FROM store WHERE store.id=product.store_id ) AS store_id
,(SELECT store.store_name FROM store WHERE store.id=product.store_id ) AS store_name
,(SELECT store.store_photo FROM store WHERE store.id=product.store_id ) AS store_photo

,(SELECT store.store_photo FROM store WHERE store.id=product.store_id ) AS store_photo


,(SELECT  ROUND(IFNULL(AVG(review_product.rate),0),1)  FROM review_product WHERE review_product.store_id=product.store_id ) AS store_rate

,(SELECT COUNT(orders.id) FROM orders WHERE orders.product_id=product.id AND orders.user_id=1 AND orders.active =1 ) AS if_orders

,(SELECT COUNT(like_product.id) FROM like_product WHERE like_product.product_id=product.id AND like_product.user_id=1) AS if_like
,(SELECT COUNT(save_product.id) FROM save_product WHERE save_product.product_id=product.id AND save_product.user_id=1) AS if_save
,(SELECT ROUND(IFNULL(AVG(review_product.rate),0),1)   FROM review_product WHERE review_product.product_id=product.id ) AS avg_rate_product
,(SELECT COUNT(review_product.id) FROM review_product WHERE review_product.product_id=product.id AND review_product.user_id=1  AND  review_product.active = 1) AS COUNT_rate_product

,(SELECT COUNT(offer_product.id) FROM offer_product WHERE offer_product.product_id=product.id AND offer_product.active=1) AS if_offer_product
,(SELECT   IFNULL(AVG(offer_product.price_offer),0)  FROM offer_product WHERE offer_product.product_id=product.id AND offer_product.active=1) AS if_offer_nsba



FROM `product`
*/


?>
