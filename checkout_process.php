<?php
session_start();
include "db.php";

if (isset($_SESSION["uid"])) {

    $f_name = $_POST["firstname"];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $zip = $_POST['zip'];
    $cardname = $_POST['cardname'];
    $cardnumber = $_POST['cardNumber'];
    $expdate = $_POST['expdate'];
    $cvv = $_POST['cvv'];
    $user_id = $_SESSION["uid"];
    $cardnumberstr = (string)$cardnumber;
    $total_count = $_POST['total_count'];
    $prod_total = $_POST['total_price'];

    $sql0 = "SELECT order_id from orders_info";
    $runquery = pg_query($con, $sql0);
    if (pg_num_rows($runquery) == 1) {
        echo (pg_error($con));
        $order_id = 1;
    } else if (pg_num_rows($runquery) > 0) {
        $sql2 = "SELECT MAX(order_id) AS max_val from orders_info";
        $runquery1 = pg_query($con, $sql2);
        $row = pg_fetch_array($runquery1);
        $order_id = $row["max_val"];
        $order_id = $order_id + 1;
        echo (pg_error($con));
    }

    $sql = "INSERT INTO orders_info (order_id, user_id, f_name, email, address, city, state, zip, cardname, cardnumber, expdate, prod_count, total_amt, cvv) VALUES ($order_id, '$user_id', '$f_name', '$email', '$address', '$city', '$state', '$zip', '$cardname', '$cardnumberstr', '$expdate', '$total_count', '$prod_total', '$cvv')";

    try {
        if (pg_query($con, $sql)) {
            $i = 1;

            while ($i <= $total_count) {
                // ** Fix: Directly assign values from the form for each product**
                $prod_id = $_POST['prod_id_' . $i];
                $prod_price = $_POST['prod_price_' . $i];
                $prod_qty = $_POST['prod_qty_' . $i];

                $sub_total = (int)$prod_price * (int)$prod_qty;
                $sql1 = "INSERT INTO order_products 
              (order_pro_id,order_id,product_id,qty,amt) 
              VALUES (NULL, '$order_id', '$prod_id', '$prod_qty', '$sub_total')";
                if (!pg_query($con, $sql1)) {
                    throw new Exception("Error inserting order product: " . pg_last_error($con));
                }

                $i++;
            }
        } else {
            throw new Exception("Error inserting order information: " . pg_last_error($con));
        }
    } catch (Exception $e) {
        echo "Error processing checkout: " . $e->getMessage();
        // Additional logging or error handling here (e.g., send notification to admin)
    }
} else {
    echo "<script>window.location.href='index.php'</script>";
}
