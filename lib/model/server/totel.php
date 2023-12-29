<?php

include './connect.php';

$user_id=$_POST["user_id"];
 //$user_id=8;
$sql="
SELECT `cart`.`cart_id`, `item`.`item_id`,COUNT(`item`.`item_id`)AS 'quantite' ,SUM(`item`.`item_price`)AS 'sum',`item`.`item_name`,`item`.`item_image`,`item`.`item_price`,`item`.`item_catgore`,`item`.`item_catgore`,`item`.`item_stock`
FROM cart
INNER JOIN `item`
ON`cart`.`item_id`=`item`.`item_id`
WHERE user_id='".$user_id."' 
HAVING COUNT(`item`.`item_id`);";
$result=$conn->query($sql);

 while($row=$result->fetch_assoc()){

 $data[]=$row;

 }
 if($data!=null){

    echo json_encode($data);
 }
 else{

   // echo json_encode("roung");
  
 }
