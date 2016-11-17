<?php
/**
 * Created by PhpStorm.
 * User: gatsby
 * Date: 11/16/16
 * Time: 02:43
 */

$relationID = $_GET['m_relateId'];

require_once("connect_database.php");

$sql = "SELECT *FROM `Message` WHERE relatemsg_id = '$relationID'";
//$sql = "SELECT *FROM `Message` WHERE relatemsg_id = '20027'";
$messagesRaw = $db->query($sql);

$arr = array();

while (($aC = $messagesRaw->fetch(PDO::FETCH_ASSOC)) != NULL) {
    $perInfo = $db->query("select `uname` from `USER` where `uid` = '{$aC["uid"]}'")->fetch(PDO::FETCH_ASSOC);
    $aElement["u_name"] = $perInfo["uname"];
    //$aElement["user_img"] = $perInfo["u_img"];
    $aElement["m_pic"] = $aC["m_pic"];
    $aElement["m_msg"] = $aC["msg"];
    $aElement["m_time"] = $aC["ltime"];
    $aElement["m_relate"] = $aC["relatemsg_id"];
    $aElement["u_id"] = $aC["uid"];
    $aElement["m_id"] = $aC["m_id"];

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