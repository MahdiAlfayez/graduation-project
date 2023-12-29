<?php

include './connect.php';

$id=$_POST['ID'];

$sql="SELECT * FROM `user` WHERE `ID`= '".$id."' ";
$result=$conn->query($sql);
 while($row=$result->fetch_assoc()){

 $data[]=$row;

 }
 

echo json_encode(array("stutes"=>'find',"data"=>$data));
?>