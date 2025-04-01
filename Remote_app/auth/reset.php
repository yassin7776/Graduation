<?php

include '../connect.php';
header('Content-Type: application/json');

// hide any error
error_reporting(0);

# email & verification code from the client sid
$email=filterRequest("email");
$verify=filterRequest("verifycode");

#check if email & verify code is valid in the database
$stmt = $con->prepare("SELECT * FROM users WHERE user_email =$email");

$stmt->execute();
$count=$stmt->rowCount();

if($count>0){
  # if valid, approve user in the database from 0 to 1
  $data=array("user_approve"=>"1");
  updateData("users",$data,"user_email='$email'",);
}
else{
  print_failure("Invalid email");
}

?>