<?php

include './connect.php';

$user_id=$_POST["user_id"];
 //$user_id=8;
$sql="
SELECT SUM(`item`.`item_price`) AS totil
FROM cart
INNER JOIN `item`
ON`cart`.`item_id`=`item`.`item_id`
WHERE user_id='".$user_id."';";
$result=$conn->query($sql);

 while($row=$result->fetch_assoc()){

 $data[]=$row;

 }
 
  echo json_encode($data);

