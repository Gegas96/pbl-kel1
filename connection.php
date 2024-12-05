<?php
$serverName = "TIMS"; 

$connectionInfo = array( "Database"=>"bebas_tanggungan");


// $connectionInfo = array( "Database"=>"bebas_tanggungan");
$conn = sqlsrv_connect( $serverName, $connectionInfo);
