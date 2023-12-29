<?php

include './connect.php';

  $verification_number=$_POST['verificationnumber'];


$sql="SELECT user_id FROM `user` WHERE `verificationnumber`='".$verification_number."'  ";

$result=$conn->query($sql);

$count=mysqli_num_rows($result);

while ($row = $result->fetch_assoc()) {
     $id=$row['user_id'];
}

 //echo ($id);

if($count>0){

    $sql="UPDATE `user`
    SET `Verified` = 'true'
    WHERE `user_id`='".$id."';";
    $result=$conn->query($sql);
   echo json_encode("sscus");
   

}
else{

   

  echo json_encode("not found");

}

?>