<?php

include './connect.php';

$sql="SELECT * FROM `categories` ";
$result=$conn->query($sql);
 while($row=$result->fetch_assoc()){

 $data[]=$row;

 }
 

echo json_encode($data);