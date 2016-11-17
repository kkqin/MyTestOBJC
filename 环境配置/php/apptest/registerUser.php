<?php
/**
 * Created by PhpStorm.
 * User: gatsby
 * Date: 9/7/16
 * Time: 15:24
 */

$req = $_POST['u_id'];
$req = json_decode($req, true);

require_once ("connect_database.php");

$insertSql = "INSERT INTO `User` (`uid`, `uname`, `register_date`, `last_active`) 
                    VALUES ('$req->u_id', '$req->u_name', '$req->register_date', '$req->u_last_active_date');";

try {
    $qt_type = $db->query("set names 'utf8'");
    $qt_type = $db->query($insertSql);
    $qt_type_arr = $qt_type->fetchAll();
}
catch(PDOException $e)
{
    echo json_encode($e->getMessage());
}

