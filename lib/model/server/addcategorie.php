<?php
include './connect.php';

$name=$_POST['cat_name'];
$imagename=$_POST['imagename'];
$image64=base64_decode($_POST['image64']);

 if($name!=null){
    $sql="INSERT INTO `categories`(`cat_id`, `cat_name`, `cat_image`) VALUES ('','".$name."','".$imagename."')";
    $result=$conn->query($sql);
    file_put_contents("categories\\." .$imagename,$image64);
        
        echo json_encode("susses");
    
}
else{

    echo json_encode("feild");

}

