<?php
$to="CubeGymsupourt@gmail.com";
$title="hi this test page";
$body="cod"."\n"."12233";
$header="From:CubeGymsupourt@gmail.com";

if(mail($to,$title,$body,$header)){

echo "send ok";
}
//mail($to,$title,$body,$header);
// echo" ok";
else{

echo "no send";

}
?>