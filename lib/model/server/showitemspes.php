<?php

include './connect.php';
$id=$_POST["cat_id"];
$sql="SELECT * FROM `item` WHERE `item_cat`='".$id."' ";
$result=$conn->query($sql);
 while($row=$result->fetch_assoc()){

 $data[]=$row;

 }
 
if($data!=null){

    echo json_encode($data);
}
else{

    echo json_encode("null");
    
   }
