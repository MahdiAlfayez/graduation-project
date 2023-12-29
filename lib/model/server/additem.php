<?php
include './connect.php';

$name=$_POST['name'];
$price=$_POST['price'];
$stock=$_POST['stock'];
$description=$_POST['description'];
$category=$_POST['category'];
$cat_id=$_POST['cat_id'];
$imagename=$_POST['imagename'];
$image64=base64_decode($_POST['image64']);

 if($name!=null){
    $sql="INSERT INTO `item`(`item_id`, `item_price`, `item_image`, `item_catgore`, `item_description`, `item_stock`, `item_name`, `item_cat`) VALUES ('','".$price."','".$imagename."','".$category."','".$description."','".$stock."','".$name."','".$cat_id."')";

    $result=$conn->query($sql);
    file_put_contents("item\\." .$imagename,$image64);
        
        echo json_encode("susses");
    
}

