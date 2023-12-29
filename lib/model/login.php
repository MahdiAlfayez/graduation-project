<?php



include './connect.php';

  $emil= $_POST=['email'];
  $password=$_POST=['password'];

$sql="SELECT * FROM `user` WHERE email=$emil AND password=$password ";


$result=$conn->query($sql);



while($row=$result->fetch_assoc()){

    $data[]=$row;
   
    }
    
   
   echo json_encode($data);
   

    
     







?>