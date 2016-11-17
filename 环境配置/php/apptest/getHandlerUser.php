<?php
/**
 * Created by PhpStorm.
 * User: gatsby
 * Date: 11/3/16
 * Time: 06:27
 */

$handlerLink = $_GET['u_handlerLink'];

require_once("connect_database.php");

$sql = "SELECT * FROM `User` WHERE handler_link = '$handlerLink'";

$res = $db->query($sql)->fetch(PDO::FETCH_ASSOC);

$sql = "SELECT * FROM `Message` WHERE uid = '{$res["uid"]}'";

$sqlMessageRow = $db->query($sql);
$arr = array();
while (($aC = $sqlMessageRow->fetch(PDO::FETCH_ASSOC)) != NULL)
{
    $aElement["u_name"] = $res["uname"];
    $aElement["m_pic"] = $aC["m_pic"];
    $aElement["m_msg"] = $aC["msg"];
    $aElement["m_time"] = $aC["ltime"];
    $aElement["u_id"] = $aC["uid"];

    array_push($arr, $aElement);
}

// 排序
function arrCmp($a,$b){
    if($a['m_time'] == $b['m_time']){
        return 0;
    }
    return($a['m_time']>$b['m_time']) ? -1 : 1;
}

usort($arr, "arrCmp");

echo json_encode($arr);