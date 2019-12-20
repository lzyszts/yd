<?php
namespace app\server;
use think\Db;
/**
 * Http处理类
 */

class Http
{	

    /**
     * curl方法
     * @param  [type]  $url   [url地址]
     * @param  string  $method [方法默认get]
     * @param  boolean $https  [是否https,默认是]
     * @param  [type]  $data   [post请求携带参数]
     * @param  [type]  $cookie [cookie参数]
     * @param  [type]  $header [header参数]
     * @return [type]          [description]
     * $url,$method='get',$https=true,$data=null,$cookie=null,$header=null
     */
    public static function _request($params = []){
        $ch = curl_init();//初始化
        curl_setopt($ch, CURLOPT_URL, $params['url']);//设置访问的URL
        if($params['header'])
        {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $params['header']);//设置头信息
        }else{
            curl_setopt($ch, CURLOPT_HEADER, false);//设置不需要头信息
        }
        if($params['https']){
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//不做服务器认证
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);//不做客户端认证
        }
        if($params['cookie'])
        {
            curl_setopt($ch,CURLOPT_COOKIE,$params['cookie']);
        }
        if($params['method'] == "post"){
            curl_setopt($ch, CURLOPT_POST, true);//设置请求是POST方式
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params['data']);//设置POST请求的数据
        }
        curl_setopt($ch, CURLOPT_TIMEOUT, 3);  //设置超时时间为3秒
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);//只获取页面内容，但不输出
        $str = curl_exec($ch);//执行访问，返回结果
        //调试
        $info = curl_getinfo($ch);
        curl_close($ch);//关闭curl，释放资源
        return $str;
    }

    /**
     * 数据转为utf-8并且json转数组
     * @Author   lzy
     * @DateTime 2019-08-26
     * @param    array      $params [description]
     * @return   [type]             [description]
     */
    public static function parse($data){
        // 返回的编码
        $encode = mb_detect_encoding($data, array("ASCII",'UTF-8',"GB2312","GBK",'BIG5'));
        $data = iconv($encode, "utf-8",$data);
        $data = json_decode($data,true);
        return $data;
    }



    //测试方法
    public static function post($url,$data){

        //$data = http_build_query($data);
        // var_dump($data);exit;
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false); // 对认证证书来源的检查  
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST, false); // 
        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_POSTFIELDS,$data);
        $return = curl_exec($ch);
        curl_close($ch);
        return $return;
    }


}

