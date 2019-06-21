<?php

    $link=mysql_connect("localhost","tick_sign_in","1987greenow"); 
    mysql_select_db("tick_sign_in", $link); //选择数据库

$code = $_POST['code'];
//用户的登录凭证code（使用wx.login({})可获取到）这个是前端传过来
$appid='wxc93c9c52e4fb030a';
$secret='2eeb1464a34c951681e13c580ea0e9d8';
$api="https://api.weixin.qq.com/sns/jscode2session?appid={$appid}&secret={$secret}&js_code={$code}&grant_type=authorization_code";
//$weixin=file_get_contents($url)这个不晓得是不是php版本问题弄不好
function getHttp($url){
    $curl = curl_init();    
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);    
    curl_setopt($curl, CURLOPT_TIMEOUT, 500);    
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); //注意ssl证书
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HEADER, false);
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($curl, CURLOPT_REFERER, $url);
    $res = curl_exec($curl);    
    curl_close($curl);    
    return $res;
}
    $infojson=getHttp($api);
    $infoarr=json_decode($infojson,true);
    $openid=$infoarr["openid"];
    echo $openid;
    //var_dump($openid);
    /*调用这个函数可以存入数据，但是没必要
function addUser(){
    global $link,$openid;
    $res = mysql_query("SELECT * FROM  user WHERE openid = '$openid'");
    $check = mysql_affected_rows();
    //如果加入过就不用加了
    if($check = 0){
       mysql_query("INSERT INTO user (openid) VALUES ('$openid')");
       mysql_close($link); 
       echo $openid='have joined';
    }
    else{
       echo $openid;
    }

}
*/

?>
