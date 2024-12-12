<?php
$host = getenv('DB_HOST') ?: 'localhost';
$con=mysqli_connect($host, "root", "", "agmsdb");
if(mysqli_connect_errno()){
echo "Connection Fail".mysqli_connect_error();
}

  ?>