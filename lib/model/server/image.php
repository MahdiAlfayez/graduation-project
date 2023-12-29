<?php
include './connect.php';
$imagename=$_POST['imagename'];
$image64=base64_decode($_POST['image64']);
$id=$_POST['ID'];
$sql="UPDATE `user` SET `user_image`='".$imagename."' WHERE `user_id`= '".$id."'";

$result=$conn->query($sql);

file_put_contents("uplod\\." .$imagename,$image64);




 
  
   
    
    echo json_encode("susses");









?>