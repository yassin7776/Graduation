<?php
include '../connect.php';

header('Content-Type: application/json'); // Ensure JSON header

// hide any error
error_reporting(0);

$email = filterRequest("email");
$password = filterRequest("password");

try {
    // Check if email exists
    $stmt = $con->prepare("SELECT * FROM users WHERE user_email = ?");
    $stmt->execute(array($email));
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // Verify password
        if (password_verify($password, $user['user_password'])) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Login successful',
                'data' => [
                    'user_id' => $user['id'],
                    'user_name' => $user['user_name'],
                    'user_email' => $user['user_email']
                ]
            ]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Incorrect password']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Email does not exist']);
    }
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'Server error: ' . $e->getMessage()]);
}
?>
