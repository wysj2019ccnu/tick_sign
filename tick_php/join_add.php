<?php
    header("Content-Type:text/html;charset=utf8"); 
    header("Access-Control-Allow-Origin: *"); //解决跨域
    header('Access-Control-Allow-Methods:POST');// 响应类型  
    header('Access-Control-Allow-Headers:*'); // 响应头设置 
    $link=mysql_connect("localhost","tick_sign_in","1987greenow"); 
    mysql_select_db("tick_sign_in", $link); //选择数据库
    mysql_query("SET NAMES utf8");//解决中文乱码问题

    if (!$link)
      {
      die('Could not connect: ' . mysql_error());
      }

    $joinName = $_POST['joinName'];
    $joinTime = $_POST['joinTime'];
    $event_id = $_POST['event_id'];
    $joiner_id = $_POST['joiner_id'];

    if(mysql_query("INSERT INTO joins (joinName,joinTime,event_id,joiner_id) 
    VALUES ('$joinName','$joinTime','$event_id','$joiner_id')")){
    mysql_close($link); 
    echo 'success';
    }
    else{
      echo'fail';
    }


?>