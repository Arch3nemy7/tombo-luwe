<?php
$db_username = "postgres";
$db_password = "";
$con = pg_connect("host=localhost dbname=onlineshop user=$db_username password=$db_password");
// Check connection
if (!$con) {
    die("Connection failed: ");
}
