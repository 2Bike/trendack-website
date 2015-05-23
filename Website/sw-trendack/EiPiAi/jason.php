<?php

require_once 'db_connect.php';
    
$database = new DB_Provider();
$database->connect();


if (isset($_GET['country'])){
    
    $result_json = mysql_query("SELECT `trend` FROM `trends` WHERE `id` = (SELECT `trend_1` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_2` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_3` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_4` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_5` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_6` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_7` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_8` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_9` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1) OR `id` = (SELECT `trend_10` FROM `stream` WHERE `woeid` IN (SELECT woeid FROM locations WHERE name='" . $_GET['country'] . "') ORDER BY `date` DESC LIMIT 1)");
      
}

if (isset($_GET['trend'])){
    
    $result_json = mysql_query("SELECT `text` FROM `tweets` WHERE `trend_id` IN (SELECT `id` FROM `trends` WHERE `trend`='" . $_GET['trend'] . "')");
      
}


$rows = array();
while($r = mysql_fetch_assoc($result_json)) {
    $rows[] = $r;          
}
		
echo json_encode($rows);

    
?>
