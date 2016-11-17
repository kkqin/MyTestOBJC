<?php
/**
 * Created by PhpStorm.
 * User: gatsby
 * Date: 11/14/16
 * Time: 07:10
 */

$hashTagLink = $_GET['u_hashTagLink'];

require_once("connect_database.php");

$sql = "select * from `Message` WHERE msg LIKE '%$hashTagLink%'";
$messagesRaw = $db->query($sql);

$sqlMessageRow = $db->query($sql);
$arr = array();
while (($aC = $sqlMessageRow->fetch(PDO::FETCH_ASSOC)) != NULL)
{
    $perInfo = $db->query("select `uname` from `USER` where `uid` = '{$aC["uid"]}'")->fetch(PDO::FETCH_ASSOC);
    $aElement["u_name"] = $perInfo["uname"];
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