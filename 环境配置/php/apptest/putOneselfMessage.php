<?php
/**
 * Created by PhpStorm.
 * User: gatsby
 * Date: 9/6/16
 * Time: 23:28
 */

/*$pic = $_POST['m_pic'];
//$file = $_FILES[$pic];//得到传输的数据
//$im = imagecreatefromstring($pic);
header('Content-Type: image/jpeg'); //对应jpeg的类型
$imageData = base64_decode($pic);
$im = imagecreatefromstring($imageData);
$angle = 0;
$rotate = imagerotate($im, $angle, 0); // if want to rotate the image
$imageName = "hello1.jpeg";
$imageSave = imagejpeg($rotate,$imageName,100);
//imagedestroy($im);
if ($im != false) {
    header('Content-Type: image/jpeg'); //对应jpeg的类型
    imagejpeg($im);////也要对应jpeg的类型
    imagedestroy($im);

    echo 'succeed turn';
    return ;
}
else {
    echo '图片未读入';
    return;
}

$name = $im;
$type = strtolower(substr($name,strrpos($name,'.')+1)); //得到文件类型，并且都转化成小写
$allow_type = array('jpg','jpeg','gif','png'); //定义允许上传的类型
//判断文件类型是否被允许上传
if(!in_array($type, $allow_type))
{
    //如果不被允许，则直接停止程序运行
    echo 'type not allow, something error.';
    return ;
}

echo 'yes';

//判断是否是通过HTTP POST上传的
if(!is_uploaded_file($file['tmp_name']))
{
    //如果不是通过HTTP POST上传的
    echo 'post was failed, something error.';
    return ;
}

$upload_path = "http://127.0.0.1/ios/picture/"; //上传文件的存放路径
//开始移动文件到相应的文件夹
if(move_uploaded_file($file['tmp_name'],$upload_path.$file['name']))
{
    echo "Successfully!";
}
else
{
    echo "Failed!";
}

*/
















$aElement[0] = $_POST['u_id'];
$aElement[2] = $_POST['m_msg'];
$aElement[3] = $_POST['m_type'];
$aElement[4] = $_POST['m_time'];
$aElement[5] = $_POST['m_relate'];
//$req = file_get_contents('php://input');
$req = json_decode($aElement[2], true);


//echo json_encode($_POST['u_id']);
require_once("connect_database.php");

//$req = file_get_contents('php://input');
//$response = array('Accepted' => 'Yes');
//header('Content-Type: application/json');
//header('Content-Type: text/html');

$descSql = "SELECT `m_id`, `uid` FROM `Message` ORDER BY `m_id` DESC limit 1";
$mix = $db->query($descSql)->fetch(PDO::FETCH_ASSOC);

$nm_id = $mix["m_id"] + 1;

//echo $nm_id;
//echo 'the req';
//echo $req["m_id"];

$insertSql = "INSERT INTO `Message` (`uid`, `m_id`, `msg`, `m_type`, `m_pic`, `relatemsg_id`, `ltime`)
                          VALUES ('$aElement[0]', '$nm_id', '$aElement[2]', '$aElement[3]', NULL, '$aElement[5]', '$aElement[4]')";
try {
    $qt_type = $db->query("set names 'utf8'");
    $qt_type = $db->query($insertSql);
    $qt_type_arr = $qt_type->fetchAll();
}
catch(PDOException $e)
{
    echo json_encode($e->getMessage());
}
//
//$arr = Array(
//    "ileave" => $req->u_id,
//    "id" => $req->m_id,
//    "ltime" => $req->m_time,
//);
//echo json_encode($arr);