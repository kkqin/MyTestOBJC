<?php
/**
 * Created by PhpStorm.
 * User: gatsby
 * Date: 11/12/16
 * Time: 14:39
 */

require_once("connect_database.php");

$sql = "select * from `Message`";
$messagesRaw = $db->query($sql);

//SELECT status, COUNT(*) AS popularity FROM status_updates WHERE status LIKE '#%' GROUP BY status ORDER BY popularity
