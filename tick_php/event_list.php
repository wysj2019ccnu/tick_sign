<?php
    header("Content-Type:text/html;charset=utf8"); 
    header("Access-Control-Allow-Origin: *"); //解决跨域
    header('Access-Control-Allow-Methods:POST');// 响应类型  
    header('Access-Control-Allow-Headers:*'); // 响应头设置 
    $link=mysql_connect("localhost","tick_sign_in","1987greenow"); 
    mysql_select_db("tick_sign_in", $link); //选择数据库
    mysql_query("SET NAMES utf8");//解决中文乱码问题

    $admin_id = $_POST['admin_id'];
    $query = "SELECT * FROM event WHERE admin_id='".$admin_id."'ORDER BY time DESC"; //SQL查询语句 SELECT * FROM 表名
    $res = mysql_query($query); //获取数据集
    if(!$res){
        die("数据库没有数据!");
    }

    //循环读取数据并存入数组对象
    $dlogs='';$i=0;
    while($row=mysql_fetch_array($res))
    {
        $dlog["note"]=$row["note"];
        $dlog["event_id"]=$row["event_id"];
        $dlog["theme"]=$row["theme"];
        $dlog["time"]=$row["time"];  
        $dlog["fromTime"]=$row["fromTime"];
        $dlogs[$i++]=$dlog;
    }

    //以json格式返回html页面
    echo urldecode(json_encode($dlogs));
?>