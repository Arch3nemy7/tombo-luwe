<?php
session_start();
include "db.php";

if (isset($_SESSION["uid"])) {
    $user_id = (int)$_SESSION["uid"];
    $sql = "SELECT * FROM user_info WHERE user_id=$1";
    $query = pg_query_params($con, $sql, array($user_id));
    $user_info = pg_fetch_assoc($query);

    $f_name = isset($_POST["firstname"]) ? $_POST["firstname"] : $user_info["first_name"] . ' ' . $user_info["last_name"];
    $email = isset($_POST['email']) ? $_POST['email'] : $user_info["email"];
    $address = isset($_POST['address']) ? $_POST['address'] : $user_info["address1"];
    $city = isset($_POST['city']) ? $_POST['city'] : $user_info["address2"];
    $state = isset($_POST['state']) ? $_POST['state'] : '';
    $zip = isset($_POST['zip']) ? (int)$_POST['zip'] : 0;
    $cardname = isset($_POST['cardname']) ? $_POST['cardname'] : '';
    $cardnumber = isset($_POST['cardNumber']) ? $_POST['cardNumber'] : '';
    $cvv = isset($_POST['cvv']) ? (int)$_POST['cvv'] : 0;
    $expdate = isset($_POST['expdate']) ? $_POST['expdate'] : '';

    $total_amt = isset($_POST['total_price']) ? (int)$_POST['total_price'] : 0;
    $product_ids = isset($_POST['product_id']) ? $_POST['product_id'] : array();

    try {
        pg_query($con, "BEGIN");

        $sql_max_order_info = "SELECT COALESCE(MAX(order_id), 0) AS max_order_id FROM orders_info";
        $result_max_order_info = pg_query($con, $sql_max_order_info);
        $row_max_order_info = pg_fetch_assoc($result_max_order_info);
        $max_order_info_id = $row_max_order_info['max_order_id'];

        $sql_max_order = "SELECT COALESCE(MAX(order_id), 0) AS max_order_id FROM orders";
        $result_max_order = pg_query($con, $sql_max_order);
        $row_max_order = pg_fetch_assoc($result_max_order);
        $max_order_id = $row_max_order['max_order_id'];

        $order_info_id = max($max_order_info_id, $max_order_id) + 1;

        $sql_orders_info = "INSERT INTO orders_info (order_id, user_id, f_name, email, address, city, state, zip, cardname, cardnumber, expdate, total_amt, cvv) 
                            VALUES ($order_info_id, $user_id, '$f_name', '$email', '$address', '$city', '$state', '$zip', '$cardname', '$cardnumber', '$expdate', $total_amt, $cvv)";
        $result_orders_info = pg_query($con, $sql_orders_info);
        if (!$result_orders_info) {
            throw new Exception("Error inserting into orders_info: " . pg_last_error($con));
        }

        // Insert into `orders` (refined and corrected)
        $trx_id = 'trx_' . $order_info_id;
        $p_status = 'Pending';
        $stmt = pg_prepare($con, "insert_order", "INSERT INTO orders (order_id, user_id, product_id, qty, trx_id, p_status) 
                           VALUES ($1, $2, $3, $4, $5, $6)");

        foreach ($product_ids as $product_id) {
            $prod_count = (int)$_POST['product_qty_' . $product_id];
            $result_orders = pg_execute($con, "insert_order", array($order_info_id, $user_id, $product_id, $prod_count, $trx_id, $p_status));

            if (!$result_orders) {
                throw new Exception("Error inserting into orders: " . pg_last_error($con));
            }
        }

        $sql_remove_cart = isset($_SESSION["uid"]) ? 
            "DELETE FROM cart WHERE user_id = $1" : 
            "DELETE FROM cart WHERE ip_add = $1 AND user_id < 0";
        $params_remove_cart = isset($_SESSION["uid"]) ? array($user_id) : array(getenv("REMOTE_ADDR"));
        $result_remove_cart = pg_query_params($con, $sql_remove_cart, $params_remove_cart);
        if (!$result_remove_cart) {
            throw new Exception("Error removing items from cart: " . pg_last_error($con));
        }

        pg_query($con, "COMMIT");

        header("Location: index.php");
        exit();
    } catch (Exception $e) {
        pg_query($con, "ROLLBACK");
        echo "Error processing checkout: " . $e->getMessage(); // Print PostgreSQL error
        echo "<br>SQL: " . $sql_orders_info;
    }
} else {
    echo "<script>window.location.href='index.php'</script>";
}
?>
