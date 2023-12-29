<?php
include './connect.php';

$emil=$_POST['emil'];
 $password=$_POST['password'];
//  $username="mahdi";
 // $phonernumber="0552371030";
 //$emil="test@outlook.com";
//  $emil='0552371030';
//   $password="123";
 $verificationnumber=rand(1000,9999);

$sql="SELECT * FROM `user` WHERE `user_email`='".$emil."'OR phonenumber='".$emil."'AND user_password='".$password."'";
//$sql="SELECT * FROM `user` WHERE `email`='test@outlook.com' AND `password`='123' ";

$result=$conn->query($sql);
$count=mysqli_num_rows($result);
while($row=$result->fetch_assoc()){

    $data[]=$row;
   
    }

if($count>0){
    if($data[0]['Verified']=='false'){
echo json_encode(array("stutes"=>"nottrue"));

  }
  else{

    echo json_encode(array("stutes"=>"find","data"=>$data));
  }
   

}
else if($count==0){

    echo json_encode(array("stutes"=>'not found'));
}
else{


}

?>