<?php
include './connect.php';

$username=$_POST['username'];
$phonernumber=$_POST['phonenumber'];
$emil=$_POST['emil'];
 $password=$_POST['password'];
//  $username="mahdi";
//  $phonernumber="0552371030";
//  $emil="test@outloo.com";
//  $password="123";
 $verificationnumber=rand(1000,9999);

$sql="SELECT * FROM `user` WHERE `user_email`='".$emil."' AND `user_password`='".$password."' ";
//$sql="SELECT * FROM `user` WHERE `email`='test@outlook.com' AND `password`='123' ";

$result=$conn->query($sql);
$count=mysqli_num_rows($result);


if($count>0){

   echo json_encode("find");
   

}
else if($username and $password !=null){

    $sql="INSERT INTO `user`
    VALUES ('','".$username."', '".$phonernumber."', '".$emil."','".$password."','coustomer','".$verificationnumber."','false','".null."');";

    $result=$conn->query($sql);

  echo json_encode("not found");

}
else{
echo json_encode("null");

}

?>