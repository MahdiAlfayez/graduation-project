<?php

include './connect.php';

$cart_id=$_POST["cart_id"];
$item_id=$_POST["item_id"];

$sql="DELETE FROM `cart` WHERE `cart_id`='".$cart_id."'AND `item_id`='".$item_id."'";
if($cart_id!=null){



$result=$conn->query($sql);


echo json_encode("ok");
}