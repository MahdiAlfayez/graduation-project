<?php

include './connect.php';

  // $email=$_POST['email'];

$email="test@outlook.com";


$sql="SELECT ID FROM `user` WHERE `email`='".$email."'  ";

$result=$conn->query($sql);

$count=mysqli_num_rows($result);

while ($row = $result->fetch_assoc()) {
     $id=$row['ID'];
}

 //echo ($id);

if($count>0){

    $number=rand(1000,9999);
    $sql="UPDATE `user`
    SET `verification-number` = '".$number."'
    WHERE `ID`='".$id."';";
    $result=$conn->query($sql);
 
    echo json_encode("sscus");

}
else{

   

  echo json_encode("not found");

}

?>