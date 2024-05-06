<?php
include "db.php";

session_start();

// Login Script

// Check if email and password are provided in the POST request
if (isset($_POST["email"]) && isset($_POST["password"])) {

  $email = pg_escape_string($con, $_POST["email"]); // Escape email for security
  $password = $_POST["password"];

  // Build the query to select user from database
  $sql = "SELECT * FROM user_info WHERE email = '$email' AND password = '$password'";

  // Execute the query and store the result
  $run_query = pg_query($con, $sql);

  // Count the number of rows returned (indicates successful match)
  $count = pg_num_rows($run_query);

  // Fetch the user data if a match is found
  $row = pg_fetch_array($run_query);

  // Store user ID and name in session variables
  $_SESSION["uid"] = $row["user_id"];
  $_SESSION["name"] = $row["first_name"];

  $ip_add = getenv("REMOTE_ADDR");

  // Handle user cart items if a product list cookie exists
  if (isset($_COOKIE["product_list"])) {
    $p_list = stripcslashes($_COOKIE["product_list"]);
    $product_list = json_decode($p_list, true);

    // Loop through each product in the cookie list
    for ($i = 0; $i < count($product_list); $i++) {
      $verify_cart = "SELECT id FROM cart WHERE user_id = $_SESSION[uid] AND p_id = " . $product_list[$i];
      $result = pg_query($con, $verify_cart);

      // Check if the product already exists in the user's cart
      if (pg_num_rows($result) < 1) {
        // Update cart table with user ID if it's a new product
        $update_cart = "UPDATE cart SET user_id = '$_SESSION[uid]' WHERE ip_add = '$ip_add' AND user_id = -1";
        pg_query($con, $update_cart);
      } else {
        // Delete existing record if the product is already in the cart
        $delete_existing_product = "DELETE FROM cart WHERE user_id = -1 AND ip_add = '$ip_add' AND p_id = " . $product_list[$i];
        pg_query($con, $delete_existing_product);
      }
    }

    // Destroy the product list cookie
    setcookie("product_list", "", strtotime("-1 day"), "/");
  }

  // Login successful - respond with appropriate message

  if ($count == 1) {
    // User login from cart page
    if (isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'], 'cart.php') !== false) {
      echo "cart_login";
    } else {
      // User login from other page
      echo "login_success";
      $BackToMyPage = $_SERVER['HTTP_REFERER'];
      if (!isset($BackToMyPage)) {
        header('Location: ' . $BackToMyPage);
      }
    }
  } else {
    // Check for admin login

    $email = pg_escape_string($con, $_POST["email"]);
    $password = md5($_POST["password"]); // Hash password for security
    $sql = "SELECT * FROM admin_info WHERE admin_email = '$email' AND admin_password='$password'";
    $run_query = pg_query($con, $sql);
    $count = pg_num_rows($run_query);

    if ($count == 1) {
      $row = pg_fetch_array($run_query);
      $_SESSION["uid"] = $row["admin_id"];
      $_SESSION["name"] = $row["admin_name"];

      echo "login_success";
      echo "<script> location.href='admin/addproduct.php'; </script>";
    } else {
      echo "<span style='color:red;'>Please signup before login..!</span>";
    }
  }

  exit(); // Exit script after processing
}
