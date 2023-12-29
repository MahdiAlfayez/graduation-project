<?php

include './connect.php';

   $email=$_POST['email'];

//$email="test@outlook.com";


$sql="SELECT user_id FROM `user` WHERE `user_email`='".$email."'  ";

$result=$conn->query($sql);

$count=mysqli_num_rows($result);

while ($row = $result->fetch_assoc()) {
     $id=$row['user_id'];
}

 //echo ($id);

if($count>0){

    $number=rand(1000,9999);
    $sql="UPDATE `user`
    SET `verificationnumber` = '".$number."'
    WHERE `user_id`='".$id."';";
    $result=$conn->query($sql);
   echo json_encode("sscus");
   

}
else{

   

  echo json_encode("not found");

}

?>