<?php

include './connect.php';

$cart_id=$_POST["cart_id"];


$sql="DELETE FROM `cart` WHERE `cart_id`='".$cart_id."'";
if($cart_id!=null){



$result=$conn->query($sql);


echo json_encode("ok");
}