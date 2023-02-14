<?php
	include 'connect.php';
/*
هنا عملنا اكتر من جمله 
select 
بحيث كل اما يعمل اسكرول يجيله داتا مختلفه بناء على الاسكرول 
*/
///////////////////////////////////////////////
if(isset($_GET['catagory_id'])){$catagory_id=$_GET['catagory_id'];}else{$catagory_id=1;}
if(isset($_GET['user_id'])){$user_id=$_GET['user_id'];}else{$user_id=1;}

if(isset($_GET['page'])){$page=$_GET['page'];}else{$page=1;}
if(isset($_GET['per_page'])){$per_page=$_GET['per_page'];}else{$per_page=10;}



$time = date("H:i"); 
$date=date('Y-m-d');

$start=$per_page * $page - $per_page ;



//time , date
//INSERT INTO `catagory_visit`( `user_id`, `catagory_id`, `time`, `date`) VALUES ({$user_id},{$catagory_id},{$time},{$date});


$sql= " (SELECT * FROM `sub_catagory`  where catagory_id = {$catagory_id}    limit {$start},{$per_page}) ;
INSERT INTO `catagory_visit`( `user_id`, `catagory_id`, `time`, `date` ) VALUES ({$user_id},{$catagory_id} ,'$time','$date');
";


$stmt = $con->prepare($sql);
$stmt->execute() ;
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
echo json_encode( $mobiles);
//http://localhost/ecommerce_app/get_infinty_sub_catagory.php?catagory_id=2&user_id=1



?>
