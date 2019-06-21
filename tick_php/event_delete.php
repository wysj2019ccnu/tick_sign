<?php
    header("Content-Type:text/html;charset=utf8"); 
    header("Access-Control-Allow-Origin: *"); //解决跨域
    header('Access-Control-Allow-Methods:POST');// 响应类型  
    header('Access-Control-Allow-Headers:*'); // 响应头设置 
    $link=mysql_connect("localhost","tick_sign_in","1987greenow"); 
    mysql_select_db("tick_sign_in", $link); //选择数据库
    mysql_query("SET NAMES utf8");//解决中文乱码问题


    if (!$link){
      die('Could not connect: ' . mysql_error());
      }

    $event_id = $_POST['event_id'];
    //echo $event_id.'<br>',
    //由于主键约束，顺序要注意
    mysql_query("DELETE FROM joins WHERE event_id=".$event_id);
    mysql_query("DELETE FROM event WHERE event_id=".$event_id);

    $check=mysql_affected_rows();

    mysql_close($link); 
    //var_dump($check);

    if($check!=0){
        echo 'true';  //受影响行数不等于零说明删除成功
    }
    else{
        echo 'false';
    }

    
?>