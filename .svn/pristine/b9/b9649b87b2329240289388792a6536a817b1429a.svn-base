<?php
namespace app\server;
use think\Db;
/**
 * 日志处理类
 */
class Log
{	

    /**
     * 插入日志
     * @param [type] $code [提示代码]
     * @param [type] $msg  [提示信息]
     */
    public static function addLog($code,$msg){
        $admin=session('admin');
        //防止未登录没有username
        empty($admin)?$username="未登录用户":$username=$admin['username'];
        $log=[
            'code' =>$code,
            'username' =>$username,
            'info' =>'提示信息：'.$msg,
            'add_time' =>time(),
            'ip' =>request()->ip(),
            'get' =>request()->url(),
        ];
        db('admin_log')->insert($log);
    }

     /**
     * 前台用户日志
     * @param [type] $code [提示代码]
     * @param [type] $msg  [提示信息]
     */
    public static function addUserLog($code,$msg){
        $user=session('user');
        //防止未登录没有username
        empty($user)?$username="未登录用户":$username=$user['username'];
        $log=[
            'code' =>$code,
            'username' =>$username,
            'info' =>'提示信息：'.$msg,
            'add_time' =>time(),
            'ip' =>request()->ip(),
            'get' =>request()->url(),
        ];
        db('user_log')->insert($log);
    }


}
