<?php
$db_username = "postgres";
$db_password = "0r5ifq1I1";
$con = pg_connect("host=localhost dbname=onlineshop user=$db_username password=$db_password");
// Check connection
if (!$con) {
    die("Connection failed: ");
}
