<?php
// Start the session
session_start();

// Include the database connection file
include "db.php";

// Check if user is logged in
if (isset($_SESSION["uid"])) {
    // Retrieve form data
    $f_name = isset($_POST["firstname"]) ? $_POST["firstname"] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $address = isset($_POST['address']) ? $_POST['address'] : '';
    $city = isset($_POST['city']) ? $_POST['city'] : '';
    $state = isset($_POST['state']) ? $_POST['state'] : '';
    $zip = isset($_POST['zip']) ? (int)$_POST['zip'] : 0; // Cast zip to integer
    $cardname = isset($_POST['cardname']) ? $_POST['cardname'] : '';
    $cardnumber = isset($_POST['cardNumber']) ? $_POST['cardNumber'] : '';
    $expdate = isset($_POST['expdate']) ? $_POST['expdate'] : '';
    $cvv = isset($_POST['cvv']) ? (int)$_POST['cvv'] : 0; // Cast cvv to integer
    $user_id = (int)$_SESSION["uid"]; // Cast user_id to integer
    $cardnumberstr = (string)$cardnumber;
    $total_count = isset($_POST['total_count']) ? (int)$_POST['total_count'] : 0; // Cast total_count to integer
    $prod_total = isset($_POST['total_price']) ? (int)$_POST['total_price'] : 0; // Cast prod_total to integer

    // Query to get the latest order ID
    $sql0 = "SELECT MAX(order_id) AS max_val FROM orders_info";
    $run_query = pg_query($con, $sql0);

    // Check if any orders exist
    if (pg_num_rows($run_query) > 0) {
        // Fetch the latest order ID and increment it
        $row = pg_fetch_array($run_query);
        $order_id = $row["max_val"] + 1;
    } else {
        // No orders exist, set order ID to 1
        $order_id = 1;
    }

    // SQL query to insert order information into database
    $sql = "INSERT INTO orders_info (order_id, user_id, f_name, email, address, city, state, zip, cardname, cardnumber, expdate, prod_count, total_amt, cvv) VALUES ($order_id, $user_id, '$f_name', '$email', '$address', '$city', '$state', $zip, '$cardname', '$cardnumberstr', '$expdate', $total_count, $prod_total, $cvv)";

    try {
        // Execute the query to insert order information
        if (pg_query($con, $sql)) {
            // Loop through each product in the order
            for ($i = 1; $i <= $total_count; $i++) {
                // Retrieve product details from the form
                $prod_id = isset($_POST['prod_id_' . $i]) ? (int)$_POST['prod_id_' . $i] : 0; // Cast prod_id to integer
                $prod_price = isset($_POST['prod_price_' . $i]) ? (int)$_POST['prod_price_' . $i] : 0; // Cast prod_price to integer
                $prod_qty = isset($_POST['prod_qty_' . $i]) ? (int)$_POST['prod_qty_' . $i] : 0; // Cast prod_qty to integer

                // Calculate subtotal for the product
                $sub_total = $prod_price * $prod_qty;

                // SQL query to insert order product into database
                $sql1 = "INSERT INTO order_products (order_pro_id, order_id, product_id, qty, amt) VALUES (NULL, $order_id, $prod_id, $prod_qty, $sub_total)";

                // Execute the query to insert order product
                if (!pg_query($con, $sql1)) {
                    throw new Exception("Error inserting order product: " . pg_last_error($con));
                }
            }

            // Remove items from the cart after successful checkout
            if (isset($_SESSION["uid"])) {
                $sql_remove_cart = "DELETE FROM cart WHERE user_id = $user_id";
            } else {
                $ip_add = getenv("REMOTE_ADDR");
                $sql_remove_cart = "DELETE FROM cart WHERE ip_add = '$ip_add' AND user_id < 0";
            }

            if (pg_query($con, $sql_remove_cart)) {
                // Redirect to index.php after successful checkout and cart clearing
                header("Location: index.php");
                exit();
            } else {
                throw new Exception("Error removing items from cart: " . pg_last_error($con));
            }
        } else {
            throw new Exception("Error inserting order information: " . pg_last_error($con));
        }
    } catch (Exception $e) {
        // Handle exceptions and display error message
        echo "Error processing checkout: " . $e->getMessage();
    }
} else {
    // Redirect to index.php if user is not logged in
    echo "<script>window.location.href='index.php'</script>";
}