<?php

include './connect.php';

$sql="SELECT * FROM `prodect` ";
$result=$conn->query($sql);
 while($row=$result->fetch_assoc()){

 $data[]=$row;

 }
 

echo json_encode($data);