<?php

include '../connect.php';
header('Content-Type: application/json');

// hide any error
error_reporting(0);
ini_set('display_errors', 0); 

// recall data
$name = filterRequest("name");
$email = filterRequest("email");
$password = filterRequest("password");
$confirm_pass = filterRequest("confirm_pass");
$verifycode = rand(10000, 99999);

// check email is already found
$stmt = $con->prepare("SELECT * FROM users WHERE user_email = ?");
$stmt->execute(array($email));
$count = $stmt->rowCount();

if ($count > 0) {
    // return true if user already found
    echo json_encode(["status" => "error", "message" => "Email already exists"]);
} else {
    // data will be inserted
    $data = array(
        "user_name" => $name,
        "user_email" => $email,
        "user_password" => password_hash($password, PASSWORD_DEFAULT),
        "user_confirm_pass" => password_hash($confirm_pass, PASSWORD_DEFAULT),
        "user_verifycode" => $verifycode
    );

    // send verification code
    sendEmail($email, "Verify code Remote app", "Verify code is $verifycode");

    // insert data into database
    $inserted = insertData("users", $data);

    if ($inserted) {
        // incase of success inserted
      $response = ['status' => 'success', 'message' => 'Registration successful'];
      echo json_encode($response);
    } else {
      // incase of fail inserted
      echo json_encode(["status" => "error", "message" => "Failed to register user"]);
    }
}

?>
