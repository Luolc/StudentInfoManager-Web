<?php
/**
 * Created by PhpStorm.
 * User: LuoLiangchen
 * Date: 16/4/26
 * Time: 下午1:52
 */
@header('Content-type: text/html; charset=UTF-8');
require_once '../config/database.php';

$con = mysql_connect($db['default']['hostname'], $db['default']['username'], $db['default']['password']);
if (!$con) {
    echo '{"code": 400, "msg": "db connection error", "data": null}';
} else {
    mysql_select_db($db['default']['database'], $con);
    mysql_query("SET NAMES utf8");

    $action = $_REQUEST['action'];
    $query_str = $_REQUEST['query'];
    if ($action == 'query') {
        $qid = mysql_query($query_str);
        $ans = array();
        while ($one = mysql_fetch_assoc($qid)) {
            array_push($ans, $one);
        }
        $escape_ans = array();
        foreach ($ans as $one) {
            $escape_one = array();
            if ($one["学号"] != null) {
                $escape_one["uid"] = $one["学号"];
            }
            if ($one["姓名"] != null) {
                $escape_one["name"] = $one["姓名"];
            }
            if ($one["性别"] != null) {
                $escape_one["gender"] = $one["性别"];
            }
            if ($one["年龄"] != null) {
                $escape_one["age"] = $one["年龄"];
            }
            if ($one["课程号"] != null) {
                $escape_one["cid"] = $one["课程号"];
            }
            if ($one["课程名称"] != null) {
                $escape_one["courseName"] = $one["课程名称"];
            }
            if ($one["任课老师"] != null) {
                $escape_one["teacher"] = $one["任课老师"];
            }
            if ($one["成绩"] != null) {
                $escape_one["score"] = $one["成绩"];
            }
            array_push($escape_ans, $escape_one);
        }
        $ret['code'] = 200;
        $ret['msg'] = 'success';
        $ret['data'] = $escape_ans;
        echo json_encode($ret);
        mysql_close($con);
    } else {
        echo '{"code": 401, "msg": "no such action", "data": null}';
    }
}
