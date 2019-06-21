

<?php
//这个php比较复杂，首先sql查询event_id，再遍历存入数组，再遍历数组获取event_id，再查询event信息遍历存入dlogs数组，要注意json格式，脑壳痛，功能实现了，有时间再过来改一改，其实自己都不知道怎么弄的，调了半天写的乱七八糟竟然成功了
    header("Content-Type:text/html;charset=utf8"); 
    header("Access-Control-Allow-Origin: *"); //解决跨域
    header('Access-Control-Allow-Methods:POST');// 响应类型  
    header('Access-Control-Allow-Headers:*'); // 响应头设置 
    header('Content-Type:application/json; charset=utf-8');
    $link=mysql_connect("localhost","tick_sign_in","1987greenow"); 
    mysql_select_db("tick_sign_in", $link); //选择数据库
    mysql_query("SET NAMES utf8");//解决中文乱码问题

    $joiner_id = $_POST['joiner_id'];
    $joins = mysql_query("SELECT event_id,join_id,joinTime,joinName FROM joins WHERE joiner_id='".$joiner_id."'ORDER BY joinTime DESC"); //获取数据集
    if(!$joins){
        die("数据库没有数据!");
    }
    $dlogs='';$i=0;
    while ($join_array = mysql_fetch_array($joins)) {
        $dlog["join_id"]=$join_array["join_id"];
        $dlog["joinTime"]=$join_array["joinTime"];
        $dlog["joinName"]=$join_array["joinName"];

    $event_id = $join_array['event_id'];
    $events = mysql_query("SELECT * FROM event WHERE event_id='".$event_id."'");
    $query = "SELECT * FROM event WHERE event_id='".$event_id."'"; //SQL查询语句 SELECT * FROM 表名
    $res = mysql_query($query); //获取数据集
    if(!$res){
        die("数据库没有数据!");
    }
    while($row=mysql_fetch_array($res))
    {
        $dlog["note"]=$row["note"];
        $dlog["event_id"]=$row["event_id"];
        $dlog["theme"]=$row["theme"];
        $dlog["time"]=$row["time"];
        $dlogs[$i++]=$dlog;
    }//循环读取数据并存入数组对象

}
    echo urldecode(json_encode($dlogs));       //以json格式返回html页面



?>