<?php
/**
 * Created by PhpStorm.
 * User: caizhili
 * Date: 16/1/19
 * Time: 下午2:30
 */

require_once("connect_database.php");

$sql = "select * from `Message`";

$messagesRaw = $db->query($sql);

//$messages = $messagesRaw->fetchAll(PDO::FETCH_ASSOC);

$arr = array();

while (($aC = $messagesRaw->fetch(PDO::FETCH_ASSOC)) != NULL) {
    //$perInfo = $db->query("select `u_Name`, `u_img` from `USER` where `u_ID` = '{$aC["u_ID"]}'")->fetch(PDO::FETCH_ASSOC);

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