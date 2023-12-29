<?php

include './connect.php';

$itemid=$_POST["item_id"];
$userid=$_POST["user_id"];
// $itemid=4;
// $userid=5;

$sql="INSERT INTO `cart`(`cart_id`, `item_id`, `user_id`, `cart_orders`) VALUES ('', '".$itemid."', '".$userid."', '0');";
if($itemid!=null){



$result=$conn->query($sql);


echo json_encode("ok");
}