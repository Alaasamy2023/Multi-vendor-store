<?php
	include '../connect.php';

///////////////////////////////////////////////
//if(isset($_GET['user_id'])){$user_id=$_GET['user_id'];}else{$user_id=1;}
if(isset($_GET['prodect_id'])){$prodect_id=$_GET['prodect_id'];}else{$prodect_id=1;}
if(isset($_GET['table'])){$table=$_GET['table'];}else{$table=1;}
if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}
$start=$per_page * $page - $per_page ;


$sql= " (SELECT * FROM `{$table}` where product_id = {$prodect_id}
  limit {$start},{$per_page})    ";




$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);

/*\
description_product

http://localhost/ecommerce_app/prodect/get_infinty_prodect_part.php?prodect_id=1&table=description_product


information_product

http://localhost/ecommerce_app/prodect/get_infinty_prodect_part.php?prodect_id=1&table=information_product

photo_product

http://localhost/ecommerce_app/prodect/get_infinty_prodect_part.php?prodect_id=1&table=photo_product



questions_product

http://localhost/ecommerce_app/prodect/get_infinty_prodect_part.php?prodect_id=1&table=questions_product












  
*/


?>
